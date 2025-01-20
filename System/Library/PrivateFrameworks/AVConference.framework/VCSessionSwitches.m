@interface VCSessionSwitches
+ (float)generateRandomNumberWithConversationID:(id)a3 featureString:(id)a4;
+ (id)featureFlagAndDefaultNameForFeature:(unint64_t)a3;
- (BOOL)isFeatureEnabled:(unint64_t)a3;
- (BOOL)trialEnablementWithClient:(id)a3 Context:(id *)a4 normalizedRandom:(double)a5;
- (VCSessionSwitches)initWithConversationID:(id)a3;
- (unint64_t)switches;
- (void)dealloc;
- (void)setFeature:(unint64_t)a3 isEnabled:(BOOL)a4;
@end

@implementation VCSessionSwitches

- (VCSessionSwitches)initWithConversationID:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)VCSessionSwitches;
  v4 = [(VCSessionSwitches *)&v36 init];
  if (!v4) {
    return v4;
  }
  v4->_conversationID = (NSString *)objc_msgSend((id)objc_msgSend(a3, "UUIDString"), "copy");
  uint64_t v5 = [MEMORY[0x1E4FB0098] clientWithIdentifier:310];
  uint64_t v6 = 0;
  *(void *)&long long v7 = 136315906;
  long long v35 = v7;
  do
  {
    v8 = &contextConfigurations[v6];
    [(__CFString *)contextConfigurations[v6 + 1] UTF8String];
    if (_os_feature_enabled_impl()) {
      goto LABEL_14;
    }
    if ((VCSessionSwitches *)objc_opt_class() == v4)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          v18 = v8[1];
          *(_DWORD *)buf = v35;
          uint64_t v38 = v16;
          __int16 v39 = 2080;
          v40 = "-[VCSessionSwitches initWithConversationID:]";
          __int16 v41 = 1024;
          int v42 = 77;
          __int16 v43 = 2112;
          v44 = v18;
          v13 = v17;
          v14 = " [%s] %s:%d ! featureflag=%@ is NOT enabled, examine if VCSessionSwitchContext contextConfigrations is setup properly!";
          uint32_t v15 = 38;
          goto LABEL_13;
        }
      }
    }
    else
    {
      v9 = &stru_1F3D3E450;
      if (objc_opt_respondsToSelector()) {
        v9 = (__CFString *)[(VCSessionSwitches *)v4 performSelector:sel_logPrefix];
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
      {
        uint64_t v10 = VRTraceErrorLogLevelToCSTR();
        v11 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          v12 = v8[1];
          *(_DWORD *)buf = 136316418;
          uint64_t v38 = v10;
          __int16 v39 = 2080;
          v40 = "-[VCSessionSwitches initWithConversationID:]";
          __int16 v41 = 1024;
          int v42 = 77;
          __int16 v43 = 2112;
          v44 = v9;
          __int16 v45 = 2048;
          v46 = v4;
          __int16 v47 = 2112;
          uint64_t v48 = (uint64_t)v12;
          v13 = v11;
          v14 = " [%s] %s:%d %@(%p) ! featureflag=%@ is NOT enabled, examine if VCSessionSwitchContext contextConfigratio"
                "ns is setup properly!";
          uint32_t v15 = 58;
LABEL_13:
          _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, v15);
        }
      }
    }
LABEL_14:
    +[VCSessionSwitches generateRandomNumberWithConversationID:v4->_conversationID featureString:v8[2]];
    if (*v8)
    {
      uint64_t v20 = +[GKSConnectivitySettings isFeatureEnabledForStorebagKey:*v8 userDefaultKey:v8[1] featureFlagDomain:"AVConference" featureFlagName:[(__CFString *)v8[1] UTF8String] normalizedRandom:v19];
LABEL_16:
      uint64_t v21 = v20;
      goto LABEL_21;
    }
    if (v5 && contextConfigurations[v6 + 3])
    {
      uint64_t v20 = [(VCSessionSwitches *)v4 trialEnablementWithClient:v5 Context:&contextConfigurations[v6] normalizedRandom:v19];
      goto LABEL_16;
    }
    uint64_t v21 = 0;
LABEL_21:
    [(VCSessionSwitches *)v4 setFeature:contextConfigurations[v6 + 4] isEnabled:v21];
    v6 += 5;
  }
  while (v6 != 20);
  if ((VCSessionSwitches *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t switches = v4->_switches;
        conversationID = v4->_conversationID;
        *(_DWORD *)buf = 136316418;
        uint64_t v38 = v23;
        __int16 v39 = 2080;
        v40 = "-[VCSessionSwitches initWithConversationID:]";
        __int16 v41 = 1024;
        int v42 = 91;
        __int16 v43 = 2112;
        v44 = (__CFString *)conversationID;
        __int16 v45 = 2048;
        v46 = (VCSessionSwitches *)switches;
        __int16 v47 = 2048;
        uint64_t v48 = 4;
        v27 = " [%s] %s:%d _conversationID=%@, sessionSwitches=0x%llx, featureCount=%zu";
        v28 = v24;
        uint32_t v29 = 58;
        goto LABEL_32;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v22 = (__CFString *)[(VCSessionSwitches *)v4 performSelector:sel_logPrefix];
    }
    else {
      v22 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v30 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v33 = v4->_switches;
        v32 = v4->_conversationID;
        *(_DWORD *)buf = 136316930;
        uint64_t v38 = v30;
        __int16 v39 = 2080;
        v40 = "-[VCSessionSwitches initWithConversationID:]";
        __int16 v41 = 1024;
        int v42 = 91;
        __int16 v43 = 2112;
        v44 = v22;
        __int16 v45 = 2048;
        v46 = v4;
        __int16 v47 = 2112;
        uint64_t v48 = (uint64_t)v32;
        __int16 v49 = 2048;
        unint64_t v50 = v33;
        __int16 v51 = 2048;
        uint64_t v52 = 4;
        v27 = " [%s] %s:%d %@(%p) _conversationID=%@, sessionSwitches=0x%llx, featureCount=%zu";
        v28 = v31;
        uint32_t v29 = 78;
LABEL_32:
        _os_log_impl(&dword_1E1EA4000, v28, OS_LOG_TYPE_DEFAULT, v27, buf, v29);
      }
    }
  }
  return v4;
}

- (BOOL)isFeatureEnabled:(unint64_t)a3
{
  return (self->_switches & a3) != 0;
}

+ (float)generateRandomNumberWithConversationID:(id)a3 featureString:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (__CFString *)[NSString stringWithFormat:@"%@-%@", a3, a4];
  uint64_t v6 = (const void *)[(__CFString *)v5 cStringUsingEncoding:4];
  CC_LONG v7 = [(__CFString *)v5 lengthOfBytesUsingEncoding:4];
  *(void *)&long long v8 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)md = v8;
  long long v35 = v8;
  *(void *)&c.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&c.wbuf[6] = v8;
  *(_OWORD *)&c.wbuf[10] = v8;
  *(_OWORD *)&c.hash[6] = v8;
  *(_OWORD *)&c.wbuf[2] = v8;
  *(_OWORD *)c.count = v8;
  *(_OWORD *)&c.hash[2] = v8;
  CC_SHA256_Init(&c);
  CC_SHA256_Update(&c, v6, v7);
  CC_SHA256_Final(md, &c);
  float v9 = (double)*(unint64_t *)md * 5.42101086e-20;
  if ((id)objc_opt_class() == a1)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v20 = v11;
        __int16 v21 = 2080;
        v22 = "+[VCSessionSwitches generateRandomNumberWithConversationID:featureString:]";
        __int16 v23 = 1024;
        int v24 = 116;
        __int16 v25 = 2112;
        v26 = v5;
        __int16 v27 = 2048;
        double v28 = v9;
        v13 = " [%s] %s:%d concatenatedString=%@, randomByUUIDAndFeature=%f";
        v14 = v12;
        uint32_t v15 = 48;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v10 = (__CFString *)[a1 performSelector:sel_logPrefix];
    }
    else {
      uint64_t v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316674;
        uint64_t v20 = v16;
        __int16 v21 = 2080;
        v22 = "+[VCSessionSwitches generateRandomNumberWithConversationID:featureString:]";
        __int16 v23 = 1024;
        int v24 = 116;
        __int16 v25 = 2112;
        v26 = v10;
        __int16 v27 = 2048;
        double v28 = *(double *)&a1;
        __int16 v29 = 2112;
        uint64_t v30 = v5;
        __int16 v31 = 2048;
        double v32 = v9;
        v13 = " [%s] %s:%d %@(%p) concatenatedString=%@, randomByUUIDAndFeature=%f";
        v14 = v17;
        uint32_t v15 = 68;
        goto LABEL_11;
      }
    }
  }
  return v9;
}

+ (id)featureFlagAndDefaultNameForFeature:(unint64_t)a3
{
  uint64_t v3 = 0;
  while (((unint64_t)contextConfigurations[v3 + 4] & a3) == 0)
  {
    v3 += 5;
    if (v3 == 20) {
      return 0;
    }
  }
  return contextConfigurations[v3 + 1];
}

- (void)setFeature:(unint64_t)a3 isEnabled:(BOOL)a4
{
  if (a4) {
    unint64_t v4 = self->_switches | a3;
  }
  else {
    unint64_t v4 = self->_switches & ~a3;
  }
  self->_unint64_t switches = v4;
}

- (BOOL)trialEnablementWithClient:(id)a3 Context:(id *)a4 normalizedRandom:(double)a5
{
  [a4->var1 UTF8String];
  unsigned int v8 = _os_feature_enabled_impl();
  objc_msgSend((id)objc_msgSend(a3, "levelForFactor:withNamespaceName:", @"samplingRate", a4->var3), "doubleValue");
  id var1 = a4->var1;
  if (v10 > a5) {
    uint64_t v11 = v8;
  }
  else {
    uint64_t v11 = 0;
  }

  return +[VCDefaults BOOLeanValueForKey:var1 defaultValue:v11];
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];

  v3.receiver = self;
  v3.super_class = (Class)VCSessionSwitches;
  [(VCSessionSwitches *)&v3 dealloc];
}

- (unint64_t)switches
{
  return self->_switches;
}

@end