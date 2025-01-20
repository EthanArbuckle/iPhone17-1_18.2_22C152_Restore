@interface CRKCreateASMClassOperation
- (BOOL)applyProperties:(id)a3 toClass:(id)a4 error:(id *)a5;
- (BOOL)isAsynchronous;
- (BOOL)location:(id)a3 hasMatchInLocations:(id)a4;
- (CRKASMCourseCreateProperties)properties;
- (CRKClassKitRosterRequirements)requirements;
- (CRKCreateASMClassOperation)initWithProperties:(id)a3 requirements:(id)a4;
- (void)constructClassWithInstructor:(id)a3;
- (void)fetchInstructor;
- (void)main;
- (void)validateDesiredLocationExistsForInstructor:(id)a3;
- (void)validateParameters;
@end

@implementation CRKCreateASMClassOperation

- (CRKCreateASMClassOperation)initWithProperties:(id)a3 requirements:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CRKCreateASMClassOperation;
  v8 = [(CRKCreateASMClassOperation *)&v12 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    properties = v8->_properties;
    v8->_properties = (CRKASMCourseCreateProperties *)v9;

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
  block[2] = __34__CRKCreateASMClassOperation_main__block_invoke;
  block[3] = &unk_2646F35C0;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __34__CRKCreateASMClassOperation_main__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) validateParameters];
}

- (void)validateParameters
{
  v3 = [(CRKCreateASMClassOperation *)self properties];
  v4 = [v3 location];

  if (v4)
  {
    v5 = [(CRKCreateASMClassOperation *)self properties];
    id v6 = [v5 location];
    id v7 = [v6 identifier];

    if (v7)
    {
      v8 = [(CRKCreateASMClassOperation *)self properties];
      uint64_t v9 = [v8 updateProperties];
      v10 = [v9 name];

      if (v10)
      {
        [(CRKCreateASMClassOperation *)self fetchInstructor];
        return;
      }
      v11 = &unk_26D81A050;
    }
    else
    {
      v11 = &unk_26D81A028;
    }
  }
  else
  {
    v11 = &unk_26D81A000;
  }
  CRKErrorWithCodeAndUserInfo(2, v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  [(CRKCreateASMClassOperation *)self endOperationWithError:v12];
}

- (void)fetchInstructor
{
  v3 = [(CRKCreateASMClassOperation *)self requirements];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__CRKCreateASMClassOperation_fetchInstructor__block_invoke;
  v4[3] = &unk_2646F45F8;
  v4[4] = self;
  [v3 currentUserWithCompletion:v4];
}

void __45__CRKCreateASMClassOperation_fetchInstructor__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__CRKCreateASMClassOperation_fetchInstructor__block_invoke_2;
  block[3] = &unk_2646F42C0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v11 = v6;
  uint64_t v12 = v7;
  id v13 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __45__CRKCreateASMClassOperation_fetchInstructor__block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(v2, "endOperationWithError:");
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 48) person];
    v4 = *(void **)(a1 + 40);
    id v6 = (id)v3;
    if (v3)
    {
      [v4 validateDesiredLocationExistsForInstructor:v3];
    }
    else
    {
      id v5 = CRKErrorWithCodeAndUserInfo(150, 0);
      [v4 endOperationWithError:v5];
    }
  }
}

- (void)validateDesiredLocationExistsForInstructor:(id)a3
{
  id v4 = a3;
  id v5 = [(CRKCreateASMClassOperation *)self requirements];
  id v6 = [v4 objectID];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __73__CRKCreateASMClassOperation_validateDesiredLocationExistsForInstructor___block_invoke;
  v8[3] = &unk_2646F57A8;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  [v5 locationsWithManagePermissionsForUserWithObjectID:v6 completion:v8];
}

void __73__CRKCreateASMClassOperation_validateDesiredLocationExistsForInstructor___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __73__CRKCreateASMClassOperation_validateDesiredLocationExistsForInstructor___block_invoke_2;
  v11[3] = &unk_2646F37A0;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(a1 + 40);
  id v12 = v6;
  uint64_t v13 = v7;
  id v14 = v5;
  id v15 = v8;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

void __73__CRKCreateASMClassOperation_validateDesiredLocationExistsForInstructor___block_invoke_2(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  if (v3)
  {
    objc_msgSend(v2, "endOperationWithError:");
  }
  else
  {
    id v4 = [v2 properties];
    id v8 = [v4 location];

    char v5 = [*(id *)(a1 + 40) location:v8 hasMatchInLocations:*(void *)(a1 + 48)];
    id v6 = *(void **)(a1 + 40);
    if (v5)
    {
      [*(id *)(a1 + 40) constructClassWithInstructor:*(void *)(a1 + 56)];
    }
    else
    {
      uint64_t v7 = CRKErrorWithCodeAndUserInfo(151, 0);
      [v6 endOperationWithError:v7];
    }
  }
}

- (void)constructClassWithInstructor:(id)a3
{
  id v4 = a3;
  char v5 = [(CRKCreateASMClassOperation *)self properties];
  id v6 = [v5 location];
  uint64_t v7 = [v6 identifier];

  id v8 = [(CRKCreateASMClassOperation *)self properties];
  id v9 = [v8 updateProperties];
  id v10 = [v9 name];

  id v11 = [(CRKCreateASMClassOperation *)self requirements];
  id v12 = [v11 makeClassWithLocationID:v7 name:v10];

  uint64_t v13 = [(CRKCreateASMClassOperation *)self requirements];
  [v13 addPerson:v4 toClass:v12];

  id v14 = [(CRKCreateASMClassOperation *)self properties];
  id v15 = [v14 updateProperties];
  id v21 = 0;
  BOOL v16 = [(CRKCreateASMClassOperation *)self applyProperties:v15 toClass:v12 error:&v21];
  id v17 = v21;

  if (v16)
  {
    v18 = [(CRKCreateASMClassOperation *)self requirements];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __59__CRKCreateASMClassOperation_constructClassWithInstructor___block_invoke;
    v19[3] = &unk_2646F4918;
    v19[4] = self;
    id v20 = v12;
    [v18 saveClass:v20 completion:v19];
  }
  else
  {
    [(CRKCreateASMClassOperation *)self endOperationWithError:v17];
  }
}

void __59__CRKCreateASMClassOperation_constructClassWithInstructor___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__CRKCreateASMClassOperation_constructClassWithInstructor___block_invoke_2;
  block[3] = &unk_2646F42C0;
  uint64_t v4 = *(void *)(a1 + 32);
  char v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __59__CRKCreateASMClassOperation_constructClassWithInstructor___block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    objc_msgSend(v2, "endOperationWithError:");
  }
  else
  {
    id v3 = [*(id *)(a1 + 48) objectID];
    [v1 endOperationWithResultObject:v3];
  }
}

- (BOOL)location:(id)a3 hasMatchInLocations:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (v5)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v17 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * i), "objectID", (void)v16);
          uint64_t v13 = [v5 identifier];
          char v14 = [v12 isEqualToString:v13];

          if (v14)
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
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
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)applyProperties:(id)a3 toClass:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  uint64_t v10 = [CRKClassKitClassPropertyApplicator alloc];
  id v11 = [(CRKCreateASMClassOperation *)self requirements];
  id v12 = [(CRKClassKitClassPropertyApplicator *)v10 initWithRequirements:v11];

  uint64_t v13 = [(CRKClassKitClassPropertyApplicator *)v12 applyProperties:v9 toClass:v8 error:a5];

  return v13 != 0;
}

- (CRKASMCourseCreateProperties)properties
{
  return self->_properties;
}

- (CRKClassKitRosterRequirements)requirements
{
  return self->_requirements;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requirements, 0);

  objc_storeStrong((id *)&self->_properties, 0);
}

@end