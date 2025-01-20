@interface AVCAnsweringMachineConfiguration
+ (id)stringFromCallSource:(unsigned __int8)a3;
- (AVCAnsweringMachineConfiguration)init;
- (AVCAnsweringMachineConfiguration)initWithClientDictionary:(id)a3 clientPid:(int)a4;
- (BOOL)isMessageCaptioningEnabled;
- (BOOL)isMessagePlaybackEnabled;
- (BOOL)isMessageRecordingEnabled;
- (NSURL)announcementAsset;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionary;
- (int)clientPid;
- (unsigned)announcementAssetMilliSecondDelay;
- (unsigned)source;
- (void)dealloc;
- (void)dictionary;
- (void)init;
- (void)setAnnouncementAsset:(id)a3;
- (void)setAnnouncementAssetMilliSecondDelay:(unsigned int)a3;
- (void)setIsMessageCaptioningEnabled:(BOOL)a3;
- (void)setIsMessagePlaybackEnabled:(BOOL)a3;
- (void)setIsMessageRecordingEnabled:(BOOL)a3;
- (void)setSource:(unsigned __int8)a3;
@end

@implementation AVCAnsweringMachineConfiguration

- (AVCAnsweringMachineConfiguration)init
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)AVCAnsweringMachineConfiguration;
  v2 = [(AVCAnsweringMachineConfiguration *)&v6 init];
  if (v2)
  {
    v2->_announcementAssetMilliSecondDelay = VCDefaults_GetIntValueForKey(@"answeringMachineAnnouncementAssetDelay", 200);
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
  {
    uint64_t v4 = VRTraceErrorLogLevelToCSTR();
    v5 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      [(AVCAnsweringMachineConfiguration *)v4 init];
    }
  }
  return v2;
}

- (void)setAnnouncementAsset:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = (VCSandboxedURL *)[a3 copy];
  }
  else if (a3)
  {
    v5 = [[VCSandboxedURL alloc] initWithURL:a3 accessType:1];
  }
  else
  {
    v5 = 0;
  }
  self->_announcementAsset = v5;
}

- (NSURL)announcementAsset
{
  return &self->_announcementAsset->super;
}

- (int)clientPid
{
  return self->_clientPid;
}

+ (id)stringFromCallSource:(unsigned __int8)a3
{
  if (a3 > 5u) {
    v3 = "Unknown";
  }
  else {
    v3 = off_1E6DB71A8[(char)a3];
  }
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%s(%hhu)", v3, a3);
}

- (id)description
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v3 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)AVCAnsweringMachineConfiguration;
  id v4 = [(AVCAnsweringMachineConfiguration *)&v10 description];
  id v5 = +[AVCAnsweringMachineConfiguration stringFromCallSource:self->_source];
  objc_super v6 = "YES";
  if (self->_isMessageRecordingEnabled) {
    uint64_t v7 = "YES";
  }
  else {
    uint64_t v7 = "NO";
  }
  if (self->_isMessageCaptioningEnabled) {
    v8 = "YES";
  }
  else {
    v8 = "NO";
  }
  if (!self->_isMessagePlaybackEnabled) {
    objc_super v6 = "NO";
  }
  return (id)[v3 stringWithFormat:@"{ %@ source=%@, isMessageRecordingEnabled=%s, isMessageCaptioningEnabled=%s isMessagePlaybackEnabled=%s, announcementAssetMilliSecondDelay=%u, clientPid=%d, announcementAsset=%@ }", v4, v5, v7, v8, v6, self->_announcementAssetMilliSecondDelay, self->_clientPid, self->_announcementAsset];
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((AVCAnsweringMachineConfiguration *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      id v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v4;
        __int16 v14 = 2080;
        v15 = "-[AVCAnsweringMachineConfiguration dealloc]";
        __int16 v16 = 1024;
        int v17 = 105;
        objc_super v6 = " [%s] %s:%d ";
        uint64_t v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(AVCAnsweringMachineConfiguration *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      objc_super v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        v15 = "-[AVCAnsweringMachineConfiguration dealloc]";
        __int16 v16 = 1024;
        int v17 = 105;
        __int16 v18 = 2112;
        v19 = v3;
        __int16 v20 = 2048;
        v21 = self;
        objc_super v6 = " [%s] %s:%d %@(%p) ";
        uint64_t v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }

  v11.receiver = self;
  v11.super_class = (Class)AVCAnsweringMachineConfiguration;
  [(AVCAnsweringMachineConfiguration *)&v11 dealloc];
}

- (id)dictionary
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = (void *)[MEMORY[0x1E4F1CA60] dictionary];
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedChar:", self->_source), @"vcAnsweringMachineCallSource");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_isMessageRecordingEnabled), @"vcAnsweringMachineRecordingEnabled");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_isMessageCaptioningEnabled), @"vcAnsweringMachineCaptioningEnabled");
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithBool:", self->_isMessagePlaybackEnabled), @"vcAnsweringMachinePlaybackEnabled");
  p_announcementAsset = (uint64_t *)&self->_announcementAsset;
  announcementAsset = self->_announcementAsset;
  if (announcementAsset)
  {
    uint64_t v6 = [(VCSandboxedURL *)announcementAsset serialize];
    if (v6)
    {
      [v3 setObject:v6 forKeyedSubscript:@"vcAnsweringMachineAnnouncementAssetURL"];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(NSNumber, "numberWithUnsignedInt:", self->_announcementAssetMilliSecondDelay), @"vcAnsweringMachineAnnouncementAssetDelay");
    }
    else
    {
      if ((AVCAnsweringMachineConfiguration *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v8 = VRTraceErrorLogLevelToCSTR();
          uint64_t v9 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            [(AVCAnsweringMachineConfiguration *)v8 dictionary];
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v7 = (__CFString *)[(AVCAnsweringMachineConfiguration *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v7 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          objc_super v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            uint64_t v13 = self->_announcementAsset;
            int v14 = 136316418;
            uint64_t v15 = v10;
            __int16 v16 = 2080;
            int v17 = "-[AVCAnsweringMachineConfiguration dictionary]";
            __int16 v18 = 1024;
            int v19 = 122;
            __int16 v20 = 2112;
            v21 = v7;
            __int16 v22 = 2048;
            v23 = self;
            __int16 v24 = 2112;
            v25 = v13;
            _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to serialize announcementAsset=%@", (uint8_t *)&v14, 0x3Au);
          }
        }
      }
      return 0;
    }
  }
  return v3;
}

- (AVCAnsweringMachineConfiguration)initWithClientDictionary:(id)a3 clientPid:(int)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)AVCAnsweringMachineConfiguration;
  uint64_t v6 = [(AVCAnsweringMachineConfiguration *)&v16 init];
  if (v6)
  {
    v6->_source = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcAnsweringMachineCallSource"), "integerValue");
    v6->_isMessageRecordingEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcAnsweringMachineRecordingEnabled"), "BOOLValue");
    v6->_isMessageCaptioningEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcAnsweringMachineCaptioningEnabled"), "BOOLValue");
    v6->_isMessagePlaybackEnabled = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcAnsweringMachinePlaybackEnabled"), "BOOLValue");
    v6->_announcementAsset = (VCSandboxedURL *)(id)objc_msgSend(+[VCSandboxedURL deserialize:](VCSandboxedURL, "deserialize:", objc_msgSend(a3, "objectForKeyedSubscript:", @"vcAnsweringMachineAnnouncementAssetURL")), "consumeToken");
    v6->_announcementAssetMilliSecondDelay = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", @"vcAnsweringMachineAnnouncementAssetDelay"), "unsignedLongValue");
    v6->_clientPid = a4;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      __str = 0;
      uint64_t v7 = (const char *)objc_msgSend(-[AVCAnsweringMachineConfiguration description](v6, "description"), "UTF8String");
      uint64_t v8 = a3 ? (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String") : "<nil>";
      asprintf(&__str, "self=%s succeeded with clientDict=%s clientPid=%d", v7, v8, a4);
      if (__str)
      {
        __lasts = 0;
        uint64_t v9 = strtok_r(__str, "\n", &__lasts);
        uint64_t v10 = (os_log_t *)MEMORY[0x1E4F47A50];
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
          {
            uint64_t v11 = VRTraceErrorLogLevelToCSTR();
            v12 = *v10;
            if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v18 = v11;
              __int16 v19 = 2080;
              __int16 v20 = "-[AVCAnsweringMachineConfiguration initWithClientDictionary:clientPid:]";
              __int16 v21 = 1024;
              int v22 = 143;
              __int16 v23 = 2080;
              __int16 v24 = "";
              __int16 v25 = 2080;
              uint64_t v26 = v9;
              _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          uint64_t v9 = strtok_r(0, "\n", &__lasts);
        }
        while (v9);
        free(__str);
      }
    }
  }
  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_alloc_init(AVCAnsweringMachineConfiguration);
  [(AVCAnsweringMachineConfiguration *)v5 setSource:[(AVCAnsweringMachineConfiguration *)self source]];
  [(AVCAnsweringMachineConfiguration *)v5 setIsMessageRecordingEnabled:[(AVCAnsweringMachineConfiguration *)self isMessageRecordingEnabled]];
  [(AVCAnsweringMachineConfiguration *)v5 setIsMessageCaptioningEnabled:[(AVCAnsweringMachineConfiguration *)self isMessageCaptioningEnabled]];
  [(AVCAnsweringMachineConfiguration *)v5 setIsMessagePlaybackEnabled:[(AVCAnsweringMachineConfiguration *)self isMessagePlaybackEnabled]];
  id v6 = [(VCSandboxedURL *)self->_announcementAsset copyWithZone:a3];
  [(AVCAnsweringMachineConfiguration *)v5 setAnnouncementAsset:v6];

  [(AVCAnsweringMachineConfiguration *)v5 setAnnouncementAssetMilliSecondDelay:[(AVCAnsweringMachineConfiguration *)self announcementAssetMilliSecondDelay]];
  v5->_clientPid = [(AVCAnsweringMachineConfiguration *)self clientPid];
  return v5;
}

- (BOOL)isMessagePlaybackEnabled
{
  return self->_isMessagePlaybackEnabled;
}

- (void)setIsMessagePlaybackEnabled:(BOOL)a3
{
  self->_isMessagePlaybackEnabled = a3;
}

- (BOOL)isMessageCaptioningEnabled
{
  return self->_isMessageCaptioningEnabled;
}

- (void)setIsMessageCaptioningEnabled:(BOOL)a3
{
  self->_isMessageCaptioningEnabled = a3;
}

- (BOOL)isMessageRecordingEnabled
{
  return self->_isMessageRecordingEnabled;
}

- (void)setIsMessageRecordingEnabled:(BOOL)a3
{
  self->_isMessageRecordingEnabled = a3;
}

- (unsigned)announcementAssetMilliSecondDelay
{
  return self->_announcementAssetMilliSecondDelay;
}

- (void)setAnnouncementAssetMilliSecondDelay:(unsigned int)a3
{
  self->_announcementAssetMilliSecondDelay = a3;
}

- (unsigned)source
{
  return self->_source;
}

- (void)setSource:(unsigned __int8)a3
{
  self->_source = a3;
}

- (void)init
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v2 = 136315650;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  id v5 = "-[AVCAnsweringMachineConfiguration init]";
  __int16 v6 = 1024;
  int v7 = 40;
  _os_log_error_impl(&dword_1E1EA4000, a2, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to super init", (uint8_t *)&v2, 0x1Cu);
}

- (void)dictionary
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 136315906;
  uint64_t v5 = a1;
  __int16 v6 = 2080;
  int v7 = "-[AVCAnsweringMachineConfiguration dictionary]";
  __int16 v8 = 1024;
  int v9 = 122;
  __int16 v10 = 2112;
  uint64_t v11 = v3;
  _os_log_error_impl(&dword_1E1EA4000, log, OS_LOG_TYPE_ERROR, " [%s] %s:%d Failed to serialize announcementAsset=%@", (uint8_t *)&v4, 0x26u);
}

@end