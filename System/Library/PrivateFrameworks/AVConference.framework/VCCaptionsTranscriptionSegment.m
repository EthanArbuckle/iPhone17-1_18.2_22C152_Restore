@interface VCCaptionsTranscriptionSegment
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)text;
- (VCCaptionsTranscriptionSegment)initWithCoder:(id)a3;
- (VCCaptionsTranscriptionSegment)initWithConfidence:(unsigned int)a3 text:(id)a4 range:(_NSRange)a5;
- (_NSRange)range;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (unsigned)confidence;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation VCCaptionsTranscriptionSegment

- (VCCaptionsTranscriptionSegment)initWithConfidence:(unsigned int)a3 text:(id)a4 range:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCCaptionsTranscriptionSegment;
  v9 = [(VCCaptionsTranscriptionSegment *)&v11 init];
  if (v9)
  {
    v9->_text = (NSString *)[a4 copy];
    v9->_range.NSUInteger location = location;
    v9->_range.NSUInteger length = length;
    v9->_confidence = a3;
    if (a3 >= 0x65)
    {

      return 0;
    }
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCCaptionsTranscriptionSegment;
  [(VCCaptionsTranscriptionSegment *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = +[VCCaptionsTranscriptionSegment allocWithZone:a3];
  uint64_t confidence = self->_confidence;
  text = self->_text;
  NSUInteger location = self->_range.location;
  NSUInteger length = self->_range.length;

  return -[VCCaptionsTranscriptionSegment initWithConfidence:text:range:](v4, "initWithConfidence:text:range:", confidence, text, location, length);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_text forKey:@"segmentText"];
  [a3 encodeInt32:self->_confidence forKey:@"segmentConfidence"];
  [a3 encodeInt32:LODWORD(self->_range.length) forKey:@"segmentLength"];
  uint64_t location_low = LODWORD(self->_range.location);

  [a3 encodeInt32:location_low forKey:@"segmentLocation"];
}

- (VCCaptionsTranscriptionSegment)initWithCoder:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)VCCaptionsTranscriptionSegment;
  uint64_t v4 = [(VCCaptionsTranscriptionSegment *)&v6 init];
  if (v4)
  {
    if ([a3 containsValueForKey:@"segmentConfidence"])
    {
      v4->_uint64_t confidence = [a3 decodeInt32ForKey:@"segmentConfidence"];
      if ([a3 containsValueForKey:@"segmentLength"])
      {
        v4->_range.NSUInteger length = (int)[a3 decodeInt32ForKey:@"segmentLength"];
        if ([a3 containsValueForKey:@"segmentLocation"])
        {
          v4->_range.NSUInteger location = (int)[a3 decodeInt32ForKey:@"segmentLocation"];
          if ([a3 containsValueForKey:@"segmentText"])
          {
            v4->_text = (NSString *)(id)[a3 decodeObjectForKey:@"segmentText"];
          }
          else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCCaptionsTranscriptionSegment initWithCoder:]();
            }
          }
        }
        else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCCaptionsTranscriptionSegment initWithCoder:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCCaptionsTranscriptionSegment initWithCoder:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCCaptionsTranscriptionSegment initWithCoder:].cold.4();
      }
    }
    if (!v4->_text)
    {

      return 0;
    }
  }
  return v4;
}

- (id)description
{
  objc_super v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  return (id)[v3 stringWithFormat:@"%@<%p> confidence=%u range=%@", v5, self, self->_confidence, NSStringFromRange(self->_range)];
}

- (unint64_t)hash
{
  uint64_t confidence = self->_confidence;
  return [(NSString *)self->_text hash] ^ confidence ^ self->_range.length ^ self->_range.location;
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3) {
    return 1;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  int v5 = [a3 confidence];
  if (v5 != [(VCCaptionsTranscriptionSegment *)self confidence]) {
    return 0;
  }
  uint64_t v6 = [a3 range];
  uint64_t v8 = v7;
  uint64_t v10 = [(VCCaptionsTranscriptionSegment *)self range];
  BOOL result = 0;
  if (v6 == v10 && v8 == v9)
  {
    uint64_t v12 = (void *)[a3 text];
    v13 = [(VCCaptionsTranscriptionSegment *)self text];
    return [v12 isEqual:v13];
  }
  return result;
}

- (unsigned)confidence
{
  return self->_confidence;
}

- (NSString)text
{
  return self->_text;
}

- (_NSRange)range
{
  NSUInteger length = self->_range.length;
  NSUInteger location = self->_range.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)initWithCoder:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode segment text", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode is local", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode is local", v2, v3, v4, v5, v6);
}

- (void)initWithCoder:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decode update number", v2, v3, v4, v5, v6);
}

@end