@interface VCControlChannelDialogV1
+ (BOOL)encryptMessage:(id)a3 buffer:(char *)a4 size:(unsigned int)a5 sequenceNumber:(unsigned __int16)a6 transactionDelegate:(id)a7;
+ (BOOL)processMessageFromParticipant:(id)a3 transactionID:(id)a4 messageType:(unsigned int)a5 sessionID:(unsigned int)a6 transactionDelegate:(id)a7;
+ (id)newEncryptedMessageFromMessage:(id)a3 sequenceNumber:(unsigned __int16)a4 transactionDelegate:(id)a5;
+ (void)sendConfirmationToParticipantID:(id)a3 transactionID:(id)a4 sessionID:(unsigned int)a5 transactionDelegate:(id)a6;
- (BOOL)decryptMessageWithMKI:(void *)a3 message:(id)a4 buffer:(char *)a5 size:(unsigned int)a6 sequenceNumber:(unsigned __int16)a7;
- (BOOL)processMessageFromParticipant:(id)a3 transactionID:(id)a4 messageType:(unsigned int)a5 transactionDelegate:(id)a6;
- (VCControlChannelDialogV1)initWithSessionID:(unsigned int)a3 participantID:(id)a4 participantUUID:(id)a5 optionalTopics:(id)a6 participantConfig:(id *)a7 transactionDelegate:(id)a8;
- (id)newDataFromMessage:(id)a3 topic:(id)a4 transactionID:(unint64_t)a5 isReliable:(BOOL)a6 transactionDelegate:(id)a7;
- (id)processEncryptedPayload:(id)a3 isData:(BOOL)a4 topic:(id *)a5 sequenceNumber:(id)a6 MKIData:(id)a7 participantID:(id)a8;
- (id)processMessageData:(id)a3 participantID:(id)a4 topic:(id *)a5 transactionID:(id *)a6 messageStatus:(unsigned int *)a7 isInternalMessage:(BOOL *)a8;
- (void)dealloc;
- (void)getTopic:(id *)a3 message:(id *)a4 fromPayload:(id)a5;
@end

@implementation VCControlChannelDialogV1

- (VCControlChannelDialogV1)initWithSessionID:(unsigned int)a3 participantID:(id)a4 participantUUID:(id)a5 optionalTopics:(id)a6 participantConfig:(id *)a7 transactionDelegate:(id)a8
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)VCControlChannelDialogV1;
  v9 = [(VCControlChannelDialog *)&v11 initWithSessionID:*(void *)&a3 participantID:a4 participantUUID:a5 participantConfig:a7 transactionDelegate:a8];
  if (v9) {
    v9->_optionalTopics = (NSArray *)a6;
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCControlChannelDialogV1;
  [(VCControlChannelDialog *)&v3 dealloc];
}

- (BOOL)processMessageFromParticipant:(id)a3 transactionID:(id)a4 messageType:(unsigned int)a5 transactionDelegate:(id)a6
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  if (a5 == 2)
  {
    +[VCControlChannelDialogV1 sendConfirmationToParticipantID:a3 transactionID:a4 sessionID:self->super._sessionID transactionDelegate:a6];
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_30;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      unsigned int sessionID = self->super._sessionID;
      *(_DWORD *)v50 = 136316418;
      *(void *)&v50[4] = v14;
      *(_WORD *)&v50[12] = 2080;
      *(void *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
      *(_WORD *)&v50[22] = 1024;
      *(_DWORD *)v51 = 72;
      *(_WORD *)&v51[4] = 1024;
      *(_DWORD *)&v51[6] = sessionID;
      *(_WORD *)&v51[10] = 2112;
      *(void *)&v51[12] = a3;
      *(_WORD *)&v51[20] = 2112;
      *(void *)&v51[22] = a4;
      v17 = " [%s] %s:%d processMessage: Sent confirmation for _sessionID='%d', participantID='%@', transactionID='%@'";
      v18 = v15;
      uint32_t v19 = 54;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v12 = (__CFString *)[(VCControlChannelDialogV1 *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_30;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_30;
      }
      unsigned int v22 = self->super._sessionID;
      *(_DWORD *)v50 = 136316930;
      *(void *)&v50[4] = v20;
      *(_WORD *)&v50[12] = 2080;
      *(void *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
      *(_WORD *)&v50[22] = 1024;
      *(_DWORD *)v51 = 72;
      *(_WORD *)&v51[4] = 2112;
      *(void *)&v51[6] = v12;
      *(_WORD *)&v51[14] = 2048;
      *(void *)&v51[16] = self;
      *(_WORD *)&v51[24] = 1024;
      *(_DWORD *)&v51[26] = v22;
      *(_WORD *)&v51[30] = 2112;
      id v52 = a3;
      LOWORD(v53) = 2112;
      *(void *)((char *)&v53 + 2) = a4;
      v17 = " [%s] %s:%d %@(%p) processMessage: Sent confirmation for _sessionID='%d', participantID='%@', transactionID='%@'";
      v18 = v21;
      uint32_t v19 = 74;
    }
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, v50, v19);
    goto LABEL_30;
  }
  if (a5 != 1) {
    goto LABEL_30;
  }
  v10 = (VCControlChannelDialogV1 *)objc_opt_class();
  if (a4)
  {
    if (v10 == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_29;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      unsigned int v25 = self->super._sessionID;
      *(_DWORD *)v50 = 136316674;
      *(void *)&v50[4] = v23;
      *(_WORD *)&v50[12] = 2080;
      *(void *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
      *(_WORD *)&v50[22] = 1024;
      *(_DWORD *)v51 = 67;
      *(_WORD *)&v51[4] = 1024;
      *(_DWORD *)&v51[6] = v25;
      *(_WORD *)&v51[10] = 2112;
      *(void *)&v51[12] = a3;
      *(_WORD *)&v51[20] = 2112;
      *(void *)&v51[22] = a4;
      *(_WORD *)&v51[30] = 1024;
      LODWORD(v52) = 1;
      v26 = " [%s] %s:%d Reliable message has been ACKed for _sessionID='%d', participantID='%@', transactionID='%@', messageType='%d'";
      v27 = v24;
      uint32_t v28 = 60;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_super v11 = (__CFString *)[(VCControlChannelDialogV1 *)self performSelector:sel_logPrefix];
      }
      else {
        objc_super v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_29;
      }
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      v30 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      unsigned int v31 = self->super._sessionID;
      *(_DWORD *)v50 = 136317186;
      *(void *)&v50[4] = v29;
      *(_WORD *)&v50[12] = 2080;
      *(void *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
      *(_WORD *)&v50[22] = 1024;
      *(_DWORD *)v51 = 67;
      *(_WORD *)&v51[4] = 2112;
      *(void *)&v51[6] = v11;
      *(_WORD *)&v51[14] = 2048;
      *(void *)&v51[16] = self;
      *(_WORD *)&v51[24] = 1024;
      *(_DWORD *)&v51[26] = v31;
      *(_WORD *)&v51[30] = 2112;
      id v52 = a3;
      LOWORD(v53) = 2112;
      *(void *)((char *)&v53 + 2) = a4;
      WORD5(v53) = 1024;
      HIDWORD(v53) = 1;
      v26 = " [%s] %s:%d %@(%p) Reliable message has been ACKed for _sessionID='%d', participantID='%@', transactionID='%"
            "@', messageType='%d'";
      v27 = v30;
      uint32_t v28 = 80;
    }
    _os_log_impl(&dword_1E1EA4000, v27, OS_LOG_TYPE_DEFAULT, v26, v50, v28);
LABEL_29:
    -[VCControlChannelDialog confirmTransaction:](self, "confirmTransaction:", a4, *(_OWORD *)v50, *(void *)&v50[16], *(_OWORD *)v51, *(_OWORD *)&v51[16], v52, v53);
    goto LABEL_30;
  }
  if (v10 == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v41 = VRTraceErrorLogLevelToCSTR();
      v42 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        unsigned int v43 = self->super._sessionID;
        *(_DWORD *)v50 = 136316162;
        *(void *)&v50[4] = v41;
        *(_WORD *)&v50[12] = 2080;
        *(void *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
        *(_WORD *)&v50[22] = 1024;
        *(_DWORD *)v51 = 64;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v43;
        *(_WORD *)&v51[10] = 2112;
        *(void *)&v51[12] = a3;
        v44 = " [%s] %s:%d processMessage: sequenceNumber may not be nil!!! Aborting processing message for _sessionID='%"
              "d', participantID='%@'";
        v45 = v42;
        uint32_t v46 = 44;
LABEL_49:
        _os_log_error_impl(&dword_1E1EA4000, v45, OS_LOG_TYPE_ERROR, v44, v50, v46);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v13 = (__CFString *)[(VCControlChannelDialogV1 *)self performSelector:sel_logPrefix];
    }
    else {
      v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v47 = VRTraceErrorLogLevelToCSTR();
      v48 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        unsigned int v49 = self->super._sessionID;
        *(_DWORD *)v50 = 136316674;
        *(void *)&v50[4] = v47;
        *(_WORD *)&v50[12] = 2080;
        *(void *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
        *(_WORD *)&v50[22] = 1024;
        *(_DWORD *)v51 = 64;
        *(_WORD *)&v51[4] = 2112;
        *(void *)&v51[6] = v13;
        *(_WORD *)&v51[14] = 2048;
        *(void *)&v51[16] = self;
        *(_WORD *)&v51[24] = 1024;
        *(_DWORD *)&v51[26] = v49;
        *(_WORD *)&v51[30] = 2112;
        id v52 = a3;
        v44 = " [%s] %s:%d %@(%p) processMessage: sequenceNumber may not be nil!!! Aborting processing message for _sessi"
              "onID='%d', participantID='%@'";
        v45 = v48;
        uint32_t v46 = 64;
        goto LABEL_49;
      }
    }
  }
LABEL_30:
  if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v50 = 136315906;
        *(void *)&v50[4] = v33;
        *(_WORD *)&v50[12] = 2080;
        *(void *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
        *(_WORD *)&v50[22] = 1024;
        *(_DWORD *)v51 = 77;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = a5 < 2;
        v35 = " [%s] %s:%d processMessageFromParticipant: isInternalMessage='%d'";
        v36 = v34;
        uint32_t v37 = 34;
LABEL_40:
        _os_log_impl(&dword_1E1EA4000, v36, OS_LOG_TYPE_DEFAULT, v35, v50, v37);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v32 = (__CFString *)[(VCControlChannelDialogV1 *)self performSelector:sel_logPrefix];
    }
    else {
      v32 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v38 = VRTraceErrorLogLevelToCSTR();
      v39 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)v50 = 136316418;
        *(void *)&v50[4] = v38;
        *(_WORD *)&v50[12] = 2080;
        *(void *)&v50[14] = "-[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:transactionDelegate:]";
        *(_WORD *)&v50[22] = 1024;
        *(_DWORD *)v51 = 77;
        *(_WORD *)&v51[4] = 2112;
        *(void *)&v51[6] = v32;
        *(_WORD *)&v51[14] = 2048;
        *(void *)&v51[16] = self;
        *(_WORD *)&v51[24] = 1024;
        *(_DWORD *)&v51[26] = a5 < 2;
        v35 = " [%s] %s:%d %@(%p) processMessageFromParticipant: isInternalMessage='%d'";
        v36 = v39;
        uint32_t v37 = 54;
        goto LABEL_40;
      }
    }
  }
  return a5 < 2;
}

+ (BOOL)encryptMessage:(id)a3 buffer:(char *)a4 size:(unsigned int)a5 sequenceNumber:(unsigned __int16)a6 transactionDelegate:(id)a7
{
  uint64_t v8 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (![a3 VCCCGetBytes:a4 size:*(void *)&a5])
  {
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return 0;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      int v23 = 136316418;
      uint64_t v24 = v16;
      __int16 v25 = 2080;
      v26 = "+[VCControlChannelDialogV1 encryptMessage:buffer:size:sequenceNumber:transactionDelegate:]";
      __int16 v27 = 1024;
      int v28 = 86;
      __int16 v29 = 2112;
      id v30 = a3;
      __int16 v31 = 1024;
      *(_DWORD *)v32 = [a3 VCCCLength];
      *(_WORD *)&v32[4] = 1024;
      *(_DWORD *)&v32[6] = a5;
      v18 = " [%s] %s:%d encryptMessage: message '%@' is too long (%d > %d)";
      uint32_t v19 = v17;
      uint32_t v20 = 50;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v15 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return 0;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      unsigned int v22 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      int v23 = 136316930;
      uint64_t v24 = v21;
      __int16 v25 = 2080;
      v26 = "+[VCControlChannelDialogV1 encryptMessage:buffer:size:sequenceNumber:transactionDelegate:]";
      __int16 v27 = 1024;
      int v28 = 86;
      __int16 v29 = 2112;
      id v30 = v15;
      __int16 v31 = 2048;
      *(void *)v32 = a1;
      *(_WORD *)&v32[8] = 2112;
      id v33 = a3;
      __int16 v34 = 1024;
      int v35 = [a3 VCCCLength];
      __int16 v36 = 1024;
      unsigned int v37 = a5;
      v18 = " [%s] %s:%d %@(%p) encryptMessage: message '%@' is too long (%d > %d)";
      uint32_t v19 = v22;
      uint32_t v20 = 70;
    }
    _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v23, v20);
    return 0;
  }
  uint64_t v13 = [a3 VCCCLength];

  return [a7 encryptData:a4 size:v13 sequenceNumber:v8];
}

- (id)newDataFromMessage:(id)a3 topic:(id)a4 transactionID:(unint64_t)a5 isReliable:(BOOL)a6 transactionDelegate:(id)a7
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if (!a3)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        v18 = (__CFString *)[(VCControlChannelDialogV1 *)self performSelector:sel_logPrefix];
      }
      else {
        v18 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      int v28 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v33 = v27;
      __int16 v34 = 2080;
      int v35 = "-[VCControlChannelDialogV1 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
      __int16 v36 = 1024;
      int v37 = 93;
      __int16 v38 = 2112;
      v39 = v18;
      __int16 v40 = 2048;
      uint64_t v41 = self;
      int v23 = " [%s] %s:%d %@(%p) message must not be nil";
LABEL_38:
      __int16 v25 = v28;
      uint32_t v26 = 48;
      goto LABEL_39;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return 0;
    }
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    unsigned int v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v33 = v21;
    __int16 v34 = 2080;
    int v35 = "-[VCControlChannelDialogV1 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
    __int16 v36 = 1024;
    int v37 = 93;
    int v23 = " [%s] %s:%d message must not be nil";
LABEL_26:
    __int16 v25 = v22;
    uint32_t v26 = 28;
LABEL_39:
    _os_log_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_DEFAULT, v23, buf, v26);
    return 0;
  }
  if (!a4)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v19 = (__CFString *)[(VCControlChannelDialogV1 *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v19 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      int v28 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v33 = v29;
      __int16 v34 = 2080;
      int v35 = "-[VCControlChannelDialogV1 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
      __int16 v36 = 1024;
      int v37 = 94;
      __int16 v38 = 2112;
      v39 = v19;
      __int16 v40 = 2048;
      uint64_t v41 = self;
      int v23 = " [%s] %s:%d %@(%p) topic must not be nil";
      goto LABEL_38;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return 0;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    unsigned int v22 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315650;
    uint64_t v33 = v24;
    __int16 v34 = 2080;
    int v35 = "-[VCControlChannelDialogV1 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
    __int16 v36 = 1024;
    int v37 = 94;
    int v23 = " [%s] %s:%d topic must not be nil";
    goto LABEL_26;
  }
  BOOL v10 = a6;
  id v12 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ![(NSArray *)self->_optionalTopics containsObject:a4]) {
    id v12 = (id)[NSString stringWithFormat:@"%@%@%@", a4, @":", v12];
  }
  id v13 = +[VCControlChannelDialogV1 newEncryptedMessageFromMessage:v12 sequenceNumber:(unsigned __int16)a5 transactionDelegate:a7];
  if (!v13)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCControlChannelDialogV1 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint32_t v20 = (__CFString *)[(VCControlChannelDialogV1 *)self performSelector:sel_logPrefix];
      }
      else {
        uint32_t v20 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v30 = VRTraceErrorLogLevelToCSTR();
        __int16 v31 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v33 = v30;
          __int16 v34 = 2080;
          int v35 = "-[VCControlChannelDialogV1 newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:]";
          __int16 v36 = 1024;
          int v37 = 103;
          __int16 v38 = 2112;
          v39 = v20;
          __int16 v40 = 2048;
          uint64_t v41 = self;
          _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) newDataFromMessage: encryption failed. Dropping the message...", buf, 0x30u);
        }
      }
    }
    return 0;
  }
  uint64_t v14 = v13;
  objc_msgSend(v13, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a5), @"TransactionID");
  if (v10) {
    uint64_t v15 = 2;
  }
  else {
    uint64_t v15 = 3;
  }
  objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", v15), @"Status");
  id v16 = (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v14 requiringSecureCoding:1 error:0];

  return v16;
}

+ (id)newEncryptedMessageFromMessage:(id)a3 sequenceNumber:(unsigned __int16)a4 transactionDelegate:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (![a5 isEncryptionEnabled]) {
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", a3, @"Message", 0);
  }
  memset(__b, 170, sizeof(__b));
  uint64_t v9 = [a5 lastUsedMKIBytes];
  if (v9
    && (uint64_t v10 = v9,
        +[VCControlChannelDialogV1 encryptMessage:a3 buffer:__b size:2048 sequenceNumber:v6 transactionDelegate:a5]))
  {
    uint64_t v11 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", __b, objc_msgSend(a3, "VCCCLength"));
    id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v11, objc_msgSend(a3, "VCCCPayloadKey"), 0);
    [v12 setObject:v10 forKeyedSubscript:@"MKI"];
  }
  else
  {
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          +[VCControlChannelDialogV1 newEncryptedMessageFromMessage:sequenceNumber:transactionDelegate:]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v14 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v14 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v15 = VRTraceErrorLogLevelToCSTR();
        id v16 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316162;
          uint64_t v18 = v15;
          __int16 v19 = 2080;
          uint32_t v20 = "+[VCControlChannelDialogV1 newEncryptedMessageFromMessage:sequenceNumber:transactionDelegate:]";
          __int16 v21 = 1024;
          int v22 = 125;
          __int16 v23 = 2112;
          uint64_t v24 = v14;
          __int16 v25 = 2048;
          id v26 = a1;
          _os_log_error_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) newEncryptedMessageFromMessage: encryption failed. Dropping the message...", buf, 0x30u);
        }
      }
    }
    return 0;
  }
  return v12;
}

+ (void)sendConfirmationToParticipantID:(id)a3 transactionID:(id)a4 sessionID:(unsigned int)a5 transactionDelegate:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v11 = (void *)MEMORY[0x1E4E589F0](a1, a2);
  id v12 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithObjectsAndKeys:", a4, @"TransactionID", 0);
  [v12 setObject:&unk_1F3DC6690 forKeyedSubscript:@"Status"];
  id v13 = (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
  id v14 = (id)objc_opt_class();
  if (v13)
  {
    if (v14 == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v27 = v16;
      __int16 v28 = 2080;
      uint64_t v29 = "+[VCControlChannelDialogV1 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
      __int16 v30 = 1024;
      int v31 = 143;
      __int16 v32 = 1024;
      *(_DWORD *)uint64_t v33 = v7;
      *(_WORD *)&v33[4] = 2112;
      *(void *)&v33[6] = a3;
      *(_WORD *)&v33[14] = 2112;
      *(void *)&v33[16] = a4;
      uint64_t v18 = " [%s] %s:%d Dialog send confirmation for sessionID='%d', participantID='%@', transactionID='%@'";
      __int16 v19 = v17;
      uint32_t v20 = 54;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v15 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v15 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_13;
      }
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      int v22 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136316930;
      uint64_t v27 = v21;
      __int16 v28 = 2080;
      uint64_t v29 = "+[VCControlChannelDialogV1 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
      __int16 v30 = 1024;
      int v31 = 143;
      __int16 v32 = 2112;
      *(void *)uint64_t v33 = v15;
      *(_WORD *)&v33[8] = 2048;
      *(void *)&v33[10] = a1;
      *(_WORD *)&v33[18] = 1024;
      *(_DWORD *)&v33[20] = v7;
      __int16 v34 = 2112;
      id v35 = a3;
      __int16 v36 = 2112;
      id v37 = a4;
      uint64_t v18 = " [%s] %s:%d %@(%p) Dialog send confirmation for sessionID='%d', participantID='%@', transactionID='%@'";
      __int16 v19 = v22;
      uint32_t v20 = 74;
    }
    _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, buf, v20);
LABEL_13:
    +[VCControlChannelTransaction sendUnreliableMessage:v13 sessionID:v7 participantID:a3 transactionID:0 transactionDelegate:a6 withOptions:0];
    goto LABEL_14;
  }
  if (v14 == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCControlChannelDialogV1 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      __int16 v23 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      __int16 v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      __int16 v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v27 = v24;
        __int16 v28 = 2080;
        uint64_t v29 = "+[VCControlChannelDialogV1 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:]";
        __int16 v30 = 1024;
        int v31 = 142;
        __int16 v32 = 2112;
        *(void *)uint64_t v33 = v23;
        *(_WORD *)&v33[8] = 2048;
        *(void *)&v33[10] = a1;
        _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Can not send confirmation: messageData is nil", buf, 0x30u);
      }
    }
  }
LABEL_14:
}

+ (BOOL)processMessageFromParticipant:(id)a3 transactionID:(id)a4 messageType:(unsigned int)a5 sessionID:(unsigned int)a6 transactionDelegate:(id)a7
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (a3 && a5 == 2)
  {
    +[VCControlChannelDialogV1 sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:](VCControlChannelDialogV1, "sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:");
    if ((id)objc_opt_class() == a1)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        id v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v29 = 136316418;
          uint64_t v30 = v13;
          __int16 v31 = 2080;
          __int16 v32 = "+[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:sessionID:transactionDelegate:]";
          __int16 v33 = 1024;
          int v34 = 160;
          __int16 v35 = 1024;
          *(_DWORD *)__int16 v36 = a6;
          *(_WORD *)&v36[4] = 2112;
          *(void *)&v36[6] = a3;
          *(_WORD *)&v36[14] = 2112;
          *(void *)&v36[16] = a4;
          uint64_t v15 = " [%s] %s:%d +processMessage: Sent confirmation for _sessionID='%d', participantID='%@', transactionID='%@'";
          uint64_t v16 = v14;
          uint32_t v17 = 54;
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, (uint8_t *)&v29, v17);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        id v12 = (__CFString *)[a1 performSelector:sel_logPrefix];
      }
      else {
        id v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        __int16 v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v29 = 136316930;
          uint64_t v30 = v18;
          __int16 v31 = 2080;
          __int16 v32 = "+[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:sessionID:transactionDelegate:]";
          __int16 v33 = 1024;
          int v34 = 160;
          __int16 v35 = 2112;
          *(void *)__int16 v36 = v12;
          *(_WORD *)&v36[8] = 2048;
          *(void *)&v36[10] = a1;
          *(_WORD *)&v36[18] = 1024;
          *(_DWORD *)&v36[20] = a6;
          __int16 v37 = 2112;
          id v38 = a3;
          __int16 v39 = 2112;
          id v40 = a4;
          uint64_t v15 = " [%s] %s:%d %@(%p) +processMessage: Sent confirmation for _sessionID='%d', participantID='%@', transactionID='%@'";
          uint64_t v16 = v19;
          uint32_t v17 = 74;
          goto LABEL_13;
        }
      }
    }
  }
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      int v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 136315906;
        uint64_t v30 = v21;
        __int16 v31 = 2080;
        __int16 v32 = "+[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:sessionID:transactionDelegate:]";
        __int16 v33 = 1024;
        int v34 = 162;
        __int16 v35 = 1024;
        *(_DWORD *)__int16 v36 = a5 > 1;
        __int16 v23 = " [%s] %s:%d +processMessageFromParticipant: shouldNotifyClient='%d'";
        uint64_t v24 = v22;
        uint32_t v25 = 34;
LABEL_24:
        _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v29, v25);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint32_t v20 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      uint32_t v20 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      uint64_t v27 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v29 = 136316418;
        uint64_t v30 = v26;
        __int16 v31 = 2080;
        __int16 v32 = "+[VCControlChannelDialogV1 processMessageFromParticipant:transactionID:messageType:sessionID:transactionDelegate:]";
        __int16 v33 = 1024;
        int v34 = 162;
        __int16 v35 = 2112;
        *(void *)__int16 v36 = v20;
        *(_WORD *)&v36[8] = 2048;
        *(void *)&v36[10] = a1;
        *(_WORD *)&v36[18] = 1024;
        *(_DWORD *)&v36[20] = a5 > 1;
        __int16 v23 = " [%s] %s:%d %@(%p) +processMessageFromParticipant: shouldNotifyClient='%d'";
        uint64_t v24 = v27;
        uint32_t v25 = 54;
        goto LABEL_24;
      }
    }
  }
  return a5 > 1;
}

- (BOOL)decryptMessageWithMKI:(void *)a3 message:(id)a4 buffer:(char *)a5 size:(unsigned int)a6 sequenceNumber:(unsigned __int16)a7
{
  uint64_t v7 = a7;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_17;
    }
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    uint64_t v15 = *MEMORY[0x1E4F47A50];
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_17;
      }
      *(_DWORD *)__int16 v39 = 136316418;
      *(void *)&v39[4] = v14;
      *(_WORD *)&v39[12] = 2080;
      *(void *)&v39[14] = "-[VCControlChannelDialogV1 decryptMessageWithMKI:message:buffer:size:sequenceNumber:]";
      *(_WORD *)&v39[22] = 1024;
      LODWORD(v40) = 167;
      WORD2(v40) = 2112;
      *(void *)((char *)&v40 + 6) = a3;
      HIWORD(v40) = 2112;
      *(void *)uint64_t v41 = a4;
      *(_WORD *)&v41[8] = 1024;
      *(_DWORD *)&v41[10] = v7;
      uint32_t v17 = " [%s] %s:%d decryptMessageWithMKI='%@' message='%@', sequenceNumber='%d'";
      uint64_t v18 = v15;
      uint32_t v19 = 54;
LABEL_13:
      _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, v39, v19);
      goto LABEL_17;
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)__int16 v39 = 136316418;
      *(void *)&v39[4] = v14;
      *(_WORD *)&v39[12] = 2080;
      *(void *)&v39[14] = "-[VCControlChannelDialogV1 decryptMessageWithMKI:message:buffer:size:sequenceNumber:]";
      *(_WORD *)&v39[22] = 1024;
      LODWORD(v40) = 167;
      WORD2(v40) = 2112;
      *(void *)((char *)&v40 + 6) = a3;
      HIWORD(v40) = 2112;
      *(void *)uint64_t v41 = a4;
      *(_WORD *)&v41[8] = 1024;
      *(_DWORD *)&v41[10] = v7;
      __int16 v23 = " [%s] %s:%d decryptMessageWithMKI='%@' message='%@', sequenceNumber='%d'";
      uint64_t v24 = v15;
      uint32_t v25 = 54;
      goto LABEL_34;
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v13 = (__CFString *)[(VCControlChannelDialogV1 *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      int v22 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (!os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        *(_DWORD *)__int16 v39 = 136316930;
        *(void *)&v39[4] = v20;
        *(_WORD *)&v39[12] = 2080;
        *(void *)&v39[14] = "-[VCControlChannelDialogV1 decryptMessageWithMKI:message:buffer:size:sequenceNumber:]";
        *(_WORD *)&v39[22] = 1024;
        LODWORD(v40) = 167;
        WORD2(v40) = 2112;
        *(void *)((char *)&v40 + 6) = v13;
        HIWORD(v40) = 2048;
        *(void *)uint64_t v41 = self;
        *(_WORD *)&v41[8] = 2112;
        *(void *)&v41[10] = a3;
        *(_WORD *)&v41[18] = 2112;
        *(void *)&v41[20] = a4;
        *(_WORD *)&v41[28] = 1024;
        *(_DWORD *)&v41[30] = v7;
        uint32_t v17 = " [%s] %s:%d %@(%p) decryptMessageWithMKI='%@' message='%@', sequenceNumber='%d'";
        uint64_t v18 = v21;
        uint32_t v19 = 74;
        goto LABEL_13;
      }
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)__int16 v39 = 136316930;
        *(void *)&v39[4] = v20;
        *(_WORD *)&v39[12] = 2080;
        *(void *)&v39[14] = "-[VCControlChannelDialogV1 decryptMessageWithMKI:message:buffer:size:sequenceNumber:]";
        *(_WORD *)&v39[22] = 1024;
        LODWORD(v40) = 167;
        WORD2(v40) = 2112;
        *(void *)((char *)&v40 + 6) = v13;
        HIWORD(v40) = 2048;
        *(void *)uint64_t v41 = self;
        *(_WORD *)&v41[8] = 2112;
        *(void *)&v41[10] = a3;
        *(_WORD *)&v41[18] = 2112;
        *(void *)&v41[20] = a4;
        *(_WORD *)&v41[28] = 1024;
        *(_DWORD *)&v41[30] = v7;
        __int16 v23 = " [%s] %s:%d %@(%p) decryptMessageWithMKI='%@' message='%@', sequenceNumber='%d'";
        uint64_t v24 = v21;
        uint32_t v25 = 74;
LABEL_34:
        _os_log_debug_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEBUG, v23, v39, v25);
      }
    }
  }
LABEL_17:
  if (objc_msgSend(a4, "length", *(_OWORD *)v39, *(void *)&v39[16], v40, *(void *)v41, *(_OWORD *)&v41[8], *(_OWORD *)&v41[24]) > (unint64_t)a6)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return 0;
      }
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      uint64_t v30 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      int v31 = [a4 length];
      *(_DWORD *)__int16 v39 = 136316418;
      *(void *)&v39[4] = v29;
      *(_WORD *)&v39[12] = 2080;
      *(void *)&v39[14] = "-[VCControlChannelDialogV1 decryptMessageWithMKI:message:buffer:size:sequenceNumber:]";
      *(_WORD *)&v39[22] = 1024;
      LODWORD(v40) = 170;
      WORD2(v40) = 2112;
      *(void *)((char *)&v40 + 6) = a4;
      HIWORD(v40) = 1024;
      *(_DWORD *)uint64_t v41 = v31;
      *(_WORD *)&v41[4] = 1024;
      *(_DWORD *)&v41[6] = a6;
      __int16 v32 = " [%s] %s:%d decryptMessageWithMKI: message='%@' is too long (%d > %d)";
      __int16 v33 = v30;
      uint32_t v34 = 50;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v26 = (__CFString *)[(VCControlChannelDialogV1 *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v26 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        return 0;
      }
      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
      __int16 v36 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        return 0;
      }
      int v38 = [a4 length];
      *(_DWORD *)__int16 v39 = 136316930;
      *(void *)&v39[4] = v35;
      *(_WORD *)&v39[12] = 2080;
      *(void *)&v39[14] = "-[VCControlChannelDialogV1 decryptMessageWithMKI:message:buffer:size:sequenceNumber:]";
      *(_WORD *)&v39[22] = 1024;
      LODWORD(v40) = 170;
      WORD2(v40) = 2112;
      *(void *)((char *)&v40 + 6) = v26;
      HIWORD(v40) = 2048;
      *(void *)uint64_t v41 = self;
      *(_WORD *)&v41[8] = 2112;
      *(void *)&v41[10] = a4;
      *(_WORD *)&v41[18] = 1024;
      *(_DWORD *)&v41[20] = v38;
      *(_WORD *)&v41[24] = 1024;
      *(_DWORD *)&v41[26] = a6;
      __int16 v32 = " [%s] %s:%d %@(%p) decryptMessageWithMKI: message='%@' is too long (%d > %d)";
      __int16 v33 = v36;
      uint32_t v34 = 70;
    }
    _os_log_error_impl(&dword_1E1EA4000, v33, OS_LOG_TYPE_ERROR, v32, v39, v34);
    return 0;
  }
  [a4 getBytes:a5 length:a6];
  uint64_t v27 = (void *)MEMORY[0x1E4E56580](&self->super._weakTransactionDelegate);
  char v28 = objc_msgSend(v27, "decryptWithMKI:data:size:sequenceNumber:", a3, a5, objc_msgSend(a4, "length"), v7);
  if (v27) {
    CFRelease(v27);
  }
  return v28;
}

- (id)processEncryptedPayload:(id)a3 isData:(BOOL)a4 topic:(id *)a5 sequenceNumber:(id)a6 MKIData:(id)a7 participantID:(id)a8
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  *a5 = 0;
  if (!a7)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCControlChannelDialogV1 processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      int v22 = (__CFString *)[(VCControlChannelDialogV1 *)self performSelector:sel_logPrefix];
    }
    else {
      int v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 0;
    }
    uint64_t v24 = VRTraceErrorLogLevelToCSTR();
    uint32_t v25 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = v24;
    __int16 v31 = 2080;
    __int16 v32 = "-[VCControlChannelDialogV1 processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:]";
    __int16 v33 = 1024;
    int v34 = 184;
    __int16 v35 = 2112;
    __int16 v36 = v22;
    __int16 v37 = 2048;
    int v38 = self;
    __int16 v39 = 2112;
    id v40 = a8;
    uint64_t v26 = " [%s] %s:%d %@(%p) processEncryptedMessage: message received but MKI is not included in the packet from partic"
          "ipantID='%@'. Dropping message...";
    goto LABEL_36;
  }
  BOOL v13 = a4;
  memset(__b, 170, sizeof(__b));
  [a7 getBytes:__b length:2048];
  uint64_t v15 = [[VCMediaKeyIndex alloc] initWithBytes:__b bufferSize:16];
  LOBYTE(a6) = -[VCControlChannelDialogV1 decryptMessageWithMKI:message:buffer:size:sequenceNumber:](self, "decryptMessageWithMKI:message:buffer:size:sequenceNumber:", v15, a3, __b, 2048, [a6 unsignedShortValue]);

  if ((a6 & 1) == 0)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCControlChannelDialogV1 processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:]();
        }
      }
      return 0;
    }
    if (objc_opt_respondsToSelector()) {
      __int16 v23 = (__CFString *)[(VCControlChannelDialogV1 *)self performSelector:sel_logPrefix];
    }
    else {
      __int16 v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return 0;
    }
    uint64_t v27 = VRTraceErrorLogLevelToCSTR();
    uint32_t v25 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return 0;
    }
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = v27;
    __int16 v31 = 2080;
    __int16 v32 = "-[VCControlChannelDialogV1 processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:]";
    __int16 v33 = 1024;
    int v34 = 192;
    __int16 v35 = 2112;
    __int16 v36 = v23;
    __int16 v37 = 2048;
    int v38 = self;
    __int16 v39 = 2112;
    id v40 = a8;
    uint64_t v26 = " [%s] %s:%d %@(%p) processEncryptedMessage: message received from participantID='%@' but could not decrypt it."
          " Dropping message...";
LABEL_36:
    _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x3Au);
    return 0;
  }
  uint64_t v16 = [a3 length];
  if (v13)
  {
    if (v16) {
      uint32_t v17 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", __b, objc_msgSend(a3, "length"));
    }
    else {
      uint32_t v17 = 0;
    }
    uint32_t v19 = @"VCExternalClientDataTopic";
  }
  else
  {
    if (v16) {
      id v18 = (id)objc_msgSend([NSString alloc], "initWithBytes:length:encoding:", __b, objc_msgSend(a3, "length"), 4);
    }
    else {
      id v18 = 0;
    }
    *(void *)buf = 0;
    id v28 = 0;
    [(VCControlChannelDialogV1 *)self getTopic:buf message:&v28 fromPayload:v18];
    uint32_t v17 = (void *)[v28 dataUsingEncoding:4];
    uint64_t v20 = [*(id *)buf length];
    uint32_t v19 = *(__CFString **)buf;
    if (!v20) {
      uint32_t v19 = 0;
    }
  }
  *a5 = v19;
  return v17;
}

- (id)processMessageData:(id)a3 participantID:(id)a4 topic:(id *)a5 transactionID:(id *)a6 messageStatus:(unsigned int *)a7 isInternalMessage:(BOOL *)a8
{
  uint64_t v8 = self;
  uint64_t v128 = *MEMORY[0x1E4F143B8];
  unint64_t v114 = 0;
  if (!a5)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v71 = VRTraceErrorLogLevelToCSTR();
      v72 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v71;
      __int16 v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v118 = 1024;
      int v119 = 213;
      v73 = " [%s] %s:%d topic must not be nil";
      goto LABEL_109;
    }
    if (objc_opt_respondsToSelector()) {
      v66 = (__CFString *)[(VCControlChannelDialogV1 *)v8 performSelector:sel_logPrefix];
    }
    else {
      v66 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return 0;
    }
    uint64_t v79 = VRTraceErrorLogLevelToCSTR();
    v80 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = v79;
    __int16 v116 = 2080;
    v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    __int16 v118 = 1024;
    int v119 = 213;
    __int16 v120 = 2112;
    id v121 = v66;
    __int16 v122 = 2048;
    v123 = v8;
    v73 = " [%s] %s:%d %@(%p) topic must not be nil";
LABEL_126:
    v77 = v80;
    uint32_t v78 = 48;
    goto LABEL_127;
  }
  if (!a6)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v74 = VRTraceErrorLogLevelToCSTR();
      v72 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v74;
      __int16 v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v118 = 1024;
      int v119 = 214;
      v73 = " [%s] %s:%d transactionID must not be nil";
      goto LABEL_109;
    }
    if (objc_opt_respondsToSelector()) {
      v67 = (__CFString *)[(VCControlChannelDialogV1 *)v8 performSelector:sel_logPrefix];
    }
    else {
      v67 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return 0;
    }
    uint64_t v81 = VRTraceErrorLogLevelToCSTR();
    v80 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = v81;
    __int16 v116 = 2080;
    v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    __int16 v118 = 1024;
    int v119 = 214;
    __int16 v120 = 2112;
    id v121 = v67;
    __int16 v122 = 2048;
    v123 = v8;
    v73 = " [%s] %s:%d %@(%p) transactionID must not be nil";
    goto LABEL_126;
  }
  if (!a7)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v75 = VRTraceErrorLogLevelToCSTR();
      v72 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v75;
      __int16 v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v118 = 1024;
      int v119 = 215;
      v73 = " [%s] %s:%d messageStatus must not be nil";
      goto LABEL_109;
    }
    if (objc_opt_respondsToSelector()) {
      v68 = (__CFString *)[(VCControlChannelDialogV1 *)v8 performSelector:sel_logPrefix];
    }
    else {
      v68 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return 0;
    }
    uint64_t v82 = VRTraceErrorLogLevelToCSTR();
    v80 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136316162;
    *(void *)&uint8_t buf[4] = v82;
    __int16 v116 = 2080;
    v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    __int16 v118 = 1024;
    int v119 = 215;
    __int16 v120 = 2112;
    id v121 = v68;
    __int16 v122 = 2048;
    v123 = v8;
    v73 = " [%s] %s:%d %@(%p) messageStatus must not be nil";
    goto LABEL_126;
  }
  if (!a8)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        v69 = (__CFString *)[(VCControlChannelDialogV1 *)v8 performSelector:sel_logPrefix];
      }
      else {
        v69 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        return 0;
      }
      uint64_t v83 = VRTraceErrorLogLevelToCSTR();
      v80 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return 0;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v83;
      __int16 v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v118 = 1024;
      int v119 = 216;
      __int16 v120 = 2112;
      id v121 = v69;
      __int16 v122 = 2048;
      v123 = v8;
      v73 = " [%s] %s:%d %@(%p) isInternalMessage must not be nil";
      goto LABEL_126;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      return 0;
    }
    uint64_t v76 = VRTraceErrorLogLevelToCSTR();
    v72 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return 0;
    }
    *(_DWORD *)buf = 136315650;
    *(void *)&uint8_t buf[4] = v76;
    __int16 v116 = 2080;
    v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    __int16 v118 = 1024;
    int v119 = 216;
    v73 = " [%s] %s:%d isInternalMessage must not be nil";
LABEL_109:
    v77 = v72;
    uint32_t v78 = 28;
LABEL_127:
    _os_log_impl(&dword_1E1EA4000, v77, OS_LOG_TYPE_DEFAULT, v73, buf, v78);
    return 0;
  }
  if (objc_opt_respondsToSelector())
  {
    v113 = 0;
    v108 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = v8;
    id v16 = a4;
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v107 = v17;
    a4 = v16;
    uint64_t v8 = v15;
    uint32_t v19 = objc_msgSend(MEMORY[0x1E4F28DC0], "_strictlyUnarchivedObjectOfClasses:fromData:error:", objc_msgSend(v108, "setWithObjects:", v11, v12, v13, v14, v107, v18, objc_opt_class(), 0), a3, &v113);
    if (!v19)
    {
      if ((VCControlChannelDialogV1 *)objc_opt_class() == v15)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v61 = VRTraceErrorLogLevelToCSTR();
          v62 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:](v61, &v113, v62);
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v20 = (__CFString *)[(VCControlChannelDialogV1 *)v15 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v20 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v64 = VRTraceErrorLogLevelToCSTR();
          v65 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            *(void *)&uint8_t buf[4] = v64;
            __int16 v116 = 2080;
            v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
            __int16 v118 = 1024;
            int v119 = 224;
            __int16 v120 = 2112;
            id v121 = v20;
            __int16 v122 = 2048;
            v123 = v8;
            __int16 v124 = 2112;
            id v125 = v113;
            _os_log_error_impl(&dword_1E1EA4000, v65, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to unarchive message. error='%@'", buf, 0x3Au);
          }
        }
      }
    }
  }
  else
  {
    uint32_t v19 = (void *)[MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:a3 error:0];
  }
  uint64_t v21 = objc_msgSend((id)objc_msgSend(v19, "objectForKeyedSubscript:", @"Status"), "intValue");
  int v22 = (void *)[v19 objectForKeyedSubscript:@"TransactionID"];
  uint64_t v23 = [v19 objectForKeyedSubscript:@"EncryptedMessage"];
  uint64_t v24 = [v19 objectForKeyedSubscript:@"EncryptedData"];
  uint64_t v25 = [v19 objectForKeyedSubscript:@"Message"];
  uint64_t v26 = (void *)MEMORY[0x1E4E56580](&v8->super._weakTransactionDelegate);
  if (![v26 isEncryptionEnabled])
  {
    if (v25 || !v23)
    {
      *(void *)buf = 0;
      -[VCControlChannelDialogV1 getTopic:message:fromPayload:](v8, "getTopic:message:fromPayload:", &v114, buf, [(id)v25 VCCCString]);
      uint64_t v25 = [*(id *)buf VCCCData];
      goto LABEL_20;
    }
    if ((VCControlChannelDialogV1 *)objc_opt_class() != v8)
    {
      if (objc_opt_respondsToSelector()) {
        v70 = (__CFString *)[(VCControlChannelDialogV1 *)v8 performSelector:sel_logPrefix];
      }
      else {
        v70 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_158;
      }
      uint64_t v89 = VRTraceErrorLogLevelToCSTR();
      v90 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_158;
      }
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = v89;
      __int16 v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v118 = 1024;
      int v119 = 250;
      __int16 v120 = 2112;
      id v121 = v70;
      __int16 v122 = 2048;
      v123 = v8;
      __int16 v124 = 2112;
      id v125 = a4;
      v86 = " [%s] %s:%d %@(%p) messageReceived: message encryption is disabled locally via user defaults but remote part"
            "icipant '%@' sends encrypted messages. Dropping encrypted message. FIX ENCRYPTION INCONSYSTENCY!!!)";
LABEL_137:
      v87 = v90;
      uint32_t v88 = 58;
      goto LABEL_157;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_158;
    }
    uint64_t v84 = VRTraceErrorLogLevelToCSTR();
    v85 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_158;
    }
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = v84;
    __int16 v116 = 2080;
    v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    __int16 v118 = 1024;
    int v119 = 250;
    __int16 v120 = 2112;
    id v121 = a4;
    v86 = " [%s] %s:%d messageReceived: message encryption is disabled locally via user defaults but remote participant '"
          "%@' sends encrypted messages. Dropping encrypted message. FIX ENCRYPTION INCONSYSTENCY!!!)";
LABEL_132:
    v87 = v85;
    uint32_t v88 = 38;
LABEL_157:
    _os_log_impl(&dword_1E1EA4000, v87, OS_LOG_TYPE_DEFAULT, v86, buf, v88);
LABEL_158:
    uint64_t v25 = 0;
    goto LABEL_66;
  }
  if (v23)
  {
    uint64_t v25 = -[VCControlChannelDialogV1 processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:](v8, "processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:", v23, 0, &v114, v22, [v19 objectForKeyedSubscript:@"MKI"], a4);
    if (!(v25 | v114))
    {
      if ((VCControlChannelDialogV1 *)objc_opt_class() != v8)
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v27 = (__CFString *)[(VCControlChannelDialogV1 *)v8 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v27 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_158;
        }
        uint64_t v93 = VRTraceErrorLogLevelToCSTR();
        v94 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_158;
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v93;
        __int16 v116 = 2080;
        v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
        __int16 v118 = 1024;
        int v119 = 240;
        __int16 v120 = 2112;
        id v121 = v27;
        __int16 v122 = 2048;
        v123 = v8;
        v86 = " [%s] %s:%d %@(%p) Payload and topic may not be both nil";
        goto LABEL_156;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_158;
      }
      uint64_t v91 = VRTraceErrorLogLevelToCSTR();
      v92 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_158;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v91;
      __int16 v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v118 = 1024;
      int v119 = 240;
      v86 = " [%s] %s:%d Payload and topic may not be both nil";
LABEL_151:
      v87 = v92;
      uint32_t v88 = 28;
      goto LABEL_157;
    }
    goto LABEL_20;
  }
  if (v24)
  {
    uint64_t v25 = -[VCControlChannelDialogV1 processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:](v8, "processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:", v24, 1, &v114, v22, [v19 objectForKeyedSubscript:@"MKI"], a4);
    if (!(v25 | v114))
    {
      if ((VCControlChannelDialogV1 *)objc_opt_class() != v8)
      {
        if (objc_opt_respondsToSelector()) {
          __int16 v39 = (__CFString *)[(VCControlChannelDialogV1 *)v8 performSelector:sel_logPrefix];
        }
        else {
          __int16 v39 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_158;
        }
        uint64_t v97 = VRTraceErrorLogLevelToCSTR();
        v94 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_158;
        }
        *(_DWORD *)buf = 136316162;
        *(void *)&uint8_t buf[4] = v97;
        __int16 v116 = 2080;
        v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
        __int16 v118 = 1024;
        int v119 = 243;
        __int16 v120 = 2112;
        id v121 = v39;
        __int16 v122 = 2048;
        v123 = v8;
        v86 = " [%s] %s:%d %@(%p) Payload and topic may not be both nil";
LABEL_156:
        v87 = v94;
        uint32_t v88 = 48;
        goto LABEL_157;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_158;
      }
      uint64_t v96 = VRTraceErrorLogLevelToCSTR();
      v92 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_158;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v96;
      __int16 v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v118 = 1024;
      int v119 = 243;
      v86 = " [%s] %s:%d Payload and topic may not be both nil";
      goto LABEL_151;
    }
LABEL_20:
    uint64_t v28 = objc_opt_class();
    if (a4)
    {
      if ((VCControlChannelDialogV1 *)v28 == v8)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_35;
        }
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        __int16 v32 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_35;
        }
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = v31;
        __int16 v116 = 2080;
        v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
        __int16 v118 = 1024;
        int v119 = 260;
        __int16 v120 = 2112;
        id v121 = a4;
        __int16 v33 = " [%s] %s:%d messageReceived: found existing dialog for participantID='%@'";
        int v34 = v32;
        uint32_t v35 = 38;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v29 = (__CFString *)[(VCControlChannelDialogV1 *)v8 performSelector:sel_logPrefix];
        }
        else {
          uint64_t v29 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_35;
        }
        uint64_t v36 = VRTraceErrorLogLevelToCSTR();
        __int16 v37 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_35;
        }
        *(_DWORD *)buf = 136316418;
        *(void *)&uint8_t buf[4] = v36;
        __int16 v116 = 2080;
        v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
        __int16 v118 = 1024;
        int v119 = 260;
        __int16 v120 = 2112;
        id v121 = v29;
        __int16 v122 = 2048;
        v123 = v8;
        __int16 v124 = 2112;
        id v125 = a4;
        __int16 v33 = " [%s] %s:%d %@(%p) messageReceived: found existing dialog for participantID='%@'";
        int v34 = v37;
        uint32_t v35 = 58;
      }
      _os_log_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
LABEL_35:
      BOOL v38 = [(VCControlChannelDialogV1 *)v8 processMessageFromParticipant:a4 transactionID:v22 messageType:v21 transactionDelegate:v26];
      goto LABEL_50;
    }
    if ((VCControlChannelDialogV1 *)v28 == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_49;
      }
      uint64_t v40 = VRTraceErrorLogLevelToCSTR();
      uint64_t v41 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_49;
      }
      *(_DWORD *)buf = 136315650;
      *(void *)&uint8_t buf[4] = v40;
      __int16 v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v118 = 1024;
      int v119 = 263;
      uint64_t v42 = " [%s] %s:%d messageReceived: no participantID provided. Processing without dialog";
      unsigned int v43 = v41;
      uint32_t v44 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v30 = (__CFString *)[(VCControlChannelDialogV1 *)v8 performSelector:sel_logPrefix];
      }
      else {
        uint64_t v30 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_49;
      }
      uint64_t v45 = VRTraceErrorLogLevelToCSTR();
      uint32_t v46 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_49;
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v45;
      __int16 v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v118 = 1024;
      int v119 = 263;
      __int16 v120 = 2112;
      id v121 = v30;
      __int16 v122 = 2048;
      v123 = v8;
      uint64_t v42 = " [%s] %s:%d %@(%p) messageReceived: no participantID provided. Processing without dialog";
      unsigned int v43 = v46;
      uint32_t v44 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v43, OS_LOG_TYPE_DEFAULT, v42, buf, v44);
LABEL_49:
    BOOL v38 = +[VCControlChannelDialogV1 processMessageFromParticipant:0 transactionID:v22 messageType:v21 sessionID:v8->super._sessionID transactionDelegate:v26];
LABEL_50:
    BOOL v47 = v38;
    if ((VCControlChannelDialogV1 *)objc_opt_class() == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_65;
      }
      uint64_t v49 = VRTraceErrorLogLevelToCSTR();
      v50 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_65;
      }
      v51 = @"Will";
      unsigned int sessionID = v8->super._sessionID;
      if (v47) {
        v51 = @"Will not";
      }
      *(_DWORD *)buf = 136316162;
      *(void *)&uint8_t buf[4] = v49;
      __int16 v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v118 = 1024;
      int v119 = 267;
      __int16 v120 = 2112;
      id v121 = v51;
      __int16 v122 = 1024;
      LODWORD(v123) = sessionID;
      long long v53 = " [%s] %s:%d messageReceived: %@ notify client for sessionID '%d'";
      uint64_t v54 = v50;
      uint32_t v55 = 44;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v48 = (__CFString *)[(VCControlChannelDialogV1 *)v8 performSelector:sel_logPrefix];
      }
      else {
        v48 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_65;
      }
      uint64_t v56 = VRTraceErrorLogLevelToCSTR();
      v57 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_65;
      }
      v58 = @"Will";
      unsigned int v59 = v8->super._sessionID;
      if (v47) {
        v58 = @"Will not";
      }
      *(_DWORD *)buf = 136316674;
      *(void *)&uint8_t buf[4] = v56;
      __int16 v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v118 = 1024;
      int v119 = 267;
      __int16 v120 = 2112;
      id v121 = v48;
      __int16 v122 = 2048;
      v123 = v8;
      __int16 v124 = 2112;
      id v125 = v58;
      __int16 v126 = 1024;
      unsigned int v127 = v59;
      long long v53 = " [%s] %s:%d %@(%p) messageReceived: %@ notify client for sessionID '%d'";
      uint64_t v54 = v57;
      uint32_t v55 = 64;
    }
    _os_log_impl(&dword_1E1EA4000, v54, OS_LOG_TYPE_DEFAULT, v53, buf, v55);
LABEL_65:
    *a7 = v21;
    *a6 = v22;
    *a8 = v47;
    *a5 = (id)v114;
    goto LABEL_66;
  }
  if (!v25 && v21 != 1)
  {
    if ((VCControlChannelDialogV1 *)objc_opt_class() != v8)
    {
      if (objc_opt_respondsToSelector()) {
        v95 = (__CFString *)[(VCControlChannelDialogV1 *)v8 performSelector:sel_logPrefix];
      }
      else {
        v95 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_158;
      }
      uint64_t v106 = VRTraceErrorLogLevelToCSTR();
      v90 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_158;
      }
      *(_DWORD *)buf = 136316418;
      *(void *)&uint8_t buf[4] = v106;
      __int16 v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v118 = 1024;
      int v119 = 246;
      __int16 v120 = 2112;
      id v121 = v95;
      __int16 v122 = 2048;
      v123 = v8;
      __int16 v124 = 2112;
      id v125 = a4;
      v86 = " [%s] %s:%d %@(%p) processEncryptedMessage: message encryption is enabled but remote participant '%@' sends "
            "un-encrypted messages. Dropping un-encrypted message. FIX ENCRYPTION INCONSYSTENCY!!!)";
      goto LABEL_137;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_158;
    }
    uint64_t v103 = VRTraceErrorLogLevelToCSTR();
    v85 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_158;
    }
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = v103;
    __int16 v116 = 2080;
    v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    __int16 v118 = 1024;
    int v119 = 246;
    __int16 v120 = 2112;
    id v121 = a4;
    v86 = " [%s] %s:%d processEncryptedMessage: message encryption is enabled but remote participant '%@' sends un-encryp"
          "ted messages. Dropping un-encrypted message. FIX ENCRYPTION INCONSYSTENCY!!!)";
    goto LABEL_132;
  }
  if (v21 == 1) {
    goto LABEL_20;
  }
  if ((VCControlChannelDialogV1 *)objc_opt_class() != v8)
  {
    if (objc_opt_respondsToSelector()) {
      v63 = (__CFString *)[(VCControlChannelDialogV1 *)v8 performSelector:sel_logPrefix];
    }
    else {
      v63 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
      goto LABEL_66;
    }
    uint64_t v104 = VRTraceErrorLogLevelToCSTR();
    v105 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_66;
    }
    *(_DWORD *)buf = 136316418;
    *(void *)&uint8_t buf[4] = v104;
    __int16 v116 = 2080;
    v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
    __int16 v118 = 1024;
    int v119 = 247;
    __int16 v120 = 2112;
    id v121 = v63;
    __int16 v122 = 2048;
    v123 = v8;
    __int16 v124 = 2112;
    id v125 = a4;
    v100 = " [%s] %s:%d %@(%p) processEncryptedMessage: message encryption is enabled but message payload is empty for participant '%@'";
    v101 = v105;
    uint32_t v102 = 58;
    goto LABEL_169;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v98 = VRTraceErrorLogLevelToCSTR();
    v99 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = v98;
      __int16 v116 = 2080;
      v117 = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isInternalMessage:]";
      __int16 v118 = 1024;
      int v119 = 247;
      __int16 v120 = 2112;
      id v121 = a4;
      v100 = " [%s] %s:%d processEncryptedMessage: message encryption is enabled but message payload is empty for participant '%@'";
      v101 = v99;
      uint32_t v102 = 38;
LABEL_169:
      _os_log_impl(&dword_1E1EA4000, v101, OS_LOG_TYPE_DEFAULT, v100, buf, v102);
    }
  }
LABEL_66:
  if (v26) {
    CFRelease(v26);
  }
  return (id)v25;
}

- (void)getTopic:(id *)a3 message:(id *)a4 fromPayload:(id)a5
{
  id v5 = a5;
  uint64_t v8 = [a5 rangeOfString:@":"];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v9 = v8;
    *a3 = (id)[v5 substringToIndex:v8];
    id v5 = (id)[v5 substringFromIndex:v9 + 1];
    if (![v5 length]) {
      id v5 = 0;
    }
  }
  *a4 = v5;
}

- (void)newDataFromMessage:topic:transactionID:isReliable:transactionDelegate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d newDataFromMessage: encryption failed. Dropping the message...", v2, v3, v4, v5, v6);
}

+ (void)newEncryptedMessageFromMessage:sequenceNumber:transactionDelegate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d newEncryptedMessageFromMessage: encryption failed. Dropping the message...", v2, v3, v4, v5, v6);
}

+ (void)sendConfirmationToParticipantID:transactionID:sessionID:transactionDelegate:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Can not send confirmation: messageData is nil", v2, v3, v4, v5, v6);
}

- (void)processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d processEncryptedMessage: message received but MKI is not included in the packet from participantID='%@'. Dropping message...");
}

- (void)processEncryptedPayload:isData:topic:sequenceNumber:MKIData:participantID:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d processEncryptedMessage: message received from participantID='%@' but could not decrypt it. Dropping message...");
}

- (void)processMessageData:(NSObject *)a3 participantID:topic:transactionID:messageStatus:isInternalMessage:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[VCControlChannelDialogV1 processMessageData:participantID:topic:transactionID:messageStatus:isI"
                       "nternalMessage:]";
  *(_WORD *)&v3[22] = 1024;
  LODWORD(v4) = 224;
  WORD2(v4) = 2112;
  *(void *)((char *)&v4 + 6) = *a2;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, (uint64_t)a2, a3, " [%s] %s:%d Failed to unarchive message. error='%@'", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], v4, *MEMORY[0x1E4F143B8]);
}

@end