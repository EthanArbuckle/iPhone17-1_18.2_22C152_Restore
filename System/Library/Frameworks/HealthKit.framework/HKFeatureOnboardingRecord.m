@interface HKFeatureOnboardingRecord
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isOnboardingPresent;
- (HKFeatureOnboardingRecord)initWithCoder:(id)a3;
- (HKFeatureOnboardingRecord)initWithOnboardingState:(int64_t)a3 onboardingCompletion:(id)a4 featureSettings:(id)a5;
- (HKFeatureOnboardingRecord)initWithOnboardingState:(int64_t)a3 onboardingCompletionsByState:(id)a4 featureSettings:(id)a5;
- (HKFeatureSettings)featureSettings;
- (HKOnboardingCompletion)onboardingCompletion;
- (NSArray)allOnboardingCompletionsRegardlessOfSupportedState;
- (NSDate)earliestDateOfAnyOnboardingCompletion;
- (NSDictionary)onboardingCompletionsByState;
- (NSSet)allOnboardedCountryCodesRegardlessOfSupportedState;
- (NSSet)onboardedCountryCodesForOnboardingState;
- (id)description;
- (int64_t)onboardingState;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFeatureOnboardingRecord

- (HKFeatureOnboardingRecord)initWithOnboardingState:(int64_t)a3 onboardingCompletion:(id)a4 featureSettings:(id)a5
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (v8)
  {
    v9 = NSNumber;
    id v10 = a5;
    v11 = [v9 numberWithInteger:a3];
    v21 = v11;
    v12 = (void *)[v8 copy];
    v20 = v12;
    v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    v22[0] = v13;
    v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
    v15 = [(HKFeatureOnboardingRecord *)self initWithOnboardingState:a3 onboardingCompletionsByState:v14 featureSettings:v10];

    v16 = v15;
  }
  else
  {
    id v17 = a5;
    v18 = [(HKFeatureOnboardingRecord *)self initWithOnboardingState:a3 onboardingCompletionsByState:MEMORY[0x1E4F1CC08] featureSettings:v17];

    v16 = v18;
  }

  return v16;
}

- (HKFeatureOnboardingRecord)initWithOnboardingState:(int64_t)a3 onboardingCompletionsByState:(id)a4 featureSettings:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v17.receiver = self;
  v17.super_class = (Class)HKFeatureOnboardingRecord;
  id v10 = [(HKFeatureOnboardingRecord *)&v17 init];
  v11 = v10;
  if (v10)
  {
    v10->_onboardingState = a3;
    uint64_t v12 = [v8 copy];
    onboardingCompletionsByState = v11->_onboardingCompletionsByState;
    v11->_onboardingCompletionsByState = (NSDictionary *)v12;

    uint64_t v14 = [v9 copy];
    featureSettings = v11->_featureSettings;
    v11->_featureSettings = (HKFeatureSettings *)v14;
  }
  return v11;
}

- (HKOnboardingCompletion)onboardingCompletion
{
  onboardingCompletionsByState = self->_onboardingCompletionsByState;
  v3 = [NSNumber numberWithInteger:self->_onboardingState];
  v4 = [(NSDictionary *)onboardingCompletionsByState objectForKeyedSubscript:v3];
  v5 = [v4 firstObject];

  return (HKOnboardingCompletion *)v5;
}

- (NSDate)earliestDateOfAnyOnboardingCompletion
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = [(NSDictionary *)self->_onboardingCompletionsByState allValues];
  uint64_t v2 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    v4 = 0;
    uint64_t v5 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        id v8 = v7;
        uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v9)
        {
          uint64_t v10 = v9;
          uint64_t v11 = *(void *)v19;
          do
          {
            for (uint64_t j = 0; j != v10; ++j)
            {
              if (*(void *)v19 != v11) {
                objc_enumerationMutation(v8);
              }
              uint64_t v13 = [*(id *)(*((void *)&v18 + 1) + 8 * j) completionDate];
              uint64_t v14 = (void *)v13;
              if (v4)
              {
                uint64_t v15 = [v4 earlierDate:v13];

                v4 = (void *)v15;
              }
              else
              {
                v4 = (void *)v13;
              }
            }
            uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v10);
        }
      }
      uint64_t v3 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return (NSDate *)v4;
}

- (BOOL)isOnboardingPresent
{
  return self->_onboardingState != 1;
}

- (NSSet)onboardedCountryCodesForOnboardingState
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  onboardingCompletionsByState = self->_onboardingCompletionsByState;
  v4 = [NSNumber numberWithInteger:self->_onboardingState];
  uint64_t v5 = [(NSDictionary *)onboardingCompletionsByState objectForKeyedSubscript:v4];
  v6 = objc_msgSend(v5, "hk_map:", &__block_literal_global_60);
  v7 = [v2 setWithArray:v6];

  return (NSSet *)v7;
}

uint64_t __68__HKFeatureOnboardingRecord_onboardedCountryCodesForOnboardingState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 countryCode];
}

- (NSSet)allOnboardedCountryCodesRegardlessOfSupportedState
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v4 = [(NSDictionary *)self->_onboardingCompletionsByState allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "hk_map:", &__block_literal_global_11);
        [v3 addObjectsFromArray:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];

  return (NSSet *)v10;
}

uint64_t __79__HKFeatureOnboardingRecord_allOnboardedCountryCodesRegardlessOfSupportedState__block_invoke(uint64_t a1, void *a2)
{
  return [a2 countryCode];
}

- (NSArray)allOnboardingCompletionsRegardlessOfSupportedState
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v4 = [(NSDictionary *)self->_onboardingCompletionsByState allValues];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        [v3 addObjectsFromArray:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }

  uint64_t v9 = (void *)[v3 copy];

  return (NSArray *)v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HKFeatureOnboardingRecord;
  if (![(HKFeatureOnboardingRecord *)&v12 isEqual:v4])
  {
    if (![v4 isMemberOfClass:objc_opt_class()])
    {
      char v5 = 0;
      goto LABEL_14;
    }
    uint64_t v6 = v4;
    if (self->_onboardingState != v6[2]) {
      goto LABEL_12;
    }
    onboardingCompletionsByState = self->_onboardingCompletionsByState;
    id v8 = (NSDictionary *)v6[3];
    if (onboardingCompletionsByState != v8
      && (!v8 || !-[NSDictionary isEqual:](onboardingCompletionsByState, "isEqual:")))
    {
      goto LABEL_12;
    }
    featureSettings = self->_featureSettings;
    uint64_t v10 = (HKFeatureSettings *)v6[1];
    if (featureSettings == v10)
    {
      char v5 = 1;
      goto LABEL_13;
    }
    if (v10) {
      char v5 = -[HKFeatureSettings isEqual:](featureSettings, "isEqual:");
    }
    else {
LABEL_12:
    }
      char v5 = 0;
LABEL_13:

    goto LABEL_14;
  }
  char v5 = 1;
LABEL_14:

  return v5;
}

- (unint64_t)hash
{
  int64_t onboardingState = self->_onboardingState;
  uint64_t v4 = [(NSDictionary *)self->_onboardingCompletionsByState hash] ^ onboardingState;
  return v4 ^ [(HKFeatureSettings *)self->_featureSettings hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@:%p completionsByState:%@ settings:%@>", objc_opt_class(), self, self->_onboardingCompletionsByState, self->_featureSettings];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HKFeatureOnboardingRecord)initWithCoder:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKFeatureOnboardingRecord;
  char v5 = [(HKFeatureOnboardingRecord *)&v16 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"featureSettings"];
    featureSettings = v5->_featureSettings;
    v5->_featureSettings = (HKFeatureSettings *)v6;

    id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    objc_super v12 = objc_msgSend(v8, "initWithObjects:", v9, v10, v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"onboardingCompletionsByState"];
    onboardingCompletionsByState = v5->_onboardingCompletionsByState;
    v5->_onboardingCompletionsByState = (NSDictionary *)v13;

    v5->_int64_t onboardingState = [v4 decodeIntegerForKey:@"onboardingState"];
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  featureSettings = self->_featureSettings;
  id v5 = a3;
  [v5 encodeObject:featureSettings forKey:@"featureSettings"];
  [v5 encodeObject:self->_onboardingCompletionsByState forKey:@"onboardingCompletionsByState"];
  [v5 encodeInteger:self->_onboardingState forKey:@"onboardingState"];
}

- (HKFeatureSettings)featureSettings
{
  return self->_featureSettings;
}

- (int64_t)onboardingState
{
  return self->_onboardingState;
}

- (NSDictionary)onboardingCompletionsByState
{
  return self->_onboardingCompletionsByState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingCompletionsByState, 0);

  objc_storeStrong((id *)&self->_featureSettings, 0);
}

@end