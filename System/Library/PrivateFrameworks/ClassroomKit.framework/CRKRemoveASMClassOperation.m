@interface CRKRemoveASMClassOperation
- (BOOL)isAsynchronous;
- (CRKClassKitRosterRequirements)requirements;
- (CRKRemoveASMClassOperation)initWithObjectID:(id)a3 requirements:(id)a4;
- (NSString)objectID;
- (id)classWithObjectID:(id)a3 inClasses:(id)a4;
- (void)didFetchClasses:(id)a3 error:(id)a4;
- (void)fetchClasses;
- (void)main;
- (void)removeClass:(id)a3;
@end

@implementation CRKRemoveASMClassOperation

- (CRKRemoveASMClassOperation)initWithObjectID:(id)a3 requirements:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKRemoveASMClassOperation;
  v8 = [(CRKRemoveASMClassOperation *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    objectID = v8->_objectID;
    v8->_objectID = (NSString *)v9;

    objc_storeStrong((id *)&v8->_requirements, a4);
  }

  return v8;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (void)main
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __34__CRKRemoveASMClassOperation_main__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __34__CRKRemoveASMClassOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchClasses];
}

- (void)fetchClasses
{
  v3 = [(CRKRemoveASMClassOperation *)self requirements];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__CRKRemoveASMClassOperation_fetchClasses__block_invoke;
  v4[3] = &unk_2646F42E8;
  v4[4] = self;
  [v3 classesWithCompletion:v4];
}

void __42__CRKRemoveASMClassOperation_fetchClasses__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __42__CRKRemoveASMClassOperation_fetchClasses__block_invoke_2;
  block[3] = &unk_2646F42C0;
  block[4] = *(void *)(a1 + 32);
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __42__CRKRemoveASMClassOperation_fetchClasses__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) didFetchClasses:*(void *)(a1 + 40) error:*(void *)(a1 + 48)];
}

- (void)didFetchClasses:(id)a3 error:(id)a4
{
  id v8 = a3;
  if (a4)
  {
    [(CRKRemoveASMClassOperation *)self endOperationWithError:a4];
  }
  else
  {
    id v6 = [(CRKRemoveASMClassOperation *)self objectID];
    id v7 = [(CRKRemoveASMClassOperation *)self classWithObjectID:v6 inClasses:v8];

    if (v7) {
      [(CRKRemoveASMClassOperation *)self removeClass:v7];
    }
    else {
      [(CRKRemoveASMClassOperation *)self endOperationWithResultObject:0];
    }
  }
}

- (void)removeClass:(id)a3
{
  id v4 = a3;
  if ([v4 isEditable])
  {
    id v5 = [(CRKRemoveASMClassOperation *)self requirements];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __42__CRKRemoveASMClassOperation_removeClass___block_invoke;
    v6[3] = &unk_2646F3438;
    v6[4] = self;
    [v5 removeClass:v4 completion:v6];
  }
  else
  {
    id v5 = CRKErrorWithCodeAndUserInfo(5, 0);
    [(CRKRemoveASMClassOperation *)self endOperationWithError:v5];
  }
}

void __42__CRKRemoveASMClassOperation_removeClass___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__CRKRemoveASMClassOperation_removeClass___block_invoke_2;
  v6[3] = &unk_2646F37F0;
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __42__CRKRemoveASMClassOperation_removeClass___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2) {
    return objc_msgSend(v1, "endOperationWithError:");
  }
  else {
    return objc_msgSend(v1, "endOperationWithResultObject:");
  }
}

- (id)classWithObjectID:(id)a3 inClasses:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v6;
    id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          objc_super v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          v13 = objc_msgSend(v12, "objectID", (void)v16);
          char v14 = [v5 isEqualToString:v13];

          if (v14)
          {
            id v9 = v12;
            goto LABEL_12;
          }
        }
        id v9 = (id)[v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (NSString)objectID
{
  return self->_objectID;
}

- (CRKClassKitRosterRequirements)requirements
{
  return self->_requirements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirements, 0);

  objc_storeStrong((id *)&self->_objectID, 0);
}

@end