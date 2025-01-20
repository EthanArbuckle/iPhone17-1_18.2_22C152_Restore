@interface VCMediaControlInfoIPCamera
- (BOOL)hasInfoType:(unsigned int)a3;
- (VCMediaControlInfoIPCamera)init;
- (VCMediaControlInfoIPCamera)initWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5 version:(unsigned __int8)a6;
- (int)configureWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5;
- (int)getInfo:(void *)a3 bufferLength:(unint64_t)a4 infoSize:(unint64_t *)a5 type:(unsigned int)a6;
- (int)serializeToBuffer:(char *)a3 bufferLength:(unint64_t)a4 blobLength:(unint64_t *)a5;
- (int)setInfo:(void *)a3 size:(unint64_t)a4 type:(unsigned int)a5;
@end

@implementation VCMediaControlInfoIPCamera

- (VCMediaControlInfoIPCamera)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaControlInfoIPCamera;
  result = [(VCMediaControlInfo *)&v3 init];
  if (result)
  {
    result->super._vtableC.serializedSize = VCMediaControlInfoIPCamera_SerializedSize;
    result->super._vtableC.serialize = VCMediaControlInfoIPCamera_SerializeBuffer;
  }
  return result;
}

- (VCMediaControlInfoIPCamera)initWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5 version:(unsigned __int8)a6
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaControlInfoIPCamera;
  result = [(VCMediaControlInfo *)&v7 initWithBuffer:a3 length:a4 optionalControlInfo:a5 version:a6];
  if (result)
  {
    result->super._vtableC.serializedSize = VCMediaControlInfoIPCamera_SerializedSize;
    result->super._vtableC.serialize = VCMediaControlInfoIPCamera_SerializeBuffer;
  }
  return result;
}

- (int)configureWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5
{
  if (!a4) {
    return 0;
  }
  int result = -2144403455;
  if (a3)
  {
    if (a4 > 8)
    {
      return -2144403442;
    }
    else
    {
      self->super._bitmap |= 1u;
      memcpy(self->_controlInfoCVO, a3, a4);
      return 0;
    }
  }
  return result;
}

- (int)setInfo:(void *)a3 size:(unint64_t)a4 type:(unsigned int)a5
{
  if (a5 >= 0x16)
  {
    int v5 = -2144403455;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaControlInfoIPCamera setInfo:size:type:]();
      }
    }
  }
  else if (a5 == 9)
  {
    if (a4 == 8)
    {
      int v5 = 0;
      self->super._bitmap |= 1u;
      *(void *)self->_controlInfoCVO = *(void *)a3;
    }
    else
    {
      return -2144403413;
    }
  }
  else
  {
    int v5 = -2144403455;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaControlInfoIPCamera setInfo:size:type:]();
      }
    }
  }
  return v5;
}

- (BOOL)hasInfoType:(unsigned int)a3
{
  if (a3 == 9) {
    return self->super._bitmap & 1;
  }
  else {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (int)getInfo:(void *)a3 bufferLength:(unint64_t)a4 infoSize:(unint64_t *)a5 type:(unsigned int)a6
{
  int result = -2144403455;
  if (a3 && a6 == 9)
  {
    if (self->super._bitmap)
    {
      if (a4 >= 8)
      {
        *(void *)a3 = *(void *)self->_controlInfoCVO;
        int result = 0;
        if (a5) {
          *a5 = 8;
        }
      }
      else
      {
        return -2144403442;
      }
    }
    else
    {
      return -2144403434;
    }
  }
  return result;
}

- (int)serializeToBuffer:(char *)a3 bufferLength:(unint64_t)a4 blobLength:(unint64_t *)a5
{
  return VCMediaControlInfoIPCamera_SerializeBuffer((uint64_t)self, a3, a4, a5);
}

- (void)setInfo:size:type:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaControlInfoIPCamera setInfo:size:type:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Value passed is invalid type=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoIPCamera setInfo:size:type:]" >> 16, v4);
}

- (void)setInfo:size:type:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaControlInfoIPCamera setInfo:size:type:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Does not support type=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoIPCamera setInfo:size:type:]" >> 16, v4);
}

@end