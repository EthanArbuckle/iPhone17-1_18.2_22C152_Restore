@interface HDRedactedFHIRResourceObject
+ (BOOL)supportsSecureCoding;
+ (id)resourceObjectWithFHIRJSONObject:(id)a3 redactedJSONObject:(id)a4 error:(id *)a5;
- (HDRedactedFHIRResourceObject)initWithCoder:(id)a3;
- (NSString)resourceType;
- (id)_initWithResourceType:(id)a3 sourceURL:(id)a4 FHIRVersion:(id)a5 JSONObject:(id)a6;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDRedactedFHIRResourceObject

- (id)_initWithResourceType:(id)a3 sourceURL:(id)a4 FHIRVersion:(id)a5 JSONObject:(id)a6
{
  id v10 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HDRedactedFHIRResourceObject;
  v11 = [(HDFHIRJSONObject *)&v15 initWithJSONObject:a6 sourceURL:a4 FHIRVersion:a5];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    resourceType = v11->_resourceType;
    v11->_resourceType = (NSString *)v12;
  }
  return v11;
}

+ (id)resourceObjectWithFHIRJSONObject:(id)a3 redactedJSONObject:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 detectedResourceType];
  if (v10)
  {
    v11 = objc_msgSend(v9, "hk_safeStringForKeyPath:error:", @"id", a5);
    if (v11)
    {
      objc_msgSend(MEMORY[0x263F087E8], "hk_assignError:code:description:", a5, 3, @"Redacted FHIR resource cannot contain \"id\" in JSON");
      uint64_t v12 = 0;
    }
    else
    {
      id v13 = objc_alloc((Class)a1);
      v14 = [v8 sourceURL];
      objc_super v15 = [v8 FHIRVersion];
      uint64_t v12 = (void *)[v13 _initWithResourceType:v10 sourceURL:v14 FHIRVersion:v15 JSONObject:v9];
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)HDRedactedFHIRResourceObject;
  id v4 = a3;
  [(HDFHIRJSONObject *)&v6 encodeWithCoder:v4];
  v5 = [(HDRedactedFHIRResourceObject *)self resourceType];
  [v4 encodeObject:v5 forKey:@"ResourceType"];
}

- (HDRedactedFHIRResourceObject)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ResourceType"];
  if (v5)
  {
    v9.receiver = self;
    v9.super_class = (Class)HDRedactedFHIRResourceObject;
    objc_super v6 = [(HDFHIRJSONObject *)&v9 initWithCoder:v4];

    if (v6) {
      objc_storeStrong((id *)&v6->_resourceType, v5);
    }
    self = v6;
    v7 = self;
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");

    v7 = 0;
  }

  return v7;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  resourceType = self->_resourceType;
  v7 = [(HDFHIRJSONObject *)self FHIRVersion];
  id v8 = [v3 stringWithFormat:@"<%@: %@, %@>", v5, resourceType, v7];

  return v8;
}

- (NSString)resourceType
{
  return self->_resourceType;
}

- (void).cxx_destruct
{
}

@end