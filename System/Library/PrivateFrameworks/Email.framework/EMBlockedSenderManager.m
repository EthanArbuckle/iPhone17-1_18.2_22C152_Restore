@interface EMBlockedSenderManager
+ (BOOL)shouldMoveToTrashForMailboxType:(int64_t)a3;
+ (BOOL)shouldPromptForBlockedSender;
+ (void)setPromptForBlockedSender:(BOOL)a3;
- (BOOL)_isEmailAddressBlocked:(id)a3;
- (BOOL)areAnyEmailAddressesBlocked:(id)a3;
- (BOOL)isBlockedSenderEnabled;
- (BOOL)isContactBlocked:(id)a3;
- (BOOL)isEmailAddressBlocked:(id)a3;
- (BOOL)isMoveToTrashEnabled;
- (BOOL)isTokenAddressIsBlocked:(id)a3;
- (EFLocked)blockedSenderCache;
- (EFScheduler)notificationScheduler;
- (EMBlockedSenderManager)init;
- (NSSet)blockedSenderEmailAddresses;
- (void)_locked_repopulateBlockedSenderCachedState:(id)a3;
- (void)_postBlockedSenderListDidChangeNotificationBasedOnBlockedSenderEnabledState;
- (void)_removeObserversIfNeeded;
- (void)_unblockPhoneNumber:(id)a3;
- (void)blockContact:(id)a3;
- (void)blockEmailAddress:(id)a3;
- (void)blockEmailAddresses:(id)a3;
- (void)blockTokenAddress:(id)a3;
- (void)dealloc;
- (void)setBlockedSenderCache:(id)a3;
- (void)setBlockedSenderEnabled:(BOOL)a3;
- (void)setMoveToTrashEnabled:(BOOL)a3;
- (void)setNotificationScheduler:(id)a3;
- (void)test_tearDown;
- (void)unblockContact:(id)a3;
- (void)unblockEmailAddress:(id)a3;
- (void)unblockEmailAddresses:(id)a3;
- (void)unblockTokenAddress:(id)a3;
@end

@implementation EMBlockedSenderManager

void __53__EMBlockedSenderManager_blockedSenderEmailAddresses__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (([v7 valid] & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "_locked_repopulateBlockedSenderCachedState:", v7);
  }
  v3 = [v7 blockedSenders];
  uint64_t v4 = [v3 copy];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

uint64_t __54__EMBlockedSenderManager_areAnyEmailAddressesBlocked___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 emailAddressValue];
  uint64_t v4 = [v3 simpleAddress];

  if (v4) {
    uint64_t v5 = [*(id *)(a1 + 32) containsObject:v4];
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)areAnyEmailAddressesBlocked:(id)a3
{
  id v4 = a3;
  if ([(EMBlockedSenderManager *)self isBlockedSenderEnabled])
  {
    uint64_t v5 = [(EMBlockedSenderManager *)self blockedSenderEmailAddresses];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __54__EMBlockedSenderManager_areAnyEmailAddressesBlocked___block_invoke;
    v9[3] = &unk_1E63E2A40;
    id v10 = v5;
    id v6 = v5;
    char v7 = objc_msgSend(v4, "ef_any:", v9);
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isBlockedSenderEnabled
{
  if (!objc_msgSend(MEMORY[0x1E4F1CB18], "em_defaultExistsForKey:", @"BlockedSenderEnabled")) {
    return 1;
  }
  v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  char v3 = [v2 BOOLForKey:@"BlockedSenderEnabled"];

  return v3;
}

- (NSSet)blockedSenderEmailAddresses
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  char v3 = [(EMBlockedSenderManager *)self blockedSenderCache];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__EMBlockedSenderManager_blockedSenderEmailAddresses__block_invoke;
  v6[3] = &unk_1E63E29A0;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performWhileLocked:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSSet *)v4;
}

- (EFLocked)blockedSenderCache
{
  return self->_blockedSenderCache;
}

- (EMBlockedSenderManager)init
{
  v13.receiver = self;
  v13.super_class = (Class)EMBlockedSenderManager;
  v2 = [(EMBlockedSenderManager *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.BlockedSenderManager.notification"];
    notificationScheduler = v2->_notificationScheduler;
    v2->_notificationScheduler = (EFScheduler *)v3;

    v2->_didRemoveObservers._Value = 0;
    id v5 = objc_alloc(MEMORY[0x1E4F60DA0]);
    id v6 = objc_alloc_init(_EMBlockedSenderState);
    uint64_t v7 = [v5 initWithObject:v6];
    blockedSenderCache = v2->_blockedSenderCache;
    v2->_blockedSenderCache = (EFLocked *)v7;

    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v2 selector:sel__blockedSenderListDidChange_ name:*MEMORY[0x1E4F59E40] object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)_blockedSenderOptionsDidChange, @"com.apple.mail.EMBlockedSenderOptionsDidChangeNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v11 = (const void *)CMFItemCreateWithEmailAddress();
    if (v11)
    {
      CMFBlockListIsItemBlocked();
      CFRelease(v11);
    }
  }
  return v2;
}

- (void)dealloc
{
  [(EMBlockedSenderManager *)self _removeObserversIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)EMBlockedSenderManager;
  [(EMBlockedSenderManager *)&v3 dealloc];
}

- (void)test_tearDown
{
  if ((EFIsRunningUnitTests() & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"EMBlockedSenderManager.m", 87, @"%s can only be called from unit tests", "-[EMBlockedSenderManager test_tearDown]");
  }
  [(EMBlockedSenderManager *)self _removeObserversIfNeeded];
  id v4 = [(EMBlockedSenderManager *)self notificationScheduler];
  [v4 performSyncBlock:&__block_literal_global_2];
}

- (void)_removeObserversIfNeeded
{
  if ((atomic_exchange(&self->_didRemoveObservers._Value, 1u) & 1) == 0)
  {
    objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x1E4F59E40] object:0];

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.mail.EMBlockedSenderOptionsDidChangeNotification", 0);
  }
}

uint64_t __54__EMBlockedSenderManager__blockedSenderListDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_locked_repopulateBlockedSenderCachedState:", a2);
}

- (void)_locked_repopulateBlockedSenderCachedState:(id)a3
{
  id v4 = a3;
  CFTypeRef v17 = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  CMFBlockListCopyItemsForAllServicesService();
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v6 = (id)0xAAAAAAAAAAAAAAAALL;
  for (unint64_t i = 0; i < [v6 count]; ++i)
  {
    [v6 objectAtIndex:i];
    if (CMFItemGetType() == 1)
    {
      CFTypeRef cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
      CMFItemCopyEmailAddress();
      objc_msgSend(v5, "addObject:");
      CFRelease((CFTypeRef)0xAAAAAAAAAAAAAAAALL);
    }
  }
  CFRelease(v17);

  if ([v4 valid]) {
    [v4 blockedSenders];
  }
  else {
  v8 = [MEMORY[0x1E4F1CAD0] set];
  }
  [v4 setBlockedSenders:v5];
  [v4 setValid:1];
  uint64_t v9 = [(EMBlockedSenderManager *)self notificationScheduler];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__EMBlockedSenderManager__locked_repopulateBlockedSenderCachedState___block_invoke;
  v12[3] = &unk_1E63E2848;
  id v10 = v5;
  id v13 = v10;
  id v11 = v8;
  id v14 = v11;
  v15 = self;
  [v9 performBlock:v12];
}

void __69__EMBlockedSenderManager__locked_repopulateBlockedSenderCachedState___block_invoke(uint64_t a1)
{
  v10[4] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 32;
  objc_super v3 = objc_msgSend(*(id *)(a1 + 32), "ef_setByRemovingObjectsFromSet:", *(void *)(a1 + 40));
  id v4 = objc_msgSend(*(id *)(v2 + 8), "ef_setByRemovingObjectsFromSet:", *(void *)v2);
  uint64_t v5 = *(void *)(a1 + 32);
  v9[0] = @"EMBlockedSenderManagerBlockedSendersKey";
  v9[1] = @"EMBlockedSenderManagerAddedBlockedSendersKey";
  v10[0] = v5;
  v10[1] = v3;
  v10[2] = v4;
  v9[2] = @"EMBlockedSenderManagerRemovedBlockedSendersKey";
  v9[3] = @"EMBlockedSenderManagerIsBlockedSenderEnabledKey";
  id v6 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 48), "isBlockedSenderEnabled"));
  v10[3] = v6;
  uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:4];

  v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v8 postNotificationName:@"EMBlockedSenderManagerBlockedListDidChangeNotification" object:*(void *)(a1 + 48) userInfo:v7];
}

- (void)_postBlockedSenderListDidChangeNotificationBasedOnBlockedSenderEnabledState
{
  objc_super v3 = [(EMBlockedSenderManager *)self notificationScheduler];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __101__EMBlockedSenderManager__postBlockedSenderListDidChangeNotificationBasedOnBlockedSenderEnabledState__block_invoke;
  v4[3] = &unk_1E63E26B0;
  v4[4] = self;
  [v3 performBlock:v4];
}

void __101__EMBlockedSenderManager__postBlockedSenderListDidChangeNotificationBasedOnBlockedSenderEnabledState__block_invoke(uint64_t a1)
{
  v9[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) isBlockedSenderEnabled];
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 32) blockedSenderEmailAddresses];
  }
  else
  {
    uint64_t v3 = objc_opt_new();
  }
  id v4 = (void *)v3;
  v8[0] = @"EMBlockedSenderManagerBlockedSendersKey";
  v8[1] = @"EMBlockedSenderManagerIsBlockedSenderEnabledKey";
  v9[0] = v3;
  uint64_t v5 = [NSNumber numberWithBool:v2];
  v9[1] = v5;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:2];

  uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v7 postNotificationName:@"EMBlockedSenderManagerBlockedListDidChangeNotification" object:*(void *)(a1 + 32) userInfo:v6];
}

- (void)setMoveToTrashEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = [NSNumber numberWithInteger:v3];
  [v5 setValue:v4 forKey:@"BlockedSenderAction"];
}

- (BOOL)isMoveToTrashEnabled
{
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  BOOL v3 = [v2 valueForKey:@"BlockedSenderAction"];

  objc_opt_class();
  BOOL v4 = (objc_opt_isKindOfClass() & 1) == 0 || [v3 integerValue] == 1;

  return v4;
}

- (void)setBlockedSenderEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  [v5 setBool:v3 forKey:@"BlockedSenderEnabled"];

  [(EMBlockedSenderManager *)self _postBlockedSenderListDidChangeNotificationBasedOnBlockedSenderEnabledState];
}

- (BOOL)isEmailAddressBlocked:(id)a3
{
  id v4 = a3;
  if ([(EMBlockedSenderManager *)self isBlockedSenderEnabled])
  {
    id v5 = [MEMORY[0x1E4F605B0] rawAddressFromFullAddress:v4];
    BOOL v6 = [(EMBlockedSenderManager *)self _isEmailAddressBlocked:v5];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)blockContact:(id)a3
{
}

- (void)unblockContact:(id)a3
{
}

- (BOOL)isContactBlocked:(id)a3
{
  id v4 = [a3 emailAddresses];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__EMBlockedSenderManager_isContactBlocked___block_invoke;
  v6[3] = &unk_1E63E29F0;
  v6[4] = self;
  LOBYTE(self) = objc_msgSend(v4, "ef_any:", v6);

  return (char)self;
}

uint64_t __43__EMBlockedSenderManager_isContactBlocked___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = [a2 value];
  uint64_t v4 = [v2 isEmailAddressBlocked:v3];

  return v4;
}

- (void)blockEmailAddress:(id)a3
{
  id v4 = a3;
  BOOL v3 = (const void *)CMFItemCreateWithEmailAddress();
  CMFBlockListAddItemForAllServices();
  if (v3) {
    CFRelease(v3);
  }
}

- (void)unblockEmailAddress:(id)a3
{
  id v4 = a3;
  BOOL v3 = (const void *)CMFItemCreateWithEmailAddress();
  CMFBlockListRemoveItemFromAllServices();
  if (v3) {
    CFRelease(v3);
  }
}

- (void)blockEmailAddresses:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = objc_msgSend(MEMORY[0x1E4F605B0], "rawAddressFromFullAddress:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        [(EMBlockedSenderManager *)self blockEmailAddress:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)unblockEmailAddresses:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = a3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = objc_msgSend(MEMORY[0x1E4F605B0], "rawAddressFromFullAddress:", *(void *)(*((void *)&v9 + 1) + 8 * v7), (void)v9);
        [(EMBlockedSenderManager *)self unblockEmailAddress:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (BOOL)isTokenAddressIsBlocked:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 contact];

  if (v5)
  {
    uint64_t v6 = [v4 contact];
    BOOL v7 = [(EMBlockedSenderManager *)self isContactBlocked:v6];
  }
  else
  {
    uint64_t v6 = [v4 currentRawAddress];
    BOOL v7 = [(EMBlockedSenderManager *)self isEmailAddressBlocked:v6];
  }
  BOOL v8 = v7;

  return v8;
}

- (void)blockTokenAddress:(id)a3
{
  id v6 = a3;
  id v4 = [v6 contact];

  if (v4)
  {
    uint64_t v5 = [v6 contact];
    [(EMBlockedSenderManager *)self blockContact:v5];
  }
  else
  {
    uint64_t v5 = [v6 currentRawAddress];
    [(EMBlockedSenderManager *)self blockEmailAddress:v5];
  }
}

- (void)unblockTokenAddress:(id)a3
{
  id v6 = a3;
  id v4 = [v6 contact];

  if (v4)
  {
    uint64_t v5 = [v6 contact];
    [(EMBlockedSenderManager *)self unblockContact:v5];
  }
  else
  {
    uint64_t v5 = [v6 currentRawAddress];
    [(EMBlockedSenderManager *)self unblockEmailAddress:v5];
  }
}

- (BOOL)_isEmailAddressBlocked:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  uint64_t v5 = [(EMBlockedSenderManager *)self blockedSenderCache];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __49__EMBlockedSenderManager__isEmailAddressBlocked___block_invoke;
  v8[3] = &unk_1E63E2A18;
  v8[4] = self;
  long long v10 = &v11;
  id v6 = v4;
  id v9 = v6;
  [v5 performWhileLocked:v8];

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);

  return (char)v4;
}

void __49__EMBlockedSenderManager__isEmailAddressBlocked___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (([v4 valid] & 1) == 0) {
    objc_msgSend(*(id *)(a1 + 32), "_locked_repopulateBlockedSenderCachedState:", v4);
  }
  BOOL v3 = [v4 blockedSenders];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 containsObject:*(void *)(a1 + 40)];
}

- (void)_unblockPhoneNumber:(id)a3
{
  id v4 = [a3 formattedInternationalStringValue];
  CMFItemFromString = (const void *)CreateCMFItemFromString();
  if (CMFItemFromString)
  {
    CMFBlockListRemoveItemFromAllServices();
    CFRelease(CMFItemFromString);
  }
}

+ (BOOL)shouldPromptForBlockedSender
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v3 = [v2 objectForKey:@"EMPromptUserForBlockedSenderKey"];

  if (v3) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

+ (void)setPromptForBlockedSender:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v4 = [NSNumber numberWithBool:v3];
  [v5 setObject:v4 forKey:@"EMPromptUserForBlockedSenderKey"];
}

+ (BOOL)shouldMoveToTrashForMailboxType:(int64_t)a3
{
  return (unint64_t)(a3 - 7) < 0xFFFFFFFFFFFFFFFCLL;
}

- (void)setBlockedSenderCache:(id)a3
{
}

- (EFScheduler)notificationScheduler
{
  return self->_notificationScheduler;
}

- (void)setNotificationScheduler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationScheduler, 0);
  objc_storeStrong((id *)&self->_blockedSenderCache, 0);
}

@end