@interface CSVADSignalExtractor
- (BOOL)hasSpeechDetectedFromStartSampleCount:(unint64_t)a3 toEndSampleCount:(unint64_t)a4;
- (BOOL)hasSpeechEverDetected;
- (BOOL)isSpeechDetected;
- (CSVADSignalExtractor)initWithToken:(id)a3 delegate:(id)a4;
- (CSVADSignalExtractorDelegate)delegate;
- (NSMutableArray)speechDetectedRanges;
- (unint64_t)lastSpeechStartSampleCount;
- (void)processBufferSampleWithIndex:(unint64_t)a3 startSampleCount:(unint64_t)a4 isSampleRepresentSpeech:(BOOL)a5 vadToSpeechRatio:(unint64_t)a6;
- (void)reset;
- (void)setDelegate:(id)a3;
- (void)setIsSpeechDetected:(BOOL)a3;
- (void)setLastSpeechStartSampleCount:(unint64_t)a3;
- (void)setSpeechDetectedRanges:(id)a3;
@end

@implementation CSVADSignalExtractor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_speechDetectedRanges, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setLastSpeechStartSampleCount:(unint64_t)a3
{
  self->_lastSpeechStartSampleCount = a3;
}

- (unint64_t)lastSpeechStartSampleCount
{
  return self->_lastSpeechStartSampleCount;
}

- (void)setSpeechDetectedRanges:(id)a3
{
}

- (NSMutableArray)speechDetectedRanges
{
  return self->_speechDetectedRanges;
}

- (void)setDelegate:(id)a3
{
}

- (CSVADSignalExtractorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CSVADSignalExtractorDelegate *)WeakRetained;
}

- (void)setIsSpeechDetected:(BOOL)a3
{
  self->_isSpeechDetected = a3;
}

- (BOOL)isSpeechDetected
{
  return self->_isSpeechDetected;
}

- (BOOL)hasSpeechEverDetected
{
  return self->_hasSpeechEverDetected;
}

- (void)processBufferSampleWithIndex:(unint64_t)a3 startSampleCount:(unint64_t)a4 isSampleRepresentSpeech:(BOOL)a5 vadToSpeechRatio:(unint64_t)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_isSpeechDetected || !a5)
  {
    if (self->_isSpeechDetected && !a5)
    {
      self->_isSpeechDetected = 0;
      unint64_t v9 = a4 + a6 * a3;
      v10 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 136315650;
        v22 = "-[CSVADSignalExtractor processBufferSampleWithIndex:startSampleCount:isSampleRepresentSpeech:vadToSpeechRatio:]";
        __int16 v23 = 2050;
        unint64_t v24 = v9;
        __int16 v25 = 2050;
        unint64_t v26 = a4;
        _os_log_impl(&dword_1BA1A5000, v10, OS_LOG_TYPE_DEFAULT, "%s Detected speech end at %{public}llu (startSampleCount = %{public}llu)", (uint8_t *)&v21, 0x20u);
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v12 = objc_opt_respondsToSelector();

      if (v12)
      {
        id v13 = objc_loadWeakRetained((id *)&self->_delegate);
        [v13 vadSignalExtractor:self didDetectedSpeechEndAtSampleCount:v9];
      }
      v14 = [[CSFRangeUtils alloc] initWithStartPoint:self->_lastSpeechStartSampleCount endPoint:v9];
      [(NSMutableArray *)self->_speechDetectedRanges addObject:v14];
      self->_lastSpeechStartSampleCount = 0;
    }
  }
  else
  {
    *(_WORD *)&self->_hasSpeechEverDetected = 257;
    unint64_t v15 = a4 + a6 * a3;
    v16 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = 136315650;
      v22 = "-[CSVADSignalExtractor processBufferSampleWithIndex:startSampleCount:isSampleRepresentSpeech:vadToSpeechRatio:]";
      __int16 v23 = 2050;
      unint64_t v24 = v15;
      __int16 v25 = 2050;
      unint64_t v26 = a4;
      _os_log_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_DEFAULT, "%s Detected speech start at %{public}llu (startSampleCount = %{public}llu)", (uint8_t *)&v21, 0x20u);
    }
    id v18 = objc_loadWeakRetained((id *)&self->_delegate);
    char v19 = objc_opt_respondsToSelector();

    if (v19)
    {
      id v20 = objc_loadWeakRetained((id *)&self->_delegate);
      [v20 vadSignalExtractor:self didDetectedSpeechStartAtSampleCount:v15];
    }
    self->_lastSpeechStartSampleCount = v15;
  }
}

- (BOOL)hasSpeechDetectedFromStartSampleCount:(unint64_t)a3 toEndSampleCount:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v6 = [[CSFRangeUtils alloc] initWithStartPoint:a3 endPoint:a4];
  if (!v6) {
    goto LABEL_13;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v7 = self->_speechDetectedRanges;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        char v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasIntersectionWithRange:", v6, (void)v20))
        {
          unint64_t v15 = (void *)CSLogContextFacilityCoreSpeech;
          if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
          {
            v16 = v15;
            v17 = [v12 description];
            id v18 = [(CSFRangeUtils *)v6 description];
            *(_DWORD *)buf = 136315650;
            __int16 v25 = "-[CSVADSignalExtractor hasSpeechDetectedFromStartSampleCount:toEndSampleCount:]";
            __int16 v26 = 2114;
            uint64_t v27 = v17;
            __int16 v28 = 2114;
            v29 = v18;
            _os_log_impl(&dword_1BA1A5000, v16, OS_LOG_TYPE_DEFAULT, "%s Intersection detected : cached(%{public}@) vs. input(%{public}@)", buf, 0x20u);
          }
          goto LABEL_17;
        }
      }
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v20 objects:v30 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }

  unint64_t lastSpeechStartSampleCount = self->_lastSpeechStartSampleCount;
  if (lastSpeechStartSampleCount - 1 < a4
    || !lastSpeechStartSampleCount
    && ![(NSMutableArray *)self->_speechDetectedRanges count]
    && self->_hasSpeechEverDetected)
  {
LABEL_17:
    BOOL v14 = 1;
  }
  else
  {
LABEL_13:
    BOOL v14 = 0;
  }

  return v14;
}

- (void)reset
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    v5 = "-[CSVADSignalExtractor reset]";
    _os_log_impl(&dword_1BA1A5000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  *(_WORD *)&self->_hasSpeechEverDetected = 0;
  self->_unint64_t lastSpeechStartSampleCount = 0;
  [(NSMutableArray *)self->_speechDetectedRanges removeAllObjects];
}

- (CSVADSignalExtractor)initWithToken:(id)a3 delegate:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)CSVADSignalExtractor;
  uint64_t v8 = [(CSVADSignalExtractor *)&v14 init];
  uint64_t v9 = v8;
  if (v8)
  {
    *(_WORD *)&v8->_hasSpeechEverDetected = 0;
    objc_storeWeak((id *)&v8->_delegate, v7);
    uint64_t v10 = [MEMORY[0x1E4F1CA48] array];
    speechDetectedRanges = v9->_speechDetectedRanges;
    v9->_speechDetectedRanges = (NSMutableArray *)v10;

    v9->_unint64_t lastSpeechStartSampleCount = 0;
    char v12 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[CSVADSignalExtractor initWithToken:delegate:]";
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_1BA1A5000, v12, OS_LOG_TYPE_DEFAULT, "%s Token : %{public}@", buf, 0x16u);
    }
  }

  return v9;
}

@end