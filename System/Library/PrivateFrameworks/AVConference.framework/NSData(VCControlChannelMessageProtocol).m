@interface NSData(VCControlChannelMessageProtocol)
- (BOOL)VCCCGetBytes:()VCControlChannelMessageProtocol size:;
- (__CFString)VCCCPayloadKey;
@end

@implementation NSData(VCControlChannelMessageProtocol)

- (BOOL)VCCCGetBytes:()VCControlChannelMessageProtocol size:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  unint64_t v7 = [(__CFString *)a1 VCCCLength];
  if (a4 >= v7)
  {
    [(__CFString *)a1 getBytes:a3 length:a4];
    if (a4 > v7) {
      bzero((void *)(a3 + v7), a4 - v7);
    }
    return a4 >= v7;
  }
  if ((__CFString *)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return a4 >= v7;
    }
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return a4 >= v7;
    }
    int v17 = 136316418;
    uint64_t v18 = v9;
    __int16 v19 = 2080;
    v20 = "-[NSData(VCControlChannelMessageProtocol) VCCCGetBytes:size:]";
    __int16 v21 = 1024;
    int v22 = 26;
    __int16 v23 = 2112;
    v24 = a1;
    __int16 v25 = 1024;
    *(_DWORD *)v26 = [(__CFString *)a1 VCCCLength];
    *(_WORD *)&v26[4] = 1024;
    *(_DWORD *)&v26[6] = a4;
    v11 = " [%s] %s:%d message '%@' is too long for given buffer (%d > %d)";
    v12 = v10;
    uint32_t v13 = 50;
LABEL_15:
    _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v17, v13);
    return a4 >= v7;
  }
  if (objc_opt_respondsToSelector()) {
    v8 = (__CFString *)[(__CFString *)a1 performSelector:sel_logPrefix];
  }
  else {
    v8 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v14 = VRTraceErrorLogLevelToCSTR();
    v15 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
    {
      int v17 = 136316930;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      v20 = "-[NSData(VCControlChannelMessageProtocol) VCCCGetBytes:size:]";
      __int16 v21 = 1024;
      int v22 = 26;
      __int16 v23 = 2112;
      v24 = v8;
      __int16 v25 = 2048;
      *(void *)v26 = a1;
      *(_WORD *)&v26[8] = 2112;
      v27 = a1;
      __int16 v28 = 1024;
      int v29 = [(__CFString *)a1 VCCCLength];
      __int16 v30 = 1024;
      unsigned int v31 = a4;
      v11 = " [%s] %s:%d %@(%p) message '%@' is too long for given buffer (%d > %d)";
      v12 = v15;
      uint32_t v13 = 70;
      goto LABEL_15;
    }
  }
  return a4 >= v7;
}

- (__CFString)VCCCPayloadKey
{
  return @"EncryptedData";
}

@end