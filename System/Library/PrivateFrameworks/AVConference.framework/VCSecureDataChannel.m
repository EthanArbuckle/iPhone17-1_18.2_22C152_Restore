@interface VCSecureDataChannel
- (VCSecureDataChannel)initWithLocalCallID:(unsigned int)a3 remoteCallID:(unsigned int)a4 isCaller:(BOOL)a5 sharedSecret:(id)a6 error:(id *)a7;
- (VCSecureDataChannelDelegate)delegate;
- (int)convertData:(id)a3 toEncryptedData:(id *)a4 encrypted:(BOOL)a5;
- (int)convertEncryptedData:(id)a3 toData:(id *)a4 encrypted:(BOOL)a5;
- (int)sendData:(id)a3 messageType:(unsigned int)a4 encrypted:(BOOL)a5;
- (int)setupWithSharedSecret:(id)a3 isCaller:(BOOL)a4 error:(id *)a5;
- (int64_t)maxEncryptedDataSize;
- (int64_t)maxUnencryptedDataSize;
- (unint64_t)maxUDPPayloadSize;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setMaxUDPPayloadSize:(unint64_t)a3;
@end

@implementation VCSecureDataChannel

- (VCSecureDataChannel)initWithLocalCallID:(unsigned int)a3 remoteCallID:(unsigned int)a4 isCaller:(BOOL)a5 sharedSecret:(id)a6 error:(id *)a7
{
  BOOL v9 = a5;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  v38.receiver = self;
  v38.super_class = (Class)VCSecureDataChannel;
  v12 = [(VCSecureDataChannel *)&v38 init];
  v13 = v12;
  if (!v12) {
    return v13;
  }
  v12->_localCallID = a3;
  v12->_remoteCallID = a4;
  v12->_maxUDPPayloadSize = (int)VCMaxUDPPayloadSize(1280, 1);
  if ([(VCSecureDataChannel *)v13 setupWithSharedSecret:a6 isCaller:v9 error:a7] < 0)
  {

    return 0;
  }
  uint64_t v14 = [MEMORY[0x1E4F47A30] weakObjectHolderWithObject:v13];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __84__VCSecureDataChannel_initWithLocalCallID_remoteCallID_isCaller_sharedSecret_error___block_invoke;
  v37[3] = &unk_1E6DB8F58;
  v37[4] = v14;
  v15 = +[VCTransport sharedInstance];
  v13->_transport = v15;
  [(VCTransport *)v15 registerDataReceivedHandler:v37 forCallID:v13->_localCallID];
  if (v13->tlsRecord)
  {
    if ((VCSecureDataChannel *)objc_opt_class() == v13)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v17 = VRTraceErrorLogLevelToCSTR();
        v18 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = [(VCSecureDataChannel *)v13 maxEncryptedDataSize];
          *(_DWORD *)buf = 136315906;
          uint64_t v40 = v17;
          __int16 v41 = 2080;
          v42 = "-[VCSecureDataChannel initWithLocalCallID:remoteCallID:isCaller:sharedSecret:error:]";
          __int16 v43 = 1024;
          int v44 = 74;
          __int16 v45 = 2048;
          uint64_t v46 = v19;
          v20 = " [%s] %s:%d maxEncryptedDataSize = %ld";
          v21 = v18;
          uint32_t v22 = 38;
LABEL_15:
          _os_log_impl(&dword_1E1EA4000, v21, OS_LOG_TYPE_DEFAULT, v20, buf, v22);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v16 = (__CFString *)[(VCSecureDataChannel *)v13 performSelector:sel_logPrefix];
      }
      else {
        v16 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
      {
        uint64_t v23 = VRTraceErrorLogLevelToCSTR();
        v24 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v25 = [(VCSecureDataChannel *)v13 maxEncryptedDataSize];
          *(_DWORD *)buf = 136316418;
          uint64_t v40 = v23;
          __int16 v41 = 2080;
          v42 = "-[VCSecureDataChannel initWithLocalCallID:remoteCallID:isCaller:sharedSecret:error:]";
          __int16 v43 = 1024;
          int v44 = 74;
          __int16 v45 = 2112;
          uint64_t v46 = (uint64_t)v16;
          __int16 v47 = 2048;
          v48 = v13;
          __int16 v49 = 2048;
          uint64_t v50 = v25;
          v20 = " [%s] %s:%d %@(%p) maxEncryptedDataSize = %ld";
          v21 = v24;
          uint32_t v22 = 58;
          goto LABEL_15;
        }
      }
    }
  }
  if ((VCSecureDataChannel *)objc_opt_class() == v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      v28 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v29 = [(VCSecureDataChannel *)v13 maxUnencryptedDataSize];
        *(_DWORD *)buf = 136315906;
        uint64_t v40 = v27;
        __int16 v41 = 2080;
        v42 = "-[VCSecureDataChannel initWithLocalCallID:remoteCallID:isCaller:sharedSecret:error:]";
        __int16 v43 = 1024;
        int v44 = 76;
        __int16 v45 = 2048;
        uint64_t v46 = v29;
        v30 = " [%s] %s:%d maxUnencryptedDataSize = %ld";
        v31 = v28;
        uint32_t v32 = 38;
LABEL_26:
        _os_log_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v26 = (__CFString *)[(VCSecureDataChannel *)v13 performSelector:sel_logPrefix];
    }
    else {
      v26 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v33 = VRTraceErrorLogLevelToCSTR();
      v34 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v35 = [(VCSecureDataChannel *)v13 maxUnencryptedDataSize];
        *(_DWORD *)buf = 136316418;
        uint64_t v40 = v33;
        __int16 v41 = 2080;
        v42 = "-[VCSecureDataChannel initWithLocalCallID:remoteCallID:isCaller:sharedSecret:error:]";
        __int16 v43 = 1024;
        int v44 = 76;
        __int16 v45 = 2112;
        uint64_t v46 = (uint64_t)v26;
        __int16 v47 = 2048;
        v48 = v13;
        __int16 v49 = 2048;
        uint64_t v50 = v35;
        v30 = " [%s] %s:%d %@(%p) maxUnencryptedDataSize = %ld";
        v31 = v34;
        uint32_t v32 = 58;
        goto LABEL_26;
      }
    }
  }
  return v13;
}

void __84__VCSecureDataChannel_initWithLocalCallID_remoteCallID_isCaller_sharedSecret_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v7 = (void *)[*(id *)(a1 + 32) strong];
  id v13 = 0;
  if (v7)
  {
    v8 = v7;
    if (a4 == 2)
    {
      uint64_t v9 = 1;
LABEL_6:
      if (([v7 convertEncryptedData:a2 toData:&v13 encrypted:a3] & 0x80000000) != 0)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            __84__VCSecureDataChannel_initWithLocalCallID_remoteCallID_isCaller_sharedSecret_error___block_invoke_cold_2();
          }
        }
      }
      else
      {
        v10 = (void *)[v8 delegate];
        [v10 vcSecureDataChannel:v8 messageType:v9 receivedData:v13];
      }
      goto LABEL_11;
    }
    if (a4 == 6)
    {
      uint64_t v9 = 2;
      goto LABEL_6;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __84__VCSecureDataChannel_initWithLocalCallID_remoteCallID_isCaller_sharedSecret_error___block_invoke_cold_1();
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v15 = v11;
      __int16 v16 = 2080;
      uint64_t v17 = "-[VCSecureDataChannel initWithLocalCallID:remoteCallID:isCaller:sharedSecret:error:]_block_invoke";
      __int16 v18 = 1024;
      int v19 = 57;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Packet handler called after secure data channel was released!", buf, 0x1Cu);
    }
  }
LABEL_11:
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  objc_storeWeak(&self->_delegate, 0);
  [(VCTransport *)self->_transport registerDataReceivedHandler:0 forCallID:self->_localCallID];

  if (self->tlsRecord) {
    tls_record_destroy();
  }
  v3.receiver = self;
  v3.super_class = (Class)VCSecureDataChannel;
  [(VCSecureDataChannel *)&v3 dealloc];
}

- (int)setupWithSharedSecret:(id)a3 isCaller:(BOOL)a4 error:(id *)a5
{
  if (a3)
  {
    if ((unint64_t)[a3 length] <= 0x9F)
    {
      int v8 = -2144993279;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSecureDataChannel setupWithSharedSecret:isCaller:error:](v9, a3, v10);
        }
      }
      goto LABEL_20;
    }
    ccDRBGGetRngState();
    self->tlsRecord = (_tls_record_s *)tls_record_create();
    tls_record_set_protocol_version();
    [a3 bytes];
    [a3 length];
    if (tls_record_init_pending_ciphers())
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSecureDataChannel setupWithSharedSecret:isCaller:error:].cold.4();
        }
      }
LABEL_19:
      tls_record_destroy();
      self->tlsRecord = 0;
      int v8 = -2144993228;
LABEL_20:
      +[GKVoiceChatError getNSError:a5 code:32024 detailedCode:800 returnCode:v8 filePath:0 description:@"Could not setup secure data channel" reason:0];
      return v8;
    }
    if (tls_record_advance_read_cipher())
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSecureDataChannel setupWithSharedSecret:isCaller:error:]();
        }
      }
      goto LABEL_19;
    }
    int v8 = tls_record_advance_write_cipher();
    if (v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSecureDataChannel setupWithSharedSecret:isCaller:error:]();
        }
      }
      goto LABEL_19;
    }
  }
  else
  {
    int v8 = 0;
    self->tlsRecord = 0;
  }
  return v8;
}

- (int)sendData:(id)a3 messageType:(unsigned int)a4 encrypted:(BOOL)a5
{
  BOOL v5 = a5;
  v23[1] = *(id *)MEMORY[0x1E4F143B8];
  v23[0] = 0;
  if (a5) {
    unint64_t v9 = [(VCSecureDataChannel *)self maxEncryptedDataSize];
  }
  else {
    unint64_t v9 = [(VCSecureDataChannel *)self maxUnencryptedDataSize];
  }
  if ([a3 length] > v9)
  {
    int v19 = -2144993277;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v21 = VRTraceErrorLogLevelToCSTR();
      uint32_t v22 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSecureDataChannel sendData:messageType:encrypted:](v21, a3, v22);
      }
    }
  }
  else
  {
    int v10 = [(VCSecureDataChannel *)self convertData:a3 toEncryptedData:v23 encrypted:v5];
    if (v10 < 0)
    {
      int v19 = v10;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCSecureDataChannel sendData:messageType:encrypted:]();
        }
      }
    }
    else
    {
      if (a4 == 1)
      {
        uint64_t v17 = 2;
        goto LABEL_12;
      }
      if (a4 == 2)
      {
        uint64_t v17 = 6;
        goto LABEL_12;
      }
      int v18 = VCSignalErrorAt(2149974017, "Signalled error at %s: Invalid message type %d", v11, v12, v13, v14, v15, v16, (char)"getOFTTypeForSecureDataMessageType");
      if ((v18 & 0x80000000) == 0)
      {
        uint64_t v17 = 0;
LABEL_12:
        int v19 = [(VCTransport *)self->_transport sendData:v23[0] localCallID:self->_localCallID remoteCallID:self->_remoteCallID encrypted:v5 OFTType:v17];
        if (!v19) {
          goto LABEL_16;
        }
        goto LABEL_13;
      }
      int v19 = v18;
    }
  }
LABEL_13:
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    VRTraceErrorLogLevelToCSTR();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      -[VCSecureDataChannel sendData:messageType:encrypted:]();
    }
  }
LABEL_16:

  return v19;
}

- (int)convertEncryptedData:(id)a3 toData:(id *)a4 encrypted:(BOOL)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  memset(v15, 170, sizeof(v15));
  if (a3 && a4)
  {
    if (!a5)
    {
      int v8 = 0;
      *a4 = a3;
      return v8;
    }
    if (self->tlsRecord)
    {
      [a3 length];
      [a3 bytes];
      *(void *)&v15[1] = tls_record_decrypted_size();
      v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:*(void *)&v15[1]];
      *(void *)&v15[9] = [v7 bytes];
      if (tls_record_decrypt())
      {
        int v8 = -2144993228;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSecureDataChannel convertEncryptedData:toData:encrypted:]();
          }
        }
      }
      else if (v15[0] == 23)
      {
        [v7 setLength:*(void *)&v15[1]];
        int v8 = 0;
        *a4 = v7;
      }
      else
      {
        int v8 = -2144993228;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v13 = VRTraceErrorLogLevelToCSTR();
          uint64_t v14 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCSecureDataChannel convertEncryptedData:toData:encrypted:](v13, (uint64_t)v15, v14);
          }
        }
      }
      goto LABEL_8;
    }
    int v8 = -2144993228;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v12 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSecureDataChannel convertEncryptedData:toData:encrypted:](v12);
      }
    }
  }
  else
  {
    int v8 = -2144993279;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
    {
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        uint64_t v17 = v10;
        __int16 v18 = 2080;
        int v19 = "-[VCSecureDataChannel convertEncryptedData:toData:encrypted:]";
        __int16 v20 = 1024;
        int v21 = 189;
        __int16 v22 = 2080;
        uint64_t v23 = "-[VCSecureDataChannel convertEncryptedData:toData:encrypted:]";
        _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Invalid encrypted data passed to %s.", buf, 0x26u);
      }
    }
  }
  v7 = 0;
LABEL_8:

  return v8;
}

- (int)convertData:(id)a3 toEncryptedData:(id *)a4 encrypted:(BOOL)a5
{
  if (a3 && a4)
  {
    if (!a5)
    {
      int v7 = 0;
      *a4 = a3;
      return v7;
    }
    int v7 = -2144993228;
    if (self->tlsRecord)
    {
      [a3 bytes];
      [a3 length];
      int v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:tls_record_encrypted_size()];
      unint64_t v9 = v8;
      if (v8)
      {
        [v8 bytes];
        if (!tls_record_encrypt())
        {
          int v7 = 0;
          *a4 = v9;
        }
      }
      else
      {
        int v7 = -2144993277;
      }
      goto LABEL_8;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSecureDataChannel convertData:toEncryptedData:encrypted:](v11);
      }
    }
  }
  else
  {
    int v7 = -2144993279;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCSecureDataChannel convertData:toEncryptedData:encrypted:]();
      }
    }
  }
  unint64_t v9 = 0;
LABEL_8:

  return v7;
}

- (void)setDelegate:(id)a3
{
}

- (VCSecureDataChannelDelegate)delegate
{
  return (VCSecureDataChannelDelegate *)objc_loadWeak(&self->_delegate);
}

- (int64_t)maxEncryptedDataSize
{
  int64_t v2 = [(VCSecureDataChannel *)self maxUnencryptedDataSize];
  return v2 - tls_record_encrypted_size();
}

- (int64_t)maxUnencryptedDataSize
{
  return self->_maxUDPPayloadSize - 10;
}

- (unint64_t)maxUDPPayloadSize
{
  return self->_maxUDPPayloadSize;
}

- (void)setMaxUDPPayloadSize:(unint64_t)a3
{
  self->_maxUDPPayloadSize = a3;
}

void __84__VCSecureDataChannel_initWithLocalCallID_remoteCallID_isCaller_sharedSecret_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Invalid OFT Type %d", v2, v3, v4, v5);
}

void __84__VCSecureDataChannel_initWithLocalCallID_remoteCallID_isCaller_sharedSecret_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to decrypt the data. (%X)", v2, v3, v4, v5);
}

- (void)setupWithSharedSecret:(uint64_t)a1 isCaller:(void *)a2 error:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [a2 length];
  int v8 = 136316418;
  uint64_t v9 = a1;
  __int16 v10 = 2080;
  OUTLINED_FUNCTION_3_0();
  int v11 = 105;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = v6;
  int v15 = 160;
  __int16 v16 = v6;
  int v17 = v7;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d sharedSecret (%p) invalid: requiredSize = %d, passedSize = %d", (uint8_t *)&v8, 0x32u);
}

- (void)setupWithSharedSecret:isCaller:error:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d tls_record_advance_write_cipher failed with error 0x%X", v2, v3, v4, v5);
}

- (void)setupWithSharedSecret:isCaller:error:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d tls_record_advance_read_cipher failed with error 0x%X", v2, v3, v4, v5);
}

- (void)setupWithSharedSecret:isCaller:error:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d tls_record_init_pending_ciphers failed with error 0x%X", v2, v3, v4, v5);
}

- (void)sendData:messageType:encrypted:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed with status: %X", v2, v3, v4, v5);
}

- (void)sendData:(uint64_t)a1 messageType:(void *)a2 encrypted:(NSObject *)a3 .cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [a2 length];
  int v7 = 136315906;
  uint64_t v8 = a1;
  __int16 v9 = 2080;
  OUTLINED_FUNCTION_3_0();
  int v10 = 163;
  __int16 v11 = v5;
  int v12 = v6;
  _os_log_error_impl(&dword_1E1EA4000, a3, OS_LOG_TYPE_ERROR, " [%s] %s:%d Data is too large (%d)", (uint8_t *)&v7, 0x22u);
}

- (void)sendData:messageType:encrypted:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to encrypt the client data (%X)", v2, v3, v4, v5);
}

- (void)convertEncryptedData:(uint64_t)a1 toData:encrypted:.cold.1(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 195;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d need sharedSecret for encrypted data", (uint8_t *)&v2, 0x1Cu);
}

- (void)convertEncryptedData:(uint64_t)a1 toData:(uint64_t)a2 encrypted:(NSObject *)a3 .cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 136315906;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2080;
  *(void *)&v3[14] = "-[VCSecureDataChannel convertEncryptedData:toData:encrypted:]";
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, a2, a3, " [%s] %s:%d tls_record_decrypt returned contentType = %d != tls_record_type_AppData", *(const char **)v3, *(const char **)&v3[8], (unint64_t)"-[VCSecureDataChannel convertEncryptedData:toData:encrypted:]" >> 16, 207);
}

- (void)convertEncryptedData:toData:encrypted:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d tls_record_decrypt failed with error 0x%X", v2, v3, v4, v5);
}

- (void)convertData:toEncryptedData:encrypted:.cold.1()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  uint64_t v3 = "-[VCSecureDataChannel convertData:toEncryptedData:encrypted:]";
  __int16 v4 = 1024;
  int v5 = 222;
  __int16 v6 = v0;
  int v7 = "-[VCSecureDataChannel convertData:toEncryptedData:encrypted:]";
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d Invalid secure data passed to %s.", v2, 0x26u);
}

- (void)convertData:(uint64_t)a1 toEncryptedData:encrypted:.cold.2(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_0();
  int v4 = 228;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, " [%s] %s:%d need sharedSecret for encrypted data", (uint8_t *)&v2, 0x1Cu);
}

@end