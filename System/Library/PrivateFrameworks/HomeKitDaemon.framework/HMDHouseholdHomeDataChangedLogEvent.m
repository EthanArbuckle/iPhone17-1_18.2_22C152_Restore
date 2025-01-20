@interface HMDHouseholdHomeDataChangedLogEvent
- (BOOL)isEqual:(id)a3;
- (HMDHouseholdHomeDataChangedLogEvent)initWithChangeType:(int64_t)a3 count:(unint64_t)a4 modelName:(id)a5 propertyName:(id)a6 homeUUID:(id)a7;
- (HMDHouseholdHomeDataChangedLogEvent)initWithDictionary:(id)a3;
- (NSDictionary)coreAnalyticsEventDictionary;
- (NSString)coreAnalyticsEventName;
- (NSString)description;
- (NSString)modelName;
- (NSString)propertyName;
- (id)initAsBecamePrimaryEventWithCount:(unint64_t)a3 homeUUID:(id)a4;
- (id)initAsInsertEventForModelName:(id)a3 count:(unint64_t)a4 homeUUID:(id)a5;
- (id)initAsUpdateEventForModelName:(id)a3 propertyName:(id)a4 count:(unint64_t)a5 homeUUID:(id)a6;
- (id)serializedLogEvent;
- (int64_t)changeType;
- (unint64_t)coreAnalyticsEventOptions;
- (unint64_t)count;
- (unint64_t)hash;
- (void)incrementCountWithValue:(unint64_t)a3;
- (void)setCount:(unint64_t)a3;
@end

@implementation HMDHouseholdHomeDataChangedLogEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertyName, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
}

- (void)setCount:(unint64_t)a3
{
  self->_count = a3;
}

- (unint64_t)count
{
  return self->_count;
}

- (NSString)propertyName
{
  return self->_propertyName;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (int64_t)changeType
{
  return self->_changeType;
}

- (NSString)description
{
  v3 = NSString;
  v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHouseholdHomeDataChangedLogEvent changeType](self, "changeType"));
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdHomeDataChangedLogEvent count](self, "count"));
  v6 = [(HMDHouseholdHomeDataChangedLogEvent *)self modelName];
  v7 = [(HMDHouseholdHomeDataChangedLogEvent *)self propertyName];
  v8 = [(HMMHomeLogEvent *)self homeUUID];
  v9 = [v3 stringWithFormat:@"<HMDHouseholdHomeDataChangedLogEvent: changeType: %@ count: %@ modelName: %@ propertyName: %@ homeUUID: %@>", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (unint64_t)hash
{
  int64_t v3 = [(HMDHouseholdHomeDataChangedLogEvent *)self changeType];
  return [(HMDHouseholdHomeDataChangedLogEvent *)self count] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (!v6) {
    goto LABEL_10;
  }
  int64_t v7 = [(HMDHouseholdHomeDataChangedLogEvent *)self changeType];
  if (v7 != [v6 changeType]) {
    goto LABEL_10;
  }
  unint64_t v8 = [(HMDHouseholdHomeDataChangedLogEvent *)self count];
  if (v8 != [v6 count]) {
    goto LABEL_10;
  }
  v9 = [(HMDHouseholdHomeDataChangedLogEvent *)self modelName];
  v10 = [v6 modelName];
  int v11 = HMFEqualObjects();

  if (!v11) {
    goto LABEL_10;
  }
  v12 = [(HMDHouseholdHomeDataChangedLogEvent *)self propertyName];
  v13 = [v6 propertyName];
  int v14 = HMFEqualObjects();

  if (v14)
  {
    v15 = [(HMMHomeLogEvent *)self homeUUID];
    v16 = [v6 homeUUID];
    char v17 = [v15 isEqual:v16];
  }
  else
  {
LABEL_10:
    char v17 = 0;
  }

  return v17;
}

- (unint64_t)coreAnalyticsEventOptions
{
  return 2;
}

- (NSDictionary)coreAnalyticsEventDictionary
{
  v15[2] = *MEMORY[0x263EF8340];
  int64_t v3 = (void *)MEMORY[0x263EFF9A0];
  v14[0] = @"changeType";
  id v4 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHouseholdHomeDataChangedLogEvent changeType](self, "changeType"));
  v14[1] = @"homeDataChangedCount";
  v15[0] = v4;
  v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdHomeDataChangedLogEvent count](self, "count"));
  v15[1] = v5;
  id v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  int64_t v7 = [v3 dictionaryWithDictionary:v6];

  unint64_t v8 = [(HMDHouseholdHomeDataChangedLogEvent *)self modelName];

  if (v8)
  {
    v9 = [(HMDHouseholdHomeDataChangedLogEvent *)self modelName];
    [v7 setObject:v9 forKeyedSubscript:@"modelName"];
  }
  v10 = [(HMDHouseholdHomeDataChangedLogEvent *)self propertyName];

  if (v10)
  {
    int v11 = [(HMDHouseholdHomeDataChangedLogEvent *)self propertyName];
    [v7 setObject:v11 forKeyedSubscript:@"propertyName"];
  }
  v12 = (void *)[v7 copy];

  return (NSDictionary *)v12;
}

- (NSString)coreAnalyticsEventName
{
  return (NSString *)@"com.apple.HomeKit.daemon.home.data.changed.household";
}

- (void)incrementCountWithValue:(unint64_t)a3
{
  unint64_t v4 = [(HMDHouseholdHomeDataChangedLogEvent *)self count] + a3;
  [(HMDHouseholdHomeDataChangedLogEvent *)self setCount:v4];
}

- (id)serializedLogEvent
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  int64_t v3 = (void *)MEMORY[0x230FBD990](self, a2);
  unint64_t v4 = self;
  v5 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v6 = HMFGetLogIdentifier();
    int v21 = 138543618;
    v22 = v6;
    __int16 v23 = 2112;
    v24 = v4;
    _os_log_impl(&dword_22F52A000, v5, OS_LOG_TYPE_DEBUG, "%{public}@serializing: %@", (uint8_t *)&v21, 0x16u);
  }
  int64_t v7 = [MEMORY[0x263EFF9A0] dictionary];
  unint64_t v8 = objc_msgSend(NSNumber, "numberWithInteger:", -[HMDHouseholdHomeDataChangedLogEvent changeType](v4, "changeType"));
  [(HMDHouseholdHomeDataChangedLogEvent *)v7 setObject:v8 forKeyedSubscript:@"changeType"];

  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDHouseholdHomeDataChangedLogEvent count](v4, "count"));
  [(HMDHouseholdHomeDataChangedLogEvent *)v7 setObject:v9 forKeyedSubscript:@"homeDataChangedCount"];

  v10 = [(HMMHomeLogEvent *)v4 homeUUIDString];
  [(HMDHouseholdHomeDataChangedLogEvent *)v7 setObject:v10 forKeyedSubscript:@"homeUUID"];

  int v11 = [(HMDHouseholdHomeDataChangedLogEvent *)v4 modelName];

  if (v11)
  {
    v12 = [(HMDHouseholdHomeDataChangedLogEvent *)v4 modelName];
    [(HMDHouseholdHomeDataChangedLogEvent *)v7 setObject:v12 forKeyedSubscript:@"modelName"];
  }
  v13 = [(HMDHouseholdHomeDataChangedLogEvent *)v4 propertyName];

  if (v13)
  {
    int v14 = [(HMDHouseholdHomeDataChangedLogEvent *)v4 propertyName];
    [(HMDHouseholdHomeDataChangedLogEvent *)v7 setObject:v14 forKeyedSubscript:@"propertyName"];
  }
  v15 = (void *)MEMORY[0x230FBD990]();
  v16 = v4;
  char v17 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    v18 = HMFGetLogIdentifier();
    int v21 = 138543618;
    v22 = v18;
    __int16 v23 = 2112;
    v24 = v7;
    _os_log_impl(&dword_22F52A000, v17, OS_LOG_TYPE_DEBUG, "%{public}@serialized as: %@", (uint8_t *)&v21, 0x16u);
  }
  v19 = (void *)[(HMDHouseholdHomeDataChangedLogEvent *)v7 copy];

  return v19;
}

- (HMDHouseholdHomeDataChangedLogEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"changeType"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  unint64_t v8 = [v4 objectForKeyedSubscript:@"homeDataChangedCount"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v9 = v8;
  }
  else {
    v9 = 0;
  }
  id v10 = v9;

  int v11 = [v4 objectForKeyedSubscript:@"homeUUID"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v12 = v11;
  }
  else {
    v12 = 0;
  }
  id v13 = v12;

  int v14 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v13];
  v15 = [v4 objectForKeyedSubscript:@"modelName"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v16 = v15;
  }
  else {
    v16 = 0;
  }
  id v17 = v16;

  v18 = [v4 objectForKeyedSubscript:@"propertyName"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v19 = v18;
  }
  else {
    v19 = 0;
  }
  id v20 = v19;

  int v21 = 0;
  if (v7 && v10 && v14)
  {
    if ([v7 unsignedIntegerValue])
    {
      if (v17)
      {
        if ([v7 unsignedIntegerValue] == 1)
        {
          id v22 = -[HMDHouseholdHomeDataChangedLogEvent initAsInsertEventForModelName:count:homeUUID:](self, "initAsInsertEventForModelName:count:homeUUID:", v17, [v10 unsignedIntegerValue], v14);
LABEL_24:
          self = (HMDHouseholdHomeDataChangedLogEvent *)v22;
          int v21 = self;
          goto LABEL_29;
        }
        if (v20 && [v7 unsignedIntegerValue] == 2)
        {
          id v22 = -[HMDHouseholdHomeDataChangedLogEvent initAsUpdateEventForModelName:propertyName:count:homeUUID:](self, "initAsUpdateEventForModelName:propertyName:count:homeUUID:", v17, v20, [v10 unsignedIntegerValue], v14);
          goto LABEL_24;
        }
      }
      int v21 = 0;
      goto LABEL_29;
    }
    id v22 = -[HMDHouseholdHomeDataChangedLogEvent initAsBecamePrimaryEventWithCount:homeUUID:](self, "initAsBecamePrimaryEventWithCount:homeUUID:", [v10 unsignedIntegerValue], v14);
    goto LABEL_24;
  }
LABEL_29:

  return v21;
}

- (HMDHouseholdHomeDataChangedLogEvent)initWithChangeType:(int64_t)a3 count:(unint64_t)a4 modelName:(id)a5 propertyName:(id)a6 homeUUID:(id)a7
{
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)HMDHouseholdHomeDataChangedLogEvent;
  v15 = [(HMMHomeLogEvent *)&v18 initWithHomeUUID:a7];
  v16 = v15;
  if (v15)
  {
    v15->_changeType = a3;
    v15->_count = a4;
    objc_storeStrong((id *)&v15->_modelName, a5);
    objc_storeStrong((id *)&v16->_propertyName, a6);
  }

  return v16;
}

- (id)initAsBecamePrimaryEventWithCount:(unint64_t)a3 homeUUID:(id)a4
{
  return [(HMDHouseholdHomeDataChangedLogEvent *)self initWithChangeType:0 count:a3 modelName:0 propertyName:0 homeUUID:a4];
}

- (id)initAsUpdateEventForModelName:(id)a3 propertyName:(id)a4 count:(unint64_t)a5 homeUUID:(id)a6
{
  return [(HMDHouseholdHomeDataChangedLogEvent *)self initWithChangeType:2 count:a5 modelName:a3 propertyName:a4 homeUUID:a6];
}

- (id)initAsInsertEventForModelName:(id)a3 count:(unint64_t)a4 homeUUID:(id)a5
{
  return [(HMDHouseholdHomeDataChangedLogEvent *)self initWithChangeType:1 count:a4 modelName:a3 propertyName:0 homeUUID:a5];
}

@end