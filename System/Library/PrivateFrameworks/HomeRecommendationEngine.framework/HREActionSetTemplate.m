@interface HREActionSetTemplate
- (Class)recommendationClass;
- (HFIconDescriptor)iconDescriptor;
- (HREActionSetTemplate)init;
- (NSString)actionSetName;
- (NSString)actionSetType;
- (id)createStarterRecommendationInHome:(id)a3;
- (void)setActionSetName:(id)a3;
- (void)setActionSetType:(id)a3;
- (void)setIconDescriptor:(id)a3;
@end

@implementation HREActionSetTemplate

- (HREActionSetTemplate)init
{
  v5.receiver = self;
  v5.super_class = (Class)HREActionSetTemplate;
  v2 = [(HRETemplate *)&v5 init];
  if (v2)
  {
    if (_MergedGlobals_2 != -1) {
      dispatch_once(&_MergedGlobals_2, &__block_literal_global_3_1);
    }
    id v3 = (id)qword_268944B48;
    [(HREActionSetTemplate *)v2 setActionSetName:v3];

    [(HREActionSetTemplate *)v2 setActionSetType:0];
    [(HREActionSetTemplate *)v2 setIconDescriptor:0];
  }
  return v2;
}

void __28__HREActionSetTemplate_init__block_invoke_2()
{
  v0 = (void *)qword_268944B48;
  qword_268944B48 = (uint64_t)&stru_26EAB1AB0;
}

- (Class)recommendationClass
{
  return (Class)objc_opt_class();
}

- (id)createStarterRecommendationInHome:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HREActionSetTemplate;
  objc_super v5 = [(HREActionTemplate *)&v15 createStarterRecommendationInHome:v4];
  objc_opt_class();
  id v6 = v5;
  if (objc_opt_isKindOfClass()) {
    v7 = v6;
  }
  else {
    v7 = 0;
  }
  id v8 = v7;

  if (v8)
  {
    v9 = (void *)[objc_alloc(MEMORY[0x263F47AD0]) initWithHome:v4];
    v10 = [v8 mutableActionSetBuilders];
    [v10 addObject:v9];

    v11 = [(HREActionSetTemplate *)self actionSetName];
    [v9 setName:v11];

    v12 = [(HREActionSetTemplate *)self iconDescriptor];
    if (v12)
    {
      [v9 setIconDescriptor:v12];
    }
    else
    {
      v13 = [v9 iconDescriptor];
      [v9 setIconDescriptor:v13];
    }
  }

  return v6;
}

- (NSString)actionSetName
{
  return self->_actionSetName;
}

- (void)setActionSetName:(id)a3
{
}

- (NSString)actionSetType
{
  return self->_actionSetType;
}

- (void)setActionSetType:(id)a3
{
}

- (HFIconDescriptor)iconDescriptor
{
  return self->_iconDescriptor;
}

- (void)setIconDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconDescriptor, 0);
  objc_storeStrong((id *)&self->_actionSetType, 0);

  objc_storeStrong((id *)&self->_actionSetName, 0);
}

@end