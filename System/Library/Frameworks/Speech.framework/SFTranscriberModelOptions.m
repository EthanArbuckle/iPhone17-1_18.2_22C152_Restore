@interface SFTranscriberModelOptions
- (BOOL)atypicalSpeech;
- (BOOL)enableParallelLoading;
- (BOOL)farField;
- (NSArray)speechProfileURLs;
- (NSString)taskForMemoryLock;
- (NSURL)modelOverrideURL;
- (NSURL)supplementalModelURL;
- (SFTranscriberModelOptions)initWithSupplementalModelURL:(id)a3 farField:(BOOL)a4 modelOverrideURL:(id)a5 speechProfileURLs:(id)a6 taskForMemoryLock:(id)a7;
- (SFTranscriberModelOptions)initWithSupplementalModelURL:(id)a3 farField:(BOOL)a4 modelOverrideURL:(id)a5 speechProfileURLs:(id)a6 taskForMemoryLock:(id)a7 atypicalSpeech:(BOOL)a8;
- (SFTranscriberModelOptions)initWithSupplementalModelURL:(id)a3 farField:(BOOL)a4 modelOverrideURL:(id)a5 speechProfileURLs:(id)a6 taskForMemoryLock:(id)a7 atypicalSpeech:(BOOL)a8 enableParallelLoading:(BOOL)a9;
- (SFTranscriberModelOptions)initWithSupplementalModelURL:(id)a3 farField:(BOOL)a4 modelOverrideURL:(id)a5 taskForMemoryLock:(id)a6 atypicalSpeech:(BOOL)a7;
@end

@implementation SFTranscriberModelOptions

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechProfileURLs, 0);
  objc_storeStrong((id *)&self->_taskForMemoryLock, 0);
  objc_storeStrong((id *)&self->_modelOverrideURL, 0);

  objc_storeStrong((id *)&self->_supplementalModelURL, 0);
}

- (BOOL)enableParallelLoading
{
  return self->_enableParallelLoading;
}

- (BOOL)atypicalSpeech
{
  return self->_atypicalSpeech;
}

- (NSArray)speechProfileURLs
{
  return self->_speechProfileURLs;
}

- (NSString)taskForMemoryLock
{
  return self->_taskForMemoryLock;
}

- (NSURL)modelOverrideURL
{
  return self->_modelOverrideURL;
}

- (BOOL)farField
{
  return self->_farField;
}

- (NSURL)supplementalModelURL
{
  return self->_supplementalModelURL;
}

- (SFTranscriberModelOptions)initWithSupplementalModelURL:(id)a3 farField:(BOOL)a4 modelOverrideURL:(id)a5 taskForMemoryLock:(id)a6 atypicalSpeech:(BOOL)a7
{
  LOBYTE(v8) = 0;
  return [(SFTranscriberModelOptions *)self initWithSupplementalModelURL:a3 farField:a4 modelOverrideURL:a5 speechProfileURLs:MEMORY[0x1E4F1CBF0] taskForMemoryLock:a6 atypicalSpeech:a7 enableParallelLoading:v8];
}

- (SFTranscriberModelOptions)initWithSupplementalModelURL:(id)a3 farField:(BOOL)a4 modelOverrideURL:(id)a5 speechProfileURLs:(id)a6 taskForMemoryLock:(id)a7
{
  LOBYTE(v8) = 0;
  return [(SFTranscriberModelOptions *)self initWithSupplementalModelURL:a3 farField:a4 modelOverrideURL:a5 speechProfileURLs:a6 taskForMemoryLock:a7 atypicalSpeech:0 enableParallelLoading:v8];
}

- (SFTranscriberModelOptions)initWithSupplementalModelURL:(id)a3 farField:(BOOL)a4 modelOverrideURL:(id)a5 speechProfileURLs:(id)a6 taskForMemoryLock:(id)a7 atypicalSpeech:(BOOL)a8
{
  LOBYTE(v9) = 0;
  return [(SFTranscriberModelOptions *)self initWithSupplementalModelURL:a3 farField:a4 modelOverrideURL:a5 speechProfileURLs:a6 taskForMemoryLock:a7 atypicalSpeech:0 enableParallelLoading:v9];
}

- (SFTranscriberModelOptions)initWithSupplementalModelURL:(id)a3 farField:(BOOL)a4 modelOverrideURL:(id)a5 speechProfileURLs:(id)a6 taskForMemoryLock:(id)a7 atypicalSpeech:(BOOL)a8 enableParallelLoading:(BOOL)a9
{
  v15 = (NSArray *)a6;
  v29.receiver = self;
  v29.super_class = (Class)SFTranscriberModelOptions;
  id v16 = a7;
  id v17 = a5;
  id v18 = a3;
  v19 = [(SFTranscriberModelOptions *)&v29 init];
  uint64_t v20 = objc_msgSend(v18, "copy", v29.receiver, v29.super_class);

  supplementalModelURL = v19->_supplementalModelURL;
  v19->_supplementalModelURL = (NSURL *)v20;

  v19->_farField = a4;
  uint64_t v22 = [v17 copy];

  modelOverrideURL = v19->_modelOverrideURL;
  v19->_modelOverrideURL = (NSURL *)v22;

  speechProfileURLs = v19->_speechProfileURLs;
  v19->_speechProfileURLs = v15;
  v25 = v15;

  uint64_t v26 = [v16 copy];
  taskForMemoryLock = v19->_taskForMemoryLock;
  v19->_taskForMemoryLock = (NSString *)v26;

  v19->_atypicalSpeech = a8;
  v19->_enableParallelLoading = a9;
  return v19;
}

@end