@interface VCMediaNegotiatorVideoConfiguration
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualFeatureStrings:(id)a3;
- (NSDictionary)videoFeatureStrings;
- (NSDictionary)videoFeatureStringsFixedPosition;
- (VCVideoRuleCollections)videoRuleCollections;
- (id)copyWithZone:(_NSZone *)a3;
- (void)dealloc;
- (void)setVideoFeatureStrings:(id)a3;
- (void)setVideoFeatureStringsFixedPosition:(id)a3;
- (void)setVideoRuleCollections:(id)a3;
@end

@implementation VCMediaNegotiatorVideoConfiguration

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCMediaNegotiatorVideoConfiguration;
  [(VCMediaNegotiatorVideoConfiguration *)&v3 dealloc];
}

- (BOOL)isEqualFeatureStrings:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    if (v5)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      objc_msgSend(v5, "addObjectsFromArray:", -[VCVideoRuleCollections supportedPayloads](self->_videoRuleCollections, "supportedPayloads"));
      objc_msgSend(v6, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "videoRuleCollections"), "supportedPayloads"));
      uint64_t v7 = [v6 count];
      if (v7 == [v5 count])
      {
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        uint64_t v8 = [v5 countByEnumeratingWithState:&v19 objects:v18 count:16];
        if (v8)
        {
          uint64_t v9 = v8;
          uint64_t v10 = *(void *)v20;
          while (2)
          {
            for (uint64_t i = 0; i != v9; ++i)
            {
              if (*(void *)v20 != v10) {
                objc_enumerationMutation(v5);
              }
              uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
              if (([v6 containsObject:v12] & 1) == 0)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCMediaNegotiatorVideoConfiguration isEqualFeatureStrings:].cold.5();
                  }
                }
                goto LABEL_29;
              }
              id v13 = [(NSDictionary *)self->_videoFeatureStrings objectForKeyedSubscript:v12];
              if (!v13)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCMediaNegotiatorVideoConfiguration isEqualFeatureStrings:]();
                  }
                }
                goto LABEL_29;
              }
              v14 = v13;
              uint64_t v15 = objc_msgSend((id)objc_msgSend(a3, "videoFeatureStrings"), "objectForKeyedSubscript:", v12);
              if (!v15)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCMediaNegotiatorVideoConfiguration isEqualFeatureStrings:]();
                  }
                }
                goto LABEL_29;
              }
              if (([v14 isEqualToString:v15] & 1) == 0)
              {
                if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
                {
                  VRTraceErrorLogLevelToCSTR();
                  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
                    -[VCMediaNegotiatorVideoConfiguration isEqualFeatureStrings:].cold.4();
                  }
                }
                goto LABEL_29;
              }
            }
            uint64_t v9 = [v5 countByEnumeratingWithState:&v19 objects:v18 count:16];
            if (v9) {
              continue;
            }
            break;
          }
        }
        BOOL v16 = 1;
        goto LABEL_30;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiatorVideoConfiguration isEqualFeatureStrings:].cold.6();
        }
      }
    }
    else
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaNegotiatorVideoConfiguration isEqualFeatureStrings:]();
        }
      }
      id v6 = 0;
    }
LABEL_29:
    BOOL v16 = 0;
LABEL_30:

    return v16;
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)VCMediaNegotiatorVideoConfiguration;
  BOOL v5 = -[VCMediaNegotiatorCommonConfiguration isEqual:](&v7, sel_isEqual_);
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      BOOL v5 = -[VCVideoRuleCollections isEqual:](self->_videoRuleCollections, "isEqual:", [a3 videoRuleCollections]);
      if (v5) {
        LOBYTE(v5) = [(VCMediaNegotiatorVideoConfiguration *)self isEqualFeatureStrings:a3];
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v13.receiver = self;
  v13.super_class = (Class)VCMediaNegotiatorVideoConfiguration;
  id v5 = -[VCMediaNegotiatorCommonConfiguration copyWithZone:](&v13, sel_copyWithZone_);
  if (v5)
  {
    id v6 = [(VCVideoRuleCollections *)self->_videoRuleCollections copyWithZone:a3];
    [v5 setVideoRuleCollections:v6];

    objc_super v7 = (void *)[(NSDictionary *)self->_videoFeatureStrings mutableCopyWithZone:a3];
    [v5 setVideoFeatureStrings:v7];

    uint64_t v8 = (void *)[(NSDictionary *)self->_videoFeatureStringsFixedPosition mutableCopyWithZone:a3];
    [v5 setVideoFeatureStringsFixedPosition:v8];
  }
  else if ((VCMediaNegotiatorVideoConfiguration *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCMediaNegotiatorVideoConfiguration copyWithZone:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[(VCMediaNegotiatorVideoConfiguration *)self performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      uint64_t v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v15 = v11;
        __int16 v16 = 2080;
        v17 = "-[VCMediaNegotiatorVideoConfiguration copyWithZone:]";
        __int16 v18 = 1024;
        int v19 = 82;
        __int16 v20 = 2112;
        long long v21 = v10;
        __int16 v22 = 2048;
        uint64_t v23 = self;
        _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to copy self", buf, 0x30u);
      }
    }
  }
  return v5;
}

- (VCVideoRuleCollections)videoRuleCollections
{
  return self->_videoRuleCollections;
}

- (void)setVideoRuleCollections:(id)a3
{
}

- (NSDictionary)videoFeatureStrings
{
  return self->_videoFeatureStrings;
}

- (void)setVideoFeatureStrings:(id)a3
{
}

- (NSDictionary)videoFeatureStringsFixedPosition
{
  return self->_videoFeatureStringsFixedPosition;
}

- (void)setVideoFeatureStringsFixedPosition:(id)a3
{
}

- (void)isEqualFeatureStrings:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to allocate payload set", v2, v3, v4, v5, v6);
}

- (void)isEqualFeatureStrings:.cold.2()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_7(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Feature string not found for payload: %d", v3, v4, v5, v6, v7);
}

- (void)isEqualFeatureStrings:.cold.3()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_7(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Compare feature string not found for payload: %d", v3, v4, v5, v6, v7);
}

- (void)isEqualFeatureStrings:.cold.4()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_7(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Feature strings not identical for payload: %d", v3, v4, v5, v6, v7);
}

- (void)isEqualFeatureStrings:.cold.5()
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_7_7(v0, *MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_10();
  OUTLINED_FUNCTION_8_5(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Missing payload: %d", v3, v4, v5, v6, v7);
}

- (void)isEqualFeatureStrings:.cold.6()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Payload cound is not identical", v2, v3, v4, v5, v6);
}

- (void)copyWithZone:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to copy self", v2, v3, v4, v5, v6);
}

@end