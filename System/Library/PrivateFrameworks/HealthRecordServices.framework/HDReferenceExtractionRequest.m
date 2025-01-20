@interface HDReferenceExtractionRequest
+ (BOOL)supportsSecureCoding;
- (HDReferenceExtractionRequest)initWithCoder:(id)a3;
- (HDReferenceExtractionRequest)initWithResources:(id)a3 FHIRResourceData:(id)a4 serverBaseURL:(id)a5;
- (NSArray)FHIRResourceData;
- (NSArray)resources;
- (NSString)FHIRRelease;
- (NSURL)serverBaseURL;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDReferenceExtractionRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  resources = self->_resources;
  id v5 = a3;
  [v5 encodeObject:resources forKey:@"Resources"];
  [v5 encodeObject:self->_FHIRResourceData forKey:@"FHIRResourceData"];
  [v5 encodeObject:self->_serverBaseURL forKey:@"ServerBaseURL"];
  [v5 encodeObject:self->_FHIRRelease forKey:@"FHIRRelease"];
}

- (HDReferenceExtractionRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
  v6 = [v4 decodeObjectOfClasses:v5 forKey:@"Resources"];
  v7 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
  v8 = [v4 decodeObjectOfClasses:v7 forKey:@"FHIRResourceData"];
  uint64_t v9 = [v6 count];
  if (v9 + [v8 count])
  {
    v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ServerBaseURL"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"FHIRRelease"];
    v13 = (void *)v12;
    if (v11 && v12)
    {
      v19.receiver = self;
      v19.super_class = (Class)HDReferenceExtractionRequest;
      v14 = [(HDReferenceExtractionRequest *)&v19 init];
      v15 = v14;
      if (v14)
      {
        objc_storeStrong((id *)&v14->_resources, v6);
        objc_storeStrong((id *)&v15->_FHIRResourceData, v8);
        objc_storeStrong((id *)&v15->_serverBaseURL, v11);
        uint64_t v16 = HKFHIRReleaseFromNSString();
        FHIRRelease = v15->_FHIRRelease;
        v15->_FHIRRelease = (NSString *)v16;
      }
      self = v15;
      v10 = self;
    }
    else
    {
      objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
      v10 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "hrs_failWithCocoaInvalidValueError");
    v10 = 0;
  }

  return v10;
}

- (HDReferenceExtractionRequest)initWithResources:(id)a3 FHIRResourceData:(id)a4 serverBaseURL:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v8 count];
  if (v11 + [v9 count])
  {
    v13 = objc_msgSend(v8, "hk_mapToSet:", &__block_literal_global_7);
    v14 = v13;
    if (v13)
    {
      id v15 = v13;
    }
    else
    {
      id v15 = [MEMORY[0x263EFFA08] set];
    }
    uint64_t v16 = v15;

    v17 = objc_msgSend(v9, "hk_mapToSet:", &__block_literal_global_296);
    v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v19 = [MEMORY[0x263EFFA08] set];
    }
    v20 = v19;

    v21 = [v16 setByAddingObjectsFromSet:v20];
    if ((unint64_t)[v21 count] <= 1)
    {
      v32.receiver = self;
      v32.super_class = (Class)HDReferenceExtractionRequest;
      v22 = [(HDReferenceExtractionRequest *)&v32 init];
      if (v22)
      {
        uint64_t v23 = [v8 copy];
        resources = v22->_resources;
        v22->_resources = (NSArray *)v23;

        uint64_t v25 = [v9 copy];
        FHIRResourceData = v22->_FHIRResourceData;
        v22->_FHIRResourceData = (NSArray *)v25;

        uint64_t v27 = [v10 copy];
        serverBaseURL = v22->_serverBaseURL;
        v22->_serverBaseURL = (NSURL *)v27;

        uint64_t v29 = [v21 anyObject];
        FHIRRelease = v22->_FHIRRelease;
        v22->_FHIRRelease = (NSString *)v29;
      }
      self = v22;
      uint64_t v12 = self;
    }
    else
    {
      uint64_t v12 = 0;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

id __81__HDReferenceExtractionRequest_initWithResources_FHIRResourceData_serverBaseURL___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 FHIRVersion];
  v3 = [v2 FHIRRelease];

  return v3;
}

id __81__HDReferenceExtractionRequest_initWithResources_FHIRResourceData_serverBaseURL___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = [a2 FHIRVersion];
  v3 = [v2 FHIRRelease];

  return v3;
}

- (NSArray)resources
{
  return self->_resources;
}

- (NSArray)FHIRResourceData
{
  return self->_FHIRResourceData;
}

- (NSURL)serverBaseURL
{
  return self->_serverBaseURL;
}

- (NSString)FHIRRelease
{
  return self->_FHIRRelease;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_FHIRRelease, 0);
  objc_storeStrong((id *)&self->_serverBaseURL, 0);
  objc_storeStrong((id *)&self->_FHIRResourceData, 0);

  objc_storeStrong((id *)&self->_resources, 0);
}

@end