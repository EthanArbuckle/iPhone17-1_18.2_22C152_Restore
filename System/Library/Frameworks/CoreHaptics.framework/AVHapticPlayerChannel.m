@interface AVHapticPlayerChannel
- (AVHapticClient)client;
- (AVHapticPlayerChannel)initWithChannelID:(id)a3 client:(id)a4;
- (BOOL)clearEvents:(double)a3 error:(id *)a4;
- (BOOL)resetAtTime:(double)a3 error:(id *)a4;
- (BOOL)scheduleParameterCurve:(unint64_t)a3 curve:(id)a4 atTime:(double)a5 error:(id *)a6;
- (BOOL)sendEvents:(id)a3 atTime:(double)a4 error:(id *)a5;
- (BOOL)sendEvents:(id)a3 withImmediateParameters:(id)a4 atTime:(double)a5 error:(id *)a6;
- (BOOL)setParameter:(unint64_t)a3 value:(float)a4 atTime:(double)a5 error:(id *)a6;
- (unint64_t)chanID;
- (unint64_t)eventBehavior;
- (void)invalidate;
- (void)setChanID:(unint64_t)a3;
- (void)setClient:(id)a3;
- (void)setEventBehavior:(unint64_t)a3;
@end

@implementation AVHapticPlayerChannel

- (BOOL)resetAtTime:(double)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v7 = *(id *)kAVHCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = [(AVHapticPlayerChannel *)self client];
    int v20 = 136316162;
    v21 = "AVHapticPlayer.mm";
    __int16 v22 = 1024;
    int v23 = 150;
    __int16 v24 = 2080;
    v25 = "-[AVHapticPlayerChannel resetAtTime:error:]";
    __int16 v26 = 2048;
    uint64_t v27 = [v10 clientID];
    __int16 v28 = 2048;
    double v29 = a3;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: sending reset event: clientID: 0x%lx time: %.3f", (uint8_t *)&v20, 0x30u);
  }
LABEL_8:
  v11 = [(AVHapticPlayerChannel *)self client];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 151, "-[AVHapticPlayerChannel resetAtTime:error:]", "self.client != nil", -4804, a4);
  }
  else
  {
    v13 = [(AVHapticPlayerChannel *)self client];
    BOOL v14 = [v13 clientID] == -1;

    if (v14)
    {
      _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 152, "-[AVHapticPlayerChannel resetAtTime:error:]", "self.client.clientID != kInvalidClientID", -4812, a4);
    }
    else
    {
      v15 = [(AVHapticPlayerChannel *)self client];
      int v16 = [v15 running];

      if (v16)
      {
        v17 = [(AVHapticPlayerChannel *)self client];
        char v18 = objc_msgSend(v17, "resetChannel:atTime:", -[AVHapticPlayerChannel chanID](self, "chanID"), a3);

        if (v18) {
          return 1;
        }
        _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 154, "-[AVHapticPlayerChannel resetAtTime:error:]", "[self.client resetChannel:self.chanID atTime:time]", -4899, a4);
      }
      else
      {
        _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 153, "-[AVHapticPlayerChannel resetAtTime:error:]", "self.client.running", -4805, a4);
      }
    }
  }
  return 0;
}

- (BOOL)sendEvents:(id)a3 atTime:(double)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (kAVHCScope)
  {
    id v9 = *(id *)kAVHCScope;
    if (!v9) {
      goto LABEL_8;
    }
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F14500];
    id v10 = MEMORY[0x1E4F14500];
  }
  v11 = v9;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v12 = [(AVHapticPlayerChannel *)self client];
    int v26 = 136316162;
    uint64_t v27 = "AVHapticPlayer.mm";
    __int16 v28 = 1024;
    int v29 = 91;
    __int16 v30 = 2080;
    v31 = "-[AVHapticPlayerChannel sendEvents:atTime:error:]";
    __int16 v32 = 2048;
    uint64_t v33 = [v12 clientID];
    __int16 v34 = 2048;
    double v35 = a4;
    _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: sending event array: clientID: 0x%lx atTime: %.3f", (uint8_t *)&v26, 0x30u);
  }
LABEL_8:
  v13 = [(AVHapticPlayerChannel *)self client];
  BOOL v14 = v13 == 0;

  if (v14)
  {
    int v22 = -4804;
    int v23 = "self.client != nil";
    uint64_t v24 = 92;
LABEL_17:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v24, "-[AVHapticPlayerChannel sendEvents:atTime:error:]", v23, v22, a5);
    BOOL v21 = 0;
    goto LABEL_18;
  }
  v15 = [(AVHapticPlayerChannel *)self client];
  BOOL v16 = [v15 clientID] == -1;

  if (v16)
  {
    int v22 = -4812;
    int v23 = "self.client.clientID != kInvalidClientID";
    uint64_t v24 = 93;
    goto LABEL_17;
  }
  v17 = [(AVHapticPlayerChannel *)self client];
  char v18 = [v17 running];

  if ((v18 & 1) == 0)
  {
    int v22 = -4805;
    int v23 = "self.client.running";
    uint64_t v24 = 94;
    goto LABEL_17;
  }
  v19 = [(AVHapticPlayerChannel *)self client];
  char v20 = objc_msgSend(v19, "sendEvents:withImmediateParameters:atTime:channel:outToken:error:", v8, 0, -[AVHapticPlayerChannel chanID](self, "chanID"), 0, a5, a4);

  if ((v20 & 1) == 0)
  {
    int v22 = -4899;
    int v23 = "[self.client sendEvents:events withImmediateParameters:nil atTime:time channel:self.chanID outToken:nil error:outError]";
    uint64_t v24 = 97;
    goto LABEL_17;
  }
  BOOL v21 = 1;
LABEL_18:

  return v21;
}

- (AVHapticClient)client
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  return (AVHapticClient *)WeakRetained;
}

- (unint64_t)chanID
{
  return self->_chanID;
}

- (void)invalidate
{
}

- (AVHapticPlayerChannel)initWithChannelID:(id)a3 client:(id)a4
{
  id v6 = a4;
  self->_chanID = [a3 unsignedIntegerValue];
  objc_storeWeak((id *)&self->_client, v6);
  self->_behavior = 0;

  return self;
}

- (void).cxx_destruct
{
}

- (unint64_t)eventBehavior
{
  return self->_behavior;
}

- (void)setEventBehavior:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v5 = *(id *)kAVHCScope;
    if (!v5) {
      goto LABEL_8;
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F14500];
    id v6 = MEMORY[0x1E4F14500];
  }
  id v7 = v5;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [(AVHapticPlayerChannel *)self client];
    int v13 = 136316418;
    BOOL v14 = "AVHapticPlayer.mm";
    __int16 v15 = 1024;
    int v16 = 76;
    __int16 v17 = 2080;
    char v18 = "-[AVHapticPlayerChannel setEventBehavior:]";
    __int16 v19 = 2048;
    uint64_t v20 = [v8 clientID];
    __int16 v21 = 1024;
    int v22 = [(AVHapticPlayerChannel *)self chanID];
    __int16 v23 = 1024;
    int v24 = a3;
    _os_log_impl(&dword_1BA902000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: clientID: 0x%lx channelID: %u behavior: %u", (uint8_t *)&v13, 0x32u);
  }
LABEL_8:
  if (self->_behavior == a3) {
    return;
  }
  if (a3 >= 8)
  {
    if (kAVHCScope)
    {
      v11 = *(id *)kAVHCScope;
      if (!v11) {
        return;
      }
    }
    else
    {
      v11 = MEMORY[0x1E4F14500];
      id v12 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v13 = 136315906;
      BOOL v14 = "AVHapticPlayer.mm";
      __int16 v15 = 1024;
      int v16 = 79;
      __int16 v17 = 2080;
      char v18 = "-[AVHapticPlayerChannel setEventBehavior:]";
      __int16 v19 = 1024;
      LODWORD(v20) = a3;
      _os_log_impl(&dword_1BA902000, v11, OS_LOG_TYPE_ERROR, "%25s:%-5d %s: Illegal event behavior: %u", (uint8_t *)&v13, 0x22u);
    }
  }
  else
  {
    id v9 = [(AVHapticPlayerChannel *)self client];
    int v10 = objc_msgSend(v9, "setChannelEventBehavior:channel:", a3, -[AVHapticPlayerChannel chanID](self, "chanID"));

    if (v10) {
      self->_behavior = a3;
    }
  }
}

- (BOOL)sendEvents:(id)a3 withImmediateParameters:(id)a4 atTime:(double)a5 error:(id *)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  if (kAVHCScope)
  {
    id v12 = *(id *)kAVHCScope;
    if (!v12) {
      goto LABEL_8;
    }
  }
  else
  {
    id v12 = (id)MEMORY[0x1E4F14500];
    id v13 = MEMORY[0x1E4F14500];
  }
  BOOL v14 = v12;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v15 = [(AVHapticPlayerChannel *)self client];
    int v29 = 136316162;
    __int16 v30 = "AVHapticPlayer.mm";
    __int16 v31 = 1024;
    int v32 = 103;
    __int16 v33 = 2080;
    __int16 v34 = "-[AVHapticPlayerChannel sendEvents:withImmediateParameters:atTime:error:]";
    __int16 v35 = 2048;
    uint64_t v36 = [v15 clientID];
    __int16 v37 = 2048;
    double v38 = a5;
    _os_log_impl(&dword_1BA902000, v14, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: sending event array: clientID: 0x%lx atTime: %.3f", (uint8_t *)&v29, 0x30u);
  }
LABEL_8:
  int v16 = [(AVHapticPlayerChannel *)self client];
  BOOL v17 = v16 == 0;

  if (v17)
  {
    int v25 = -4804;
    int v26 = "self.client != nil";
    uint64_t v27 = 104;
LABEL_17:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v27, "-[AVHapticPlayerChannel sendEvents:withImmediateParameters:atTime:error:]", v26, v25, a6);
    BOOL v24 = 0;
    goto LABEL_18;
  }
  char v18 = [(AVHapticPlayerChannel *)self client];
  BOOL v19 = [v18 clientID] == -1;

  if (v19)
  {
    int v25 = -4812;
    int v26 = "self.client.clientID != kInvalidClientID";
    uint64_t v27 = 105;
    goto LABEL_17;
  }
  uint64_t v20 = [(AVHapticPlayerChannel *)self client];
  char v21 = [v20 running];

  if ((v21 & 1) == 0)
  {
    int v25 = -4805;
    int v26 = "self.client.running";
    uint64_t v27 = 106;
    goto LABEL_17;
  }
  int v22 = [(AVHapticPlayerChannel *)self client];
  char v23 = objc_msgSend(v22, "sendEvents:withImmediateParameters:atTime:channel:outToken:error:", v10, v11, -[AVHapticPlayerChannel chanID](self, "chanID"), 0, a6, a5);

  if ((v23 & 1) == 0)
  {
    int v25 = -4899;
    int v26 = "[self.client sendEvents:events withImmediateParameters:immediateParameters atTime:time channel:self.chanID out"
          "Token:nil error:outError]";
    uint64_t v27 = 109;
    goto LABEL_17;
  }
  BOOL v24 = 1;
LABEL_18:

  return v24;
}

- (BOOL)clearEvents:(double)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v7 = *(id *)kAVHCScope;
    if (!v7) {
      goto LABEL_8;
    }
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F14500];
    id v8 = MEMORY[0x1E4F14500];
  }
  id v9 = v7;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(AVHapticPlayerChannel *)self client];
    int v20 = 136316162;
    char v21 = "AVHapticPlayer.mm";
    __int16 v22 = 1024;
    int v23 = 115;
    __int16 v24 = 2080;
    int v25 = "-[AVHapticPlayerChannel clearEvents:error:]";
    __int16 v26 = 2048;
    uint64_t v27 = [v10 clientID];
    __int16 v28 = 2048;
    double v29 = a3;
    _os_log_impl(&dword_1BA902000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: clearing events: clientID: 0x%lx fromTime: %.3f", (uint8_t *)&v20, 0x30u);
  }
LABEL_8:
  id v11 = [(AVHapticPlayerChannel *)self client];
  BOOL v12 = v11 == 0;

  if (v12)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 116, "-[AVHapticPlayerChannel clearEvents:error:]", "self.client != nil", -4804, a4);
  }
  else
  {
    id v13 = [(AVHapticPlayerChannel *)self client];
    BOOL v14 = [v13 clientID] == -1;

    if (v14)
    {
      _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 117, "-[AVHapticPlayerChannel clearEvents:error:]", "self.client.clientID != kInvalidClientID", -4812, a4);
    }
    else
    {
      __int16 v15 = [(AVHapticPlayerChannel *)self client];
      int v16 = [v15 running];

      if (v16)
      {
        BOOL v17 = [(AVHapticPlayerChannel *)self client];
        char v18 = objc_msgSend(v17, "clearEventsFromTime:channel:", -[AVHapticPlayerChannel chanID](self, "chanID"), a3);

        if (v18) {
          return 1;
        }
        _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 121, "-[AVHapticPlayerChannel clearEvents:error:]", "[self.client clearEventsFromTime:fromTime channel:self.chanID]", -4899, a4);
      }
      else
      {
        _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 118, "-[AVHapticPlayerChannel clearEvents:error:]", "self.client.running", -4805, a4);
      }
    }
  }
  return 0;
}

- (BOOL)setParameter:(unint64_t)a3 value:(float)a4 atTime:(double)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if (kAVHCScope)
  {
    id v11 = *(id *)kAVHCScope;
    if (!v11) {
      goto LABEL_8;
    }
  }
  else
  {
    id v11 = (id)MEMORY[0x1E4F14500];
    id v12 = MEMORY[0x1E4F14500];
  }
  id v13 = v11;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v14 = [(AVHapticPlayerChannel *)self client];
    int v26 = 136316674;
    uint64_t v27 = "AVHapticPlayer.mm";
    __int16 v28 = 1024;
    int v29 = 127;
    __int16 v30 = 2080;
    __int16 v31 = "-[AVHapticPlayerChannel setParameter:value:atTime:error:]";
    __int16 v32 = 2048;
    uint64_t v33 = [v14 clientID];
    __int16 v34 = 1024;
    int v35 = a3;
    __int16 v36 = 2048;
    double v37 = a4;
    __int16 v38 = 2048;
    double v39 = a5;
    _os_log_impl(&dword_1BA902000, v13, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %s: setting param: clientID: 0x%lx type: %u value: %.2f atTime: %.3f", (uint8_t *)&v26, 0x40u);
  }
LABEL_8:
  __int16 v15 = [(AVHapticPlayerChannel *)self client];
  BOOL v16 = v15 == 0;

  if (v16)
  {
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 128, "-[AVHapticPlayerChannel setParameter:value:atTime:error:]", "self.client != nil", -4804, a6);
  }
  else
  {
    BOOL v17 = [(AVHapticPlayerChannel *)self client];
    BOOL v18 = [v17 clientID] == -1;

    if (v18)
    {
      _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 129, "-[AVHapticPlayerChannel setParameter:value:atTime:error:]", "self.client.clientID != kInvalidClientID", -4812, a6);
    }
    else
    {
      BOOL v19 = [(AVHapticPlayerChannel *)self client];
      int v20 = [v19 running];

      if (v20)
      {
        char v21 = [(AVHapticPlayerChannel *)self client];
        unint64_t v22 = [(AVHapticPlayerChannel *)self chanID];
        *(float *)&double v23 = a4;
        char v24 = [v21 setParameter:a3 atTime:v22 value:a5 channel:v23];

        if (v24) {
          return 1;
        }
        _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 133, "-[AVHapticPlayerChannel setParameter:value:atTime:error:]", "[self.client setParameter:type atTime:time value:value channel:self.chanID]", -4899, a6);
      }
      else
      {
        _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", 130, "-[AVHapticPlayerChannel setParameter:value:atTime:error:]", "self.client.running", -4805, a6);
      }
    }
  }
  return 0;
}

- (BOOL)scheduleParameterCurve:(unint64_t)a3 curve:(id)a4 atTime:(double)a5 error:(id *)a6
{
  id v10 = a4;
  id v11 = [(AVHapticPlayerChannel *)self client];

  if (!v11)
  {
    int v19 = -4804;
    int v20 = "self.client != nil";
    uint64_t v21 = 139;
LABEL_10:
    _Haptic_Check((uint64_t)"/Library/Caches/com.apple.xbs/Sources/CoreHaptics/Source/AVHapticPlayer.mm", v21, "-[AVHapticPlayerChannel scheduleParameterCurve:curve:atTime:error:]", v20, v19, a6);
    BOOL v18 = 0;
    goto LABEL_11;
  }
  id v12 = [(AVHapticPlayerChannel *)self client];
  uint64_t v13 = [v12 clientID];

  if (v13 == -1)
  {
    int v19 = -4812;
    int v20 = "self.client.clientID != kInvalidClientID";
    uint64_t v21 = 140;
    goto LABEL_10;
  }
  BOOL v14 = [(AVHapticPlayerChannel *)self client];
  char v15 = [v14 running];

  if ((v15 & 1) == 0)
  {
    int v19 = -4805;
    int v20 = "self.client.running";
    uint64_t v21 = 141;
    goto LABEL_10;
  }
  BOOL v16 = [(AVHapticPlayerChannel *)self client];
  char v17 = objc_msgSend(v16, "scheduleParameterCurve:curve:atTime:channel:error:", a3, v10, -[AVHapticPlayerChannel chanID](self, "chanID"), a6, a5);

  if ((v17 & 1) == 0)
  {
    int v19 = -4899;
    int v20 = "[self.client scheduleParameterCurve:type curve:parameterCurve atTime:time channel:self.chanID error:outError]";
    uint64_t v21 = 144;
    goto LABEL_10;
  }
  BOOL v18 = 1;
LABEL_11:

  return v18;
}

- (void)setChanID:(unint64_t)a3
{
  self->_chanID = a3;
}

- (void)setClient:(id)a3
{
}

@end