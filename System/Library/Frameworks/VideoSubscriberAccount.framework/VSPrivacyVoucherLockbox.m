@interface VSPrivacyVoucherLockbox
+ (id)getVouchersFromSelectedAppDescriptions:(id)a3 forProviderID:(id)a4;
- (NSArray)unredeemedVouchers;
- (NSUndoManager)undoManager;
- (VSPrivacyVoucherLockbox)init;
- (VSRemoteNotifier)remoteNotifier;
- (id)_voucherArchiveURL;
- (void)issueVouchers:(id)a3;
- (void)issueVouchersForAppDescriptions:(id)a3 providerID:(id)a4;
- (void)issueVouchersForApps:(id)a3 providerID:(id)a4;
- (void)redeemVoucher:(id)a3;
- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4;
- (void)removeAllVouchers;
- (void)setRemoteNotifier:(id)a3;
- (void)setUndoManager:(id)a3;
- (void)setUnredeemedVouchers:(id)a3;
- (void)unredeemedVouchers;
@end

@implementation VSPrivacyVoucherLockbox

- (VSPrivacyVoucherLockbox)init
{
  v6.receiver = self;
  v6.super_class = (Class)VSPrivacyVoucherLockbox;
  v2 = [(VSPrivacyVoucherLockbox *)&v6 init];
  if (v2)
  {
    v3 = [[VSRemoteNotifier alloc] initWithNotificationName:@"VSPrivacyConsentVouchersDidChangeNotification"];
    remoteNotifier = v2->_remoteNotifier;
    v2->_remoteNotifier = v3;

    [(VSRemoteNotifier *)v2->_remoteNotifier setDelegate:v2];
  }
  return v2;
}

- (void)remoteNotifier:(id)a3 didReceiveRemoteNotificationWithUserInfo:(id)a4
{
  [(VSPrivacyVoucherLockbox *)self willChangeValueForKey:@"unredeemedVouchers", a4];

  [(VSPrivacyVoucherLockbox *)self didChangeValueForKey:@"unredeemedVouchers"];
}

- (void)issueVouchersForApps:(id)a3 providerID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(VSPrivacyVoucherLockbox *)self removeAllVouchers];
  v8 = [v7 nonChannelApps];
  if ([v7 hasUserChannelList]) {
    [v7 subscribedApps];
  }
  else {
  v9 = [v7 availableApps];
  }

  id v10 = [v8 arrayByAddingObjectsFromArray:v9];

  [(VSPrivacyVoucherLockbox *)self issueVouchersForAppDescriptions:v10 providerID:v6];
}

- (void)issueVouchersForAppDescriptions:(id)a3 providerID:(id)a4
{
  id v5 = +[VSPrivacyVoucherLockbox getVouchersFromSelectedAppDescriptions:a3 forProviderID:a4];
  [(VSPrivacyVoucherLockbox *)self issueVouchers:v5];
}

- (void)issueVouchers:(id)a3
{
  id v4 = a3;
  id v5 = [(VSPrivacyVoucherLockbox *)self unredeemedVouchers];
  id v6 = (id)[v5 mutableCopy];

  [v6 addObjectsFromArray:v4];
  [(VSPrivacyVoucherLockbox *)self setUnredeemedVouchers:v6];
}

- (void)redeemVoucher:(id)a3
{
  id v4 = a3;
  id v5 = [(VSPrivacyVoucherLockbox *)self mutableArrayValueForKey:@"unredeemedVouchers"];
  [v5 removeObject:v4];
}

- (id)_voucherArchiveURL
{
  v2 = +[VSPersistentStorage defaultStorageDirectoryURL];
  v3 = [v2 URLByAppendingPathComponent:@"VSPrivacyConsentVouchers.data"];

  if (!v3) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [[VSPersistentStorage defaultStorageDirectoryURL] URLByAppendingPathComponent:@\"VSPrivacyConsentVouchers.data\"] parameter must not be nil."];
  }
  id v4 = +[VSPersistentStorage defaultStorageDirectoryURL];
  id v5 = [v4 URLByAppendingPathComponent:@"VSPrivacyConsentVouchers.data"];

  return v5;
}

- (void)setUnredeemedVouchers:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v4;
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Setting unredeemed vouchers: %@", buf, 0xCu);
  }

  id v6 = [(VSPrivacyVoucherLockbox *)self undoManager];
  if (v6)
  {
    id v7 = [(VSPrivacyVoucherLockbox *)self unredeemedVouchers];
    v8 = [v6 prepareWithInvocationTarget:self];
    [v8 setUnredeemedVouchers:v7];
  }
  v9 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  id v10 = [(VSPrivacyVoucherLockbox *)self _voucherArchiveURL];
  id v21 = 0;
  char v11 = [v9 writeToURL:v10 options:0 error:&v21];
  id v12 = v21;

  if ((v11 & 1) == 0)
  {
    v13 = VSErrorLogObject();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[VSPrivacyVoucherLockbox setUnredeemedVouchers:]((uint64_t)v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  v20 = [(VSPrivacyVoucherLockbox *)self remoteNotifier];
  [v20 postNotification];
}

- (NSArray)unredeemedVouchers
{
  v37[2] = *MEMORY[0x1E4F143B8];
  v2 = [(VSPrivacyVoucherLockbox *)self _voucherArchiveURL];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v4 = [v2 path];
  int v5 = [v3 fileExistsAtPath:v4];

  if (v5)
  {
    id v36 = 0;
    id v6 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2 options:0 error:&v36];
    id v7 = v36;
    if (v6)
    {
      v8 = v6;
      id v35 = 0;
      v9 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v8 error:&v35];
      id v10 = v35;
      char v11 = v10;
      if (v9)
      {
        id v33 = v10;
        id v12 = v9;
        [v12 setDecodingFailurePolicy:1];
        v13 = (void *)MEMORY[0x1E4F1CAD0];
        v37[0] = objc_opt_class();
        v37[1] = objc_opt_class();
        uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:2];
        uint64_t v15 = [v13 setWithArray:v14];

        uint64_t v16 = [v12 decodeObjectOfClasses:v15 forKey:*MEMORY[0x1E4F284E8]];
        uint64_t v17 = v16;
        if (v16)
        {
          id v18 = v16;
        }
        else
        {
          v31 = VSErrorLogObject();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
            -[VSPrivacyVoucherLockbox unredeemedVouchers](v31);
          }

          id v18 = (id)MEMORY[0x1E4F1CBF0];
        }

        char v11 = v33;
      }
      else
      {
        id v12 = VSErrorLogObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          [(VSPrivacyVoucherLockbox *)(uint64_t)v11 unredeemedVouchers];
        }
        id v18 = (id)MEMORY[0x1E4F1CBF0];
      }
    }
    else
    {
      v8 = VSErrorLogObject();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        [(VSPrivacyVoucherLockbox *)(uint64_t)v7 unredeemedVouchers];
      }
      id v18 = (id)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    id v7 = VSDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA674000, v7, OS_LOG_TYPE_DEFAULT, "No vouchers file exists.", buf, 2u);
    }
    id v18 = (id)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v18;
}

- (void)removeAllVouchers
{
}

+ (id)getVouchersFromSelectedAppDescriptions:(id)a3 forProviderID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v14 = [v13 adamID];
        uint64_t v15 = [v14 stringValue];

        if (v15)
        {
          if ([v13 appType] == 2) {
            goto LABEL_12;
          }
          uint64_t v16 = [[VSPrivacyConsentVoucher alloc] initWithAppAdamID:v15 providerID:v6];
          [v7 addObject:v16];
        }
        else
        {
          VSErrorLogObject();
          uint64_t v16 = (VSPrivacyConsentVoucher *)objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(&v16->super, OS_LOG_TYPE_ERROR)) {
            +[VSPrivacyVoucherLockbox getVouchersFromSelectedAppDescriptions:&v23 forProviderID:&v16->super];
          }
        }

LABEL_12:
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v10);
  }

  return v7;
}

- (NSUndoManager)undoManager
{
  return self->_undoManager;
}

- (void)setUndoManager:(id)a3
{
}

- (VSRemoteNotifier)remoteNotifier
{
  return self->_remoteNotifier;
}

- (void)setRemoteNotifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteNotifier, 0);

  objc_storeStrong((id *)&self->_undoManager, 0);
}

- (void)setUnredeemedVouchers:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)unredeemedVouchers
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA674000, log, OS_LOG_TYPE_ERROR, "Unable to decode vouchers.", v1, 2u);
}

+ (void)getVouchersFromSelectedAppDescriptions:(void *)a3 forProviderID:(NSObject *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, NSObject *a4)
{
  id v7 = [a2 displayName];
  *(_DWORD *)a1 = 138412290;
  *a3 = v7;
  _os_log_error_impl(&dword_1DA674000, a4, OS_LOG_TYPE_ERROR, "Could not create voucher for %@, missing adamID", a1, 0xCu);
}

@end