@interface VCMediaControlInfoFaceTimeVideo
- (BOOL)hasInfoType:(unsigned int)a3;
- (VCMediaControlInfoFaceTimeVideo)init;
- (VCMediaControlInfoFaceTimeVideo)initWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5 version:(unsigned __int8)a6;
- (id)description;
- (int)configureWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5;
- (int)getInfo:(void *)a3 bufferLength:(unint64_t)a4 infoSize:(unint64_t *)a5 type:(unsigned int)a6;
- (int)handleOptionalControlInfo:(id *)a3;
- (int)serializeToBuffer:(char *)a3 bufferLength:(unint64_t)a4 blobLength:(unint64_t *)a5;
- (int)setInfo:(void *)a3 size:(unint64_t)a4 type:(unsigned int)a5;
@end

@implementation VCMediaControlInfoFaceTimeVideo

- (VCMediaControlInfoFaceTimeVideo)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaControlInfoFaceTimeVideo;
  result = [(VCMediaControlInfo *)&v3 init];
  if (result)
  {
    result->super._vtableC.serializedSize = VCMediaControlInfoFaceTimeVideo_SerializedSize;
    result->super._vtableC.serialize = VCMediaControlInfoFaceTimeVideo_SerializeBuffer;
  }
  return result;
}

- (VCMediaControlInfoFaceTimeVideo)initWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5 version:(unsigned __int8)a6
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaControlInfoFaceTimeVideo;
  result = [(VCMediaControlInfo *)&v7 initWithBuffer:a3 length:a4 optionalControlInfo:a5 version:a6];
  if (result)
  {
    result->super._vtableC.serializedSize = VCMediaControlInfoFaceTimeVideo_SerializedSize;
    result->super._vtableC.serialize = VCMediaControlInfoFaceTimeVideo_SerializeBuffer;
  }
  return result;
}

- (id)description
{
  objc_super v3 = objc_opt_new();
  [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"_version = %u, _bitmap 0x%x. :", self->super._version, self->super._bitmap)];
  unsigned __int16 bitmap = self->super._bitmap;
  if ((bitmap & 0x10) != 0)
  {
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"camera status %08X size %ld, ", self->_controlInfoCameraStatus, 1)];
    unsigned __int16 bitmap = self->super._bitmap;
    if ((bitmap & 0x100) == 0)
    {
LABEL_3:
      if ((bitmap & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((self->super._bitmap & 0x100) == 0)
  {
    goto LABEL_3;
  }
  [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"LTR bits %08X size %ld, ", self->_controlInfoLTRBits, 1)];
  unsigned __int16 bitmap = self->super._bitmap;
  if ((bitmap & 2) == 0)
  {
LABEL_4:
    if ((bitmap & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"LTR timestamp %08X size %ld, ", self->_controlInfoLTRTimestamp, 4)];
  unsigned __int16 bitmap = self->super._bitmap;
  if ((bitmap & 1) == 0)
  {
LABEL_5:
    if ((bitmap & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"Frame Support Information \n"];
  [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"     %25s = %10d\n", "Total # Packets Per Frame", self->_controlInfoFrameExtensionData.totalPacketsPerFrame)];
  [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"     %25s = %10d\n", "Frame Sequence Number", self->_controlInfoFrameExtensionData.frameSequenceNumber)];
  unsigned __int16 bitmap = self->super._bitmap;
  if ((bitmap & 4) == 0)
  {
LABEL_6:
    if ((bitmap & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"FEC size %ld, ", self->_controlInfoFECLength)];
  if ((self->super._bitmap & 8) != 0) {
LABEL_7:
  }
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"probe %08X, size %ld, ", self->_controlInfoProbe, 4)];
LABEL_8:

  return v3;
}

- (int)handleOptionalControlInfo:(id *)a3
{
  if (a3)
  {
    [(VCMediaControlInfoFaceTimeVideo *)self setInfo:a3 size:8 type:10];
    [(VCMediaControlInfoFaceTimeVideo *)self setInfo:&a3->var1 size:4 type:16];
    [(VCMediaControlInfoFaceTimeVideo *)self setInfo:&a3->var6 size:4 type:17];
    [(VCMediaControlInfoFaceTimeVideo *)self setInfo:&a3->var5 size:4 type:12];
    [(VCMediaControlInfoFaceTimeVideo *)self setInfo:&a3->var4 size:4 type:11];
  }
  return 0;
}

- (int)configureWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5
{
  unint64_t v5 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  if (a4 <= 3)
  {
    int v6 = -2144403413;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaControlInfoFaceTimeVideo configureWithBuffer:length:optionalControlInfo:]();
      }
    }
    return v6;
  }
  unsigned int v8 = *(unsigned __int16 *)a3;
  int v9 = v8 >> 6;
  if (v9 != self->super._version)
  {
    int v19 = v8 >> 6;
    int v6 = -2144403447;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v6;
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v6;
    }
    int version = self->super._version;
    int v30 = 136316162;
    uint64_t v31 = v21;
    __int16 v32 = 2080;
    v33 = "-[VCMediaControlInfoFaceTimeVideo configureWithBuffer:length:optionalControlInfo:]";
    __int16 v34 = 1024;
    int v35 = 1209;
    __int16 v36 = 1024;
    *(_DWORD *)v37 = v19;
    *(_WORD *)&v37[4] = 1024;
    *(_DWORD *)&v37[6] = version;
    v24 = " [%s] %s:%d Bad version(%u) for FaceTime video media control info, expecting %u";
    v25 = v22;
    uint32_t v26 = 40;
LABEL_31:
    _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, v24, (uint8_t *)&v30, v26);
    return v6;
  }
  unsigned int v10 = *((unsigned __int16 *)a3 + 1);
  signed int v11 = bswap32(v10) >> 14;
  if (v11 + 4 != a4)
  {
    uint64_t v27 = (v11 + 4);
    int v6 = -2144403413;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v6;
    }
    uint64_t v28 = VRTraceErrorLogLevelToCSTR();
    v29 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v6;
    }
    int v30 = 136316162;
    uint64_t v31 = v28;
    __int16 v32 = 2080;
    v33 = "-[VCMediaControlInfoFaceTimeVideo configureWithBuffer:length:optionalControlInfo:]";
    __int16 v34 = 1024;
    int v35 = 1213;
    __int16 v36 = 2048;
    *(void *)v37 = v5;
    *(_WORD *)&v37[8] = 2048;
    uint64_t v38 = v27;
    v24 = " [%s] %s:%d Bad data length(%zu) for FaceTime video media control info, expecting %lu";
    v25 = v29;
    uint32_t v26 = 48;
    goto LABEL_31;
  }
  self->super._bitmap |= 0x10u;
  self->_controlInfoCameraStatus = v8 & 0x3F;
  self->super._bitmap |= 0x100u;
  self->_controlInfoLTRBits = v8 >> 12;
  if (((v8 >> 8) & 2) != 0)
  {
    if (!v10)
    {
      int v6 = -2144403413;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaControlInfoFaceTimeVideo configureWithBuffer:length:optionalControlInfo:].cold.8();
        }
      }
      return v6;
    }
    v11 -= 4;
    unsigned int v14 = *((_DWORD *)a3 + 1);
    self->super._bitmap |= 2u;
    self->_controlInfoLTRTimestamp = v14;
    uint64_t v13 = 8;
  }
  else
  {
    uint64_t v13 = 4;
  }
  unsigned int v15 = (v8 >> 8) & 0xF;
  if (v9 == 2 && (v15 & 1) != 0)
  {
    if (v11 <= 3)
    {
      int v6 = -2144403413;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaControlInfoFaceTimeVideo configureWithBuffer:length:optionalControlInfo:].cold.7();
        }
      }
      return v6;
    }
    v11 -= 4;
    self->_controlInfoFrameExtensionData.totalPacketsPerFrame = bswap32(*(unsigned __int16 *)&a3[v13]) >> 16;
    self->_controlInfoFrameExtensionData.frameSequenceNumber = bswap32(*(unsigned __int16 *)&a3[v13 | 2]) >> 16;
    v13 += 4;
    self->super._bitmap |= 1u;
  }
  if (v15 >= 8)
  {
    if (v11 <= 3)
    {
      int v6 = -2144403413;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaControlInfoFaceTimeVideo configureWithBuffer:length:optionalControlInfo:].cold.6();
        }
      }
      return v6;
    }
    v11 -= 4;
    unsigned int v16 = *(_DWORD *)&a3[a4 - 4];
    self->super._bitmap |= 8u;
    self->_controlInfoProbe = v16;
    unint64_t v5 = a4 - 4;
  }
  if ((v15 & 4) == 0) {
    goto LABEL_22;
  }
  size_t v17 = v5 - v13;
  v11 -= v17;
  if (v11 < 0)
  {
    int v6 = -2144403413;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaControlInfoFaceTimeVideo configureWithBuffer:length:optionalControlInfo:].cold.4();
      }
    }
  }
  else
  {
    if (v17 < 0x25)
    {
      self->super._bitmap |= 4u;
      memcpy(self->_controlInfoFEC, &a3[v13], v17);
      self->_controlInfoFECLength = v17;
LABEL_22:
      if (v11)
      {
        int v6 = -2144403413;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaControlInfoFaceTimeVideo configureWithBuffer:length:optionalControlInfo:]();
          }
        }
      }
      else
      {
        int v6 = [(VCMediaControlInfoFaceTimeVideo *)self handleOptionalControlInfo:a5];
        if (v6 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaControlInfoFaceTimeVideo configureWithBuffer:length:optionalControlInfo:]();
          }
        }
      }
      return v6;
    }
    int v6 = -2144403413;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaControlInfoFaceTimeVideo configureWithBuffer:length:optionalControlInfo:].cold.5();
      }
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
        -[VCMediaControlInfoFaceTimeVideo setInfo:size:type:]();
      }
    }
  }
  else
  {
    switch(a5)
    {
      case 0u:
      case 1u:
      case 2u:
      case 9u:
      case 0xDu:
      case 0xEu:
      case 0xFu:
      case 0x12u:
      case 0x13u:
      case 0x14u:
      case 0x15u:
        int v5 = -2144403455;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaControlInfoFaceTimeVideo setInfo:size:type:]();
          }
        }
        return v5;
      case 3u:
        int v5 = 0;
        self->super._bitmap |= 0x10u;
        char v6 = *(unsigned char *)a3;
        uint64_t v7 = 64;
        goto LABEL_8;
      case 4u:
        int v5 = 0;
        self->super._bitmap |= 0x100u;
        char v6 = *(unsigned char *)a3;
        uint64_t v7 = 65;
LABEL_8:
        *((unsigned char *)&self->super.super.isa + v7) = v6;
        return v5;
      case 5u:
        int v5 = 0;
        self->super._bitmap |= 2u;
        $9586FB4AF6900A1EE3AC02EE160A06AA v8 = *($9586FB4AF6900A1EE3AC02EE160A06AA *)a3;
        uint64_t v9 = 68;
        goto LABEL_20;
      case 6u:
        self->super._bitmap |= 1u;
        if (a4 != 4) {
          goto LABEL_13;
        }
        int v5 = 0;
        self->_controlInfoFrameExtensionData = *($9586FB4AF6900A1EE3AC02EE160A06AA *)a3;
        return v5;
      case 7u:
        if (a4 <= 0x24)
        {
          self->super._bitmap |= 4u;
          self->_controlInfoFECLength = a4;
          memcpy(self->_controlInfoFEC, a3, a4);
LABEL_22:
          int v5 = 0;
        }
        else
        {
LABEL_13:
          int v5 = -2144403413;
        }
        break;
      case 8u:
        int v5 = 0;
        self->super._bitmap |= 8u;
        $9586FB4AF6900A1EE3AC02EE160A06AA v8 = *($9586FB4AF6900A1EE3AC02EE160A06AA *)a3;
        uint64_t v9 = 120;
        goto LABEL_20;
      case 0xAu:
        int v5 = 0;
        self->super._bitmap |= 0x80u;
        self->_controlInfoVideoArrivalTime = *(double *)a3;
        return v5;
      case 0xBu:
        int v5 = 0;
        self->super._bitmap |= 0x20u;
        $9586FB4AF6900A1EE3AC02EE160A06AA v8 = *($9586FB4AF6900A1EE3AC02EE160A06AA *)a3;
        uint64_t v9 = 128;
        goto LABEL_20;
      case 0xCu:
        int v5 = 0;
        self->super._bitmap |= 0x10u;
        $9586FB4AF6900A1EE3AC02EE160A06AA v8 = *($9586FB4AF6900A1EE3AC02EE160A06AA *)a3;
        uint64_t v9 = 124;
        goto LABEL_20;
      case 0x10u:
        int v5 = 0;
        self->super._bitmap |= 0x40u;
        $9586FB4AF6900A1EE3AC02EE160A06AA v8 = *($9586FB4AF6900A1EE3AC02EE160A06AA *)a3;
        uint64_t v9 = 132;
        goto LABEL_20;
      case 0x11u:
        int v5 = 0;
        self->super._bitmap |= 0x20u;
        $9586FB4AF6900A1EE3AC02EE160A06AA v8 = *($9586FB4AF6900A1EE3AC02EE160A06AA *)a3;
        uint64_t v9 = 136;
LABEL_20:
        *($9586FB4AF6900A1EE3AC02EE160A06AA *)((char *)&self->super.super.isa + v9) = v8;
        return v5;
      default:
        goto LABEL_22;
    }
  }
  return v5;
}

- (BOOL)hasInfoType:(unsigned int)a3
{
  signed int v3 = a3 - 3;
  return a3 - 3 <= 0xE
      && ((0x60BFu >> v3) & 1) != 0
      && (unsigned __int16)(self->super._bitmap & word_1E25A31D6[v3]) != 0;
}

- (int)getInfo:(void *)a3 bufferLength:(unint64_t)a4 infoSize:(unint64_t *)a5 type:(unsigned int)a6
{
  int result = -2144403434;
  if (!a3) {
    return -2144403455;
  }
  switch(a6)
  {
    case 3u:
      if ((self->super._bitmap & 0x10) != 0)
      {
        if (!a4) {
          goto LABEL_40;
        }
        uint64_t v9 = 64;
        goto LABEL_10;
      }
      break;
    case 4u:
      if ((self->super._bitmap & 0x100) != 0)
      {
        if (!a4) {
          goto LABEL_40;
        }
        uint64_t v9 = 65;
LABEL_10:
        *(unsigned char *)a3 = *((unsigned char *)&self->super.super.isa + v9);
        if (a5)
        {
          unint64_t controlInfoFECLength = 1;
          goto LABEL_44;
        }
        goto LABEL_45;
      }
      break;
    case 5u:
      if ((self->super._bitmap & 2) != 0)
      {
        if (a4 < 4) {
          goto LABEL_40;
        }
        uint64_t v11 = 68;
        goto LABEL_42;
      }
      break;
    case 6u:
      if (self->super._bitmap)
      {
        if (a4 < 4) {
          goto LABEL_40;
        }
        uint64_t v11 = 72;
        goto LABEL_42;
      }
      break;
    case 7u:
      if ((self->super._bitmap & 4) != 0)
      {
        if (self->_controlInfoFECLength > a4) {
          goto LABEL_40;
        }
        memcpy(a3, self->_controlInfoFEC, self->_controlInfoFECLength);
        if (a5)
        {
          unint64_t controlInfoFECLength = self->_controlInfoFECLength;
          goto LABEL_44;
        }
        goto LABEL_45;
      }
      break;
    case 8u:
      if ((self->super._bitmap & 8) != 0)
      {
        if (a4 < 4) {
          goto LABEL_40;
        }
        uint64_t v11 = 120;
        goto LABEL_42;
      }
      break;
    case 0xAu:
      if ((self->super._bitmap & 0x80) != 0)
      {
        if (a4 < 8) {
          goto LABEL_40;
        }
        *(double *)a3 = self->_controlInfoVideoArrivalTime;
        if (a5)
        {
          unint64_t controlInfoFECLength = 8;
          goto LABEL_44;
        }
        goto LABEL_45;
      }
      break;
    case 0xBu:
      if ((self->super._bitmap & 0x20) != 0)
      {
        if (a4 < 4) {
          goto LABEL_40;
        }
        uint64_t v11 = 128;
        goto LABEL_42;
      }
      break;
    case 0xCu:
      if ((self->super._bitmap & 0x10) != 0)
      {
        if (a4 < 4) {
          goto LABEL_40;
        }
        uint64_t v11 = 124;
        goto LABEL_42;
      }
      break;
    case 0x10u:
      if ((self->super._bitmap & 0x40) != 0)
      {
        if (a4 < 4) {
          goto LABEL_40;
        }
        uint64_t v11 = 132;
        goto LABEL_42;
      }
      break;
    case 0x11u:
      if ((self->super._bitmap & 0x20) != 0)
      {
        if (a4 >= 4)
        {
          uint64_t v11 = 136;
LABEL_42:
          *(_DWORD *)a3 = *(_DWORD *)((char *)&self->super.super.isa + v11);
          if (a5)
          {
            unint64_t controlInfoFECLength = 4;
LABEL_44:
            int result = 0;
            *a5 = controlInfoFECLength;
          }
          else
          {
LABEL_45:
            int result = 0;
          }
        }
        else
        {
LABEL_40:
          int result = -2144403442;
        }
      }
      break;
    default:
      return result;
  }
  return result;
}

- (int)serializeToBuffer:(char *)a3 bufferLength:(unint64_t)a4 blobLength:(unint64_t *)a5
{
  return VCMediaControlInfoFaceTimeVideo_SerializeBuffer((uint64_t)self, (uint64_t)a3, a4, a5);
}

- (void)configureWithBuffer:length:optionalControlInfo:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  int v3 = 1204;
  __int16 v4 = 2048;
  uint64_t v5 = v0;
  __int16 v6 = 2048;
  uint64_t v7 = 4;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Bad buffer length(%zu) for FaceTime video media control info, expecting %zu", v2, 0x30u);
}

- (void)configureWithBuffer:length:optionalControlInfo:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaControlInfoFaceTimeVideo configureWithBuffer:length:optionalControlInfo:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Handle optional control info failed with error %08X for FaceTime video", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeVideo configureWithBuffer:length:optionalControlInfo:]" >> 16, v4);
}

- (void)configureWithBuffer:length:optionalControlInfo:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Bad data buffer length for FaceTime video media control info", v2, v3, v4, v5, v6);
}

- (void)configureWithBuffer:length:optionalControlInfo:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Not enough buffer for FEC", v2, v3, v4, v5, v6);
}

- (void)configureWithBuffer:length:optionalControlInfo:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d FEC oversized", v2, v3, v4, v5, v6);
}

- (void)configureWithBuffer:length:optionalControlInfo:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Not enough buffer for probe", v2, v3, v4, v5, v6);
}

- (void)configureWithBuffer:length:optionalControlInfo:.cold.7()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Not enough buffer for Frame Support Information", v2, v3, v4, v5, v6);
}

- (void)configureWithBuffer:length:optionalControlInfo:.cold.8()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Not enough buffer for LTR Timestamp", v2, v3, v4, v5, v6);
}

- (void)setInfo:size:type:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaControlInfoFaceTimeVideo setInfo:size:type:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Value passed is invalid type=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeVideo setInfo:size:type:]" >> 16, v4);
}

- (void)setInfo:size:type:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaControlInfoFaceTimeVideo setInfo:size:type:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Does not support type=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeVideo setInfo:size:type:]" >> 16, v4);
}

@end