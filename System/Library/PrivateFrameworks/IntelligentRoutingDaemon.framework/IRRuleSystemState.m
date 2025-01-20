@interface IRRuleSystemState
- (IRRuleSystemState)initWithAttributeKey:(id)a3;
- (id)_attributeValueForAttributeKey:(id)a3 systemState:(id)a4 miloPrediction:(id)a5;
- (id)_headsetRoutedOrAirPodsPredictedToBeRoutedForSystemState:(id)a3;
- (id)executeRuleWithCandiatesContainer:(id)a3 systemStatus:(id)a4 historyContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 date:(id)a8;
@end

@implementation IRRuleSystemState

- (IRRuleSystemState)initWithAttributeKey:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IRRuleSystemState;
  v6 = [(IRRuleSystemState *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_attributeKey, a3);
  }

  return v7;
}

- (id)executeRuleWithCandiatesContainer:(id)a3 systemStatus:(id)a4 historyContainer:(id)a5 miloPrediction:(id)a6 nearbyDeviceContainer:(id)a7 date:(id)a8
{
  id v10 = a6;
  id v11 = a4;
  v12 = [[IRRuleOutputSystemState alloc] initWithRule:self];
  v13 = [(IRRuleSystemState *)self _attributeValueForAttributeKey:self->_attributeKey systemState:v11 miloPrediction:v10];

  [(IRRuleOutputSystemState *)v12 setValue:v13];

  return v12;
}

- (id)_attributeValueForAttributeKey:(id)a3 systemState:(id)a4 miloPrediction:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(IRRuleOutputEvaluation);
  if ([v8 isEqual:@"kIRRuleSystemStateHeadsetRoutedOrAirPodsPredictedToBeRoutedKey"])
  {
    uint64_t v12 = [(IRRuleSystemState *)self _headsetRoutedOrAirPodsPredictedToBeRoutedForSystemState:v9];

    id v11 = (IRRuleOutputEvaluation *)v12;
    goto LABEL_10;
  }
  if ([v8 isEqual:@"kIRRuleSystemStateOutsideOfAppInFocusWindow"])
  {
    [(IRRuleOutputEvaluation *)v11 setHasBoolean:1];
    uint64_t v13 = [v9 appInFocusWindowValid] ^ 1;
  }
  else if ([v8 isEqual:@"kIRRuleSystemStateMiLoAvailableKey"])
  {
    [(IRRuleOutputEvaluation *)v11 setHasBoolean:1];
    uint64_t v13 = [v10 canUse];
  }
  else
  {
    if (![v8 isEqual:@"kIRRuleSystemStateHomeLOIKey"]) {
      goto LABEL_10;
    }
    [(IRRuleOutputEvaluation *)v11 setHasBoolean:1];
    uint64_t v13 = [v9 locationSemanticUserSpecificPlaceType] == 1;
  }
  [(IRRuleOutputEvaluation *)v11 setBoolean:v13];
LABEL_10:

  return v11;
}

- (id)_headsetRoutedOrAirPodsPredictedToBeRoutedForSystemState:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(IRRuleOutputEvaluation);
  id v5 = [v3 outputDeviceName];
  if (v5)
  {
    [(IRRuleOutputEvaluation *)v4 setHasBoolean:1];
  }
  else
  {
    v6 = [v3 predictedOutputDeviceName];
    [(IRRuleOutputEvaluation *)v4 setHasBoolean:v6 != 0];
  }
  if ([v3 outputDeviceType] == 1
    && ([v3 outputDeviceSubType] == 3 || objc_msgSend(v3, "outputDeviceSubType") == 2)
    || [v3 predictedOutputDeviceType] == 1)
  {
    [(IRRuleOutputEvaluation *)v4 setBoolean:1];
  }

  return v4;
}

- (void).cxx_destruct
{
}

@end