@interface HFLegacyBlockBasedReadPolicy
- (HFLegacyBlockBasedReadPolicy)init;
- (HFLegacyBlockBasedReadPolicy)initWithReadValidator:(id)a3;
- (id)readValidator;
- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4;
@end

@implementation HFLegacyBlockBasedReadPolicy

- (HFLegacyBlockBasedReadPolicy)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithReadValidator_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFCharacteristicReadPolicy.m", 408, @"%s is unavailable; use %@ instead",
    "-[HFLegacyBlockBasedReadPolicy init]",
    v5);

  return 0;
}

- (HFLegacyBlockBasedReadPolicy)initWithReadValidator:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFLegacyBlockBasedReadPolicy;
  v5 = [(HFLegacyBlockBasedReadPolicy *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id readValidator = v5->_readValidator;
    v5->_id readValidator = (id)v6;
  }
  return v5;
}

- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4
{
  id v6 = a3;
  v7 = [(HFLegacyBlockBasedReadPolicy *)self readValidator];
  unsigned int v8 = ((uint64_t (**)(void, id, void))v7)[2](v7, v6, 0);

  if ((v8 & 1) == 0)
  {
    *a4 = [MEMORY[0x263EFFA08] setWithObject:@"ExplicitlyDisallowed"];
  }
  return v8;
}

- (id)readValidator
{
  return self->_readValidator;
}

- (void).cxx_destruct
{
}

@end