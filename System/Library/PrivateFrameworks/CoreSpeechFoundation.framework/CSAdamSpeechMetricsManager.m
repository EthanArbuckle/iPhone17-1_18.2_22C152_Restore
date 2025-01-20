@interface CSAdamSpeechMetricsManager
- (BOOL)isDisposed;
- (CAReporter)reporter;
- (CSAdamSpeechMetricsManager)init;
- (int)audioIssueDetectorAnalyzeBuffer:(AudioBufferList *)a3 numFrames:(unsigned int)a4 hostTime:(unint64_t)a5;
- (int)setAudioIssueDetectorFormat:(AudioStreamBasicDescription *)a3 numFrames:(unsigned int)a4;
- (unint64_t)adamClientSessionId;
- (void)dealloc;
- (void)setAdamClientSessionId:(unint64_t)a3;
- (void)setIsDisposed:(BOOL)a3;
- (void)setReporter:(id)a3;
- (void)stopAndDispose;
- (void)updateWithNewReporterID;
@end

@implementation CSAdamSpeechMetricsManager

- (void).cxx_destruct
{
}

- (void)setIsDisposed:(BOOL)a3
{
  self->_isDisposed = a3;
}

- (BOOL)isDisposed
{
  return self->_isDisposed;
}

- (void)setReporter:(id)a3
{
}

- (CAReporter)reporter
{
  return self->_reporter;
}

- (void)setAdamClientSessionId:(unint64_t)a3
{
  self->_adamClientSessionId = a3;
}

- (unint64_t)adamClientSessionId
{
  return self->_adamClientSessionId;
}

- (int)audioIssueDetectorAnalyzeBuffer:(AudioBufferList *)a3 numFrames:(unsigned int)a4 hostTime:(unint64_t)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  v11[0] = 0;
  long long v12 = 0u;
  v11[1] = a5;
  uint64_t v14 = 0;
  uint64_t v15 = 2;
  unint64_t adamClientSessionId = self->_adamClientSessionId;
  if (adamClientSessionId == 561211748) {
    return 0;
  }
  uint64_t v7 = *(void *)&a4;
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1) {
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_10401);
  }
  if (AudioDataAnalysisManagerLibraryLoader(void)::libSym)
  {
    int v6 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(adamClientSessionId, 0, a3, v7, v11);
    if (!v6) {
      return v6;
    }
  }
  else
  {
    int v6 = 560033897;
  }
  v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v17 = "-[CSAdamSpeechMetricsManager audioIssueDetectorAnalyzeBuffer:numFrames:hostTime:]";
    __int16 v18 = 1024;
    int v19 = v6;
    _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, "%s ADAMClientProcessAudio is failing with error: %d", buf, 0x12u);
  }
  return v6;
}

- (void)stopAndDispose
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  unint64_t adamClientSessionId = self->_adamClientSessionId;
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1) {
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_10401);
  }
  if (AudioDataAnalysisManagerLibraryLoader(void)::libSym) {
    AudioDataAnalysisManagerLibraryLoader(void)::libSym(adamClientSessionId);
  }
  self->_isDisposed = 1;
  v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[CSAdamSpeechMetricsManager stopAndDispose]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAdamSpeechMetricsManager stopAndDispose", (uint8_t *)&v5, 0xCu);
  }
}

- (int)setAudioIssueDetectorFormat:(AudioStreamBasicDescription *)a3 numFrames:(unsigned int)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  unint64_t adamClientSessionId = self->_adamClientSessionId;
  if (adamClientSessionId == 561211748) {
    return 0;
  }
  uint64_t v6 = *(void *)&a4;
  char v15 = 16;
  strcpy(__p, "avvc-recordQueue");
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1) {
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_10401);
  }
  if (!AudioDataAnalysisManagerLibraryLoader(void)::libSym)
  {
    int v5 = 560033897;
    goto LABEL_11;
  }
  int v9 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(adamClientSessionId, 0, __p, a3, v6, 0);
  int v5 = v9;
  if (v15 < 0)
  {
    operator delete(*(void **)__p);
    if (!v5) {
      goto LABEL_13;
    }
LABEL_11:
    v10 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
      return v5;
    }
    *(_DWORD *)__p = 136315394;
    *(void *)&__p[4] = "-[CSAdamSpeechMetricsManager setAudioIssueDetectorFormat:numFrames:]";
    *(_WORD *)&__p[12] = 1024;
    *(_DWORD *)&__p[14] = v5;
    long long v13 = "%s ADAMClientCreateNodePCM is failing with error: %d";
LABEL_22:
    _os_log_error_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_ERROR, v13, __p, 0x12u);
    return v5;
  }
  if (v9) {
    goto LABEL_11;
  }
LABEL_13:
  unint64_t v12 = self->_adamClientSessionId;
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1) {
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_10401);
  }
  if (AudioDataAnalysisManagerLibraryLoader(void)::libSym)
  {
    int v5 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(v12);
    if (!v5) {
      return v5;
    }
  }
  else
  {
    int v5 = 560033897;
  }
  v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)__p = 136315394;
    *(void *)&__p[4] = "-[CSAdamSpeechMetricsManager setAudioIssueDetectorFormat:numFrames:]";
    *(_WORD *)&__p[12] = 1024;
    *(_DWORD *)&__p[14] = v5;
    long long v13 = "%s ADAMClientInitialize is failing with error: %d";
    goto LABEL_22;
  }
  return v5;
}

- (void)updateWithNewReporterID
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F153D8] sharedInstance];
  uint64_t v4 = [v3 reporterID];

  int v5 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[CSAdamSpeechMetricsManager updateWithNewReporterID]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v4;
    _os_log_impl(&dword_1BA1A5000, v5, OS_LOG_TYPE_DEFAULT, "%s New reporterId is generated: %lld", buf, 0x16u);
  }
  memset(buf, 0, sizeof(buf));
  if (v4)
  {
    uint64_t v6 = operator new(8uLL);
    *uint64_t v6 = v4;
    *(void *)&buf[8] = v6 + 1;
    *(void *)&buf[16] = v6 + 1;
    *(void *)buf = v6;
  }
  unint64_t adamClientSessionId = self->_adamClientSessionId;
  if (adamClientSessionId != 561211748)
  {
    if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1) {
      dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_10401);
    }
    if (AudioDataAnalysisManagerLibraryLoader(void)::libSym)
    {
      int v8 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(adamClientSessionId, buf);
      if (!v8) {
        goto LABEL_14;
      }
    }
    else
    {
      int v8 = 560033897;
    }
    int v9 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[CSAdamSpeechMetricsManager updateWithNewReporterID]";
      __int16 v12 = 1024;
      int v13 = v8;
      _os_log_error_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_ERROR, "%s ADAMClientUpdateReportingSessions is failing with error: %d", (uint8_t *)&v10, 0x12u);
    }
  }
LABEL_14:
  if (*(void *)buf)
  {
    *(void *)&buf[8] = *(void *)buf;
    operator delete(*(void **)buf);
  }
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!self->_isDisposed)
  {
    unint64_t adamClientSessionId = self->_adamClientSessionId;
    if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1) {
      dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_10401);
    }
    if (AudioDataAnalysisManagerLibraryLoader(void)::libSym) {
      AudioDataAnalysisManagerLibraryLoader(void)::libSym(adamClientSessionId);
    }
  }
  uint64_t v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[CSAdamSpeechMetricsManager dealloc]";
    _os_log_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_DEFAULT, "%s CSAdamSpeechMetricsManager dealloc", buf, 0xCu);
  }
  v5.receiver = self;
  v5.super_class = (Class)CSAdamSpeechMetricsManager;
  [(CSAdamSpeechMetricsManager *)&v5 dealloc];
}

- (CSAdamSpeechMetricsManager)init
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)CSAdamSpeechMetricsManager;
  v2 = [(CSAdamSpeechMetricsManager *)&v10 init];
  if (!v2) {
    goto LABEL_14;
  }
  __p = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 0;
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1) {
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_10401);
  }
  if (!AudioDataAnalysisManagerLibraryLoader(void)::libSym)
  {
    v2->_unint64_t adamClientSessionId = 560033897;
    v2->_isDisposed = 0;
LABEL_14:
    objc_super v5 = v2;
    goto LABEL_15;
  }
  uint64_t v3 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(4, &__p);
  v2->_unint64_t adamClientSessionId = v3;
  v2->_isDisposed = 0;
  if (v3 != 561211748)
  {
    if (__p)
    {
      uint64_t v8 = __p;
      operator delete(__p);
    }
    goto LABEL_14;
  }
  uint64_t v4 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    __int16 v12 = "-[CSAdamSpeechMetricsManager init]";
    _os_log_error_impl(&dword_1BA1A5000, v4, OS_LOG_TYPE_ERROR, "%s Failed to create Adam client", buf, 0xCu);
  }
  if (__p)
  {
    uint64_t v8 = __p;
    operator delete(__p);
  }
  objc_super v5 = 0;
LABEL_15:

  return v5;
}

@end