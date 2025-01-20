@interface ENRegionServerExposureConfiguration
+ (BOOL)supportsSecureCoding;
- (BOOL)enableRecursiveReportType;
- (BOOL)matchingRestrictedToRegion;
- (ENRegionServerExposureConfiguration)initWithCoder:(id)a3;
- (ENRegionServerExposureConfiguration)initWithServerResponseDictionary:(id)a3;
- (NSArray)classificationCriteria;
- (NSDictionary)exposureConfigurationValues;
- (NSString)appBundleIdentifier;
- (double)privacyParameterInputCandenceInterval;
- (id)classificationCriteriaForName:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ENRegionServerExposureConfiguration

- (ENRegionServerExposureConfiguration)initWithServerResponseDictionary:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v41 = 0;
    goto LABEL_25;
  }
  v5 = [v4 objectForKeyedSubscript:@"config"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v50.receiver = self;
    v50.super_class = (Class)ENRegionServerExposureConfiguration;
    v6 = [(ENRegionServerExposureConfiguration *)&v50 init];
    if (v6)
    {
      v45 = v6;
      int v49 = 0;
      CFStringGetTypeID();
      id v46 = v4;
      v44 = CFDictionaryGetTypedValue();
      id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      for (uint64_t i = 0; i != 36; i += 3)
      {
        v9 = initWithServerResponseDictionary__exposureConfigurationDefinitions[i];
        v10 = initWithServerResponseDictionary__exposureConfigurationDefinitions[i + 1];
        v11 = NSDictionaryGetNSNumber();
        [v7 setObject:v11 forKeyedSubscript:v10];
      }
      id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      uint64_t Int64 = CFDictionaryGetInt64();
      v48[0] = MEMORY[0x263EF8330];
      v48[1] = 3221225472;
      v48[2] = __72__ENRegionServerExposureConfiguration_initWithServerResponseDictionary___block_invoke;
      v48[3] = &unk_264244BF0;
      v48[4] = v12;
      v48[5] = Int64;
      v14 = (void (**)(void, void, void))MEMORY[0x2166BC8A0](v48);
      uint64_t v15 = 0;
      for (uint64_t j = -14; j != 15; ++j)
      {
        v14[2](v14, j, v15);
        v15 += 2;
      }
      v14[2](v14, 0x7FFFFFFFFFFFFFFFLL, 58);
      v43 = v12;
      v17 = (void *)[v12 copy];
      v18 = v7;
      [v7 setObject:v17 forKeyedSubscript:@"infectiousnessForDaysSinceOnsetOfSymptoms"];

      id v19 = objc_alloc_init(MEMORY[0x263EFF980]);
      for (uint64_t k = 0; k != 48; k += 16)
      {
        v21 = *(__CFString **)((char *)&initWithServerResponseDictionary__attenuationDurationDefinitions + k);
        uint64_t v22 = *((unsigned __int8 *)&initWithServerResponseDictionary__attenuationDurationDefinitions + k + 8);
        unsigned __int8 Int64Ranged = CFDictionaryGetInt64Ranged();
        if (v49) {
          [NSNumber numberWithUnsignedChar:v22];
        }
        else {
        v24 = [NSNumber numberWithUnsignedChar:Int64Ranged];
        }
        [v19 addObject:v24];
      }
      v25 = (void *)[v19 copy];
      [v7 setObject:v25 forKeyedSubscript:@"attenuationDurationThresholds"];

      id v26 = objc_alloc_init(MEMORY[0x263EFF980]);
      unsigned __int8 v27 = 1;
      do
      {
        v28 = (void *)MEMORY[0x2166BC6F0]();
        id v47 = 0;
        BOOL v29 = +[ENRegionServerExposureClassificationCriteria getCriteria:&v47 fromDictionary:v5 index:v27];
        id v30 = v47;
        if (!v29)
        {

          v41 = 0;
          v32 = v44;
          self = v45;
          goto LABEL_23;
        }
        if (v30) {
          [v26 addObject:v30];
        }

        unsigned int v31 = v27++;
      }
      while (v31 <= 3);
      v32 = v44;
      uint64_t v33 = [v44 copy];
      self = v45;
      appBundleIdentifier = v45->_appBundleIdentifier;
      v45->_appBundleIdentifier = (NSString *)v33;

      uint64_t v35 = [v26 copy];
      classificationCriteria = v45->_classificationCriteria;
      v45->_classificationCriteria = (NSArray *)v35;

      uint64_t v37 = [v18 copy];
      exposureConfigurationValues = v45->_exposureConfigurationValues;
      v45->_exposureConfigurationValues = (NSDictionary *)v37;

      v45->_enableRecursiveReportType = CFDictionaryGetInt64() != 0;
      int v39 = 86400 * (unsigned __int16)CFDictionaryGetInt64Ranged();
      if (v49) {
        int v40 = 604800;
      }
      else {
        int v40 = v39;
      }
      v45->_privacyParameterInputCandenceInterval = (double)v40;
      v45->_matchingRestrictedToRegion = CFDictionaryGetInt64() != 0;
      v41 = v45;
LABEL_23:

      id v4 = v46;
      goto LABEL_24;
    }
    self = 0;
  }
  v41 = 0;
LABEL_24:

LABEL_25:
  return v41;
}

void __72__ENRegionServerExposureConfiguration_initWithServerResponseDictionary___block_invoke(uint64_t a1, uint64_t a2, char a3)
{
  if (((*(void *)(a1 + 40) >> a3) & 3) - 1 <= 1)
  {
    objc_msgSend(NSNumber, "numberWithUnsignedInt:");
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    v5 = *(void **)(a1 + 32);
    v6 = [NSNumber numberWithInteger:a2];
    [v5 setObject:v7 forKeyedSubscript:v6];
  }
}

- (id)classificationCriteriaForName:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v5 = [(ENRegionServerExposureConfiguration *)self classificationCriteria];
  id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        v10 = [v9 classificationName];
        char v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (ENRegionServerExposureConfiguration)initWithCoder:(id)a3
{
  id v4 = a3;
  if (![v4 containsValueForKey:@"cfgv"])
  {
    v10 = (void *)MEMORY[0x263EFFA78];
LABEL_5:
    if ([v4 containsValueForKey:@"clsf"])
    {
      id v12 = objc_alloc(MEMORY[0x263EFFA08]);
      uint64_t v13 = objc_opt_class();
      char v11 = (ENRegionServerExposureConfiguration *)objc_msgSend(v12, "initWithObjects:", v13, objc_opt_class(), 0);
      long long v14 = [v4 decodeObjectOfClasses:v11 forKey:@"clsf"];

      if (!v11)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else
    {
      long long v14 = (void *)MEMORY[0x263EFFA68];
    }
    v19.receiver = self;
    v19.super_class = (Class)ENRegionServerExposureConfiguration;
    self = [(ENRegionServerExposureConfiguration *)&v19 init];
    if (self)
    {
      long long v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"appBundleId"];
      appBundleIdentifier = self->_appBundleIdentifier;
      self->_appBundleIdentifier = v15;

      objc_storeStrong((id *)&self->_classificationCriteria, v14);
      objc_storeStrong((id *)&self->_exposureConfigurationValues, v10);
      self->_enableRecursiveReportType = [v4 decodeBoolForKey:@"enableRecursiveType"];
      [v4 decodeDoubleForKey:@"privacyParameterInputCandence"];
      self->_privacyParameterInputCandenceInterval = v17;
      self->_matchingRestrictedToRegion = [v4 decodeBoolForKey:@"isMatchingRestrictedRegion"];
      self = self;
      char v11 = self;
    }
    else
    {
      char v11 = 0;
    }
    goto LABEL_12;
  }
  id v5 = objc_alloc(MEMORY[0x263EFFA08]);
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  v9 = objc_msgSend(v5, "initWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v10 = [v4 decodeObjectOfClasses:v9 forKey:@"cfgv"];

  if (v10) {
    goto LABEL_5;
  }
  char v11 = 0;
LABEL_13:

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  appBundleIdentifier = self->_appBundleIdentifier;
  id v5 = a3;
  [v5 encodeObject:appBundleIdentifier forKey:@"appBundleId"];
  [v5 encodeObject:self->_classificationCriteria forKey:@"clsf"];
  [v5 encodeObject:self->_exposureConfigurationValues forKey:@"cfgv"];
  [v5 encodeBool:self->_enableRecursiveReportType forKey:@"enableRecursiveType"];
  [v5 encodeDouble:@"privacyParameterInputCandence" forKey:self->_privacyParameterInputCandenceInterval];
  [v5 encodeBool:self->_matchingRestrictedToRegion forKey:@"isMatchingRestrictedRegion"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (NSArray)classificationCriteria
{
  return self->_classificationCriteria;
}

- (NSDictionary)exposureConfigurationValues
{
  return self->_exposureConfigurationValues;
}

- (BOOL)enableRecursiveReportType
{
  return self->_enableRecursiveReportType;
}

- (BOOL)matchingRestrictedToRegion
{
  return self->_matchingRestrictedToRegion;
}

- (double)privacyParameterInputCandenceInterval
{
  return self->_privacyParameterInputCandenceInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exposureConfigurationValues, 0);
  objc_storeStrong((id *)&self->_classificationCriteria, 0);

  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
}

@end