@interface NLLMLanguageModel
- (BOOL)generatesPredictions;
- (id)sessionWithOptions:(id)a3;
- (id)tokenIDConverter;
@end

@implementation NLLMLanguageModel

- (BOOL)generatesPredictions
{
  return 1;
}

- (id)sessionWithOptions:(id)a3
{
  id v4 = a3;
  v5 = [[NLLMLanguageModelSession alloc] initWithLanguageModel:self options:v4];

  return v5;
}

- (id)tokenIDConverter
{
  tokenIDConverter = self->_tokenIDConverter;
  if (!tokenIDConverter)
  {
    id v4 = [[NLLMTokenIDConverter alloc] initWithLanguageModel:self];
    v5 = self->_tokenIDConverter;
    self->_tokenIDConverter = v4;

    tokenIDConverter = self->_tokenIDConverter;
  }

  return tokenIDConverter;
}

- (void).cxx_destruct
{
}

@end