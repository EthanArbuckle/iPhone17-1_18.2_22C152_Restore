@interface HFPresenceEventBuilder
+ (id)_selectedUsersForPresenceEvent:(id)a3;
- (HFPresenceEventBuilder)initWithEvent:(id)a3;
- (HFSelectedUserCollection)users;
- (NSString)description;
- (id)buildNewEventsFromCurrentState;
- (id)compareToObject:(id)a3;
- (id)comparisonKey;
- (id)eventType;
- (id)naturalLanguageNameWithOptions:(id)a3;
- (unint64_t)activationGranularity;
- (unint64_t)locationEventType;
- (unint64_t)presenceEventType;
- (unint64_t)presenceUserType;
- (void)setActivationGranularity:(unint64_t)a3;
- (void)setLocationEventType:(unint64_t)a3;
- (void)setUsers:(id)a3;
@end

@implementation HFPresenceEventBuilder

+ (id)_selectedUsersForPresenceEvent:(id)a3
{
  id v3 = a3;
  uint64_t v4 = HFSelectedUserCollectionTypeFromPresenceEventUserType([v3 presenceUserType]);
  v5 = (void *)MEMORY[0x263EFFA08];
  if (v4 == 2)
  {
    uint64_t v6 = [v3 users];
    v7 = (void *)v6;
    if (v6) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = MEMORY[0x263EFFA68];
    }
    v9 = [v5 setWithArray:v8];
  }
  else
  {
    v9 = [MEMORY[0x263EFFA08] set];
  }
  v10 = [[HFSelectedUserCollection alloc] initWithType:v4 specificUsers:v9];

  return v10;
}

- (HFPresenceEventBuilder)initWithEvent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)HFPresenceEventBuilder;
  v5 = [(HFEventBuilder *)&v10 initWithEvent:v4];
  uint64_t v6 = v5;
  if (v5)
  {
    if (v4)
    {
      -[HFPresenceEventBuilder setLocationEventType:](v5, "setLocationEventType:", objc_msgSend(MEMORY[0x263F0E670], "hf_locationEventTypeForPresenceEventType:", objc_msgSend(v4, "presenceEventType")));
      v7 = [(id)objc_opt_class() _selectedUsersForPresenceEvent:v4];
      [(HFPresenceEventBuilder *)v6 setUsers:v7];

      uint64_t v8 = objc_msgSend(v4, "hf_activationGranularity");
    }
    else
    {
      [(HFPresenceEventBuilder *)v5 setLocationEventType:0];
      uint64_t v8 = 0;
    }
    [(HFPresenceEventBuilder *)v6 setActivationGranularity:v8];
  }

  return v6;
}

- (unint64_t)presenceEventType
{
  unint64_t v3 = [(HFPresenceEventBuilder *)self locationEventType];
  if (v3 == 1)
  {
    unint64_t v6 = [(HFPresenceEventBuilder *)self activationGranularity];
    if (v6 == 1) {
      return 3;
    }
    if (!v6) {
      return 1;
    }
LABEL_8:
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFPresenceEventBuilder locationEventType](self, "locationEventType"));
    uint64_t v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFPresenceEventBuilder activationGranularity](self, "activationGranularity"));
    NSLog(&cfstr_UnexpectedEven.isa, v7, v8);

    return 1;
  }
  if (v3 != 2) {
    goto LABEL_8;
  }
  unint64_t v4 = [(HFPresenceEventBuilder *)self activationGranularity];
  if (v4 != 1)
  {
    if (!v4) {
      return 2;
    }
    goto LABEL_8;
  }
  return 4;
}

- (unint64_t)presenceUserType
{
  unint64_t v3 = [(HFPresenceEventBuilder *)self users];

  if (!v3) {
    return 2;
  }
  unint64_t v4 = [(HFPresenceEventBuilder *)self users];
  unint64_t v5 = HMPresenceEventUserTypeFromSelectedUserCollectionType([v4 type]);

  return v5;
}

- (id)buildNewEventsFromCurrentState
{
  unint64_t v3 = [(HFPresenceEventBuilder *)self presenceUserType];
  id v4 = objc_alloc(MEMORY[0x263F0E670]);
  unint64_t v5 = [(HFPresenceEventBuilder *)self presenceEventType];
  unint64_t v6 = [(HFPresenceEventBuilder *)self presenceUserType];
  if (v3 == 3)
  {
    v7 = [(HFPresenceEventBuilder *)self users];
    uint64_t v8 = [v7 specificUsers];
    v9 = [v8 allObjects];
    objc_super v10 = (void *)[v4 initWithPresenceEventType:v5 presenceUserType:v6 users:v9];
  }
  else
  {
    objc_super v10 = (void *)[v4 initWithPresenceEventType:v5 presenceUserType:v6];
  }
  v11 = [MEMORY[0x263EFFA08] setWithObject:v10];

  return v11;
}

- (NSString)description
{
  unint64_t v3 = [MEMORY[0x263F58188] builderWithObject:self];
  id v4 = HFStringFromHFLocationEventType([(HFPresenceEventBuilder *)self locationEventType]);
  [v3 appendString:v4 withName:@"locationEventType"];

  unint64_t v5 = NSStringFromHFPresenceEventActivationGranularity([(HFPresenceEventBuilder *)self activationGranularity]);
  [v3 appendString:v5 withName:@"activationGranularity"];

  unint64_t v6 = [(HFPresenceEventBuilder *)self users];
  uint64_t v7 = [v6 type];

  if (v7 == 2)
  {
    uint64_t v8 = [(HFPresenceEventBuilder *)self users];
    v9 = [v8 specificUsers];
    objc_super v10 = [v9 allObjects];
    [v3 appendArraySection:v10 withName:@"specificUsers" skipIfEmpty:0];
  }
  v11 = [v3 build];

  return (NSString *)v11;
}

- (id)eventType
{
  return @"HFEventTypeLocation";
}

- (id)comparisonKey
{
  unint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)HFPresenceEventBuilder;
  id v4 = [(HFEventBuilder *)&v7 comparisonKey];
  unint64_t v5 = [v3 stringWithFormat:@"%@-%lu:%lu", v4, -[HFPresenceEventBuilder presenceEventType](self, "presenceEventType"), -[HFPresenceEventBuilder presenceUserType](self, "presenceUserType")];

  return v5;
}

- (id)naturalLanguageNameWithOptions:(id)a3
{
  id v4 = (void *)MEMORY[0x263F0E310];
  id v5 = a3;
  unint64_t v6 = [(HFPresenceEventBuilder *)self buildNewEventsFromCurrentState];
  objc_super v7 = [v6 anyObject];
  uint64_t v8 = objc_msgSend(v4, "hf_naturalLanguageNameWithOptions:presenceEvent:", v5, v7);

  return v8;
}

- (HFSelectedUserCollection)users
{
  return self->_users;
}

- (void)setUsers:(id)a3
{
}

- (unint64_t)locationEventType
{
  return self->_locationEventType;
}

- (void)setLocationEventType:(unint64_t)a3
{
  self->_locationEventType = a3;
}

- (unint64_t)activationGranularity
{
  return self->_activationGranularity;
}

- (void)setActivationGranularity:(unint64_t)a3
{
  self->_activationGranularity = a3;
}

- (void).cxx_destruct
{
}

- (id)compareToObject:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HFPresenceEventBuilder;
  id v5 = [(HFEventBuilder *)&v16 compareToObject:v4];
  if (([v5 containsCriticalDifference] & 1) == 0)
  {
    unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFPresenceEventBuilder presenceEventType](self, "presenceEventType"));
    objc_super v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "presenceEventType"));
    uint64_t v8 = +[HFPropertyDifference compareObjectA:v6 toObjectB:v7 key:@"presenceEventType" priority:3];
    [v5 add:v8];

    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HFPresenceEventBuilder activationGranularity](self, "activationGranularity"));
    objc_super v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "activationGranularity"));
    v11 = +[HFPropertyDifference compareObjectA:v9 toObjectB:v10 key:@"activationGranularity" priority:2];
    [v5 add:v11];

    v12 = [(HFPresenceEventBuilder *)self users];
    v13 = [v4 users];
    v14 = +[HFPropertyDifference compareObjectA:v12 toObjectB:v13 key:@"users" priority:3];
    [v5 add:v14];
  }
  return v5;
}

@end