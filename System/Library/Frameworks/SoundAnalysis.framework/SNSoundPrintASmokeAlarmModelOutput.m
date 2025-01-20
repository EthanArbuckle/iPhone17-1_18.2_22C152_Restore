@interface SNSoundPrintASmokeAlarmModelOutput
- (MLMultiArray)Confidence;
- (MLMultiArray)Detected;
- (MLMultiArray)detectedHistoryOut;
- (MLMultiArray)input_1;
- (MLMultiArray)thresholdedHistoryOut;
- (NSSet)featureNames;
- (SNSoundPrintASmokeAlarmModelOutput)initWithInput_1:(id)a3 Confidence:(id)a4 Detected:(id)a5 thresholdedHistoryOut:(id)a6 detectedHistoryOut:(id)a7;
- (id)featureValueForName:(id)a3;
- (void)setConfidence:(id)a3;
- (void)setDetected:(id)a3;
- (void)setDetectedHistoryOut:(id)a3;
- (void)setInput_1:(id)a3;
- (void)setThresholdedHistoryOut:(id)a3;
@end

@implementation SNSoundPrintASmokeAlarmModelOutput

- (SNSoundPrintASmokeAlarmModelOutput)initWithInput_1:(id)a3 Confidence:(id)a4 Detected:(id)a5 thresholdedHistoryOut:(id)a6 detectedHistoryOut:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)SNSoundPrintASmokeAlarmModelOutput;
  v17 = [(SNSoundPrintASmokeAlarmModelOutput *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_input_1, a3);
    objc_storeStrong((id *)&v18->_Confidence, a4);
    objc_storeStrong((id *)&v18->_Detected, a5);
    objc_storeStrong((id *)&v18->_thresholdedHistoryOut, a6);
    objc_storeStrong((id *)&v18->_detectedHistoryOut, a7);
  }

  return v18;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3819038];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"input_1"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(SNSoundPrintASmokeAlarmModelOutput *)self input];
LABEL_11:
    v7 = (void *)v6;
    v8 = [v5 featureValueWithMultiArray:v6];

    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"Confidence"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(SNSoundPrintASmokeAlarmModelOutput *)self Confidence];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"Detected"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(SNSoundPrintASmokeAlarmModelOutput *)self Detected];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"thresholdedHistoryOut"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(SNSoundPrintASmokeAlarmModelOutput *)self thresholdedHistoryOut];
    goto LABEL_11;
  }
  if ([v4 isEqualToString:@"detectedHistoryOut"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(SNSoundPrintASmokeAlarmModelOutput *)self detectedHistoryOut];
    goto LABEL_11;
  }
  v8 = 0;
LABEL_12:

  return v8;
}

- (MLMultiArray)input_1
{
  return self->_input_1;
}

- (void)setInput_1:(id)a3
{
}

- (MLMultiArray)Confidence
{
  return self->_Confidence;
}

- (void)setConfidence:(id)a3
{
}

- (MLMultiArray)Detected
{
  return self->_Detected;
}

- (void)setDetected:(id)a3
{
}

- (MLMultiArray)thresholdedHistoryOut
{
  return self->_thresholdedHistoryOut;
}

- (void)setThresholdedHistoryOut:(id)a3
{
}

- (MLMultiArray)detectedHistoryOut
{
  return self->_detectedHistoryOut;
}

- (void)setDetectedHistoryOut:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectedHistoryOut, 0);
  objc_storeStrong((id *)&self->_thresholdedHistoryOut, 0);
  objc_storeStrong((id *)&self->_Detected, 0);
  objc_storeStrong((id *)&self->_Confidence, 0);

  objc_storeStrong((id *)&self->_input_1, 0);
}

@end