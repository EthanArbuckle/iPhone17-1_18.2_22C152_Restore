@interface VCControlChannelMultiWay
+ (id)allocPayoadDataFromVTPPacket:(VCBlockBuffer_t *)a3 vpktFlags:(tagVPKTFLAG *)a4 channelDataFormat:(tagVCIDSChannelDataFormat *)a5;
- (BOOL)addActiveParticipant:(unint64_t)a3 participantUUID:(id)a4 withConfiguration:(id *)a5;
- (BOOL)decryptWithMKI:(void *)a3 data:(char *)a4 size:(int)a5 sequenceNumber:(unsigned __int16)a6;
- (BOOL)encryptData:(char *)a3 size:(int)a4 sequenceNumber:(unsigned __int16)a5;
- (BOOL)isEncryptionEnabled;
- (BOOL)isParticipantActive:(unint64_t)a3;
- (BOOL)isRunning;
- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 timeout:(unsigned int)a6 completion:(id)a7;
- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 timeout:(unsigned int)a6 withOptions:(id)a7 completion:(id)a8;
- (BOOL)sendReliableMessageAndWait:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5;
- (BOOL)sendReliableMessageAndWait:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 timeout:(id)a6 withOptions:(id)a7;
- (NSMutableDictionary)dialogs;
- (VCControlChannelMultiWay)initWithTransportSessionID:(unsigned int)a3 reportingAgent:(opaqueRTCReporting *)a4;
- (VCControlChannelMultiWay)initWithTransportSessionID:(unsigned int)a3 reportingAgent:(opaqueRTCReporting *)a4 mode:(int)a5;
- (id)copyDialogForParticipantID:(id)a3;
- (id)lastUsedMKIBytes;
- (id)remoteParticipantIDFromChannelDataFormat:(tagVCIDSChannelDataFormat *)a3;
- (int)getKeyDerivationCryptoSet:(id *)a3 withKeyMaterial:(id)a4 derivedSSRC:(unsigned int *)a5;
- (int)protocolVersionforParticipantID:(id)a3;
- (int)updateEncryption:(id *)a3 derivedSSRC:(unsigned int)a4;
- (int)vfdCancel;
- (int)vfdMessage;
- (unint64_t)nextTransactionID;
- (unsigned)transportSessionID;
- (void)addNewKeyMaterial:(id)a3;
- (void)addToReceivedStats:(int)a3;
- (void)addToSentStats:(int)a3;
- (void)dealloc;
- (void)deregisterPeriodicTask;
- (void)finalizeEncryption;
- (void)flushActiveMessages;
- (void)flushRealTimeReportingStats;
- (void)flushReportingStats;
- (void)initializeEncryption;
- (void)initializeSRTPInfo:(tagSRTPINFO *)a3;
- (void)lastUsedMKIBytes;
- (void)messageReceived:(id)a3 participantInfo:(tagVCIDSChannelDataFormat *)a4;
- (void)periodicTask:(void *)a3;
- (void)processParticipantRemoval:(id)a3;
- (void)registerPeriodicTask;
- (void)removeActiveParticipant:(unint64_t)a3;
- (void)removeAllActiveParticipants;
- (void)reportSignificantHandshakeDelaySymptomForParticipantID:(id)a3;
- (void)scheduleAfter:(unsigned int)a3 block:(id)a4;
- (void)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5;
- (void)sendUnreliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5;
- (void)setCurrentSendMKIWithKeyMaterial:(id)a3;
- (void)setEncryptionWithEncryptionMaterial:(id *)a3;
- (void)setTransportSessionID:(unsigned int)a3;
- (void)setVfdCancel:(int)a3;
- (void)setVfdMessage:(int)a3;
- (void)start;
- (void)stop;
- (void)updateEncryptionWithEncryptionMaterial:(id *)a3;
- (void)updateEncryptionWithKeyMaterial:(id)a3;
- (void)updateTransactionIDWithKeyMaterial:(id)a3;
@end

@implementation VCControlChannelMultiWay

- (void)initializeEncryption
{
  self->_isEncryptionEnabled = ![+[VCDefaults sharedInstance] forceDisableMessageEncryption];
  self->_cryptors = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
}

- (void)finalizeEncryption
{
  VCMediaKeyIndex_Release((const void **)&self->_currentSendMKI);
  VCMediaKeyIndex_Release((const void **)&self->_currentReceiveMKI);
  cryptors = self->_cryptors;
}

- (void)initializeSRTPInfo:(tagSRTPINFO *)a3
{
  *(_OWORD *)&a3->policy.cipherMode = xmmword_1E259DB60;
  *(void *)&a3->policy.authenticationMode = 1;
  a3->policy.sessionAuthenticationTagLength = 4;
  a3->operatingMode = 2;
  *(void *)&a3->mediaKeyLength = 0x1000000010;
}

- (void)updateEncryptionWithEncryptionMaterial:(id *)a3
{
  v14[1] = *(const void **)MEMORY[0x1E4F143B8];
  int var5 = a3->var5;
  if (a3->var4 >= 32) {
    int var4 = 32;
  }
  else {
    int var4 = a3->var4;
  }
  v14[0] = 0;
  if (var5 >= 32) {
    int v7 = 32;
  }
  else {
    int v7 = var5;
  }
  long long v13 = 0u;
  memset(v12, 0, sizeof(v12));
  DWORD1(v12[4]) = ByteToHex((unint64_t)v12, 65, (unsigned __int8 *)a3, var4);
  HIDWORD(v13) = ByteToHex((unint64_t)&v12[4] + 8, 65, (unsigned __int8 *)a3->var0.var1, 14);
  v11[0] = 0xAAAAAAAAAAAAAAAALL;
  v11[1] = 0xAAAAAAAAAAAAAAAALL;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "getUUIDBytes:", v11);
  VCMediaKeyIndex_ReleaseAndCopyNewValue(v14, +[VCMediaKeyIndex newMKIWithBytes:v11 bufferSize:16]);
  if ([(VCControlChannelMultiWay *)self updateEncryption:v12 derivedSSRC:a3->var1] < 0)
  {
    SRTPClearKeyDerivationInfo((uint64_t)v12);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCControlChannelMultiWay(Encryption) updateEncryptionWithEncryptionMaterial:]();
      }
    }
  }
  else
  {
    if ([(NSMutableDictionary *)self->_cryptors objectForKeyedSubscript:v14[0]])
    {
      VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)&self->_currentSendMKI, (void *)v14[0]);
    }
    else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCControlChannelMultiWay(Encryption) updateEncryptionWithEncryptionMaterial:].cold.4();
      }
    }
    VCMediaKeyIndex_Release(v14);
    v10 = 0;
    long long v9 = 0u;
    memset(v8, 0, sizeof(v8));
    DWORD1(v8[4]) = ByteToHex((unint64_t)v8, 65, (unsigned __int8 *)&a3->var2, v7);
    HIDWORD(v9) = ByteToHex((unint64_t)&v8[4] + 8, 65, (unsigned __int8 *)a3->var2.var1, 14);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F29128], "UUID"), "getUUIDBytes:", v11);
    VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)&v10, +[VCMediaKeyIndex newMKIWithBytes:v11 bufferSize:16]);
    if ([(VCControlChannelMultiWay *)self updateEncryption:v8 derivedSSRC:a3->var3] < 0)
    {
      SRTPClearKeyDerivationInfo((uint64_t)v12);
      SRTPClearKeyDerivationInfo((uint64_t)v8);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCControlChannelMultiWay(Encryption) updateEncryptionWithEncryptionMaterial:]();
        }
      }
    }
    else
    {
      if ([(NSMutableDictionary *)self->_cryptors objectForKeyedSubscript:v10])
      {
        VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)&self->_currentReceiveMKI, v10);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCControlChannelMultiWay(Encryption) updateEncryptionWithEncryptionMaterial:]();
        }
      }
      SRTPClearKeyDerivationInfo((uint64_t)v12);
      SRTPClearKeyDerivationInfo((uint64_t)v8);
    }
  }
}

- (void)updateEncryptionWithKeyMaterial:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a3 objectForKeyedSubscript:@"SecurityKeyIndex"];
  if ([(NSMutableDictionary *)self->_cryptors objectForKeyedSubscript:v5])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      int v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[VCControlChannelMultiWay(Encryption) updateEncryptionWithKeyMaterial:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 146;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v5;
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MKI '%@' has already been configured for this session. Ignoring duplicate", buf, 0x26u);
      }
    }
  }
  else
  {
    uint64_t v18 = 0;
    long long v17 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v12 = 0u;
    memset(buf, 0, sizeof(buf));
    unsigned int v10 = 0;
    if ([(VCControlChannelMultiWay *)self getKeyDerivationCryptoSet:buf withKeyMaterial:a3 derivedSSRC:&v10] < 0)
    {
      SRTPClearKeyDerivationInfo((uint64_t)buf);
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCControlChannelMultiWay(Encryption) updateEncryptionWithKeyMaterial:]();
        }
      }
    }
    else
    {
      int v8 = [(VCControlChannelMultiWay *)self updateEncryption:buf derivedSSRC:v10];
      double v9 = SRTPClearKeyDerivationInfo((uint64_t)buf);
      if (v8 < 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCControlChannelMultiWay(Encryption) updateEncryptionWithKeyMaterial:]();
          }
        }
      }
      else if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"SecurityLocallyGenerated", v9), "BOOLValue"))
      {
        [(VCControlChannelMultiWay *)self setCurrentSendMKIWithKeyMaterial:a3];
      }
    }
  }
}

- (void)setCurrentSendMKIWithKeyMaterial:(id)a3
{
  uint64_t v4 = [a3 objectForKeyedSubscript:@"SecurityKeyIndex"];
  if (v4)
  {
    uint64_t v5 = (void *)v4;
    if (!VCMediaKeyIndex_isEqual((uint64_t)self->_currentSendMKI, v4))
    {
      if ([(NSMutableDictionary *)self->_cryptors objectForKeyedSubscript:v5])
      {
        VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)&self->_currentSendMKI, v5);
      }
      else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCControlChannelMultiWay(Encryption) setCurrentSendMKIWithKeyMaterial:]();
        }
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCControlChannelMultiWay(Encryption) setCurrentSendMKIWithKeyMaterial:]();
    }
  }
}

- (int)getKeyDerivationCryptoSet:(id *)a3 withKeyMaterial:(id)a4 derivedSSRC:(unsigned int *)a5
{
  v22[2] = *MEMORY[0x1E4F143B8];
  int v5 = -2145255423;
  if (a3)
  {
    double v9 = (void *)[a4 objectForKeyedSubscript:@"SecurityKey"];
    uint64_t v10 = [a4 objectForKeyedSubscript:@"SecuritySalt"];
    if (v9 && v10 != 0)
    {
      long long v12 = (void *)v10;
      long long v13 = (void *)[a4 objectForKeyedSubscript:@"SecurityKeyIndex"];
      v22[0] = 0xAAAAAAAAAAAAAAAALL;
      v22[1] = 0xAAAAAAAAAAAAAAAALL;
      [v13 fullKeyBytes:v22];
      *a5 = v22[0];
      unint64_t v14 = [v9 length];
      size_t v15 = 32;
      if (v14 >= 0x20) {
        size_t v16 = 32;
      }
      else {
        size_t v16 = v14;
      }
      unint64_t v17 = [v12 length];
      if (v17 < 0x20) {
        size_t v15 = v17;
      }
      uint64_t v18 = ((_BYTE)v16 + 15) & 0x70;
      uint64_t v19 = (unsigned __int8 *)&v22[-1] - v18;
      if (v16) {
        memset((char *)&v22[-1] - v18, 170, v16);
      }
      if (v15) {
        memset((char *)&v22[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), 170, v15);
      }
      [v9 getBytes:v19 length:v16];
      [v12 getBytes:(char *)&v22[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0) length:v15];
      a3->var1 = ByteToHex((unint64_t)a3, 65, v19, v16);
      a3->var3 = ByteToHex((unint64_t)a3->var2, 65, (unsigned __int8 *)&v22[-1] - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0), v15);
      VCMediaKeyIndex_ReleaseAndCopyNewValue((const void **)&a3->var4, v13);
      return 0;
    }
  }
  return v5;
}

- (int)updateEncryption:(id *)a3 derivedSSRC:(unsigned int)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  p_int var4 = &a3->var4;
  if ([(NSMutableDictionary *)self->_cryptors objectForKeyedSubscript:a3->var4])
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v18 = VRTraceErrorLogLevelToCSTR();
      uint64_t v19 = *MEMORY[0x1E4F47A50];
      int v9 = 0;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return v9;
      }
      v20 = *p_var4;
      *(_DWORD *)buf = 136315906;
      uint64_t v46 = v18;
      __int16 v47 = 2080;
      v48 = "-[VCControlChannelMultiWay(Encryption) updateEncryption:derivedSSRC:]";
      __int16 v49 = 1024;
      int v50 = 234;
      __int16 v51 = 2112;
      v52 = v20;
      _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d MKI=%@ has already been configured. Ignoring duplicate", buf, 0x26u);
    }
    return 0;
  }
  v44 = 0;
  memset(v43, 0, sizeof(v43));
  memset(v21, 0, sizeof(v21));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v42 = 0;
  [(VCControlChannelMultiWay *)self initializeSRTPInfo:v21];
  DWORD2(v22) = a4;
  SRTPDeriveMediaKeyInfo((uint64_t)v21, (unint64_t)v43, (uint64_t)a3);
  if (v8)
  {
    int v9 = v8;
    SRTPClearExchangeInfo((uint64_t)v43);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCControlChannelMultiWay(Encryption) updateEncryption:derivedSSRC:](v10);
      }
    }
    return v9;
  }
  int v9 = SRTPUpdateEncryptionInfo((uint64_t)v21, (uint64_t)v43, 1);
  VCMediaKeyIndex_Release(&v44);
  if (v9)
  {
    SRTPClearExchangeInfo((uint64_t)v43);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCControlChannelMultiWay(Encryption) updateEncryption:derivedSSRC:](v11);
      }
    }
    return v9;
  }
  LODWORD(v21[0]) |= 6u;
  long long v12 = [[VCCryptoInfo alloc] initWithSRTPInfo:v21];
  if (v12)
  {
    long long v13 = v12;
    [(NSMutableDictionary *)self->_cryptors setObject:v12 forKeyedSubscript:*p_var4];

    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      size_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        size_t v16 = *p_var4;
        *(_DWORD *)buf = 136315906;
        uint64_t v46 = v14;
        __int16 v47 = 2080;
        v48 = "-[VCControlChannelMultiWay(Encryption) updateEncryption:derivedSSRC:]";
        __int16 v49 = 1024;
        int v50 = 264;
        __int16 v51 = 2112;
        v52 = v16;
        _os_log_impl(&dword_1E1EA4000, v15, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Cryptor for keyIndex:%@ is updated", buf, 0x26u);
      }
    }
    SRTPClearExchangeInfo((uint64_t)v43);
    return 0;
  }
  int v9 = -2145255420;
  SRTPClearExchangeInfo((uint64_t)v43);
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCControlChannelMultiWay(Encryption) updateEncryption:derivedSSRC:]();
    }
  }
  return v9;
}

- (BOOL)encryptData:(char *)a3 size:(int)a4 sequenceNumber:(unsigned __int16)a5
{
  int v5 = a5;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  p_currentSendMKI = &self->_currentSendMKI;
  int v7 = (void *)[(NSMutableDictionary *)self->_cryptors objectForKeyedSubscript:self->_currentSendMKI];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    int v9 = *MEMORY[0x1E4F47A50];
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *p_currentSendMKI;
        int v15 = 136316162;
        uint64_t v16 = v8;
        __int16 v17 = 2080;
        uint64_t v18 = "-[VCControlChannelMultiWay(Encryption) encryptData:size:sequenceNumber:]";
        __int16 v19 = 1024;
        int v20 = 278;
        __int16 v21 = 2112;
        long long v22 = v11;
        __int16 v23 = 1024;
        int v24 = v5;
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d encryptData: with currentSendMKI='%@', sequenceNumber=%d", (uint8_t *)&v15, 0x2Cu);
        if (!v7) {
          goto LABEL_10;
        }
LABEL_8:
        LOBYTE(v12) = SRTPEncryptData([v7 state]) == 0;
        return v12;
      }
    }
    else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      long long v13 = *p_currentSendMKI;
      int v15 = 136316162;
      uint64_t v16 = v8;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCControlChannelMultiWay(Encryption) encryptData:size:sequenceNumber:]";
      __int16 v19 = 1024;
      int v20 = 278;
      __int16 v21 = 2112;
      long long v22 = v13;
      __int16 v23 = 1024;
      int v24 = v5;
      _os_log_debug_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEBUG, " [%s] %s:%d encryptData: with currentSendMKI='%@', sequenceNumber=%d", (uint8_t *)&v15, 0x2Cu);
      if (v7) {
        goto LABEL_8;
      }
      goto LABEL_10;
    }
  }
  if (v7) {
    goto LABEL_8;
  }
LABEL_10:
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
  {
LABEL_13:
    LOBYTE(v12) = 0;
    return v12;
  }
  VRTraceErrorLogLevelToCSTR();
  BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v12)
  {
    -[VCControlChannelMultiWay(Encryption) encryptData:size:sequenceNumber:]();
    goto LABEL_13;
  }
  return v12;
}

- (BOOL)decryptWithMKI:(void *)a3 data:(char *)a4 size:(int)a5 sequenceNumber:(unsigned __int16)a6
{
  int v6 = a6;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (void *)-[NSMutableDictionary objectForKeyedSubscript:](self->_cryptors, "objectForKeyedSubscript:");
  if (!v8) {
    uint64_t v8 = (void *)[(NSMutableDictionary *)self->_cryptors objectForKeyedSubscript:self->_currentReceiveMKI];
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    uint64_t v10 = *MEMORY[0x1E4F47A50];
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        currentReceiveMKI = self->_currentReceiveMKI;
        int v16 = 136316162;
        uint64_t v17 = v9;
        __int16 v18 = 2080;
        __int16 v19 = "-[VCControlChannelMultiWay(Encryption) decryptWithMKI:data:size:sequenceNumber:]";
        __int16 v20 = 1024;
        int v21 = 293;
        __int16 v22 = 2112;
        __int16 v23 = currentReceiveMKI;
        __int16 v24 = 1024;
        int v25 = v6;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d decryptWithMKI: currentReceiveMKI='%@', sequenceNumber=%d", (uint8_t *)&v16, 0x2Cu);
        if (!v8) {
          goto LABEL_12;
        }
LABEL_10:
        LOBYTE(v13) = SRTPEncryptData([v8 state]) == 0;
        return v13;
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = self->_currentReceiveMKI;
      int v16 = 136316162;
      uint64_t v17 = v9;
      __int16 v18 = 2080;
      __int16 v19 = "-[VCControlChannelMultiWay(Encryption) decryptWithMKI:data:size:sequenceNumber:]";
      __int16 v20 = 1024;
      int v21 = 293;
      __int16 v22 = 2112;
      __int16 v23 = v14;
      __int16 v24 = 1024;
      int v25 = v6;
      _os_log_debug_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEBUG, " [%s] %s:%d decryptWithMKI: currentReceiveMKI='%@', sequenceNumber=%d", (uint8_t *)&v16, 0x2Cu);
      if (v8) {
        goto LABEL_10;
      }
      goto LABEL_12;
    }
  }
  if (v8) {
    goto LABEL_10;
  }
LABEL_12:
  if ((int)VRTraceGetErrorLogLevelForModule() < 3)
  {
LABEL_15:
    LOBYTE(v13) = 0;
    return v13;
  }
  VRTraceErrorLogLevelToCSTR();
  BOOL v13 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
  if (v13)
  {
    -[VCControlChannelMultiWay(Encryption) decryptWithMKI:data:size:sequenceNumber:]();
    goto LABEL_15;
  }
  return v13;
}

- (VCControlChannelMultiWay)initWithTransportSessionID:(unsigned int)a3 reportingAgent:(opaqueRTCReporting *)a4 mode:(int)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  +[VCVTPWrapper startVTP];
  int v9 = VTP_SocketForIDS();
  if (v9 != -1)
  {
    int v10 = v9;
    v28.receiver = self;
    v28.super_class = (Class)VCControlChannelMultiWay;
    uint64_t v11 = [(VCControlChannel *)&v28 init];
    if (!v11) {
      goto LABEL_21;
    }
    v11->_activeParticipants = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:32];
    v11->_unsigned int transportSessionID = a3;
    v11->_vfdMessage = v10;
    v11->_dialogs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    VTP_SetSocketMode(v11->_vfdMessage, 2);
    VTP_SetPktType(v11->_vfdMessage, 0x10000);
    VTP_SetTransportSessionID(v11->_vfdMessage, v11->_transportSessionID);
    v11->super.super._reportingAgent = a4;
    [(VCControlChannelMultiWay *)v11 flushReportingStats];
    [(VCControlChannelMultiWay *)v11 registerPeriodicTask];
    if ((VCControlChannelMultiWay *)objc_opt_class() == v11)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_20;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      int v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      unsigned int transportSessionID = v11->_transportSessionID;
      *(_DWORD *)buf = 136315906;
      uint64_t v30 = v14;
      __int16 v31 = 2080;
      long long v32 = "-[VCControlChannelMultiWay initWithTransportSessionID:reportingAgent:mode:]";
      __int16 v33 = 1024;
      int v34 = 207;
      __int16 v35 = 1024;
      LODWORD(v36) = transportSessionID;
      uint64_t v17 = " [%s] %s:%d Created VCControlChannelMultiWay object for sessionID '%d'";
      __int16 v18 = v15;
      uint32_t v19 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v12 = (__CFString *)[(VCControlChannelMultiWay *)v11 performSelector:sel_logPrefix];
      }
      else {
        BOOL v12 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_20;
      }
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      int v21 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      unsigned int v22 = v11->_transportSessionID;
      *(_DWORD *)buf = 136316418;
      uint64_t v30 = v20;
      __int16 v31 = 2080;
      long long v32 = "-[VCControlChannelMultiWay initWithTransportSessionID:reportingAgent:mode:]";
      __int16 v33 = 1024;
      int v34 = 207;
      __int16 v35 = 2112;
      long long v36 = v12;
      __int16 v37 = 2048;
      long long v38 = v11;
      __int16 v39 = 1024;
      int v40 = v22;
      uint64_t v17 = " [%s] %s:%d %@(%p) Created VCControlChannelMultiWay object for sessionID '%d'";
      __int16 v18 = v21;
      uint32_t v19 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
LABEL_20:
    CustomRootQueue = VCDispatchQueue_GetCustomRootQueue(37);
    v11->_sequentialKeyMaterialQueue = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("com.apple.AVConference.VCControlChannelMultiWay.sequentialKeyMaterialQueue", 0, CustomRootQueue);
LABEL_21:
    if (!a5) {
      [(VCControlChannelMultiWay *)v11 initializeEncryption];
    }
    return v11;
  }
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCControlChannelMultiWay initWithTransportSessionID:reportingAgent:mode:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      BOOL v13 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
    }
    else {
      BOOL v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      int v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        unsigned int v27 = self->_transportSessionID;
        *(_DWORD *)buf = 136316674;
        uint64_t v30 = v24;
        __int16 v31 = 2080;
        long long v32 = "-[VCControlChannelMultiWay initWithTransportSessionID:reportingAgent:mode:]";
        __int16 v33 = 1024;
        int v34 = 188;
        __int16 v35 = 2112;
        long long v36 = v13;
        __int16 v37 = 2048;
        long long v38 = self;
        __int16 v39 = 1024;
        int v40 = -1;
        __int16 v41 = 1024;
        unsigned int v42 = v27;
        _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Could not create VTP socket for MW control channel (%08X) for sessionID '%d'", buf, 0x3Cu);
      }
    }
  }
  +[VCVTPWrapper stopVTP];
  return 0;
}

- (VCControlChannelMultiWay)initWithTransportSessionID:(unsigned int)a3 reportingAgent:(opaqueRTCReporting *)a4
{
  return [(VCControlChannelMultiWay *)self initWithTransportSessionID:*(void *)&a3 reportingAgent:a4 mode:0];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCControlChannelMultiWay object has been dealloced while its thread is still running. [VCControlChannelMultiWay stop] should have been invoked for sessionID='%d'!", v2, v3, v4, v5);
}

- (void)start
{
  v3[5] = *MEMORY[0x1E4F143B8];
  sequentialKeyMaterialQueue = self->_sequentialKeyMaterialQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__VCControlChannelMultiWay_start__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_async(sequentialKeyMaterialQueue, v3);
}

void __33__VCControlChannelMultiWay_start__block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 268))
  {
    if ((id)objc_opt_class() == *v2)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v7 = VRTraceErrorLogLevelToCSTR();
        uint64_t v8 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v9 = *((_DWORD *)*v2 + 64);
          LODWORD(v45.__sig) = 136315906;
          *(uint64_t *)((char *)&v45.__sig + 4) = v7;
          *(_WORD *)&v45.__opaque[4] = 2080;
          *(void *)&v45.__opaque[6] = "-[VCControlChannelMultiWay start]_block_invoke";
          *(_WORD *)&v45.__opaque[14] = 1024;
          *(_DWORD *)&v45.__opaque[16] = 267;
          *(_WORD *)&v45.__opaque[20] = 1024;
          *(_DWORD *)&v45.__opaque[22] = v9;
          int v10 = " [%s] %s:%d MW control channel already stopped for sessionID='%d'";
          uint64_t v11 = v8;
          uint32_t v12 = 34;
LABEL_16:
          _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v45, v12);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v3 = (__CFString *)[*v2 performSelector:sel_logPrefix];
      }
      else {
        v3 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        uint64_t v14 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          id v15 = *v2;
          int v16 = *((_DWORD *)*v2 + 64);
          LODWORD(v45.__sig) = 136316418;
          *(uint64_t *)((char *)&v45.__sig + 4) = v13;
          *(_WORD *)&v45.__opaque[4] = 2080;
          *(void *)&v45.__opaque[6] = "-[VCControlChannelMultiWay start]_block_invoke";
          *(_WORD *)&v45.__opaque[14] = 1024;
          *(_DWORD *)&v45.__opaque[16] = 267;
          *(_WORD *)&v45.__opaque[20] = 2112;
          *(void *)&v45.__opaque[22] = v3;
          *(_WORD *)&v45.__opaque[30] = 2048;
          *(void *)&v45.__opaque[32] = v15;
          *(_WORD *)&v45.__opaque[40] = 1024;
          *(_DWORD *)&v45.__opaque[42] = v16;
          int v10 = " [%s] %s:%d %@(%p) MW control channel already stopped for sessionID='%d'";
          uint64_t v11 = v14;
          uint32_t v12 = 54;
          goto LABEL_16;
        }
      }
    }
  }
  else
  {
    *(unsigned char *)(v1 + 268) = 1;
    *((_DWORD *)*v2 + 66) = VTP_Socket(2, 1, 6);
    int v4 = (void *)[MEMORY[0x1E4F47A30] weakObjectHolderWithObject:*v2];
    *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
    *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v45.__opaque[24] = v5;
    *(_OWORD *)&v45.__opaque[40] = v5;
    *(_OWORD *)&v45.__sig = v5;
    *(_OWORD *)&v45.__opaque[8] = v5;
    sched_param v32 = (sched_param)0xAAAAAAAAAAAAAAAALL;
    pthread_attr_init(&v45);
    pthread_attr_getschedparam(&v45, &v32);
    v32.sched_priority = 58;
    pthread_attr_setschedparam(&v45, &v32);
    pthread_attr_setschedpolicy(&v45, 4);
    if (pthread_create((pthread_t *)*v2 + 34, &v45, (void *(__cdecl *)(void *))receiveProc, v4))
    {
      if ((id)objc_opt_class() == *v2)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __33__VCControlChannelMultiWay_start__block_invoke_cold_1();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          int v6 = (__CFString *)[*v2 performSelector:sel_logPrefix];
        }
        else {
          int v6 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v17 = VRTraceErrorLogLevelToCSTR();
          __int16 v18 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            id v30 = *v2;
            int v31 = *((_DWORD *)*v2 + 64);
            *(_DWORD *)buf = 136316418;
            uint64_t v34 = v17;
            __int16 v35 = 2080;
            long long v36 = "-[VCControlChannelMultiWay start]_block_invoke";
            __int16 v37 = 1024;
            int v38 = 263;
            __int16 v39 = 2112;
            int v40 = v6;
            __int16 v41 = 2048;
            id v42 = v30;
            __int16 v43 = 1024;
            int v44 = v31;
            _os_log_error_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to create receiveProc for MW control channel for sessionID='%d'", buf, 0x36u);
          }
        }
      }
    }
    pthread_attr_destroy(&v45);
  }
  if ((id)objc_opt_class() == *v2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      int v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v22 = *((_DWORD *)*v2 + 64);
        LODWORD(v45.__sig) = 136315906;
        *(uint64_t *)((char *)&v45.__sig + 4) = v20;
        *(_WORD *)&v45.__opaque[4] = 2080;
        *(void *)&v45.__opaque[6] = "-[VCControlChannelMultiWay start]_block_invoke";
        *(_WORD *)&v45.__opaque[14] = 1024;
        *(_DWORD *)&v45.__opaque[16] = 269;
        *(_WORD *)&v45.__opaque[20] = 1024;
        *(_DWORD *)&v45.__opaque[22] = v22;
        __int16 v23 = " [%s] %s:%d Started MW control channel for sessionID='%d'";
        uint64_t v24 = v21;
        uint32_t v25 = 34;
LABEL_35:
        _os_log_impl(&dword_1E1EA4000, v24, OS_LOG_TYPE_DEFAULT, v23, (uint8_t *)&v45, v25);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint32_t v19 = (__CFString *)[*v2 performSelector:sel_logPrefix];
    }
    else {
      uint32_t v19 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v26 = VRTraceErrorLogLevelToCSTR();
      unsigned int v27 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        id v28 = *v2;
        int v29 = *((_DWORD *)*v2 + 64);
        LODWORD(v45.__sig) = 136316418;
        *(uint64_t *)((char *)&v45.__sig + 4) = v26;
        *(_WORD *)&v45.__opaque[4] = 2080;
        *(void *)&v45.__opaque[6] = "-[VCControlChannelMultiWay start]_block_invoke";
        *(_WORD *)&v45.__opaque[14] = 1024;
        *(_DWORD *)&v45.__opaque[16] = 269;
        *(_WORD *)&v45.__opaque[20] = 2112;
        *(void *)&v45.__opaque[22] = v19;
        *(_WORD *)&v45.__opaque[30] = 2048;
        *(void *)&v45.__opaque[32] = v28;
        *(_WORD *)&v45.__opaque[40] = 1024;
        *(_DWORD *)&v45.__opaque[42] = v29;
        __int16 v23 = " [%s] %s:%d %@(%p) Started MW control channel for sessionID='%d'";
        uint64_t v24 = v27;
        uint32_t v25 = 54;
        goto LABEL_35;
      }
    }
  }
}

- (void)stop
{
  v3[5] = *MEMORY[0x1E4F143B8];
  sequentialKeyMaterialQueue = self->_sequentialKeyMaterialQueue;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__VCControlChannelMultiWay_stop__block_invoke;
  v3[3] = &unk_1E6DB3DC8;
  v3[4] = self;
  dispatch_sync(sequentialKeyMaterialQueue, v3);
}

void __32__VCControlChannelMultiWay_stop__block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 268))
  {
    *(unsigned char *)(v2 + 268) = 0;
    VTP_Close(*(_DWORD *)(*(void *)(a1 + 32) + 264));
    v3 = *(void **)(a1 + 32);
    int v4 = (_opaque_pthread_t *)v3[34];
    if (!v4)
    {
LABEL_21:
      [v3 flushActiveMessages];
      return;
    }
    unsigned int v27 = 0;
    pthread_join(v4, &v27);

    *(void *)(*(void *)(a1 + 32) + 272) = 0;
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_20;
      }
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      int v9 = *(_DWORD *)(*(void *)(a1 + 32) + 256);
      *(_DWORD *)buf = 136315906;
      uint64_t v29 = v7;
      __int16 v30 = 2080;
      int v31 = "-[VCControlChannelMultiWay stop]_block_invoke";
      __int16 v32 = 1024;
      int v33 = 284;
      __int16 v34 = 1024;
      LODWORD(v35) = v9;
      int v10 = " [%s] %s:%d Stopped MW control channel for sessionID='%d'";
      uint64_t v11 = v8;
      uint32_t v12 = 34;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        long long v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
        goto LABEL_20;
      }
      uint64_t v19 = VRTraceErrorLogLevelToCSTR();
      uint64_t v20 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_20;
      }
      uint64_t v21 = *(void *)(a1 + 32);
      int v22 = *(_DWORD *)(v21 + 256);
      *(_DWORD *)buf = 136316418;
      uint64_t v29 = v19;
      __int16 v30 = 2080;
      int v31 = "-[VCControlChannelMultiWay stop]_block_invoke";
      __int16 v32 = 1024;
      int v33 = 284;
      __int16 v34 = 2112;
      __int16 v35 = v5;
      __int16 v36 = 2048;
      uint64_t v37 = v21;
      __int16 v38 = 1024;
      int v39 = v22;
      int v10 = " [%s] %s:%d %@(%p) Stopped MW control channel for sessionID='%d'";
      uint64_t v11 = v20;
      uint32_t v12 = 54;
    }
    _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_20:
    v3 = *(void **)(a1 + 32);
    goto LABEL_21;
  }
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        int v15 = *(_DWORD *)(*(void *)(a1 + 32) + 256);
        *(_DWORD *)buf = 136315906;
        uint64_t v29 = v13;
        __int16 v30 = 2080;
        int v31 = "-[VCControlChannelMultiWay stop]_block_invoke";
        __int16 v32 = 1024;
        int v33 = 289;
        __int16 v34 = 1024;
        LODWORD(v35) = v15;
        int v16 = " [%s] %s:%d MW control channel already stopped for sessionID='%d'";
        uint64_t v17 = v14;
        uint32_t v18 = 34;
LABEL_27:
        _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v16, buf, v18);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      int v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      uint64_t v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v25 = *(void *)(a1 + 32);
        int v26 = *(_DWORD *)(v25 + 256);
        *(_DWORD *)buf = 136316418;
        uint64_t v29 = v23;
        __int16 v30 = 2080;
        int v31 = "-[VCControlChannelMultiWay stop]_block_invoke";
        __int16 v32 = 1024;
        int v33 = 289;
        __int16 v34 = 2112;
        __int16 v35 = v6;
        __int16 v36 = 2048;
        uint64_t v37 = v25;
        __int16 v38 = 1024;
        int v39 = v26;
        int v16 = " [%s] %s:%d %@(%p) MW control channel already stopped for sessionID='%d'";
        uint64_t v17 = v24;
        uint32_t v18 = 54;
        goto LABEL_27;
      }
    }
  }
}

+ (id)allocPayoadDataFromVTPPacket:(VCBlockBuffer_t *)a3 vpktFlags:(tagVPKTFLAG *)a4 channelDataFormat:(tagVCIDSChannelDataFormat *)a5
{
  if (!a3)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCControlChannelMultiWay allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:]();
      }
    }
    return 0;
  }
  if (!a4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCControlChannelMultiWay allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:]();
      }
    }
    return 0;
  }
  if (!a5)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCControlChannelMultiWay allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:]();
      }
    }
    return 0;
  }
  var2 = a3->var2;
  if (!var2)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCControlChannelMultiWay allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:].cold.4();
      }
    }
    return 0;
  }
  if ((*var2 & 0xC0) != 0x40)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCControlChannelMultiWay allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:].cold.7();
      }
    }
    return 0;
  }
  if ((*var2 & 3) != 0)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCControlChannelMultiWay allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:].cold.6();
      }
    }
    return 0;
  }
  id result = (id)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:a3->var2 + 1 length:a3->var1 - 1];
  if (!result)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[VCControlChannelMultiWay allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:].cold.5();
      }
    }
    return 0;
  }
  p_var19 = &a4->var19;
  if (!a4->var19.participantIDIsSet) {
    p_var19 = 0;
  }
  *a5 = p_var19;
  return result;
}

- (void)flushActiveMessages
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  dialogs = self->_dialogs;
  self->_dialogs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_sync_exit(self);
  if (dialogs)
  {
    int v4 = (void *)[(NSMutableDictionary *)dialogs allKeys];
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v8 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v4);
          }
          objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](dialogs, "objectForKeyedSubscript:", *(void *)(*((void *)&v9 + 1) + 8 * v7++)), "flushActiveTransactions");
        }
        while (v5 != v7);
        uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v8 count:16];
      }
      while (v5);
    }
  }
  [(VCControlChannelMultiWay *)self flushReportingStats];
}

- (id)remoteParticipantIDFromChannelDataFormat:(tagVCIDSChannelDataFormat *)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3) {
    int v4 = (void *)[NSNumber numberWithUnsignedLongLong:a3->participantID];
  }
  else {
    int v4 = &unk_1F3DC5A78;
  }
  objc_sync_enter(self);
  if ([+[VCDefaults sharedInstance] supportsOneToOneMode])
  {
    if ([v4 isEqualToNumber:&unk_1F3DC5A78])
    {
      if (objc_msgSend((id)-[NSMutableDictionary allKeys](self->_activeParticipants, "allKeys"), "count") == 1)
      {
        int v4 = objc_msgSend((id)-[NSMutableDictionary allKeys](self->_activeParticipants, "allKeys"), "objectAtIndexedSubscript:", 0);
        if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
        {
          uint64_t v5 = VRTraceErrorLogLevelToCSTR();
          uint64_t v6 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
          {
            int v8 = 136315906;
            uint64_t v9 = v5;
            __int16 v10 = 2080;
            long long v11 = "-[VCControlChannelMultiWay remoteParticipantIDFromChannelDataFormat:]";
            __int16 v12 = 1024;
            int v13 = 348;
            __int16 v14 = 2112;
            int v15 = v4;
            _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Zero-valued participantID updated to: %@, when there is only one remote participant", (uint8_t *)&v8, 0x26u);
          }
        }
      }
    }
  }
  objc_sync_exit(self);
  return v4;
}

- (void)messageReceived:(id)a3 participantInfo:(tagVCIDSChannelDataFormat *)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = [(VCControlChannelMultiWay *)self remoteParticipantIDFromChannelDataFormat:a4];
  int v28 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = 0;
  char v25 = 1;
  id v7 = [(VCControlChannelMultiWay *)self copyDialogForParticipantID:v6];
  if (v7)
  {
    int v8 = v7;
    uint64_t v9 = [v7 processMessageData:a3 participantID:v6 topic:&v26 transactionID:&v27 messageStatus:&v28 isInternalMessage:&v25];

    if (!v25)
    {
      asyncProcessingQueue = self->super._asyncProcessingQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __60__VCControlChannelMultiWay_messageReceived_participantInfo___block_invoke;
      block[3] = &unk_1E6DB6768;
      block[4] = v26;
      block[5] = self;
      block[6] = v9;
      block[7] = v27;
      block[8] = v6;
      dispatch_async(asyncProcessingQueue, block);
    }
    if ((VCControlChannelMultiWay *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v12 = VRTraceErrorLogLevelToCSTR();
        int v13 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int transportSessionID = self->_transportSessionID;
          *(_DWORD *)buf = 136317186;
          uint64_t v30 = v12;
          __int16 v31 = 2080;
          __int16 v32 = "-[VCControlChannelMultiWay messageReceived:participantInfo:]";
          __int16 v33 = 1024;
          int v34 = 384;
          __int16 v35 = 1024;
          *(_DWORD *)__int16 v36 = transportSessionID;
          *(_WORD *)&v36[4] = 2112;
          *(void *)&v36[6] = v26;
          *(_WORD *)&v36[14] = 2112;
          *(void *)&v36[16] = v9;
          *(_WORD *)&v36[24] = 2112;
          *(void *)&v36[26] = v6;
          __int16 v37 = 2112;
          uint64_t v38 = v27;
          __int16 v39 = 1024;
          LODWORD(v40) = v28;
          int v15 = " [%s] %s:%d messageReceived finished for sessionID='%d': topic='%@', message='%@', participantID='%@', s"
                "equenceNumber='%@', status='%d'";
          uint64_t v16 = v13;
          uint32_t v17 = 80;
LABEL_14:
          _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        long long v11 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
      }
      else {
        long long v11 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        uint64_t v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v20 = self->_transportSessionID;
          *(_DWORD *)buf = 136317698;
          uint64_t v30 = v18;
          __int16 v31 = 2080;
          __int16 v32 = "-[VCControlChannelMultiWay messageReceived:participantInfo:]";
          __int16 v33 = 1024;
          int v34 = 384;
          __int16 v35 = 2112;
          *(void *)__int16 v36 = v11;
          *(_WORD *)&v36[8] = 2048;
          *(void *)&v36[10] = self;
          *(_WORD *)&v36[18] = 1024;
          *(_DWORD *)&v36[20] = v20;
          *(_WORD *)&v36[24] = 2112;
          *(void *)&v36[26] = v26;
          __int16 v37 = 2112;
          uint64_t v38 = v9;
          __int16 v39 = 2112;
          id v40 = v6;
          __int16 v41 = 2112;
          uint64_t v42 = v27;
          __int16 v43 = 1024;
          int v44 = v28;
          int v15 = " [%s] %s:%d %@(%p) messageReceived finished for sessionID='%d': topic='%@', message='%@', participantID="
                "'%@', sequenceNumber='%@', status='%d'";
          uint64_t v16 = v19;
          uint32_t v17 = 100;
          goto LABEL_14;
        }
      }
    }
  }
  else if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCControlChannelMultiWay messageReceived:participantInfo:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v21 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v21 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v22 = VRTraceErrorLogLevelToCSTR();
      uint64_t v23 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v30 = v22;
        __int16 v31 = 2080;
        __int16 v32 = "-[VCControlChannelMultiWay messageReceived:participantInfo:]";
        __int16 v33 = 1024;
        int v34 = 363;
        __int16 v35 = 2112;
        *(void *)__int16 v36 = v21;
        *(_WORD *)&v36[8] = 2048;
        *(void *)&v36[10] = self;
        *(_WORD *)&v36[18] = 2112;
        *(void *)&v36[20] = v6;
        _os_log_error_impl(&dword_1E1EA4000, v23, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Could not create dialog for unknown participantID='%@'", buf, 0x3Au);
      }
    }
  }
}

void __60__VCControlChannelMultiWay_messageReceived_participantInfo___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) isEqualToString:@"VCExternalClientDataTopic"];
  uint64_t v3 = *(void *)(a1 + 40);
  if (!v2)
  {
    int v4 = (void *)MEMORY[0x1E4E56580](v3 + 168);
    objc_msgSend(v4, "controlChannel:topic:payload:transactionID:fromParticipant:", *(void *)(a1 + 40), *(void *)(a1 + 32), *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "unsignedLongValue"), *(void *)(a1 + 64));
    if (!v4) {
      return;
    }
    goto LABEL_5;
  }
  int v4 = (void *)MEMORY[0x1E4E56580](v3 + 176);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v4, "controlChannel:receivedData:transactionID:fromParticipant:", *(void *)(a1 + 40), *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "unsignedLongValue"), *(void *)(a1 + 64));
  }
  if (v4)
  {
LABEL_5:
    CFRelease(v4);
  }
}

- (BOOL)sendReliableMessageAndWait:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
  uint64_t v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[VCControlChannel reliableMessageResendInterval](self, "reliableMessageResendInterval"));

  return [(VCControlChannelMultiWay *)self sendReliableMessageAndWait:a3 withTopic:a4 participantID:a5 timeout:v9 withOptions:0];
}

- (id)copyDialogForParticipantID:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  id v5 = (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dialogs, "objectForKeyedSubscript:", [a3 stringValue]);
  if (v5)
  {
    if ((VCControlChannelMultiWay *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        id v6 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
      }
      else {
        id v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
        goto LABEL_38;
      }
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      int v13 = *MEMORY[0x1E4F47A50];
      __int16 v14 = *MEMORY[0x1E4F47A50];
      if (*MEMORY[0x1E4F47A40])
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v23 = 136316418;
          uint64_t v24 = v12;
          __int16 v25 = 2080;
          uint64_t v26 = "-[VCControlChannelMultiWay copyDialogForParticipantID:]";
          __int16 v27 = 1024;
          int v28 = 398;
          __int16 v29 = 2112;
          id v30 = v6;
          __int16 v31 = 2048;
          __int16 v32 = self;
          __int16 v33 = 2112;
          id v34 = a3;
          long long v11 = " [%s] %s:%d %@(%p) sendMessage: found existing dialog for participantID='%@'";
LABEL_27:
          uint32_t v17 = v13;
          uint32_t v18 = 58;
          goto LABEL_28;
        }
        goto LABEL_38;
      }
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
        goto LABEL_38;
      }
      int v23 = 136316418;
      uint64_t v24 = v12;
      __int16 v25 = 2080;
      uint64_t v26 = "-[VCControlChannelMultiWay copyDialogForParticipantID:]";
      __int16 v27 = 1024;
      int v28 = 398;
      __int16 v29 = 2112;
      id v30 = v6;
      __int16 v31 = 2048;
      __int16 v32 = self;
      __int16 v33 = 2112;
      id v34 = a3;
      uint64_t v21 = " [%s] %s:%d %@(%p) sendMessage: found existing dialog for participantID='%@'";
LABEL_35:
      _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, v21, (uint8_t *)&v23, 0x3Au);
      goto LABEL_38;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_38;
    }
    uint64_t v8 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    __int16 v10 = *MEMORY[0x1E4F47A50];
    if (!*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[VCControlChannelMultiWay copyDialogForParticipantID:]();
      }
      goto LABEL_38;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_38;
    }
    int v23 = 136315906;
    uint64_t v24 = v8;
    __int16 v25 = 2080;
    uint64_t v26 = "-[VCControlChannelMultiWay copyDialogForParticipantID:]";
    __int16 v27 = 1024;
    int v28 = 398;
    __int16 v29 = 2112;
    id v30 = a3;
    long long v11 = " [%s] %s:%d sendMessage: found existing dialog for participantID='%@'";
LABEL_21:
    uint32_t v17 = v9;
    uint32_t v18 = 38;
LABEL_28:
    _os_log_impl(&dword_1E1EA4000, v17, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v23, v18);
    goto LABEL_38;
  }
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
      goto LABEL_38;
    }
    uint64_t v15 = VRTraceErrorLogLevelToCSTR();
    uint64_t v9 = *MEMORY[0x1E4F47A50];
    uint64_t v16 = *MEMORY[0x1E4F47A50];
    if (!*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
        -[VCControlChannelMultiWay copyDialogForParticipantID:]();
      }
      goto LABEL_38;
    }
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_38;
    }
    int v23 = 136315906;
    uint64_t v24 = v15;
    __int16 v25 = 2080;
    uint64_t v26 = "-[VCControlChannelMultiWay copyDialogForParticipantID:]";
    __int16 v27 = 1024;
    int v28 = 400;
    __int16 v29 = 2112;
    id v30 = a3;
    long long v11 = " [%s] %s:%d sendMessage: could not find existing dialog for participantID='%@'";
    goto LABEL_21;
  }
  if (objc_opt_respondsToSelector()) {
    id v7 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
  }
  else {
    id v7 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
    goto LABEL_38;
  }
  uint64_t v19 = VRTraceErrorLogLevelToCSTR();
  int v13 = *MEMORY[0x1E4F47A50];
  unsigned int v20 = *MEMORY[0x1E4F47A50];
  if (!*MEMORY[0x1E4F47A40])
  {
    if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_38;
    }
    int v23 = 136316418;
    uint64_t v24 = v19;
    __int16 v25 = 2080;
    uint64_t v26 = "-[VCControlChannelMultiWay copyDialogForParticipantID:]";
    __int16 v27 = 1024;
    int v28 = 400;
    __int16 v29 = 2112;
    id v30 = v7;
    __int16 v31 = 2048;
    __int16 v32 = self;
    __int16 v33 = 2112;
    id v34 = a3;
    uint64_t v21 = " [%s] %s:%d %@(%p) sendMessage: could not find existing dialog for participantID='%@'";
    goto LABEL_35;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 136316418;
    uint64_t v24 = v19;
    __int16 v25 = 2080;
    uint64_t v26 = "-[VCControlChannelMultiWay copyDialogForParticipantID:]";
    __int16 v27 = 1024;
    int v28 = 400;
    __int16 v29 = 2112;
    id v30 = v7;
    __int16 v31 = 2048;
    __int16 v32 = self;
    __int16 v33 = 2112;
    id v34 = a3;
    long long v11 = " [%s] %s:%d %@(%p) sendMessage: could not find existing dialog for participantID='%@'";
    goto LABEL_27;
  }
LABEL_38:
  objc_sync_exit(self);
  return v5;
}

- (BOOL)sendReliableMessageAndWait:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 timeout:(id)a6 withOptions:(id)a7
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      uint64_t v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int transportSessionID = self->_transportSessionID;
        *(_DWORD *)buf = 136316674;
        uint64_t v44 = v14;
        __int16 v45 = 2080;
        uint64_t v46 = "-[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:]";
        __int16 v47 = 1024;
        int v48 = 407;
        __int16 v49 = 2112;
        id v50 = a3;
        __int16 v51 = 1024;
        *(_DWORD *)v52 = transportSessionID;
        *(_WORD *)&v52[4] = 2048;
        *(void *)&v52[6] = a5;
        *(_WORD *)&v52[14] = 2112;
        *(void *)&v52[16] = a6;
        uint32_t v17 = " [%s] %s:%d VCControlChannelMultiWay: sendReliableMessageAndWait: message '%@' for sessionID '%d', partici"
              "pantID '%llu', timeout '%@'";
        uint32_t v18 = v15;
        uint32_t v19 = 64;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      int v13 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
    }
    else {
      int v13 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v20 = VRTraceErrorLogLevelToCSTR();
      uint64_t v21 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v22 = self->_transportSessionID;
        *(_DWORD *)buf = 136317186;
        uint64_t v44 = v20;
        __int16 v45 = 2080;
        uint64_t v46 = "-[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:]";
        __int16 v47 = 1024;
        int v48 = 407;
        __int16 v49 = 2112;
        id v50 = v13;
        __int16 v51 = 2048;
        *(void *)v52 = self;
        *(_WORD *)&v52[8] = 2112;
        *(void *)&v52[10] = a3;
        *(_WORD *)&v52[18] = 1024;
        *(_DWORD *)&v52[20] = v22;
        *(_WORD *)&v52[24] = 2048;
        *(void *)&v52[26] = a5;
        *(_WORD *)&v52[34] = 2112;
        *(void *)&v52[36] = a6;
        uint32_t v17 = " [%s] %s:%d %@(%p) VCControlChannelMultiWay: sendReliableMessageAndWait: message '%@' for sessionID '%d', "
              "participantID '%llu', timeout '%@'";
        uint32_t v18 = v21;
        uint32_t v19 = 84;
        goto LABEL_11;
      }
    }
  }
  if (!self->_isRunning)
  {
    if ((VCControlChannelMultiWay *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        __int16 v29 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
      }
      else {
        __int16 v29 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
        goto LABEL_18;
      }
      uint64_t v35 = VRTraceErrorLogLevelToCSTR();
      __int16 v36 = *MEMORY[0x1E4F47A50];
      BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v27) {
        return v27;
      }
      *(_DWORD *)buf = 136316930;
      uint64_t v44 = v35;
      __int16 v45 = 2080;
      uint64_t v46 = "-[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:]";
      __int16 v47 = 1024;
      int v48 = 410;
      __int16 v49 = 2112;
      id v50 = v29;
      __int16 v51 = 2048;
      *(void *)v52 = self;
      *(_WORD *)&v52[8] = 2112;
      *(void *)&v52[10] = a3;
      *(_WORD *)&v52[18] = 2112;
      *(void *)&v52[20] = a4;
      *(_WORD *)&v52[28] = 2048;
      *(void *)&v52[30] = a5;
      __int16 v33 = " [%s] %s:%d %@(%p) Attempt to send reliable message=%@ with topic=%@ to participantID=%llu when Control Chan"
            "nel is not started. Ignoring...";
      id v34 = v36;
      uint32_t v37 = 78;
      goto LABEL_42;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v31 = VRTraceErrorLogLevelToCSTR();
      __int16 v32 = *MEMORY[0x1E4F47A50];
      BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v27) {
        return v27;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v44 = v31;
      __int16 v45 = 2080;
      uint64_t v46 = "-[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:]";
      __int16 v47 = 1024;
      int v48 = 410;
      __int16 v49 = 2112;
      id v50 = a3;
      __int16 v51 = 2112;
      *(void *)v52 = a4;
      *(_WORD *)&v52[8] = 2048;
      *(void *)&v52[10] = a5;
      __int16 v33 = " [%s] %s:%d Attempt to send reliable message=%@ with topic=%@ to participantID=%llu when Control Channel is "
            "not started. Ignoring...";
      id v34 = v32;
      goto LABEL_41;
    }
LABEL_18:
    LOBYTE(v27) = 0;
    return v27;
  }
  uint64_t v23 = [NSNumber numberWithUnsignedLongLong:a5];
  id v24 = [(VCControlChannelMultiWay *)self copyDialogForParticipantID:v23];
  __int16 v25 = v24;
  if (!v24)
  {
    if ((VCControlChannelMultiWay *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
        if (!v27) {
          return v27;
        }
        -[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:]();
      }
      goto LABEL_18;
    }
    if (objc_opt_respondsToSelector()) {
      id v30 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
    }
    else {
      id v30 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v38 = VRTraceErrorLogLevelToCSTR();
      __int16 v39 = *MEMORY[0x1E4F47A50];
      BOOL v27 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR);
      if (!v27) {
        return v27;
      }
      *(_DWORD *)buf = 136316418;
      uint64_t v44 = v38;
      __int16 v45 = 2080;
      uint64_t v46 = "-[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:]";
      __int16 v47 = 1024;
      int v48 = 413;
      __int16 v49 = 2112;
      id v50 = v30;
      __int16 v51 = 2048;
      *(void *)v52 = self;
      *(_WORD *)&v52[8] = 2048;
      *(void *)&v52[10] = a5;
      __int16 v33 = " [%s] %s:%d %@(%p) Could not create dialog for unknown participantID='%llu'";
      id v34 = v39;
LABEL_41:
      uint32_t v37 = 58;
LABEL_42:
      _os_log_error_impl(&dword_1E1EA4000, v34, OS_LOG_TYPE_ERROR, v33, buf, v37);
      goto LABEL_18;
    }
    goto LABEL_18;
  }
  char v26 = [v24 sendReliableMessage:a3 withTopic:a4 timeout:a6 withOptions:a7];

  if ((v26 & 1) == 0)
  {
    objc_sync_enter(self);
    uint64_t v28 = [(NSMutableDictionary *)self->_activeParticipants objectForKeyedSubscript:v23];
    objc_sync_exit(self);
    if (v28 && !self->_didSubmitCCReliableDataNotReceivedSymptom)
    {
      [(VCObject *)self reportingAgent];
      uint64_t v42 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a5, @"SymptomReporterOptionalKeyParticipantID");
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      reportingSymptom();
      LOBYTE(v27) = 0;
      self->_didSubmitCCReliableDataNotReceivedSymptom = 1;
      return v27;
    }
    goto LABEL_18;
  }
  LOBYTE(v27) = 1;
  return v27;
}

- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 timeout:(unsigned int)a6 completion:(id)a7
{
  return [(VCControlChannelMultiWay *)self sendReliableMessage:a3 withTopic:a4 participantID:a5 timeout:*(void *)&a6 withOptions:0 completion:a7];
}

- (BOOL)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5 timeout:(unsigned int)a6 withOptions:(id)a7 completion:(id)a8
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a8)
  {
    asyncProcessingQueue = self->super._asyncProcessingQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __103__VCControlChannelMultiWay_sendReliableMessage_withTopic_participantID_timeout_withOptions_completion___block_invoke;
    block[3] = &unk_1E6DB89D0;
    block[4] = self;
    block[5] = a3;
    unsigned int v16 = a6;
    block[6] = a4;
    block[7] = a7;
    block[8] = a8;
    void block[9] = a5;
    dispatch_async(asyncProcessingQueue, block);
  }
  else if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCControlChannelMultiWay sendReliableMessage:withTopic:participantID:timeout:withOptions:completion:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v12 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v12 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      uint64_t v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v18 = v13;
        __int16 v19 = 2080;
        uint64_t v20 = "-[VCControlChannelMultiWay sendReliableMessage:withTopic:participantID:timeout:withOptions:completion:]";
        __int16 v21 = 1024;
        int v22 = 437;
        __int16 v23 = 2112;
        id v24 = v12;
        __int16 v25 = 2048;
        char v26 = self;
        _os_log_error_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) completion should not be nil", buf, 0x30u);
      }
    }
  }
  return a8 != 0;
}

uint64_t __103__VCControlChannelMultiWay_sendReliableMessage_withTopic_participantID_timeout_withOptions_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 72), objc_msgSend(NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(a1 + 80)), *(void *)(a1 + 56));
  int v2 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v2();
}

- (void)sendReliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      long long v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int transportSessionID = self->_transportSessionID;
        *(_DWORD *)buf = 136316418;
        uint64_t v22 = v10;
        __int16 v23 = 2080;
        id v24 = "-[VCControlChannelMultiWay sendReliableMessage:withTopic:participantID:]";
        __int16 v25 = 1024;
        int v26 = 449;
        __int16 v27 = 2112;
        id v28 = a3;
        __int16 v29 = 1024;
        *(_DWORD *)id v30 = transportSessionID;
        *(_WORD *)&v30[4] = 2048;
        *(void *)&v30[6] = a5;
        uint64_t v13 = " [%s] %s:%d VCControlChannelMultiWay: sendReliableMessage: message '%@' for sessionID '%d', participantID '%llu's";
        uint64_t v14 = v11;
        uint32_t v15 = 54;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint32_t v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v18 = self->_transportSessionID;
        *(_DWORD *)buf = 136316930;
        uint64_t v22 = v16;
        __int16 v23 = 2080;
        id v24 = "-[VCControlChannelMultiWay sendReliableMessage:withTopic:participantID:]";
        __int16 v25 = 1024;
        int v26 = 449;
        __int16 v27 = 2112;
        id v28 = v9;
        __int16 v29 = 2048;
        *(void *)id v30 = self;
        *(_WORD *)&v30[8] = 2112;
        *(void *)&v30[10] = a3;
        __int16 v31 = 1024;
        unsigned int v32 = v18;
        __int16 v33 = 2048;
        unint64_t v34 = a5;
        uint64_t v13 = " [%s] %s:%d %@(%p) VCControlChannelMultiWay: sendReliableMessage: message '%@' for sessionID '%d', participantID '%llu's";
        uint64_t v14 = v17;
        uint32_t v15 = 74;
        goto LABEL_11;
      }
    }
  }
  asyncProcessingQueue = self->super._asyncProcessingQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __72__VCControlChannelMultiWay_sendReliableMessage_withTopic_participantID___block_invoke;
  v20[3] = &unk_1E6DB6560;
  v20[4] = self;
  v20[5] = a3;
  v20[6] = a4;
  v20[7] = a5;
  dispatch_async(asyncProcessingQueue, v20);
}

uint64_t __72__VCControlChannelMultiWay_sendReliableMessage_withTopic_participantID___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) sendReliableMessageAndWait:*(void *)(a1 + 40) withTopic:*(void *)(a1 + 48) participantID:*(void *)(a1 + 56)];
  int v3 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 40), "VCCCPayloadKey"), "isEqualToString:", @"EncryptedMessage");
  uint64_t v4 = *(void *)(a1 + 32);
  if (v3)
  {
    id Weak = objc_loadWeak((id *)(v4 + 168));
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = [*(id *)(a1 + 40) VCCCString];
    uint64_t v8 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
    return [Weak controlChannel:v6 sendReliableMessage:v7 didSucceed:v2 toParticipant:v8];
  }
  else
  {
    id v10 = objc_loadWeak((id *)(v4 + 176));
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = [*(id *)(a1 + 40) VCCCData];
      uint64_t v13 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 56)];
      return [v10 controlChannel:v11 sendReliableData:v12 didSucceed:v2 toParticipant:v13];
    }
  }
  return result;
}

- (void)sendUnreliableMessage:(id)a3 withTopic:(id)a4 participantID:(unint64_t)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int transportSessionID = self->_transportSessionID;
        *(_DWORD *)buf = 136316418;
        uint64_t v22 = v10;
        __int16 v23 = 2080;
        id v24 = "-[VCControlChannelMultiWay sendUnreliableMessage:withTopic:participantID:]";
        __int16 v25 = 1024;
        int v26 = 465;
        __int16 v27 = 2112;
        id v28 = a3;
        __int16 v29 = 1024;
        *(_DWORD *)id v30 = transportSessionID;
        *(_WORD *)&v30[4] = 2048;
        *(void *)&v30[6] = a5;
        uint64_t v13 = " [%s] %s:%d VCControlChannelMultiWay: sendUnreliableMessage: message '%@' for sessionID '%d', participantID '%llu'";
        uint64_t v14 = v11;
        uint32_t v15 = 54;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v9 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v9 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      uint32_t v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v18 = self->_transportSessionID;
        *(_DWORD *)buf = 136316930;
        uint64_t v22 = v16;
        __int16 v23 = 2080;
        id v24 = "-[VCControlChannelMultiWay sendUnreliableMessage:withTopic:participantID:]";
        __int16 v25 = 1024;
        int v26 = 465;
        __int16 v27 = 2112;
        id v28 = v9;
        __int16 v29 = 2048;
        *(void *)id v30 = self;
        *(_WORD *)&v30[8] = 2112;
        *(void *)&v30[10] = a3;
        __int16 v31 = 1024;
        unsigned int v32 = v18;
        __int16 v33 = 2048;
        unint64_t v34 = a5;
        uint64_t v13 = " [%s] %s:%d %@(%p) VCControlChannelMultiWay: sendUnreliableMessage: message '%@' for sessionID '%d', participantID '%llu'";
        uint64_t v14 = v17;
        uint32_t v15 = 74;
        goto LABEL_11;
      }
    }
  }
  asyncProcessingQueue = self->super._asyncProcessingQueue;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __74__VCControlChannelMultiWay_sendUnreliableMessage_withTopic_participantID___block_invoke;
  v20[3] = &unk_1E6DB6560;
  v20[4] = self;
  v20[5] = a3;
  v20[6] = a4;
  v20[7] = a5;
  dispatch_async(asyncProcessingQueue, v20);
}

void __74__VCControlChannelMultiWay_sendUnreliableMessage_withTopic_participantID___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = (id)objc_msgSend(*(id *)(a1 + 32), "copyDialogForParticipantID:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)(a1 + 56)));
  if (v7)
  {
    objc_msgSend(v7, "sendUnreliableMessage:withTopic:sessionID:participantID:transactionDelegate:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(unsigned int *)(*(void *)(a1 + 32) + 256), objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", *(void *)(a1 + 56)), *(void *)(a1 + 32));
  }
  else if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __74__VCControlChannelMultiWay_sendUnreliableMessage_withTopic_participantID___block_invoke_cold_1();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v2 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v2 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v3 = VRTraceErrorLogLevelToCSTR();
      uint64_t v4 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = *(void *)(a1 + 56);
        *(_DWORD *)buf = 136316418;
        uint64_t v9 = v3;
        __int16 v10 = 2080;
        uint64_t v11 = "-[VCControlChannelMultiWay sendUnreliableMessage:withTopic:participantID:]_block_invoke";
        __int16 v12 = 1024;
        int v13 = 468;
        __int16 v14 = 2112;
        uint32_t v15 = v2;
        __int16 v16 = 2048;
        uint64_t v17 = v5;
        __int16 v18 = 2048;
        uint64_t v19 = v6;
        _os_log_error_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Could not create dialog for unknown participantID='%llu'", buf, 0x3Au);
      }
    }
  }
}

- (BOOL)addActiveParticipant:(unint64_t)a3 participantUUID:(id)a4 withConfiguration:(id *)a5
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  if (a5)
  {
    objc_sync_enter(self);
    if (-[NSMutableDictionary objectForKeyedSubscript:](self->_activeParticipants, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedLongLong:a3]))
    {
      if ((VCControlChannelMultiWay *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_30;
        }
        uint64_t v36 = VRTraceErrorLogLevelToCSTR();
        uint32_t v37 = *MEMORY[0x1E4F47A50];
        BOOL v25 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_31;
        }
        int v42 = 136315906;
        uint64_t v43 = v36;
        __int16 v44 = 2080;
        __int16 v45 = "-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:]";
        __int16 v46 = 1024;
        int v47 = 484;
        __int16 v48 = 2048;
        unint64_t v49 = a3;
        id v28 = " [%s] %s:%d API misuse! Participant '%llu' has alrady been added to the list of active participants! Ignoring...";
        __int16 v29 = v37;
        uint32_t v30 = 38;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v35 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v35 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_30;
        }
        uint64_t v40 = VRTraceErrorLogLevelToCSTR();
        uint64_t v41 = *MEMORY[0x1E4F47A50];
        BOOL v25 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_31;
        }
        int v42 = 136316418;
        uint64_t v43 = v40;
        __int16 v44 = 2080;
        __int16 v45 = "-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:]";
        __int16 v46 = 1024;
        int v47 = 484;
        __int16 v48 = 2112;
        unint64_t v49 = (unint64_t)v35;
        __int16 v50 = 2048;
        __int16 v51 = self;
        __int16 v52 = 2048;
        unint64_t v53 = a3;
        id v28 = " [%s] %s:%d %@(%p) API misuse! Participant '%llu' has alrady been added to the list of active participants! Ignoring...";
        __int16 v29 = v41;
        uint32_t v30 = 58;
      }
    }
    else
    {
      uint64_t var0 = a5->var0;
      if (var0 == 2)
      {
        __int16 v12 = [VCControlChannelDialogV2 alloc];
        uint64_t v11 = -[VCControlChannelDialogV2 initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:](v12, "initWithSessionID:participantID:participantUUID:participantConfig:transactionDelegate:", self->_transportSessionID, [NSNumber numberWithUnsignedLongLong:a3], a4, a5, self);
LABEL_7:
        [(VCObject *)v11 setReportingAgent:self->super.super._reportingAgent];
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dialogs, "setObject:forKeyedSubscript:", v11, objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", a3), "stringValue"));

        uint64_t v13 = [NSNumber numberWithUnsignedInt:var0];
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_activeParticipants, "setObject:forKeyedSubscript:", v13, [NSNumber numberWithUnsignedLongLong:a3]);
        if ((VCControlChannelMultiWay *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
            goto LABEL_21;
          }
          uint64_t v16 = VRTraceErrorLogLevelToCSTR();
          uint64_t v17 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          unsigned int transportSessionID = self->_transportSessionID;
          int v42 = 136316162;
          uint64_t v43 = v16;
          __int16 v44 = 2080;
          __int16 v45 = "-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:]";
          __int16 v46 = 1024;
          int v47 = 502;
          __int16 v48 = 2048;
          unint64_t v49 = a3;
          __int16 v50 = 1024;
          LODWORD(v51) = transportSessionID;
          uint64_t v19 = " [%s] %s:%d addActiveParticipant:'%llu' for sessionID '%d'";
          uint64_t v20 = v17;
          uint32_t v21 = 44;
        }
        else
        {
          if (objc_opt_respondsToSelector()) {
            __int16 v14 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
          }
          else {
            __int16 v14 = &stru_1F3D3E450;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
            goto LABEL_21;
          }
          uint64_t v22 = VRTraceErrorLogLevelToCSTR();
          __int16 v23 = *MEMORY[0x1E4F47A50];
          if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_21;
          }
          unsigned int v24 = self->_transportSessionID;
          int v42 = 136316674;
          uint64_t v43 = v22;
          __int16 v44 = 2080;
          __int16 v45 = "-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:]";
          __int16 v46 = 1024;
          int v47 = 502;
          __int16 v48 = 2112;
          unint64_t v49 = (unint64_t)v14;
          __int16 v50 = 2048;
          __int16 v51 = self;
          __int16 v52 = 2048;
          unint64_t v53 = a3;
          __int16 v54 = 1024;
          unsigned int v55 = v24;
          uint64_t v19 = " [%s] %s:%d %@(%p) addActiveParticipant:'%llu' for sessionID '%d'";
          uint64_t v20 = v23;
          uint32_t v21 = 64;
        }
        _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v19, (uint8_t *)&v42, v21);
LABEL_21:
        BOOL v25 = 1;
LABEL_31:
        objc_sync_exit(self);
        return v25;
      }
      if (var0 == 1)
      {
        __int16 v10 = [VCControlChannelDialogV1 alloc];
        uint64_t v11 = -[VCControlChannelDialogV1 initWithSessionID:participantID:participantUUID:optionalTopics:participantConfig:transactionDelegate:](v10, "initWithSessionID:participantID:participantUUID:optionalTopics:participantConfig:transactionDelegate:", self->_transportSessionID, [NSNumber numberWithUnsignedLongLong:a3], a4, self->super._optionalTopics, a5, self);
        goto LABEL_7;
      }
      if ((VCControlChannelMultiWay *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 5)
        {
LABEL_30:
          BOOL v25 = 0;
          goto LABEL_31;
        }
        uint64_t v26 = VRTraceErrorLogLevelToCSTR();
        __int16 v27 = *MEMORY[0x1E4F47A50];
        BOOL v25 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_31;
        }
        int v42 = 136315906;
        uint64_t v43 = v26;
        __int16 v44 = 2080;
        __int16 v45 = "-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:]";
        __int16 v46 = 1024;
        int v47 = 495;
        __int16 v48 = 1024;
        LODWORD(v49) = var0;
        id v28 = " [%s] %s:%d Wrong version of protocol supplied '%u'. Ignoring...";
        __int16 v29 = v27;
        uint32_t v30 = 34;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint32_t v15 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
        }
        else {
          uint32_t v15 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
          goto LABEL_30;
        }
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        unsigned int v32 = *MEMORY[0x1E4F47A50];
        BOOL v25 = 0;
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_31;
        }
        int v42 = 136316418;
        uint64_t v43 = v31;
        __int16 v44 = 2080;
        __int16 v45 = "-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:]";
        __int16 v46 = 1024;
        int v47 = 495;
        __int16 v48 = 2112;
        unint64_t v49 = (unint64_t)v15;
        __int16 v50 = 2048;
        __int16 v51 = self;
        __int16 v52 = 1024;
        LODWORD(v53) = var0;
        id v28 = " [%s] %s:%d %@(%p) Wrong version of protocol supplied '%u'. Ignoring...";
        __int16 v29 = v32;
        uint32_t v30 = 54;
      }
    }
    _os_log_impl(&dword_1E1EA4000, v29, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v42, v30);
    goto LABEL_30;
  }
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      unint64_t v34 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
    }
    else {
      unint64_t v34 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v38 = VRTraceErrorLogLevelToCSTR();
      __int16 v39 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v42 = 136316162;
        uint64_t v43 = v38;
        __int16 v44 = 2080;
        __int16 v45 = "-[VCControlChannelMultiWay addActiveParticipant:participantUUID:withConfiguration:]";
        __int16 v46 = 1024;
        int v47 = 481;
        __int16 v48 = 2112;
        unint64_t v49 = (unint64_t)v34;
        __int16 v50 = 2048;
        __int16 v51 = self;
        _os_log_error_impl(&dword_1E1EA4000, v39, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) participantConfig must not be nil", (uint8_t *)&v42, 0x30u);
      }
    }
  }
  return 0;
}

- (void)processParticipantRemoval:(id)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_activeParticipants, "removeObjectForKey:");
  objc_msgSend((id)-[NSMutableDictionary objectForKeyedSubscript:](self->_dialogs, "objectForKeyedSubscript:", objc_msgSend(a3, "stringValue")), "flushActiveTransactions");
  dialogs = self->_dialogs;
  uint64_t v6 = [a3 stringValue];

  [(NSMutableDictionary *)dialogs removeObjectForKey:v6];
}

- (void)removeActiveParticipant:(unint64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
  objc_sync_enter(self);
  [(VCControlChannelMultiWay *)self processParticipantRemoval:v5];
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int transportSessionID = self->_transportSessionID;
        *(_DWORD *)buf = 136316162;
        uint64_t v19 = v7;
        __int16 v20 = 2080;
        uint32_t v21 = "-[VCControlChannelMultiWay removeActiveParticipant:]";
        __int16 v22 = 1024;
        int v23 = 522;
        __int16 v24 = 2048;
        unint64_t v25 = a3;
        __int16 v26 = 1024;
        LODWORD(v27) = transportSessionID;
        __int16 v10 = " [%s] %s:%d removeActiveParticipant:Removed participant '%llu' for sessionID '%d'";
        uint64_t v11 = v8;
        uint32_t v12 = 44;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v6 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v6 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v13 = VRTraceErrorLogLevelToCSTR();
      __int16 v14 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v15 = self->_transportSessionID;
        *(_DWORD *)buf = 136316674;
        uint64_t v19 = v13;
        __int16 v20 = 2080;
        uint32_t v21 = "-[VCControlChannelMultiWay removeActiveParticipant:]";
        __int16 v22 = 1024;
        int v23 = 522;
        __int16 v24 = 2112;
        unint64_t v25 = (unint64_t)v6;
        __int16 v26 = 2048;
        __int16 v27 = self;
        __int16 v28 = 2048;
        unint64_t v29 = a3;
        __int16 v30 = 1024;
        unsigned int v31 = v15;
        __int16 v10 = " [%s] %s:%d %@(%p) removeActiveParticipant:Removed participant '%llu' for sessionID '%d'";
        uint64_t v11 = v14;
        uint32_t v12 = 64;
        goto LABEL_11;
      }
    }
  }
  objc_sync_exit(self);
  asyncProcessingQueue = self->super._asyncProcessingQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __52__VCControlChannelMultiWay_removeActiveParticipant___block_invoke;
  v17[3] = &unk_1E6DB3E40;
  v17[4] = self;
  v17[5] = v5;
  dispatch_async(asyncProcessingQueue, v17);
}

uint64_t __52__VCControlChannelMultiWay_removeActiveParticipant___block_invoke(uint64_t a1)
{
  id Weak = objc_loadWeak((id *)(*(void *)(a1 + 32) + 168));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);

  return [Weak controlChannel:v3 clearTransactionCacheForParticipant:v4];
}

- (void)removeAllActiveParticipants
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  uint64_t v3 = (void *)[(NSMutableDictionary *)self->_activeParticipants allKeys];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v35 objects:v34 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v36;
    *(void *)&long long v5 = 136316162;
    long long v19 = v5;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v36 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(__CFString **)(*((void *)&v35 + 1) + 8 * i);
        -[VCControlChannelMultiWay processParticipantRemoval:](self, "processParticipantRemoval:", v8, v19);
        if ((VCControlChannelMultiWay *)objc_opt_class() == self)
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v16 = VRTraceErrorLogLevelToCSTR();
            uint64_t v17 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              unsigned int transportSessionID = self->_transportSessionID;
              *(_DWORD *)buf = v19;
              uint64_t v21 = v16;
              __int16 v22 = 2080;
              int v23 = "-[VCControlChannelMultiWay removeAllActiveParticipants]";
              __int16 v24 = 1024;
              int v25 = 535;
              __int16 v26 = 2112;
              __int16 v27 = v8;
              __int16 v28 = 1024;
              LODWORD(v29) = transportSessionID;
              uint64_t v13 = v17;
              __int16 v14 = " [%s] %s:%d Removed participant '%@' for sessionID '%d'";
              uint32_t v15 = 44;
              goto LABEL_15;
            }
          }
        }
        else
        {
          uint64_t v9 = &stru_1F3D3E450;
          if (objc_opt_respondsToSelector()) {
            uint64_t v9 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v10 = VRTraceErrorLogLevelToCSTR();
            uint64_t v11 = *MEMORY[0x1E4F47A50];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
            {
              unsigned int v12 = self->_transportSessionID;
              *(_DWORD *)buf = 136316674;
              uint64_t v21 = v10;
              __int16 v22 = 2080;
              int v23 = "-[VCControlChannelMultiWay removeAllActiveParticipants]";
              __int16 v24 = 1024;
              int v25 = 535;
              __int16 v26 = 2112;
              __int16 v27 = v9;
              __int16 v28 = 2048;
              unint64_t v29 = self;
              __int16 v30 = 2112;
              unsigned int v31 = v8;
              __int16 v32 = 1024;
              unsigned int v33 = v12;
              uint64_t v13 = v11;
              __int16 v14 = " [%s] %s:%d %@(%p) Removed participant '%@' for sessionID '%d'";
              uint32_t v15 = 64;
LABEL_15:
              _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
              continue;
            }
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v35 objects:v34 count:16];
    }
    while (v4);
  }
  objc_sync_exit(self);
}

- (void)scheduleAfter:(unsigned int)a3 block:(id)a4
{
  v8[5] = *MEMORY[0x1E4F143B8];
  dispatch_time_t v6 = dispatch_time(0, 1000000000 * a3);
  asyncProcessingQueue = self->super._asyncProcessingQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __48__VCControlChannelMultiWay_scheduleAfter_block___block_invoke;
  v8[3] = &unk_1E6DB7500;
  v8[4] = a4;
  dispatch_after(v6, asyncProcessingQueue, v8);
}

uint64_t __48__VCControlChannelMultiWay_scheduleAfter_block___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)updateTransactionIDWithKeyMaterial:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"SecurityLocallyGenerated"), "BOOLValue"))return; {
  if (self->_currentSendMKI)
  }
  {
    if (VCMediaKeyIndex_isEqual((uint64_t)self->_currentSendMKI, [a3 objectForKeyedSubscript:@"SecurityKeyIndex"]))
    {
      return;
    }
    p_transactionID = &self->_transactionID;
    do
    {
      atomic_ullong v6 = *p_transactionID;
      unint64_t v7 = (*p_transactionID & 0xFFFFFFFFFFFF0000) + 0x10000;
      int64_t v8 = *p_transactionID;
      atomic_compare_exchange_strong_explicit(p_transactionID, (unint64_t *)&v8, v7, memory_order_relaxed, memory_order_relaxed);
    }
    while (v8 != v6);
    if ((VCControlChannelMultiWay *)objc_opt_class() != self)
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v9 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        int v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          int v26 = 136316418;
          uint64_t v27 = v24;
          __int16 v28 = 2080;
          unint64_t v29 = "-[VCControlChannelMultiWay updateTransactionIDWithKeyMaterial:]";
          __int16 v30 = 1024;
          int v31 = 568;
          __int16 v32 = 2112;
          unint64_t v33 = (unint64_t)v9;
          __int16 v34 = 2048;
          long long v35 = self;
          __int16 v36 = 2048;
          unint64_t v37 = v7;
          __int16 v18 = " [%s] %s:%d %@(%p) Reset transactionID=%llu";
          __int16 v20 = v25;
          goto LABEL_29;
        }
      }
      return;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      return;
    }
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v26 = 136315906;
    uint64_t v27 = v19;
    __int16 v28 = 2080;
    unint64_t v29 = "-[VCControlChannelMultiWay updateTransactionIDWithKeyMaterial:]";
    __int16 v30 = 1024;
    int v31 = 568;
    __int16 v32 = 2048;
    unint64_t v33 = v7;
    __int16 v18 = " [%s] %s:%d Reset transactionID=%llu";
LABEL_20:
    __int16 v20 = v17;
    uint32_t v21 = 38;
LABEL_30:
    _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v26, v21);
    return;
  }
  unint64_t v10 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"SecurityMaxSequenceNumber"), "unsignedLongLongValue");
  unint64_t v11 = v10;
  unsigned int v12 = &self->_transactionID;
  do
  {
    atomic_ullong v13 = *v12;
    int64_t v14 = *v12;
    atomic_compare_exchange_strong_explicit(v12, (unint64_t *)&v14, v10, memory_order_relaxed, memory_order_relaxed);
  }
  while (v14 != v13);
  if ((VCControlChannelMultiWay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      return;
    }
    uint64_t v16 = VRTraceErrorLogLevelToCSTR();
    uint64_t v17 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      return;
    }
    int v26 = 136315906;
    uint64_t v27 = v16;
    __int16 v28 = 2080;
    unint64_t v29 = "-[VCControlChannelMultiWay updateTransactionIDWithKeyMaterial:]";
    __int16 v30 = 1024;
    int v31 = 556;
    __int16 v32 = 2048;
    unint64_t v33 = v11;
    __int16 v18 = " [%s] %s:%d Initialized transactionID=%llu";
    goto LABEL_20;
  }
  if (objc_opt_respondsToSelector()) {
    uint32_t v15 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
  }
  else {
    uint32_t v15 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v22 = VRTraceErrorLogLevelToCSTR();
    int v23 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v26 = 136316418;
      uint64_t v27 = v22;
      __int16 v28 = 2080;
      unint64_t v29 = "-[VCControlChannelMultiWay updateTransactionIDWithKeyMaterial:]";
      __int16 v30 = 1024;
      int v31 = 556;
      __int16 v32 = 2112;
      unint64_t v33 = (unint64_t)v15;
      __int16 v34 = 2048;
      long long v35 = self;
      __int16 v36 = 2048;
      unint64_t v37 = v11;
      __int16 v18 = " [%s] %s:%d %@(%p) Initialized transactionID=%llu";
      __int16 v20 = v23;
LABEL_29:
      uint32_t v21 = 58;
      goto LABEL_30;
    }
  }
}

- (void)addNewKeyMaterial:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  if (self->_isEncryptionEnabled)
  {
    sequentialKeyMaterialQueue = self->_sequentialKeyMaterialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __46__VCControlChannelMultiWay_addNewKeyMaterial___block_invoke;
    block[3] = &unk_1E6DB3E40;
    block[4] = self;
    block[5] = a3;
    dispatch_async(sequentialKeyMaterialQueue, block);
  }
}

uint64_t __46__VCControlChannelMultiWay_addNewKeyMaterial___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateTransactionIDWithKeyMaterial:*(void *)(a1 + 40)];
  uint64_t v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);

  return [v2 updateEncryptionWithKeyMaterial:v3];
}

- (void)setEncryptionWithEncryptionMaterial:(id *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_isEncryptionEnabled)
  {
    v12[0] = 0;
    v12[1] = v12;
    v12[2] = 0x10810000000;
    v12[3] = "";
    long long v3 = *(_OWORD *)&a3->var2.var2;
    long long v25 = *(_OWORD *)&a3->var2.var1[15];
    long long v26 = v3;
    uint64_t v27 = *(void *)&a3->var5;
    long long v4 = *(_OWORD *)&a3->var2.var0[32];
    long long v21 = *(_OWORD *)&a3->var2.var0[16];
    long long v22 = v4;
    long long v5 = *(_OWORD *)&a3->var2.var0[64];
    long long v23 = *(_OWORD *)&a3->var2.var0[48];
    long long v24 = v5;
    long long v6 = *(_OWORD *)&a3->var0.var1[15];
    long long v17 = *(_OWORD *)&a3->var0.var0[64];
    long long v18 = v6;
    long long v7 = *(_OWORD *)a3->var2.var0;
    long long v19 = *(_OWORD *)&a3->var0.var2;
    long long v20 = v7;
    long long v8 = *(_OWORD *)&a3->var0.var0[16];
    long long v13 = *(_OWORD *)a3->var0.var0;
    long long v14 = v8;
    long long v9 = *(_OWORD *)&a3->var0.var0[48];
    long long v15 = *(_OWORD *)&a3->var0.var0[32];
    long long v16 = v9;
    sequentialKeyMaterialQueue = self->_sequentialKeyMaterialQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __64__VCControlChannelMultiWay_setEncryptionWithEncryptionMaterial___block_invoke;
    v11[3] = &unk_1E6DB3EB8;
    v11[4] = self;
    v11[5] = v12;
    dispatch_async(sequentialKeyMaterialQueue, v11);
    _Block_object_dispose(v12, 8);
  }
}

uint64_t __64__VCControlChannelMultiWay_setEncryptionWithEncryptionMaterial___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateEncryptionWithEncryptionMaterial:*(void *)(*(void *)(a1 + 40) + 8) + 32];
}

- (void)addToSentStats:(int)a3
{
}

- (void)addToReceivedStats:(int)a3
{
}

- (BOOL)isParticipantActive:(unint64_t)a3
{
  objc_sync_enter(self);
  BOOL v5 = -[NSMutableDictionary objectForKeyedSubscript:](self->_activeParticipants, "objectForKeyedSubscript:", [NSNumber numberWithUnsignedLongLong:a3]) != 0;
  objc_sync_exit(self);
  return v5;
}

- (id)lastUsedMKIBytes
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  currentSendMKI = self->_currentSendMKI;
  if (currentSendMKI)
  {
    *(void *)long long v8 = 0;
    *(void *)&_OWORD v8[8] = 0;
    VCMediaKeyIndex_FullKeyBytes(currentSendMKI, v8);
    return (id)[MEMORY[0x1E4F1C9B8] dataWithBytes:v8 length:16];
  }
  else
  {
    if ((VCControlChannelMultiWay *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCControlChannelMultiWay lastUsedMKIBytes]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        BOOL v5 = (__CFString *)[(VCControlChannelMultiWay *)self performSelector:sel_logPrefix];
      }
      else {
        BOOL v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        long long v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long v8 = 136316162;
          *(void *)&v8[4] = v6;
          *(_WORD *)&v8[12] = 2080;
          *(void *)&v8[14] = "-[VCControlChannelMultiWay lastUsedMKIBytes]";
          __int16 v9 = 1024;
          int v10 = 611;
          __int16 v11 = 2112;
          unsigned int v12 = v5;
          __int16 v13 = 2048;
          long long v14 = self;
          _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) currentSendMKI is nil", v8, 0x30u);
        }
      }
    }
    return 0;
  }
}

- (int)protocolVersionforParticipantID:(id)a3
{
  objc_sync_enter(self);
  if (a3)
  {
    BOOL v5 = (void *)[(NSMutableDictionary *)self->_activeParticipants objectForKeyedSubscript:a3];
    if (v5) {
      LODWORD(a3) = [v5 unsignedIntValue];
    }
    else {
      LODWORD(a3) = 0;
    }
  }
  objc_sync_exit(self);
  return (int)a3;
}

- (void)reportSignificantHandshakeDelaySymptomForParticipantID:(id)a3
{
  block[6] = *MEMORY[0x1E4F143B8];
  sequentialKeyMaterialQueue = self->_sequentialKeyMaterialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__VCControlChannelMultiWay_reportSignificantHandshakeDelaySymptomForParticipantID___block_invoke;
  block[3] = &unk_1E6DB3E40;
  block[4] = self;
  block[5] = a3;
  dispatch_async(sequentialKeyMaterialQueue, block);
}

unsigned char *__83__VCControlChannelMultiWay_reportSignificantHandshakeDelaySymptomForParticipantID___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t result = *(unsigned char **)(a1 + 32);
  if (result[268])
  {
    [result reportingAgent];
    uint64_t v3 = *(void *)(a1 + 40);
    long long v4 = @"SymptomReporterOptionalKeyParticipantID";
    v5[0] = v3;
    [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
    return (unsigned char *)reportingSymptom();
  }
  return result;
}

- (unint64_t)nextTransactionID
{
  return atomic_fetch_add_explicit(&self->_transactionID, 1uLL, memory_order_relaxed) + 1;
}

- (void)periodicTask:(void *)a3
{
  double v5 = micro();
  double lastUpdateTimestamp = self->super._lastUpdateTimestamp;
  self->super._double lastUpdateTimestamp = v5;
  double v7 = v5 - lastUpdateTimestamp;
  int add_explicit = atomic_fetch_add_explicit(&self->super._bytesSent, 0, memory_order_relaxed);
  int v9 = add_explicit - self->super._lastProcessedBytesSent;
  self->super._lastProcessedBytesSent = add_explicit;
  if (v7 == 0.0)
  {
    int v13 = 0;
    self->super._double maxSentRate = 0;
  }
  else
  {
    double v10 = (double)v9 / v7;
    double maxSentRate = (double)self->super._maxSentRate;
    if (v10 > maxSentRate) {
      double maxSentRate = (double)v9 / v7;
    }
    self->super._double maxSentRate = (int)maxSentRate;
    int minSentRate = self->super._minSentRate;
    if (v10 > (double)minSentRate) {
      double v10 = (double)minSentRate;
    }
    int v13 = (int)v10;
  }
  self->super._int minSentRate = v13;
  self->super._bytesSentToReport += v9;
  int v14 = atomic_fetch_add_explicit(&self->super._bytesReceived, 0, memory_order_relaxed);
  int v15 = v14 - self->super._lastProcessedBytesReceived;
  self->super._lastProcessedBytesReceived = v14;
  if (v7 == 0.0)
  {
    int v19 = 0;
    self->super._double maxReceivedRate = 0;
  }
  else
  {
    double v16 = (double)v15 / v7;
    double maxReceivedRate = (double)self->super._maxReceivedRate;
    if (v16 > maxReceivedRate) {
      double maxReceivedRate = v16;
    }
    self->super._double maxReceivedRate = (int)maxReceivedRate;
    int minReceivedRate = self->super._minReceivedRate;
    if (v16 > (double)minReceivedRate) {
      double v16 = (double)minReceivedRate;
    }
    int v19 = (int)v16;
  }
  self->super._int minReceivedRate = v19;
  self->super._bytesReceivedToReport += v15;
  if (a3)
  {
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->super._minSentRate), @"CCMinBytesSent");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->super._maxSentRate), @"CCMaxBytesSent");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->super._bytesSentToReport), @"CCRawBytesSent");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->super._minReceivedRate), @"CCMinBytesReceived");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->super._maxReceivedRate), @"CCMaxBytesReceived");
    objc_msgSend(a3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithInt:", self->super._bytesReceivedToReport), @"CCRawBytesReceived");
    [(VCControlChannelMultiWay *)self flushRealTimeReportingStats];
  }
}

- (void)registerPeriodicTask
{
  [(VCObject *)self reportingAgent];

  reportingRegisterPeriodicTaskWeak();
}

uint64_t __48__VCControlChannelMultiWay_registerPeriodicTask__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "periodicTask:");
}

- (void)deregisterPeriodicTask
{
  [(VCObject *)self reportingAgent];

  reportingUnregisterPeriodicTask();
}

- (void)flushRealTimeReportingStats
{
  self->super._int minSentRate = 0x7FFFFFFF;
  self->super._int minReceivedRate = 0x7FFFFFFF;
  self->super._double maxSentRate = 0;
  self->super._double maxReceivedRate = 0;
  self->super._bytesSentToReport = 0;
  self->super._bytesReceivedToReport = 0;
}

- (void)flushReportingStats
{
  self->super._lastProcessedBytesReceived = 0;
  self->super._lastProcessedBytesSent = 0;
  [(VCControlChannelMultiWay *)self flushRealTimeReportingStats];
}

- (unsigned)transportSessionID
{
  return self->_transportSessionID;
}

- (void)setTransportSessionID:(unsigned int)a3
{
  self->_unsigned int transportSessionID = a3;
}

- (int)vfdMessage
{
  return self->_vfdMessage;
}

- (void)setVfdMessage:(int)a3
{
  self->_vfdMessage = a3;
}

- (int)vfdCancel
{
  return self->_vfdCancel;
}

- (void)setVfdCancel:(int)a3
{
  self->_vfdCancel = a3;
}

- (NSMutableDictionary)dialogs
{
  return self->_dialogs;
}

- (BOOL)isEncryptionEnabled
{
  return self->_isEncryptionEnabled;
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)initWithTransportSessionID:reportingAgent:mode:.cold.1()
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  int v4 = 188;
  __int16 v5 = v0;
  int v6 = -1;
  __int16 v7 = v0;
  int v8 = v1;
  _os_log_error_impl(&dword_1E1EA4000, v2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Could not create VTP socket for MW control channel (%08X) for sessionID '%d'", v3, 0x28u);
}

void __33__VCControlChannelMultiWay_start__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to create receiveProc for MW control channel for sessionID='%d'", v2, v3, v4, v5);
}

+ (void)allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d inData must not be NULL", v2, v3, v4, v5, v6);
}

+ (void)allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d vpktFlags must not be NULL", v2, v3, v4, v5, v6);
}

+ (void)allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d channelDataFormat must not be NULL", v2, v3, v4, v5, v6);
}

+ (void)allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Raw data header must not be NULL", v2, v3, v4, v5, v6);
}

+ (void)allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:.cold.5()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create payloadData", v2, v3, v4, v5, v6);
}

+ (void)allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:.cold.6()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCControlChannelMultiWay: receiveProc unrecognized version of control channel messaging protocol '%d'. Ignoring the message...", v2, v3, v4, v5);
}

+ (void)allocPayoadDataFromVTPPacket:vpktFlags:channelDataFormat:.cold.7()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d VCControlChannelMultiWay: receiveProc unrecognized packet type '%d' received", v2, v3, v4, v5);
}

- (void)messageReceived:participantInfo:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create dialog for unknown participantID='%@'");
}

- (void)copyDialogForParticipantID:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d sendMessage: could not find existing dialog for participantID='%@'");
}

- (void)copyDialogForParticipantID:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_6_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d sendMessage: found existing dialog for participantID='%@'");
}

- (void)sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:.cold.1()
{
  OUTLINED_FUNCTION_5();
  *(void *)&void v3[6] = "-[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:]";
  OUTLINED_FUNCTION_3();
  LODWORD(v4) = 413;
  WORD2(v4) = 2048;
  HIWORD(v4) = v0;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Could not create dialog for unknown participantID='%llu'", v2, *(const char **)v3, (unint64_t)"-[VCControlChannelMultiWay sendReliableMessageAndWait:withTopic:participantID:timeout:withOptions:]" >> 16, v4);
}

- (void)sendReliableMessage:withTopic:participantID:timeout:withOptions:completion:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d completion should not be nil", v2, v3, v4, v5, v6);
}

void __74__VCControlChannelMultiWay_sendUnreliableMessage_withTopic_participantID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_8();
  LODWORD(v6) = 468;
  WORD2(v6) = 2048;
  HIWORD(v6) = v0;
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Could not create dialog for unknown participantID='%llu'", v3, v4, v5, v6);
}

- (void)addActiveParticipant:participantUUID:withConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d participantConfig must not be nil", v2, v3, v4, v5, v6);
}

- (void)lastUsedMKIBytes
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d currentSendMKI is nil", v2, v3, v4, v5, v6);
}

@end