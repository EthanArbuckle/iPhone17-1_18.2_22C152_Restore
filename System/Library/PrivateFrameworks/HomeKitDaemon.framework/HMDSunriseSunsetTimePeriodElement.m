@interface HMDSunriseSunsetTimePeriodElement
+ (BOOL)supportsSecureCoding;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (HMDSunriseSunsetTimePeriodElement)initWithCoder:(id)a3;
- (HMDSunriseSunsetTimePeriodElement)initWithDictionary:(id)a3;
- (HMDSunriseSunsetTimePeriodElement)initWithSignificantEvent:(id)a3 offset:(id)a4;
- (NSDateComponents)offset;
- (NSString)significantEvent;
- (id)attributeDescriptions;
- (id)serializedRegistrationForRemoteMessage;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDSunriseSunsetTimePeriodElement

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offset, 0);
  objc_storeStrong((id *)&self->_significantEvent, 0);
}

- (NSDateComponents)offset
{
  return (NSDateComponents *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)significantEvent
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDSunriseSunsetTimePeriodElement *)self significantEvent];
  v5 = (void *)[v3 initWithName:@"Significant Event" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDSunriseSunsetTimePeriodElement *)self offset];
  v8 = (void *)[v6 initWithName:@"Offset" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDSunriseSunsetTimePeriodElement)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDSSTPE.ck.se"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDSSTPE.ck.o"];

  v7 = [(HMDSunriseSunsetTimePeriodElement *)self initWithSignificantEvent:v5 offset:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDSunriseSunsetTimePeriodElement *)self significantEvent];
  [v4 encodeObject:v5 forKey:@"HMDSSTPE.ck.se"];

  id v6 = [(HMDSunriseSunsetTimePeriodElement *)self offset];
  [v4 encodeObject:v6 forKey:@"HMDSSTPE.ck.o"];
}

- (unint64_t)hash
{
  v2 = [(HMDSunriseSunsetTimePeriodElement *)self significantEvent];
  unint64_t v3 = [v2 hash];

  return v3;
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
  if (v6)
  {
    v7 = [(HMDSunriseSunsetTimePeriodElement *)self significantEvent];
    v8 = [v6 significantEvent];
    if ([v7 isEqualToString:v8])
    {
      v9 = [(HMDSunriseSunsetTimePeriodElement *)self offset];
      v10 = [v6 offset];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (id)serializedRegistrationForRemoteMessage
{
  v9.receiver = self;
  v9.super_class = (Class)HMDSunriseSunsetTimePeriodElement;
  unint64_t v3 = [(HMDTimePeriodElement *)&v9 serializedRegistrationForRemoteMessage];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDSunriseSunsetTimePeriodElement *)self significantEvent];
  [v4 setObject:v5 forKeyedSubscript:@"HMDSSTPE.ck.se"];

  id v6 = [(HMDSunriseSunsetTimePeriodElement *)self offset];
  v7 = encodeRootObject();
  [v4 setObject:v7 forKeyedSubscript:@"HMDSSTPE.ck.o"];

  return v4;
}

- (HMDSunriseSunsetTimePeriodElement)initWithDictionary:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [(id)objc_opt_class() type];
  LODWORD(v5) = [v5 doesTypeMatch:v4 against:v6];

  if (v5)
  {
    v7 = [v4 objectForKeyedSubscript:@"HMDSSTPE.ck.se"];
    v12[0] = objc_opt_class();
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];
    objc_super v9 = objc_msgSend(v4, "hmf_unarchivedObjectForKey:ofClasses:", @"HMDSSTPE.ck.o", v8);

    self = [(HMDSunriseSunsetTimePeriodElement *)self initWithSignificantEvent:v7 offset:v9];
    v10 = self;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HMDSunriseSunsetTimePeriodElement)initWithSignificantEvent:(id)a3 offset:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDSunriseSunsetTimePeriodElement;
  objc_super v9 = [(HMDSunriseSunsetTimePeriodElement *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_significantEvent, a3);
    objc_storeStrong((id *)&v10->_offset, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"HMDSSTPE.type";
}

@end