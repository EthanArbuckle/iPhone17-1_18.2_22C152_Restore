@interface AVCTextStreamConfig
+ (int64_t)clientCodecTypeWithCodecType:(int64_t)a3;
+ (int64_t)codecTypeWithClientCodecType:(int64_t)a3;
- (BOOL)isRedValid;
- (BOOL)isValid;
- (float)txIntervalMin;
- (id)dictionary;
- (int64_t)codecType;
- (unint64_t)numRedundantPayloads;
- (unint64_t)rxRedPayloadType;
- (unint64_t)txRedPayloadType;
- (void)setCodecType:(int64_t)a3;
- (void)setNumRedundantPayloads:(unint64_t)a3;
- (void)setRxRedPayloadType:(unint64_t)a3;
- (void)setTxIntervalMin:(float)a3;
- (void)setTxRedPayloadType:(unint64_t)a3;
- (void)setUpWithDictionary:(id)a3;
@end

@implementation AVCTextStreamConfig

- (BOOL)isValid
{
  if ([(AVCTextStreamConfig *)self codecType]) {
    return 0;
  }

  return [(AVCTextStreamConfig *)self isRedValid];
}

+ (int64_t)codecTypeWithClientCodecType:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 200;
  }
  int v3 = a3;
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        +[AVCTextStreamConfig codecTypeWithClientCodecType:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v9 = 136316418;
        uint64_t v10 = v7;
        __int16 v11 = 2080;
        v12 = "+[AVCTextStreamConfig codecTypeWithClientCodecType:]";
        __int16 v13 = 1024;
        int v14 = 1408;
        __int16 v15 = 2112;
        v16 = v5;
        __int16 v17 = 2048;
        id v18 = a1;
        __int16 v19 = 1024;
        int v20 = v3;
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unexpected codec type: %d", (uint8_t *)&v9, 0x36u);
      }
    }
  }
  return 0;
}

+ (int64_t)clientCodecTypeWithCodecType:(int64_t)a3
{
  return 0;
}

- (BOOL)isRedValid
{
  if (![(AVCTextStreamConfig *)self numRedundantPayloads]) {
    return 1;
  }
  if ([(AVCTextStreamConfig *)self txRedPayloadType] > 0x7F
    || [(AVCTextStreamConfig *)self txRedPayloadType] < 0x60
    || [(AVCTextStreamConfig *)self rxRedPayloadType] > 0x7F
    || [(AVCTextStreamConfig *)self rxRedPayloadType] < 0x60)
  {
    return 0;
  }
  return self->_numRedundantPayloads < 4;
}

- (void)setUpWithDictionary:(id)a3
{
  self->_codecType = +[AVCTextStreamConfig clientCodecTypeWithCodecType:](AVCTextStreamConfig, "clientCodecTypeWithCodecType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTextCodecType"), "integerValue"));
  self->_numRedundantPayloads = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTextNumRedundantPayloads"), "integerValue");
  self->_txRedPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTextTxRedPayloadType"), "integerValue");
  self->_rxRedPayloadType = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTextRxRedPayloadType"), "integerValue");
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTextTxIntervalMin"), "floatValue");
  self->_txIntervalMin = v5;
}

- (id)dictionary
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v5[0] = @"vcMediaStreamTextCodecType";
  v6[0] = objc_msgSend(NSNumber, "numberWithInteger:", +[AVCTextStreamConfig codecTypeWithClientCodecType:](AVCTextStreamConfig, "codecTypeWithClientCodecType:", self->_codecType));
  v5[1] = @"vcMediaStreamTextNumRedundantPayloads";
  v6[1] = [NSNumber numberWithUnsignedInteger:self->_numRedundantPayloads];
  v5[2] = @"vcMediaStreamTextTxRedPayloadType";
  v6[2] = [NSNumber numberWithUnsignedInteger:self->_txRedPayloadType];
  v5[3] = @"vcMediaStreamTextRxRedPayloadType";
  v6[3] = [NSNumber numberWithUnsignedInteger:self->_rxRedPayloadType];
  v5[4] = @"vcMediaStreamTextTxIntervalMin";
  *(float *)&double v3 = self->_txIntervalMin;
  v6[4] = [NSNumber numberWithFloat:v3];
  return (id)[MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:5];
}

- (int64_t)codecType
{
  return self->_codecType;
}

- (void)setCodecType:(int64_t)a3
{
  self->_codecType = a3;
}

- (unint64_t)numRedundantPayloads
{
  return self->_numRedundantPayloads;
}

- (void)setNumRedundantPayloads:(unint64_t)a3
{
  self->_numRedundantPayloads = a3;
}

- (unint64_t)txRedPayloadType
{
  return self->_txRedPayloadType;
}

- (void)setTxRedPayloadType:(unint64_t)a3
{
  self->_txRedPayloadType = a3;
}

- (unint64_t)rxRedPayloadType
{
  return self->_rxRedPayloadType;
}

- (void)setRxRedPayloadType:(unint64_t)a3
{
  self->_rxRedPayloadType = a3;
}

- (float)txIntervalMin
{
  return self->_txIntervalMin;
}

- (void)setTxIntervalMin:(float)a3
{
  self->_txIntervalMin = a3;
}

+ (void)codecTypeWithClientCodecType:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Unexpected codec type: %d", v2, v3, v4, 1408);
}

@end