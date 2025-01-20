@interface HDFHIRJSONObject
+ (BOOL)supportsSecureCoding;
+ (id)_dataFromJSONObject:(id)a3 JSONOptions:(unint64_t)a4;
+ (id)objectWithResourceData:(id)a3 error:(id *)a4;
+ (id)resourceTypeOfJSONObject:(id)a3 error:(id *)a4;
- (BOOL)_isDiagnosticTestReportR4Lab;
- (BOOL)hasCode:(id)a3 codeSystem:(id)a4 codeableConcept:(id)a5 error:(id *)a6;
- (BOOL)hasCode:(id)a3 codeSystem:(id)a4 codings:(id)a5 error:(id *)a6;
- (BOOL)isClinicalNoteRecord;
- (BOOL)isDiagnosticTestReport;
- (BOOL)isDocumentReference;
- (BOOL)isEqual:(id)a3;
- (HDFHIRJSONObject)initWithCoder:(id)a3;
- (HDFHIRJSONObject)initWithJSONObject:(id)a3 sourceURL:(id)a4 FHIRVersion:(id)a5;
- (HKFHIRVersion)FHIRVersion;
- (NSData)data;
- (NSData)uniquenessChecksum;
- (NSDictionary)JSONObject;
- (NSString)detectedResourceType;
- (NSString)sourceString;
- (NSURL)sourceURL;
- (id)_dataWithJSONOptions:(unint64_t)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDFHIRJSONObject

- (BOOL)isDiagnosticTestReport
{
  v3 = [(HDFHIRJSONObject *)self detectedResourceType];
  if (![v3 isEqual:*MEMORY[0x263F09568]]) {
    goto LABEL_7;
  }
  v4 = [(HDFHIRJSONObject *)self FHIRVersion];
  v5 = [v4 FHIRRelease];
  v6 = v5;
  if (v5 == (void *)*MEMORY[0x263F09558])
  {
    BOOL v7 = [(HDFHIRJSONObject *)self _isDiagnosticTestReportR4Lab];

    if (v7)
    {
      BOOL v8 = 1;
      goto LABEL_8;
    }
  }
  else
  {
  }
  v9 = [(HDFHIRJSONObject *)self FHIRVersion];
  v10 = [v9 FHIRRelease];
  v11 = (void *)*MEMORY[0x263F09550];

  if (v10 != v11)
  {
LABEL_7:
    BOOL v8 = 0;
    goto LABEL_8;
  }
  v13 = [(HDFHIRJSONObject *)self JSONObject];
  id v18 = 0;
  v14 = objc_msgSend(v13, "hk_safeValueIfExistsForKeyPath:class:error:", @"category", objc_opt_class(), &v18);
  id v15 = v18;

  if (v14)
  {
    id v17 = v15;
    BOOL v8 = [(HDFHIRJSONObject *)self hasCode:@"LAB" codeSystem:@"http://hl7.org/fhir/ValueSet/diagnostic-service-sections" codeableConcept:v14 error:&v17];
    id v16 = v17;

    id v15 = v16;
  }
  else
  {
    BOOL v8 = 0;
  }

LABEL_8:
  return v8;
}

- (BOOL)isClinicalNoteRecord
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v3 = [(HDFHIRJSONObject *)self FHIRVersion];
  v4 = [v3 FHIRRelease];
  v5 = (void *)*MEMORY[0x263F09558];

  if (v4 == v5)
  {
    BOOL v7 = [(HDFHIRJSONObject *)self detectedResourceType];
    if ([v7 isEqual:*MEMORY[0x263F09570]])
    {
      BOOL v8 = [(HDFHIRJSONObject *)self JSONObject];
      id v28 = 0;
      v9 = objc_msgSend(v8, "hk_safeValueIfExistsForKeyPath:class:error:", @"category", objc_opt_class(), &v28);
      id v10 = v28;

      if (!v9)
      {
        BOOL v6 = 0;
LABEL_24:

        goto LABEL_25;
      }
      v21 = v7;
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      id v11 = v9;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v25;
        while (2)
        {
          uint64_t v15 = 0;
          id v16 = v10;
          do
          {
            if (*(void *)v25 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v17 = *(void *)(*((void *)&v24 + 1) + 8 * v15);
            id v23 = v16;
            BOOL v18 = [(HDFHIRJSONObject *)self hasCode:@"clinical-note" codeSystem:@"http://hl7.org/fhir/us/core/CodeSystem/us-core-documentreference-category" codeableConcept:v17 error:&v23];
            id v10 = v23;

            if (v18)
            {

              BOOL v6 = 1;
              goto LABEL_18;
            }
            ++v15;
            id v16 = v10;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v24 objects:v29 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      BOOL v6 = 0;
LABEL_18:
      BOOL v7 = v21;
    }
    else
    {
      if (![v7 isEqual:*MEMORY[0x263F09568]]
        || [(HDFHIRJSONObject *)self _isDiagnosticTestReportR4Lab])
      {
        BOOL v6 = 0;
LABEL_25:

        return v6;
      }
      v19 = [(HDFHIRJSONObject *)self JSONObject];
      id v22 = 0;
      objc_msgSend(v19, "hk_safeValueIfExistsForKeyPath:class:error:", @"presentedForm", objc_opt_class(), &v22);
      id v11 = (id)objc_claimAutoreleasedReturnValue();
      id v10 = v22;

      if (v11) {
        BOOL v6 = [v11 count] != 0;
      }
      else {
        BOOL v6 = 0;
      }
    }

    goto LABEL_24;
  }
  return 0;
}

- (BOOL)_isDiagnosticTestReportR4Lab
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v3 = [(HDFHIRJSONObject *)self JSONObject];
  id v22 = 0;
  v4 = objc_msgSend(v3, "hk_safeValueIfExistsForKeyPath:class:error:", @"category", objc_opt_class(), &v22);
  id v5 = v22;

  if (v4)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      id v16 = v4;
      uint64_t v9 = *(void *)v19;
      while (2)
      {
        uint64_t v10 = 0;
        id v11 = v5;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
          id v17 = v11;
          BOOL v13 = [(HDFHIRJSONObject *)self hasCode:@"LAB", @"http://terminology.hl7.org/CodeSystem/v2-0074", v12, &v17, v16 codeSystem codeableConcept error];
          id v5 = v17;

          if (v13)
          {
            BOOL v14 = 1;
            goto LABEL_12;
          }
          ++v10;
          id v11 = v5;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v23 count:16];
        if (v8) {
          continue;
        }
        break;
      }
      BOOL v14 = 0;
LABEL_12:
      v4 = v16;
    }
    else
    {
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)isDocumentReference
{
  v2 = [(HDFHIRJSONObject *)self detectedResourceType];
  char v3 = [v2 isEqual:*MEMORY[0x263F09570]];

  return v3;
}

- (BOOL)hasCode:(id)a3 codeSystem:(id)a4 codeableConcept:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  BOOL v13 = objc_msgSend(v12, "hk_safeValueIfExistsForKeyPath:class:error:", @"coding", objc_opt_class(), a6);

  if (v13) {
    BOOL v14 = [(HDFHIRJSONObject *)self hasCode:v10 codeSystem:v11 codings:v13 error:a6];
  }
  else {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)hasCode:(id)a3 codeSystem:(id)a4 codings:(id)a5 error:(id *)a6
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v19 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = a5;
  uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(obj);
        }
        BOOL v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v15 = objc_msgSend(v14, "hk_safeValueIfExistsForKeyPath:class:error:", @"code", objc_opt_class(), a6);
        id v16 = objc_msgSend(v14, "hk_safeValueIfExistsForKeyPath:class:error:", @"system", objc_opt_class(), a6);
        if (![v9 caseInsensitiveCompare:v15] && !objc_msgSend(v19, "caseInsensitiveCompare:", v16))
        {

          BOOL v17 = 1;
          goto LABEL_12;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 0;
LABEL_12:

  return v17;
}

- (HDFHIRJSONObject)initWithJSONObject:(id)a3 sourceURL:(id)a4 FHIRVersion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)HDFHIRJSONObject;
  uint64_t v11 = [(HDFHIRJSONObject *)&v19 init];
  if (v11)
  {
    uint64_t v12 = [v8 copy];
    JSONObject = v11->_JSONObject;
    v11->_JSONObject = (NSDictionary *)v12;

    uint64_t v14 = [v9 copy];
    sourceURL = v11->_sourceURL;
    v11->_sourceURL = (NSURL *)v14;

    uint64_t v16 = [v10 copy];
    FHIRVersion = v11->_FHIRVersion;
    v11->_FHIRVersion = (HKFHIRVersion *)v16;
  }
  return v11;
}

- (NSString)detectedResourceType
{
  return (NSString *)[(NSDictionary *)self->_JSONObject hk_safeStringIfExistsForKeyPath:@"resourceType" error:0];
}

+ (id)_dataFromJSONObject:(id)a3 JSONOptions:(unint64_t)a4
{
  id v8 = 0;
  v4 = [MEMORY[0x263F08900] dataWithJSONObject:a3 options:a4 error:&v8];
  id v5 = v8;
  if (!v4)
  {
    _HKInitializeLogging();
    id v6 = *MEMORY[0x263F09908];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
      +[HDFHIRJSONObject _dataFromJSONObject:JSONOptions:]((uint64_t)v5, v6);
    }
  }

  return v4;
}

- (id)_dataWithJSONOptions:(unint64_t)a3
{
  id v5 = objc_opt_class();
  JSONObject = self->_JSONObject;

  return (id)[v5 _dataFromJSONObject:JSONObject JSONOptions:a3];
}

- (NSData)data
{
  v2 = [(HDFHIRJSONObject *)self _dataWithJSONOptions:0];
  char v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x263EFF8F8] data];
  }
  id v5 = v4;

  return (NSData *)v5;
}

- (NSString)sourceString
{
  v2 = (void *)MEMORY[0x263F08900];
  char v3 = [(HDFHIRJSONObject *)self JSONObject];
  id v4 = objc_msgSend(v2, "hk_stringForDisplayFromFHIRJSONObject:", v3);

  return (NSString *)v4;
}

- (NSData)uniquenessChecksum
{
  v2 = [(HDFHIRJSONObject *)self _dataWithJSONOptions:10];
  char v3 = objc_msgSend(v2, "hk_MD5");

  return (NSData *)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(HDFHIRJSONObject *)self JSONObject];
  [v4 encodeObject:v5 forKey:@"JSONObject"];

  id v6 = [(HDFHIRJSONObject *)self sourceURL];
  [v4 encodeObject:v6 forKey:@"SourceURL"];

  id v7 = [(HDFHIRJSONObject *)self FHIRVersion];
  [v4 encodeObject:v7 forKey:@"FHIRVersion"];
}

- (HDFHIRJSONObject)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263F08900], "hk_JSONObjectSecureCodingClasses");
  id v6 = [v4 decodeObjectOfClasses:v5 forKey:@"JSONObject"];

  id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceURL"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FHIRVersion"];
  id v9 = (void *)v8;
  if (v6) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (v10)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    uint64_t v11 = 0;
  }
  else
  {
    self = [(HDFHIRJSONObject *)self initWithJSONObject:v6 sourceURL:v7 FHIRVersion:v8];
    uint64_t v11 = self;
  }

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDictionary *)self->_JSONObject hash];
  uint64_t v4 = [(NSURL *)self->_sourceURL hash] ^ v3;
  return v4 ^ [(HKFHIRVersion *)self->_FHIRVersion hash];
}

- (BOOL)isEqual:(id)a3
{
  id v5 = (HDFHIRJSONObject *)a3;
  if (v5 == self)
  {
    char v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
      JSONObject = self->_JSONObject;
      uint64_t v8 = [(HDFHIRJSONObject *)v6 JSONObject];
      if (![(NSDictionary *)JSONObject isEqualToDictionary:v8])
      {
        char v14 = 0;
LABEL_21:

        goto LABEL_22;
      }
      sourceURL = self->_sourceURL;
      BOOL v10 = [(HDFHIRJSONObject *)v6 sourceURL];
      if (sourceURL != v10)
      {
        uint64_t v11 = [(HDFHIRJSONObject *)v6 sourceURL];
        if (!v11)
        {
          char v14 = 0;
LABEL_20:

          goto LABEL_21;
        }
        uint64_t v3 = (void *)v11;
        uint64_t v12 = self->_sourceURL;
        BOOL v13 = [(HDFHIRJSONObject *)v6 sourceURL];
        if (![(NSURL *)v12 isEqual:v13])
        {
          char v14 = 0;
LABEL_19:

          goto LABEL_20;
        }
        long long v23 = v13;
      }
      FHIRVersion = self->_FHIRVersion;
      uint64_t v16 = [(HDFHIRJSONObject *)v6 FHIRVersion];
      if (FHIRVersion == (HKFHIRVersion *)v16)
      {

        char v14 = 1;
      }
      else
      {
        BOOL v17 = (void *)v16;
        uint64_t v18 = [(HDFHIRJSONObject *)v6 FHIRVersion];
        if (v18)
        {
          objc_super v19 = (void *)v18;
          long long v20 = self->_FHIRVersion;
          long long v21 = [(HDFHIRJSONObject *)v6 FHIRVersion];
          char v14 = [(HKFHIRVersion *)v20 isEqual:v21];
        }
        else
        {

          char v14 = 0;
        }
      }
      BOOL v13 = v23;
      if (sourceURL == v10) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
    char v14 = 0;
  }
LABEL_22:

  return v14;
}

+ (id)objectWithResourceData:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [v6 JSONDictionaryWithError:a4];
  if (v7)
  {
    id v8 = objc_alloc((Class)a1);
    id v9 = [v6 sourceURL];
    BOOL v10 = [v6 FHIRVersion];
    uint64_t v11 = (void *)[v8 initWithJSONObject:v7 sourceURL:v9 FHIRVersion:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

+ (id)resourceTypeOfJSONObject:(id)a3 error:(id *)a4
{
  id v5 = a3;
  objc_opt_class();
  id v6 = HKSafeObject();
  if (!v6) {
    goto LABEL_7;
  }
  if ((objc_msgSend(v5, "hk_hasValueForKeyPath:", @"resourceType") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 3, @"Missing \"resourceType\" string in JSON");
LABEL_7:
    id v9 = 0;
    goto LABEL_11;
  }
  id v7 = objc_msgSend(v5, "hk_safeStringForKeyPath:error:", @"resourceType", a4);
  id v8 = v7;
  if (!v7)
  {
LABEL_9:
    id v9 = 0;
    goto LABEL_10;
  }
  if (![v7 length])
  {
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 3, @"Empty \"resourceType\" in JSON");
    goto LABEL_9;
  }
  id v9 = v8;
LABEL_10:

LABEL_11:

  return v9;
}

- (NSDictionary)JSONObject
{
  return self->_JSONObject;
}

- (HKFHIRVersion)FHIRVersion
{
  return self->_FHIRVersion;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_FHIRVersion, 0);

  objc_storeStrong((id *)&self->_JSONObject, 0);
}

+ (void)_dataFromJSONObject:(uint64_t)a1 JSONOptions:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_221D38000, a2, OS_LOG_TYPE_ERROR, "Failed to create FHIR resource data from JSON: %@", (uint8_t *)&v2, 0xCu);
}

@end