@interface AVCCaptionsResult
- (AVCCaptionsResult)initWithCapacity:(int64_t)a3 utteranceComplete:(BOOL)a4 utteranceNumber:(unsigned int)a5 updateNumber:(unsigned int)a6 utteranceStartTimestamp:(double)a7 utteranceDuration:(double)a8;
- (BOOL)addTokenWithString:(id)a3 confidence:(double)a4 range:(_NSRange)a5;
- (BOOL)utteranceComplete;
- (NSArray)segments;
- (NSArray)tokens;
- (NSString)text;
- (double)utteranceDuration;
- (double)utteranceStartTimestamp;
- (id)description;
- (unsigned)updateNumber;
- (unsigned)utteranceNumber;
- (void)dealloc;
@end

@implementation AVCCaptionsResult

- (AVCCaptionsResult)initWithCapacity:(int64_t)a3 utteranceComplete:(BOOL)a4 utteranceNumber:(unsigned int)a5 updateNumber:(unsigned int)a6 utteranceStartTimestamp:(double)a7 utteranceDuration:(double)a8
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)AVCCaptionsResult;
  v14 = [(AVCCaptionsResult *)&v18 init];
  if (v14)
  {
    uint64_t v15 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    v14->_tokens = (NSMutableArray *)v15;
    if (v15)
    {
      v14->_utteranceComplete = a4;
      v14->_utteranceNumber = a5;
      v14->_updateNumber = a6;
      v14->_utteranceStartTimestamp = a7;
      v14->_utteranceDuration = a8;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCCaptionsResult initWithCapacity:utteranceComplete:utteranceNumber:updateNumber:utteranceStartTimestamp:utteranceDuration:](v16);
        }
      }

      return 0;
    }
  }
  return v14;
}

- (BOOL)addTokenWithString:(id)a3 confidence:(double)a4 range:(_NSRange)a5
{
  v6 = -[AVCCaptionsToken initWithText:confidence:range:]([AVCCaptionsToken alloc], "initWithText:confidence:range:", a3, a5.location, a5.length, a4);
  if (v6)
  {
    [(NSMutableArray *)self->_tokens addObject:v6];
  }
  return v6 != 0;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVCCaptionsResult;
  [(AVCCaptionsResult *)&v3 dealloc];
}

- (id)description
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  objc_super v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)AVCCaptionsResult;
  id v4 = [(AVCCaptionsResult *)&v7 description];
  if (self->_utteranceComplete) {
    v5 = "YES";
  }
  else {
    v5 = "NO";
  }
  return (id)[v3 stringWithFormat:@"%@ tokens=%@, utteranceCompleted=%s, utteranceStartTimestamp=%f, utteranceDuration=%f", v4, self->_tokens, v5, *(void *)&self->_utteranceStartTimestamp, *(void *)&self->_utteranceDuration];
}

- (NSArray)segments
{
  return &self->_tokens->super;
}

- (NSString)text
{
  return (NSString *)+[VCCaptionsUtilities formattedTextWithTranscription:self];
}

- (BOOL)utteranceComplete
{
  return self->_utteranceComplete;
}

- (NSArray)tokens
{
  return &self->_tokens->super;
}

- (unsigned)utteranceNumber
{
  return self->_utteranceNumber;
}

- (unsigned)updateNumber
{
  return self->_updateNumber;
}

- (double)utteranceStartTimestamp
{
  return self->_utteranceStartTimestamp;
}

- (double)utteranceDuration
{
  return self->_utteranceDuration;
}

- (void)initWithCapacity:(uint64_t)a1 utteranceComplete:utteranceNumber:updateNumber:utteranceStartTimestamp:utteranceDuration:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 76;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, "AVCCaptions [%s] %s:%d Failed to allocate closed captions token array", (uint8_t *)&v2, 0x1Cu);
}

@end