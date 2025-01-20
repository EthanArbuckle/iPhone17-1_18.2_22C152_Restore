@interface HREContextActionTemplate
- (Class)recommendationClass;
- (HFIconDescriptor)iconDescriptor;
- (NSString)contextActionName;
- (id)createStarterRecommendationInHome:(id)a3;
- (void)setContextActionName:(id)a3;
- (void)setIconDescriptor:(id)a3;
@end

@implementation HREContextActionTemplate

- (Class)recommendationClass
{
  return (Class)objc_opt_class();
}

- (id)createStarterRecommendationInHome:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)HREContextActionTemplate;
  v4 = [(HREActionTemplate *)&v11 createStarterRecommendationInHome:a3];
  objc_opt_class();
  id v5 = v4;
  if (objc_opt_isKindOfClass()) {
    v6 = v5;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;

  if (v7)
  {
    v8 = [(HREContextActionTemplate *)self contextActionName];
    [v7 setName:v8];

    v9 = [(HREContextActionTemplate *)self iconDescriptor];
    [v7 setIconDescriptor:v9];
  }

  return v5;
}

- (NSString)contextActionName
{
  return self->_contextActionName;
}

- (void)setContextActionName:(id)a3
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

  objc_storeStrong((id *)&self->_contextActionName, 0);
}

@end