@interface ASDTIOPAudioVTDevice
+ (id)forIOObject:(unsigned int)a3 andIDValue:(id)a4;
- (BOOL)getChannelMask:(unsigned int *)a3;
- (BOOL)getDebugEnabled:(unsigned int *)a3;
- (BOOL)getIsEnabled:(unsigned int *)a3;
- (BOOL)getModelCRC:(unsigned int *)a3;
- (BOOL)isConfigured;
- (BOOL)open;
- (BOOL)setConfigurationInfo:(id)a3;
- (BOOL)setDebugEnabled:(unsigned int)a3;
- (BOOL)setEnabled:(unsigned int)a3;
- (BOOL)setPhraseDetectEventBlock:(id)a3;
- (NSDictionary)eventInfo;
- (id).cxx_construct;
- (id)getConfigurationInfo;
- (id)initForIOObject:(unsigned int)a3 andIDValue:(id)a4;
- (void)close;
- (void)dealloc;
- (void)eventInfo;
- (void)getConfigurationInfo;
- (void)isConfigured;
- (void)open;
@end

@implementation ASDTIOPAudioVTDevice

+ (id)forIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v7 = (void *)[objc_alloc((Class)a1) initForIOObject:v4 andIDValue:v6];

  return v7;
}

- (id)initForIOObject:(unsigned int)a3 andIDValue:(id)a4
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v4 = a4;
  operator new();
}

- (BOOL)open
{
  v13[3] = *MEMORY[0x263EF8340];
  if (!*((void *)self + 3)) {
    -[ASDTIOPAudioVTDevice open]();
  }
  v3 = (std::mutex *)((char *)self + 32);
  std::mutex::lock((std::mutex *)((char *)self + 32));
  unsigned int v4 = *((_DWORD *)self + 24) + 1;
  *((_DWORD *)self + 24) = v4;
  if (v4 > 1) {
    goto LABEL_3;
  }
  uint64_t v6 = (ASDT::IOUserClient *)*((void *)self + 3);
  v7 = [(ASDTIOService *)self idValue];
  [v7 clientType];
  LOBYTE(v6) = ASDT::IOUserClient::OpenConnection(v6);

  if ((v6 & 1) == 0)
  {
    v10 = ASDTIOPLogType();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [(ASDTIOService *)self idValue];
      [(ASDTIOPAudioVTDevice *)v11 open];
    }

    goto LABEL_12;
  }
  if ((ASDT::IOPAudio::VoiceTrigger::UserClient::Open(*((ASDT::IOPAudio::VoiceTrigger::UserClient **)self + 3)) & 1) == 0)
  {
    v8 = ASDTIOPLogType();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = [(ASDTIOService *)self idValue];
      [(ASDTIOPAudioVTDevice *)v9 open];
    }

    (*(void (**)(void))(**((void **)self + 3) + 32))(*((void *)self + 3));
LABEL_12:
    BOOL v5 = 0;
    *((_DWORD *)self + 24) = 0;
    goto LABEL_13;
  }
LABEL_3:
  BOOL v5 = 1;
LABEL_13:
  std::mutex::unlock(v3);
  return v5;
}

- (void)close
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_248A68000, a2, a3, "%@: Unbalanced open/close calls.", (uint8_t *)a2);
}

- (void)dealloc
{
  v3 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((void *)self + 3);
  if (v3 && *((_DWORD *)self + 24)) {
    ASDT::IOPAudio::VoiceTrigger::UserClient::Close(v3);
  }
  v4.receiver = self;
  v4.super_class = (Class)ASDTIOPAudioVTDevice;
  [(ASDTIOService *)&v4 dealloc];
}

- (BOOL)getIsEnabled:(unsigned int *)a3
{
  v3 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((void *)self + 3);
  if (!v3) {
    -[ASDTIOPAudioVTDevice getIsEnabled:]();
  }
  if (!a3) {
    -[ASDTIOPAudioVTDevice getIsEnabled:]();
  }
  return ASDT::IOPAudio::VoiceTrigger::UserClient::GetVoiceTriggerEnabled(v3, a3);
}

- (BOOL)setEnabled:(unsigned int)a3
{
  v3 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((void *)self + 3);
  if (!v3) {
    -[ASDTIOPAudioVTDevice setEnabled:]();
  }
  return ASDT::IOPAudio::VoiceTrigger::UserClient::SetVoiceTriggerEnabled(v3, a3);
}

- (BOOL)getChannelMask:(unsigned int *)a3
{
  v3 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((void *)self + 3);
  if (!v3) {
    -[ASDTIOPAudioVTDevice getChannelMask:]();
  }
  if (!a3) {
    -[ASDTIOPAudioVTDevice getChannelMask:]();
  }
  return ASDT::IOPAudio::VoiceTrigger::UserClient::GetActiveChannelMask(v3, a3);
}

- (BOOL)getModelCRC:(unsigned int *)a3
{
  v3 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((void *)self + 3);
  if (!v3) {
    -[ASDTIOPAudioVTDevice getModelCRC:]();
  }
  if (!a3) {
    -[ASDTIOPAudioVTDevice getModelCRC:]();
  }
  return ASDT::IOPAudio::VoiceTrigger::UserClient::GetModelCRC(v3, a3);
}

- (BOOL)getDebugEnabled:(unsigned int *)a3
{
  v3 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((void *)self + 3);
  if (!v3) {
    -[ASDTIOPAudioVTDevice getDebugEnabled:]();
  }
  if (!a3) {
    -[ASDTIOPAudioVTDevice getDebugEnabled:]();
  }
  return ASDT::IOPAudio::VoiceTrigger::UserClient::GetDebugEnabled(v3, a3);
}

- (BOOL)setDebugEnabled:(unsigned int)a3
{
  v3 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((void *)self + 3);
  if (!v3) {
    -[ASDTIOPAudioVTDevice setDebugEnabled:]();
  }
  return ASDT::IOPAudio::VoiceTrigger::UserClient::SetDebugEnabled(v3, a3);
}

- (NSDictionary)eventInfo
{
  v2 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((void *)self + 3);
  if (!v2) {
    -[ASDTIOPAudioVTDevice eventInfo]();
  }
  ASDT::IOPAudio::VoiceTrigger::UserClient::CopyEventInfo(v2, (CFTypeRef *)&v6);
  CFTypeRef v3 = v6;
  objc_super v4 = (void *)v3;
  if (v3) {
    CFRelease(v3);
  }
  return (NSDictionary *)v4;
}

- (BOOL)isConfigured
{
  v2 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((void *)self + 3);
  if (!v2) {
    -[ASDTIOPAudioVTDevice isConfigured]();
  }
  return ASDT::IOPAudio::VoiceTrigger::UserClient::GetIsConfigured(v2);
}

- (id)getConfigurationInfo
{
  v2 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((void *)self + 3);
  if (!v2) {
    -[ASDTIOPAudioVTDevice getConfigurationInfo]();
  }
  ASDT::IOPAudio::VoiceTrigger::UserClient::CopyConfigurationInfo(v2, &cf);
  CFTypeRef v3 = (void *)cf;
  if (cf)
  {
    CFTypeRef v4 = (id)cf;
    if (cf) {
      CFRelease(cf);
    }
  }
  return v3;
}

- (BOOL)setConfigurationInfo:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  uint64_t v6 = (ASDT::IOPAudio::VoiceTrigger::UserClient *)*((void *)self + 3);
  if (!v6) {
    __assert_rtn("-[ASDTIOPAudioVTDevice setConfigurationInfo:]", "ASDTIOPAudioVTDevice.mm", 175, "_userClient");
  }
  if (v4)
  {
    id v7 = v4;
    CFRetain(v7);
    applesauce::CF::DictionaryRef::DictionaryRef((applesauce::CF::DictionaryRef *)&cf, v7);

    char v8 = ASDT::IOPAudio::VoiceTrigger::UserClient::SetConfigurationInfo(v6, (const applesauce::CF::DictionaryRef *)&cf);
    if (cf) {
      CFRelease(cf);
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (BOOL)setPhraseDetectEventBlock:(id)a3
{
  id v4 = a3;
  uint64_t v5 = *((void *)self + 3);
  if (!v5) {
    __assert_rtn("-[ASDTIOPAudioVTDevice setPhraseDetectEventBlock:]", "ASDTIOPAudioVTDevice.mm", 184, "_userClient");
  }
  char v6 = ASDT::IOPAudio::VoiceTrigger::UserClient::SetPhraseDetectEventBlock(v5, v4);

  return v6;
}

- (void).cxx_destruct
{
  std::mutex::~mutex((std::mutex *)((char *)self + 32));
  uint64_t v3 = *((void *)self + 3);
  *((void *)self + 3) = 0;
  if (v3)
  {
    id v4 = *(void (**)(void))(*(void *)v3 + 8);
    v4();
  }
}

- (id).cxx_construct
{
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 850045863;
  *((void *)self + 11) = 0;
  *(_OWORD *)((char *)self + 72) = 0u;
  *(_OWORD *)((char *)self + 56) = 0u;
  *(_OWORD *)((char *)self + 40) = 0u;
  return self;
}

- (void)initForIOObject:(uint8_t *)buf andIDValue:(os_log_t)log .cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_248A68000, log, OS_LOG_TYPE_ERROR, "%@: Mismatch identifier: %@", buf, 0x16u);
}

- (void)initForIOObject:(uint64_t)a1 andIDValue:(NSObject *)a2 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_248A68000, a2, OS_LOG_TYPE_ERROR, "%@: Failed to create IOPAudioVT user client", (uint8_t *)&v2, 0xCu);
}

- (void)open
{
  *(_DWORD *)a2 = 138412290;
  *(void *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0(&dword_248A68000, a2, a3, "%@: Failed to open connection to IOPAudioVT user client", (uint8_t *)a2);
}

- (void)getIsEnabled:.cold.1()
{
}

- (void)getIsEnabled:.cold.2()
{
}

- (void)setEnabled:.cold.1()
{
}

- (void)getChannelMask:.cold.1()
{
}

- (void)getChannelMask:.cold.2()
{
}

- (void)getModelCRC:.cold.1()
{
}

- (void)getModelCRC:.cold.2()
{
}

- (void)getDebugEnabled:.cold.1()
{
}

- (void)getDebugEnabled:.cold.2()
{
}

- (void)setDebugEnabled:.cold.1()
{
}

- (void)eventInfo
{
}

- (void)isConfigured
{
}

- (void)getConfigurationInfo
{
}

@end