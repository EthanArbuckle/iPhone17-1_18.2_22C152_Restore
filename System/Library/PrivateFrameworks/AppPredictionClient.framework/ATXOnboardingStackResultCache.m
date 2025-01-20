@interface ATXOnboardingStackResultCache
+ (BOOL)supportsSecureCoding;
- (ATXOnboardingStackResult)heavyBatteryDrainResult;
- (ATXOnboardingStackResult)lightBatteryDrainResult;
- (ATXOnboardingStackResult)mediumBatteryDrainResult;
- (ATXOnboardingStackResult)unknownBatteryDrainResult;
- (ATXOnboardingStackResultCache)initWithCoder:(id)a3;
- (ATXOnboardingStackResultCache)initWithUnknownBatteryDrainResult:(id)a3 lightBatteryDrainResult:(id)a4 mediumBatteryDrainResult:(id)a5 heavyBatteryDrainResult:(id)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (id)resultForClassification:(unint64_t)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setHeavyBatteryDrainResult:(id)a3;
- (void)setLightBatteryDrainResult:(id)a3;
- (void)setMediumBatteryDrainResult:(id)a3;
- (void)setUnknownBatteryDrainResult:(id)a3;
@end

@implementation ATXOnboardingStackResultCache

- (ATXOnboardingStackResultCache)initWithUnknownBatteryDrainResult:(id)a3 lightBatteryDrainResult:(id)a4 mediumBatteryDrainResult:(id)a5 heavyBatteryDrainResult:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)ATXOnboardingStackResultCache;
  v15 = [(ATXOnboardingStackResultCache *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_unknownBatteryDrainResult, a3);
    objc_storeStrong((id *)&v16->_lightBatteryDrainResult, a4);
    objc_storeStrong((id *)&v16->_mediumBatteryDrainResult, a5);
    objc_storeStrong((id *)&v16->_heavyBatteryDrainResult, a6);
  }

  return v16;
}

- (id)resultForClassification:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      self = [(ATXOnboardingStackResultCache *)self unknownBatteryDrainResult];
      goto LABEL_9;
    case 1uLL:
      self = [(ATXOnboardingStackResultCache *)self lightBatteryDrainResult];
      goto LABEL_9;
    case 2uLL:
      self = [(ATXOnboardingStackResultCache *)self mediumBatteryDrainResult];
      goto LABEL_9;
    case 3uLL:
      self = [(ATXOnboardingStackResultCache *)self heavyBatteryDrainResult];
LABEL_9:
      break;
    default:
      break;
  }
  return self;
}

- (ATXOnboardingStackResultCache)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"unknownBatteryDrainResult"];
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lightBatteryDrainResult"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"mediumBatteryDrainResult"];
  v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"heavyBatteryDrainResult"];

  if (v5) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9 || v7 == 0 || v8 == 0) {
    id v12 = 0;
  }
  else {
    id v12 = (ATXOnboardingStackResultCache *)[objc_alloc((Class)objc_opt_class()) initWithUnknownBatteryDrainResult:v5 lightBatteryDrainResult:v6 mediumBatteryDrainResult:v7 heavyBatteryDrainResult:v8];
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  unknownBatteryDrainResult = self->_unknownBatteryDrainResult;
  id v5 = a3;
  [v5 encodeObject:unknownBatteryDrainResult forKey:@"unknownBatteryDrainResult"];
  [v5 encodeObject:self->_lightBatteryDrainResult forKey:@"lightBatteryDrainResult"];
  [v5 encodeObject:self->_mediumBatteryDrainResult forKey:@"mediumBatteryDrainResult"];
  [v5 encodeObject:self->_heavyBatteryDrainResult forKey:@"heavyBatteryDrainResult"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  unknownBatteryDrainResult = self->_unknownBatteryDrainResult;
  lightBatteryDrainResult = self->_lightBatteryDrainResult;
  mediumBatteryDrainResult = self->_mediumBatteryDrainResult;
  heavyBatteryDrainResult = self->_heavyBatteryDrainResult;

  return (id)[v4 initWithUnknownBatteryDrainResult:unknownBatteryDrainResult lightBatteryDrainResult:lightBatteryDrainResult mediumBatteryDrainResult:mediumBatteryDrainResult heavyBatteryDrainResult:heavyBatteryDrainResult];
}

- (ATXOnboardingStackResult)unknownBatteryDrainResult
{
  return self->_unknownBatteryDrainResult;
}

- (void)setUnknownBatteryDrainResult:(id)a3
{
}

- (ATXOnboardingStackResult)lightBatteryDrainResult
{
  return self->_lightBatteryDrainResult;
}

- (void)setLightBatteryDrainResult:(id)a3
{
}

- (ATXOnboardingStackResult)mediumBatteryDrainResult
{
  return self->_mediumBatteryDrainResult;
}

- (void)setMediumBatteryDrainResult:(id)a3
{
}

- (ATXOnboardingStackResult)heavyBatteryDrainResult
{
  return self->_heavyBatteryDrainResult;
}

- (void)setHeavyBatteryDrainResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_heavyBatteryDrainResult, 0);
  objc_storeStrong((id *)&self->_mediumBatteryDrainResult, 0);
  objc_storeStrong((id *)&self->_lightBatteryDrainResult, 0);

  objc_storeStrong((id *)&self->_unknownBatteryDrainResult, 0);
}

@end