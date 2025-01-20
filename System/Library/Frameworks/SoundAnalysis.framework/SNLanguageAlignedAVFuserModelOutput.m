@interface SNLanguageAlignedAVFuserModelOutput
- (MLMultiArray)fused_embedding;
- (NSSet)featureNames;
- (SNLanguageAlignedAVFuserModelOutput)initWithFused_embedding:(id)a3;
- (id)featureValueForName:(id)a3;
- (void)setFused_embedding:(id)a3;
@end

@implementation SNLanguageAlignedAVFuserModelOutput

- (SNLanguageAlignedAVFuserModelOutput)initWithFused_embedding:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SNLanguageAlignedAVFuserModelOutput;
  v6 = [(SNLanguageAlignedAVFuserModelOutput *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_fused_embedding, a3);
  }

  return v7;
}

- (NSSet)featureNames
{
  return (NSSet *)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F3819128];
}

- (id)featureValueForName:(id)a3
{
  if ([a3 isEqualToString:@"fused_embedding"])
  {
    v4 = (void *)MEMORY[0x1E4F1E950];
    id v5 = [(SNLanguageAlignedAVFuserModelOutput *)self fused_embedding];
    v6 = [v4 featureValueWithMultiArray:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (MLMultiArray)fused_embedding
{
  return self->_fused_embedding;
}

- (void)setFused_embedding:(id)a3
{
}

- (void).cxx_destruct
{
}

@end