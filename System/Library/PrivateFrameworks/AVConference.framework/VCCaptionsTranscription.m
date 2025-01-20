@interface VCCaptionsTranscription
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFinal;
- (BOOL)isLocal;
- (NSArray)segments;
- (NSString)formattedText;
- (VCCaptionsTranscription)initWithCoder:(id)a3;
- (VCCaptionsTranscription)initWithSFTranscription:(id)a3 taskInfo:(id)a4 isLocal:(BOOL)a5 isFinal:(BOOL)a6;
- (VCCaptionsTranscription)initWithSTTranscriberMultisegmentResult:(id)a3 taskInfo:(id)a4 isLocal:(BOOL)a5 isFinal:(BOOL)a6;
- (VCCaptionsTranscription)initWithUtteranceNumber:(unsigned int)a3 updateNumber:(unsigned int)a4 isLocal:(BOOL)a5 isFinal:(BOOL)a6 streamToken:(int64_t)a7;
- (double)utteranceDuration;
- (double)utteranceStartTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int64_t)streamToken;
- (unint64_t)hash;
- (unsigned)updateNumber;
- (unsigned)utteranceNumber;
- (void)addSegment:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setIsFinal:(BOOL)a3;
- (void)setIsLocal:(BOOL)a3;
- (void)setUpUtteranceStartTimestamp:(double)a3 andUtteranceDuration:(double)a4;
- (void)setUpdateNumber:(unsigned int)a3;
- (void)setUtteranceNumber:(unsigned int)a3;
@end

@implementation VCCaptionsTranscription

- (void)setUpUtteranceStartTimestamp:(double)a3 andUtteranceDuration:(double)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  self->_double utteranceStartTimestamp = a3;
  self->_double utteranceDuration = a4;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      double utteranceStartTimestamp = self->_utteranceStartTimestamp;
      double utteranceDuration = self->_utteranceDuration;
      int v9 = 136316162;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      v12 = "-[VCCaptionsTranscription setUpUtteranceStartTimestamp:andUtteranceDuration:]";
      __int16 v13 = 1024;
      int v14 = 49;
      __int16 v15 = 2048;
      double v16 = utteranceStartTimestamp;
      __int16 v17 = 2048;
      double v18 = utteranceDuration;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d utteranceStartTimestamp=%f utteranceDuration=%f", (uint8_t *)&v9, 0x30u);
    }
  }
}

- (VCCaptionsTranscription)initWithUtteranceNumber:(unsigned int)a3 updateNumber:(unsigned int)a4 isLocal:(BOOL)a5 isFinal:(BOOL)a6 streamToken:(int64_t)a7
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)VCCaptionsTranscription;
  v12 = [(VCCaptionsTranscription *)&v15 init];
  __int16 v13 = v12;
  if (v12)
  {
    v12->_utteranceNumber = a3;
    v12->_updateNumber = a4;
    v12->_isLocal = a5;
    v12->_isFinal = a6;
    v12->_segments = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v13->_streamToken = a7;
    *(int64x2_t *)&v13->_double utteranceStartTimestamp = vdupq_n_s64(0x7FF8000000000000uLL);
  }
  return v13;
}

- (VCCaptionsTranscription)initWithSFTranscription:(id)a3 taskInfo:(id)a4 isLocal:(BOOL)a5 isFinal:(BOOL)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  v8 = -[VCCaptionsTranscription initWithUtteranceNumber:updateNumber:isLocal:isFinal:streamToken:](self, "initWithUtteranceNumber:updateNumber:isLocal:isFinal:streamToken:", [a4 utteranceNumber], objc_msgSend(a4, "updateNumber"), a5, a6, objc_msgSend(a4, "token"));
  if (v8)
  {
    int v9 = v8;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v10 = (void *)[a3 segments];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v27 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v29;
      double v14 = 0.0;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v29 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          __int16 v17 = [VCCaptionsTranscriptionSegment alloc];
          [v16 confidence];
          uint64_t v19 = (float)(v18 * 100.0);
          uint64_t v20 = [v16 substring];
          uint64_t v21 = [v16 substringRange];
          uint64_t v23 = -[VCCaptionsTranscriptionSegment initWithConfidence:text:range:](v17, "initWithConfidence:text:range:", v19, v20, v21, v22);
          if (!v23)
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCCaptionsTranscription initWithSFTranscription:taskInfo:isLocal:isFinal:]();
              }
            }

            return 0;
          }
          v24 = (void *)v23;
          [(NSMutableArray *)v9->_segments addObject:v23];

          [v16 duration];
          double v14 = v14 + v25;
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v28 objects:v27 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      double v14 = 0.0;
    }
    [(VCCaptionsTranscription *)v9 setUpUtteranceStartTimestamp:VCCaptionTaskInfo_HostTime((uint64_t)a4) andUtteranceDuration:v14];
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCaptionsTranscription initWithSFTranscription:taskInfo:isLocal:isFinal:]();
      }
    }
    return 0;
  }
  return v9;
}

- (VCCaptionsTranscription)initWithSTTranscriberMultisegmentResult:(id)a3 taskInfo:(id)a4 isLocal:(BOOL)a5 isFinal:(BOOL)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v8 = -[VCCaptionsTranscription initWithUtteranceNumber:updateNumber:isLocal:isFinal:streamToken:](self, "initWithUtteranceNumber:updateNumber:isLocal:isFinal:streamToken:", [a4 utteranceNumber], objc_msgSend(a4, "updateNumber"), a5, a6, objc_msgSend(a4, "token"));
  if (!v8)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCaptionsTranscription initWithSTTranscriberMultisegmentResult:taskInfo:isLocal:isFinal:]();
      }
    }
    return 0;
  }
  int v9 = v8;
  id v23 = a3;
  uint64_t v10 = (void *)[a3 segments];
  if ([v10 count])
  {
    unint64_t v11 = 0;
    v24 = v10;
    while (1)
    {
      uint64_t v12 = (void *)[v10 objectAtIndexedSubscript:v11];
      if (objc_msgSend((id)objc_msgSend(v12, "text"), "count")) {
        break;
      }
LABEL_8:
      ++v11;
      uint64_t v10 = v24;
      if (v11 >= [v24 count]) {
        goto LABEL_9;
      }
    }
    uint64_t v13 = 0;
    uint64_t v14 = 0;
    while (1)
    {
      objc_super v15 = objc_msgSend((id)objc_msgSend(v12, "text"), "objectAtIndexedSubscript:", v14);
      uint64_t v16 = objc_msgSend((id)objc_msgSend(v15, "text"), "length");
      __int16 v17 = [VCCaptionsTranscriptionSegment alloc];
      [v15 confidence];
      uint64_t v19 = -[VCCaptionsTranscriptionSegment initWithConfidence:text:range:](v17, "initWithConfidence:text:range:", (v18 * 100.0), [v15 text], v13, v16);
      if (!v19) {
        break;
      }
      uint64_t v20 = (void *)v19;
      v13 += objc_msgSend((id)objc_msgSend(v15, "text"), "length");
      [(NSMutableArray *)v9->_segments addObject:v20];

      if (++v14 >= (unint64_t)objc_msgSend((id)objc_msgSend(v12, "text"), "count")) {
        goto LABEL_8;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCaptionsTranscription initWithSTTranscriberMultisegmentResult:taskInfo:isLocal:isFinal:]();
      }
    }

    return 0;
  }
LABEL_9:
  double v21 = VCCaptionTaskInfo_HostTime((uint64_t)a4);
  if (v23) {
    [v23 recognitionAudioRange];
  }
  else {
    memset(v25, 0, sizeof(v25));
  }
  CMTime time = *(CMTime *)&v25[1];
  [(VCCaptionsTranscription *)v9 setUpUtteranceStartTimestamp:v21 andUtteranceDuration:CMTimeGetSeconds(&time)];
  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsTranscription;
  [(VCCaptionsTranscription *)&v3 dealloc];
}

- (NSString)formattedText
{
  result = &self->_formattedText->super;
  if (!result)
  {
    result = (NSString *)objc_msgSend(+[VCCaptionsUtilities formattedTextWithTranscription:](VCCaptionsUtilities, "formattedTextWithTranscription:", self), "copy");
    self->_formattedText = (NSMutableString *)result;
  }
  return result;
}

- (void)addSegment:(id)a3
{
  self->_formattedText = 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [+[VCCaptionsTranscription allocWithZone:](VCCaptionsTranscription, "allocWithZone:") initWithUtteranceNumber:self->_utteranceNumber updateNumber:self->_updateNumber isLocal:self->_isLocal isFinal:self->_isFinal streamToken:self->_streamToken];
  [(VCCaptionsTranscription *)v5 setUpUtteranceStartTimestamp:self->_utteranceStartTimestamp andUtteranceDuration:self->_utteranceDuration];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  segments = self->_segments;
  uint64_t v7 = [(NSMutableArray *)segments countByEnumeratingWithState:&v14 objects:v13 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(segments);
        }
        unint64_t v11 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * v10) copyWithZone:a3];
        [(VCCaptionsTranscription *)v5 addSegment:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)segments countByEnumeratingWithState:&v14 objects:v13 count:16];
    }
    while (v8);
  }
  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInt32:self->_utteranceNumber forKey:@"utteranceNumber"];
  [a3 encodeInt32:self->_updateNumber forKey:@"updateNumber"];
  [a3 encodeBool:self->_isLocal forKey:@"isLocal"];
  [a3 encodeBool:self->_isFinal forKey:@"isFinal"];
  [a3 encodeObject:self->_segments forKey:@"segments"];
  [a3 encodeDouble:@"utteranceStartTimestamp" forKey:self->_utteranceStartTimestamp];
  double utteranceDuration = self->_utteranceDuration;

  [a3 encodeDouble:@"utteranceDuration" forKey:utteranceDuration];
}

- (VCCaptionsTranscription)initWithCoder:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)VCCaptionsTranscription;
  uint64_t v4 = [(VCCaptionsTranscription *)&v8 init];
  if (v4)
  {
    if ([a3 containsValueForKey:@"utteranceNumber"])
    {
      v4->_utteranceNumber = [a3 decodeInt32ForKey:@"utteranceNumber"];
      if ([a3 containsValueForKey:@"updateNumber"])
      {
        v4->_updateNumber = [a3 decodeInt32ForKey:@"updateNumber"];
        if ([a3 containsValueForKey:@"isLocal"])
        {
          v4->_isLocal = [a3 decodeBoolForKey:@"isLocal"];
          if ([a3 containsValueForKey:@"isFinal"])
          {
            v4->_isFinal = [a3 decodeBoolForKey:@"isFinal"];
            if ([a3 containsValueForKey:@"segments"])
            {
              v4->_segments = (NSMutableArray *)objc_msgSend((id)objc_msgSend(a3, "decodeObjectForKey:", @"segments"), "copy");
              if ([a3 containsValueForKey:@"utteranceStartTimestamp"])
              {
                [a3 decodeDoubleForKey:@"utteranceStartTimestamp"];
                v4->_double utteranceStartTimestamp = v5;
                if ([a3 containsValueForKey:@"utteranceDuration"])
                {
                  [a3 decodeDoubleForKey:@"utteranceDuration"];
                  v4->_double utteranceDuration = v6;
                  return v4;
                }
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCCaptionsTranscription initWithCoder:]();
                  }
                }
              }
              else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
              {
                VRTraceErrorLogLevelToCSTR();
                if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                  -[VCCaptionsTranscription initWithCoder:]();
                }
              }
            }
            else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
            {
              VRTraceErrorLogLevelToCSTR();
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                -[VCCaptionsTranscription initWithCoder:]();
              }
            }
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCCaptionsTranscription initWithCoder:].cold.4();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCCaptionsTranscription initWithCoder:].cold.5();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCaptionsTranscription initWithCoder:].cold.6();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCaptionsTranscription initWithCoder:].cold.7();
      }
    }

    return 0;
  }
  return v4;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"%@<%p> utteranceNumber=%u, updateNumber=%u, isLocal=%d, isFinal=%d, streamToken=%ld, utteranceStartTimestamp=%f, utteranceDuration=%f, segments=%@", NSStringFromClass(v4), self, self->_utteranceNumber, self->_updateNumber, self->_isLocal, self->_isFinal, self->_streamToken, *(void *)&self->_utteranceStartTimestamp, *(void *)&self->_utteranceDuration, self->_segments];
}

- (unint64_t)hash
{
  unsigned int utteranceNumber = self->_utteranceNumber;
  unsigned int updateNumber = self->_updateNumber;
  BOOL isLocal = self->_isLocal;
  BOOL isFinal = self->_isFinal;
  uint64_t v7 = [(NSMutableArray *)self->_segments hash];
  if (isLocal) {
    int v8 = 4236;
  }
  else {
    int v8 = 7112;
  }
  if (isFinal) {
    int v9 = 4236;
  }
  else {
    int v9 = 7112;
  }
  return v7 ^ *(void *)&self->_utteranceStartTimestamp ^ updateNumber ^ utteranceNumber ^ v8 ^ v9 ^ *(void *)&self->_utteranceDuration;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (int v5 = [a3 utteranceNumber],
          v5 == [(VCCaptionsTranscription *)self utteranceNumber])
      && (int v6 = [a3 updateNumber], v6 == -[VCCaptionsTranscription updateNumber](self, "updateNumber"))
      && (int v7 = [a3 isLocal], v7 == -[VCCaptionsTranscription isLocal](self, "isLocal"))
      && (int v8 = [a3 isFinal], v8 == -[VCCaptionsTranscription isFinal](self, "isFinal")))
    {
      int v9 = objc_msgSend((id)objc_msgSend(a3, "segments"), "isEqual:", -[VCCaptionsTranscription segments](self, "segments"));
      if (v9)
      {
        [a3 utteranceStartTimestamp];
        double v11 = v10;
        [(VCCaptionsTranscription *)self utteranceStartTimestamp];
        int v9 = VCMathUtils_DoubleEqualWithAccuracy(v11, v12, 0.0000625);
        if (v9)
        {
          [a3 utteranceDuration];
          double v14 = v13;
          [(VCCaptionsTranscription *)self utteranceDuration];
          LOBYTE(v9) = VCMathUtils_DoubleEqualWithAccuracy(v14, v15, 0.0000625);
        }
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  return v9;
}

- (unsigned)utteranceNumber
{
  return self->_utteranceNumber;
}

- (void)setUtteranceNumber:(unsigned int)a3
{
  self->_unsigned int utteranceNumber = a3;
}

- (unsigned)updateNumber
{
  return self->_updateNumber;
}

- (void)setUpdateNumber:(unsigned int)a3
{
  self->_unsigned int updateNumber = a3;
}

- (BOOL)isLocal
{
  return self->_isLocal;
}

- (void)setIsLocal:(BOOL)a3
{
  self->_BOOL isLocal = a3;
}

- (BOOL)isFinal
{
  return self->_isFinal;
}

- (void)setIsFinal:(BOOL)a3
{
  self->_BOOL isFinal = a3;
}

- (NSArray)segments
{
  return &self->_segments->super;
}

- (int64_t)streamToken
{
  return self->_streamToken;
}

- (double)utteranceStartTimestamp
{
  return self->_utteranceStartTimestamp;
}

- (double)utteranceDuration
{
  return self->_utteranceDuration;
}

- (void)initWithSFTranscription:taskInfo:isLocal:isFinal:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to init captions transcription VCCaptionsTranscription from speech framework transcription.", v2, v3, v4, v5, v6);
}

- (void)initWithSFTranscription:taskInfo:isLocal:isFinal:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to init captions transcription segment from speech framework transcription.", v2, v3, v4, v5, v6);
}

- (void)initWithSTTranscriberMultisegmentResult:taskInfo:isLocal:isFinal:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to init captions transcription VCCaptionsTranscription from transcriber multisegment result.", v2, v3, v4, v5, v6);
}

- (void)initWithSTTranscriberMultisegmentResult:taskInfo:isLocal:isFinal:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to init captions transcription segment from transcriber multisegment result.", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode utterance duration", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode utterance start timestamp", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode segments", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode is final", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode is local", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode update number", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode utterance number", v2, v3, v4, v5, v6);
}

@end