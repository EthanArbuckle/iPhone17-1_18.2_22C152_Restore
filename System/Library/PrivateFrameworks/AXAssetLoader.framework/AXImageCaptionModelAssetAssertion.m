@interface AXImageCaptionModelAssetAssertion
+ (id)assertionWithPropertyListRepresentation:(id)a3 error:(id *)a4;
+ (id)assertionsWithPropertyListRepresentations:(id)a3;
+ (void)partitionAssertionsWithPropertyListRepresentations:(id)a3 intoVersionLockedAssertions:(id)a4 upgradableAssertions:(id)a5;
- (NSNumber)maximumCompatibilityVersion;
- (NSNumber)minimumCompatibilityVersion;
- (NSString)assetType;
- (NSString)clientIdentifier;
- (NSString)description;
- (NSString)modelLanguage;
- (NSString)modelStage;
- (NSString)modelVersion;
- (id)propertyListRepresentation;
- (unint64_t)assertionType;
- (void)setAssertionType:(unint64_t)a3;
- (void)setClientIdentifier:(id)a3;
- (void)setMaximumCompatibilityVersion:(id)a3;
- (void)setMinimumCompatibilityVersion:(id)a3;
- (void)setModelLanguage:(id)a3;
- (void)setModelStage:(id)a3;
- (void)setModelVersion:(id)a3;
@end

@implementation AXImageCaptionModelAssetAssertion

+ (void)partitionAssertionsWithPropertyListRepresentations:(id)a3 intoVersionLockedAssertions:(id)a4 upgradableAssertions:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v7);
        }
        v14 = +[AXImageCaptionModelAssetAssertion assertionWithPropertyListRepresentation:*(void *)(*((void *)&v19 + 1) + 8 * v13) error:0];
        v15 = v14;
        if (v14)
        {
          uint64_t v16 = [v14 assertionType];
          v17 = v8;
          if (!v16 || (uint64_t v18 = [v15 assertionType], v17 = v9, v18 == 1)) {
            [v17 addObject:v15];
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }
}

+ (id)assertionsWithPropertyListRepresentations:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = +[AXImageCaptionModelAssetAssertion assertionWithPropertyListRepresentation:error:](AXImageCaptionModelAssetAssertion, "assertionWithPropertyListRepresentation:error:", *(void *)(*((void *)&v12 + 1) + 8 * i), 0, (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (NSString)assetType
{
  return (NSString *)@"com.apple.MobileAsset.ImageCaptionModel";
}

+ (id)assertionWithPropertyListRepresentation:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = objc_alloc_init(AXImageCaptionModelAssetAssertion);
  uint64_t v6 = [v4 objectForKey:@"clientIdentifier"];
  [(AXImageCaptionModelAssetAssertion *)v5 setClientIdentifier:v6];

  uint64_t v7 = [v4 objectForKey:@"minimumCompatibilityVersion"];
  [(AXImageCaptionModelAssetAssertion *)v5 setMinimumCompatibilityVersion:v7];

  uint64_t v8 = [v4 objectForKey:@"maximumCompatibilityVersion"];
  [(AXImageCaptionModelAssetAssertion *)v5 setMaximumCompatibilityVersion:v8];

  id v9 = [v4 objectForKey:@"modelStage"];
  [(AXImageCaptionModelAssetAssertion *)v5 setModelStage:v9];

  uint64_t v10 = [v4 objectForKey:@"modelVersion"];
  [(AXImageCaptionModelAssetAssertion *)v5 setModelVersion:v10];

  uint64_t v11 = [v4 objectForKey:@"modelLanguage"];
  [(AXImageCaptionModelAssetAssertion *)v5 setModelLanguage:v11];

  long long v12 = [v4 objectForKey:@"assertionType"];

  -[AXImageCaptionModelAssetAssertion setAssertionType:](v5, "setAssertionType:", [v12 unsignedIntegerValue]);
  return v5;
}

- (id)propertyListRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  clientIdentifier = self->_clientIdentifier;
  if (clientIdentifier) {
    [v3 setObject:clientIdentifier forKeyedSubscript:@"clientIdentifier"];
  }
  minimumCompatibilityVersion = self->_minimumCompatibilityVersion;
  if (minimumCompatibilityVersion) {
    [v4 setObject:minimumCompatibilityVersion forKeyedSubscript:@"minimumCompatibilityVersion"];
  }
  maximumCompatibilityVersion = self->_maximumCompatibilityVersion;
  if (maximumCompatibilityVersion) {
    [v4 setObject:maximumCompatibilityVersion forKeyedSubscript:@"maximumCompatibilityVersion"];
  }
  modelStage = self->_modelStage;
  if (modelStage) {
    [v4 setObject:modelStage forKeyedSubscript:@"modelStage"];
  }
  modelVersion = self->_modelVersion;
  if (modelVersion) {
    [v4 setObject:modelVersion forKeyedSubscript:@"modelVersion"];
  }
  modelLanguage = self->_modelLanguage;
  if (modelLanguage) {
    [v4 setObject:modelLanguage forKeyedSubscript:@"modelLanguage"];
  }
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:self->_assertionType];
  [v4 setObject:v11 forKeyedSubscript:@"assertionType"];

  return v4;
}

- (NSString)description
{
  id v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)AXImageCaptionModelAssetAssertion;
  id v4 = [(AXImageCaptionModelAssetAssertion *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@ Owner:%@ Type:%lu CompatVers:[%@ - %@] Model:[%@ %@ %@]", v4, self->_clientIdentifier, self->_assertionType, self->_minimumCompatibilityVersion, self->_maximumCompatibilityVersion, self->_modelVersion, self->_modelStage, self->_modelLanguage];

  return (NSString *)v5;
}

- (unint64_t)assertionType
{
  return self->_assertionType;
}

- (void)setAssertionType:(unint64_t)a3
{
  self->_assertionType = a3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
}

- (NSNumber)minimumCompatibilityVersion
{
  return self->_minimumCompatibilityVersion;
}

- (void)setMinimumCompatibilityVersion:(id)a3
{
}

- (NSNumber)maximumCompatibilityVersion
{
  return self->_maximumCompatibilityVersion;
}

- (void)setMaximumCompatibilityVersion:(id)a3
{
}

- (NSString)modelVersion
{
  return self->_modelVersion;
}

- (void)setModelVersion:(id)a3
{
}

- (NSString)modelLanguage
{
  return self->_modelLanguage;
}

- (void)setModelLanguage:(id)a3
{
}

- (NSString)modelStage
{
  return self->_modelStage;
}

- (void)setModelStage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelStage, 0);
  objc_storeStrong((id *)&self->_modelLanguage, 0);
  objc_storeStrong((id *)&self->_modelVersion, 0);
  objc_storeStrong((id *)&self->_maximumCompatibilityVersion, 0);
  objc_storeStrong((id *)&self->_minimumCompatibilityVersion, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
}

@end