@interface HFBlockBasedReadPolicy
- (HFBlockBasedReadPolicy)init;
- (HFBlockBasedReadPolicy)initWithReadPolicyBlock:(id)a3;
- (id)readPolicyBlock;
- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4;
@end

@implementation HFBlockBasedReadPolicy

- (HFBlockBasedReadPolicy)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithReadPolicyBlock_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFCharacteristicReadPolicy.m", 383, @"%s is unavailable; use %@ instead",
    "-[HFBlockBasedReadPolicy init]",
    v5);

  return 0;
}

- (HFBlockBasedReadPolicy)initWithReadPolicyBlock:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFBlockBasedReadPolicy;
  v5 = [(HFBlockBasedReadPolicy *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    id readPolicyBlock = v5->_readPolicyBlock;
    v5->_id readPolicyBlock = (id)v6;
  }
  return v5;
}

- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4
{
  id v6 = a3;
  v7 = [(HFBlockBasedReadPolicy *)self readPolicyBlock];
  unint64_t v8 = ((uint64_t (**)(void, id, id *))v7)[2](v7, v6, a4);

  return v8;
}

- (id)readPolicyBlock
{
  return self->_readPolicyBlock;
}

- (void).cxx_destruct
{
}

@end