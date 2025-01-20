@interface BKSTerminationAssertion
- (BKSTerminationAssertion)initWithBundleIdentifier:(id)a3 efficacy:(unint64_t)a4 name:(id)a5 context:(id)a6 withHandler:(id)a7;
- (BKSTerminationAssertion)initWithBundleIdentifier:(id)a3 efficacy:(unint64_t)a4 name:(id)a5 withHandler:(id)a6;
- (BKSTerminationContext)context;
- (BOOL)acquire;
- (NSString)targetBundleIdentifier;
- (unint64_t)_bksErrorForRBSRequestError:(unint64_t)a3;
- (unint64_t)efficacy;
- (void)invalidate;
@end

@implementation BKSTerminationAssertion

- (unint64_t)_bksErrorForRBSRequestError:(unint64_t)a3
{
  if (a3 - 1 > 8) {
    return 0;
  }
  else {
    return qword_1B50BEAA0[a3 - 1];
  }
}

- (BKSTerminationAssertion)initWithBundleIdentifier:(id)a3 efficacy:(unint64_t)a4 name:(id)a5 withHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = +[BKSTerminationContext terminationAssertionContext];
  v14 = [(BKSTerminationAssertion *)self initWithBundleIdentifier:v12 efficacy:a4 name:v11 context:v13 withHandler:v10];

  return v14;
}

- (BKSTerminationAssertion)initWithBundleIdentifier:(id)a3 efficacy:(unint64_t)a4 name:(id)a5 context:(id)a6 withHandler:(id)a7
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)BKSTerminationAssertion;
  v14 = [(BKSAssertion *)&v25 _initWithName:a5 handler:a7];
  if (v14)
  {
    uint64_t v15 = [v12 copy];
    bundleIdentifier = v14->_bundleIdentifier;
    v14->_bundleIdentifier = (NSString *)v15;

    v14->_efficacy = a4;
    uint64_t v17 = [v13 copy];
    context = v14->_context;
    v14->_context = (BKSTerminationContext *)v17;

    v19 = [MEMORY[0x1E4F96478] systemTarget];
    [(BKSAssertion *)v14 _setTarget:v19];

    v20 = (void *)MEMORY[0x1E4F963C0];
    v21 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:v12];
    v22 = [v20 limitationWithPredicate:v21];
    v26[0] = v22;
    v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
    [(BKSAssertion *)v14 _setAttributes:v23];

    [(BKSAssertion *)v14 _acquireAsynchronously];
  }

  return v14;
}

- (BOOL)acquire
{
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy_;
  v16 = __Block_byref_object_dispose_;
  id v17 = 0;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x3032000000;
  v10[3] = __Block_byref_object_copy__49;
  v10[4] = __Block_byref_object_dispose__50;
  id v11 = 0;
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__BKSTerminationAssertion_acquire__block_invoke;
  v5[3] = &unk_1E60C6670;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = v10;
  v5[7] = &v12;
  [(BKSAssertion *)self _lock:v5];
  if (v13[5])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __34__BKSTerminationAssertion_acquire__block_invoke_2;
    v4[3] = &unk_1E60C6698;
    v4[4] = &v12;
    v4[5] = &v6;
    v4[6] = v10;
    [MEMORY[0x1E4F964A0] performBackgroundWork:v4];
  }
  char v2 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  _Block_object_dispose(v10, 8);

  _Block_object_dispose(&v12, 8);
  return v2;
}

void __34__BKSTerminationAssertion_acquire__block_invoke(uint64_t a1)
{
  char v2 = [MEMORY[0x1E4F96408] identityForEmbeddedApplicationIdentifier:*(void *)(*(void *)(a1 + 32) + 64) jobLabel:*(void *)(*(void *)(a1 + 32) + 64) auid:getuid() platform:6];
  id v3 = objc_alloc_init(MEMORY[0x1E4F96488]);
  objc_msgSend(v3, "setExceptionCode:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 80), "exceptionCode"));
  v4 = objc_msgSend(*(id *)(a1 + 32), "_lock_name");
  [v3 setExplanation:v4];

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 72);
  if (v5 == 2) {
    unsigned int v6 = 30;
  }
  else {
    unsigned int v6 = 20;
  }
  if (v5 == 3) {
    uint64_t v7 = 40;
  }
  else {
    uint64_t v7 = v6;
  }
  [v3 setMaximumTerminationResistance:v7];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F96490]) initWithProcessIdentity:v2 context:v3];
  id v23 = 0;
  id v24 = 0;
  char v9 = [v8 execute:&v24 error:&v23];
  id v10 = v24;
  id v11 = v23;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v9;
  objc_msgSend(*(id *)(a1 + 32), "_lock_setInternalAssertion:", v10);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) && v10)
  {
    uint64_t v12 = [v11 domain];
    if ([v12 isEqualToString:*MEMORY[0x1E4F964C8]])
    {
      uint64_t v13 = [v11 code];

      if (v13 == 3) {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      }
    }
    else
    {
    }
  }
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = objc_msgSend(*(id *)(a1 + 32), "_bksErrorForRBSRequestError:", objc_msgSend(v11, "code"));
    v16 = [v11 userInfo];
    uint64_t v17 = [v14 errorWithDomain:@"BKSAssertionError" code:v15 userInfo:v16];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;
  }
  uint64_t v20 = objc_msgSend(*(id *)(a1 + 32), "_lock_acquisitionHandler");
  uint64_t v21 = *(void *)(*(void *)(a1 + 56) + 8);
  v22 = *(void **)(v21 + 40);
  *(void *)(v21 + 40) = v20;
}

uint64_t __34__BKSTerminationAssertion_acquire__block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(*(void *)(a1[4] + 8) + 40) + 16))(*(void *)(*(void *)(a1[4] + 8) + 40), *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)invalidate
{
}

- (unint64_t)efficacy
{
  return self->_efficacy;
}

- (NSString)targetBundleIdentifier
{
  return self->_bundleIdentifier;
}

- (BKSTerminationContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end