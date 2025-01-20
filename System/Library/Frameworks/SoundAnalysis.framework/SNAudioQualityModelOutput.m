@interface SNAudioQualityModelOutput
- (NSDictionary)final_output;
- (NSSet)featureNames;
- (NSString)classLabel;
- (SNAudioQualityModelOutput)initWithFinal_output:(id)a3 classLabel:(id)a4;
- (id)featureValueForName:(id)a3;
- (void)setClassLabel:(id)a3;
- (void)setFinal_output:(id)a3;
@end

@implementation SNAudioQualityModelOutput

- (SNAudioQualityModelOutput)initWithFinal_output:(id)a3 classLabel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SNAudioQualityModelOutput;
  v9 = [(SNAudioQualityModelOutput *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_final_output, a3);
    objc_storeStrong((id *)&v10->_classLabel, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3819278];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"final_output"])
  {
    v5 = (void *)MEMORY[0x1E4F1E950];
    v6 = [(SNAudioQualityModelOutput *)self final_output];
    uint64_t v7 = [v5 featureValueWithDictionary:v6 error:0];
LABEL_5:
    v9 = (void *)v7;

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"classLabel"])
  {
    id v8 = (void *)MEMORY[0x1E4F1E950];
    v6 = [(SNAudioQualityModelOutput *)self classLabel];
    uint64_t v7 = [v8 featureValueWithString:v6];
    goto LABEL_5;
  }
  v9 = 0;
LABEL_7:

  return v9;
}

- (NSDictionary)final_output
{
  return self->_final_output;
}

- (void)setFinal_output:(id)a3
{
}

- (NSString)classLabel
{
  return self->_classLabel;
}

- (void)setClassLabel:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_classLabel, 0);

  objc_storeStrong((id *)&self->_final_output, 0);
}

@end