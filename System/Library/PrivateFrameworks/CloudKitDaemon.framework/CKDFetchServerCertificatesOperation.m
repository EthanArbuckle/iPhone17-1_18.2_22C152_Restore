@interface CKDFetchServerCertificatesOperation
+ (id)nameForState:(unint64_t)a3;
- (BOOL)makeStateTransition;
- (BOOL)shouldCheckAppVersion;
- (NSArray)validatedTrusts;
- (id)activityCreate;
- (void)fetchServerCertificates;
- (void)main;
- (void)setValidatedTrusts:(id)a3;
@end

@implementation CKDFetchServerCertificatesOperation

- (id)activityCreate
{
  os_activity_t v2 = _os_activity_create(&dword_1C4CFF000, "daemon/server-certificates", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  return v2;
}

- (BOOL)shouldCheckAppVersion
{
  return 0;
}

- (BOOL)makeStateTransition
{
  uint64_t v4 = objc_msgSend_state(self, a2, v2);
  if (v4 == 2)
  {
    objc_msgSend_setState_(self, v5, 0xFFFFFFFFLL);
    v10 = objc_msgSend_error(self, v8, v9);
    objc_msgSend_finishWithError_(self, v11, (uint64_t)v10);
  }
  else if (v4 == 1)
  {
    objc_msgSend_setState_(self, v5, 2);
    objc_msgSend_fetchServerCertificates(self, v6, v7);
  }
  return 1;
}

+ (id)nameForState:(unint64_t)a3
{
  if (a3 == 2)
  {
    v5 = @"Fetching Server Certificates";
  }
  else
  {
    uint64_t v8 = v3;
    uint64_t v9 = v4;
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___CKDFetchServerCertificatesOperation;
    objc_msgSendSuper2(&v7, sel_nameForState_);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)fetchServerCertificates
{
  uint64_t v4 = objc_msgSend_stateTransitionGroup(self, a2, v2);
  dispatch_group_enter(v4);

  ApplePinned = (const void *)SecPolicyCreateApplePinned();
  v6 = [CKDFetchServerCertificatesURLRequest alloc];
  uint64_t v8 = objc_msgSend_initWithOperation_verifyWithPolicy_(v6, v7, (uint64_t)self, ApplePinned);
  if (ApplePinned) {
    CFRelease(ApplePinned);
  }
  objc_initWeak(&location, v8);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1C5049808;
  v15[3] = &unk_1E64F01E8;
  objc_copyWeak(&v16, &location);
  v15[4] = self;
  objc_msgSend_setCompletionBlock_(v8, v9, (uint64_t)v15);
  objc_msgSend_setRequest_(self, v10, (uint64_t)v8);
  v13 = objc_msgSend_container(self, v11, v12);
  objc_msgSend_performRequest_(v13, v14, (uint64_t)v8);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (void)main
{
}

- (NSArray)validatedTrusts
{
  return self->_validatedTrusts;
}

- (void)setValidatedTrusts:(id)a3
{
}

- (void).cxx_destruct
{
}

@end