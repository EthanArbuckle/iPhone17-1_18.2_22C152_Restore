@interface HDVerifiableClinicalRecordQueryServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (Class)queryClass;
+ (id)requiredEntitlements;
- (HDVerifiableClinicalRecordQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (NSArray)recordTypes;
- (NSArray)sourceTypes;
- (void)_queue_start;
@end

@implementation HDVerifiableClinicalRecordQueryServer

- (HDVerifiableClinicalRecordQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDVerifiableClinicalRecordQueryServer;
  v11 = [(HDQueryServer *)&v17 initWithUUID:a3 configuration:v10 client:a5 delegate:a6];
  if (v11)
  {
    uint64_t v12 = [v10 recordTypes];
    recordTypes = v11->_recordTypes;
    v11->_recordTypes = (NSArray *)v12;

    uint64_t v14 = [v10 sourceTypes];
    sourceTypes = v11->_sourceTypes;
    v11->_sourceTypes = (NSArray *)v14;
  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v7 = a3;
  v8 = [a4 entitlements];
  uint64_t v9 = *MEMORY[0x1E4F29E30];
  char v10 = [v8 hasAccessEntitlementWithIdentifier:*MEMORY[0x1E4F29E30]];

  if ((v10 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a5, 4, @"Missing required entitlement identifier: %@", v9);
    LOBYTE(v12) = 0;
    goto LABEL_11;
  }
  v11 = [v7 recordTypes];
  uint64_t v12 = (void *)[v11 count];

  if (!v12)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    v20 = @"recordTypes must contain at least one type";
LABEL_10:
    objc_msgSend(v19, "hk_assignError:code:description:", a5, 3, v20);
    goto LABEL_11;
  }
  v13 = [v7 sourceTypes];
  uint64_t v12 = (void *)[v13 count];

  if (!v12)
  {
    v19 = (void *)MEMORY[0x1E4F28C58];
    v20 = @"sourceTypes must contain at least one type";
    goto LABEL_10;
  }
  uint64_t v14 = (void *)MEMORY[0x1E4F1CA80];
  v15 = [v7 recordTypes];
  v16 = [v14 setWithArray:v15];

  objc_super v17 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4F2AAC0], *MEMORY[0x1E4F2AAC8], *MEMORY[0x1E4F2AAD0], 0);
  uint64_t v12 = objc_msgSend(v16, "hk_intersection:", v17);
  uint64_t v18 = [v12 count];

  LOBYTE(v12) = v18 == 1;
  if (v18 != 1) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:", a5, 3, @"recordTypes must contain exactly one clinical type");
  }

LABEL_11:
  return (char)v12;
}

uint64_t __78__HDVerifiableClinicalRecordQueryServer__samplesBeforeAuthorizationWithError___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if (isKindOfClass)
  {
    v8 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(*(void *)(a1 + 32) + 200)];
    uint64_t v9 = (void *)MEMORY[0x1E4F1CAD0];
    char v10 = [v6 recordTypes];
    v11 = [v9 setWithArray:v10];
    int v12 = [v8 isSubsetOfSet:v11];

    v13 = *(void **)(*(void *)(a1 + 32) + 208);
    uint64_t v14 = [v6 sourceType];
    int v15 = [v13 containsObject:v14];

    if (v12) {
      BOOL v16 = v15 == 0;
    }
    else {
      BOOL v16 = 1;
    }
    if (!v16) {
      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v6];
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 100, @"Expected HKVerifiableClinicalRecord but got %@", objc_opt_class());
  }

  return isKindOfClass & 1;
}

- (void)_queue_start
{
  v39[1] = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)HDVerifiableClinicalRecordQueryServer;
  [(HDQueryServer *)&v31 _queue_start];
  v3 = [(HDQueryServer *)self clientProxy];
  v30 = 0;
  if (self)
  {
    uint64_t v33 = 0;
    v34 = &v33;
    uint64_t v35 = 0x3032000000;
    v36 = __Block_byref_object_copy__137;
    v37 = __Block_byref_object_dispose__137;
    id v38 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4 = [MEMORY[0x1E4F2B6F8] verifiableClinicalRecordType];
    v5 = [(HDQueryServer *)self profile];
    id v6 = +[HDSampleEntity entityEnumeratorWithType:v4 profile:v5];

    id v7 = [(HDQueryServer *)self filter];
    v8 = [(HDQueryServer *)self profile];
    uint64_t v9 = [v7 predicateWithProfile:v8];
    [v6 setPredicate:v9];

    char v10 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"relevant_date" entityClass:objc_opt_class() ascending:0];
    v39[0] = v10;
    v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:1];
    [v6 setOrderingTerms:v11];

    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __78__HDVerifiableClinicalRecordQueryServer__samplesBeforeAuthorizationWithError___block_invoke;
    v32[3] = &unk_1E62F2FB8;
    v32[4] = self;
    v32[5] = &v33;
    if ([v6 enumerateWithError:&v30 handler:v32]) {
      int v12 = (void *)v34[5];
    }
    else {
      int v12 = 0;
    }
    id v13 = v12;

    _Block_object_dispose(&v33, 8);
    uint64_t v14 = v30;
  }
  else
  {
    uint64_t v14 = 0;
    id v13 = 0;
  }
  id v15 = v14;
  BOOL v16 = (void *)MEMORY[0x1E4F1CBF0];
  if (v13) {
    BOOL v16 = v13;
  }
  id v17 = v16;

  if (v15)
  {
    uint64_t v18 = [(HDQueryServer *)self queryUUID];
    objc_msgSend(v3, "client_deliverError:forQuery:", v15, v18);
  }
  else
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __53__HDVerifiableClinicalRecordQueryServer__queue_start__block_invoke;
    v27[3] = &unk_1E6305958;
    id v28 = v3;
    v29 = self;
    if (self)
    {
      v19 = (objc_class *)MEMORY[0x1E4F2B2B0];
      v20 = v27;
      id v21 = v17;
      id v22 = [v19 alloc];
      v23 = [MEMORY[0x1E4F2B6F8] verifiableClinicalRecordType];
      v24 = (void *)[v22 initWithExpectedObjectType:v23];

      [v24 setRecordTypes:self->_recordTypes];
      v25 = [[HDObjectAuthorizationRequestContext alloc] initWithSamples:v21 metadata:v24];

      [(HDObjectAuthorizationRequestContext *)v25 setPersistSession:1];
      [(HDObjectAuthorizationRequestContext *)v25 setPromptWithNoSamples:1];
      v26 = [(HDQueryServer *)self delegate];
      [v26 queryServer:self requestsAuthorizationWithContext:v25 completion:v20];
    }
    uint64_t v18 = 0;
    id v15 = v28;
  }
}

void __53__HDVerifiableClinicalRecordQueryServer__queue_start__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  id v7 = [*(id *)(a1 + 40) queryUUID];
  if (v8) {
    objc_msgSend(v6, "client_deliverVerifiableClinicalRecords:queryUUID:", v8, v7);
  }
  else {
    objc_msgSend(v6, "client_deliverError:forQuery:", v5, v7);
  }
}

- (NSArray)recordTypes
{
  return self->_recordTypes;
}

- (NSArray)sourceTypes
{
  return self->_sourceTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceTypes, 0);

  objc_storeStrong((id *)&self->_recordTypes, 0);
}

@end