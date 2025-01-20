@interface HFCustomCharacteristicActionSuggestionResult
- (BOOL)isMutuallyExclusiveAction;
- (HFCustomCharacteristicActionSuggestionResult)initWithCharacteristic:(id)a3 targetValue:(id)a4 matchingActions:(id)a5;
- (HMCharacteristic)characteristic;
- (NSSet)matchingExistingActions;
- (id)targetValue;
- (void)setIsMutuallyExclusiveAction:(BOOL)a3;
@end

@implementation HFCustomCharacteristicActionSuggestionResult

- (HFCustomCharacteristicActionSuggestionResult)initWithCharacteristic:(id)a3 targetValue:(id)a4 matchingActions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)HFCustomCharacteristicActionSuggestionResult;
  v12 = [(HFCustomCharacteristicActionSuggestionResult *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_characteristic, a3);
    objc_storeStrong(&v13->_targetValue, a4);
    objc_storeStrong((id *)&v13->_matchingExistingActions, a5);
  }

  return v13;
}

- (HMCharacteristic)characteristic
{
  return self->_characteristic;
}

- (id)targetValue
{
  return self->_targetValue;
}

- (NSSet)matchingExistingActions
{
  return self->_matchingExistingActions;
}

- (BOOL)isMutuallyExclusiveAction
{
  return self->_isMutuallyExclusiveAction;
}

- (void)setIsMutuallyExclusiveAction:(BOOL)a3
{
  self->_isMutuallyExclusiveAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matchingExistingActions, 0);
  objc_storeStrong(&self->_targetValue, 0);
  objc_storeStrong((id *)&self->_characteristic, 0);
}

@end