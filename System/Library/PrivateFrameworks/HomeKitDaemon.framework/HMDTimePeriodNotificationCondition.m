@interface HMDTimePeriodNotificationCondition
+ (BOOL)supportsSecureCoding;
+ (id)type;
- (BOOL)isEqual:(id)a3;
- (HMDTimePeriodElement)endElement;
- (HMDTimePeriodElement)startElement;
- (HMDTimePeriodNotificationCondition)initWithCoder:(id)a3;
- (HMDTimePeriodNotificationCondition)initWithDictionary:(id)a3;
- (HMDTimePeriodNotificationCondition)initWithStartElement:(id)a3 endElement:(id)a4;
- (id)attributeDescriptions;
- (id)serializedRegistrationForRemoteMessage;
- (id)timePeriodElementFromDictionary:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HMDTimePeriodNotificationCondition

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endElement, 0);
  objc_storeStrong((id *)&self->_startElement, 0);
}

- (HMDTimePeriodElement)endElement
{
  return (HMDTimePeriodElement *)objc_getProperty(self, a2, 16, 1);
}

- (HMDTimePeriodElement)startElement
{
  return (HMDTimePeriodElement *)objc_getProperty(self, a2, 8, 1);
}

- (id)attributeDescriptions
{
  v11[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F424F8]);
  v4 = [(HMDTimePeriodNotificationCondition *)self startElement];
  v5 = (void *)[v3 initWithName:@"Start" value:v4];
  v11[0] = v5;
  id v6 = objc_alloc(MEMORY[0x263F424F8]);
  v7 = [(HMDTimePeriodNotificationCondition *)self endElement];
  v8 = (void *)[v6 initWithName:@"End" value:v7];
  v11[1] = v8;
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:2];

  return v9;
}

- (HMDTimePeriodNotificationCondition)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDTPSC.ck.se"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"HMDTPSC.ck.ee"];

  v7 = [(HMDTimePeriodNotificationCondition *)self initWithStartElement:v5 endElement:v6];
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(HMDTimePeriodNotificationCondition *)self startElement];
  [v4 encodeObject:v5 forKey:@"HMDTPSC.ck.se"];

  id v6 = [(HMDTimePeriodNotificationCondition *)self endElement];
  [v4 encodeObject:v6 forKey:@"HMDTPSC.ck.ee"];
}

- (unint64_t)hash
{
  id v3 = [(HMDTimePeriodNotificationCondition *)self startElement];
  uint64_t v4 = [v3 hash];
  v5 = [(HMDTimePeriodNotificationCondition *)self endElement];
  unint64_t v6 = [v5 hash] ^ v4;

  return v6;
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
    v7 = [(HMDTimePeriodNotificationCondition *)self startElement];
    v8 = [v6 startElement];
    if ([v7 isEqual:v8])
    {
      v9 = [(HMDTimePeriodNotificationCondition *)self endElement];
      v10 = [v6 endElement];
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
  v10.receiver = self;
  v10.super_class = (Class)HMDTimePeriodNotificationCondition;
  id v3 = [(HMDNotificationCondition *)&v10 serializedRegistrationForRemoteMessage];
  id v4 = (void *)[v3 mutableCopy];

  v5 = [(HMDTimePeriodNotificationCondition *)self startElement];
  id v6 = [v5 serializedRegistrationForRemoteMessage];
  [v4 setObject:v6 forKeyedSubscript:@"HMDTPSC.ck.se"];

  v7 = [(HMDTimePeriodNotificationCondition *)self endElement];
  v8 = [v7 serializedRegistrationForRemoteMessage];
  [v4 setObject:v8 forKeyedSubscript:@"HMDTPSC.ck.ee"];

  return v4;
}

- (id)timePeriodElementFromDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [(id)objc_opt_class() type];
  LODWORD(v5) = [v5 doesTypeMatch:v4 against:v6];

  if (v5)
  {
    v7 = HMDTimeOfDayTimePeriodElement;
LABEL_5:
    objc_super v10 = (void *)[[v7 alloc] initWithDictionary:v4];
    goto LABEL_9;
  }
  v8 = objc_opt_class();
  v9 = [(id)objc_opt_class() type];
  LODWORD(v8) = [v8 doesTypeMatch:v4 against:v9];

  if (v8)
  {
    v7 = HMDSunriseSunsetTimePeriodElement;
    goto LABEL_5;
  }
  char v11 = (void *)MEMORY[0x230FBD990]();
  v12 = self;
  v13 = HMFGetOSLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = HMFGetLogIdentifier();
    int v16 = 138543618;
    v17 = v14;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_22F52A000, v13, OS_LOG_TYPE_INFO, "%{public}@Unknown time period element found : %@", (uint8_t *)&v16, 0x16u);
  }
  objc_super v10 = 0;
LABEL_9:

  return v10;
}

- (HMDTimePeriodNotificationCondition)initWithDictionary:(id)a3
{
  id v4 = a3;
  v5 = objc_opt_class();
  id v6 = [(id)objc_opt_class() type];
  LODWORD(v5) = [v5 doesTypeMatch:v4 against:v6];

  if (!v5)
  {
    char v11 = 0;
    goto LABEL_6;
  }
  v7 = [v4 objectForKeyedSubscript:@"HMDTPSC.ck.se"];
  v8 = [(HMDTimePeriodNotificationCondition *)self timePeriodElementFromDictionary:v7];

  v9 = [v4 objectForKeyedSubscript:@"HMDTPSC.ck.ee"];
  objc_super v10 = [(HMDTimePeriodNotificationCondition *)self timePeriodElementFromDictionary:v9];

  if (v8)
  {
    if (v10)
    {
      self = [(HMDTimePeriodNotificationCondition *)self initWithStartElement:v8 endElement:v10];

      char v11 = self;
LABEL_6:

      return v11;
    }
  }
  else
  {
    _HMFPreconditionFailure();
  }
  v13 = (HMDTimePeriodNotificationCondition *)_HMFPreconditionFailure();
  return [(HMDTimePeriodNotificationCondition *)v13 initWithStartElement:v15 endElement:v16];
}

- (HMDTimePeriodNotificationCondition)initWithStartElement:(id)a3 endElement:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass()) {
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
  }
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v14.receiver = self;
    v14.super_class = (Class)HMDTimePeriodNotificationCondition;
    v9 = [(HMDTimePeriodNotificationCondition *)&v14 init];
    objc_super v10 = v9;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_startElement, a3);
      objc_storeStrong((id *)&v10->_endElement, a4);
    }

    return v10;
  }
  else
  {
    v12 = (void *)_HMFPreconditionFailure();
    return (HMDTimePeriodNotificationCondition *)+[HMDTimePeriodNotificationCondition supportsSecureCoding];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)type
{
  return @"HMDTPSC.type";
}

@end