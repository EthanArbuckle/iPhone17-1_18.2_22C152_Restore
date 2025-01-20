@interface HRERecommendation(Additions)
- (id)hu_actionSetBuilderIfAny;
- (id)hu_asActionRecommendation;
- (id)hu_asActionSetRecommendation;
- (id)hu_asTriggerRecommendation;
- (id)hu_triggerBuilderIfAny;
@end

@implementation HRERecommendation(Additions)

- (id)hu_asActionSetRecommendation
{
  objc_opt_class();
  id v2 = a1;
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)hu_asTriggerRecommendation
{
  objc_opt_class();
  id v2 = a1;
  if (objc_opt_isKindOfClass()) {
    v3 = v2;
  }
  else {
    v3 = 0;
  }
  id v4 = v3;

  return v4;
}

- (id)hu_asActionRecommendation
{
  id v1 = a1;
  if ([v1 conformsToProtocol:&unk_1F1AD9030]) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }
  id v3 = v2;

  return v3;
}

- (id)hu_triggerBuilderIfAny
{
  id v1 = objc_msgSend(a1, "hu_asTriggerRecommendation");
  id v2 = [v1 selectedTriggerBuilder];

  return v2;
}

- (id)hu_actionSetBuilderIfAny
{
  id v1 = objc_msgSend(a1, "hu_asActionSetRecommendation");
  id v2 = [v1 selectedActionSetBuilder];

  return v2;
}

@end