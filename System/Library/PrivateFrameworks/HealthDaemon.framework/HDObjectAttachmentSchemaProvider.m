@interface HDObjectAttachmentSchemaProvider
+ (id)schemaIdentifier;
- (BOOL)readAuthorizationForObjectIdentifier:(id)a3 client:(id)a4 profile:(id)a5 error:(id *)a6;
- (BOOL)validateAttachment:(id)a3 forObjectWithIdentifier:(id)a4 metadata:(id)a5 profile:(id)a6 error:(id *)a7;
- (BOOL)writeAuthorizationForObjectIdentifier:(id)a3 client:(id)a4 profile:(id)a5 error:(id *)a6;
- (id)_objectWithIdentifier:(void *)a3 profile:(void *)a4 errorOut:;
- (int64_t)schemaVersionForObjectIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
@end

@implementation HDObjectAttachmentSchemaProvider

+ (id)schemaIdentifier
{
  return (id)*MEMORY[0x1E4F29718];
}

- (int64_t)schemaVersionForObjectIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v12 = 0;
  v7 = -[HDObjectAttachmentSchemaProvider _objectWithIdentifier:profile:errorOut:]((uint64_t)self, a3, a4, &v12);
  id v8 = v12;
  v9 = objc_msgSend(v7, "hd_sampleType");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a5, 100, @"Failed to fetch object", v8);
    goto LABEL_5;
  }
  if (!self)
  {
LABEL_5:
    int64_t v10 = 0;
    goto LABEL_6;
  }
  int64_t v10 = [v9 attachmentSchemaVersion];
LABEL_6:

  return v10;
}

- (id)_objectWithIdentifier:(void *)a3 profile:(void *)a4 errorOut:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v7];
    if (v9)
    {
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x3032000000;
      v25 = __Block_byref_object_copy__153;
      v26 = __Block_byref_object_dispose__153;
      id v27 = 0;
      int64_t v10 = [v8 database];
      id v21 = 0;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __75__HDObjectAttachmentSchemaProvider__objectWithIdentifier_profile_errorOut___block_invoke;
      v17[3] = &unk_1E63078E0;
      v17[4] = a1;
      id v18 = v9;
      v20 = &v22;
      id v19 = v8;
      +[HDHealthEntity performReadTransactionWithHealthDatabase:v10 error:&v21 block:v17];
      id v11 = v21;

      id v12 = (void *)v23[5];
      if (!v12)
      {
        id v13 = v11;
        v14 = v13;
        if (v13)
        {
          if (a4) {
            *a4 = v13;
          }
          else {
            _HKLogDroppedError();
          }
        }

        id v12 = (void *)v23[5];
      }
      id v15 = v12;

      _Block_object_dispose(&v22, 8);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 118, @"No object found with identifier '%@'", v7);
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (BOOL)validateAttachment:(id)a3 forObjectWithIdentifier:(id)a4 metadata:(id)a5 profile:(id)a6 error:(id *)a7
{
  id v11 = a3;
  id v12 = -[HDObjectAttachmentSchemaProvider _objectWithIdentifier:profile:errorOut:]((uint64_t)self, a4, a6, a7);
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v13 = [v12 sampleType];
      id v14 = [v11 contentType];
      char v15 = objc_msgSend(v13, "canAttachFileOfType:size:error:", v14, objc_msgSend(v11, "size"), a7);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"The object type is not supported");
      id v16 = (id)objc_claimAutoreleasedReturnValue();
      id v14 = v16;
      if (v16)
      {
        if (a7)
        {
          id v14 = v16;
          char v15 = 0;
          *a7 = v14;
        }
        else
        {
          _HKLogDroppedError();
          char v15 = 0;
        }
        id v13 = v14;
      }
      else
      {
        id v13 = 0;
        char v15 = 0;
      }
    }
  }
  else
  {
    char v15 = 0;
  }

  return v15;
}

- (BOOL)readAuthorizationForObjectIdentifier:(id)a3 client:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = -[HDObjectAttachmentSchemaProvider _objectWithIdentifier:profile:errorOut:]((uint64_t)self, a3, a5, a6);
  if (v11)
  {
    id v12 = [v10 authorizationOracle];
    char v13 = [v12 isAuthorizedToReadObject:v11 error:a6];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)writeAuthorizationForObjectIdentifier:(id)a3 client:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = -[HDObjectAttachmentSchemaProvider _objectWithIdentifier:profile:errorOut:]((uint64_t)self, a3, a5, a6);
  if (!v11) {
    goto LABEL_5;
  }
  id v12 = [v10 sourceBundleIdentifier];
  char v13 = [v11 sourceRevision];
  id v14 = [v13 source];
  char v15 = [v14 bundleIdentifier];
  char v16 = [v12 isEqualToString:v15];

  if ((v16 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a6, 4, @"Cannot write to an object from a different source");
LABEL_5:
    char v20 = 0;
    goto LABEL_6;
  }
  v17 = [v10 authorizationOracle];
  id v18 = objc_msgSend(v11, "hd_sampleType");
  id v19 = [v17 readAuthorizationStatusForType:v18 error:a6];

  char v20 = [v19 canWrite];
LABEL_6:

  return v20;
}

BOOL __75__HDObjectAttachmentSchemaProvider__objectWithIdentifier_profile_errorOut___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = a2;
  v9 = v8;
  if (v6)
  {
    id v10 = [v8 protectedDatabase];
    id v11 = HDDataEntityPredicateForDataUUID();
    v31[0] = 0;
    id v12 = +[HDDataEntity anyInDatabase:v10 predicate:v11 error:v31];
    id v13 = v31[0];

    if (v12)
    {
      id v14 = [v9 protectedDatabase];
      id v15 = [v12 numberForProperty:@"data_type" database:v14];

      if (v15)
      {
        unint64_t v16 = [v15 integerValue];
        if (v16 < 0x13D)
        {
          v17 = [MEMORY[0x1E4F2B2C0] dataTypeWithCode:v16];
          if (v17)
          {
LABEL_23:

LABEL_24:
            goto LABEL_25;
          }
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"HKObjectType for data type code '%li' is unexpectedly nil", v16);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"Unknown data type code '%li'", v16);
        }
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          if (a3) {
            *a3 = v18;
          }
          else {
            _HKLogDroppedError();
          }
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a3, 2000, @"Unable to fetch dataTypeCodeNumber for objectUUID: %@", v7);
      }
LABEL_22:
      v17 = 0;
      goto LABEL_23;
    }
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 118, @"No entity found for objectUUID: %@", v7);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      if (!v15) {
        goto LABEL_22;
      }
    }
    if (a3) {
      *a3 = v15;
    }
    else {
      _HKLogDroppedError();
    }

    v17 = 0;
    if (v13) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
  v17 = 0;
LABEL_25:

  if (v17)
  {
    uint64_t v19 = *(void *)(a1 + 32);
    char v20 = *(void **)(a1 + 48);
    id v21 = *(id *)(a1 + 40);
    id v22 = v17;
    id v23 = v20;
    if (v19)
    {
      uint64_t v35 = 0;
      v36 = &v35;
      uint64_t v37 = 0x3032000000;
      v38 = __Block_byref_object_copy__153;
      v39 = __Block_byref_object_dispose__153;
      id v40 = 0;
      uint64_t v24 = +[HDSampleEntity entityEnumeratorWithType:v22 profile:v23];
      v25 = HDDataEntityPredicateForDataUUID();
      [v24 setPredicate:v25];

      [v24 setLimitCount:1];
      v31[0] = (id)MEMORY[0x1E4F143A8];
      v31[1] = (id)3221225472;
      v31[2] = __71__HDObjectAttachmentSchemaProvider__objectWithUUID_type_profile_error___block_invoke;
      v31[3] = &unk_1E6307908;
      id v32 = v21;
      id v33 = v23;
      v34 = &v35;
      [v24 enumerateWithError:a3 handler:v31];
      id v26 = (id)v36[5];

      _Block_object_dispose(&v35, 8);
    }
    else
    {
      id v26 = 0;
    }

    uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
    v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;

    BOOL v29 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
  }
  else
  {
    BOOL v29 = 0;
  }

  return v29;
}

BOOL __71__HDObjectAttachmentSchemaProvider__objectWithUUID_type_profile_error___block_invoke(void *a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  if (v7) {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  }
  else {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a4, 118, @"No object found for objectUUID: %@, profile: %@", a1[4], a1[5]);
  }

  return v7 != 0;
}

@end