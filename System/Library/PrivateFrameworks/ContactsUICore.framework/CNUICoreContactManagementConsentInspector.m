@interface CNUICoreContactManagementConsentInspector
+ (unint64_t)contactManagementConsentStateFromSTContactManagementState:(int64_t)a3;
- (CNSchedulerProvider)schedulerProvider;
- (CNUICoreContactManagementConsentInspector)init;
- (CNUICoreContactManagementConsentInspector)initWithManagementState:(id)a3 schedulerProvider:(id)a4;
- (STManagementState)managementState;
- (id)contactManagementConsentStateFutureForDSID:(id)a3;
- (unint64_t)contactManagementConsentStateOfDelegateWithInfo:(id)a3;
@end

@implementation CNUICoreContactManagementConsentInspector

- (CNUICoreContactManagementConsentInspector)init
{
  id v3 = objc_alloc_init(getSTManagementStateClass());
  v4 = [MEMORY[0x263F33668] defaultProvider];
  v5 = [(CNUICoreContactManagementConsentInspector *)self initWithManagementState:v3 schedulerProvider:v4];

  return v5;
}

- (CNUICoreContactManagementConsentInspector)initWithManagementState:(id)a3 schedulerProvider:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNUICoreContactManagementConsentInspector;
  v9 = [(CNUICoreContactManagementConsentInspector *)&v13 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_managementState, a3);
    objc_storeStrong((id *)&v10->_schedulerProvider, a4);
    v11 = v10;
  }

  return v10;
}

- (unint64_t)contactManagementConsentStateOfDelegateWithInfo:(id)a3
{
  if (!a3) {
    return 0;
  }
  v4 = [a3 dsid];
  v5 = [(CNUICoreContactManagementConsentInspector *)self contactManagementConsentStateFutureForDSID:v4];
  v6 = [v5 result:0];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

- (id)contactManagementConsentStateFutureForDSID:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F33630];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  unint64_t v7 = [(CNUICoreContactManagementConsentInspector *)self managementState];
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  objc_super v13 = __88__CNUICoreContactManagementConsentInspector_contactManagementConsentStateFutureForDSID___block_invoke;
  v14 = &unk_264019378;
  id v15 = v6;
  v16 = self;
  id v8 = v6;
  [v7 contactManagementStateForDSID:v5 completionHandler:&v11];

  v9 = objc_msgSend(v8, "future", v11, v12, v13, v14);

  return v9;
}

void __88__CNUICoreContactManagementConsentInspector_contactManagementConsentStateFutureForDSID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    v4 = *(void **)(a1 + 32);
    [v4 finishWithResult:&unk_26BFD9B38];
  }
  else
  {
    uint64_t v5 = [(id)objc_opt_class() contactManagementConsentStateFromSTContactManagementState:a2];
    id v6 = *(void **)(a1 + 32);
    id v7 = [NSNumber numberWithUnsignedInteger:v5];
    [v6 finishWithResult:v7];
  }
}

+ (unint64_t)contactManagementConsentStateFromSTContactManagementState:(int64_t)a3
{
  if ((unint64_t)a3 > 2) {
    return 0;
  }
  else {
    return qword_20B7DB688[a3];
  }
}

- (STManagementState)managementState
{
  return self->_managementState;
}

- (CNSchedulerProvider)schedulerProvider
{
  return self->_schedulerProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_schedulerProvider, 0);
  objc_storeStrong((id *)&self->_managementState, 0);
}

@end