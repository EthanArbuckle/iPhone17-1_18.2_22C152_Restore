@interface HMDNaturalLightingEnabledRetryContext
- (BOOL)naturalLightingEnabled;
- (HMDNaturalLightingEnabledRetryContext)initWithNaturalLightingEnabled:(BOOL)a3 completion:(id)a4 retryCount:(unint64_t)a5;
- (id)attributeDescriptions;
- (id)completion;
- (unint64_t)retryCount;
- (void)setRetryCount:(unint64_t)a3;
@end

@implementation HMDNaturalLightingEnabledRetryContext

- (void).cxx_destruct
{
}

- (id)completion
{
  return objc_getProperty(self, a2, 24, 1);
}

- (BOOL)naturalLightingEnabled
{
  return self->_naturalLightingEnabled;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (id)attributeDescriptions
{
  v13[3] = *MEMORY[0x263EF8340];
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%p", self);
  v4 = (void *)[objc_alloc(MEMORY[0x263F424F8]) initWithName:@"Identifier" value:v3];
  v13[0] = v4;
  id v5 = objc_alloc(MEMORY[0x263F424F8]);
  [(HMDNaturalLightingEnabledRetryContext *)self naturalLightingEnabled];
  v6 = HMFBooleanToString();
  v7 = (void *)[v5 initWithName:@"Natural Lighting Enabled" value:v6];
  v13[1] = v7;
  id v8 = objc_alloc(MEMORY[0x263F424F8]);
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[HMDNaturalLightingEnabledRetryContext retryCount](self, "retryCount"));
  v10 = (void *)[v8 initWithName:@"Retry Count" value:v9];
  v13[2] = v10;
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:3];

  return v11;
}

- (HMDNaturalLightingEnabledRetryContext)initWithNaturalLightingEnabled:(BOOL)a3 completion:(id)a4 retryCount:(unint64_t)a5
{
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HMDNaturalLightingEnabledRetryContext;
  v9 = [(HMDNaturalLightingEnabledRetryContext *)&v14 init];
  v10 = v9;
  if (v9)
  {
    v9->_naturalLightingEnabled = a3;
    v11 = _Block_copy(v8);
    id completion = v10->_completion;
    v10->_id completion = v11;

    v10->_retryCount = a5;
  }

  return v10;
}

@end