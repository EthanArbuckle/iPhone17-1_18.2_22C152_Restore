@interface HDClinicalAttachmentSchemaProvider
+ (id)schemaIdentifier;
- (BOOL)readAuthorizationForObjectIdentifier:(id)a3 client:(id)a4 profile:(id)a5 error:(id *)a6;
- (BOOL)validateAttachment:(id)a3 forObjectWithIdentifier:(id)a4 metadata:(id)a5 profile:(id)a6 error:(id *)a7;
- (BOOL)writeAuthorizationForObjectIdentifier:(id)a3 client:(id)a4 profile:(id)a5 error:(id *)a6;
- (id)_objectWithIdentifier:(void *)a3 profile:(void *)a4 errorOut:;
- (int64_t)schemaVersionForObjectIdentifier:(id)a3 profile:(id)a4 error:(id *)a5;
@end

@implementation HDClinicalAttachmentSchemaProvider

+ (id)schemaIdentifier
{
  return (id)*MEMORY[0x1E4F29708];
}

- (int64_t)schemaVersionForObjectIdentifier:(id)a3 profile:(id)a4 error:(id *)a5
{
  id v12 = 0;
  v7 = -[HDClinicalAttachmentSchemaProvider _objectWithIdentifier:profile:errorOut:]((uint64_t)self, a3, a4, &v12);
  id v8 = v12;
  v9 = objc_msgSend(v7, "hd_sampleType");

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:description:underlyingError:", a5, 100, @"Failed to fetch object", v8);
    goto LABEL_7;
  }
  if (!self)
  {
LABEL_7:
    int64_t v10 = 0;
    goto LABEL_8;
  }
  if ((unint64_t)([v9 code] - 267) < 2) {
    int64_t v10 = 1;
  }
  else {
    int64_t v10 = -1;
  }
LABEL_8:

  return v10;
}

- (id)_objectWithIdentifier:(void *)a3 profile:(void *)a4 errorOut:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    if ([v7 hasPrefix:*MEMORY[0x1E4F298E8]])
    {
      uint64_t v9 = +[HDClinicalRecordEntity clinicalRecordWithAttachmentObjectIdentifier:v7 profile:v8 error:a4];
LABEL_6:
      int64_t v10 = (void *)v9;
      goto LABEL_13;
    }
    if ([v7 hasPrefix:*MEMORY[0x1E4F298E0]])
    {
      uint64_t v9 = +[HDMedicalRecordEntity medicalRecordWithAttachmentObjectIdentifier:v7 profile:v8 error:a4];
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 3, @"identifier is not a clinical or medical record  %@", v7);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      if (a4) {
        *a4 = v11;
      }
      else {
        _HKLogDroppedError();
      }
    }
  }
  int64_t v10 = 0;
LABEL_13:

  return v10;
}

- (BOOL)validateAttachment:(id)a3 forObjectWithIdentifier:(id)a4 metadata:(id)a5 profile:(id)a6 error:(id *)a7
{
  uint64_t v8 = [a3 size];
  if (v8 >= 26214401) {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", a7, 3, @"File size is too large");
  }
  return v8 < 26214401;
}

- (BOOL)readAuthorizationForObjectIdentifier:(id)a3 client:(id)a4 profile:(id)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = -[HDClinicalAttachmentSchemaProvider _objectWithIdentifier:profile:errorOut:]((uint64_t)self, a3, a5, a6);
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
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 110, @"Adding attachments is not supported", a5);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    if (a6) {
      *a6 = v7;
    }
    else {
      _HKLogDroppedError();
    }
  }

  return 0;
}

@end