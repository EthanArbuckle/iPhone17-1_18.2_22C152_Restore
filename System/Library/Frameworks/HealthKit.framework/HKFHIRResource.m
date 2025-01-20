@interface HKFHIRResource
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKFHIRResource)init;
- (HKFHIRResource)initWithCoder:(id)a3;
- (HKFHIRResource)initWithResourceType:(id)a3 identifier:(id)a4 FHIRVersion:(id)a5 data:(id)a6 sourceURL:(id)a7 lastUpdatedDate:(id)a8;
- (HKFHIRResourceType)resourceType;
- (HKFHIRVersion)FHIRVersion;
- (NSData)data;
- (NSDate)lastUpdatedDate;
- (NSString)identifier;
- (NSString)sourceString;
- (NSURL)sourceURL;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFHIRResource

- (HKFHIRResource)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKFHIRResource)initWithResourceType:(id)a3 identifier:(id)a4 FHIRVersion:(id)a5 data:(id)a6 sourceURL:(id)a7 lastUpdatedDate:(id)a8
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  if (v17)
  {
    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2, self, @"HKFHIRResource.m", 59, @"Invalid parameter not satisfying: %@", @"FHIRVersion" object file lineNumber description];

    if (v15)
    {
LABEL_3:
      if (v16) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  v36 = [MEMORY[0x1E4F28B00] currentHandler];
  [v36 handleFailureInMethod:a2, self, @"HKFHIRResource.m", 60, @"Invalid parameter not satisfying: %@", @"resourceType" object file lineNumber description];

  if (v16)
  {
LABEL_4:
    if (v18) {
      goto LABEL_5;
    }
LABEL_12:
    v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"HKFHIRResource.m", 62, @"Invalid parameter not satisfying: %@", @"data" object file lineNumber description];

    if (v20) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_11:
  v37 = [MEMORY[0x1E4F28B00] currentHandler];
  [v37 handleFailureInMethod:a2, self, @"HKFHIRResource.m", 61, @"Invalid parameter not satisfying: %@", @"identifier" object file lineNumber description];

  if (!v18) {
    goto LABEL_12;
  }
LABEL_5:
  if (v20) {
    goto LABEL_6;
  }
LABEL_13:
  v39 = [MEMORY[0x1E4F28B00] currentHandler];
  [v39 handleFailureInMethod:a2, self, @"HKFHIRResource.m", 63, @"Invalid parameter not satisfying: %@", @"lastUpdatedDate" object file lineNumber description];

LABEL_6:
  v40.receiver = self;
  v40.super_class = (Class)HKFHIRResource;
  v21 = [(HKFHIRResource *)&v40 init];
  if (v21)
  {
    uint64_t v22 = [v17 copy];
    FHIRVersion = v21->_FHIRVersion;
    v21->_FHIRVersion = (HKFHIRVersion *)v22;

    uint64_t v24 = [v15 copy];
    resourceType = v21->_resourceType;
    v21->_resourceType = (NSString *)v24;

    uint64_t v26 = [v16 copy];
    identifier = v21->_identifier;
    v21->_identifier = (NSString *)v26;

    uint64_t v28 = [v18 copy];
    data = v21->_data;
    v21->_data = (NSData *)v28;

    uint64_t v30 = [v19 copy];
    sourceURL = v21->_sourceURL;
    v21->_sourceURL = (NSURL *)v30;

    uint64_t v32 = [v20 copy];
    lastUpdatedDate = v21->_lastUpdatedDate;
    v21->_lastUpdatedDate = (NSDate *)v32;
  }
  return v21;
}

- (HKFHIRVersion)FHIRVersion
{
  return self->_FHIRVersion;
}

- (HKFHIRResourceType)resourceType
{
  return self->_resourceType;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSData)data
{
  return self->_data;
}

- (NSURL)sourceURL
{
  return self->_sourceURL;
}

- (NSDate)lastUpdatedDate
{
  return self->_lastUpdatedDate;
}

- (NSString)sourceString
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(HKFHIRResource *)self data];
  uint64_t v4 = objc_msgSend(v2, "hk_stringForDisplayFromFHIRData:", v3);

  return (NSString *)v4;
}

- (unint64_t)hash
{
  v3 = [(HKFHIRResource *)self resourceType];
  uint64_t v4 = [v3 hash];
  v5 = [(HKFHIRResource *)self identifier];
  uint64_t v6 = [v5 hash] ^ v4;
  v7 = [(HKFHIRResource *)self FHIRVersion];
  uint64_t v8 = [v7 hash];
  v9 = [(HKFHIRResource *)self data];
  uint64_t v10 = v6 ^ v8 ^ [v9 hash];
  v11 = [(HKFHIRResource *)self sourceURL];
  uint64_t v12 = [v11 hash];
  v13 = [(HKFHIRResource *)self lastUpdatedDate];
  unint64_t v14 = v10 ^ v12 ^ [v13 hash];

  return v14;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKFHIRResource *)a3;
  if (self == v4)
  {
    BOOL v14 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      uint64_t v6 = [(HKFHIRResource *)self FHIRVersion];
      uint64_t v7 = [(HKFHIRResource *)v5 FHIRVersion];
      if (v6 == (void *)v7)
      {
      }
      else
      {
        uint64_t v8 = (void *)v7;
        uint64_t v9 = [(HKFHIRResource *)v5 FHIRVersion];
        if (!v9) {
          goto LABEL_34;
        }
        uint64_t v10 = (void *)v9;
        v11 = [(HKFHIRResource *)self FHIRVersion];
        uint64_t v12 = [(HKFHIRResource *)v5 FHIRVersion];
        int v13 = [v11 isEqual:v12];

        if (!v13) {
          goto LABEL_35;
        }
      }
      uint64_t v6 = [(HKFHIRResource *)self resourceType];
      uint64_t v15 = [(HKFHIRResource *)v5 resourceType];
      if (v6 == (void *)v15)
      {
      }
      else
      {
        uint64_t v8 = (void *)v15;
        uint64_t v16 = [(HKFHIRResource *)v5 resourceType];
        if (!v16) {
          goto LABEL_34;
        }
        id v17 = (void *)v16;
        id v18 = [(HKFHIRResource *)self resourceType];
        id v19 = [(HKFHIRResource *)v5 resourceType];
        int v20 = [v18 isEqual:v19];

        if (!v20) {
          goto LABEL_35;
        }
      }
      uint64_t v6 = [(HKFHIRResource *)self identifier];
      uint64_t v21 = [(HKFHIRResource *)v5 identifier];
      if (v6 == (void *)v21)
      {
      }
      else
      {
        uint64_t v8 = (void *)v21;
        uint64_t v22 = [(HKFHIRResource *)v5 identifier];
        if (!v22) {
          goto LABEL_34;
        }
        v23 = (void *)v22;
        uint64_t v24 = [(HKFHIRResource *)self identifier];
        v25 = [(HKFHIRResource *)v5 identifier];
        int v26 = [v24 isEqual:v25];

        if (!v26) {
          goto LABEL_35;
        }
      }
      uint64_t v6 = [(HKFHIRResource *)self data];
      uint64_t v27 = [(HKFHIRResource *)v5 data];
      if (v6 == (void *)v27)
      {
      }
      else
      {
        uint64_t v8 = (void *)v27;
        uint64_t v28 = [(HKFHIRResource *)v5 data];
        if (!v28) {
          goto LABEL_34;
        }
        v29 = (void *)v28;
        uint64_t v30 = [(HKFHIRResource *)self data];
        v31 = [(HKFHIRResource *)v5 data];
        int v32 = [v30 isEqual:v31];

        if (!v32) {
          goto LABEL_35;
        }
      }
      uint64_t v6 = [(HKFHIRResource *)self sourceURL];
      uint64_t v33 = [(HKFHIRResource *)v5 sourceURL];
      if (v6 == (void *)v33)
      {
      }
      else
      {
        uint64_t v8 = (void *)v33;
        uint64_t v34 = [(HKFHIRResource *)v5 sourceURL];
        if (!v34) {
          goto LABEL_34;
        }
        v35 = (void *)v34;
        v36 = [(HKFHIRResource *)self sourceURL];
        v37 = [(HKFHIRResource *)v5 sourceURL];
        int v38 = [v36 isEqual:v37];

        if (!v38) {
          goto LABEL_35;
        }
      }
      uint64_t v6 = [(HKFHIRResource *)self lastUpdatedDate];
      uint64_t v39 = [(HKFHIRResource *)v5 lastUpdatedDate];
      if (v6 == (void *)v39)
      {

LABEL_39:
        BOOL v14 = 1;
        goto LABEL_36;
      }
      uint64_t v8 = (void *)v39;
      uint64_t v40 = [(HKFHIRResource *)v5 lastUpdatedDate];
      if (v40)
      {
        v41 = (void *)v40;
        v42 = [(HKFHIRResource *)self lastUpdatedDate];
        v43 = [(HKFHIRResource *)v5 lastUpdatedDate];
        char v44 = [v42 isEqual:v43];

        if (v44) {
          goto LABEL_39;
        }
LABEL_35:
        BOOL v14 = 0;
LABEL_36:

        goto LABEL_37;
      }
LABEL_34:

      goto LABEL_35;
    }
    BOOL v14 = 0;
  }
LABEL_37:

  return v14;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFHIRResource)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FHIRVersion"];
  if (!v5)
  {
    long long v14 = xmmword_19C3D3F70;
    uint64_t v15 = 2;
    v5 = [[HKFHIRVersion alloc] initWithSemanticVersion:&v14];
  }
  uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ResourceType"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Identifier"];
  uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Data"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SourceURL"];
  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4F1CB10] URLWithString:v9];
    if (!v10) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  v11 = (void *)MEMORY[0x1E4F1C9C8];
  [v4 decodeDoubleForKey:@"LastUpdatedDate"];
  uint64_t v12 = objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
  self = [(HKFHIRResource *)self initWithResourceType:v6 identifier:v7 FHIRVersion:v5 data:v8 sourceURL:v10 lastUpdatedDate:v12];

  uint64_t v10 = self;
LABEL_8:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  id v12 = a3;
  id v4 = [(HKFHIRResource *)self FHIRVersion];
  [v12 encodeObject:v4 forKey:@"FHIRVersion"];

  v5 = [(HKFHIRResource *)self resourceType];
  [v12 encodeObject:v5 forKey:@"ResourceType"];

  uint64_t v6 = [(HKFHIRResource *)self identifier];
  [v12 encodeObject:v6 forKey:@"Identifier"];

  uint64_t v7 = [(HKFHIRResource *)self data];
  [v12 encodeObject:v7 forKey:@"Data"];

  uint64_t v8 = [(HKFHIRResource *)self sourceURL];

  if (v8)
  {
    uint64_t v9 = [(HKFHIRResource *)self sourceURL];
    uint64_t v10 = [v9 absoluteString];
    [v12 encodeObject:v10 forKey:@"SourceURL"];
  }
  v11 = [(HKFHIRResource *)self lastUpdatedDate];
  [v11 timeIntervalSinceReferenceDate];
  objc_msgSend(v12, "encodeDouble:forKey:", @"LastUpdatedDate");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastUpdatedDate, 0);
  objc_storeStrong((id *)&self->_sourceURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_resourceType, 0);

  objc_storeStrong((id *)&self->_FHIRVersion, 0);
}

@end