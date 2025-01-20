@interface VCMediaControlInfoFaceTimeAudio
- (BOOL)ecnEnabled;
- (BOOL)hasInfoType:(unsigned int)a3;
- (BOOL)videoEnabled;
- (VCMediaControlInfoFaceTimeAudio)init;
- (VCMediaControlInfoFaceTimeAudio)initWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5 version:(unsigned __int8)a6;
- (id)description;
- (int)configureWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5;
- (int)getInfo:(void *)a3 bufferLength:(unint64_t)a4 infoSize:(unint64_t *)a5 type:(unsigned int)a6;
- (int)getInfoUnserialized:(id *)a3 type:(unsigned int)a4;
- (int)handleOptionalControlInfo:(id *)a3;
- (int)serializeToBuffer:(char *)a3 bufferLength:(unint64_t)a4 blobLength:(unint64_t *)a5;
- (int)setInfo:(void *)a3 size:(unint64_t)a4 type:(unsigned int)a5;
- (int)setInfoUnserialized:(id *)a3 type:(unsigned int)a4;
- (unint64_t)feedbackSize;
- (void)setEcnEnabled:(BOOL)a3;
- (void)setVideoEnabled:(BOOL)a3;
@end

@implementation VCMediaControlInfoFaceTimeAudio

- (VCMediaControlInfoFaceTimeAudio)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3.receiver = self;
  v3.super_class = (Class)VCMediaControlInfoFaceTimeAudio;
  result = [(VCMediaControlInfo *)&v3 init];
  if (result)
  {
    result->super._vtableC.serializedSize = VCMediaControlInfoFaceTimeAudio_SerializedSize;
    result->super._vtableC.serialize = VCMediaControlInfoFaceTimeAudio_SerializeBuffer;
  }
  return result;
}

- (VCMediaControlInfoFaceTimeAudio)initWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5 version:(unsigned __int8)a6
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaControlInfoFaceTimeAudio;
  result = [(VCMediaControlInfo *)&v7 initWithBuffer:a3 length:a4 optionalControlInfo:a5 version:a6];
  if (result)
  {
    result->super._vtableC.serializedSize = VCMediaControlInfoFaceTimeAudio_SerializedSize;
    result->super._vtableC.serialize = VCMediaControlInfoFaceTimeAudio_SerializeBuffer;
  }
  return result;
}

- (unint64_t)feedbackSize
{
  if (self->super._version != 2) {
    return 6;
  }
  unint64_t v2 = 10;
  if ((self->super._bitmap & 4) == 0) {
    unint64_t v2 = 6;
  }
  if ((self->super._bitmap & 8) != 0) {
    return v2 + 4;
  }
  else {
    return v2;
  }
}

- (id)description
{
  objc_super v3 = objc_opt_new();
  [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"_version = %u, _bitmap 0x%x. :", self->super._version, self->super._bitmap)];
  unsigned __int16 bitmap = self->super._bitmap;
  if (bitmap)
  {
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"Feedback parameters: \n"];
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"     %25s = %10d\n", "timeStamp", self->_controlFeedbackParameter.timeStamp)];
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"     %25s = %10d\n", "receiveQueueTarget", self->_controlFeedbackParameter.receiveQueueTarget)];
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"     %25s = %10d\n", "audioReceviedPkts", self->_controlFeedbackParameter.audioReceviedPkts)];
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"     %25s = %10d\n", "audioBurstLoss", self->_controlFeedbackParameter.audioBurstLoss)];
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"     %25s = %10d\n", "totalReceviedKBytes", self->_controlFeedbackParameter.totalReceivedKBytes)];
    unsigned __int16 bitmap = self->super._bitmap;
    if ((bitmap & 4) != 0)
    {
      [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"     %25s = %10d\n", "videoReceviedPkts", self->_controlFeedbackParameter.videoReceviedPkts)];
      [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"     %25s = %10d\n", "videoBurstLoss", self->_controlFeedbackParameter.videoBurstLoss)];
      [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"     %25s = %10d\n", "bandwithEstimation", self->_controlFeedbackParameter.bandwithEstimation)];
      unsigned __int16 bitmap = self->super._bitmap;
    }
  }
  if ((bitmap & 0x80) != 0)
  {
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"Media Queue parameters: \n"];
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"     %25s = %10d\n", "owrd", self->_controlFeedbackParameter.owrd)];
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"     %25s = %10d\n", "queuingDelay", self->_controlFeedbackParameter.queuingDelay)];
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"     %25s = %10d\n", "sendTimestamp", self->_controlFeedbackParameter.sendTimestamp)];
    unsigned __int16 bitmap = self->super._bitmap;
  }
  if ((bitmap & 2) != 0) {
    [v3 appendString:objc_msgSend(NSString, "stringWithFormat:", @"     %25s = 0x%8x\n", "connectionStatsBuffer", self->_controlFeedbackParameter.connectionStatsBuffer)];
  }

  return v3;
}

- (int)handleOptionalControlInfo:(id *)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 1;
  }
  int v5 = [(VCMediaControlInfoFaceTimeAudio *)self setInfo:a3 size:8 type:10];
  if (v5 < 0)
  {
    int v14 = v5;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v14;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v14;
    }
    int v28 = 136316418;
    uint64_t v29 = v16;
    __int16 v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    __int16 v32 = 1024;
    int v33 = 785;
    __int16 v34 = 2048;
    v35 = a3;
    __int16 v36 = 2048;
    v37 = self;
    __int16 v38 = 1024;
    int v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeArrivalTime, for optionalControlInfo=%p"
          " in control info=%p for audio. error=%x";
LABEL_44:
    _os_log_error_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v28, 0x36u);
    return v14;
  }
  int v6 = [(VCMediaControlInfoFaceTimeAudio *)self setInfo:&a3->var1 size:4 type:16];
  if (v6 < 0)
  {
    int v14 = v6;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v14;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v14;
    }
    int v28 = 136316418;
    uint64_t v29 = v19;
    __int16 v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    __int16 v32 = 1024;
    int v33 = 788;
    __int16 v34 = 2048;
    v35 = a3;
    __int16 v36 = 2048;
    v37 = self;
    __int16 v38 = 1024;
    int v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypePacketSize, for optionalControlInfo=%p "
          "in control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  int v7 = [(VCMediaControlInfoFaceTimeAudio *)self setInfo:&a3->var6 size:4 type:17];
  if (v7 < 0)
  {
    int v14 = v7;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v14;
    }
    uint64_t v20 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v14;
    }
    int v28 = 136316418;
    uint64_t v29 = v20;
    __int16 v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    __int16 v32 = 1024;
    int v33 = 791;
    __int16 v34 = 2048;
    v35 = a3;
    __int16 v36 = 2048;
    v37 = self;
    __int16 v38 = 1024;
    int v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeMediaTimestamp, for optionalControlInfo"
          "=%p in control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  int v8 = [(VCMediaControlInfoFaceTimeAudio *)self setInfo:&a3->var3 size:4 type:12];
  if (v8 < 0)
  {
    int v14 = v8;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v14;
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v14;
    }
    int v28 = 136316418;
    uint64_t v29 = v21;
    __int16 v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    __int16 v32 = 1024;
    int v33 = 794;
    __int16 v34 = 2048;
    v35 = a3;
    __int16 v36 = 2048;
    v37 = self;
    __int16 v38 = 1024;
    int v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeTotalReceivedKBytes, for optionalContro"
          "lInfo=%p in control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  int v9 = [(VCMediaControlInfoFaceTimeAudio *)self setInfo:&a3->var2 size:4 type:11];
  if (v9 < 0)
  {
    int v14 = v9;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v14;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v14;
    }
    int v28 = 136316418;
    uint64_t v29 = v22;
    __int16 v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    __int16 v32 = 1024;
    int v33 = 797;
    __int16 v34 = 2048;
    v35 = a3;
    __int16 v36 = 2048;
    v37 = self;
    __int16 v38 = 1024;
    int v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeTotalReceivedPackets, for optionalContr"
          "olInfo=%p in control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  int v10 = [(VCMediaControlInfoFaceTimeAudio *)self setInfo:&a3->var7 size:2 type:13];
  if (v10 < 0)
  {
    int v14 = v10;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v14;
    }
    uint64_t v23 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v14;
    }
    int v28 = 136316418;
    uint64_t v29 = v23;
    __int16 v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    __int16 v32 = 1024;
    int v33 = 800;
    __int16 v34 = 2048;
    v35 = a3;
    __int16 v36 = 2048;
    v37 = self;
    __int16 v38 = 1024;
    int v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeSequenceNumber, for optionalControlInfo"
          "=%p in control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  int v11 = [(VCMediaControlInfoFaceTimeAudio *)self setInfo:&a3->var8 size:1 type:14];
  if (v11 < 0)
  {
    int v14 = v11;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v14;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v14;
    }
    int v28 = 136316418;
    uint64_t v29 = v24;
    __int16 v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    __int16 v32 = 1024;
    int v33 = 803;
    __int16 v34 = 2048;
    v35 = a3;
    __int16 v36 = 2048;
    v37 = self;
    __int16 v38 = 1024;
    int v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeIsDuplicatePacket, for optionalControlI"
          "nfo=%p in control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  int v12 = [(VCMediaControlInfoFaceTimeAudio *)self setInfo:&a3->var9 size:1 type:15];
  if (v12 < 0)
  {
    int v14 = v12;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v14;
    }
    uint64_t v25 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v14;
    }
    int v28 = 136316418;
    uint64_t v29 = v25;
    __int16 v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    __int16 v32 = 1024;
    int v33 = 806;
    __int16 v34 = 2048;
    v35 = a3;
    __int16 v36 = 2048;
    v37 = self;
    __int16 v38 = 1024;
    int v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeIsReceivedOnPrimary, for optionalContro"
          "lInfo=%p in control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  int v13 = [(VCMediaControlInfoFaceTimeAudio *)self setInfo:&a3->var10 size:1 type:18];
  if (v13 < 0)
  {
    int v14 = v13;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v14;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v14;
    }
    int v28 = 136316418;
    uint64_t v29 = v26;
    __int16 v30 = 2080;
    v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
    __int16 v32 = 1024;
    int v33 = 809;
    __int16 v34 = 2048;
    v35 = a3;
    __int16 v36 = 2048;
    v37 = self;
    __int16 v38 = 1024;
    int v39 = v14;
    v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeECNByte, for optionalControlInfo=%p in "
          "control info=%p for audio. error=%x";
    goto LABEL_44;
  }
  int v14 = [(VCMediaControlInfoFaceTimeAudio *)self setInfo:&a3->var11 size:1 type:21];
  if (v14 < 0 && (int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    v17 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v28 = 136316418;
      uint64_t v29 = v27;
      __int16 v30 = 2080;
      v31 = "-[VCMediaControlInfoFaceTimeAudio handleOptionalControlInfo:]";
      __int16 v32 = 1024;
      int v33 = 812;
      __int16 v34 = 2048;
      v35 = a3;
      __int16 v36 = 2048;
      v37 = self;
      __int16 v38 = 1024;
      int v39 = v14;
      v18 = " [%s] %s:%d setInfo failed for controlInfo type=kVCMediaControlInfoTypeFeedbackReceivedOnRelay, for optional"
            "ControlInfo=%p in control info=%p for audio. error=%x";
      goto LABEL_44;
    }
  }
  return v14;
}

- (int)configureWithBuffer:(const char *)a3 length:(unint64_t)a4 optionalControlInfo:(id *)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v18 = 0;
  int v17 = 0;
  unsigned __int8 version = self->super._version;
  int v7 = VCMediaControlInfoUnserializeWithData((uint64_t)&self->_controlFeedbackParameter, (unsigned __int16 *)a3, a4, &version);
  int v8 = v7;
  if ((_BYTE)v17) {
    self->super._bitmap |= 1u;
  }
  char v9 = BYTE1(v17);
  if (BYTE1(v17)) {
    self->super._bitmap |= 4u;
  }
  if (BYTE2(v17)) {
    self->super._bitmap |= 0x80u;
  }
  if (HIBYTE(v17)) {
    self->super._bitmap |= 2u;
  }
  BOOL v10 = v18;
  if (v18) {
    self->super._bitmap |= 8u;
  }
  self->_videoEnabled = v9;
  self->_ecnEnabled = v10;
  if (v7)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:]();
      }
    }
  }
  else
  {
    int v8 = [(VCMediaControlInfoFaceTimeAudio *)self handleOptionalControlInfo:a5];
    if (v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:]();
        }
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      int v12 = *MEMORY[0x1E4F47A50];
      int v13 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          id v14 = [(VCMediaControlInfoFaceTimeAudio *)self description];
          *(_DWORD *)buf = 136315906;
          uint64_t v20 = v11;
          __int16 v21 = 2080;
          uint64_t v22 = "-[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:]";
          __int16 v23 = 1024;
          int v24 = 836;
          __int16 v25 = 2112;
          id v26 = v14;
          _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %@", buf, 0x26u);
        }
      }
      else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        -[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:](v11, self);
      }
    }
  }
  return v8;
}

- (int)getInfoUnserialized:(id *)a3 type:(unsigned int)a4
{
  int v4 = -2144403455;
  if (a3)
  {
    if (a4 == 1)
    {
      if ((self->super._bitmap & 0x80) != 0)
      {
        int v4 = 0;
        a3->var10 = self->_controlFeedbackParameter.owrd;
        a3->var8 = self->_controlFeedbackParameter.queuingDelay;
        a3->var9 = self->_controlFeedbackParameter.sendTimestamp;
        return v4;
      }
      return 0;
    }
    if (!a4)
    {
      unsigned __int16 bitmap = self->super._bitmap;
      if (bitmap)
      {
        *(void *)&a3->var0 = *(void *)&self->_controlFeedbackParameter.timeStamp;
        *(_DWORD *)&a3->var4 = *(_DWORD *)&self->_controlFeedbackParameter.audioBurstLoss;
        *(void *)&a3->var6 = *(void *)&self->_controlFeedbackParameter.totalReceivedKBytes;
        unsigned __int16 bitmap = self->super._bitmap;
      }
      if ((bitmap & 8) != 0)
      {
        int v4 = 0;
        *(_DWORD *)&a3->var12 = *(_DWORD *)&self->_controlFeedbackParameter.ecnECT1Count;
        return v4;
      }
      return 0;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaControlInfoFaceTimeAudio getInfoUnserialized:type:]();
      }
    }
  }
  return v4;
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
        -[VCMediaControlInfoFaceTimeAudio setInfo:size:type:]();
      }
    }
  }
  else
  {
    switch(a5)
    {
      case 0u:
      case 1u:
      case 3u:
      case 4u:
      case 5u:
      case 6u:
      case 7u:
      case 8u:
      case 9u:
      case 0x13u:
      case 0x14u:
        int v5 = -2144403455;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaControlInfoFaceTimeAudio setInfo:size:type:]();
          }
        }
        return v5;
      case 2u:
        int v5 = 0;
        self->super._bitmap |= 2u;
        self->_controlFeedbackParameter.connectionStatsBuffer = *(_DWORD *)a3;
        return v5;
      case 0xAu:
        int v5 = 0;
        self->super._bitmap |= 0x40u;
        self->_controlInfoArrivalTime = *(double *)a3;
        return v5;
      case 0xBu:
        int v5 = 0;
        self->super._bitmap |= 0x20u;
        unsigned int v6 = *(_DWORD *)a3;
        uint64_t v7 = 68;
        goto LABEL_16;
      case 0xCu:
        int v5 = 0;
        self->super._bitmap |= 0x10u;
        unsigned int v6 = *(_DWORD *)a3;
        uint64_t v7 = 64;
        goto LABEL_16;
      case 0xDu:
        int v5 = 0;
        self->super._bitmap |= 0x400u;
        self->_controlInfoSequenceNumber = *(_WORD *)a3;
        return v5;
      case 0xEu:
        int v5 = 0;
        self->super._bitmap |= 0x800u;
        char v8 = *(unsigned char *)a3;
        uint64_t v9 = 132;
        goto LABEL_19;
      case 0xFu:
        int v5 = 0;
        self->super._bitmap |= 0x1000u;
        char v8 = *(unsigned char *)a3;
        uint64_t v9 = 133;
        goto LABEL_19;
      case 0x10u:
        int v5 = 0;
        self->super._bitmap |= 0x200u;
        unsigned int v6 = *(_DWORD *)a3;
        uint64_t v7 = 72;
        goto LABEL_16;
      case 0x11u:
        int v5 = 0;
        self->super._bitmap |= 0x100u;
        unsigned int v6 = *(_DWORD *)a3;
        uint64_t v7 = 76;
LABEL_16:
        *(_DWORD *)((char *)&self->super.super.isa + v7) = v6;
        return v5;
      case 0x12u:
        int v5 = 0;
        self->super._bitmap |= 0x2000u;
        char v8 = *(unsigned char *)a3;
        uint64_t v9 = 135;
        goto LABEL_19;
      case 0x15u:
        int v5 = 0;
        self->super._bitmap |= 0x15u;
        char v8 = *(unsigned char *)a3;
        uint64_t v9 = 136;
LABEL_19:
        *((unsigned char *)&self->super.super.isa + v9) = v8;
        break;
      default:
        int v5 = 0;
        break;
    }
  }
  return v5;
}

- (BOOL)hasInfoType:(unsigned int)a3
{
  return a3 <= 0x12 && ((0x7FC07u >> a3) & 1) != 0 && (unsigned __int16)(self->super._bitmap & word_1E25A31B0[a3]) != 0;
}

- (int)setInfoUnserialized:(id *)a3 type:(unsigned int)a4
{
  int v4 = -2144403455;
  if (a3)
  {
    if (a4 == 1)
    {
      int v4 = 0;
      self->super._bitmap |= 0x80u;
      self->_controlFeedbackParameter.owrd = a3->var10;
      self->_controlFeedbackParameter.queuingDelay = a3->var8;
      self->_controlFeedbackParameter.sendTimestamp = a3->var9;
    }
    else if (a4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaControlInfoFaceTimeAudio setInfoUnserialized:type:]();
        }
      }
    }
    else
    {
      unsigned __int16 bitmap = self->super._bitmap;
      __int16 v6 = bitmap | 1;
      self->super._unsigned __int16 bitmap = bitmap | 1;
      if (self->_videoEnabled)
      {
        __int16 v6 = bitmap | 5;
        self->super._unsigned __int16 bitmap = bitmap | 5;
      }
      if (self->_ecnEnabled)
      {
        self->super._unsigned __int16 bitmap = v6 | 8;
        *(_DWORD *)&self->_controlFeedbackParameter.ecnECT1Count = *(_DWORD *)&a3->var12;
      }
      int v4 = 0;
      *(void *)&self->_controlFeedbackParameter.timeStamp = *(void *)&a3->var0;
      *(_DWORD *)&self->_controlFeedbackParameter.audioBurstLoss = *(_DWORD *)&a3->var4;
      *(void *)&self->_controlFeedbackParameter.totalReceivedKBytes = *(void *)&a3->var6;
    }
  }
  return v4;
}

- (int)getInfo:(void *)a3 bufferLength:(unint64_t)a4 infoSize:(unint64_t *)a5 type:(unsigned int)a6
{
  int result = -2144403442;
  if (!a3) {
    return -2144403455;
  }
  switch(a6)
  {
    case 2u:
      if ((self->super._bitmap & 2) == 0) {
        goto LABEL_40;
      }
      if (a4 >= 4)
      {
        unsigned int connectionStatsBuffer = self->_controlFeedbackParameter.connectionStatsBuffer;
        goto LABEL_37;
      }
      break;
    case 0xAu:
      if ((self->super._bitmap & 0x40) == 0) {
        goto LABEL_40;
      }
      if (a4 >= 8)
      {
        *(double *)a3 = self->_controlInfoArrivalTime;
        if (!a5) {
          goto LABEL_46;
        }
        int result = 0;
        unint64_t v11 = 8;
        goto LABEL_45;
      }
      break;
    case 0xBu:
      if ((self->super._bitmap & 0x20) == 0) {
        goto LABEL_40;
      }
      if (a4 >= 4)
      {
        uint64_t v12 = 68;
        goto LABEL_36;
      }
      break;
    case 0xCu:
      if ((self->super._bitmap & 0x10) == 0) {
        goto LABEL_40;
      }
      if (a4 >= 4)
      {
        uint64_t v12 = 64;
        goto LABEL_36;
      }
      break;
    case 0xDu:
      if ((self->super._bitmap & 0x400) == 0) {
        goto LABEL_40;
      }
      if (a4 >= 2)
      {
        *(_WORD *)a3 = self->_controlInfoSequenceNumber;
        if (!a5) {
          goto LABEL_46;
        }
        int result = 0;
        unint64_t v11 = 2;
        goto LABEL_45;
      }
      break;
    case 0xEu:
      if ((self->super._bitmap & 0x800) == 0) {
        goto LABEL_40;
      }
      if (a4)
      {
        uint64_t v13 = 132;
        goto LABEL_43;
      }
      break;
    case 0xFu:
      if ((self->super._bitmap & 0x1000) == 0) {
        goto LABEL_40;
      }
      if (a4)
      {
        uint64_t v13 = 133;
        goto LABEL_43;
      }
      break;
    case 0x10u:
      if ((self->super._bitmap & 0x200) == 0) {
        goto LABEL_40;
      }
      if (a4 >= 4)
      {
        uint64_t v12 = 72;
        goto LABEL_36;
      }
      break;
    case 0x11u:
      if ((self->super._bitmap & 0x100) == 0) {
        goto LABEL_40;
      }
      if (a4 >= 4)
      {
        uint64_t v12 = 76;
LABEL_36:
        unsigned int connectionStatsBuffer = *(_DWORD *)((char *)&self->super.super.isa + v12);
LABEL_37:
        *(_DWORD *)a3 = connectionStatsBuffer;
        if (a5)
        {
          int result = 0;
          unint64_t v11 = 4;
          goto LABEL_45;
        }
        goto LABEL_46;
      }
      break;
    case 0x12u:
      if ((self->super._bitmap & 0x2000) != 0)
      {
        if (a4)
        {
          uint64_t v13 = 135;
LABEL_43:
          *(unsigned char *)a3 = *((unsigned char *)&self->super.super.isa + v13);
          if (a5)
          {
            int result = 0;
            unint64_t v11 = 1;
LABEL_45:
            *a5 = v11;
          }
          else
          {
LABEL_46:
            int result = 0;
          }
        }
      }
      else
      {
LABEL_40:
        int result = -2144403434;
      }
      break;
    default:
      int ErrorLogLevelForModule = VRTraceGetErrorLogLevelForModule();
      int result = -2144403455;
      if (ErrorLogLevelForModule >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v10 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        int result = -2144403455;
        if (v10)
        {
          -[VCMediaControlInfoFaceTimeAudio getInfo:bufferLength:infoSize:type:]();
          return -2144403455;
        }
      }
      break;
  }
  return result;
}

- (int)serializeToBuffer:(char *)a3 bufferLength:(unint64_t)a4 blobLength:(unint64_t *)a5
{
  return VCMediaControlInfoFaceTimeAudio_SerializeBuffer((uint64_t)self, a3, a4, (uint64_t *)a5);
}

- (BOOL)videoEnabled
{
  return self->_videoEnabled;
}

- (void)setVideoEnabled:(BOOL)a3
{
  self->_videoEnabled = a3;
}

- (BOOL)ecnEnabled
{
  return self->_ecnEnabled;
}

- (void)setEcnEnabled:(BOOL)a3
{
  self->_ecnEnabled = a3;
}

- (void)configureWithBuffer:(uint64_t)a1 length:(void *)a2 optionalControlInfo:.cold.1(uint64_t a1, void *a2)
{
  [a2 description];
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_8_0(&dword_1E1EA4000, v2, v3, " [%s] %s:%d %@", v4, v5, v6, v7, v8);
}

- (void)configureWithBuffer:length:optionalControlInfo:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Handle optional control info failed with error %08X for FaceTime audio", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:]" >> 16, v4);
}

- (void)configureWithBuffer:length:optionalControlInfo:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCMediaControlInfoUnserializeWithData failed with error %08X for FaceTime audio", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeAudio configureWithBuffer:length:optionalControlInfo:]" >> 16, v4);
}

- (void)getInfoUnserialized:type:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaControlInfoFaceTimeAudio getInfoUnserialized:type:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Does not support type %d", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeAudio getInfoUnserialized:type:]" >> 16, v4);
}

- (void)setInfo:size:type:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaControlInfoFaceTimeAudio setInfo:size:type:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Value passed is invalid type=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeAudio setInfo:size:type:]" >> 16, v4);
}

- (void)setInfo:size:type:.cold.2()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaControlInfoFaceTimeAudio setInfo:size:type:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Does not support type=%u", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeAudio setInfo:size:type:]" >> 16, v4);
}

- (void)setInfoUnserialized:type:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaControlInfoFaceTimeAudio setInfoUnserialized:type:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Does not support type %d", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeAudio setInfoUnserialized:type:]" >> 16, v4);
}

- (void)getInfo:bufferLength:infoSize:type:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCMediaControlInfoFaceTimeAudio getInfo:bufferLength:infoSize:type:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Does not support type %d", v2, *(const char **)v3, (unint64_t)"-[VCMediaControlInfoFaceTimeAudio getInfo:bufferLength:infoSize:type:]" >> 16, v4);
}

@end