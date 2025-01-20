@interface VCTextStreamConfig
- (BOOL)isRedEnabled;
- (BOOL)setupCodecWithClientDictionary:(id)a3;
- (VCTextStreamConfig)initWithClientDictionary:(id)a3;
- (float)txIntervalMin;
- (unsigned)numRedundantPayloads;
- (void)setNumRedundantPayloads:(unsigned __int8)a3;
- (void)setTxIntervalMin:(float)a3;
@end

@implementation VCTextStreamConfig

- (VCTextStreamConfig)initWithClientDictionary:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    __str = 0;
    v5 = objc_opt_class()
       ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String")
       : "<nil>";
    asprintf(&__str, "%s[%p] %s", v5, self, (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String"));
    if (__str)
    {
      __lasts = 0;
      v6 = strtok_r(__str, "\n", &__lasts);
      v7 = (os_log_t *)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          v9 = *v7;
          if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v17 = v8;
            __int16 v18 = 2080;
            v19 = "-[VCTextStreamConfig initWithClientDictionary:]";
            __int16 v20 = 1024;
            int v21 = 20;
            __int16 v22 = 2080;
            v23 = "-[VCTextStreamConfig initWithClientDictionary:]";
            __int16 v24 = 2080;
            v25 = v6;
            _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v6 = strtok_r(0, "\n", &__lasts);
      }
      while (v6);
      free(__str);
    }
  }
  v13.receiver = self;
  v13.super_class = (Class)VCTextStreamConfig;
  v10 = [(VCMediaStreamConfig *)&v13 initWithClientDictionary:a3];
  v11 = v10;
  if (v10 && ![(VCTextStreamConfig *)v10 setupCodecWithClientDictionary:a3])
  {

    return 0;
  }
  return v11;
}

- (BOOL)setupCodecWithClientDictionary:(id)a3
{
  uint64_t v5 = +[VCPayloadUtils payloadForCodecType:](VCPayloadUtils, "payloadForCodecType:", objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTextCodecType"), "integerValue"));
  -[VCMediaStreamConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", v5, objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamRxPayloadType"), "integerValue"));
  -[VCMediaStreamConfig addTxPayloadType:networkPayload:](self, "addTxPayloadType:networkPayload:", v5, objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTxPayloadType"), "integerValue"));
  unsigned __int8 v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTextNumRedundantPayloads"), "integerValue");
  self->_numRedundantPayloads = v6;
  if (v6)
  {
    self->_redEnabled = 1;
    -[VCMediaStreamConfig addTxPayloadType:networkPayload:](self, "addTxPayloadType:networkPayload:", 20, objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTextTxRedPayloadType"), "integerValue"));
  }
  if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTextRxRedPayloadType"), "integerValue"))-[VCMediaStreamConfig addRxPayloadType:networkPayload:](self, "addRxPayloadType:networkPayload:", 20); {
  objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcMediaStreamTextTxIntervalMin"), "floatValue");
  }
  self->_txIntervalMin = v7;
  return 1;
}

- (BOOL)isRedEnabled
{
  return self->_redEnabled;
}

- (unsigned)numRedundantPayloads
{
  return self->_numRedundantPayloads;
}

- (void)setNumRedundantPayloads:(unsigned __int8)a3
{
  self->_numRedundantPayloads = a3;
}

- (float)txIntervalMin
{
  return self->_txIntervalMin;
}

- (void)setTxIntervalMin:(float)a3
{
  self->_txIntervalMin = a3;
}

@end