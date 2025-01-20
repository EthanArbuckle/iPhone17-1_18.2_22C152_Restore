@interface HKFHIRResourceDownloadRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKClinicalIngestionContext)context;
- (HKFHIRResourceDownloadRequest)initWithCoder:(id)a3;
- (HKFHIRResourceDownloadRequest)initWithResourceType:(id)a3 resourceSchemaDefinition:(id)a4 fullRequestURL:(id)a5 context:(id)a6;
- (NSDictionary)resourceSchemaDefinition;
- (NSString)resourceType;
- (NSURL)fullRequestURL;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFHIRResourceDownloadRequest

- (HKFHIRResourceDownloadRequest)initWithResourceType:(id)a3 resourceSchemaDefinition:(id)a4 fullRequestURL:(id)a5 context:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)HKFHIRResourceDownloadRequest;
  v14 = [(HKFHIRResourceDownloadRequest *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    resourceType = v14->_resourceType;
    v14->_resourceType = (NSString *)v15;

    uint64_t v17 = [v11 copy];
    resourceSchemaDefinition = v14->_resourceSchemaDefinition;
    v14->_resourceSchemaDefinition = (NSDictionary *)v17;

    uint64_t v19 = [v12 copy];
    fullRequestURL = v14->_fullRequestURL;
    v14->_fullRequestURL = (NSURL *)v19;

    uint64_t v21 = [v13 copy];
    context = v14->_context;
    v14->_context = (HKClinicalIngestionContext *)v21;
  }
  return v14;
}

- (BOOL)isEqual:(id)a3
{
  v6 = (HKFHIRResourceDownloadRequest *)a3;
  v7 = v6;
  if (self != v6)
  {
    v8 = v6;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      char v14 = 0;
LABEL_40:

      goto LABEL_41;
    }
    resourceType = self->_resourceType;
    id v10 = [(HKFHIRResourceDownloadRequest *)v8 resourceType];
    if (resourceType != v10)
    {
      uint64_t v11 = [(HKFHIRResourceDownloadRequest *)v8 resourceType];
      if (!v11)
      {
        char v14 = 0;
        goto LABEL_39;
      }
      v3 = (void *)v11;
      id v12 = self->_resourceType;
      id v13 = [(HKFHIRResourceDownloadRequest *)v8 resourceType];
      if (![(NSString *)v12 isEqualToString:v13])
      {
        char v14 = 0;
LABEL_38:

        goto LABEL_39;
      }
      v43 = v13;
    }
    resourceSchemaDefinition = self->_resourceSchemaDefinition;
    v16 = [(HKFHIRResourceDownloadRequest *)v8 resourceSchemaDefinition];
    if (resourceSchemaDefinition == v16)
    {
      v42 = resourceSchemaDefinition;
    }
    else
    {
      uint64_t v17 = [(HKFHIRResourceDownloadRequest *)v8 resourceSchemaDefinition];
      if (!v17)
      {
        char v14 = 0;
        goto LABEL_36;
      }
      v18 = (void *)v17;
      v42 = resourceSchemaDefinition;
      uint64_t v19 = self->_resourceSchemaDefinition;
      v4 = [(HKFHIRResourceDownloadRequest *)v8 resourceSchemaDefinition];
      if (([(NSDictionary *)v19 isEqual:v4] & 1) == 0)
      {

        char v14 = 0;
        goto LABEL_37;
      }
      v38 = v18;
    }
    fullRequestURL = self->_fullRequestURL;
    uint64_t v21 = [(HKFHIRResourceDownloadRequest *)v8 fullRequestURL];
    v41 = v4;
    if (fullRequestURL == v21)
    {
      v39 = v3;
      v40 = fullRequestURL;
    }
    else
    {
      uint64_t v22 = [(HKFHIRResourceDownloadRequest *)v8 fullRequestURL];
      if (!v22)
      {
        char v14 = 0;
LABEL_33:

LABEL_34:
        if (v42 != v16)
        {
LABEL_35:
        }
LABEL_36:

LABEL_37:
        id v13 = v43;
        if (resourceType != v10) {
          goto LABEL_38;
        }
LABEL_39:

        goto LABEL_40;
      }
      v40 = fullRequestURL;
      v37 = (void *)v22;
      v23 = self->_fullRequestURL;
      uint64_t v24 = [(HKFHIRResourceDownloadRequest *)v8 fullRequestURL];
      v25 = v23;
      v26 = (void *)v24;
      if (([(NSURL *)v25 isEqual:v24] & 1) == 0)
      {

        char v14 = 0;
        goto LABEL_34;
      }
      v35 = v26;
      v39 = v3;
    }
    context = self->_context;
    uint64_t v28 = [(HKFHIRResourceDownloadRequest *)v8 context];
    char v14 = context == (HKClinicalIngestionContext *)v28;
    if (context == (HKClinicalIngestionContext *)v28)
    {
    }
    else
    {
      v29 = (void *)v28;
      uint64_t v30 = [(HKFHIRResourceDownloadRequest *)v8 context];
      if (v30)
      {
        v31 = (void *)v30;
        v32 = self->_context;
        v33 = [(HKFHIRResourceDownloadRequest *)v8 context];
        char v14 = [(HKClinicalIngestionContext *)v32 isEqual:v33];

        if (v40 == v21)
        {

LABEL_44:
          v3 = v39;
          if (v42 == v16) {
            goto LABEL_36;
          }
          goto LABEL_35;
        }

LABEL_42:
        goto LABEL_44;
      }
    }
    if (v40 == v21) {
      goto LABEL_42;
    }

    v3 = v39;
    goto LABEL_33;
  }
  char v14 = 1;
LABEL_41:

  return v14;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  resourceType = self->_resourceType;
  v7 = HKStringFromBool();
  v8 = [v3 stringWithFormat:@"<%@ %p, resource type: %@, has full request URL: %@>", v5, self, resourceType, v7];

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  resourceType = self->_resourceType;
  id v5 = a3;
  [v5 encodeObject:resourceType forKey:@"resourceType"];
  [v5 encodeObject:self->_resourceSchemaDefinition forKey:@"resourceSchemaDefinition"];
  [v5 encodeObject:self->_fullRequestURL forKey:@"fullRequestURL"];
  [v5 encodeObject:self->_context forKey:@"context"];
}

- (HKFHIRResourceDownloadRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"resourceType"];
  v6 = objc_msgSend(MEMORY[0x263F08900], "hk_JSONObjectSecureCodingClasses");
  v7 = [v4 decodeObjectOfClasses:v6 forKey:@"resourceSchemaDefinition"];

  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"fullRequestURL"];
  uint64_t v9 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"context"];
  id v10 = (void *)v9;
  if (v5) {
    BOOL v11 = v9 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    id v12 = 0;
  }
  else
  {
    self = [(HKFHIRResourceDownloadRequest *)self initWithResourceType:v5 resourceSchemaDefinition:v7 fullRequestURL:v8 context:v9];
    id v12 = self;
  }

  return v12;
}

- (NSString)resourceType
{
  return self->_resourceType;
}

- (NSDictionary)resourceSchemaDefinition
{
  return self->_resourceSchemaDefinition;
}

- (NSURL)fullRequestURL
{
  return self->_fullRequestURL;
}

- (HKClinicalIngestionContext)context
{
  return self->_context;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_fullRequestURL, 0);
  objc_storeStrong((id *)&self->_resourceSchemaDefinition, 0);

  objc_storeStrong((id *)&self->_resourceType, 0);
}

@end