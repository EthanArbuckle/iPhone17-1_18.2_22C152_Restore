@interface SNSoundPrintAShoutingModelInput
- (MLMultiArray)detectedHistoryIn;
- (MLMultiArray)input1;
- (MLMultiArray)stateIn;
- (NSSet)featureNames;
- (SNSoundPrintAShoutingModelInput)initWithInput1:(id)a3;
- (SNSoundPrintAShoutingModelInput)initWithInput1:(id)a3 stateIn:(id)a4 detectedHistoryIn:(id)a5;
- (id)featureValueForName:(id)a3;
- (void)setDetectedHistoryIn:(id)a3;
- (void)setInput1:(id)a3;
- (void)setStateIn:(id)a3;
@end

@implementation SNSoundPrintAShoutingModelInput

- (SNSoundPrintAShoutingModelInput)initWithInput1:(id)a3
{
  return [(SNSoundPrintAShoutingModelInput *)self initWithInput1:a3 stateIn:0 detectedHistoryIn:0];
}

- (SNSoundPrintAShoutingModelInput)initWithInput1:(id)a3 stateIn:(id)a4 detectedHistoryIn:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SNSoundPrintAShoutingModelInput;
  v12 = [(SNSoundPrintAShoutingModelInput *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_input1, a3);
    objc_storeStrong((id *)&v13->_stateIn, a4);
    objc_storeStrong((id *)&v13->_detectedHistoryIn, a5);
  }

  return v13;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F38190E0];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"input1"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    v6 = [(SNSoundPrintAShoutingModelInput *)self input1];
    v7 = [v5 featureValueWithMultiArray:v6];
LABEL_11:

    goto LABEL_12;
  }
  if ([v4 isEqualToString:@"stateIn"])
  {
    v6 = [(SNSoundPrintAShoutingModelInput *)self stateIn];
    if (v6)
    {
      v8 = (void *)MEMORY[0x1E4F1E950];
      uint64_t v9 = [(SNSoundPrintAShoutingModelInput *)self stateIn];
LABEL_9:
      id v10 = (void *)v9;
      v7 = [v8 featureValueWithMultiArray:v9];

      goto LABEL_11;
    }
    goto LABEL_10;
  }
  if ([v4 isEqualToString:@"detectedHistoryIn"])
  {
    v6 = [(SNSoundPrintAShoutingModelInput *)self detectedHistoryIn];
    if (v6)
    {
      v8 = (void *)MEMORY[0x1E4F1E950];
      uint64_t v9 = [(SNSoundPrintAShoutingModelInput *)self detectedHistoryIn];
      goto LABEL_9;
    }
LABEL_10:
    v7 = 0;
    goto LABEL_11;
  }
  v7 = 0;
LABEL_12:

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
  objc_storeStrong((id *)&self->_stateIn, 0);

  objc_storeStrong((id *)&self->_input1, 0);
}

@end