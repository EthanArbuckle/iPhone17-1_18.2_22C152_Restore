@interface HFServiceIconItem
- (HFIconDescriptor)iconDescriptor;
- (HFServiceIconItem)initWithIconDescriptor:(id)a3;
- (id)_subclass_updateWithOptions:(id)a3;
@end

@implementation HFServiceIconItem

- (HFServiceIconItem)initWithIconDescriptor:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HFServiceIconItem;
  v6 = [(HFServiceIconItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_iconDescriptor, a3);
  }

  return v7;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  v10[1] = *MEMORY[0x263EF8340];
  objc_super v9 = @"icon";
  v3 = [(HFServiceIconItem *)self iconDescriptor];
  v10[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];

  id v5 = (void *)MEMORY[0x263F58190];
  v6 = +[HFItemUpdateOutcome outcomeWithResults:v4];
  v7 = [v5 futureWithResult:v6];

  return v7;
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void).cxx_destruct
{
}

@end