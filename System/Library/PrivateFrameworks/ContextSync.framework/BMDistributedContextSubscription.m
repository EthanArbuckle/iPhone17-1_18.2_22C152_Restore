@interface BMDistributedContextSubscription
- (BMDSL)dsl;
- (BMDistributedContextSubscription)initWithIdentifier:(id)a3 dsl:(id)a4 subscribingDevice:(id)a5 subscribedDevice:(id)a6 configuration:(id)a7;
- (BMDistributedContextSubscriptionConfiguration)configuration;
- (BOOL)isEqual:(id)a3;
- (NSString)identifier;
- (NSString)subscribedDevice;
- (NSString)subscribingDevice;
- (id)description;
- (id)dictionaryRepresentation;
- (id)initFromDictionary:(id)a3;
- (unint64_t)hash;
- (void)setConfiguration:(id)a3;
- (void)setDsl:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setSubscribedDevice:(id)a3;
- (void)setSubscribingDevice:(id)a3;
@end

@implementation BMDistributedContextSubscription

- (BMDistributedContextSubscription)initWithIdentifier:(id)a3 dsl:(id)a4 subscribingDevice:(id)a5 subscribedDevice:(id)a6 configuration:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)BMDistributedContextSubscription;
  v17 = [(BMDistributedContextSubscription *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_identifier, a3);
    objc_storeStrong((id *)&v18->_dsl, a4);
    objc_storeStrong((id *)&v18->_subscribingDevice, a5);
    objc_storeStrong((id *)&v18->_subscribedDevice, a6);
    objc_storeStrong((id *)&v18->_configuration, a7);
  }

  return v18;
}

- (id)initFromDictionary:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)BMDistributedContextSubscription;
  v5 = [(BMDistributedContextSubscription *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = [v4 objectForKeyedSubscript:@"dsl"];
    uint64_t v9 = -[NSData bmdsl_deserialize](v8);
    dsl = v5->_dsl;
    v5->_dsl = (BMDSL *)v9;

    uint64_t v11 = [v4 objectForKeyedSubscript:@"subscribingDevice"];
    subscribingDevice = v5->_subscribingDevice;
    v5->_subscribingDevice = (NSString *)v11;

    uint64_t v13 = [v4 objectForKeyedSubscript:@"subscribedDevice"];
    subscribedDevice = v5->_subscribedDevice;
    v5->_subscribedDevice = (NSString *)v13;

    id v15 = [v4 objectForKeyedSubscript:@"configuration"];
    id v16 = [v15 objectForKeyedSubscript:@"oneOff"];

    if ([v16 BOOLValue]) {
      uint64_t v17 = 2;
    }
    else {
      uint64_t v17 = 0;
    }
    v18 = [v4 objectForKeyedSubscript:@"configuration"];
    v19 = [v18 objectForKeyedSubscript:@"wakeState"];

    uint64_t v20 = v17 | [v19 BOOLValue];
    objc_super v21 = [v4 objectForKeyedSubscript:@"configuration"];
    v22 = [v21 objectForKeyedSubscript:@"lastChangedDate"];

    v23 = [[BMDistributedContextSubscriptionConfiguration alloc] initWithOptions:v20 lastChangedDate:v22];
    configuration = v5->_configuration;
    v5->_configuration = v23;
  }
  return v5;
}

- (id)dictionaryRepresentation
{
  v18[5] = *MEMORY[0x263EF8340];
  identifier = self->_identifier;
  dsl = self->_dsl;
  v18[0] = identifier;
  v17[0] = @"identifier";
  v17[1] = @"dsl";
  v5 = -[BMDSL bmdsl_serialize]((uint64_t)dsl);
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v6 = [MEMORY[0x263EFF8F8] data];
  }
  subscribingDevice = self->_subscribingDevice;
  subscribedDevice = self->_subscribedDevice;
  v18[1] = v6;
  v18[2] = subscribingDevice;
  v17[2] = @"subscribingDevice";
  v17[3] = @"subscribedDevice";
  v18[3] = subscribedDevice;
  v17[4] = @"configuration";
  v15[0] = @"wakeState";
  uint64_t v9 = [(BMDistributedContextSubscriptionConfiguration *)self->_configuration wakeState];
  v16[0] = v9;
  v15[1] = @"oneOff";
  v10 = [(BMDistributedContextSubscriptionConfiguration *)self->_configuration oneOffSubscription];
  v16[1] = v10;
  v15[2] = @"lastChangedDate";
  uint64_t v11 = [(BMDistributedContextSubscriptionConfiguration *)self->_configuration lastChangedDate];
  v16[2] = v11;
  v12 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:3];
  v18[4] = v12;
  uint64_t v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];

  if (!v5) {
  return v13;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 identifier];
    if ([v6 isEqual:self->_identifier])
    {
      v7 = [v5 subscribingDevice];
      if ([v7 isEqual:self->_subscribingDevice])
      {
        v8 = [v5 subscribedDevice];
        if ([v8 isEqual:self->_subscribedDevice])
        {
          uint64_t v9 = [v5 configuration];
          char v10 = [v9 isEqual:self->_configuration];
        }
        else
        {
          char v10 = 0;
        }
      }
      else
      {
        char v10 = 0;
      }
    }
    else
    {
      char v10 = 0;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_subscribedDevice hash] ^ v3;
  NSUInteger v5 = [(NSString *)self->_subscribingDevice hash];
  return v4 ^ v5 ^ [(BMDistributedContextSubscriptionConfiguration *)self->_configuration hash];
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@: identifier:%@ subscribingDevice:%@ subscribedDevice:%@>", objc_opt_class(), self->_identifier, self->_subscribingDevice, self->_subscribedDevice];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (BMDSL)dsl
{
  return self->_dsl;
}

- (void)setDsl:(id)a3
{
}

- (NSString)subscribingDevice
{
  return self->_subscribingDevice;
}

- (void)setSubscribingDevice:(id)a3
{
}

- (NSString)subscribedDevice
{
  return self->_subscribedDevice;
}

- (void)setSubscribedDevice:(id)a3
{
}

- (BMDistributedContextSubscriptionConfiguration)configuration
{
  return (BMDistributedContextSubscriptionConfiguration *)objc_getProperty(self, a2, 40, 1);
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_subscribedDevice, 0);
  objc_storeStrong((id *)&self->_subscribingDevice, 0);
  objc_storeStrong((id *)&self->_dsl, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end