@interface SNSoundClassifierVersion1ModelOutput
- (NSDictionary)_9;
- (NSSet)featureNames;
- (NSString)classLabel;
- (SNSoundClassifierVersion1ModelOutput)initWith_9:(id)a3 classLabel:(id)a4;
- (id)featureValueForName:(id)a3;
- (void)setClassLabel:(id)a3;
- (void)set_9:(id)a3;
@end

@implementation SNSoundClassifierVersion1ModelOutput

- (SNSoundClassifierVersion1ModelOutput)initWith_9:(id)a3 classLabel:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SNSoundClassifierVersion1ModelOutput;
  v9 = [(SNSoundClassifierVersion1ModelOutput *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->__9, a3);
    objc_storeStrong((id *)&v10->_classLabel, a4);
  }

  return v10;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3819098];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"9"])
  {
    v6 = (void *)MEMORY[0x1E4F1E950];
    id v7 = objc_msgSend__9(self, v5);
    uint64_t v8 = [v6 featureValueWithDictionary:v7 error:0];
LABEL_5:
    v10 = (void *)v8;

    goto LABEL_7;
  }
  if ([v4 isEqualToString:@"classLabel"])
  {
    v9 = (void *)MEMORY[0x1E4F1E950];
    id v7 = [(SNSoundClassifierVersion1ModelOutput *)self classLabel];
    uint64_t v8 = [v9 featureValueWithString:v7];
    goto LABEL_5;
  }
  v10 = 0;
LABEL_7:

  return v10;
}

- (NSDictionary)_9
{
  return self->__9;
}

- (void)set_9:(id)a3
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

  objc_storeStrong((id *)&self->__9, 0);
}

@end