@interface HDClinicalDataCollectionExtractionResult
+ (BOOL)supportsSecureCoding;
- (HDClinicalDataCollectionExtractionResult)initWithCoder:(id)a3;
- (HDClinicalDataCollectionExtractionResult)initWithRedactedResources:(id)a3 rulesVersion:(id)a4;
- (NSArray)redactedResources;
- (NSNumber)rulesVersion;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HDClinicalDataCollectionExtractionResult

- (HDClinicalDataCollectionExtractionResult)initWithRedactedResources:(id)a3 rulesVersion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(HDClinicalDataCollectionExtractionResult *)self init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    redactedResources = v8->_redactedResources;
    v8->_redactedResources = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    rulesVersion = v8->_rulesVersion;
    v8->_rulesVersion = (NSNumber *)v11;
  }
  return v8;
}

- (HDClinicalDataCollectionExtractionResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_msgSend(MEMORY[0x263EFFA08], "hk_typesForArrayOf:", objc_opt_class());
  id v6 = [v4 decodeObjectOfClasses:v5 forKey:@"RedactedResources"];
  uint64_t v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"RulesVersion"];
  v8 = (void *)v7;
  if (v6) {
    BOOL v9 = v7 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    objc_msgSend(v4, "hrs_failWithCocoaValueNotFoundError");
    v10 = 0;
  }
  else
  {
    self = [(HDClinicalDataCollectionExtractionResult *)self initWithRedactedResources:v6 rulesVersion:v7];
    v10 = self;
  }

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  redactedResources = self->_redactedResources;
  id v5 = a3;
  [v5 encodeObject:redactedResources forKey:@"RedactedResources"];
  [v5 encodeObject:self->_rulesVersion forKey:@"RulesVersion"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)redactedResources
{
  return self->_redactedResources;
}

- (NSNumber)rulesVersion
{
  return self->_rulesVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rulesVersion, 0);

  objc_storeStrong((id *)&self->_redactedResources, 0);
}

@end