@interface SNSoundPrintASmokeAlarmModelInput
- (MLMultiArray)detectedHistoryIn;
- (MLMultiArray)input1;
- (MLMultiArray)stateIn;
- (MLMultiArray)thresholdedHistoryIn;
- (NSSet)featureNames;
- (SNSoundPrintASmokeAlarmModelInput)initWithInput1:(id)a3;
- (SNSoundPrintASmokeAlarmModelInput)initWithInput1:(id)a3 stateIn:(id)a4 thresholdedHistoryIn:(id)a5 detectedHistoryIn:(id)a6;
- (id)featureValueForName:(id)a3;
- (void)setDetectedHistoryIn:(id)a3;
- (void)setInput1:(id)a3;
- (void)setStateIn:(id)a3;
- (void)setThresholdedHistoryIn:(id)a3;
@end

@implementation SNSoundPrintASmokeAlarmModelInput

- (SNSoundPrintASmokeAlarmModelInput)initWithInput1:(id)a3
{
  return [(SNSoundPrintASmokeAlarmModelInput *)self initWithInput1:a3 stateIn:0 thresholdedHistoryIn:0 detectedHistoryIn:0];
}

- (SNSoundPrintASmokeAlarmModelInput)initWithInput1:(id)a3 stateIn:(id)a4 thresholdedHistoryIn:(id)a5 detectedHistoryIn:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SNSoundPrintASmokeAlarmModelInput;
  v15 = [(SNSoundPrintASmokeAlarmModelInput *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_input1, a3);
    objc_storeStrong((id *)&v16->_stateIn, a4);
    objc_storeStrong((id *)&v16->_thresholdedHistoryIn, a5);
    objc_storeStrong((id *)&v16->_detectedHistoryIn, a6);
  }

  return v16;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3819020];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"input1"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    v6 = [(SNSoundPrintASmokeAlarmModelInput *)self input1];
    v7 = [v5 featureValueWithMultiArray:v6];
LABEL_14:

    goto LABEL_15;
  }
  if ([v4 isEqualToString:@"stateIn"])
  {
    v6 = [(SNSoundPrintASmokeAlarmModelInput *)self stateIn];
    if (v6)
    {
      v8 = (void *)MEMORY[0x1E4F1E950];
      uint64_t v9 = [(SNSoundPrintASmokeAlarmModelInput *)self stateIn];
LABEL_12:
      v10 = (void *)v9;
      v7 = [v8 featureValueWithMultiArray:v9];

      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if ([v4 isEqualToString:@"thresholdedHistoryIn"])
  {
    v6 = [(SNSoundPrintASmokeAlarmModelInput *)self thresholdedHistoryIn];
    if (v6)
    {
      v8 = (void *)MEMORY[0x1E4F1E950];
      uint64_t v9 = [(SNSoundPrintASmokeAlarmModelInput *)self thresholdedHistoryIn];
      goto LABEL_12;
    }
LABEL_13:
    v7 = 0;
    goto LABEL_14;
  }
  if ([v4 isEqualToString:@"detectedHistoryIn"])
  {
    v6 = [(SNSoundPrintASmokeAlarmModelInput *)self detectedHistoryIn];
    if (v6)
    {
      v8 = (void *)MEMORY[0x1E4F1E950];
      uint64_t v9 = [(SNSoundPrintASmokeAlarmModelInput *)self detectedHistoryIn];
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  v7 = 0;
LABEL_15:

  return v7;
}

- (MLMultiArray)input1
{
  return self->_input1;
}

- (void)setInput1:(id)a3
{
}

- (MLMultiArray)stateIn
{
  return self->_stateIn;
}

- (void)setStateIn:(id)a3
{
}

- (MLMultiArray)thresholdedHistoryIn
{
  return self->_thresholdedHistoryIn;
}

- (void)setThresholdedHistoryIn:(id)a3
{
}

- (MLMultiArray)detectedHistoryIn
{
  return self->_detectedHistoryIn;
}

- (void)setDetectedHistoryIn:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedHistoryIn, 0);
  objc_storeStrong((id *)&self->_thresholdedHistoryIn, 0);
  objc_storeStrong((id *)&self->_stateIn, 0);

  objc_storeStrong((id *)&self->_input1, 0);
}

@end