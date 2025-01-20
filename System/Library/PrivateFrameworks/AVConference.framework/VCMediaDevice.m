@interface VCMediaDevice
- (BOOL)autoRunOnStart;
- (BOOL)canEnterState:(unsigned int)a3;
- (VCMediaDevice)init;
- (id)onPause;
- (id)onResume;
- (id)onRun;
- (id)onStart;
- (id)onStop;
- (id)pause;
- (id)resume;
- (id)run;
- (id)runInternal;
- (id)start;
- (id)stateStringForState:(unsigned int)a3;
- (id)stop;
- (void)pause;
- (void)resume;
- (void)runInternal;
- (void)start;
- (void)stop;
@end

@implementation VCMediaDevice

- (VCMediaDevice)init
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v5.receiver = self;
  v5.super_class = (Class)VCMediaDevice;
  v2 = [(VCObject *)&v5 init];
  if (v2)
  {
    v3 = (objc_class *)objc_opt_class();
    [(VCObject *)v2 setLogPrefix:NSStringFromClass(v3)];
    v2->_state = 0;
  }
  return v2;
}

- (id)start
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ %@-start");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v17 = v3;
      __int16 v18 = 2080;
      v19 = "-[VCMediaDevice start]";
      __int16 v20 = 1024;
      int v21 = 49;
      __int16 v22 = 2112;
      p_isa = [(VCObject *)self logPrefix];
      __int16 v24 = 2048;
      v25 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ %@-start (%p)", buf, 0x30u);
    }
  }
  [(VCObject *)self lock];
  if ([(VCMediaDevice *)self canEnterState:1])
  {
    id v5 = [(VCMediaDevice *)self onStart];
    if (v5)
    {
      id v6 = v5;
      if ((VCMediaDevice *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaDevice start]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v7 = (__CFString *)[(VCMediaDevice *)self performSelector:sel_logPrefix];
        }
        else {
          v7 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v12 = VRTraceErrorLogLevelToCSTR();
          v13 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            uint64_t v17 = v12;
            __int16 v18 = 2080;
            v19 = "-[VCMediaDevice start]";
            __int16 v20 = 1024;
            int v21 = 63;
            __int16 v22 = 2112;
            p_isa = &v7->isa;
            __int16 v24 = 2048;
            v25 = self;
            __int16 v26 = 2112;
            id v27 = v6;
            _os_log_error_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to start, error=%@", buf, 0x3Au);
          }
        }
      }
    }
    else
    {
      self->_state = 1;
      if ([(VCMediaDevice *)self autoRunOnStart]) {
        id v6 = [(VCMediaDevice *)self runInternal];
      }
      else {
        id v6 = 0;
      }
    }
    [(VCObject *)self unlock];
  }
  else
  {
    if ((VCMediaDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaDevice start]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v8 = (__CFString *)[(VCMediaDevice *)self performSelector:sel_logPrefix];
      }
      else {
        v8 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v9 = VRTraceErrorLogLevelToCSTR();
        v10 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          id v15 = [(VCMediaDevice *)self stateStringForState:self->_state];
          *(_DWORD *)buf = 136316418;
          uint64_t v17 = v9;
          __int16 v18 = 2080;
          v19 = "-[VCMediaDevice start]";
          __int16 v20 = 1024;
          int v21 = 52;
          __int16 v22 = 2112;
          p_isa = &v8->isa;
          __int16 v24 = 2048;
          v25 = self;
          __int16 v26 = 2112;
          id v27 = v15;
          _os_log_error_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to start because of unexpected state=%@", buf, 0x3Au);
        }
      }
    }
    [(VCObject *)self unlock];
    uint64_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/Common/VCMediaDevice.m", 54);
    return +[VCMediaDeviceErrorUtils mediaDeviceErrorEvent:errorPath:returnCode:reason:](VCMediaDeviceErrorUtils, "mediaDeviceErrorEvent:errorPath:returnCode:reason:", 1, v11, 0, [NSString stringWithFormat:@"Cannnot Transition from %@ to %@", -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state), -[VCMediaDevice stateStringForState:](self, "stateStringForState:", 1)]);
  }
  return v6;
}

- (id)runInternal
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ([(VCMediaDevice *)self canEnterState:2])
  {
    id v3 = [(VCMediaDevice *)self onRun];
    if (v3)
    {
      if ((VCMediaDevice *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaDevice runInternal]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v4 = (__CFString *)[(VCMediaDevice *)self performSelector:sel_logPrefix];
        }
        else {
          v4 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v10 = VRTraceErrorLogLevelToCSTR();
          uint64_t v11 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            uint64_t v14 = v10;
            __int16 v15 = 2080;
            v16 = "-[VCMediaDevice runInternal]";
            __int16 v17 = 1024;
            int v18 = 79;
            __int16 v19 = 2112;
            __int16 v20 = v4;
            __int16 v21 = 2048;
            __int16 v22 = self;
            __int16 v23 = 2112;
            id v24 = v3;
            _os_log_error_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to run, error=%@", buf, 0x3Au);
          }
        }
      }
    }
    else
    {
      self->_state = 2;
    }
  }
  else
  {
    if ((VCMediaDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaDevice runInternal]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        id v5 = (__CFString *)[(VCMediaDevice *)self performSelector:sel_logPrefix];
      }
      else {
        id v5 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v6 = VRTraceErrorLogLevelToCSTR();
        v7 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          id v12 = [(VCMediaDevice *)self stateStringForState:self->_state];
          *(_DWORD *)buf = 136316418;
          uint64_t v14 = v6;
          __int16 v15 = 2080;
          v16 = "-[VCMediaDevice runInternal]";
          __int16 v17 = 1024;
          int v18 = 71;
          __int16 v19 = 2112;
          __int16 v20 = v5;
          __int16 v21 = 2048;
          __int16 v22 = self;
          __int16 v23 = 2112;
          id v24 = v12;
          _os_log_error_impl(&dword_1E1EA4000, v7, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to run because of unexpected state=%@", buf, 0x3Au);
        }
      }
    }
    [(VCObject *)self unlock];
    uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/Common/VCMediaDevice.m", 73);
    return +[VCMediaDeviceErrorUtils mediaDeviceErrorEvent:errorPath:returnCode:reason:](VCMediaDeviceErrorUtils, "mediaDeviceErrorEvent:errorPath:returnCode:reason:", 1, v8, 0, [NSString stringWithFormat:@"Cannnot Transition from %@ to %@", -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state), -[VCMediaDevice stateStringForState:](self, "stateStringForState:", 2)]);
  }
  return v3;
}

- (id)run
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ %@-run");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136316162;
      uint64_t v8 = v3;
      __int16 v9 = 2080;
      uint64_t v10 = "-[VCMediaDevice run]";
      __int16 v11 = 1024;
      int v12 = 85;
      __int16 v13 = 2112;
      uint64_t v14 = [(VCObject *)self logPrefix];
      __int16 v15 = 2048;
      v16 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ %@-run (%p)", (uint8_t *)&v7, 0x30u);
    }
  }
  [(VCObject *)self lock];
  id v5 = [(VCMediaDevice *)self runInternal];
  [(VCObject *)self unlock];
  return v5;
}

- (id)stop
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ %@-stop");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v22 = v3;
      __int16 v23 = 2080;
      id v24 = "-[VCMediaDevice stop]";
      __int16 v25 = 1024;
      int v26 = 93;
      __int16 v27 = 2112;
      p_isa = [(VCObject *)self logPrefix];
      __int16 v29 = 2048;
      v30 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ %@-stop (%p)", buf, 0x30u);
    }
  }
  [(VCObject *)self startTimeoutTimer];
  [(VCObject *)self lock];
  if (![(VCMediaDevice *)self canEnterState:0])
  {
    if ((VCMediaDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_21;
      }
      uint64_t v8 = VRTraceErrorLogLevelToCSTR();
      __int16 v9 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      uint64_t v10 = [(VCMediaDevice *)self stateStringForState:self->_state];
      *(_DWORD *)buf = 136315906;
      uint64_t v22 = v8;
      __int16 v23 = 2080;
      id v24 = "-[VCMediaDevice stop]";
      __int16 v25 = 1024;
      int v26 = 97;
      __int16 v27 = 2112;
      p_isa = v10;
      __int16 v11 = " [%s] %s:%d Unable to stop because of unexpected state=%@";
      int v12 = v9;
      uint32_t v13 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v7 = (__CFString *)[(VCMediaDevice *)self performSelector:sel_logPrefix];
      }
      else {
        int v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 5) {
        goto LABEL_21;
      }
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      __int16 v15 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_21;
      }
      id v16 = [(VCMediaDevice *)self stateStringForState:self->_state];
      *(_DWORD *)buf = 136316418;
      uint64_t v22 = v14;
      __int16 v23 = 2080;
      id v24 = "-[VCMediaDevice stop]";
      __int16 v25 = 1024;
      int v26 = 97;
      __int16 v27 = 2112;
      p_isa = &v7->isa;
      __int16 v29 = 2048;
      v30 = self;
      __int16 v31 = 2112;
      id v32 = v16;
      __int16 v11 = " [%s] %s:%d %@(%p) Unable to stop because of unexpected state=%@";
      int v12 = v15;
      uint32_t v13 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
LABEL_21:
    [(VCObject *)self unlock];
    [(VCObject *)self stopTimeoutTimer];
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/Common/VCMediaDevice.m", 100);
    return +[VCMediaDeviceErrorUtils mediaDeviceErrorEvent:errorPath:returnCode:reason:](VCMediaDeviceErrorUtils, "mediaDeviceErrorEvent:errorPath:returnCode:reason:", 1, v17, 0, [NSString stringWithFormat:@"Cannnot Transition from %@ to %@", -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state), -[VCMediaDevice stateStringForState:](self, "stateStringForState:", 0)]);
  }
  id v5 = [(VCMediaDevice *)self onStop];
  if (v5)
  {
    if ((VCMediaDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaDevice stop]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        uint64_t v6 = (__CFString *)[(VCMediaDevice *)self performSelector:sel_logPrefix];
      }
      else {
        uint64_t v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v18 = VRTraceErrorLogLevelToCSTR();
        __int16 v19 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v22 = v18;
          __int16 v23 = 2080;
          id v24 = "-[VCMediaDevice stop]";
          __int16 v25 = 1024;
          int v26 = 106;
          __int16 v27 = 2112;
          p_isa = &v6->isa;
          __int16 v29 = 2048;
          v30 = self;
          __int16 v31 = 2112;
          id v32 = v5;
          _os_log_error_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to stop, error=%@", buf, 0x3Au);
        }
      }
    }
  }
  else
  {
    self->_state = 0;
  }
  [(VCObject *)self unlock];
  [(VCObject *)self stopTimeoutTimer];
  return v5;
}

- (id)pause
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ %@-pause");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v3;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCMediaDevice pause]";
      __int16 v19 = 1024;
      int v20 = 114;
      __int16 v21 = 2112;
      p_isa = [(VCObject *)self logPrefix];
      __int16 v23 = 2048;
      id v24 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ %@-pause (%p)", buf, 0x30u);
    }
  }
  [(VCObject *)self lock];
  if ([(VCMediaDevice *)self canEnterState:3])
  {
    id v5 = [(VCMediaDevice *)self onPause];
    if (v5)
    {
      if ((VCMediaDevice *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaDevice pause]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v6 = (__CFString *)[(VCMediaDevice *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v6 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          int v12 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            uint64_t v16 = v11;
            __int16 v17 = 2080;
            uint64_t v18 = "-[VCMediaDevice pause]";
            __int16 v19 = 1024;
            int v20 = 125;
            __int16 v21 = 2112;
            p_isa = &v6->isa;
            __int16 v23 = 2048;
            id v24 = self;
            __int16 v25 = 2112;
            id v26 = v5;
            _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to pause, error=%@", buf, 0x3Au);
          }
        }
      }
    }
    else
    {
      self->_state = 3;
    }
    [(VCObject *)self unlock];
  }
  else
  {
    if ((VCMediaDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaDevice pause]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v7 = (__CFString *)[(VCMediaDevice *)self performSelector:sel_logPrefix];
      }
      else {
        int v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        __int16 v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          id v14 = [(VCMediaDevice *)self stateStringForState:self->_state];
          *(_DWORD *)buf = 136316418;
          uint64_t v16 = v8;
          __int16 v17 = 2080;
          uint64_t v18 = "-[VCMediaDevice pause]";
          __int16 v19 = 1024;
          int v20 = 117;
          __int16 v21 = 2112;
          p_isa = &v7->isa;
          __int16 v23 = 2048;
          id v24 = self;
          __int16 v25 = 2112;
          id v26 = v14;
          _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to pause because of unexpected state=%@", buf, 0x3Au);
        }
      }
    }
    [(VCObject *)self unlock];
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/Common/VCMediaDevice.m", 119);
    return +[VCMediaDeviceErrorUtils mediaDeviceErrorEvent:errorPath:returnCode:reason:](VCMediaDeviceErrorUtils, "mediaDeviceErrorEvent:errorPath:returnCode:reason:", 1, v10, 0, [NSString stringWithFormat:@"Cannnot Transition from %@ to %@", -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state), -[VCMediaDevice stateStringForState:](self, "stateStringForState:", 3)]);
  }
  return v5;
}

- (id)resume
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  MEMORY[0x1E4E57AC0](&dword_1E1EA4000, "@:@ %@-resume");
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v16 = v3;
      __int16 v17 = 2080;
      uint64_t v18 = "-[VCMediaDevice resume]";
      __int16 v19 = 1024;
      int v20 = 132;
      __int16 v21 = 2112;
      p_isa = [(VCObject *)self logPrefix];
      __int16 v23 = 2048;
      id v24 = self;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d @:@ %@-resume (%p)", buf, 0x30u);
    }
  }
  [(VCObject *)self lock];
  if ([(VCMediaDevice *)self canEnterState:2])
  {
    id v5 = [(VCMediaDevice *)self onResume];
    if (v5)
    {
      if ((VCMediaDevice *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCMediaDevice resume]();
          }
        }
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v6 = (__CFString *)[(VCMediaDevice *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v6 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          int v12 = *MEMORY[0x1E4F47A50];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136316418;
            uint64_t v16 = v11;
            __int16 v17 = 2080;
            uint64_t v18 = "-[VCMediaDevice resume]";
            __int16 v19 = 1024;
            int v20 = 143;
            __int16 v21 = 2112;
            p_isa = &v6->isa;
            __int16 v23 = 2048;
            id v24 = self;
            __int16 v25 = 2112;
            id v26 = v5;
            _os_log_error_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Failed to resume, error=%@", buf, 0x3Au);
          }
        }
      }
    }
    else
    {
      self->_state = 2;
    }
    [(VCObject *)self unlock];
  }
  else
  {
    if ((VCMediaDevice *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCMediaDevice resume]();
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        int v7 = (__CFString *)[(VCMediaDevice *)self performSelector:sel_logPrefix];
      }
      else {
        int v7 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        uint64_t v8 = VRTraceErrorLogLevelToCSTR();
        __int16 v9 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
        {
          id v14 = [(VCMediaDevice *)self stateStringForState:self->_state];
          *(_DWORD *)buf = 136316418;
          uint64_t v16 = v8;
          __int16 v17 = 2080;
          uint64_t v18 = "-[VCMediaDevice resume]";
          __int16 v19 = 1024;
          int v20 = 135;
          __int16 v21 = 2112;
          p_isa = &v7->isa;
          __int16 v23 = 2048;
          id v24 = self;
          __int16 v25 = 2112;
          id v26 = v14;
          _os_log_error_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) Unable to resume because of unexpected state=%@", buf, 0x3Au);
        }
      }
    }
    [(VCObject *)self unlock];
    uint64_t v10 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", "/Library/Caches/com.apple.xbs/Sources/AVConference/Common/VCMediaDevice.m", 137);
    return +[VCMediaDeviceErrorUtils mediaDeviceErrorEvent:errorPath:returnCode:reason:](VCMediaDeviceErrorUtils, "mediaDeviceErrorEvent:errorPath:returnCode:reason:", 1, v10, 0, [NSString stringWithFormat:@"Cannnot Transition from %@ to %@", -[VCMediaDevice stateStringForState:](self, "stateStringForState:", self->_state), -[VCMediaDevice stateStringForState:](self, "stateStringForState:", 2)]);
  }
  return v5;
}

- (id)onStart
{
  return 0;
}

- (id)onStop
{
  return 0;
}

- (id)onRun
{
  return 0;
}

- (id)onPause
{
  return 0;
}

- (id)onResume
{
  return 0;
}

- (BOOL)autoRunOnStart
{
  return 0;
}

- (BOOL)canEnterState:(unsigned int)a3
{
  switch(a3)
  {
    case 0u:
      return self->_state - 1 < 3;
    case 1u:
      BOOL v4 = self->_state == 0;
      goto LABEL_7;
    case 2u:
      BOOL v4 = (self->_state & 0xFFFFFFFD) == 1;
      goto LABEL_7;
    case 3u:
      BOOL v4 = self->_state == 2;
LABEL_7:
      BOOL result = v4;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

- (id)stateStringForState:(unsigned int)a3
{
  if (a3 > 3) {
    return @"INVALID";
  }
  else {
    return off_1E6DB8528[a3];
  }
}

- (void)start
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_8_14(v0, 168);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Unable to start because of unexpected state=%@", v3, v4, v5, v6, v7);
}

- (void)runInternal
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_8_14(v0, 168);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Unable to run because of unexpected state=%@", v3, v4, v5, v6, v7);
}

- (void)stop
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_10(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Failed to stop, error=%@");
}

- (void)pause
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_8_14(v0, 168);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Unable to pause because of unexpected state=%@", v3, v4, v5, v6, v7);
}

- (void)resume
{
  OUTLINED_FUNCTION_11_0();
  OUTLINED_FUNCTION_8_14(v0, 168);
  OUTLINED_FUNCTION_7_1();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_10_0(&dword_1E1EA4000, v1, v2, " [%s] %s:%d Unable to resume because of unexpected state=%@", v3, v4, v5, v6, v7);
}

@end