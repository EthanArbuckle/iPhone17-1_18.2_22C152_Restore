@interface HREActionTemplate
- (HREActionVarianceCollection)allowedVariance;
- (NSDictionary)actionMap;
- (NSSet)extraInvolvedTypes;
- (id)_lazy_actionMap;
- (id)_lazy_allowedVariance;
- (id)createStarterRecommendationInHome:(id)a3;
- (id)involvedAccessoryTypes;
- (void)setExtraInvolvedTypes:(id)a3;
@end

@implementation HREActionTemplate

- (NSDictionary)actionMap
{
  actionMap = self->_actionMap;
  if (!actionMap)
  {
    v4 = [(HREActionTemplate *)self _lazy_actionMap];
    v5 = self->_actionMap;
    self->_actionMap = v4;

    actionMap = self->_actionMap;
  }

  return actionMap;
}

- (id)_lazy_actionMap
{
  return 0;
}

- (HREActionVarianceCollection)allowedVariance
{
  allowedVariance = self->_allowedVariance;
  if (!allowedVariance)
  {
    v4 = [(HREActionTemplate *)self _lazy_allowedVariance];
    v5 = self->_allowedVariance;
    self->_allowedVariance = v4;

    allowedVariance = self->_allowedVariance;
  }

  return allowedVariance;
}

- (id)_lazy_allowedVariance
{
  return 0;
}

- (id)createStarterRecommendationInHome:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HREActionTemplate;
  v4 = [(HRETemplate *)&v9 createStarterRecommendationInHome:a3];
  if ([v4 conformsToProtocol:&unk_26EABB4C0]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;
  if (v6)
  {
    v7 = [(HREActionTemplate *)self allowedVariance];
    [v6 setAllowedVariance:v7];
  }

  return v4;
}

- (id)involvedAccessoryTypes
{
  v3 = (void *)MEMORY[0x263EFFA08];
  v4 = [(HREActionTemplate *)self actionMap];
  v5 = [v4 allKeys];
  id v6 = [v3 setWithArray:v5];
  v7 = [(HREActionTemplate *)self extraInvolvedTypes];
  v8 = [v6 setByAddingObjectsFromSet:v7];

  return v8;
}

- (NSSet)extraInvolvedTypes
{
  return self->_extraInvolvedTypes;
}

- (void)setExtraInvolvedTypes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraInvolvedTypes, 0);
  objc_storeStrong((id *)&self->_allowedVariance, 0);

  objc_storeStrong((id *)&self->_actionMap, 0);
}

@end