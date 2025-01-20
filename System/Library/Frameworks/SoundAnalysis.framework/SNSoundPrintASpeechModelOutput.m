@interface SNSoundPrintASpeechModelOutput
- (MLMultiArray)Confidence;
- (MLMultiArray)Detected;
- (MLMultiArray)detectedHistoryOut;
- (MLMultiArray)input_1;
- (NSSet)featureNames;
- (SNSoundPrintASpeechModelOutput)initWithInput_1:(id)a3 Confidence:(id)a4 Detected:(id)a5 detectedHistoryOut:(id)a6;
- (id)featureValueForName:(id)a3;
- (void)setConfidence:(id)a3;
- (void)setDetected:(id)a3;
- (void)setDetectedHistoryOut:(id)a3;
- (void)setInput_1:(id)a3;
@end

@implementation SNSoundPrintASpeechModelOutput

- (SNSoundPrintASpeechModelOutput)initWithInput_1:(id)a3 Confidence:(id)a4 Detected:(id)a5 detectedHistoryOut:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)SNSoundPrintASpeechModelOutput;
  v15 = [(SNSoundPrintASpeechModelOutput *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_input_1, a3);
    objc_storeStrong((id *)&v16->_Confidence, a4);
    objc_storeStrong((id *)&v16->_Detected, a5);
    objc_storeStrong((id *)&v16->_detectedHistoryOut, a6);
  }

  return v16;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3819158];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"input_1"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(SNSoundPrintASpeechModelOutput *)self input];
LABEL_9:
    v7 = (void *)v6;
    v8 = [v5 featureValueWithMultiArray:v6];

    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"Confidence"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(SNSoundPrintASpeechModelOutput *)self Confidence];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"Detected"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(SNSoundPrintASpeechModelOutput *)self Detected];
    goto LABEL_9;
  }
  if ([v4 isEqualToString:@"detectedHistoryOut"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    uint64_t v6 = [(SNSoundPrintASpeechModelOutput *)self detectedHistoryOut];
    goto LABEL_9;
  }
  v8 = 0;
LABEL_10:

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
  objc_storeStrong((id *)&self->_Detected, 0);
  objc_storeStrong((id *)&self->_Confidence, 0);

  objc_storeStrong((id *)&self->_input_1, 0);
}

@end