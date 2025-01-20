@interface HRETriggerTemplate
- (Class)recommendationClass;
- (HFIconDescriptor)defaultIconDescriptor;
- (NSDictionary)iconDescriptorsByTriggerCharacteristic;
- (id)_subclass_triggerBuilderForRecommendation:(id)a3 withObjects:(id)a4;
- (id)iconDescriptorForRecommendation:(id)a3 withObjects:(id)a4;
- (id)triggerBuilderForRecommendation:(id)a3 withObjects:(id)a4;
- (void)setDefaultIconDescriptor:(id)a3;
- (void)setIconDescriptorsByTriggerCharacteristic:(id)a3;
@end

@implementation HRETriggerTemplate

- (id)triggerBuilderForRecommendation:(id)a3 withObjects:(id)a4
{
  v5 = [(HRETriggerTemplate *)self _subclass_triggerBuilderForRecommendation:a3 withObjects:a4];
  v6 = [(HRETemplate *)self title];
  [v5 setDisplayName:v6];

  return v5;
}

- (id)_subclass_triggerBuilderForRecommendation:(id)a3 withObjects:(id)a4
{
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = NSStringFromSelector(a2);
  NSLog(&cfstr_DoesnTImplemen.isa, v6, v7);

  return 0;
}

- (id)iconDescriptorForRecommendation:(id)a3 withObjects:(id)a4
{
  id v5 = a3;
  v6 = [(HRETriggerTemplate *)self iconDescriptorsByTriggerCharacteristic];
  uint64_t v7 = [v6 count];

  if (v7)
  {
    v8 = [v5 triggerBuilders];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __66__HRETriggerTemplate_iconDescriptorForRecommendation_withObjects___block_invoke;
    v12[3] = &unk_264CF3C78;
    v12[4] = self;
    v9 = objc_msgSend(v8, "na_flatMap:", v12);

    if ([v9 count] == 1)
    {
      v10 = [v9 anyObject];

      goto LABEL_6;
    }
  }
  v10 = [(HRETriggerTemplate *)self defaultIconDescriptor];
LABEL_6:

  return v10;
}

id __66__HRETriggerTemplate_iconDescriptorForRecommendation_withObjects___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  if (v6)
  {
    uint64_t v7 = [v6 characteristics];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __66__HRETriggerTemplate_iconDescriptorForRecommendation_withObjects___block_invoke_2;
    v10[3] = &unk_264CF3C50;
    v10[4] = *(void *)(a1 + 32);
    v8 = objc_msgSend(v7, "na_map:", v10);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id __66__HRETriggerTemplate_iconDescriptorForRecommendation_withObjects___block_invoke_2(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 iconDescriptorsByTriggerCharacteristic];
  id v5 = [v3 characteristicType];

  id v6 = [v4 objectForKey:v5];

  return v6;
}

- (Class)recommendationClass
{
  return (Class)objc_opt_class();
}

- (HFIconDescriptor)defaultIconDescriptor
{
  return self->_defaultIconDescriptor;
}

- (void)setDefaultIconDescriptor:(id)a3
{
}

- (NSDictionary)iconDescriptorsByTriggerCharacteristic
{
  return self->_iconDescriptorsByTriggerCharacteristic;
}

- (void)setIconDescriptorsByTriggerCharacteristic:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDescriptorsByTriggerCharacteristic, 0);

  objc_storeStrong((id *)&self->_defaultIconDescriptor, 0);
}

@end