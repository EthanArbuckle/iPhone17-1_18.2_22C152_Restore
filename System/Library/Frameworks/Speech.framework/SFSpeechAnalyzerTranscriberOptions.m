@interface SFSpeechAnalyzerTranscriberOptions
- (NSLocale)locale;
- (SFSpeechAnalyzerTranscriberOptions)init;
- (SFTranscriberModelOptions)modelOptions;
- (int64_t)taskHint;
- (unint64_t)transcriptionOptions;
- (void)setLocale:(id)a3;
- (void)setModelOptions:(id)a3;
- (void)setTaskHint:(int64_t)a3;
- (void)setTranscriptionOptions:(unint64_t)a3;
@end

@implementation SFSpeechAnalyzerTranscriberOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelOptions, 0);

  objc_storeStrong((id *)&self->_locale, 0);
}

- (void)setTranscriptionOptions:(unint64_t)a3
{
  self->_transcriptionOptions = a3;
}

- (unint64_t)transcriptionOptions
{
  return self->_transcriptionOptions;
}

- (void)setModelOptions:(id)a3
{
}

- (SFTranscriberModelOptions)modelOptions
{
  return self->_modelOptions;
}

- (void)setTaskHint:(int64_t)a3
{
  self->_taskHint = a3;
}

- (int64_t)taskHint
{
  return self->_taskHint;
}

- (void)setLocale:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (SFSpeechAnalyzerTranscriberOptions)init
{
  v7.receiver = self;
  v7.super_class = (Class)SFSpeechAnalyzerTranscriberOptions;
  v2 = [(SFSpeechAnalyzerTranscriberOptions *)&v7 init];
  uint64_t v3 = [MEMORY[0x1E4F1CA20] currentLocale];
  locale = v2->_locale;
  v2->_locale = (NSLocale *)v3;

  modelOptions = v2->_modelOptions;
  v2->_taskHint = 0;
  v2->_modelOptions = 0;

  v2->_transcriptionOptions = 0;
  return v2;
}

@end