@interface DYMTLDeviceProfile
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)supportsCapabilitiesOfGraphicsAPI:(id)a3;
- (DYMTLDeviceProfile)initWithCoder:(id)a3;
- (DYMTLDeviceProfile)initWithDevice:(id)a3;
- (NSArray)supportedFeatureSets;
- (NSArray)supportedGPUFamilies;
- (NSDictionary)defaultSamplePositions;
- (NSNumber)registryID;
- (NSString)capturableObjectType;
- (NSString)description;
- (NSString)descriptionForBugReport;
- (NSString)displayName;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)streamRef;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DYMTLDeviceProfile

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DYMTLDeviceProfile)initWithCoder:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)DYMTLDeviceProfile;
  v5 = [(DYMTLDeviceProfile *)&v29 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"name"];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"registryID"];
    registryID = v5->_registryID;
    v5->_registryID = (NSNumber *)v8;

    v5->_streamRef = [v4 decodeInt64ForKey:@"streamRef"];
    v10 = (void *)MEMORY[0x263EFFA08];
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"supportedFeatureSets"];
    supportedFeatureSets = v5->_supportedFeatureSets;
    v5->_supportedFeatureSets = (NSArray *)v13;

    v15 = (void *)MEMORY[0x263EFFA08];
    uint64_t v16 = objc_opt_class();
    v17 = objc_msgSend(v15, "setWithObjects:", v16, objc_opt_class(), 0);
    uint64_t v18 = [v4 decodeObjectOfClasses:v17 forKey:@"supportedGPUFamilies"];
    supportedGPUFamilies = v5->_supportedGPUFamilies;
    v5->_supportedGPUFamilies = (NSArray *)v18;

    v20 = (void *)MEMORY[0x263EFFA08];
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    uint64_t v23 = objc_opt_class();
    v24 = objc_msgSend(v20, "setWithObjects:", v21, v22, v23, objc_opt_class(), 0);
    uint64_t v25 = [v4 decodeObjectOfClasses:v24 forKey:@"defaultSamplePositions"];
    defaultSamplePositions = v5->_defaultSamplePositions;
    v5->_defaultSamplePositions = (NSDictionary *)v25;

    v27 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_name forKey:@"name"];
  [v4 encodeInt64:self->_streamRef forKey:@"streamRef"];
  [v4 encodeObject:self->_supportedFeatureSets forKey:@"supportedFeatureSets"];
  [v4 encodeObject:self->_supportedGPUFamilies forKey:@"supportedGPUFamilies"];
  [v4 encodeObject:self->_defaultSamplePositions forKey:@"defaultSamplePositions"];
  [v4 encodeObject:self->_registryID forKey:@"registryID"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_opt_new();
  if (v4)
  {
    uint64_t v5 = [(NSString *)self->_name copy];
    uint64_t v6 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v5;

    *(void *)(v4 + 8) = self->_streamRef;
    uint64_t v7 = [(NSArray *)self->_supportedFeatureSets copy];
    uint64_t v8 = *(void **)(v4 + 16);
    *(void *)(v4 + 16) = v7;

    uint64_t v9 = [(NSDictionary *)self->_defaultSamplePositions copy];
    v10 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = v9;

    objc_storeStrong((id *)(v4 + 48), self->_registryID);
    id v11 = (id)v4;
  }

  return (id)v4;
}

- (BOOL)supportsCapabilitiesOfGraphicsAPI:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x2020000000;
    char v15 = 1;
    id v5 = v4;
    uint64_t v6 = [v5 supportedGPUFamilies];

    if (v6)
    {
      uint64_t v7 = [v5 supportedGPUFamilies];
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __56__DYMTLDeviceProfile_supportsCapabilitiesOfGraphicsAPI___block_invoke;
      v11[3] = &unk_2653C2EE0;
      v11[4] = self;
      v11[5] = &v12;
      [v7 enumerateObjectsUsingBlock:v11];
    }
    else
    {
      uint64_t v7 = [v5 supportedFeatureSets];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __56__DYMTLDeviceProfile_supportsCapabilitiesOfGraphicsAPI___block_invoke_2;
      v10[3] = &unk_2653C2EE0;
      v10[4] = self;
      v10[5] = &v12;
      [v7 enumerateObjectsUsingBlock:v10];
    }

    BOOL v8 = *((unsigned char *)v13 + 24) != 0;
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

uint64_t __56__DYMTLDeviceProfile_supportsCapabilitiesOfGraphicsAPI___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 24) containsObject:a2];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

uint64_t __56__DYMTLDeviceProfile_supportsCapabilitiesOfGraphicsAPI___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) containsObject:a2];
  if ((result & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
  return result;
}

- (DYMTLDeviceProfile)initWithDevice:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)DYMTLDeviceProfile;
  id v5 = [(DYMTLDeviceProfile *)&v35 init];
  if (v5)
  {
    uint64_t v6 = [v4 name];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "registryID"));
    registryID = v5->_registryID;
    v5->_registryID = (NSNumber *)v8;

    v10 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    supportedFeatureSets = v5->_supportedFeatureSets;
    v5->_supportedFeatureSets = v10;

    uint64_t v12 = (NSArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    supportedGPUFamilies = v5->_supportedGPUFamilies;
    v5->_supportedGPUFamilies = v12;

    for (uint64_t i = 0; i != 17; ++i)
    {
      uint64_t v15 = -[DYMTLDeviceProfile initWithDevice:]::availableFeatures[i];
      if ([v4 supportsFeatureSet:v15])
      {
        uint64_t v16 = v5->_supportedFeatureSets;
        v17 = [NSNumber numberWithUnsignedLongLong:v15];
        [(NSArray *)v16 addObject:v17];
      }
    }
    if (objc_opt_respondsToSelector())
    {
      for (uint64_t j = 0; j != 18; ++j)
      {
        uint64_t v19 = -[DYMTLDeviceProfile initWithDevice:]::availableGPUFamilies[j];
        if ([v4 supportsFamily:v19])
        {
          v20 = v5->_supportedGPUFamilies;
          uint64_t v21 = [NSNumber numberWithUnsignedLongLong:v19];
          [(NSArray *)v20 addObject:v21];
        }
      }
    }
    else
    {
      uint64_t v22 = v5->_supportedGPUFamilies;
      v5->_supportedGPUFamilies = 0;
    }
    v34 = [MEMORY[0x263EFF9A0] dictionary];
    if (objc_opt_respondsToSelector())
    {
      for (size_t k = 1; k <= [v4 maxCustomSamplePositions]; ++k)
      {
        if ([v4 supportsTextureSampleCount:k])
        {
          v24 = (float *)malloc_type_calloc(k, 8uLL, 0x100004000313F17uLL);
          [v4 getDefaultSamplePositions:v24 count:k];
          id v25 = objc_alloc_init(MEMORY[0x263EFF980]);
          if (k)
          {
            v26 = v24 + 1;
            size_t v27 = k;
            do
            {
              v28 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGPoint:", *(v26 - 1), *v26);
              [v25 addObject:v28];

              v26 += 2;
              --v27;
            }
            while (v27);
          }
          free(v24);
          objc_super v29 = [MEMORY[0x263EFF8C0] arrayWithArray:v25];
          v30 = [NSNumber numberWithUnsignedInteger:k];
          [v34 setObject:v29 forKey:v30];
        }
      }
    }
    uint64_t v31 = [NSDictionary dictionaryWithDictionary:v34];
    defaultSamplePositions = v5->_defaultSamplePositions;
    v5->_defaultSamplePositions = (NSDictionary *)v31;
  }
  return v5;
}

- (NSString)description
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  v3 = NSString;
  v31.receiver = self;
  v31.super_class = (Class)DYMTLDeviceProfile;
  id v4 = [(DYMTLDeviceProfile *)&v31 description];
  id v5 = [v3 stringWithFormat:@"%@ name=%@ featureProfile=", v4, self->_name];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v6 = self->_supportedFeatureSets;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v28;
    do
    {
      uint64_t v9 = 0;
      v10 = v5;
      do
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(NSString, "stringWithFormat:", @"%lu ", objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v9), "unsignedLongValue"));
        id v5 = [v10 stringByAppendingString:v11];

        ++v9;
        v10 = v5;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v27 objects:v33 count:16];
    }
    while (v7);
  }

  id v22 = [NSString stringWithFormat:@"%@", v5];
  if (self->_supportedGPUFamilies)
  {
    uint64_t v12 = [NSString stringWithFormat:@"GPUFamilies="];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v13 = self->_supportedGPUFamilies;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v24;
      do
      {
        uint64_t v16 = 0;
        v17 = v12;
        do
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%lu ", objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v16), "unsignedLongValue"));
          uint64_t v12 = [v17 stringByAppendingString:v18];

          ++v16;
          v17 = v12;
        }
        while (v14 != v16);
        uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v23 objects:v32 count:16];
      }
      while (v14);
    }

    uint64_t v19 = [NSString stringWithFormat:@"%@", v12];
    uint64_t v20 = [v22 stringByAppendingString:v19];

    id v22 = (id)v20;
  }

  return (NSString *)v22;
}

- (NSString)descriptionForBugReport
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263F089D8]);
  [v3 appendFormat:@"Metal device: %@\n", self->_name];
  if (self->_supportedGPUFamilies)
  {
    [v3 appendString:@"    Supported GPU families:"];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v4 = self->_supportedGPUFamilies;
    uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = objc_msgSend(NSString, "stringWithUTF8String:", GPUTools::MTL::GetMTLGPUFamilyAsString((GPUTools::MTL *)objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "unsignedLongLongValue"), 1));
          [v3 appendFormat:@" %@", v8];
        }
        uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
  return (NSString *)v3;
}

- (NSString)displayName
{
  return self->_name;
}

- (NSString)capturableObjectType
{
  return (NSString *)(id)*MEMORY[0x263F3FA60];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    registryID = self->_registryID;
    if (registryID) {
      char v8 = [(NSNumber *)registryID isEqual:v4[6]];
    }
    else {
      char v8 = [(NSString *)self->_name isEqualToString:v4[5]];
    }
    BOOL v6 = v8;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)streamRef
{
  return self->_streamRef;
}

- (NSArray)supportedFeatureSets
{
  return self->_supportedFeatureSets;
}

- (NSArray)supportedGPUFamilies
{
  return self->_supportedGPUFamilies;
}

- (NSDictionary)defaultSamplePositions
{
  return self->_defaultSamplePositions;
}

- (NSString)name
{
  return self->_name;
}

- (NSNumber)registryID
{
  return self->_registryID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registryID, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_defaultSamplePositions, 0);
  objc_storeStrong((id *)&self->_supportedGPUFamilies, 0);
  objc_storeStrong((id *)&self->_supportedFeatureSets, 0);
}

@end