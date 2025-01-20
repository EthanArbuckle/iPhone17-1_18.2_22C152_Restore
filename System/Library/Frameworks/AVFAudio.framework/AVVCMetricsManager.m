@interface AVVCMetricsManager
+ (id)sharedManager;
+ (void)createSharedManager;
+ (void)destroySharedManager;
+ (void)getLock;
- (AVVCMetricsManager)init;
- (BOOL)measureElapseTimeForMetric:(id)a3 block:(id)a4;
- (NSMutableDictionary)avvcProfilingInfoDictionary;
- (NSMutableDictionary)publicMetrics;
- (id)getStringDate:(id)a3;
- (id)retrieveMetrics;
- (id)retrieveProfileMetrics;
- (int)adamAnalyzeBuffer:(AudioBufferList *)a3 numFrames:(unsigned int)a4 timeStamp:(const AudioTimeStamp *)a5 shouldAnalyze:(BOOL)a6;
- (int)audioIssueDetectorAnalyzeBuffer:(AudioBufferList *)a3 numFrames:(unsigned int)a4 timeStamp:(const AudioTimeStamp *)a5 shouldAnalyze:(BOOL)a6;
- (int)disposeADAM;
- (int)resetAudioIssueDetector;
- (int)setADAMFormat:(CAStreamBasicDescription *)a3 numFrames:(unsigned int)a4;
- (int)setAudioIssueDetectorFormat:(CAStreamBasicDescription *)a3 numFrames:(unsigned int)a4;
- (int64_t)reporterID;
- (unint64_t)callToStartRecordHostTime;
- (unint64_t)voiceTriggerStartHostTime;
- (void)checkAndUpdateReporterID:(int64_t)a3;
- (void)dealloc;
- (void)logProfileMetrics:(id)a3;
- (void)logRecordAudioFormat:(CAStreamBasicDescription *)a3 reporterID:(int64_t)a4;
- (void)logRecordRoute:(id)a3 andPlaybackRoute:(id)a4 reporterID:(int64_t)a5;
- (void)logSessionMetric:(id)a3 value:(id)a4 category:(unsigned int)a5 type:(unsigned __int16)a6 context:(id)a7 reporterID:(int64_t)a8;
- (void)logSessionMetric:(id)a3 value:(id)a4 category:(unsigned int)a5 type:(unsigned __int16)a6 reporterID:(int64_t)a7;
- (void)logSingleMetric:(id)a3 value:(id)a4 category:(unsigned int)a5 type:(unsigned __int16)a6 reporterID:(int64_t)a7;
- (void)resetProfileMetrics;
- (void)setAvvcProfilingInfoDictionary:(id)a3;
- (void)setCallToStartRecordHostTime:(unint64_t)a3;
- (void)setPublicMetrics:(id)a3;
- (void)setVoiceTriggerStartHostTime:(unint64_t)a3;
- (void)updateWithReporterID:(int64_t)a3;
@end

@implementation AVVCMetricsManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avvcProfilingInfoDictionary, 0);
  objc_storeStrong((id *)&self->_publicMetrics, 0);
  objc_storeStrong((id *)&self->mMetricsReporter, 0);

  objc_storeStrong((id *)&self->mWorkQueue, 0);
}

- (void)setAvvcProfilingInfoDictionary:(id)a3
{
}

- (NSMutableDictionary)avvcProfilingInfoDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPublicMetrics:(id)a3
{
}

- (NSMutableDictionary)publicMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCallToStartRecordHostTime:(unint64_t)a3
{
  self->_callToStartRecordHostTime = a3;
}

- (unint64_t)callToStartRecordHostTime
{
  return self->_callToStartRecordHostTime;
}

- (void)setVoiceTriggerStartHostTime:(unint64_t)a3
{
  self->_voiceTriggerStartHostTime = a3;
}

- (unint64_t)voiceTriggerStartHostTime
{
  return self->_voiceTriggerStartHostTime;
}

- (void)logProfileMetrics:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->mProfileAVVC)
  {
    if (kAVVCScope)
    {
      v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_9:
        v7 = [(AVVCMetricsManager *)self avvcProfilingInfoDictionary];
        v8 = [MEMORY[0x1E4F1C9C8] date];
        [v7 setObject:v8 forKey:v4];

        goto LABEL_10;
      }
    }
    else
    {
      v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 136315650;
      v10 = "AVVCMetricsManager.mm";
      __int16 v11 = 1024;
      int v12 = 668;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEBUG, "%25s:%-5d Logging PROFILE METRIC : %@", (uint8_t *)&v9, 0x1Cu);
    }

    goto LABEL_9;
  }
LABEL_10:
}

- (void)logRecordRoute:(id)a3 andPlaybackRoute:(id)a4 reporterID:(int64_t)a5
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v11[0] = @"avvcRecordRoute";
  v11[1] = @"avvcPlaybackRoute";
  v12[0] = v8;
  v12[1] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];
  if (self->mMetricsReporter)
  {
    [(AVVCMetricsManager *)self checkAndUpdateReporterID:a5];
    [(CAReporter *)self->mMetricsReporter sendMessage:v10 category:6 type:5];
  }
}

- (void)logRecordAudioFormat:(CAStreamBasicDescription *)a3 reporterID:(int64_t)a4
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v12[0] = @"avvcSampleRate";
  v7 = [NSNumber numberWithDouble:a3->var0];
  v13[0] = v7;
  v12[1] = @"avvcBitDepth";
  id v8 = [NSNumber numberWithUnsignedLong:a3->var7];
  v13[1] = v8;
  v12[2] = @"avvcChannels";
  id v9 = [NSNumber numberWithUnsignedLong:a3->var6];
  v13[2] = v9;
  void v12[3] = @"avvcFormatID";
  v10 = [NSNumber numberWithUnsignedLong:a3->var1];
  v13[3] = v10;
  __int16 v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  if (self->mMetricsReporter)
  {
    [(AVVCMetricsManager *)self checkAndUpdateReporterID:a4];
    [(CAReporter *)self->mMetricsReporter sendMessage:v11 category:2 type:5];
  }
}

- (void)logSingleMetric:(id)a3 value:(id)a4 category:(unsigned int)a5 type:(unsigned __int16)a6 reporterID:(int64_t)a7
{
  uint64_t v8 = a6;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  if (self->mMetricsReporter)
  {
    if (kAVVCScope)
    {
      __int16 v13 = *(id *)kAVVCScope;
      if (!v13)
      {
LABEL_12:
        id v17 = v11;
        id v18 = v12;
        id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
        [(AVVCMetricsManager *)self checkAndUpdateReporterID:a7];
        [(CAReporter *)self->mMetricsReporter sendMessage:v14 category:2 type:v8];
        goto LABEL_13;
      }
    }
    else
    {
      __int16 v13 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v20 = "AVVCMetricsManager.mm";
      __int16 v21 = 1024;
      int v22 = 626;
      __int16 v23 = 2112;
      id v24 = v11;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl(&dword_19D794000, v13, OS_LOG_TYPE_DEBUG, "%25s:%-5d Logging Out-of-Session Metric %@ : %@", buf, 0x26u);
    }

    goto LABEL_12;
  }
  if (kAVVCScope)
  {
    id v14 = *(id *)kAVVCScope;
    if (!v14) {
      goto LABEL_14;
    }
  }
  else
  {
    id v14 = MEMORY[0x1E4F14500];
    id v16 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    v20 = "AVVCMetricsManager.mm";
    __int16 v21 = 1024;
    int v22 = 631;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl(&dword_19D794000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d Error! No CAReporter for sending %@ message", buf, 0x1Cu);
  }
LABEL_13:

LABEL_14:
}

- (void)logSessionMetric:(id)a3 value:(id)a4 category:(unsigned int)a5 type:(unsigned __int16)a6 context:(id)a7 reporterID:(int64_t)a8
{
  uint64_t v10 = a6;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a7;
  if (self->mMetricsReporter)
  {
    if (kAVVCScope)
    {
      id v16 = *(id *)kAVVCScope;
      if (!v16)
      {
LABEL_12:
        v19 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", v14, v13, 0);
        id v17 = v19;
        if (v15) {
          [v19 setObject:v15 forKeyedSubscript:@"avvcLogContext"];
        }
        [(AVVCMetricsManager *)self checkAndUpdateReporterID:a8];
        [(CAReporter *)self->mMetricsReporter sendMessage:v17 category:2 type:v10];
        goto LABEL_15;
      }
    }
    else
    {
      id v16 = MEMORY[0x1E4F14500];
      id v18 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      int v22 = "AVVCMetricsManager.mm";
      __int16 v23 = 1024;
      int v24 = 610;
      __int16 v25 = 2112;
      id v26 = v13;
      __int16 v27 = 2112;
      id v28 = v14;
      _os_log_impl(&dword_19D794000, v16, OS_LOG_TYPE_DEBUG, "%25s:%-5d Logging In-Session Metric %@ : %@", buf, 0x26u);
    }

    goto LABEL_12;
  }
  if (kAVVCScope)
  {
    id v17 = *(id *)kAVVCScope;
    if (!v17) {
      goto LABEL_16;
    }
  }
  else
  {
    id v17 = MEMORY[0x1E4F14500];
    id v20 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    int v22 = "AVVCMetricsManager.mm";
    __int16 v23 = 1024;
    int v24 = 618;
    __int16 v25 = 2112;
    id v26 = v13;
    _os_log_impl(&dword_19D794000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d Error! No CAReporter for sending %@ message", buf, 0x1Cu);
  }
LABEL_15:

LABEL_16:
}

- (void)logSessionMetric:(id)a3 value:(id)a4 category:(unsigned int)a5 type:(unsigned __int16)a6 reporterID:(int64_t)a7
{
}

- (int)disposeADAM
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  mWorkQueue = self->mWorkQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__AVVCMetricsManager_disposeADAM__block_invoke;
  v5[3] = &unk_1E59649C8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_async(mWorkQueue, v5);
  int v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __33__AVVCMetricsManager_disposeADAM__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 32) != 561211748)
  {
    if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1) {
      dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_263);
    }
    int v2 = AudioDataAnalysisManagerLibraryLoader(void)::libSym
       ? AudioDataAnalysisManagerLibraryLoader(void)::libSym(4)
       : 560033897;
    *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
    if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
    {
      if (kAVVCScope)
      {
        int v3 = *(id *)kAVVCScope;
        if (!v3) {
          return;
        }
      }
      else
      {
        int v3 = MEMORY[0x1E4F14500];
        id v4 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v5 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
        int v6 = 136315650;
        v7 = "AVVCMetricsManager.mm";
        __int16 v8 = 1024;
        int v9 = 589;
        __int16 v10 = 1024;
        int v11 = v5;
        _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d ADAMClientDispose Failed %d", (uint8_t *)&v6, 0x18u);
      }
    }
  }
}

- (int)adamAnalyzeBuffer:(AudioBufferList *)a3 numFrames:(unsigned int)a4 timeStamp:(const AudioTimeStamp *)a5 shouldAnalyze:(BOOL)a6
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!a6 || self->mAudioDataAnalysisSiriSession == 561211748) {
    return 0;
  }
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1) {
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_263);
  }
  int v6 = 560033897;
  if (AudioDataAnalysisManagerLibraryLoader(void)::libSym) {
    return AudioDataAnalysisManagerLibraryLoader(void)::libSym();
  }
  return v6;
}

- (int)setADAMFormat:(CAStreamBasicDescription *)a3 numFrames:(unsigned int)a4
{
  uint64_t v23 = 0;
  int v24 = &v23;
  uint64_t v25 = 0x2020000000;
  int v26 = 0;
  uint64_t v7 = [(CAReporter *)self->mMetricsReporter reporterID];
  if (v7)
  {
    uint64_t v8 = operator new(8uLL);
    void *v8 = v7;
    uint64_t v9 = (uint64_t)(v8 + 1);
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
  }
  mWorkQueue = self->mWorkQueue;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3321888768;
  v14[2] = __46__AVVCMetricsManager_setADAMFormat_numFrames___block_invoke;
  v14[3] = &unk_1EEFA8F10;
  v14[4] = self;
  __p = 0;
  id v16 = 0;
  uint64_t v17 = 0;
  std::vector<long long>::__init_with_size[abi:ne180100]<long long *,long long *>(&__p, v8, v9, (v9 - (uint64_t)v8) >> 3);
  v14[5] = &v23;
  uint64_t v18 = v7;
  long long v11 = *(_OWORD *)&a3->var3;
  long long v19 = *(_OWORD *)&a3->var0;
  long long v20 = v11;
  uint64_t v21 = *(void *)&a3->var7;
  unsigned int v22 = a4;
  dispatch_async(mWorkQueue, v14);
  int v12 = *((_DWORD *)v24 + 6);
  if (__p)
  {
    id v16 = __p;
    operator delete(__p);
  }
  if (v8) {
    operator delete(v8);
  }
  _Block_object_dispose(&v23, 8);
  return v12;
}

void __46__AVVCMetricsManager_setADAMFormat_numFrames___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1) {
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_263);
  }
  if (AudioDataAnalysisManagerLibraryLoader(void)::libSym) {
    uint64_t v2 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(4, a1 + 48);
  }
  else {
    uint64_t v2 = 560033897;
  }
  *(void *)(*(void *)(a1 + 32) + 32) = v2;
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 32);
  if (v3 == 561211748)
  {
    if (kAVVCScope)
    {
      id v4 = *(id *)kAVVCScope;
      if (!v4) {
        return;
      }
    }
    else
    {
      id v4 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v9 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      uint64_t v10 = *(void *)(a1 + 72);
      *(_DWORD *)__p = 136315906;
      *(void *)&__p[4] = "AVVCMetricsManager.mm";
      __int16 v20 = 1024;
      int v21 = 540;
      __int16 v22 = 1024;
      int v23 = v9;
      __int16 v24 = 2048;
      uint64_t v25 = v10;
      long long v11 = "%25s:%-5d Error: %d. Failed to create ADAM SiriSession with reporterID: %lld";
      int v12 = v4;
      uint32_t v13 = 34;
LABEL_38:
      _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, v11, __p, v13);
    }
LABEL_39:

    return;
  }
  std::string::basic_string[abi:ne180100]<0>(__p, "avvc-recordQueue");
  uint64_t v5 = *(unsigned int *)(a1 + 120);
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1) {
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_263);
  }
  int v6 = 560033897;
  int v7 = 560033897;
  if (AudioDataAnalysisManagerLibraryLoader(void)::libSym) {
    int v7 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(v3, 0, __p, a1 + 80, v5, 0);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v7;
  if (SHIBYTE(v23) < 0) {
    operator delete(*(void **)__p);
  }
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (kAVVCScope)
    {
      id v4 = *(id *)kAVVCScope;
      if (!v4) {
        return;
      }
    }
    else
    {
      id v4 = MEMORY[0x1E4F14500];
      id v15 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    int v16 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    *(_DWORD *)__p = 136315650;
    *(void *)&__p[4] = "AVVCMetricsManager.mm";
    __int16 v20 = 1024;
    int v21 = 545;
    __int16 v22 = 1024;
    int v23 = v16;
    long long v11 = "%25s:%-5d ADAMClientCreateNodePCM returned error %d";
LABEL_37:
    int v12 = v4;
    uint32_t v13 = 24;
    goto LABEL_38;
  }
  uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 32);
  if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1) {
    dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_263);
  }
  if (AudioDataAnalysisManagerLibraryLoader(void)::libSym) {
    int v6 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(v14);
  }
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v6;
  if (*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    if (kAVVCScope)
    {
      id v4 = *(id *)kAVVCScope;
      if (!v4) {
        return;
      }
    }
    else
    {
      id v4 = MEMORY[0x1E4F14500];
      id v17 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    int v18 = *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    *(_DWORD *)__p = 136315650;
    *(void *)&__p[4] = "AVVCMetricsManager.mm";
    __int16 v20 = 1024;
    int v21 = 550;
    __int16 v22 = 1024;
    int v23 = v18;
    long long v11 = "%25s:%-5d ADAMClientInitialize returned error %d";
    goto LABEL_37;
  }
}

- (int)resetAudioIssueDetector
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int64_t mAudioIssueDetector = self->mAudioIssueDetector;
  if (mAudioIssueDetector)
  {
    if (AudioIssueDetectorLibraryLoader(void)::once != -1) {
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_242);
    }
    if (AudioIssueDetectorLibraryLoader(void)::libSym)
    {
      LODWORD(mAudioIssueDetector) = AudioIssueDetectorLibraryLoader(void)::libSym(mAudioIssueDetector);
      if (!mAudioIssueDetector) {
        return mAudioIssueDetector;
      }
    }
    else
    {
      LODWORD(mAudioIssueDetector) = -1;
    }
    if (kAVVCScope)
    {
      uint64_t v3 = *(id *)kAVVCScope;
      if (!v3) {
        return mAudioIssueDetector;
      }
    }
    else
    {
      uint64_t v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315650;
      int v7 = "AVVCMetricsManager.mm";
      __int16 v8 = 1024;
      int v9 = 516;
      __int16 v10 = 1024;
      int v11 = mAudioIssueDetector;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d AudioIssueDetectorClientReset Failed: %d", (uint8_t *)&v6, 0x18u);
    }
  }
  return mAudioIssueDetector;
}

- (int)audioIssueDetectorAnalyzeBuffer:(AudioBufferList *)a3 numFrames:(unsigned int)a4 timeStamp:(const AudioTimeStamp *)a5 shouldAnalyze:(BOOL)a6
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!a6) {
    return 0;
  }
  int64_t mAudioIssueDetector = self->mAudioIssueDetector;
  if (!mAudioIssueDetector) {
    return 0;
  }
  uint64_t v8 = *(void *)&a4;
  if (AudioIssueDetectorLibraryLoader(void)::once != -1) {
    dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_242);
  }
  if (AudioIssueDetectorLibraryLoader(void)::libSym)
  {
    int v10 = AudioIssueDetectorLibraryLoader(void)::libSym(mAudioIssueDetector, 0, 0, a3, v8, a5);
    if (!v10) {
      return v10;
    }
  }
  else
  {
    int v10 = -1;
  }
  if (kAVVCScope)
  {
    int v11 = *(id *)kAVVCScope;
    if (!v11) {
      return v10;
    }
  }
  else
  {
    int v11 = MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v14 = 136315650;
    id v15 = "AVVCMetricsManager.mm";
    __int16 v16 = 1024;
    int v17 = 502;
    __int16 v18 = 1024;
    int v19 = v10;
    _os_log_impl(&dword_19D794000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d AudioIssueDetectorClientAnalyzeBuffer Failed: %d", (uint8_t *)&v14, 0x18u);
  }

  return v10;
}

- (int)setAudioIssueDetectorFormat:(CAStreamBasicDescription *)a3 numFrames:(unsigned int)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  int64_t mAudioIssueDetector = self->mAudioIssueDetector;
  if (mAudioIssueDetector)
  {
    uint64_t v5 = *(void *)&a4;
    std::string::basic_string[abi:ne180100]<0>(__p, "avvc-recordQueue");
    if (AudioIssueDetectorLibraryLoader(void)::once != -1) {
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_242);
    }
    if (AudioIssueDetectorLibraryLoader(void)::libSym) {
      int v8 = AudioIssueDetectorLibraryLoader(void)::libSym(mAudioIssueDetector, __p, 0, a3, v5);
    }
    else {
      int v8 = -1;
    }
    if (SHIBYTE(v20) < 0)
    {
      operator delete(*(void **)__p);
      if (v8) {
        goto LABEL_12;
      }
    }
    else if (v8)
    {
LABEL_12:
      if (kAVVCScope)
      {
        int v9 = *(id *)kAVVCScope;
        if (!v9) {
          return v8;
        }
      }
      else
      {
        int v9 = MEMORY[0x1E4F14500];
        id v11 = MEMORY[0x1E4F14500];
      }
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        goto LABEL_36;
      }
      *(_DWORD *)__p = 136315650;
      *(void *)&__p[4] = "AVVCMetricsManager.mm";
      __int16 v17 = 1024;
      int v18 = 478;
      __int16 v19 = 1024;
      int v20 = v8;
      id v12 = "%25s:%-5d AudioIssueDetectorClientSetNodeFormat returned error %d";
LABEL_35:
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, v12, __p, 0x18u);
LABEL_36:

      return v8;
    }
    int64_t v10 = self->mAudioIssueDetector;
    if (AudioIssueDetectorLibraryLoader(void)::once != -1) {
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_242);
    }
    if (AudioIssueDetectorLibraryLoader(void)::libSym)
    {
      int v8 = AudioIssueDetectorLibraryLoader(void)::libSym(v10);
      if (!v8) {
        return v8;
      }
    }
    else
    {
      int v8 = -1;
    }
    if (kAVVCScope)
    {
      int v9 = *(id *)kAVVCScope;
      if (!v9) {
        return v8;
      }
    }
    else
    {
      int v9 = MEMORY[0x1E4F14500];
      id v14 = MEMORY[0x1E4F14500];
    }
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      goto LABEL_36;
    }
    *(_DWORD *)__p = 136315650;
    *(void *)&__p[4] = "AVVCMetricsManager.mm";
    __int16 v17 = 1024;
    int v18 = 483;
    __int16 v19 = 1024;
    int v20 = v8;
    id v12 = "%25s:%-5d AudioIssueDetectorClientInitialize returned error %d";
    goto LABEL_35;
  }
  if (!kAVVCScope)
  {
    int v9 = MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
    goto LABEL_25;
  }
  int v9 = *(id *)kAVVCScope;
  if (v9)
  {
LABEL_25:
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)__p = 136315394;
      *(void *)&__p[4] = "AVVCMetricsManager.mm";
      __int16 v17 = 1024;
      int v18 = 487;
      _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d setAudioIssueDetectorFormat: Invalid AudioIssueDetector client. Not creating AudioIssueDetectorClient node.", __p, 0x12u);
    }
    int v8 = 0;
    goto LABEL_36;
  }
  return 0;
}

- (BOOL)measureElapseTimeForMetric:(id)a3 block:(id)a4
{
  v31[3] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (uint64_t (**)(void))a4;
  uint64_t v8 = mach_absolute_time();
  char v9 = v7[2](v7);
  uint64_t v10 = mach_absolute_time();
  uint64_t v11 = __udivti3();
  id v12 = self;
  objc_sync_enter(v12);
  v30[0] = @"BeginHostTime";
  id v13 = [NSNumber numberWithUnsignedLongLong:v8];
  v31[0] = v13;
  v30[1] = @"EndHostTime";
  id v14 = [NSNumber numberWithUnsignedLongLong:v10];
  double v15 = (double)(unint64_t)v11 / 1000000.0;
  v31[1] = v14;
  v30[2] = @"DurationMilliSeconds";
  __int16 v16 = [NSNumber numberWithDouble:v15];
  v31[2] = v16;
  __int16 v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:v30 count:3];

  int v18 = [(AVVCMetricsManager *)v12 publicMetrics];
  [v18 setObject:v17 forKey:v6];

  objc_sync_exit(v12);
  if (kAVVCScope)
  {
    __int16 v19 = *(id *)kAVVCScope;
    if (!v19) {
      goto LABEL_8;
    }
  }
  else
  {
    __int16 v19 = MEMORY[0x1E4F14500];
    id v20 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v22 = 136315906;
    int v23 = "AVVCMetricsManager.mm";
    __int16 v24 = 1024;
    int v25 = 461;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2048;
    double v29 = v15;
    _os_log_impl(&dword_19D794000, v19, OS_LOG_TYPE_DEBUG, "%25s:%-5d Measuring Elapsed Time for %@ : %f ms", (uint8_t *)&v22, 0x26u);
  }

LABEL_8:
  return v9;
}

- (id)retrieveProfileMetrics
{
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->mProfileAVVC) {
    goto LABEL_52;
  }
  uint64_t v3 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
  id v4 = [v3 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_PrepareStart"];
  if (v4)
  {
    uint64_t v5 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    id v6 = [v5 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_PrepareEnd"];

    if (!v6) {
      goto LABEL_6;
    }
    int v7 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    uint64_t v8 = [v7 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_PrepareEnd"];
    char v9 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    uint64_t v10 = [v9 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_PrepareStart"];
    [v8 timeIntervalSinceDate:v10];
    double v12 = v11;

    uint64_t v3 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    id v13 = [NSNumber numberWithDouble:v12 * 1000.0];
    [v3 setObject:v13 forKey:@"AVVC_PROFILE_Delta_PrepareAPIStartEnd"];
  }
LABEL_6:
  id v14 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
  double v15 = [v14 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_GetPropertiesStart"];
  if (v15)
  {
    __int16 v16 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    __int16 v17 = [v16 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_GetPropertiesEnd"];

    if (!v17) {
      goto LABEL_10;
    }
    int v18 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    __int16 v19 = [v18 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_GetPropertiesEnd"];
    id v20 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    uint64_t v21 = [v20 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_GetPropertiesStart"];
    [v19 timeIntervalSinceDate:v21];
    double v23 = v22;

    id v14 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    __int16 v24 = [NSNumber numberWithDouble:v23 * 1000.0];
    [v14 setObject:v24 forKey:@"AVVC_PROFILE_Delta_GetSessionPropStartEnd"];
  }
LABEL_10:
  int v25 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
  __int16 v26 = [v25 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_SetSessionActiveStart"];
  if (v26)
  {
    id v27 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    __int16 v28 = [v27 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_SetSessionActiveEnd"];

    if (!v28) {
      goto LABEL_14;
    }
    double v29 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v30 = [v29 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_SetSessionActiveEnd"];
    v31 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v32 = [v31 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_SetSessionActiveStart"];
    [v30 timeIntervalSinceDate:v32];
    double v34 = v33;

    int v25 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v35 = [NSNumber numberWithDouble:v34 * 1000.0];
    [v25 setObject:v35 forKey:@"AVVC_PROFILE_Delta_SetSessionActiveStartEnd"];
  }
LABEL_14:
  v36 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
  v37 = [v36 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_SetupRecordQueueStart"];
  if (v37)
  {
    v38 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v39 = [v38 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_SetupRecordQueueEnd"];

    if (!v39) {
      goto LABEL_18;
    }
    v40 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v41 = [v40 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_SetupRecordQueueEnd"];
    v42 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v43 = [v42 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_SetupRecordQueueStart"];
    [v41 timeIntervalSinceDate:v43];
    double v45 = v44;

    v36 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v46 = [NSNumber numberWithDouble:v45 * 1000.0];
    [v36 setObject:v46 forKey:@"AVVC_PROFILE_Delta_SetupRecordQueueStartEnd"];
  }
LABEL_18:
  v47 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
  v48 = [v47 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_StartRecordingStart"];
  if (v48)
  {
    v49 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v50 = [v49 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_StartRecordingEnd"];

    if (!v50) {
      goto LABEL_22;
    }
    v51 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v52 = [v51 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_StartRecordingEnd"];
    v53 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v54 = [v53 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_StartRecordingStart"];
    [v52 timeIntervalSinceDate:v54];
    double v56 = v55;

    v47 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v57 = [NSNumber numberWithDouble:v56 * 1000.0];
    [v47 setObject:v57 forKey:@"AVVC_PROFILE_Delta_StartRecordAPIStartEnd"];
  }
LABEL_22:
  v58 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
  v59 = [v58 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_PlayAlertStart"];
  if (v59)
  {
    v60 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v61 = [v60 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_PlayAlertEnd"];

    if (!v61) {
      goto LABEL_26;
    }
    v62 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v63 = [v62 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_PlayAlertEnd"];
    v64 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v65 = [v64 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_PlayAlertStart"];
    [v63 timeIntervalSinceDate:v65];
    double v67 = v66;

    v58 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v68 = [NSNumber numberWithDouble:v67 * 1000.0];
    [v58 setObject:v68 forKey:@"AVVC_PROFILE_Delta_PlayAlertQueueStartEnd"];
  }
LABEL_26:
  v69 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
  v70 = [v69 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_RecordQueueStart"];
  if (v70)
  {
    v71 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v72 = [v71 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_RecordQueueEnd"];

    if (!v72) {
      goto LABEL_30;
    }
    v73 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v74 = [v73 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_RecordQueueEnd"];
    v75 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v76 = [v75 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_RecordQueueStart"];
    [v74 timeIntervalSinceDate:v76];
    double v78 = v77;

    v69 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v79 = [NSNumber numberWithDouble:v78 * 1000.0];
    [v69 setObject:v79 forKey:@"AVVC_PROFILE_Delta_StartRecordAudioQueueStartEnd"];
  }
LABEL_30:
  v80 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
  v81 = [v80 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_RecordQueueStart"];
  if (v81)
  {
    v82 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v83 = [v82 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_FirstBufferReceived"];

    if (!v83) {
      goto LABEL_34;
    }
    v84 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v85 = [v84 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_FirstBufferReceived"];
    v86 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v87 = [v86 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_RecordQueueStart"];
    [v85 timeIntervalSinceDate:v87];
    double v89 = v88;

    v80 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v90 = [NSNumber numberWithDouble:v89 * 1000.0];
    [v80 setObject:v90 forKey:@"AVVC_PROFILE_Delta_RecordAudioQueueFirstBufferDelta"];
  }
LABEL_34:
  v91 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
  v92 = [v91 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_FirstBufferReceived"];
  if (v92)
  {
    v93 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v94 = [v93 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_RecordQueueStart"];

    if (!v94) {
      goto LABEL_38;
    }
    v95 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v96 = [v95 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_FirstBufferReceived"];
    v97 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v98 = [v97 objectForKeyedSubscript:@"AVVC_PROFILE_Prop_RecordQueueStart"];
    [v96 timeIntervalSinceDate:v98];
    double v100 = v99;

    v91 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    v101 = [NSNumber numberWithDouble:v100 * 1000.0];
    [v91 setObject:v101 forKey:@"AVVC_PROFILE_Delta_RecordAudioQueueFirstBufferToDelegateCallDelta"];
  }
LABEL_38:
  v102 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __44__AVVCMetricsManager_retrieveProfileMetrics__block_invoke;
  v111[3] = &unk_1E59649A0;
  v111[4] = v2;
  [v102 enumerateKeysAndObjectsUsingBlock:v111];

  if (!kAVVCScope)
  {
    v103 = MEMORY[0x1E4F14500];
    id v104 = MEMORY[0x1E4F14500];
    goto LABEL_42;
  }
  v103 = *(id *)kAVVCScope;
  if (v103)
  {
LABEL_42:
    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v113 = "AVVCMetricsManager.mm";
      __int16 v114 = 1024;
      int v115 = 436;
      _os_log_impl(&dword_19D794000, v103, OS_LOG_TYPE_DEFAULT, "%25s:%-5d #### AVVoiceController PERF_INFO ####", buf, 0x12u);
    }
  }
  if (kAVVCScope)
  {
    id v105 = *(id *)kAVVCScope;
    if (!v105) {
      goto LABEL_52;
    }
  }
  else
  {
    id v105 = (id)MEMORY[0x1E4F14500];
    id v106 = MEMORY[0x1E4F14500];
  }
  v107 = v105;
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
  {
    v108 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
    *(_DWORD *)buf = 136315650;
    v113 = "AVVCMetricsManager.mm";
    __int16 v114 = 1024;
    int v115 = 437;
    __int16 v116 = 2112;
    v117 = v108;
    _os_log_impl(&dword_19D794000, v107, OS_LOG_TYPE_DEFAULT, "%25s:%-5d PROFILE %@", buf, 0x1Cu);
  }
LABEL_52:
  v109 = [(AVVCMetricsManager *)v2 avvcProfilingInfoDictionary];
  objc_sync_exit(v2);

  return v109;
}

void __44__AVVCMetricsManager_retrieveProfileMetrics__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [*(id *)(a1 + 32) avvcProfilingInfoDictionary];
    int v7 = [*(id *)(a1 + 32) getStringDate:v5];
    [v6 setObject:v7 forKey:v8];
  }
}

- (void)resetProfileMetrics
{
  if (self->mProfileAVVC)
  {
    id v2 = [(AVVCMetricsManager *)self avvcProfilingInfoDictionary];
    [v2 removeAllObjects];
  }
}

- (id)getStringDate:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  id v5 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  [v4 setTimeZone:v5];

  [v4 setDateFormat:@"yyyy-MM-dd'T'HH:mm:ss.SSSSSSSZZZZZ"];
  id v6 = [v4 stringFromDate:v3];

  return v6;
}

- (id)retrieveMetrics
{
  id v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = [(AVVCMetricsManager *)v2 publicMetrics];
  id v5 = [v3 dictionaryWithDictionary:v4];

  objc_sync_exit(v2);

  return v5;
}

- (int64_t)reporterID
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  mMetricsReporter = self->mMetricsReporter;
  if (!mMetricsReporter)
  {
    if (kAVVCScope)
    {
      id v4 = *(id *)kAVVCScope;
      if (!v4) {
        return 0;
      }
    }
    else
    {
      id v4 = MEMORY[0x1E4F14500];
      id v5 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      int v7 = "AVVCMetricsManager.mm";
      __int16 v8 = 1024;
      int v9 = 340;
      _os_log_impl(&dword_19D794000, v4, OS_LOG_TYPE_ERROR, "%25s:%-5d CAReporter object is nil", (uint8_t *)&v6, 0x12u);
    }

    return 0;
  }

  return [(CAReporter *)mMetricsReporter reporterID];
}

- (void)checkAndUpdateReporterID:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IsMetricsOwnedByAVVC(void)::onceToken != -1) {
    dispatch_once(&IsMetricsOwnedByAVVC(void)::onceToken, &__block_literal_global_205);
  }
  if (!IsMetricsOwnedByAVVC(void)::owned
    && (unint64_t)[(CAReporter *)self->mMetricsReporter reporterID] <= 1)
  {
    if (kAVVCScope)
    {
      id v5 = *(id *)kAVVCScope;
      if (!v5)
      {
LABEL_12:
        if (a3)
        {
          [(CAReporter *)self->mMetricsReporter updateWithReporterID:a3];
          int v7 = [(AVVCMetricsManager *)self publicMetrics];
          __int16 v8 = [NSNumber numberWithLongLong:a3];
          [v7 setObject:v8 forKey:@"avvcReporterID"];
        }
        return;
      }
    }
    else
    {
      id v5 = MEMORY[0x1E4F14500];
      id v6 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136315394;
      uint64_t v10 = "AVVCMetricsManager.mm";
      __int16 v11 = 1024;
      int v12 = 319;
      _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_ERROR, "%25s:%-5d CAReporter reporterID is Invalid", (uint8_t *)&v9, 0x12u);
    }

    goto LABEL_12;
  }
}

- (void)updateWithReporterID:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (IsMetricsOwnedByAVVC(void)::onceToken != -1) {
    dispatch_once(&IsMetricsOwnedByAVVC(void)::onceToken, &__block_literal_global_205);
  }
  if (!IsMetricsOwnedByAVVC(void)::owned)
  {
    if (!a3)
    {
      memset(buf, 0, 24);
      goto LABEL_14;
    }
    id v5 = [(AVVCMetricsManager *)self publicMetrics];
    id v6 = [NSNumber numberWithLongLong:a3];
    [v5 setObject:v6 forKey:@"avvcReporterID"];

    [(CAReporter *)self->mMetricsReporter updateWithReporterID:a3];
    if (kAVVCScope)
    {
      int v7 = *(id *)kAVVCScope;
      if (!v7)
      {
LABEL_13:
        memset(buf, 0, 24);
        int v9 = operator new(8uLL);
        *int v9 = a3;
        *(void *)buf = v9;
        *(void *)&buf[8] = v9 + 1;
        *(void *)&buf[16] = v9 + 1;
LABEL_14:
        int64_t mAudioIssueDetector = self->mAudioIssueDetector;
        if (!mAudioIssueDetector) {
          goto LABEL_28;
        }
        if (AudioIssueDetectorLibraryLoader(void)::once != -1) {
          dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_242);
        }
        if (AudioIssueDetectorLibraryLoader(void)::libSym)
        {
          int v11 = AudioIssueDetectorLibraryLoader(void)::libSym(mAudioIssueDetector, buf);
          if (!v11) {
            goto LABEL_28;
          }
        }
        else
        {
          int v11 = -1;
        }
        if (kAVVCScope)
        {
          int v12 = *(id *)kAVVCScope;
          if (!v12) {
            goto LABEL_28;
          }
        }
        else
        {
          int v12 = MEMORY[0x1E4F14500];
          id v13 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136315650;
          __int16 v19 = "AVVCMetricsManager.mm";
          __int16 v20 = 1024;
          int v21 = 300;
          __int16 v22 = 1024;
          int v23 = v11;
          _os_log_impl(&dword_19D794000, v12, OS_LOG_TYPE_ERROR, "%25s:%-5d AudioIssueDetectorClientUpdateReportingSessions returned error %d", (uint8_t *)&v18, 0x18u);
        }

LABEL_28:
        unint64_t mAudioDataAnalysisSiriSession = self->mAudioDataAnalysisSiriSession;
        if (mAudioDataAnalysisSiriSession == 561211748) {
          goto LABEL_42;
        }
        if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1) {
          dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_263);
        }
        if (AudioDataAnalysisManagerLibraryLoader(void)::libSym)
        {
          int v15 = AudioDataAnalysisManagerLibraryLoader(void)::libSym(mAudioDataAnalysisSiriSession, buf);
          if (!v15) {
            goto LABEL_42;
          }
        }
        else
        {
          int v15 = 560033897;
        }
        if (kAVVCScope)
        {
          __int16 v16 = *(id *)kAVVCScope;
          if (!v16)
          {
LABEL_42:
            if (*(void *)buf)
            {
              *(void *)&buf[8] = *(void *)buf;
              operator delete(*(void **)buf);
            }
            return;
          }
        }
        else
        {
          __int16 v16 = MEMORY[0x1E4F14500];
          id v17 = MEMORY[0x1E4F14500];
        }
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          int v18 = 136315650;
          __int16 v19 = "AVVCMetricsManager.mm";
          __int16 v20 = 1024;
          int v21 = 306;
          __int16 v22 = 1024;
          int v23 = v15;
          _os_log_impl(&dword_19D794000, v16, OS_LOG_TYPE_ERROR, "%25s:%-5d ADAMClientUpdateReportingSessions returned error %d", (uint8_t *)&v18, 0x18u);
        }

        goto LABEL_42;
      }
    }
    else
    {
      int v7 = MEMORY[0x1E4F14500];
      id v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVVCMetricsManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 292;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = a3;
      _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCMetricsManager: UpdateWithReporterID: %lld", buf, 0x1Cu);
    }

    goto LABEL_13;
  }
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v12 = "AVVCMetricsManager.mm";
    __int16 v13 = 1024;
    int v14 = 257;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCMetricsManager: dealloc", buf, 0x12u);
  }

LABEL_8:
  mMetricsReporter = self->mMetricsReporter;
  if (mMetricsReporter)
  {
    [(CAReporter *)mMetricsReporter stop];
    id v6 = self->mMetricsReporter;
    self->mMetricsReporter = 0;
  }
  int64_t mAudioIssueDetector = self->mAudioIssueDetector;
  if (mAudioIssueDetector)
  {
    if (AudioIssueDetectorLibraryLoader(void)::once != -1) {
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_242);
    }
    if (AudioIssueDetectorLibraryLoader(void)::libSym) {
      AudioIssueDetectorLibraryLoader(void)::libSym(mAudioIssueDetector);
    }
  }
  unint64_t mAudioDataAnalysisSiriSession = self->mAudioDataAnalysisSiriSession;
  if (mAudioDataAnalysisSiriSession != 561211748)
  {
    if (AudioDataAnalysisManagerLibraryLoader(void)::once != -1) {
      dispatch_once(&AudioDataAnalysisManagerLibraryLoader(void)::once, &__block_literal_global_263);
    }
    if (AudioDataAnalysisManagerLibraryLoader(void)::libSym) {
      AudioDataAnalysisManagerLibraryLoader(void)::libSym(mAudioDataAnalysisSiriSession);
    }
  }
  mWorkQueue = self->mWorkQueue;
  if (mWorkQueue)
  {
    self->mWorkQueue = 0;
  }
  [(AVVCMetricsManager *)self setPublicMetrics:0];
  [(AVVCMetricsManager *)self setAvvcProfilingInfoDictionary:0];
  v10.receiver = self;
  v10.super_class = (Class)AVVCMetricsManager;
  [(AVVCMetricsManager *)&v10 dealloc];
}

- (AVVCMetricsManager)init
{
  v53[3] = *MEMORY[0x1E4F143B8];
  v42.receiver = self;
  v42.super_class = (Class)AVVCMetricsManager;
  id v2 = [(AVVCMetricsManager *)&v42 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v2 setPublicMetrics:v3];

    id v4 = [v2 publicMetrics];
    v52[0] = @"BeginHostTime";
    v52[1] = @"EndHostTime";
    v53[0] = &unk_1EEFB5660;
    v53[1] = &unk_1EEFB5660;
    v52[2] = @"DurationMilliSeconds";
    v53[2] = &unk_1EEFB5660;
    id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v53 forKeys:v52 count:3];
    [v4 setObject:v5 forKey:@"SetSessionActiveTime"];

    id v6 = [v2 publicMetrics];
    v50[0] = @"BeginHostTime";
    v50[1] = @"EndHostTime";
    v51[0] = &unk_1EEFB5660;
    v51[1] = &unk_1EEFB5660;
    v50[2] = @"DurationMilliSeconds";
    v51[2] = &unk_1EEFB5660;
    int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:3];
    [v6 setObject:v7 forKey:@"SetSessionInactiveTime"];

    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v2 setAvvcProfilingInfoDictionary:v8];

    int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"profile_avvc", @"com.apple.avfoundation.avvc", 0);
    v2[40] = AppBooleanValue != 0;
    if (!AppBooleanValue) {
      goto LABEL_10;
    }
    if (kAVVCScope)
    {
      objc_super v10 = *(id *)kAVVCScope;
      if (!v10) {
        goto LABEL_10;
      }
    }
    else
    {
      objc_super v10 = MEMORY[0x1E4F14500];
      id v11 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "AVVCMetricsManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 190;
      _os_log_impl(&dword_19D794000, v10, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Profiling AVVC NOW.", buf, 0x12u);
    }

LABEL_10:
    *(_OWORD *)(v2 + 24) = xmmword_19D8B1D50;
    if (IsMetricsOwnedByAVVC(void)::onceToken != -1) {
      dispatch_once(&IsMetricsOwnedByAVVC(void)::onceToken, &__block_literal_global_205);
    }
    if (!IsMetricsOwnedByAVVC(void)::owned)
    {
      int v23 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
      dispatch_queue_t v24 = dispatch_queue_create("AVVCMetricsManager Work Queue", v23);
      uint64_t v25 = (void *)*((void *)v2 + 1);
      *((void *)v2 + 1) = v24;

      uint64_t v26 = [objc_alloc(MEMORY[0x1E4FB9430]) initWithReporterID:1 serviceType:1];
      id v27 = (void *)*((void *)v2 + 2);
      *((void *)v2 + 2) = v26;

      memset(buf, 0, 24);
      if (AudioIssueDetectorLibraryLoader(void)::once != -1) {
        dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_242);
      }
      if (AudioIssueDetectorLibraryLoader(void)::libSym)
      {
        uint64_t v28 = AudioIssueDetectorLibraryLoader(void)::libSym(4, buf);
        *((void *)v2 + 3) = v28;
        if (v28) {
          goto LABEL_55;
        }
      }
      else
      {
        *((void *)v2 + 3) = 0;
      }
      if (kAVVCScope)
      {
        v37 = *(id *)kAVVCScope;
        if (!v37)
        {
LABEL_55:
          if (*(void *)buf)
          {
            *(void *)&buf[8] = *(void *)buf;
            operator delete(*(void **)buf);
          }
          goto LABEL_57;
        }
      }
      else
      {
        v37 = MEMORY[0x1E4F14500];
        id v40 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v46 = 136315394;
        v47 = "AVVCMetricsManager.mm";
        __int16 v48 = 1024;
        int v49 = 207;
        _os_log_impl(&dword_19D794000, v37, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create AudioIssueDetector.", v46, 0x12u);
      }

      goto LABEL_55;
    }
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4FB9430]) initWithNewReporterID];
    __int16 v13 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v12;

    int v14 = (void *)*((void *)v2 + 2);
    if (!v14)
    {
      if (kAVVCScope)
      {
        double v29 = *(id *)kAVVCScope;
        if (!v29)
        {
LABEL_57:
          [v2 setVoiceTriggerStartHostTime:0];
          [v2 setCallToStartRecordHostTime:0];
          return (AVVCMetricsManager *)v2;
        }
      }
      else
      {
        double v29 = MEMORY[0x1E4F14500];
        id v39 = MEMORY[0x1E4F14500];
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        *(void *)&uint8_t buf[4] = "AVVCMetricsManager.mm";
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = 215;
        _os_log_impl(&dword_19D794000, v29, OS_LOG_TYPE_ERROR, "%25s:%-5d Unable to create a CAReporter", buf, 0x12u);
      }

      goto LABEL_57;
    }
    [v14 setServiceType:1];
    uint64_t v15 = (void *)*((void *)v2 + 2);
    uint64_t v44 = *MEMORY[0x1E4FB93F0];
    __int16 v16 = [MEMORY[0x1E4F28B50] mainBundle];
    id v17 = [v16 bundleIdentifier];
    double v45 = v17;
    int v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v45 forKeys:&v44 count:1];
    [v15 setConfiguration:v18];

    uint64_t v19 = [*((id *)v2 + 2) reporterID];
    __int16 v20 = [v2 publicMetrics];
    int v21 = [NSNumber numberWithLongLong:v19];
    [v20 setObject:v21 forKey:@"avvcReporterID"];

    if (kAVVCScope)
    {
      __int16 v22 = *(id *)kAVVCScope;
      if (!v22) {
        goto LABEL_29;
      }
    }
    else
    {
      __int16 v22 = MEMORY[0x1E4F14500];
      id v30 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = "AVVCMetricsManager.mm";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 231;
      *(_WORD *)&buf[18] = 2048;
      *(void *)&buf[20] = v19;
      _os_log_impl(&dword_19D794000, v22, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Created a reporter with id(%lld)", buf, 0x1Cu);
    }

LABEL_29:
    v31 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v32 = dispatch_queue_create("AVVCMetricsManager Work Queue", v31);
    double v33 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v32;

    memset(buf, 0, 24);
    double v34 = operator new(8uLL);
    *double v34 = v19;
    *(void *)&buf[8] = v34 + 1;
    *(void *)&buf[16] = v34 + 1;
    *(void *)buf = v34;
    if (AudioIssueDetectorLibraryLoader(void)::once != -1) {
      dispatch_once(&AudioIssueDetectorLibraryLoader(void)::once, &__block_literal_global_242);
    }
    if (AudioIssueDetectorLibraryLoader(void)::libSym)
    {
      uint64_t v35 = AudioIssueDetectorLibraryLoader(void)::libSym(4, buf);
      *((void *)v2 + 3) = v35;
      if (v35)
      {
LABEL_46:
        [*((id *)v2 + 2) start];
        goto LABEL_55;
      }
    }
    else
    {
      *((void *)v2 + 3) = 0;
    }
    if (kAVVCScope)
    {
      v36 = *(id *)kAVVCScope;
      if (!v36) {
        goto LABEL_46;
      }
    }
    else
    {
      v36 = MEMORY[0x1E4F14500];
      id v38 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v46 = 136315394;
      v47 = "AVVCMetricsManager.mm";
      __int16 v48 = 1024;
      int v49 = 239;
      _os_log_impl(&dword_19D794000, v36, OS_LOG_TYPE_ERROR, "%25s:%-5d Failed to create AudioIssueDetector.", v46, 0x12u);
    }

    goto LABEL_46;
  }
  return (AVVCMetricsManager *)v2;
}

+ (id)sharedManager
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)gSharedInstance;
  if (!gSharedInstance)
  {
    if (kAVVCScope)
    {
      id v3 = *(id *)kAVVCScope;
      if (!v3)
      {
LABEL_9:
        id v2 = (void *)gSharedInstance;
        goto LABEL_10;
      }
    }
    else
    {
      id v3 = MEMORY[0x1E4F14500];
      id v4 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136315394;
      int v7 = "AVVCMetricsManager.mm";
      __int16 v8 = 1024;
      int v9 = 156;
      _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d AVVCMetricsManager: sharedInstance is nil !!!!", (uint8_t *)&v6, 0x12u);
    }

    goto LABEL_9;
  }
LABEL_10:

  return v2;
}

+ (void)destroySharedManager
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = +[AVVCMetricsManager getLock];
  int v6 = v2;
  if (v2) {
    LOBYTE(v2) = (*(uint64_t (**)(void *))(*(void *)v2 + 16))(v2);
  }
  char v7 = (char)v2;
  --gReferenceCount;
  if (kAVVCScope)
  {
    id v3 = *(id *)kAVVCScope;
    if (!v3) {
      goto LABEL_10;
    }
  }
  else
  {
    id v3 = MEMORY[0x1E4F14500];
    id v4 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    int v9 = "AVVCMetricsManager.mm";
    __int16 v10 = 1024;
    int v11 = 138;
    __int16 v12 = 2048;
    uint64_t v13 = gReferenceCount;
    _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCMetricsManager: destroySharedManager : referenceCount after decrementing = %llu", buf, 0x1Cu);
  }

LABEL_10:
  if (!gReferenceCount)
  {
    id v5 = (void *)gSharedInstance;
    gSharedInstance = 0;
  }
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v6);
}

+ (void)createSharedManager
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = +[AVVCMetricsManager getLock];
  char v7 = v2;
  if (v2) {
    LOBYTE(v2) = (*(uint64_t (**)(void *))(*(void *)v2 + 16))(v2);
  }
  char v8 = (char)v2;
  if (!gSharedInstance)
  {
    id v3 = objc_alloc_init(AVVCMetricsManager);
    id v4 = (void *)gSharedInstance;
    gSharedInstance = (uint64_t)v3;
  }
  ++gReferenceCount;
  if (kAVVCScope)
  {
    id v5 = *(id *)kAVVCScope;
    if (!v5) {
      goto LABEL_12;
    }
  }
  else
  {
    id v5 = MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v10 = "AVVCMetricsManager.mm";
    __int16 v11 = 1024;
    int v12 = 122;
    __int16 v13 = 2048;
    uint64_t v14 = gReferenceCount;
    _os_log_impl(&dword_19D794000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d AVVCMetricsManager: createSharedManager: referenceCount after incrementing = %llu", buf, 0x1Cu);
  }

LABEL_12:
  CADeprecated::CAMutex::Locker::~Locker((CADeprecated::CAMutex::Locker *)&v7);
}

+ (void)getLock
{
  if (gOnceLockToken != -1) {
    dispatch_once(&gOnceLockToken, &__block_literal_global_2474);
  }
  return (void *)gMutex;
}

void __29__AVVCMetricsManager_getLock__block_invoke()
{
}

@end