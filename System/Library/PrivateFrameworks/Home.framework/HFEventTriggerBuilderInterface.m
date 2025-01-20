@interface HFEventTriggerBuilderInterface
+ (id)interfaceWithBuilder:(id)a3;
- (HFEventTriggerBuilder)triggerBuilder;
- (HFEventTriggerBuilderInterface)initWithTriggerBuilder:(id)a3;
@end

@implementation HFEventTriggerBuilderInterface

- (HFEventTriggerBuilderInterface)initWithTriggerBuilder:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HFEventTriggerBuilderInterface;
  v5 = [(HFEventTriggerBuilderInterface *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_triggerBuilder, v4);
  }

  return v6;
}

+ (id)interfaceWithBuilder:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithTriggerBuilder:v3];

  return v4;
}

- (HFEventTriggerBuilder)triggerBuilder
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_triggerBuilder);
  return (HFEventTriggerBuilder *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end