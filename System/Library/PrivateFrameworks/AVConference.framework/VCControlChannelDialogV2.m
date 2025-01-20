@interface VCControlChannelDialogV2
- (VCControlChannelDialogV2)initWithSessionID:(unsigned int)a3 participantID:(id)a4 participantUUID:(id)a5 participantConfig:(id *)a6 transactionDelegate:(id)a7;
- (id)allocEncryptedPayloadFromPayloadData:(id)a3;
- (id)copyDecryptedDataFromEncryptedPayload:(id)a3;
- (id)newDataFromMessage:(id)a3 topic:(id)a4 transactionID:(unint64_t)a5 isReliable:(BOOL)a6 transactionDelegate:(id)a7;
- (id)processMessageData:(id)a3 participantID:(id)a4 topic:(id *)a5 transactionID:(id *)a6 messageStatus:(unsigned int *)a7 isInternalMessage:(BOOL *)a8;
- (void)dealloc;
- (void)sendConfirmationToParticipantID:(id)a3 transactionID:(id)a4 sessionID:(unsigned int)a5 transactionDelegate:(id)a6;
@end

@implementation VCControlChannelDialogV2

- (VCControlChannelDialogV2)initWithSessionID:(unsigned int)a3 participantID:(id)a4 participantUUID:(id)a5 participantConfig:(id *)a6 transactionDelegate:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)VCControlChannelDialogV2;
  id v8 = [(VCControlChannelDialog *)&v31 initWithSessionID:*(void *)&a3 participantID:a4 participantUUID:a5 participantConfig:a6 transactionDelegate:a7];
  if (!v8) {
    goto LABEL_43;
  }
  if (!a6)
  {
    if ((id)objc_opt_class() == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_43;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v33 = v14;
      __int16 v34 = 2080;
      v35 = "-[VCControlChannelDialogV2 initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
      __int16 v36 = 1024;
      int v37 = 45;
      v16 = " [%s] %s:%d participantConfig may not be nil";
      v17 = v15;
      uint32_t v18 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v11 = (__CFString *)[v8 performSelector:sel_logPrefix];
      }
      else {
        v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_43;
      }
      uint64_t v25 = VRTraceErrorLogLevelToCSTR();
      v26 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_43;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v33 = v25;
      __int16 v34 = 2080;
      v35 = "-[VCControlChannelDialogV2 initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
      __int16 v36 = 1024;
      int v37 = 45;
      __int16 v38 = 2112;
      v39 = v11;
      __int16 v40 = 2048;
      id v41 = v8;
      v16 = " [%s] %s:%d %@(%p) participantConfig may not be nil";
      v17 = v26;
      uint32_t v18 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
LABEL_43:

    return 0;
  }
  uint64_t v9 = *MEMORY[0x1E4F1CF80];
  CFDictionaryRef v10 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], (const void **)&kVCCryptorCreationOption_DisableReplayProtection, MEMORY[0x1E4F1CFD0], 1, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (VCCryptor_Create(v9, 1, a6->var3, a6->var1, (uint64_t)v10, (uint64_t *)v8 + 30))
  {
    if ((id)objc_opt_class() != v8)
    {
      if (objc_opt_respondsToSelector()) {
        v12 = (__CFString *)[v8 performSelector:sel_logPrefix];
      }
      else {
        v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v27 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v33 = v27;
          __int16 v34 = 2080;
          v35 = "-[VCControlChannelDialogV2 initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
          __int16 v36 = 1024;
          int v37 = 49;
          __int16 v38 = 2112;
          v39 = v12;
          __int16 v40 = 2048;
          id v41 = v8;
          v21 = " [%s] %s:%d %@(%p) Failed to create uplink cryptor for dialog";
LABEL_39:
          v23 = v28;
          uint32_t v24 = 48;
          goto LABEL_40;
        }
      }
LABEL_41:
      if (v10) {
        CFRelease(v10);
      }
      goto LABEL_43;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_41;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v33 = v19;
    __int16 v34 = 2080;
    v35 = "-[VCControlChannelDialogV2 initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
    __int16 v36 = 1024;
    int v37 = 49;
    v21 = " [%s] %s:%d Failed to create uplink cryptor for dialog";
LABEL_25:
    v23 = v20;
    uint32_t v24 = 28;
LABEL_40:
    _os_log_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_DEFAULT, v21, buf, v24);
    goto LABEL_41;
  }
  if (VCCryptor_Create(v9, 1, a6->var4, a6->var2, (uint64_t)v10, (uint64_t *)v8 + 31))
  {
    if ((id)objc_opt_class() != v8)
    {
      if (objc_opt_respondsToSelector()) {
        v13 = (__CFString *)[v8 performSelector:sel_logPrefix];
      }
      else {
        v13 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v29 = VRTraceErrorLogLevelToCSTR();
        v28 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v33 = v29;
          __int16 v34 = 2080;
          v35 = "-[VCControlChannelDialogV2 initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
          __int16 v36 = 1024;
          int v37 = 52;
          __int16 v38 = 2112;
          v39 = v13;
          __int16 v40 = 2048;
          id v41 = v8;
          v21 = " [%s] %s:%d %@(%p) Failed to create downlink cryptor for dialog";
          goto LABEL_39;
        }
      }
      goto LABEL_41;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_41;
    }
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_41;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v33 = v22;
    __int16 v34 = 2080;
    v35 = "-[VCControlChannelDialogV2 initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:]";
    __int16 v36 = 1024;
    int v37 = 52;
    v21 = " [%s] %s:%d Failed to create downlink cryptor for dialog";
    goto LABEL_25;
  }
  *((_DWORD *)v8 + 64) = 0;
  if (v10) {
    CFRelease(v10);
  }
  return (VCControlChannelDialogV2 *)v8;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  downlinkCryptor = self->_downlinkCryptor;
  if (downlinkCryptor) {
    CFRelease(downlinkCryptor);
  }
  uplinkCryptor = self->_uplinkCryptor;
  if (uplinkCryptor) {
    CFRelease(uplinkCryptor);
  }
  v5.receiver = self;
  v5.super_class = (Class)VCControlChannelDialogV2;
  [(VCControlChannelDialog *)&v5 dealloc];
}

- (id)allocEncryptedPayloadFromPayloadData:(id)a3
{
  blockBufferOut[1] = *(CMBlockBufferRef *)MEMORY[0x1E4F143B8];
  CMBlockBufferRef theBuffer = 0;
  blockBufferOut[0] = 0;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v6 = (void *)[a3 bytes];
  size_t v7 = [a3 length];
  if (CMBlockBufferCreateWithMemoryBlock(v5, v6, v7, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0], 0, 0, [a3 length], 0, blockBufferOut))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:].cold.4();
      }
    }
  }
  else
  {
    p_uplinkCryptorLock = &self->_uplinkCryptorLock;
    os_unfair_lock_lock(&self->_uplinkCryptorLock);
    int v9 = VCCryptor_Encrypt((uint64_t)self->_uplinkCryptor, blockBufferOut[0], (CFTypeRef *)&theBuffer);
    os_unfair_lock_unlock(p_uplinkCryptorLock);
    if (v9)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:]();
        }
      }
    }
    else
    {
      size_t DataLength = CMBlockBufferGetDataLength(theBuffer);
      if (CMBlockBufferIsRangeContiguous(theBuffer, 0, DataLength))
      {
        dataPointerOut = 0;
        if (!CMBlockBufferGetDataPointer(theBuffer, 0, 0, 0, &dataPointerOut))
        {
          id v11 = objc_alloc(MEMORY[0x1E4F1C9B8]);
          v12 = (void *)[v11 initWithBytes:dataPointerOut length:DataLength];
          goto LABEL_6;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:]();
          }
        }
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:]();
        }
      }
    }
  }
  v12 = 0;
LABEL_6:
  if (blockBufferOut[0]) {
    CFRelease(blockBufferOut[0]);
  }
  if (theBuffer) {
    CFRelease(theBuffer);
  }
  return v12;
}

- (id)copyDecryptedDataFromEncryptedPayload:(id)a3
{
  blockBufferOut[1] = *(CMBlockBufferRef *)MEMORY[0x1E4F143B8];
  CMBlockBufferRef theBuffer = 0;
  blockBufferOut[0] = 0;
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  uint64_t v6 = (void *)[a3 bytes];
  size_t v7 = [a3 length];
  if (CMBlockBufferCreateWithMemoryBlock(v5, v6, v7, (CFAllocatorRef)*MEMORY[0x1E4F1CFA0], 0, 0, [a3 length], 0, blockBufferOut))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:].cold.4();
      }
    }
  }
  else if (VCCryptor_Decrypt((uint64_t)self->_downlinkCryptor, blockBufferOut[0], &theBuffer))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:]();
      }
    }
  }
  else
  {
    size_t DataLength = CMBlockBufferGetDataLength(theBuffer);
    if (CMBlockBufferIsRangeContiguous(theBuffer, 0, DataLength))
    {
      dataPointerOut = 0;
      if (!CMBlockBufferGetDataPointer(theBuffer, 0, 0, 0, &dataPointerOut))
      {
        id v9 = objc_alloc(MEMORY[0x1E4F1C9B8]);
        CFDictionaryRef v10 = (void *)[v9 initWithBytes:dataPointerOut length:DataLength];
        goto LABEL_6;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:]();
        }
      }
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:]();
      }
    }
  }
  CFDictionaryRef v10 = 0;
LABEL_6:
  if (blockBufferOut[0]) {
    CFRelease(blockBufferOut[0]);
  }
  if (theBuffer) {
    CFRelease(theBuffer);
  }
  return v10;
}

- (id)newDataFromMessage:(id)a3 topic:(id)a4 transactionID:(unint64_t)a5 isReliable:(BOOL)a6 transactionDelegate:(id)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (!a4)
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_29;
      }
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      uint64_t v27 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      int v33 = 136315650;
      uint64_t v34 = v26;
      __int16 v35 = 2080;
      __int16 v36 = "-[VCControlChannelDialogV2 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
      __int16 v37 = 1024;
      int v38 = 131;
      v28 = " [%s] %s:%d topic must not be nil";
      uint64_t v29 = v27;
      uint32_t v30 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v19 = (__CFString *)[(VCControlChannelDialogV2 *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v19 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_29;
      }
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      v32 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      int v33 = 136316162;
      uint64_t v34 = v31;
      __int16 v35 = 2080;
      __int16 v36 = "-[VCControlChannelDialogV2 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
      __int16 v37 = 1024;
      int v38 = 131;
      __int16 v39 = 2112;
      id v40 = v19;
      __int16 v41 = 2048;
      uint64_t v42 = self;
      v28 = " [%s] %s:%d %@(%p) topic must not be nil";
      uint64_t v29 = v32;
      uint32_t v30 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v33, v30);
LABEL_29:
    uint64_t v14 = 0;
    v12 = 0;
LABEL_30:
    v17 = 0;
    id v15 = 0;
    goto LABEL_6;
  }
  id v11 = objc_alloc_init(VCCCMessage);
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v33 = 136316162;
        uint64_t v34 = v20;
        __int16 v35 = 2080;
        __int16 v36 = "-[VCControlChannelDialogV2 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
        __int16 v37 = 1024;
        int v38 = 134;
        __int16 v39 = 2112;
        id v40 = a4;
        __int16 v41 = 2112;
        uint64_t v42 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate outgoing message for '%@:%@'", (uint8_t *)&v33, 0x30u);
      }
    }
    goto LABEL_29;
  }
  v12 = v11;
  [(VCCCMessage *)v11 setTransactionID:a5];
  [(VCCCMessage *)v12 setTopic:a4];
  -[VCCCMessage setPayload:](v12, "setPayload:", [a3 VCCCData]);
  v13 = objc_alloc_init(VCCCMessageWrapper);
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v33 = 136316162;
        uint64_t v34 = v22;
        __int16 v35 = 2080;
        __int16 v36 = "-[VCControlChannelDialogV2 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
        __int16 v37 = 1024;
        int v38 = 141;
        __int16 v39 = 2112;
        id v40 = a4;
        __int16 v41 = 2112;
        uint64_t v42 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to allocate message wrapper for '%@:%@'", (uint8_t *)&v33, 0x30u);
      }
    }
    uint64_t v14 = 0;
    goto LABEL_30;
  }
  uint64_t v14 = v13;
  [(VCCCMessageWrapper *)v13 setMessage:v12];
  id v15 = (id)[(VCCCMessageWrapper *)v14 data];
  id v16 = [(VCControlChannelDialogV2 *)self allocEncryptedPayloadFromPayloadData:v15];
  if (v16)
  {
    v17 = v16;
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      uint64_t v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v33 = 136316162;
        uint64_t v34 = v24;
        __int16 v35 = 2080;
        __int16 v36 = "-[VCControlChannelDialogV2 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
        __int16 v37 = 1024;
        int v38 = 147;
        __int16 v39 = 2112;
        id v40 = a4;
        __int16 v41 = 2112;
        uint64_t v42 = a3;
        _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d Could not encrypt outgoing message '%@:%@'", (uint8_t *)&v33, 0x30u);
      }
    }
    v17 = 0;
  }
LABEL_6:

  return v17;
}

- (id)processMessageData:(id)a3 participantID:(id)a4 topic:(id *)a5 transactionID:(id *)a6 messageStatus:(unsigned int *)a7 isInternalMessage:(BOOL *)a8
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  if (![a3 length])
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_122;
      }
      uint64_t v56 = VRTraceErrorLogLevelToCSTR();
      v57 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_122;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v87 = v56;
      __int16 v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v90 = 1024;
      int v91 = 163;
      v58 = " [%s] %s:%d messageData length must not be 0";
      goto LABEL_95;
    }
    if (objc_opt_respondsToSelector()) {
      v46 = (__CFString *)[(VCControlChannelDialogV2 *)self performSelector:sel_logPrefix];
    }
    else {
      v46 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_122;
    }
    uint64_t v66 = VRTraceErrorLogLevelToCSTR();
    v67 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_122;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v87 = v66;
    __int16 v88 = 2080;
    v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    __int16 v90 = 1024;
    int v91 = 163;
    __int16 v92 = 2112;
    *(void *)v93 = v46;
    *(_WORD *)&v93[8] = 2048;
    *(void *)&v93[10] = self;
    v58 = " [%s] %s:%d %@(%p) messageData length must not be 0";
LABEL_120:
    v64 = v67;
    uint32_t v65 = 48;
    goto LABEL_121;
  }
  if (!a5)
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_122;
      }
      uint64_t v59 = VRTraceErrorLogLevelToCSTR();
      v57 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_122;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v87 = v59;
      __int16 v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v90 = 1024;
      int v91 = 164;
      v58 = " [%s] %s:%d topic must not be nil";
      goto LABEL_95;
    }
    if (objc_opt_respondsToSelector()) {
      v47 = (__CFString *)[(VCControlChannelDialogV2 *)self performSelector:sel_logPrefix];
    }
    else {
      v47 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_122;
    }
    uint64_t v68 = VRTraceErrorLogLevelToCSTR();
    v67 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_122;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v87 = v68;
    __int16 v88 = 2080;
    v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    __int16 v90 = 1024;
    int v91 = 164;
    __int16 v92 = 2112;
    *(void *)v93 = v47;
    *(_WORD *)&v93[8] = 2048;
    *(void *)&v93[10] = self;
    v58 = " [%s] %s:%d %@(%p) topic must not be nil";
    goto LABEL_120;
  }
  if (!a6)
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_122;
      }
      uint64_t v60 = VRTraceErrorLogLevelToCSTR();
      v57 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_122;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v87 = v60;
      __int16 v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v90 = 1024;
      int v91 = 165;
      v58 = " [%s] %s:%d transactionID must not be nil";
      goto LABEL_95;
    }
    if (objc_opt_respondsToSelector()) {
      v48 = (__CFString *)[(VCControlChannelDialogV2 *)self performSelector:sel_logPrefix];
    }
    else {
      v48 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_122;
    }
    uint64_t v69 = VRTraceErrorLogLevelToCSTR();
    v67 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_122;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v87 = v69;
    __int16 v88 = 2080;
    v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    __int16 v90 = 1024;
    int v91 = 165;
    __int16 v92 = 2112;
    *(void *)v93 = v48;
    *(_WORD *)&v93[8] = 2048;
    *(void *)&v93[10] = self;
    v58 = " [%s] %s:%d %@(%p) transactionID must not be nil";
    goto LABEL_120;
  }
  if (!a7)
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_122;
      }
      uint64_t v61 = VRTraceErrorLogLevelToCSTR();
      v57 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_122;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v87 = v61;
      __int16 v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v90 = 1024;
      int v91 = 166;
      v58 = " [%s] %s:%d messageStatus must not be nil";
      goto LABEL_95;
    }
    if (objc_opt_respondsToSelector()) {
      v49 = (__CFString *)[(VCControlChannelDialogV2 *)self performSelector:sel_logPrefix];
    }
    else {
      v49 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_122;
    }
    uint64_t v70 = VRTraceErrorLogLevelToCSTR();
    v67 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_122;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v87 = v70;
    __int16 v88 = 2080;
    v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    __int16 v90 = 1024;
    int v91 = 166;
    __int16 v92 = 2112;
    *(void *)v93 = v49;
    *(_WORD *)&v93[8] = 2048;
    *(void *)&v93[10] = self;
    v58 = " [%s] %s:%d %@(%p) messageStatus must not be nil";
    goto LABEL_120;
  }
  if (!a8)
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_122;
      }
      uint64_t v62 = VRTraceErrorLogLevelToCSTR();
      v57 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_122;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v87 = v62;
      __int16 v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v90 = 1024;
      int v91 = 167;
      v58 = " [%s] %s:%d isInternalMessage must not be nil";
      goto LABEL_95;
    }
    if (objc_opt_respondsToSelector()) {
      v50 = (__CFString *)[(VCControlChannelDialogV2 *)self performSelector:sel_logPrefix];
    }
    else {
      v50 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_122;
    }
    uint64_t v71 = VRTraceErrorLogLevelToCSTR();
    v67 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_122;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v87 = v71;
    __int16 v88 = 2080;
    v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    __int16 v90 = 1024;
    int v91 = 167;
    __int16 v92 = 2112;
    *(void *)v93 = v50;
    *(_WORD *)&v93[8] = 2048;
    *(void *)&v93[10] = self;
    v58 = " [%s] %s:%d %@(%p) isInternalMessage must not be nil";
    goto LABEL_120;
  }
  id v14 = [(VCControlChannelDialogV2 *)self copyDecryptedDataFromEncryptedPayload:a3];
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v51 = VRTraceErrorLogLevelToCSTR();
      v52 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        unsigned int sessionID = self->super._sessionID;
        *(_DWORD *)buf = 136316418;
        uint64_t v87 = v51;
        __int16 v88 = 2080;
        v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
        __int16 v90 = 1024;
        int v91 = 170;
        __int16 v92 = 1024;
        *(_DWORD *)v93 = sessionID;
        *(_WORD *)&v93[4] = 2112;
        *(void *)&v93[6] = a4;
        *(_WORD *)&v93[14] = 2112;
        *(void *)&v93[16] = 0;
        _os_log_error_impl(&dword_1E1EA4000, v52, OS_LOG_TYPE_ERROR, " [%s] %s:%d Could not decrypt incoming payload for _sessionID='%d', participantID='%@', transactionID='%@'", buf, 0x36u);
      }
    }
    goto LABEL_122;
  }
  id v15 = v14;
  id v16 = [[VCCCMessageWrapper alloc] initWithData:v14];

  if (!v16)
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        v54 = (__CFString *)[(VCControlChannelDialogV2 *)self performSelector:sel_logPrefix];
      }
      else {
        v54 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_122;
      }
      uint64_t v72 = VRTraceErrorLogLevelToCSTR();
      v67 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_122;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v87 = v72;
      __int16 v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v90 = 1024;
      int v91 = 174;
      __int16 v92 = 2112;
      *(void *)v93 = v54;
      *(_WORD *)&v93[8] = 2048;
      *(void *)&v93[10] = self;
      v58 = " [%s] %s:%d %@(%p) messageData does have neither message nor acknowledgment. Ignoring malformed messageData";
      goto LABEL_120;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_122;
    }
    uint64_t v63 = VRTraceErrorLogLevelToCSTR();
    v57 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_122;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v87 = v63;
    __int16 v88 = 2080;
    v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    __int16 v90 = 1024;
    int v91 = 174;
    v58 = " [%s] %s:%d messageData does have neither message nor acknowledgment. Ignoring malformed messageData";
LABEL_95:
    v64 = v57;
    uint32_t v65 = 28;
LABEL_121:
    _os_log_impl(&dword_1E1EA4000, v64, OS_LOG_TYPE_DEFAULT, v58, buf, v65);
LABEL_122:
    id v16 = 0;
    goto LABEL_123;
  }
  if (![(VCCCMessageWrapper *)v16 hasMessage]
    && ![(VCCCMessageWrapper *)v16 hasAcknowledgement])
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_123;
      }
      uint64_t v73 = VRTraceErrorLogLevelToCSTR();
      v74 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_123;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v87 = v73;
      __int16 v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v90 = 1024;
      int v91 = 175;
      v75 = " [%s] %s:%d messageData does have neither message nor acknowledgment. Ignoring malformed messageData";
      v76 = v74;
      uint32_t v77 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v55 = (__CFString *)[(VCControlChannelDialogV2 *)self performSelector:sel_logPrefix];
      }
      else {
        v55 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_123;
      }
      uint64_t v78 = VRTraceErrorLogLevelToCSTR();
      v79 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_123;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v87 = v78;
      __int16 v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v90 = 1024;
      int v91 = 175;
      __int16 v92 = 2112;
      *(void *)v93 = v55;
      *(_WORD *)&v93[8] = 2048;
      *(void *)&v93[10] = self;
      v75 = " [%s] %s:%d %@(%p) messageData does have neither message nor acknowledgment. Ignoring malformed messageData";
      v76 = v79;
      uint32_t v77 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v76, OS_LOG_TYPE_DEFAULT, v75, buf, v77);
LABEL_123:
    v23 = 0;
    goto LABEL_52;
  }
  BOOL v17 = [(VCCCMessageWrapper *)v16 hasMessage];
  v84 = a5;
  v85 = a7;
  if (v17)
  {
    v81 = a8;
    uint32_t v18 = [(VCCCMessageWrapper *)v16 message];
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[VCCCMessage transactionID](v18, "transactionID"));
    uint64_t v20 = [(VCCCMessage *)v18 topic];
    if ([(NSString *)v20 length]) {
      v21 = v20;
    }
    else {
      v21 = 0;
    }
    uint64_t v22 = 0;
    if ([(VCCCMessage *)v18 hasPayload]) {
      uint64_t v22 = [(VCCCMessage *)v18 payload];
    }
    if ([(NSData *)v22 length]) {
      v23 = v22;
    }
    else {
      v23 = 0;
    }
    uint64_t v24 = (const void *)MEMORY[0x1E4E56580](&self->super._weakTransactionDelegate);
    [(VCControlChannelDialogV2 *)self sendConfirmationToParticipantID:a4 transactionID:v19 sessionID:self->super._sessionID transactionDelegate:v24];
    v82 = a6;
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_34;
      }
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      uint64_t v27 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      unsigned int v28 = self->super._sessionID;
      *(_DWORD *)buf = 136316418;
      uint64_t v87 = v26;
      __int16 v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v90 = 1024;
      int v91 = 189;
      __int16 v92 = 1024;
      *(_DWORD *)v93 = v28;
      *(_WORD *)&v93[4] = 2112;
      *(void *)&v93[6] = a4;
      *(_WORD *)&v93[14] = 2112;
      *(void *)&v93[16] = v19;
      uint64_t v29 = " [%s] %s:%d Sent confirmation for _sessionID='%d', participantID='%@', transactionID='%@'";
      uint32_t v30 = v27;
      uint32_t v31 = 54;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v80 = (__CFString *)[(VCControlChannelDialogV2 *)self performSelector:sel_logPrefix];
      }
      else {
        v80 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6
        || (uint64_t v32 = VRTraceErrorLogLevelToCSTR(),
            int v33 = *MEMORY[0x1E4F47A50],
            !os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)))
      {
LABEL_34:
        if (v24)
        {
          CFRelease(v24);
          LODWORD(v24) = 0;
        }
        a8 = v81;
        goto LABEL_50;
      }
      unsigned int v34 = self->super._sessionID;
      *(_DWORD *)buf = 136316930;
      uint64_t v87 = v32;
      __int16 v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v90 = 1024;
      int v91 = 189;
      __int16 v92 = 2112;
      *(void *)v93 = v80;
      *(_WORD *)&v93[8] = 2048;
      *(void *)&v93[10] = self;
      *(_WORD *)&v93[18] = 1024;
      *(_DWORD *)&v93[20] = v34;
      __int16 v94 = 2112;
      id v95 = a4;
      __int16 v96 = 2112;
      v97 = v19;
      uint64_t v29 = " [%s] %s:%d %@(%p) Sent confirmation for _sessionID='%d', participantID='%@', transactionID='%@'";
      uint32_t v30 = v33;
      uint32_t v31 = 74;
    }
    _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, v29, buf, v31);
    goto LABEL_34;
  }
  if ([(VCCCMessageWrapper *)v16 hasAcknowledgement])
  {
    v82 = a6;
    uint64_t v25 = [(VCCCMessageWrapper *)v16 acknowledgement];
    uint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[VCCCMessageAcknowledgment transactionID](v25, "transactionID"));
    if ([(VCCCMessageAcknowledgment *)v25 hasStatus]) {
      LODWORD(v24) = [(VCCCMessageAcknowledgment *)v25 status];
    }
    else {
      LODWORD(v24) = 0;
    }
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_49;
      }
      uint64_t v36 = VRTraceErrorLogLevelToCSTR();
      __int16 v37 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_49;
      }
      unsigned int v38 = self->super._sessionID;
      *(_DWORD *)buf = 136316674;
      uint64_t v87 = v36;
      __int16 v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v90 = 1024;
      int v91 = 196;
      __int16 v92 = 1024;
      *(_DWORD *)v93 = v38;
      *(_WORD *)&v93[4] = 2112;
      *(void *)&v93[6] = a4;
      *(_WORD *)&v93[14] = 2112;
      *(void *)&v93[16] = v19;
      __int16 v94 = 1024;
      LODWORD(v95) = v24;
      __int16 v39 = " [%s] %s:%d Reliable message has been ACKed for _sessionID='%d', participantID='%@', transactionID='%@', messageStatus='%d'";
      id v40 = v37;
      uint32_t v41 = 60;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v35 = (__CFString *)[(VCControlChannelDialogV2 *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v35 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_49;
      }
      uint64_t v42 = VRTraceErrorLogLevelToCSTR();
      uint64_t v43 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_49;
      }
      unsigned int v44 = self->super._sessionID;
      *(_DWORD *)buf = 136317186;
      uint64_t v87 = v42;
      __int16 v88 = 2080;
      v89 = "-[VCControlChannelDialogV2 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v90 = 1024;
      int v91 = 196;
      __int16 v92 = 2112;
      *(void *)v93 = v35;
      *(_WORD *)&v93[8] = 2048;
      *(void *)&v93[10] = self;
      *(_WORD *)&v93[18] = 1024;
      *(_DWORD *)&v93[20] = v44;
      __int16 v94 = 2112;
      id v95 = a4;
      __int16 v96 = 2112;
      v97 = v19;
      __int16 v98 = 1024;
      int v99 = (int)v24;
      __int16 v39 = " [%s] %s:%d %@(%p) Reliable message has been ACKed for _sessionID='%d', participantID='%@', transactionID='%"
            "@', messageStatus='%d'";
      id v40 = v43;
      uint32_t v41 = 80;
    }
    _os_log_impl(&dword_1E1EA4000, v40, OS_LOG_TYPE_DEFAULT, v39, buf, v41);
LABEL_49:
    [(VCControlChannelDialog *)self confirmTransaction:v19];
    v21 = 0;
    v23 = 0;
LABEL_50:
    a6 = v82;
    goto LABEL_51;
  }
  LODWORD(v24) = 0;
  uint64_t v19 = 0;
  v21 = 0;
  v23 = 0;
LABEL_51:
  id *v84 = v21;
  unsigned int *v85 = v24;
  *a6 = v19;
  *a8 = !v17;
LABEL_52:

  return v23;
}

- (void)sendConfirmationToParticipantID:(id)a3 transactionID:(id)a4 sessionID:(unsigned int)a5 transactionDelegate:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v11 = objc_alloc_init(VCCCMessageAcknowledgment);
  if (!v11)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_22;
    }
    uint64_t v26 = VRTraceErrorLogLevelToCSTR();
    uint64_t v27 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v37 = v26;
    __int16 v38 = 2080;
    __int16 v39 = "-[VCControlChannelDialogV2 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
    __int16 v40 = 1024;
    int v41 = 216;
    __int16 v42 = 1024;
    *(_DWORD *)uint64_t v43 = v7;
    *(_WORD *)&v43[4] = 2112;
    *(void *)&v43[6] = a4;
    unsigned int v28 = " [%s] %s:%d Failed to allocate outgoing acknowledgment message for sessionID='%d', transactionID='%@'";
    goto LABEL_39;
  }
  -[VCCCMessageAcknowledgment setTransactionID:](v11, "setTransactionID:", [a4 unsignedLongValue]);
  v12 = objc_alloc_init(VCCCMessageWrapper);
  if (!v12)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      goto LABEL_22;
    }
    uint64_t v29 = VRTraceErrorLogLevelToCSTR();
    uint64_t v27 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      goto LABEL_22;
    }
    *(_DWORD *)buf = 136316162;
    uint64_t v37 = v29;
    __int16 v38 = 2080;
    __int16 v39 = "-[VCControlChannelDialogV2 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
    __int16 v40 = 1024;
    int v41 = 220;
    __int16 v42 = 1024;
    *(_DWORD *)uint64_t v43 = v7;
    *(_WORD *)&v43[4] = 2112;
    *(void *)&v43[6] = a4;
    unsigned int v28 = " [%s] %s:%d Failed to allocate message wrapper for sessionID='%d', transactionID='%@'";
LABEL_39:
    _os_log_error_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_ERROR, v28, buf, 0x2Cu);
LABEL_22:
    v13 = 0;
LABEL_23:
    BOOL v17 = 0;
    id v15 = 0;
    goto LABEL_16;
  }
  v13 = v12;
  [(VCCCMessageWrapper *)v12 setAcknowledgement:v11];
  id v14 = (id)[(VCCCMessageWrapper *)v13 data];
  if (!v14)
  {
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCControlChannelDialogV2 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v30 = (__CFString *)[(VCControlChannelDialogV2 *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v30 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v33 = VRTraceErrorLogLevelToCSTR();
        unsigned int v34 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v37 = v33;
          __int16 v38 = 2080;
          __int16 v39 = "-[VCControlChannelDialogV2 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
          __int16 v40 = 1024;
          int v41 = 225;
          __int16 v42 = 2112;
          *(void *)uint64_t v43 = v30;
          *(_WORD *)&v43[8] = 2048;
          *(void *)&v43[10] = self;
          _os_log_error_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Can not send confirmation: messageData is nil", buf, 0x30u);
        }
      }
    }
    goto LABEL_23;
  }
  id v15 = v14;
  id v16 = [(VCControlChannelDialogV2 *)self allocEncryptedPayloadFromPayloadData:v14];
  if (v16)
  {
    BOOL v17 = v16;
    +[VCControlChannelTransaction sendUnreliableMessage:v16 sessionID:v7 participantID:a3 transactionID:0 transactionDelegate:a6 withOptions:0];
    if ((VCControlChannelDialogV2 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        uint64_t v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v37 = v19;
          __int16 v38 = 2080;
          __int16 v39 = "-[VCControlChannelDialogV2 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
          __int16 v40 = 1024;
          int v41 = 237;
          __int16 v42 = 1024;
          *(_DWORD *)uint64_t v43 = v7;
          *(_WORD *)&v43[4] = 2112;
          *(void *)&v43[6] = a3;
          *(_WORD *)&v43[14] = 2112;
          *(void *)&v43[16] = a4;
          v21 = " [%s] %s:%d Dialog send confirmation for sessionID='%d', participantID='%@', transactionID='%@'";
          uint64_t v22 = v20;
          uint32_t v23 = 54;
LABEL_15:
          _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v18 = (__CFString *)[(VCControlChannelDialogV2 *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v18 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        id v35 = a4;
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        uint64_t v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316930;
          uint64_t v37 = v24;
          __int16 v38 = 2080;
          __int16 v39 = "-[VCControlChannelDialogV2 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
          __int16 v40 = 1024;
          int v41 = 237;
          __int16 v42 = 2112;
          *(void *)uint64_t v43 = v18;
          *(_WORD *)&v43[8] = 2048;
          *(void *)&v43[10] = self;
          *(_WORD *)&v43[18] = 1024;
          *(_DWORD *)&v43[20] = v7;
          __int16 v44 = 2112;
          id v45 = a3;
          __int16 v46 = 2112;
          id v47 = v35;
          v21 = " [%s] %s:%d %@(%p) Dialog send confirmation for sessionID='%d', participantID='%@', transactionID='%@'";
          uint64_t v22 = v25;
          uint32_t v23 = 74;
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      uint64_t v32 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v37 = v31;
        __int16 v38 = 2080;
        __int16 v39 = "-[VCControlChannelDialogV2 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
        __int16 v40 = 1024;
        int v41 = 228;
        __int16 v42 = 1024;
        *(_DWORD *)uint64_t v43 = v7;
        *(_WORD *)&v43[4] = 2112;
        *(void *)&v43[6] = a3;
        *(_WORD *)&v43[14] = 2112;
        *(void *)&v43[16] = a4;
        _os_log_error_impl(&dword_1E1EA4000, v32, OS_LOG_TYPE_ERROR, " [%s] %s:%d Could not encrypt confirmation for sessionID='%d', participantID='%@', transactionID='%@'", buf, 0x36u);
      }
    }
    BOOL v17 = 0;
  }
LABEL_16:
}

- (void)allocEncryptedPayloadFromPayloadData:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCCryptor_Encrypt produced non-contiguous buffer", v2, v3, v4, v5, v6);
}

- (void)allocEncryptedPayloadFromPayloadData:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMBlockBufferGetDataPointer failed", v2, v3, v4, v5, v6);
}

- (void)allocEncryptedPayloadFromPayloadData:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCCryptor_Encrypt failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:]" >> 16, v4);
}

- (void)allocEncryptedPayloadFromPayloadData:.cold.4()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMBlockBufferCreateWithMemoryBlock failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCControlChannelDialogV2 allocEncryptedPayloadFromPayloadData:]" >> 16, v4);
}

- (void)copyDecryptedDataFromEncryptedPayload:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCCryptor_Decrypt produced non-contiguous buffer", v2, v3, v4, v5, v6);
}

- (void)copyDecryptedDataFromEncryptedPayload:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMBlockBufferGetDataPointer failed", v2, v3, v4, v5, v6);
}

- (void)copyDecryptedDataFromEncryptedPayload:.cold.3()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCCryptor_Decrypt failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:]" >> 16, v4);
}

- (void)copyDecryptedDataFromEncryptedPayload:.cold.4()
{
  OUTLINED_FUNCTION_5();
  *(void *)&v3[6] = "-[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:]";
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d CMBlockBufferCreateWithMemoryBlock failed with error '%d'", v2, *(const char **)v3, (unint64_t)"-[VCControlChannelDialogV2 copyDecryptedDataFromEncryptedPayload:]" >> 16, v4);
}

- (void)sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Can not send confirmation: messageData is nil", v2, v3, v4, v5, v6);
}

@end