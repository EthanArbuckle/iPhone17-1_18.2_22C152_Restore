@interface HDHealthRecordProcessingContext
- (BOOL)didProcessClinicalRecord:(id)a3 forMedicalRecord:(id)a4 error:(id *)a5;
- (BOOL)didProcessMedicalRecord:(id)a3 forResource:(id)a4 error:(id *)a5;
- (BOOL)foundResource:(id)a3 parentResource:(id)a4 error:(id *)a5;
- (HDHealthRecordProcessingContext)initWithRuleset:(id)a3 resources:(id)a4;
- (HDHealthRecordRuleset)extractionRuleset;
- (NSArray)resources;
- (NSMutableArray)mutableResources;
- (NSMutableDictionary)clinicalItemsByType;
- (NSMutableDictionary)clinicalRecordsByMedicalRecord;
- (NSMutableDictionary)medicalRecordsByOriginalResource;
- (NSMutableDictionary)parentResourcesByResource;
- (id)createExtractionResultWithError:(id *)a3;
- (id)extractedClinicalItemsForClinicalType:(int64_t)a3;
- (void)setClinicalItemsByType:(id)a3;
- (void)setClinicalRecordsByMedicalRecord:(id)a3;
- (void)setExtractedClinicalItems:(id)a3 forClinicalType:(int64_t)a4;
- (void)setMedicalRecordsByOriginalResource:(id)a3;
- (void)setMutableResources:(id)a3;
- (void)setParentResourcesByResource:(id)a3;
@end

@implementation HDHealthRecordProcessingContext

- (HDHealthRecordProcessingContext)initWithRuleset:(id)a3 resources:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    v24 = [MEMORY[0x263F08690] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"HDHealthRecordProcessingContext.m", 35, @"Invalid parameter not satisfying: %@", @"ruleset" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  v25 = [MEMORY[0x263F08690] currentHandler];
  [v25 handleFailureInMethod:a2, self, @"HDHealthRecordProcessingContext.m", 36, @"Invalid parameter not satisfying: %@", @"resources" object file lineNumber description];

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)HDHealthRecordProcessingContext;
  v11 = [(HDHealthRecordProcessingContext *)&v26 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_extractionRuleset, a3);
    uint64_t v13 = [objc_alloc(MEMORY[0x263EFF980]) initWithArray:v10];
    mutableResources = v12->_mutableResources;
    v12->_mutableResources = (NSMutableArray *)v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    parentResourcesByResource = v12->_parentResourcesByResource;
    v12->_parentResourcesByResource = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    clinicalItemsByType = v12->_clinicalItemsByType;
    v12->_clinicalItemsByType = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    medicalRecordsByOriginalResource = v12->_medicalRecordsByOriginalResource;
    v12->_medicalRecordsByOriginalResource = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    clinicalRecordsByMedicalRecord = v12->_clinicalRecordsByMedicalRecord;
    v12->_clinicalRecordsByMedicalRecord = v21;
  }
  return v12;
}

- (id)createExtractionResultWithError:(id *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  obj = self->_medicalRecordsByOriginalResource;
  uint64_t v5 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        v10 = [(NSMutableDictionary *)self->_medicalRecordsByOriginalResource objectForKeyedSubscript:v9];
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __67__HDHealthRecordProcessingContext_createExtractionResultWithError___block_invoke;
        v16[3] = &unk_264BD97B8;
        v16[4] = self;
        v11 = objc_msgSend(v10, "hk_map:", v16);
        v12 = (void *)[objc_alloc(MEMORY[0x263F45BF0]) initWithOriginalFHIRResource:v9 units:v11 flags:0];
        [v4 addObject:v12];
      }
      uint64_t v6 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x263F45BE8]) initWithItems:v4];
  return v13;
}

id __67__HDHealthRecordProcessingContext_createExtractionResultWithError___block_invoke(uint64_t a1, void *a2)
{
  v3 = (objc_class *)MEMORY[0x263F45BF8];
  id v4 = a2;
  id v5 = [v3 alloc];
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 48) objectForKeyedSubscript:v4];
  uint64_t v7 = (void *)[v5 initWithMedicalRecord:v4 clinicalRecord:v6 downloadableAttachments:0];

  return v7;
}

- (BOOL)foundResource:(id)a3 parentResource:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDHealthRecordProcessingContext.m", 76, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];

    if (v11) {
      goto LABEL_3;
    }
  }
  long long v19 = [MEMORY[0x263F08690] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"HDHealthRecordProcessingContext.m", 77, @"Invalid parameter not satisfying: %@", @"parentResource" object file lineNumber description];

LABEL_3:
  if ([v9 isEqual:v11])
  {
    long long v20 = [MEMORY[0x263F08690] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"HDHealthRecordProcessingContext.m", 78, @"Invalid parameter not satisfying: %@", @"![resource isEqual:parentResource]" object file lineNumber description];
  }
  v12 = [v9 FHIRVersion];
  uint64_t v13 = [v12 FHIRRelease];

  v14 = [(HDHealthRecordRuleset *)self->_extractionRuleset FHIRRelease];

  if (v13 == v14)
  {
    [(NSMutableArray *)self->_mutableResources addObject:v9];
    [(NSMutableDictionary *)self->_parentResourcesByResource setObject:v11 forKeyedSubscript:v9];
  }
  else
  {
    v15 = (void *)MEMORY[0x263F087E8];
    v16 = [(HDHealthRecordRuleset *)self->_extractionRuleset FHIRRelease];
    objc_msgSend(v15, "hk_assignError:code:format:", a5, 3, @"Cannot add resource from release %@ to a processing context associated with release %@", v13, v16);
  }
  return v13 == v14;
}

- (NSArray)resources
{
  v2 = (void *)[(NSMutableArray *)self->_mutableResources copy];
  return (NSArray *)v2;
}

- (id)extractedClinicalItemsForClinicalType:(int64_t)a3
{
  clinicalItemsByType = self->_clinicalItemsByType;
  id v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSMutableDictionary *)clinicalItemsByType objectForKeyedSubscript:v4];

  return v5;
}

- (void)setExtractedClinicalItems:(id)a3 forClinicalType:(int64_t)a4
{
  id v8 = (id)[a3 copy];
  clinicalItemsByType = self->_clinicalItemsByType;
  uint64_t v7 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)clinicalItemsByType setObject:v8 forKeyedSubscript:v7];
}

- (BOOL)didProcessClinicalRecord:(id)a3 forMedicalRecord:(id)a4 error:(id *)a5
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    uint64_t v22 = [MEMORY[0x263F08690] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"HDHealthRecordProcessingContext.m", 111, @"Invalid parameter not satisfying: %@", @"clinicalRecord" object file lineNumber description];
  }
  if (!v9)
  {
    v23 = [MEMORY[0x263F08690] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"HDHealthRecordProcessingContext.m", 112, @"Invalid parameter not satisfying: %@", @"medicalRecord" object file lineNumber description];
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = self->_medicalRecordsByOriginalResource;
  uint64_t v11 = [(NSMutableDictionary *)v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = [(NSMutableDictionary *)self->_medicalRecordsByOriginalResource objectForKeyedSubscript:*(void *)(*((void *)&v27 + 1) + 8 * i)];
        v25[0] = MEMORY[0x263EF8330];
        v25[1] = 3221225472;
        v25[2] = __83__HDHealthRecordProcessingContext_didProcessClinicalRecord_forMedicalRecord_error___block_invoke;
        v25[3] = &unk_264BD97E0;
        id v16 = v9;
        id v17 = v9;
        id v26 = v17;
        long long v18 = objc_msgSend(v15, "hk_firstObjectPassingTest:", v25);

        if (v18)
        {

          [(NSMutableDictionary *)self->_clinicalRecordsByMedicalRecord setObject:v8 forKeyedSubscript:v17];
          BOOL v20 = 1;
          id v9 = v16;
          goto LABEL_15;
        }
        id v9 = v16;
      }
      uint64_t v12 = [(NSMutableDictionary *)v10 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }

  long long v19 = (void *)MEMORY[0x263F087E8];
  long long v18 = [v9 FHIRIdentifier];
  objc_msgSend(v19, "hk_assignError:code:format:", a5, 3, @"cannot accept a clinical record without a matching medical record, %@ is unknown to us", v18);
  BOOL v20 = 0;
LABEL_15:

  return v20;
}

uint64_t __83__HDHealthRecordProcessingContext_didProcessClinicalRecord_forMedicalRecord_error___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

- (BOOL)didProcessMedicalRecord:(id)a3 forResource:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    long long v18 = [MEMORY[0x263F08690] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"HDHealthRecordProcessingContext.m", 141, @"Invalid parameter not satisfying: %@", @"medicalRecord" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  long long v19 = [MEMORY[0x263F08690] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"HDHealthRecordProcessingContext.m", 142, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];

LABEL_3:
  uint64_t v11 = [(NSMutableDictionary *)self->_parentResourcesByResource objectForKeyedSubscript:v10];
  uint64_t v12 = (void *)v11;
  if (v11) {
    uint64_t v13 = (void *)v11;
  }
  else {
    uint64_t v13 = v10;
  }
  id v14 = v13;

  v15 = [(NSMutableDictionary *)self->_medicalRecordsByOriginalResource objectForKeyedSubscript:v14];
  if (v15)
  {
    id v16 = v15;
    [v15 addObject:v8];
  }
  else
  {
    id v16 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v8, 0);
    [(NSMutableDictionary *)self->_medicalRecordsByOriginalResource setObject:v16 forKeyedSubscript:v14];
  }

  return 1;
}

- (HDHealthRecordRuleset)extractionRuleset
{
  return self->_extractionRuleset;
}

- (NSMutableArray)mutableResources
{
  return self->_mutableResources;
}

- (void)setMutableResources:(id)a3
{
}

- (NSMutableDictionary)parentResourcesByResource
{
  return self->_parentResourcesByResource;
}

- (void)setParentResourcesByResource:(id)a3
{
}

- (NSMutableDictionary)clinicalItemsByType
{
  return self->_clinicalItemsByType;
}

- (void)setClinicalItemsByType:(id)a3
{
}

- (NSMutableDictionary)medicalRecordsByOriginalResource
{
  return self->_medicalRecordsByOriginalResource;
}

- (void)setMedicalRecordsByOriginalResource:(id)a3
{
}

- (NSMutableDictionary)clinicalRecordsByMedicalRecord
{
  return self->_clinicalRecordsByMedicalRecord;
}

- (void)setClinicalRecordsByMedicalRecord:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clinicalRecordsByMedicalRecord, 0);
  objc_storeStrong((id *)&self->_medicalRecordsByOriginalResource, 0);
  objc_storeStrong((id *)&self->_clinicalItemsByType, 0);
  objc_storeStrong((id *)&self->_parentResourcesByResource, 0);
  objc_storeStrong((id *)&self->_mutableResources, 0);
  objc_storeStrong((id *)&self->_extractionRuleset, 0);
}

@end