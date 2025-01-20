@interface CRKASMRosterUpdater
- (CRKASMRosterUpdater)initWithRequirements:(id)a3;
- (CRKClassKitRosterRequirements)requirements;
- (id)courseWithIdentifier:(id)a3 inRoster:(id)a4;
- (id)errorWrappingCompletionForCompletion:(id)a3 selectorName:(id)a4;
- (id)objectIDForCourseWithIdentifier:(id)a3 inRoster:(id)a4 error:(id *)a5;
- (void)createClassOperationDidFinish:(id)a3 completion:(id)a4;
- (void)createClassWithProperties:(id)a3 completion:(id)a4;
- (void)removeCourseWithIdentifier:(id)a3 roster:(id)a4 completion:(id)a5;
- (void)removeOperationDidFinish:(id)a3 completion:(id)a4;
- (void)updateClassOperationDidFinish:(id)a3 completion:(id)a4;
- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 roster:(id)a5 completion:(id)a6;
@end

@implementation CRKASMRosterUpdater

- (CRKASMRosterUpdater)initWithRequirements:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CRKASMRosterUpdater;
  v6 = [(CRKASMRosterUpdater *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_requirements, a3);
  }

  return v7;
}

- (void)createClassWithProperties:(id)a3 completion:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  objc_super v9 = NSStringFromSelector(a2);
  id v15 = [(CRKASMRosterUpdater *)self errorWrappingCompletionForCompletion:v7 selectorName:v9];

  v10 = [CRKCreateASMClassOperation alloc];
  v11 = [(CRKASMRosterUpdater *)self requirements];
  v12 = [(CRKCreateASMClassOperation *)v10 initWithProperties:v8 requirements:v11];

  v13 = (void *)MEMORY[0x22A620AF0](v15);
  [(CRKCreateASMClassOperation *)v12 addTarget:self selector:sel_createClassOperationDidFinish_completion_ forOperationEvents:6 userInfo:v13];

  v14 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
  [v14 addOperation:v12];
}

- (void)createClassOperationDidFinish:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 error];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)updateCourseWithIdentifier:(id)a3 properties:(id)a4 roster:(id)a5 completion:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  id v15 = NSStringFromSelector(a2);
  v16 = [(CRKASMRosterUpdater *)self errorWrappingCompletionForCompletion:v12 selectorName:v15];

  id v24 = 0;
  v17 = [(CRKASMRosterUpdater *)self objectIDForCourseWithIdentifier:v14 inRoster:v13 error:&v24];

  id v18 = v24;
  if (v17)
  {
    v19 = [CRKUpdateASMClassOperation alloc];
    v20 = [(CRKASMRosterUpdater *)self requirements];
    v21 = [(CRKUpdateASMClassOperation *)v19 initWithObjectID:v17 properties:v11 requirements:v20];

    v22 = (void *)MEMORY[0x22A620AF0](v16);
    [(CRKUpdateASMClassOperation *)v21 addTarget:self selector:sel_updateClassOperationDidFinish_completion_ forOperationEvents:6 userInfo:v22];

    v23 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
    [v23 addOperation:v21];
  }
  else
  {
    ((void (**)(void, id))v16)[2](v16, v18);
  }
}

- (void)updateClassOperationDidFinish:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 error];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (void)removeCourseWithIdentifier:(id)a3 roster:(id)a4 completion:(id)a5
{
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = NSStringFromSelector(a2);
  v19 = [(CRKASMRosterUpdater *)self errorWrappingCompletionForCompletion:v9 selectorName:v12];

  id v13 = [(CRKASMRosterUpdater *)self objectIDForCourseWithIdentifier:v11 inRoster:v10 error:0];

  if (v13)
  {
    id v14 = [CRKRemoveASMClassOperation alloc];
    id v15 = [(CRKASMRosterUpdater *)self requirements];
    v16 = [(CRKRemoveASMClassOperation *)v14 initWithObjectID:v13 requirements:v15];

    v17 = (void *)MEMORY[0x22A620AF0](v19);
    [(CRKRemoveASMClassOperation *)v16 addTarget:self selector:sel_removeOperationDidFinish_completion_ forOperationEvents:6 userInfo:v17];

    id v18 = objc_msgSend(MEMORY[0x263F39C90], "crk_backgroundQueue");
    [v18 addOperation:v16];
  }
  else
  {
    v19[2](v19, 0);
  }
}

- (void)removeOperationDidFinish:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [a3 error];
  (*((void (**)(id, id))a4 + 2))(v6, v7);
}

- (id)objectIDForCourseWithIdentifier:(id)a3 inRoster:(id)a4 error:(id *)a5
{
  v25[1] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [(CRKASMRosterUpdater *)self courseWithIdentifier:v8 inRoster:a4];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v18 = [MEMORY[0x263F08690] currentHandler];
      v19 = [NSString stringWithUTF8String:"-[CRKASMRosterUpdater objectIDForCourseWithIdentifier:inRoster:error:]"];
      v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      [v18 handleFailureInFunction:v19, @"CRKASMRosterUpdater.m", 140, @"expected %@, got %@", v21, v23 file lineNumber description];
    }
    id v12 = [v11 backingClassObjectID];
  }
  else
  {
    if (a5)
    {
      id v24 = @"kCRKItemNameErrorKey";
      uint64_t v13 = [v8 stringValue];
      id v14 = (void *)v13;
      id v15 = @"courseIdentifier.stringValue";
      if (v13) {
        id v15 = (__CFString *)v13;
      }
      v25[0] = v15;
      v16 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
      CRKErrorWithCodeAndUserInfo(12, v16);
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v12 = 0;
  }

  return v12;
}

- (id)courseWithIdentifier:(id)a3 inRoster:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v5 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = objc_msgSend(a4, "courses", 0);
  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v11 = [v10 identifier];
        char v12 = [v11 isEqual:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)errorWrappingCompletionForCompletion:(id)a3 selectorName:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __73__CRKASMRosterUpdater_errorWrappingCompletionForCompletion_selectorName___block_invoke;
  v12[3] = &unk_2646F3F10;
  id v13 = v7;
  id v14 = v6;
  v12[4] = self;
  id v8 = v7;
  id v9 = v6;
  id v10 = (void *)MEMORY[0x22A620AF0](v12);

  return v10;
}

void __73__CRKASMRosterUpdater_errorWrappingCompletionForCompletion_selectorName___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (!v3)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_10:
    v9();
    goto LABEL_11;
  }
  v4 = [*(id *)(a1 + 32) requirements];
  char v5 = [v4 ownsError:v3];

  if ((v5 & 1) == 0)
  {
    id v9 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_10;
  }
  if (_CRKLogASM_onceToken_11 != -1) {
    dispatch_once(&_CRKLogASM_onceToken_11, &__block_literal_global_26);
  }
  id v6 = (void *)_CRKLogASM_logObj_11;
  if (os_log_type_enabled((os_log_t)_CRKLogASM_logObj_11, OS_LOG_TYPE_ERROR)) {
    __73__CRKASMRosterUpdater_errorWrappingCompletionForCompletion_selectorName___block_invoke_cold_1(a1, v6, v3);
  }
  uint64_t v10 = *MEMORY[0x263F08608];
  v11[0] = v3;
  id v7 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
  id v8 = CRKErrorWithCodeAndUserInfo(154, v7);

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_11:
}

- (CRKClassKitRosterRequirements)requirements
{
  return self->_requirements;
}

- (void).cxx_destruct
{
}

void __73__CRKASMRosterUpdater_errorWrappingCompletionForCompletion_selectorName___block_invoke_cold_1(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(void *)(a1 + 40);
  char v5 = a2;
  id v6 = [a3 verboseDescription];
  int v7 = 138543618;
  uint64_t v8 = v4;
  __int16 v9 = 2114;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_224C00000, v5, OS_LOG_TYPE_ERROR, "An error occurred in %{public}@, %{public}@", (uint8_t *)&v7, 0x16u);
}

@end