@interface AVCCaptionsToken
- (AVCCaptionsToken)initWithText:(id)a3 confidence:(double)a4 range:(_NSRange)a5;
- (NSString)text;
- (_NSRange)range;
- (double)confidence;
- (id)description;
- (void)dealloc;
@end

@implementation AVCCaptionsToken

- (AVCCaptionsToken)initWithText:(id)a3 confidence:(double)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)AVCCaptionsToken;
  v9 = [(AVCCaptionsToken *)&v12 init];
  if (v9)
  {
    if (a3)
    {
      v9->_text = (NSString *)[a3 copy];
      v9->_confidence = a4;
      v9->_range.NSUInteger location = location;
      v9->_range.NSUInteger length = length;
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[AVCCaptionsToken initWithText:confidence:range:](v10);
        }
      }

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)AVCCaptionsToken;
  [(AVCCaptionsToken *)&v3 dealloc];
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)[v3 stringWithFormat:@"%@: confidence[%f] range[%@]", v5, *(void *)&self->_confidence, NSStringFromRange(self->_range)];
}

- (NSString)text
{
  return self->_text;
}

- (double)confidence
{
  return self->_confidence;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)initWithText:(uint64_t)a1 confidence:range:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 44;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, "AVCCaptions [%s] %s:%d Invalid closed captions token received", (uint8_t *)&v2, 0x1Cu);
}

@end