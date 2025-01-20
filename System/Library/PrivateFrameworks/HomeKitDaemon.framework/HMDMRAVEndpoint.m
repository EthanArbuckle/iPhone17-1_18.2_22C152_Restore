@interface HMDMRAVEndpoint
- (BOOL)isEqual:(id)a3;
- (HMDMRAVEndpoint)initWithMRAVEndpoint:(void *)a3;
- (id)attributeDescriptions;
- (unint64_t)hash;
- (void)dealloc;
- (void)mravEndpoint;
@end

@implementation HMDMRAVEndpoint

- (void)mravEndpoint
{
  return self->_mravEndpoint;
}

- (id)attributeDescriptions
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = objc_msgSend(objc_alloc(MEMORY[0x263F424F8]), "initWithName:value:", @"MRAVEndPointRef", -[HMDMRAVEndpoint mravEndpoint](self, "mravEndpoint"));
  v5[0] = v2;
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (unint64_t)hash
{
  v2 = self;
  return (unint64_t)[(HMDMRAVEndpoint *)v2 mravEndpoint];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HMDMRAVEndpoint *)a3;
  if (v4 == self)
  {
    BOOL v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    v6 = v5;
    v7 = v6;
    if (v6)
    {
      v8 = [(HMDMRAVEndpoint *)v6 mravEndpoint];
      BOOL v9 = v8 == [(HMDMRAVEndpoint *)self mravEndpoint];
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  CFRelease(self->_mravEndpoint);
  v3.receiver = self;
  v3.super_class = (Class)HMDMRAVEndpoint;
  [(HMDMRAVEndpoint *)&v3 dealloc];
}

- (HMDMRAVEndpoint)initWithMRAVEndpoint:(void *)a3
{
  if (a3)
  {
    v9.receiver = self;
    v9.super_class = (Class)HMDMRAVEndpoint;
    v4 = [(HMDMRAVEndpoint *)&v9 init];
    if (v4) {
      v4->_mravEndpoint = (void *)CFRetain(a3);
    }
    return v4;
  }
  else
  {
    v6 = (HMDXPCMessageSendPolicy *)_HMFPreconditionFailure();
    return (HMDMRAVEndpoint *)[(HMDXPCMessageSendPolicy *)v6 copyWithZone:v8];
  }
}

@end