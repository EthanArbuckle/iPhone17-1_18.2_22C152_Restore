@interface HFStaticReadPolicy
+ (id)policyWithDecision:(unint64_t)a3;
- (HFStaticReadPolicy)init;
- (HFStaticReadPolicy)initWithDecision:(unint64_t)a3;
- (NSString)description;
- (unint64_t)decision;
- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4;
@end

@implementation HFStaticReadPolicy

- (unint64_t)evaluateWithCharacteristic:(id)a3 traits:(id *)a4
{
  id v6 = a3;
  if (a4)
  {
    unint64_t v7 = [(HFStaticReadPolicy *)self decision];
    switch(v7)
    {
      case 2uLL:
        v8 = (void *)MEMORY[0x263EFFA08];
        v9 = @"ExplicitlyRequired";
        goto LABEL_7;
      case 1uLL:
        v10 = [MEMORY[0x263EFFA08] set];
        goto LABEL_9;
      case 0uLL:
        v8 = (void *)MEMORY[0x263EFFA08];
        v9 = @"ExplicitlyDisallowed";
LABEL_7:
        v10 = [v8 setWithObject:v9];
LABEL_9:
        *a4 = v10;
        break;
    }
  }
  unint64_t v11 = [(HFStaticReadPolicy *)self decision];

  return v11;
}

- (unint64_t)decision
{
  return self->_decision;
}

+ (id)policyWithDecision:(unint64_t)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDecision:a3];
  return v3;
}

- (HFStaticReadPolicy)initWithDecision:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HFStaticReadPolicy;
  result = [(HFStaticReadPolicy *)&v5 init];
  if (result) {
    result->_decision = a3;
  }
  return result;
}

- (HFStaticReadPolicy)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  objc_super v5 = NSStringFromSelector(sel_initWithDecision_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFCharacteristicReadPolicy.m", 339, @"%s is unavailable; use %@ instead",
    "-[HFStaticReadPolicy init]",
    v5);

  return 0;
}

- (NSString)description
{
  v3 = [MEMORY[0x263F58188] builderWithObject:self];
  unint64_t v4 = [(HFStaticReadPolicy *)self decision];
  unint64_t v5 = v4;
  if (v4 >= 3)
  {
    unint64_t v7 = [MEMORY[0x263F08690] currentHandler];
    v8 = [NSString stringWithUTF8String:"NSString *HFStringFromReadPolicyDecision(HFCharacteristicReadPolicyDecision)"];
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, @"HFCharacteristicReadPolicy.m", 53, @"Unknown decision value: %d", v5);

    id v6 = 0;
  }
  else
  {
    id v6 = off_264094FE0[v4];
  }
  v9 = v6;
  [v3 appendString:v9 withName:@"decision"];

  v10 = [v3 build];

  return (NSString *)v10;
}

@end