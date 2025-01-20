@interface SFSpeechLanguageModelConfiguration
- (NSURL)languageModel;
- (NSURL)vocabulary;
- (SFSpeechLanguageModelConfiguration)initWithLanguageModel:(NSURL *)languageModel;
- (SFSpeechLanguageModelConfiguration)initWithLanguageModel:(NSURL *)languageModel vocabulary:(NSURL *)vocabulary;
@end

@implementation SFSpeechLanguageModelConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vocabulary, 0);

  objc_storeStrong((id *)&self->_languageModel, 0);
}

- (NSURL)vocabulary
{
  return self->_vocabulary;
}

- (NSURL)languageModel
{
  return self->_languageModel;
}

- (SFSpeechLanguageModelConfiguration)initWithLanguageModel:(NSURL *)languageModel vocabulary:(NSURL *)vocabulary
{
  v6 = languageModel;
  v7 = vocabulary;
  v14.receiver = self;
  v14.super_class = (Class)SFSpeechLanguageModelConfiguration;
  v8 = [(SFSpeechLanguageModelConfiguration *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [(NSURL *)v6 copy];
    v10 = v8->_languageModel;
    v8->_languageModel = (NSURL *)v9;

    uint64_t v11 = [(NSURL *)v7 copy];
    v12 = v8->_vocabulary;
    v8->_vocabulary = (NSURL *)v11;
  }
  return v8;
}

- (SFSpeechLanguageModelConfiguration)initWithLanguageModel:(NSURL *)languageModel
{
  return [(SFSpeechLanguageModelConfiguration *)self initWithLanguageModel:languageModel vocabulary:0];
}

@end