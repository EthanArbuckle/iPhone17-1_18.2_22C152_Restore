@interface HRERecommendation
+ (id)highestRankInRecommendations:(id)a3;
- (BOOL)containsMeaningfulChanges;
- (BOOL)containsRecommendableContent;
- (BOOL)includesObjects:(id)a3;
- (HMCharacteristic)splitCharacteristic;
- (HMHome)home;
- (HMRoom)room;
- (HMZone)zone;
- (HREIdentifierBuilder)identifierBuilder;
- (HRERecommendation)initWithHome:(id)a3;
- (HRERecommendation)initWithHome:(id)a3 uniqueIdentifier:(id)a4;
- (HRETemplate)sourceTemplate;
- (NADescriptionBuilder)descriptionBuilder;
- (NSArray)roomsToFilterHomeObjects;
- (NSDictionary)analyticsData;
- (NSMutableDictionary)defaultAnalyticsData;
- (NSMutableDictionary)userInfo;
- (NSString)uniqueIdentifier;
- (double)rankModifier;
- (double)rankingConfidenceScore;
- (double)sortingPriority;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)involvedObjects;
- (id)splitUsingSplitCharacteristics:(id)a3;
- (id)splitUsingSplitStrategy:(unint64_t)a3 inHome:(id)a4;
- (unint64_t)numberOfEnabledRecommendationsForTemplate;
- (void)setDefaultAnalyticsData:(id)a3;
- (void)setIdentifierBuilder:(id)a3;
- (void)setNumberOfEnabledRecommendationsForTemplate:(unint64_t)a3;
- (void)setRankModifier:(double)a3;
- (void)setRankingConfidenceScore:(double)a3 rankVersion:(int64_t)a4;
- (void)setRoom:(id)a3;
- (void)setSortingPriority:(double)a3;
- (void)setSourceTemplate:(id)a3;
- (void)setSplitCharacteristic:(id)a3;
- (void)setZone:(id)a3;
@end

@implementation HRERecommendation

- (HRERecommendation)initWithHome:(id)a3 uniqueIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)HRERecommendation;
  v9 = [(HRERecommendation *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_home, a3);
    objc_storeStrong((id *)&v10->_uniqueIdentifier, a4);
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    defaultAnalyticsData = v10->_defaultAnalyticsData;
    v10->_defaultAnalyticsData = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x263EFF9A0] dictionary];
    userInfo = v10->_userInfo;
    v10->_userInfo = (NSMutableDictionary *)v13;

    v10->_rankModifier = 0.0;
    [(HRERecommendation *)v10 setRankingConfidenceScore:-1 rankVersion:0.0];
  }

  return v10;
}

- (HRERecommendation)initWithHome:(id)a3
{
  return [(HRERecommendation *)self initWithHome:a3 uniqueIdentifier:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  v5 = [(HRERecommendation *)self home];
  v6 = (void *)[v4 initWithHome:v5 uniqueIdentifier:self->_uniqueIdentifier];

  [(HRERecommendation *)self rankingConfidenceScore];
  v6[4] = v7;
  id v8 = [(HRERecommendation *)self userInfo];
  uint64_t v9 = [v8 mutableCopy];
  v10 = (void *)v6[6];
  v6[6] = v9;

  uint64_t v11 = [(HRERecommendation *)self identifierBuilder];
  v12 = (void *)[v11 copy];
  [v6 setIdentifierBuilder:v12];

  [(HRERecommendation *)self rankModifier];
  objc_msgSend(v6, "setRankModifier:");
  [(HRERecommendation *)self sortingPriority];
  objc_msgSend(v6, "setSortingPriority:");
  uint64_t v13 = [(HRERecommendation *)self defaultAnalyticsData];
  v14 = (void *)[v13 mutableCopy];
  [v6 setDefaultAnalyticsData:v14];

  return v6;
}

- (NSString)uniqueIdentifier
{
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier)
  {
    v3 = uniqueIdentifier;
  }
  else
  {
    id v4 = [(HRERecommendation *)self identifierBuilder];
    v3 = [v4 composedString];
  }

  return v3;
}

- (BOOL)containsMeaningfulChanges
{
  return 0;
}

- (BOOL)containsRecommendableContent
{
  return 0;
}

- (BOOL)includesObjects:(id)a3
{
  return 1;
}

- (id)involvedObjects
{
  return (id)[MEMORY[0x263EFFA08] set];
}

- (NADescriptionBuilder)descriptionBuilder
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = [(HRERecommendation *)self uniqueIdentifier];
  [v3 appendString:v4 withName:@"uniqueIdentifier"];

  [(HRERecommendation *)self rankingConfidenceScore];
  id v5 = (id)objc_msgSend(v3, "appendDouble:withName:decimalPrecision:", @"rankingConfidenceScore", 2);

  return (NADescriptionBuilder *)v3;
}

- (id)description
{
  v2 = [(HRERecommendation *)self descriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (void)setRankingConfidenceScore:(double)a3 rankVersion:(int64_t)a4
{
  self->_rankingConfidenceScore = a3;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithDouble:");
  id v8 = [(HRERecommendation *)self defaultAnalyticsData];
  [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x263F478A0]];

  uint64_t v9 = [NSNumber numberWithDouble:round(a3)];
  v10 = [(HRERecommendation *)self defaultAnalyticsData];
  [v10 setObject:v9 forKeyedSubscript:*MEMORY[0x263F47898]];

  id v12 = [NSNumber numberWithInteger:a4];
  uint64_t v11 = [(HRERecommendation *)self defaultAnalyticsData];
  [v11 setObject:v12 forKeyedSubscript:*MEMORY[0x263F478A8]];
}

- (void)setSortingPriority:(double)a3
{
  self->_sortingPriority = a3;
}

- (NSDictionary)analyticsData
{
  v2 = [(HRERecommendation *)self defaultAnalyticsData];
  v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

+ (id)highestRankInRecommendations:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    double v7 = -5.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        [v9 rankingConfidenceScore];
        if (v10 > v7)
        {
          [v9 rankingConfidenceScore];
          double v7 = v11;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v5);
  }
  else
  {
    double v7 = -5.0;
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __50__HRERecommendation_highestRankInRecommendations___block_invoke;
  v14[3] = &__block_descriptor_40_e27_B16__0__HRERecommendation_8l;
  *(double *)&v14[4] = v7;
  id v12 = objc_msgSend(v3, "na_filter:", v14);

  return v12;
}

BOOL __50__HRERecommendation_highestRankInRecommendations___block_invoke(uint64_t a1, void *a2)
{
  [a2 rankingConfidenceScore];
  return v3 == *(double *)(a1 + 32);
}

- (HREIdentifierBuilder)identifierBuilder
{
  return self->identifierBuilder;
}

- (void)setIdentifierBuilder:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (double)rankingConfidenceScore
{
  return self->_rankingConfidenceScore;
}

- (double)sortingPriority
{
  return self->_sortingPriority;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (NSMutableDictionary)defaultAnalyticsData
{
  return self->_defaultAnalyticsData;
}

- (void)setDefaultAnalyticsData:(id)a3
{
}

- (double)rankModifier
{
  return self->_rankModifier;
}

- (void)setRankModifier:(double)a3
{
  self->_rankModifier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultAnalyticsData, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->identifierBuilder, 0);

  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
}

- (HMRoom)room
{
  objc_opt_class();
  double v3 = [(HRERecommendation *)self userInfo];
  uint64_t v4 = [v3 objectForKeyedSubscript:@"room"];
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return (HMRoom *)v6;
}

- (void)setRoom:(id)a3
{
  id v4 = a3;
  id v5 = [(HRERecommendation *)self userInfo];
  [v5 setObject:v4 forKeyedSubscript:@"room"];
}

- (HMZone)zone
{
  objc_opt_class();
  double v3 = [(HRERecommendation *)self userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"zone"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return (HMZone *)v6;
}

- (void)setZone:(id)a3
{
  id v4 = a3;
  id v5 = [(HRERecommendation *)self userInfo];
  [v5 setObject:v4 forKeyedSubscript:@"zone"];
}

- (NSArray)roomsToFilterHomeObjects
{
  v8[1] = *MEMORY[0x263EF8340];
  double v3 = [(HRERecommendation *)self room];

  if (v3)
  {
    id v4 = [(HRERecommendation *)self room];
    v8[0] = v4;
    uint64_t v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v8 count:1];
  }
  else
  {
    id v4 = [(HRERecommendation *)self zone];
    uint64_t v5 = [v4 rooms];
  }
  id v6 = (void *)v5;

  return (NSArray *)v6;
}

- (HMCharacteristic)splitCharacteristic
{
  objc_opt_class();
  double v3 = [(HRERecommendation *)self userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"splitCharacteristic"];
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;

  return (HMCharacteristic *)v6;
}

- (void)setSplitCharacteristic:(id)a3
{
  id v4 = a3;
  id v5 = [(HRERecommendation *)self userInfo];
  [v5 setObject:v4 forKeyedSubscript:@"splitCharacteristic"];
}

- (HRETemplate)sourceTemplate
{
  objc_opt_class();
  double v3 = [(HRERecommendation *)self userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"template"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return (HRETemplate *)v6;
}

- (void)setSourceTemplate:(id)a3
{
  id v4 = a3;
  id v5 = [(HRERecommendation *)self userInfo];
  [v5 setObject:v4 forKeyedSubscript:@"template"];
}

- (unint64_t)numberOfEnabledRecommendationsForTemplate
{
  objc_opt_class();
  double v3 = [(HRERecommendation *)self userInfo];
  id v4 = [v3 objectForKeyedSubscript:@"numberOfEnabledRecommendationsForTemplate"];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6) {
    unint64_t v7 = [v6 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 0;
  }

  return v7;
}

- (void)setNumberOfEnabledRecommendationsForTemplate:(unint64_t)a3
{
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v4 = [(HRERecommendation *)self userInfo];
  [v4 setObject:v5 forKeyedSubscript:@"numberOfEnabledRecommendationsForTemplate"];
}

- (id)splitUsingSplitStrategy:(unint64_t)a3 inHome:(id)a4
{
  v21[1] = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = v7;
  if (a3)
  {
    if (a3 == 2)
    {
      long long v16 = (void *)MEMORY[0x263EFFA08];
      double v11 = [v7 zones];
      v19[0] = MEMORY[0x263EF8330];
      v19[1] = 3221225472;
      v19[2] = __71__HRERecommendation_TemplateAdditions__splitUsingSplitStrategy_inHome___block_invoke_2;
      v19[3] = &unk_264CF48B8;
      v19[4] = self;
      long long v17 = objc_msgSend(v11, "na_map:", v19);
      id v4 = [v16 setWithArray:v17];

      goto LABEL_10;
    }
    if (a3 != 1) {
      goto LABEL_11;
    }
    uint64_t v9 = (void *)MEMORY[0x263EFF9C0];
    double v10 = [v7 rooms];
    double v11 = [v9 setWithArray:v10];

    id v12 = [v8 roomForEntireHome];

    if (v12)
    {
      uint64_t v13 = [v8 roomForEntireHome];
      [v11 addObject:v13];
    }
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __71__HRERecommendation_TemplateAdditions__splitUsingSplitStrategy_inHome___block_invoke;
    v20[3] = &unk_264CF4890;
    v20[4] = self;
    uint64_t v14 = objc_msgSend(v11, "na_map:", v20);
  }
  else
  {
    long long v15 = (void *)MEMORY[0x263EFFA08];
    v21[0] = self;
    double v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:1];
    uint64_t v14 = [v15 setWithArray:v11];
  }
  id v4 = (void *)v14;
LABEL_10:

LABEL_11:

  return v4;
}

id __71__HRERecommendation_TemplateAdditions__splitUsingSplitStrategy_inHome___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (void *)[v2 copy];
  [v4 setRoom:v3];
  id v5 = [v4 identifierBuilder];
  id v6 = [v3 uniqueIdentifier];

  id v7 = [v6 UUIDString];
  [v5 setObject:v7 forKey:@"room"];

  return v4;
}

id __71__HRERecommendation_TemplateAdditions__splitUsingSplitStrategy_inHome___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (void *)[v2 copy];
  [v4 setZone:v3];
  id v5 = [v4 identifierBuilder];
  id v6 = [v3 uniqueIdentifier];

  id v7 = [v6 UUIDString];
  [v5 setObject:v7 forKey:@"zone"];

  return v4;
}

- (id)splitUsingSplitCharacteristics:(id)a3
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __71__HRERecommendation_TemplateAdditions__splitUsingSplitCharacteristics___block_invoke;
  v5[3] = &unk_264CF48E0;
  v5[4] = self;
  id v3 = objc_msgSend(a3, "na_map:", v5);

  return v3;
}

id __71__HRERecommendation_TemplateAdditions__splitUsingSplitCharacteristics___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = (void *)[v2 copy];
  [v4 setSplitCharacteristic:v3];
  id v5 = [v4 identifierBuilder];
  id v6 = [v3 uniqueIdentifier];

  id v7 = [v6 UUIDString];
  [v5 setObject:v7 forKey:@"splitCharacteristic"];

  return v4;
}

@end