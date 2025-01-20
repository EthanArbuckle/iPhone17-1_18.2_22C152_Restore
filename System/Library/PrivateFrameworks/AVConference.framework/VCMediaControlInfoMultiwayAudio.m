@interface VCMediaControlInfoMultiwayAudio
- (BOOL)hasInfoType:(unsigned int)a3;
- (VCMediaControlInfoMultiwayAudio)init;
- (VCMediaControlInfoMultiwayAudio)initWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5 version:(unsigned __int8)a6;
- (id)description;
- (int)configureWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5;
- (int)getInfo:(void *)a3 bufferLength:(unint64_t)a4 infoSize:(unint64_t *)a5 type:(unsigned int)a6;
- (int)serializeToBuffer:(char *)a3 bufferLength:(unint64_t)a4 blobLength:(unint64_t *)a5;
- (int)setInfo:(void *)a3 size:(unint64_t)a4 type:(unsigned int)a5;
@end

@implementation VCMediaControlInfoMultiwayAudio

- (VCMediaControlInfoMultiwayAudio)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaControlInfoMultiwayAudio;
  result = [(VCMediaControlInfo *)&v3 init];
  if (result)
  {
    result->super._vtableC.serializedSize = VCMediaControlInfoMultiwayAudio_SerializedSize;
    result->super._vtableC.serialize = VCMediaControlInfoMultiwayAudio_SerializeBuffer;
  }
  return result;
}

- (VCMediaControlInfoMultiwayAudio)initWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5 version:(unsigned __int8)a6
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaControlInfoMultiwayAudio;
  result = [(VCMediaControlInfo *)&v7 initWithBuffer:a3 length:a4 optionalControlInfo:a5 version:a6];
  if (result)
  {
    result->super._vtableC.serializedSize = VCMediaControlInfoMultiwayAudio_SerializedSize;
    result->super._vtableC.serialize = VCMediaControlInfoMultiwayAudio_SerializeBuffer;
  }
  return result;
}

- (id)description
{
  objc_super v3 = objc_opt_new();
  unsigned __int16 bitmap = self->super._bitmap;
  if (bitmap)
  {
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"ROC %08X size %ld, ", self->_controlInfoROC, 4)];
    unsigned __int16 bitmap = self->super._bitmap;
  }
  if ((bitmap & 2) != 0) {
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"MKI %08X size %ld, ", self->_controlInfoMKI, 4)];
  }

  return v3;
}

- (int)configureWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5
{
  if (!a4) {
    return 0;
  }
  int v6 = -2144403413;
  if (!a3) {
    return -2144403455;
  }
  if (a4 > 7)
  {
    [(VCMediaControlInfoMultiwayAudio *)self setInfo:a3 size:4 type:19];
    [(VCMediaControlInfoMultiwayAudio *)self setInfo:a3 + 4 size:4 type:20];
    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCMediaControlInfoMultiwayAudio configureWithBuffer:length:optionalControlInfo:]();
    }
  }
  return v6;
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
        -[VCMediaControlInfoMultiwayAudio setInfo:size:type:]();
      }
    }
  }
  else
  {
    if (a5 >= 0x13 && a5 != 21)
    {
      if (a5 == 20)
      {
        if (a4 == 4)
        {
          int v5 = 0;
          self->super._bitmap |= 0x14u;
          int v7 = *(_DWORD *)a3;
          uint64_t v8 = 68;
          goto LABEL_13;
        }
      }
      else if (a4 == 4)
      {
        int v5 = 0;
        self->super._bitmap |= 1u;
        int v7 = *(_DWORD *)a3;
        uint64_t v8 = 64;
LABEL_13:
        *(_DWORD *)((char *)&self->super.super.isa + v8) = v7;
        return v5;
      }
      return -2144403413;
    }
    int v5 = -2144403455;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaControlInfoMultiwayAudio setInfo:size:type:]();
      }
    }
  }
  return v5;
}

- (BOOL)hasInfoType:(unsigned int)a3
{
  if (a3 == 19)
  {
    __int16 v3 = 1;
    return (unsigned __int16)(self->super._bitmap & v3) != 0;
  }
  if (a3 == 20)
  {
    __int16 v3 = 2;
    return (unsigned __int16)(self->super._bitmap & v3) != 0;
  }
  return 0;
}

- (int)getInfo:(void *)a3 bufferLength:(unint64_t)a4 infoSize:(unint64_t *)a5 type:(unsigned int)a6
{
  int result = -2144403455;
  if (a3)
  {
    if (a6 == 20)
    {
      if ((self->super._bitmap & 2) != 0)
      {
        if (a4 >= 4)
        {
          uint64_t v8 = 68;
LABEL_12:
          *(_DWORD *)a3 = *(_DWORD *)((char *)&self->super.super.isa + v8);
          int result = 0;
          if (a5) {
            *a5 = 4;
          }
          return result;
        }
        return -2144403442;
      }
    }
    else
    {
      if (a6 != 19) {
        return result;
      }
      if (self->super._bitmap)
      {
        if (a4 >= 4)
        {
          uint64_t v8 = 64;
          goto LABEL_12;
        }
        return -2144403442;
      }
    }
    return -2144403434;
  }
  return result;
}

- (int)serializeToBuffer:(char *)a3 bufferLength:(unint64_t)a4 blobLength:(unint64_t *)a5
{
  return VCMediaControlInfoMultiwayAudio_SerializeBuffer((uint64_t)self, a3, a4, a5);
}

- (void)configureWithBuffer:length:optionalControlInfo:.cold.1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v4 = 1695;
  __int16 v5 = 2048;
  uint64_t v6 = v0;
  __int16 v7 = v1;
  int v8 = 8;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Bad buffer length(%zu) for Multiway audio media control info, expecting %u", v3, 0x2Cu);
}

- (void)setInfo:size:type:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaControlInfoMultiwayAudio setInfo:size:type:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Value passed is invalid type=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoMultiwayAudio setInfo:size:type:]" >> 16, v4);
}

- (void)setInfo:size:type:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaControlInfoMultiwayAudio setInfo:size:type:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Does not support type=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoMultiwayAudio setInfo:size:type:]" >> 16, v4);
}

@end