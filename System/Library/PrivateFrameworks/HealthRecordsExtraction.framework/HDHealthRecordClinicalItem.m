@interface HDHealthRecordClinicalItem
- (Class)medicalRecordClass;
- (HDFHIRResourceObject)APIResource;
- (HDHealthRecordClinicalItem)initWithRepresentedResource:(id)a3 clinicalType:(id)a4 rulesVersion:(id)a5;
- (HDHealthRecordClinicalType)clinicalType;
- (HDOriginalFHIRResourceObject)representedResource;
- (HKMedicalRecord)extractedMedicalRecord;
- (NSDictionary)medicalRecordMetadata;
- (NSDictionary)originalAttributes;
- (NSNumber)rulesVersion;
- (NSString)country;
- (id)_medicalRecordPropertyArrayFromKey:(id)a3 expectedClass:(Class)a4 error:(id *)a5;
- (id)_medicalRecordPropertyFromKey:(id)a3 expectedClass:(Class)a4 error:(id *)a5;
- (id)candidateValueForKeyPath:(id)a3 error:(id *)a4;
- (id)correspondingClinicalTypeWithError:(id *)a3;
- (id)medicalRecordPropertyValueForKey:(id)a3 expectedClass:(Class)a4 isArray:(BOOL)a5 error:(id *)a6;
- (id)valueForUndefinedKey:(id)a3;
- (int64_t)type;
- (void)assignExtractedMedicalRecord:(id)a3;
- (void)setAPIResource:(id)a3;
- (void)setClinicalType:(id)a3;
- (void)setExtractedMedicalRecord:(id)a3;
- (void)setMedicalRecordMetadata:(id)a3;
- (void)setMedicalRecordPropertyValue:(id)a3 forKey:(id)a4;
@end

@implementation HDHealthRecordClinicalItem

- (HDHealthRecordClinicalItem)initWithRepresentedResource:(id)a3 clinicalType:(id)a4 rulesVersion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)HDHealthRecordClinicalItem;
  v12 = [(HDHealthRecordClinicalItem *)&v27 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_representedResource, a3);
    v14 = [v9 JSONObject];
    uint64_t v15 = [v14 copy];
    originalAttributes = v13->_originalAttributes;
    v13->_originalAttributes = (NSDictionary *)v15;

    uint64_t v17 = [v10 copy];
    clinicalType = v13->_clinicalType;
    v13->_clinicalType = (HDHealthRecordClinicalType *)v17;

    uint64_t v19 = [v11 copy];
    rulesVersion = v13->_rulesVersion;
    v13->_rulesVersion = (NSNumber *)v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    medicalRecordProperties = v13->_medicalRecordProperties;
    v13->_medicalRecordProperties = v21;

    v23 = [v9 country];
    uint64_t v24 = [v23 copy];
    country = v13->_country;
    v13->_country = (NSString *)v24;
  }
  return v13;
}

- (id)correspondingClinicalTypeWithError:(id *)a3
{
  if (self->_extractedMedicalRecord)
  {
    v4 = 0;
    switch([(HDHealthRecordClinicalType *)self->_clinicalType type])
    {
      case 0:
        uint64_t v5 = [MEMORY[0x263F0A1A8] allergyRecordType];
        goto LABEL_15;
      case 1:
        uint64_t v5 = [MEMORY[0x263F0A1A8] clinicalNoteRecordType];
        goto LABEL_15;
      case 2:
        uint64_t v5 = [MEMORY[0x263F0A1A8] conditionRecordType];
        goto LABEL_15;
      case 3:
        uint64_t v5 = [MEMORY[0x263F0A1A8] coverageRecordType];
        goto LABEL_15;
      case 4:
        uint64_t v5 = [MEMORY[0x263F0A1A8] immunizationRecordType];
        goto LABEL_15;
      case 5:
      case 6:
      case 7:
        uint64_t v5 = [MEMORY[0x263F0A1A8] medicationRecordType];
        goto LABEL_15;
      case 8:
        objc_opt_class();
        v6 = HKSafeObject();
        id v7 = 0;
        v8 = v7;
        if (v6)
        {
          id v9 = [v6 category];
          HKDiagnosticTestResultCategoryFromNSString();
          id v10 = (id)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            uint64_t v11 = HKClinicalTypeForDiagnosticTestResultCategory();
            if (v11)
            {
              v4 = (void *)v11;
              goto LABEL_25;
            }
          }
          v14 = (void *)MEMORY[0x263F087E8];
          uint64_t v15 = [v6 category];
          objc_msgSend(v14, "hk_assignError:code:format:", a3, 3, @"unsupported Observation category: %@", v15);
        }
        else
        {
          id v13 = v7;
          id v10 = v13;
          if (v13)
          {
            if (a3)
            {
              id v10 = v13;
              v4 = 0;
              *a3 = v10;
              goto LABEL_25;
            }
            _HKLogDroppedError();
          }
        }
        v4 = 0;
LABEL_25:

        break;
      case 11:
        uint64_t v5 = [MEMORY[0x263F0A1A8] procedureRecordType];
LABEL_15:
        v4 = (void *)v5;
        break;
      default:
        break;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a3, 3, @"can only determine corresponding clinical types after medical record extraction has produced a medical record");
    v4 = 0;
  }
  return v4;
}

- (int64_t)type
{
  return [(HDHealthRecordClinicalType *)self->_clinicalType type];
}

- (Class)medicalRecordClass
{
  return [(HDHealthRecordClinicalType *)self->_clinicalType medicalRecordClass];
}

- (void)assignExtractedMedicalRecord:(id)a3
{
  id v4 = a3;
  if (self->_extractedMedicalRecord)
  {
    _HKInitializeLogging();
    uint64_t v5 = (void *)*MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      -[HDHealthRecordClinicalItem assignExtractedMedicalRecord:](v5);
    }
  }
  [(HDHealthRecordClinicalItem *)self setExtractedMedicalRecord:v4];
}

- (id)candidateValueForKeyPath:(id)a3 error:(id *)a4
{
  return [self hd_valueForKeyPath:a3 rootResource:self->_representedResource error:a4];
}

- (void)setMedicalRecordPropertyValue:(id)a3 forKey:(id)a4
{
}

- (id)_medicalRecordPropertyFromKey:(id)a3 expectedClass:(Class)a4 error:(id *)a5
{
  v19[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [(NSMutableDictionary *)self->_medicalRecordProperties objectForKeyedSubscript:v8];
  if (v9)
  {
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      goto LABEL_10;
    }
    uint64_t v11 = [NSString stringWithFormat:@"expected %@ but found %@", a4, objc_opt_class()];
    v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = *MEMORY[0x263F08320];
    v18[0] = @"propertyName";
    v18[1] = v13;
    v19[0] = v8;
    v19[1] = v11;
    v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];
    uint64_t v15 = [v12 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:202 userInfo:v14];

    id v16 = v15;
    if (v16)
    {
      if (a5) {
        *a5 = v16;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  id v10 = 0;
LABEL_10:

  return v10;
}

- (id)_medicalRecordPropertyArrayFromKey:(id)a3 expectedClass:(Class)a4 error:(id *)a5
{
  v36[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = [(NSMutableDictionary *)self->_medicalRecordProperties objectForKeyedSubscript:v8];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v10 = v9;
      if ([v10 count])
      {
        long long v30 = 0u;
        long long v31 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        id v11 = v10;
        uint64_t v12 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v29;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v29 != v14) {
                objc_enumerationMutation(v11);
              }
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                v21 = [NSString stringWithFormat:@"array contents expected %@ but found %@", a4, objc_opt_class(), v28];
                v22 = (void *)MEMORY[0x263F087E8];
                uint64_t v23 = *MEMORY[0x263F08320];
                v32[0] = @"propertyName";
                v32[1] = v23;
                v33[0] = v8;
                v33[1] = v21;
                uint64_t v24 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
                v25 = [v22 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:203 userInfo:v24];

                id v26 = v25;
                if (v26)
                {
                  if (a5) {
                    *a5 = v26;
                  }
                  else {
                    _HKLogDroppedError();
                  }
                }

                goto LABEL_25;
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }

        id v16 = v11;
      }
      else
      {
        id v16 = (id)MEMORY[0x263EFFA68];
      }
    }
    else
    {
      id v10 = [NSString stringWithFormat:@"expected array but found %@", objc_opt_class()];
      uint64_t v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v18 = *MEMORY[0x263F08320];
      v35[0] = @"propertyName";
      v35[1] = v18;
      v36[0] = v8;
      v36[1] = v10;
      uint64_t v19 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
      v20 = [v17 errorWithDomain:@"HDHealthRecordsServiceErrorDomain" code:202 userInfo:v19];

      id v11 = v20;
      if (v11)
      {
        if (a5) {
          *a5 = v11;
        }
        else {
          _HKLogDroppedError();
        }
      }

LABEL_25:
      id v16 = 0;
    }
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

- (id)medicalRecordPropertyValueForKey:(id)a3 expectedClass:(Class)a4 isArray:(BOOL)a5 error:(id *)a6
{
  if (a5) {
    [(HDHealthRecordClinicalItem *)self _medicalRecordPropertyArrayFromKey:a3 expectedClass:a4 error:a6];
  }
  else {
  v6 = [(HDHealthRecordClinicalItem *)self _medicalRecordPropertyFromKey:a3 expectedClass:a4 error:a6];
  }
  return v6;
}

- (id)valueForUndefinedKey:(id)a3
{
  return 0;
}

- (HDOriginalFHIRResourceObject)representedResource
{
  return self->_representedResource;
}

- (HKMedicalRecord)extractedMedicalRecord
{
  return self->_extractedMedicalRecord;
}

- (void)setExtractedMedicalRecord:(id)a3
{
}

- (HDFHIRResourceObject)APIResource
{
  return self->_APIResource;
}

- (void)setAPIResource:(id)a3
{
}

- (NSNumber)rulesVersion
{
  return self->_rulesVersion;
}

- (NSString)country
{
  return self->_country;
}

- (NSDictionary)medicalRecordMetadata
{
  return self->_medicalRecordMetadata;
}

- (void)setMedicalRecordMetadata:(id)a3
{
}

- (NSDictionary)originalAttributes
{
  return self->_originalAttributes;
}

- (HDHealthRecordClinicalType)clinicalType
{
  return self->_clinicalType;
}

- (void)setClinicalType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clinicalType, 0);
  objc_storeStrong((id *)&self->_originalAttributes, 0);
  objc_storeStrong((id *)&self->_medicalRecordMetadata, 0);
  objc_storeStrong((id *)&self->_country, 0);
  objc_storeStrong((id *)&self->_rulesVersion, 0);
  objc_storeStrong((id *)&self->_APIResource, 0);
  objc_storeStrong((id *)&self->_extractedMedicalRecord, 0);
  objc_storeStrong((id *)&self->_representedResource, 0);
  objc_storeStrong((id *)&self->_medicalRecordProperties, 0);
}

- (void)assignExtractedMedicalRecord:(void *)a1 .cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = HKSensitiveLogItem();
  int v3 = 138543362;
  id v4 = v2;
  _os_log_error_impl(&dword_232E63000, v1, OS_LOG_TYPE_ERROR, "%{public}@ already has an associated medical record, overriding", (uint8_t *)&v3, 0xCu);
}

@end