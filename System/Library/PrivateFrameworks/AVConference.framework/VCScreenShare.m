@interface VCScreenShare
- (BOOL)contentRepickingAllowed;
- (BOOL)isCursorCaptured;
- (BOOL)isWindowed;
- (BOOL)privateContentCaptureAllowed;
- (NSArray)excludedApplicationBundleIDs;
- (NSData)clientAuditTokenData;
- (NSNumber)clientPID;
- (NSString)clientBundleID;
- (NSString)screenVirtualDisplayLabel;
- (NSString)selectiveScreenUUID;
- (VCScreenShare)initWithConfig:(id)a3 pid:(id)a4 captureSourceID:(id)a5;
- (int)displayMode;
- (int64_t)captureSourceID;
- (unsigned)frameRate;
- (unsigned)height;
- (unsigned)screenCaptureDisplayID;
- (unsigned)selectiveSharingPort;
- (unsigned)width;
- (void)dealloc;
- (void)setClientBundleID:(id)a3;
- (void)setClientPID:(id)a3;
- (void)setConfig:(id)a3 pid:(id)a4 captureSourceID:(id)a5;
- (void)setContentRepickingAllowed:(BOOL)a3;
- (void)setExcludedApplicationBundleIDs:(id)a3;
- (void)setIsCursorCaptured:(BOOL)a3;
- (void)setPrivateContentCaptureAllowedForConfig:(id)a3;
- (void)setScreenVirtualDisplayLabelforConfig:(id)a3;
- (void)setSelectiveScreenUUID:(id)a3;
- (void)updateScreenCaptureWithConfig:(id)a3;
@end

@implementation VCScreenShare

- (VCScreenShare)initWithConfig:(id)a3 pid:(id)a4 captureSourceID:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v18.receiver = self;
  v18.super_class = (Class)VCScreenShare;
  v8 = [(VCScreenShare *)&v18 init];
  if (v8)
  {
    if ((VCScreenShare *)objc_opt_class() == v8)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136315650;
      uint64_t v20 = v10;
      __int16 v21 = 2080;
      v22 = "-[VCScreenShare initWithConfig:pid:captureSourceID:]";
      __int16 v23 = 1024;
      int v24 = 35;
      v12 = " [%s] %s:%d ";
      v13 = v11;
      uint32_t v14 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v9 = (__CFString *)[(VCScreenShare *)v8 performSelector:sel_logPrefix];
      }
      else {
        v9 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_13;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_13;
      }
      *(_DWORD *)buf = 136316162;
      uint64_t v20 = v15;
      __int16 v21 = 2080;
      v22 = "-[VCScreenShare initWithConfig:pid:captureSourceID:]";
      __int16 v23 = 1024;
      int v24 = 35;
      __int16 v25 = 2112;
      v26 = v9;
      __int16 v27 = 2048;
      v28 = v8;
      v12 = " [%s] %s:%d %@(%p) ";
      v13 = v16;
      uint32_t v14 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
LABEL_13:
    [(VCScreenShare *)v8 setConfig:a3 pid:a4 captureSourceID:a5];
    [(VCScreenShare *)v8 setScreenVirtualDisplayLabelforConfig:a3];
    [(VCScreenShare *)v8 setPrivateContentCaptureAllowedForConfig:a3];
  }
  return v8;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((VCScreenShare *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v4;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCScreenShare dealloc]";
        __int16 v16 = 1024;
        int v17 = 44;
        v6 = " [%s] %s:%d ";
        v7 = v5;
        uint32_t v8 = 28;
LABEL_11:
        _os_log_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v3 = (__CFString *)[(VCScreenShare *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint64_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        uint64_t v15 = "-[VCScreenShare dealloc]";
        __int16 v16 = 1024;
        int v17 = 44;
        __int16 v18 = 2112;
        v19 = v3;
        __int16 v20 = 2048;
        __int16 v21 = self;
        v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  [(VCScreenShare *)self setClientPID:0];
  [(VCScreenShare *)self setSelectiveScreenUUID:0];
  [(VCScreenShare *)self setExcludedApplicationBundleIDs:0];
  [(VCScreenShare *)self setClientBundleID:0];

  self->_clientAuditTokenData = 0;
  v11.receiver = self;
  v11.super_class = (Class)VCScreenShare;
  [(VCScreenShare *)&v11 dealloc];
}

- (void)updateScreenCaptureWithConfig:(id)a3
{
  v5 = [(VCScreenShare *)self clientPID];
  uint64_t v6 = [NSNumber numberWithInteger:self->_captureSourceID];

  [(VCScreenShare *)self setConfig:a3 pid:v5 captureSourceID:v6];
}

- (void)setConfig:(id)a3 pid:(id)a4 captureSourceID:(id)a5
{
  self->_width = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"vcScreenCaptureWidth"), "intValue");
  self->_height = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"vcScreenCaptureHeight"), "intValue");
  self->_frameRate = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"vcScreenCaptureFramerate"), "intValue");
  self->_screenCaptureDisplayID = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"vcScreenCaptureScreenDisplayID"), "intValue");
  self->_displayMode = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"vcScreenCaptureScreenDisplayMode"), "intValue");
  -[VCScreenShare setClientBundleID:](self, "setClientBundleID:", [a3 objectForKey:@"vcScreenCaptureClientBundleID"]);
  [(VCScreenShare *)self setClientPID:a4];
  self->_isWindowed = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"vcScreenCaptureScreenIsWindowed"), "BOOLValue");
  self->_isCursorCaptured = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"vcScreenCaptureIsCursorCaptured"), "BOOLValue");
  -[VCScreenShare setExcludedApplicationBundleIDs:](self, "setExcludedApplicationBundleIDs:", [a3 objectForKey:@"vcScreenCaptureCaptureExcludedBundleIDs"]);
  self->_selectiveSharingPort = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", @"vcScreenCaptureScreenMachPort"), "unsignedIntValue");
  -[VCScreenShare setSelectiveScreenUUID:](self, "setSelectiveScreenUUID:", [a3 objectForKey:@"vcScreenCaptureScreenUUID"]);
  self->_captureSourceID = [a5 integerValue];
  uint64_t v9 = [(VCScreenShare *)self excludedApplicationBundleIDs];
  BOOL v10 = (-[NSArray isEqual:](v9, "isEqual:", [MEMORY[0x1E4F1CA98] null]) & 1) == 0
     && [(NSArray *)[(VCScreenShare *)self excludedApplicationBundleIDs] count] != 0;
  self->_contentRepickingAllowed = v10;
  objc_super v11 = (NSData *)[a3 objectForKeyedSubscript:@"vcScreenCaptureXpcAuthToken"];
  if (v11) {
    objc_super v11 = (NSData *)(id)[a3 objectForKeyedSubscript:@"vcScreenCaptureXpcAuthToken"];
  }
  self->_clientAuditTokenData = v11;
}

- (void)setScreenVirtualDisplayLabelforConfig:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if ([(VCScreenShare *)self clientBundleID])
  {
    BOOL v4 = +[VCDefaults BOOLeanValueForKey:@"forceEnableScreenVirtualDisplayLabel" defaultValue:0];
    if ([(NSString *)[(VCScreenShare *)self clientBundleID] isEqualToString:@"com.apple.ScreenContinuityShell"]|| v4)
    {
      v5 = +[VCDefaults copyStringValueForKey:@"screenVirtualDisplayLabelName"];
      if (v5) {
        uint64_t v6 = v5;
      }
      else {
        uint64_t v6 = @"Continuity";
      }
      if ((VCScreenShare *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_18;
        }
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        uint64_t v9 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        int v15 = 136316162;
        uint64_t v16 = v8;
        __int16 v17 = 2080;
        __int16 v18 = "-[VCScreenShare setScreenVirtualDisplayLabelforConfig:]";
        __int16 v19 = 1024;
        int v20 = 92;
        __int16 v21 = 2112;
        uint64_t v22 = v6;
        __int16 v23 = 1024;
        LODWORD(v24) = v4;
        BOOL v10 = " [%s] %s:%d screenVirtualDisplayLabel=%@ forceEnableScreenVirtualDisplayLabel=%d";
        objc_super v11 = v9;
        uint32_t v12 = 44;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v7 = (__CFString *)[(VCScreenShare *)self performSelector:sel_logPrefix];
        }
        else {
          v7 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
          goto LABEL_18;
        }
        uint64_t v13 = VRTraceErrorLogLevelToCSTR();
        __int16 v14 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_18;
        }
        int v15 = 136316674;
        uint64_t v16 = v13;
        __int16 v17 = 2080;
        __int16 v18 = "-[VCScreenShare setScreenVirtualDisplayLabelforConfig:]";
        __int16 v19 = 1024;
        int v20 = 92;
        __int16 v21 = 2112;
        uint64_t v22 = v7;
        __int16 v23 = 2048;
        int v24 = self;
        __int16 v25 = 2112;
        v26 = v6;
        __int16 v27 = 1024;
        BOOL v28 = v4;
        BOOL v10 = " [%s] %s:%d %@(%p) screenVirtualDisplayLabel=%@ forceEnableScreenVirtualDisplayLabel=%d";
        objc_super v11 = v14;
        uint32_t v12 = 64;
      }
      _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v15, v12);
LABEL_18:
      self->_screenVirtualDisplayLabel = (NSString *)[[NSString alloc] initWithString:v6];
    }
  }
}

- (void)setPrivateContentCaptureAllowedForConfig:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int IsInternalOSInstalled = VRTraceIsInternalOSInstalled();
  uint64_t v6 = [a3 objectForKeyedSubscript:@"vcScreenCaptureXpcAuthToken"];
  BOOL v7 = v6 != 0;
  if (!v6) {
    goto LABEL_16;
  }
  uint64_t v8 = (void *)[a3 objectForKeyedSubscript:@"vcScreenCaptureXpcAuthToken"];
  *(void *)&long long v9 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)uint64_t v16 = v9;
  *(_OWORD *)&v16[16] = v9;
  [v8 getBytes:v16 length:32];
  v25[0] = *(_OWORD *)v16;
  v25[1] = *(_OWORD *)&v16[16];
  if (!+[AVConferenceXPCServer clientWithToken:v25 hasEntitlement:@"com.apple.avconference.screencapture.privatecontent.allow"])
  {
    BOOL v10 = 0;
    int v11 = 0;
    int v12 = 0;
    BOOL v7 = 0;
  }
  else
  {
LABEL_16:
    if ([(VCScreenShare *)self clientBundleID])
    {
      BOOL v10 = [(NSString *)[(VCScreenShare *)self clientBundleID] isEqualToString:@"com.apple.ScreenContinuityShell"];
      int v11 = [(NSString *)[(VCScreenShare *)self clientBundleID] isEqualToString:@"com.apple.CoreDevice.dtremotedisplayd"] & IsInternalOSInstalled;
      int v12 = [(NSString *)[(VCScreenShare *)self clientBundleID] isEqualToString:@"com.apple.VideoConference.AVConferenceTestRunneriOS"] & IsInternalOSInstalled;
    }
    else
    {
      BOOL v10 = 0;
      int v11 = 0;
      int v12 = 0;
    }
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v13 = VRTraceErrorLogLevelToCSTR();
    __int16 v14 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)uint64_t v16 = 136316930;
      *(void *)&v16[4] = v13;
      *(_WORD *)&v16[12] = 2080;
      *(void *)&v16[14] = "-[VCScreenShare setPrivateContentCaptureAllowedForConfig:]";
      *(_WORD *)&v16[22] = 1024;
      *(_DWORD *)&v16[24] = 119;
      *(_WORD *)&v16[28] = 1024;
      *(_DWORD *)&v16[30] = v7;
      __int16 v17 = 1024;
      BOOL v18 = v10;
      __int16 v19 = 1024;
      int v20 = v11;
      __int16 v21 = 1024;
      int v22 = v12;
      __int16 v23 = 1024;
      int v24 = IsInternalOSInstalled;
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d hasEntitlement=%d, isNearbyScreenShare=%d, isCoreDeviceScreenShare=%d, isAVCAppTestRunner=%d, isInternalBuild=%d", v16, 0x3Au);
    }
  }
  if (!v7 || v10) {
    char v15 = v7;
  }
  else {
    char v15 = v11 | v12;
  }
  self->_privateContentCaptureAllowed = v15;
}

- (unsigned)height
{
  return self->_height;
}

- (unsigned)width
{
  return self->_width;
}

- (unsigned)frameRate
{
  return self->_frameRate;
}

- (unsigned)screenCaptureDisplayID
{
  return self->_screenCaptureDisplayID;
}

- (int)displayMode
{
  return self->_displayMode;
}

- (NSNumber)clientPID
{
  return self->_clientPID;
}

- (void)setClientPID:(id)a3
{
}

- (BOOL)isWindowed
{
  return self->_isWindowed;
}

- (BOOL)isCursorCaptured
{
  return self->_isCursorCaptured;
}

- (void)setIsCursorCaptured:(BOOL)a3
{
  self->_isCursorCaptured = a3;
}

- (NSString)clientBundleID
{
  return self->_clientBundleID;
}

- (void)setClientBundleID:(id)a3
{
}

- (NSData)clientAuditTokenData
{
  return self->_clientAuditTokenData;
}

- (BOOL)privateContentCaptureAllowed
{
  return self->_privateContentCaptureAllowed;
}

- (NSString)screenVirtualDisplayLabel
{
  return self->_screenVirtualDisplayLabel;
}

- (BOOL)contentRepickingAllowed
{
  return self->_contentRepickingAllowed;
}

- (void)setContentRepickingAllowed:(BOOL)a3
{
  self->_contentRepickingAllowed = a3;
}

- (NSArray)excludedApplicationBundleIDs
{
  return self->_excludedApplicationBundleIDs;
}

- (void)setExcludedApplicationBundleIDs:(id)a3
{
}

- (unsigned)selectiveSharingPort
{
  return self->_selectiveSharingPort;
}

- (NSString)selectiveScreenUUID
{
  return self->_selectiveScreenUUID;
}

- (void)setSelectiveScreenUUID:(id)a3
{
}

- (int64_t)captureSourceID
{
  return self->_captureSourceID;
}

@end