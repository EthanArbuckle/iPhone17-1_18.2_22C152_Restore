@interface CSNovDetector
- (CSNovDetector)initWithConfigPath:(id)a3 resourcePath:(id)a4;
- (id)_getAnalyzedResultFromNdresult:(_ndresult *)a3;
- (id)getAnalyzedResultForPhId:(unsigned int)a3;
- (id)getBestAnalyzedResult;
- (id)getOptionValue:(id)a3;
- (id)getSuperVectorWithEndPoint:(unint64_t)a3;
- (unsigned)numResultsAvailable;
- (void)analyzeWavData:(id)a3 numSamples:(unint64_t)a4;
- (void)analyzeWavFloatData:(id)a3 numSamples:(unint64_t)a4;
- (void)dealloc;
- (void)reset;
- (void)resetBest;
@end

@implementation CSNovDetector

- (id)getOptionValue:(id)a3
{
  v5 = 0;
  if (a3)
  {
    if (self->_novDetect)
    {
      [a3 UTF8String];
      v5 = (void *)nd_getoption();
      if (v5)
      {
        v5 = [NSString stringWithUTF8String:v5];
      }
    }
    uint64_t v3 = vars8;
  }
  return v5;
}

- (id)getSuperVectorWithEndPoint:(unint64_t)a3
{
  novDetect = (unsigned int *)self->_novDetect;
  if (novDetect)
  {
    novDetect = (unsigned int *)nd_getsupervector();
    if (novDetect)
    {
      novDetect = [MEMORY[0x1E4F1C9B8] dataWithBytes:*(void *)novDetect length:4 * novDetect[2]];
    }
  }
  return novDetect;
}

- (id)_getAnalyzedResultFromNdresult:(_ndresult *)a3
{
  if (a3)
  {
    v4 = objc_alloc_init(CSNovDetectorResult);
    [(CSNovDetectorResult *)v4 setSampleFed:a3->var0];
    [(CSNovDetectorResult *)v4 setBestPhrase:a3->var3];
    [(CSNovDetectorResult *)v4 setBestStart:a3->var1];
    [(CSNovDetectorResult *)v4 setBestEnd:a3->var2];
    *(float *)&double v5 = a3->var4;
    [(CSNovDetectorResult *)v4 setBestScore:v5];
    [(CSNovDetectorResult *)v4 setEarlyWarning:a3->var5];
    [(CSNovDetectorResult *)v4 setIsRescoring:a3->var6];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)getBestAnalyzedResult
{
  novDetect = self->_novDetect;
  if (novDetect)
  {
    novDetect = [(CSNovDetector *)self _getAnalyzedResultFromNdresult:nd_getresults()];
  }
  return novDetect;
}

- (id)getAnalyzedResultForPhId:(unsigned int)a3
{
  novDetect = self->_novDetect;
  if (novDetect)
  {
    if ((int)nd_phrasecount() < 1) {
      uint64_t v5 = nd_getresults();
    }
    else {
      uint64_t v5 = nd_getphraseresults();
    }
    novDetect = [(CSNovDetector *)self _getAnalyzedResultFromNdresult:v5];
  }
  return novDetect;
}

- (unsigned)numResultsAvailable
{
  return nd_phrasecount();
}

- (void)analyzeWavFloatData:(id)a3 numSamples:(unint64_t)a4
{
  novDetect = self->_novDetect;
  uint64_t v6 = [a3 bytes];
  MEMORY[0x1F4168258](novDetect, v6, a4);
}

- (void)analyzeWavData:(id)a3 numSamples:(unint64_t)a4
{
  novDetect = self->_novDetect;
  uint64_t v6 = [a3 bytes];
  MEMORY[0x1F4168250](novDetect, v6, a4);
}

- (void)resetBest
{
}

- (void)reset
{
}

- (void)dealloc
{
  if (self->_novDetect)
  {
    nd_close();
    self->_novDetect = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CSNovDetector;
  [(CSNovDetector *)&v3 dealloc];
}

- (CSNovDetector)initWithConfigPath:(id)a3 resourcePath:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CSNovDetector;
  v8 = [(CSNovDetector *)&v17 init];
  if (!v8) {
    goto LABEL_8;
  }
  v8->_novDetect = (void *)nd_create();
  v9 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[CSNovDetector initWithConfigPath:resourcePath:]";
    __int16 v20 = 2114;
    *(void *)v21 = v6;
    *(_WORD *)&v21[8] = 2114;
    *(void *)&v21[10] = v7;
    _os_log_impl(&dword_1BA1A5000, v9, OS_LOG_TYPE_DEFAULT, "%s Initializing NDAPI using %{public}@, %{public}@", buf, 0x20u);
  }
  [v6 UTF8String];
  [v7 cStringUsingEncoding:4];
  int v10 = nd_initialize();
  if (v10)
  {
    int v11 = v10;
    v12 = (void *)CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v15 = v12;
      uint64_t v16 = nd_error();
      *(_DWORD *)buf = 136315650;
      v19 = "-[CSNovDetector initWithConfigPath:resourcePath:]";
      __int16 v20 = 1026;
      *(_DWORD *)v21 = v11;
      *(_WORD *)&v21[4] = 2082;
      *(void *)&v21[6] = v16;
      _os_log_error_impl(&dword_1BA1A5000, v15, OS_LOG_TYPE_ERROR, "%s Failed to initialize NDAPI: err=[%{public}d]:%{public}s", buf, 0x1Cu);
    }
    v13 = 0;
  }
  else
  {
LABEL_8:
    v13 = v8;
  }

  return v13;
}

@end