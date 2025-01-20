@interface CSKeywordAnalyzerNDEAPI
- (CSKeywordAnalyzerNDEAPI)initWithBlob:(id)a3;
- (CSKeywordAnalyzerNDEAPIScoreDelegate)delegate;
- (id)checkForTriggerWithBytes:(const signed __int16 *)a3 withNumberOfSamples:(int64_t)a4;
- (id)getLastResult;
- (id)processAudioChunk:(id)a3;
- (unint64_t)activeChannel;
- (void)dealloc;
- (void)reset;
- (void)setActiveChannel:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CSKeywordAnalyzerNDEAPI

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastResult, 0);
  objc_storeStrong((id *)&self->_currentBlob, 0);
}

- (void)setDelegate:(id)a3
{
}

- (CSKeywordAnalyzerNDEAPIScoreDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSKeywordAnalyzerNDEAPIScoreDelegate *)WeakRetained;
}

- (void)setActiveChannel:(unint64_t)a3
{
  self->_activeChannel = a3;
}

- (unint64_t)activeChannel
{
  return self->_activeChannel;
}

- (void)reset
{
}

- (id)getLastResult
{
  return self->_lastResult;
}

- (id)processAudioChunk:(id)a3
{
  id v4 = a3;
  int v5 = [v4 numSamples];
  if (+[CSConfig inputRecordingIsFloat])
  {
    uint64_t v6 = [v4 dataForChannel:self->_activeChannel];

    v7 = +[CSFLPCMTypeConverter convertToShortLPCMBufFromFloatLPCMBuf:v6];
    id v4 = (id)v6;
  }
  else
  {
    v7 = [v4 dataForChannel:self->_activeChannel];
  }

  id v8 = v7;
  v9 = -[CSKeywordAnalyzerNDEAPI checkForTriggerWithBytes:withNumberOfSamples:](self, "checkForTriggerWithBytes:withNumberOfSamples:", [v8 bytes], v5);

  return v9;
}

- (id)checkForTriggerWithBytes:(const signed __int16 *)a3 withNumberOfSamples:(int64_t)a4
{
  id v5 = objc_alloc(MEMORY[0x1E4F1CA58]);
  id v6 = (id) [v5 initWithLength:*MEMORY[0x1E4FB5008]];
  [v6 bytes];
  nde_process_v2();
  v7 = [[CSKeywordAnalyzerNDEAPIResult alloc] initWithBlob:v6 isEarlyDetected:0];
  lastResult = self->_lastResult;
  self->_lastResult = v7;

  return 0;
}

- (void)dealloc
{
  if (self->_ndeObject)
  {
    v3 = +[CSNDEObjectFactory sharedInstance];
    [v3 destoryNDEObject:self->_ndeObject];

    self->_ndeObject = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CSKeywordAnalyzerNDEAPI;
  [(CSKeywordAnalyzerNDEAPI *)&v4 dealloc];
}

- (CSKeywordAnalyzerNDEAPI)initWithBlob:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CSKeywordAnalyzerNDEAPI;
  id v5 = [(CSKeywordAnalyzerNDEAPI *)&v21 init];
  if (v5)
  {
    id v6 = CSLogContextFacilityCoreSpeech;
    if (v4)
    {
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = v4;
        id v8 = v6;
        uint64_t v9 = [v7 bytes];
        int v10 = [v7 length];
        *(_DWORD *)buf = 136315650;
        v23 = "-[CSKeywordAnalyzerNDEAPI initWithBlob:]";
        __int16 v24 = 2048;
        uint64_t v25 = v9;
        __int16 v26 = 1024;
        int v27 = v10;
        _os_log_impl(&dword_1BA1A5000, v8, OS_LOG_TYPE_DEFAULT, "%s Initializaing NDEAPI with blob : %p(%dbytes)", buf, 0x1Cu);
      }
      id v11 = objc_alloc(MEMORY[0x1E4F1CA58]);
      uint64_t v12 = [v11 initWithLength:*MEMORY[0x1E4FB5000]];
      currentBlob = v5->_currentBlob;
      v5->_currentBlob = (NSMutableData *)v12;

      v14 = (void *)[(NSMutableData *)v5->_currentBlob bytes];
      id v15 = v4;
      memcpy(v14, (const void *)[v15 bytes], objc_msgSend(v15, "length"));
      nde_enable_multiinstance();
      v16 = +[CSNDEObjectFactory sharedInstance];
      v5->_ndeObject = (void **)[v16 createNDEObject:v5->_currentBlob];

      if (v5->_ndeObject) {
        goto LABEL_6;
      }
      id v6 = CSLogContextFacilityCoreSpeech;
      if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
LABEL_12:
        v18 = 0;
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315138;
      v23 = "-[CSKeywordAnalyzerNDEAPI initWithBlob:]";
      v19 = "%s Failed to initialize CSKeywordAnalyerNDEAPI";
    }
    else
    {
      if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR)) {
        goto LABEL_12;
      }
      *(_DWORD *)buf = 136315138;
      v23 = "-[CSKeywordAnalyzerNDEAPI initWithBlob:]";
      v19 = "%s CSKeywordAnalyerNDEAPI couldn't initialized since blob is nil";
    }
    _os_log_error_impl(&dword_1BA1A5000, v6, OS_LOG_TYPE_ERROR, v19, buf, 0xCu);
    goto LABEL_12;
  }
LABEL_6:
  v17 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[CSKeywordAnalyzerNDEAPI initWithBlob:]";
    _os_log_impl(&dword_1BA1A5000, v17, OS_LOG_TYPE_DEFAULT, "%s CSKeywordAnalyerNDEAPI created", buf, 0xCu);
  }
  v18 = v5;
LABEL_13:

  return v18;
}

@end