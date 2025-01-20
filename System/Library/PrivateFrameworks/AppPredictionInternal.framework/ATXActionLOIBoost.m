@interface ATXActionLOIBoost
+ (double)decayRateWithScale:(double)a3 distance:(double)a4;
+ (id)sharedInstance;
- (ATXActionLOIBoost)initWithBoostDictionary:(id)a3;
- (double)boostForActionKey:(id)a3;
@end

@implementation ATXActionLOIBoost

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_7 != -1) {
    dispatch_once(&sharedInstance_onceToken_7, &__block_literal_global_161);
  }
  v2 = (void *)sharedInstance_instance_2;
  return v2;
}

void __35__ATXActionLOIBoost_sharedInstance__block_invoke()
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F4AF10]) initWithAssetsForResource:@"ATXActionLOIBoost" ofType:@"plist"];
  v1 = [v0 abGroupContents];

  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v15;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v14 + 1) + 8 * v7);
        v9 = [ATXBoostObject alloc];
        v10 = objc_msgSend(v3, "objectForKeyedSubscript:", v8, (void)v14);
        v11 = [(ATXBoostObject *)v9 initWithDictionary:v10];
        [v2 setObject:v11 forKeyedSubscript:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }

  v12 = [[ATXActionLOIBoost alloc] initWithBoostDictionary:v2];
  v13 = (void *)sharedInstance_instance_2;
  sharedInstance_instance_2 = (uint64_t)v12;
}

+ (double)decayRateWithScale:(double)a3 distance:(double)a4
{
  double result = 0.0;
  if (a3 > 0.0 && a4 >= 0.0)
  {
    double v6 = a4 / (a3 + a3);
    if (v6 >= 0.5)
    {
      if (v6 < 1.0) {
        return (1.0 - v6) * (1.0 - v6 + 1.0 - v6);
      }
    }
    else
    {
      return 0.5 - v6 * v6 + 0.5 - v6 * v6;
    }
  }
  return result;
}

- (ATXActionLOIBoost)initWithBoostDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXActionLOIBoost;
  double v6 = [(ATXActionLOIBoost *)&v9 init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_boostDictionary, a3);
  }

  return v7;
}

- (double)boostForActionKey:(id)a3
{
  id v3 = [(NSDictionary *)self->_boostDictionary objectForKeyedSubscript:a3];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F935D0] sharedInstance];
    [v4 distanceFromHomeOfCurrentLocationInMeters];
    [v4 distanceFromWorkOfCurrentLocationInMeters];
    [v4 distanceFromGymOfCurrentLocationInMeters];
    [v4 distanceFromSchoolOfCurrentLocationInMeters];
    [v3 homeBoost];
    double v6 = v5;
    [v3 homeScale];
    +[ATXActionLOIBoost decayRateWithScale:distance:](ATXActionLOIBoost, "decayRateWithScale:distance:");
    double v8 = v6 * v7;
    [v3 workBoost];
    double v10 = v9;
    [v3 workScale];
    +[ATXActionLOIBoost decayRateWithScale:distance:](ATXActionLOIBoost, "decayRateWithScale:distance:");
    double v12 = v10 * v11;
    [v3 gymBoost];
    double v14 = v13;
    [v3 gymScale];
    +[ATXActionLOIBoost decayRateWithScale:distance:](ATXActionLOIBoost, "decayRateWithScale:distance:");
    double v16 = v14 * v15;
    [v3 schoolBoost];
    double v18 = v17;
    [v3 schoolScale];
    +[ATXActionLOIBoost decayRateWithScale:distance:](ATXActionLOIBoost, "decayRateWithScale:distance:");
    double v20 = v8 + v12 + v16 + v18 * v19;
  }
  else
  {
    double v20 = 0.0;
  }

  return v20;
}

- (void).cxx_destruct
{
}

@end