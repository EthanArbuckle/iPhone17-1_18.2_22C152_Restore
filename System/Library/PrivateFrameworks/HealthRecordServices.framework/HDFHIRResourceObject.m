@interface HDFHIRResourceObject
+ (BOOL)supportsSecureCoding;
+ (HDFHIRResourceObject)resourceObjectWithJSONObject:(id)a3 serverBaseURL:(id)a4 FHIRVersion:(id)a5 receivedDate:(id)a6 error:(id *)a7;
+ (HDFHIRResourceObject)resourceObjectWithJSONObject:(id)a3 sourceURL:(id)a4 FHIRVersion:(id)a5 receivedDate:(id)a6 extractionHints:(unint64_t)a7 error:(id *)a8;
+ (HDFHIRResourceObject)resourceObjectWithResourceData:(id)a3 receivedDate:(id)a4 extractionHints:(unint64_t)a5 error:(id *)a6;
+ (id)identifierDetectedInJSONObject:(id)a3 error:(id *)a4;
+ (id)identifierWithStaticIdentifier:(id)a3 JSONObject:(id)a4 error:(id *)a5;
- (BOOL)isEqual:(id)a3;
- (HDFHIRResourceObject)initWithCoder:(id)a3;
- (HKFHIRIdentifier)identifier;
- (NSDate)receivedDate;
- (NSURL)serverBaseURL;
- (id)_initWithResourceIdentifier:(id)a3 JSONObject:(id)a4 sourceURL:(id)a5 FHIRVersion:(id)a6 receivedDate:(id)a7 extractionHints:(unint64_t)a8;
- (id)copyAsOriginalResourceObjectWithFirstSeenDate:(id)a3 originInformation:(id)a4 existingRowID:(id)a5 ingestedOnLocalDevice:(BOOL)a6 country:(id)a7;
- (id)copyWithOriginDataFrom:(id)a3;
- (id)description;
- (unint64_t)extractionHints;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)serverBaseURL;
@end

@implementation HDFHIRResourceObject

- (id)copyWithOriginDataFrom:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = [MEMORY[0x263F08690] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"HDOriginalFHIRResourceObject.m", 262, @"Invalid parameter not satisfying: %@", @"[original isKindOfClass:[HDOriginalFHIRResourceObject class]]" object file lineNumber description];
  }
  v6 = [v5 firstSeenDate];
  v7 = [v5 originInformation];
  v8 = [v5 existingRowID];
  v9 = [v5 country];
  id v10 = [(HDFHIRResourceObject *)self copyAsOriginalResourceObjectWithFirstSeenDate:v6 originInformation:v7 existingRowID:v8 ingestedOnLocalDevice:1 country:v9];

  return v10;
}

- (id)copyAsOriginalResourceObjectWithFirstSeenDate:(id)a3 originInformation:(id)a4 existingRowID:(id)a5 ingestedOnLocalDevice:(BOOL)a6 country:(id)a7
{
  id v12 = a7;
  id v25 = a5;
  id v24 = a4;
  id v13 = a3;
  v22 = [HDOriginalFHIRResourceObject alloc];
  v23 = [(HDFHIRResourceObject *)self identifier];
  v14 = [(HDFHIRJSONObject *)self JSONObject];
  v15 = [(HDFHIRJSONObject *)self uniquenessChecksum];
  v16 = [(HDFHIRJSONObject *)self sourceURL];
  v17 = [(HDFHIRJSONObject *)self FHIRVersion];
  v18 = [(HDFHIRResourceObject *)self receivedDate];
  LOBYTE(v21) = a6;
  id v19 = [(HDOriginalFHIRResourceObject *)v22 _initWithResourceIdentifier:v23 JSONObject:v14 uniquenessChecksum:v15 sourceURL:v16 FHIRVersion:v17 receivedDate:v18 firstSeenDate:v13 extractionHints:[(HDFHIRResourceObject *)self extractionHints] originInformation:v24 existingROWID:v25 ingestedOnLocalDevice:v21 country:v12];

  return v19;
}

- (id)_initWithResourceIdentifier:(id)a3 JSONObject:(id)a4 sourceURL:(id)a5 FHIRVersion:(id)a6 receivedDate:(id)a7 extractionHints:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a7;
  v22.receiver = self;
  v22.super_class = (Class)HDFHIRResourceObject;
  v16 = [(HDFHIRJSONObject *)&v22 initWithJSONObject:a4 sourceURL:a5 FHIRVersion:a6];
  if (v16)
  {
    uint64_t v17 = [v14 copy];
    identifier = v16->_identifier;
    v16->_identifier = (HKFHIRIdentifier *)v17;

    uint64_t v19 = [v15 copy];
    receivedDate = v16->_receivedDate;
    v16->_receivedDate = (NSDate *)v19;

    v16->_extractionHints = a8;
  }

  return v16;
}

+ (HDFHIRResourceObject)resourceObjectWithResourceData:(id)a3 receivedDate:(id)a4 extractionHints:(unint64_t)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 JSONDictionaryWithError:a6];
  if (v12)
  {
    id v13 = [a1 identifierDetectedInJSONObject:v12 error:a6];
    if (v13)
    {
      id v14 = objc_alloc((Class)a1);
      id v15 = [v10 sourceURL];
      v16 = [v10 FHIRVersion];
      uint64_t v17 = (void *)[v14 _initWithResourceIdentifier:v13 JSONObject:v12 sourceURL:v15 FHIRVersion:v16 receivedDate:v11 extractionHints:a5];
    }
    else
    {
      uint64_t v17 = 0;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }

  return (HDFHIRResourceObject *)v17;
}

+ (HDFHIRResourceObject)resourceObjectWithJSONObject:(id)a3 serverBaseURL:(id)a4 FHIRVersion:(id)a5 receivedDate:(id)a6 error:(id *)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  v16 = [a1 identifierDetectedInJSONObject:v12 error:a7];
  uint64_t v17 = v16;
  if (v16)
  {
    v18 = [v16 resourceType];
    uint64_t v19 = [v13 URLByAppendingPathComponent:v18];
    v20 = [v17 identifier];
    uint64_t v21 = [v19 URLByAppendingPathComponent:v20];

    objc_super v22 = (void *)[objc_alloc((Class)a1) _initWithResourceIdentifier:v17 JSONObject:v12 sourceURL:v21 FHIRVersion:v14 receivedDate:v15 extractionHints:0];
  }
  else
  {
    objc_super v22 = 0;
  }

  return (HDFHIRResourceObject *)v22;
}

+ (HDFHIRResourceObject)resourceObjectWithJSONObject:(id)a3 sourceURL:(id)a4 FHIRVersion:(id)a5 receivedDate:(id)a6 extractionHints:(unint64_t)a7 error:(id *)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  v18 = [a1 identifierDetectedInJSONObject:v14 error:a8];
  if (v18)
  {
    if (!v15 || ([v15 isFileURL] & 1) != 0) {
      goto LABEL_4;
    }
    v20 = [v15 pathComponents];
    unint64_t v21 = [v20 count];

    if (v21 > 1)
    {
      id v24 = [v18 identifier];
      v36 = [v15 pathComponents];
      id v25 = [v36 lastObject];
      char v34 = [v24 isEqualToString:v25];

      if (v34)
      {
        v26 = [v18 resourceType];
        v35 = [v15 pathComponents];
        v37 = [v15 pathComponents];
        v27 = objc_msgSend(v35, "objectAtIndexedSubscript:", objc_msgSend(v37, "count") - 2);
        char v33 = [v26 isEqualToString:v27];

        if (v33)
        {
LABEL_4:
          uint64_t v19 = (void *)[objc_alloc((Class)a1) _initWithResourceIdentifier:v18 JSONObject:v14 sourceURL:v15 FHIRVersion:v16 receivedDate:v17 extractionHints:a7];
          goto LABEL_14;
        }
        v28 = (void *)MEMORY[0x263F087E8];
        v23 = HKSensitiveLogItem();
        v29 = [v15 path];
        v30 = HKSensitiveLogItem();
        objc_msgSend(v28, "hk_assignError:code:format:", a8, 3, @"Invalid sourceURL for resource %@, resource type is not the second to last path component in %@", v23, v30);
      }
      else
      {
        v38 = (void *)MEMORY[0x263F087E8];
        v23 = HKSensitiveLogItem();
        v29 = [v15 pathComponents];
        v30 = [v29 lastObject];
        v31 = HKSensitiveLogItem();
        objc_msgSend(v38, "hk_assignError:code:format:", a8, 3, @"Invalid sourceURL for resource %@, id is not the last path component, got %@", v23, v31);
      }
    }
    else
    {
      objc_super v22 = (void *)MEMORY[0x263F087E8];
      v23 = HKSensitiveLogItem();
      objc_msgSend(v22, "hk_assignError:code:format:", a8, 3, @"Invalid sourceURL for resource %@", v23);
    }
  }
  uint64_t v19 = 0;
LABEL_14:

  return (HDFHIRResourceObject *)v19;
}

+ (id)identifierDetectedInJSONObject:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [a1 resourceTypeOfJSONObject:v6 error:a4];
  v8 = v7;
  if (v7)
  {
    if ([v7 length])
    {
      id v14 = 0;
      v9 = objc_msgSend(v6, "hk_safeStringForKeyPath:error:", @"id", &v14);
      id v10 = v14;
      if (v9)
      {
        id v11 = (void *)[objc_alloc(MEMORY[0x263F0A360]) initWithResourceType:v8 identifier:v9];
      }
      else
      {
        id v12 = [NSString stringWithFormat:@"Failed to instantiate resource"];
        objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:underlyingError:", a4, 3, v12, v10);

        id v11 = 0;
      }

      goto LABEL_9;
    }
    objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a4, 3, @"Empty resourceType");
  }
  id v11 = 0;
LABEL_9:

  return v11;
}

+ (id)identifierWithStaticIdentifier:(id)a3 JSONObject:(id)a4 error:(id *)a5
{
  id v8 = a3;
  v9 = [a1 resourceTypeOfJSONObject:a4 error:a5];
  id v10 = v9;
  if (v9)
  {
    if ([v9 length])
    {
      if (v8 && [v8 length])
      {
        id v11 = (void *)[objc_alloc(MEMORY[0x263F0A360]) initWithResourceType:v10 identifier:v8];
        goto LABEL_9;
      }
      id v12 = [NSString stringWithFormat:@"Empty staticIdentifier"];
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 3, v12);
    }
    else
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 3, @"Empty resourceType");
    }
  }
  id v11 = 0;
LABEL_9:

  return v11;
}

- (NSURL)serverBaseURL
{
  uint64_t v3 = [(HDFHIRJSONObject *)self sourceURL];
  if (v3)
  {
    v4 = (void *)v3;
    id v5 = [(HDFHIRJSONObject *)self sourceURL];
    id v6 = [v5 host];

    if (v6)
    {
      v7 = [(HDFHIRJSONObject *)self sourceURL];
      id v8 = (void *)[v7 copy];

      v9 = [v8 lastPathComponent];
      id v10 = [(HKFHIRIdentifier *)self->_identifier identifier];
      int v11 = [v9 isEqualToString:v10];

      if (v11)
      {
        id v12 = [v8 URLByDeletingLastPathComponent];

        id v13 = [v12 lastPathComponent];
        id v14 = [(HKFHIRIdentifier *)self->_identifier resourceType];
        char v15 = [v13 isEqualToString:v14];

        if (v15)
        {
          id v16 = [v12 URLByDeletingLastPathComponent];

          goto LABEL_11;
        }
        id v8 = v12;
      }
      _HKInitializeLogging();
      id v17 = (void *)*MEMORY[0x263F09908];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F09908], OS_LOG_TYPE_ERROR)) {
        [(HDFHIRResourceObject *)v17 serverBaseURL];
      }
    }
  }
  id v16 = 0;
LABEL_11:

  return (NSURL *)v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HDFHIRResourceObject;
  id v4 = a3;
  [(HDFHIRJSONObject *)&v7 encodeWithCoder:v4];
  id v5 = [(HDFHIRResourceObject *)self identifier];
  [v4 encodeObject:v5 forKey:@"Identifier"];

  id v6 = [(HDFHIRResourceObject *)self receivedDate];
  [v4 encodeObject:v6 forKey:@"ReceivedDate"];

  objc_msgSend(v4, "encodeInteger:forKey:", -[HDFHIRResourceObject extractionHints](self, "extractionHints"), @"ExtractionHints");
}

- (HDFHIRResourceObject)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ReceivedDate"];
  objc_super v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8 || ([v4 containsValueForKey:@"ExtractionHints"] & 1) == 0)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    int v11 = 0;
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)HDFHIRResourceObject;
    v9 = [(HDFHIRJSONObject *)&v13 initWithCoder:v4];
    id v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_identifier, v5);
      objc_storeStrong((id *)&v10->_receivedDate, v7);
      v10->_extractionHints = [v4 decodeIntegerForKey:@"ExtractionHints"];
    }
    self = v10;
    int v11 = self;
  }

  return v11;
}

- (unint64_t)hash
{
  v5.receiver = self;
  v5.super_class = (Class)HDFHIRResourceObject;
  unint64_t v3 = [(HDFHIRJSONObject *)&v5 hash];
  return [(NSDate *)self->_receivedDate hash] ^ v3 ^ self->_extractionHints;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (HDFHIRResourceObject *)a3;
  if (v4 == self)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (v9.receiver = self,
          v9.super_class = (Class)HDFHIRResourceObject,
          [(HDFHIRJSONObject *)&v9 isEqual:v4]))
    {
      objc_super v5 = v4;
      unint64_t extractionHints = self->_extractionHints;
      BOOL v7 = extractionHints == [(HDFHIRResourceObject *)v5 extractionHints]
        && [(NSDate *)self->_receivedDate isEqualToDate:v5->_receivedDate];
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (id)description
{
  unint64_t v3 = NSString;
  id v4 = [(HKFHIRIdentifier *)self->_identifier resourceType];
  objc_super v5 = [(HKFHIRIdentifier *)self->_identifier identifier];
  uint64_t v6 = HKSensitiveLogItem();
  BOOL v7 = [v3 stringWithFormat:@"<%@ \"%@\">", v4, v6];

  return v7;
}

- (HKFHIRIdentifier)identifier
{
  return self->_identifier;
}

- (NSDate)receivedDate
{
  return self->_receivedDate;
}

- (unint64_t)extractionHints
{
  return self->_extractionHints;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receivedDate, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)serverBaseURL
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  unint64_t v3 = a1;
  id v4 = [a2 sourceURL];
  objc_super v5 = HKSensitiveLogItem();
  uint64_t v6 = HKSensitiveLogItem();
  int v7 = 138412546;
  BOOL v8 = v5;
  __int16 v9 = 2112;
  id v10 = v6;
  _os_log_error_impl(&dword_221D38000, v3, OS_LOG_TYPE_ERROR, "Unexpected sourceURL «%@» on resource %@, cannot create serverBaseURL", (uint8_t *)&v7, 0x16u);
}

@end