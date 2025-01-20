@interface VCScreenCaptureVirtualDisplay
- (VCScreenCaptureVirtualDisplay)initWithDelegate:(id)a3 screenCaptureSourceContext:(const _VCScreenCaptureSourceContext *)a4;
- (int)pauseScreenCapture:(BOOL)a3;
- (int)setupCaptureSession:(id)a3;
- (int)startScreenCaptureWithConfig:(id)a3;
- (int)stopScreenCapture;
- (void)callbackWithEventString:(id)a3;
- (void)dealloc;
- (void)finalize;
- (void)shouldClearScreen:(BOOL)a3;
@end

@implementation VCScreenCaptureVirtualDisplay

- (VCScreenCaptureVirtualDisplay)initWithDelegate:(id)a3 screenCaptureSourceContext:(const _VCScreenCaptureSourceContext *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v7 = VRTraceErrorLogLevelToCSTR();
    v8 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      uint64_t v13 = v7;
      __int16 v14 = 2080;
      v15 = "-[VCScreenCaptureVirtualDisplay initWithDelegate:screenCaptureSourceContext:]";
      __int16 v16 = 1024;
      int v17 = 61;
      __int16 v18 = 2112;
      id v19 = a3;
      _os_log_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d inDelegate=%@", buf, 0x26u);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)VCScreenCaptureVirtualDisplay;
  v9 = [(VCObject *)&v11 init];
  if (v9)
  {
    v9->_delegate = (VCScreenCaptureSourceDelegate *)a3;
    v9->_frameCallback = *a4;
  }
  return v9;
}

- (void)dealloc
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2.receiver = self;
  v2.super_class = (Class)VCScreenCaptureVirtualDisplay;
  [(VCObject *)&v2 dealloc];
}

- (int)setupCaptureSession:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  int v5 = FigVirtualDisplayProcessorCreate();
  if (v5)
  {
    int v24 = v5;
    if ((VCScreenCaptureVirtualDisplay *)objc_opt_class() == self)
    {
      int v22 = -2146893820;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCScreenCaptureVirtualDisplay setupCaptureSession:]();
        }
      }
      return v22;
    }
    if (objc_opt_respondsToSelector()) {
      v25 = (__CFString *)-[VCScreenCaptureVirtualDisplay performSelector:](self, "performSelector:", sel_logPrefix, 0, 0, 0, 0, 0, 0, 0);
    }
    else {
      v25 = &stru_1F3D3E450;
    }
    int v22 = -2146893820;
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v22;
    }
    uint64_t v30 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v22;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v37 = v30;
    __int16 v38 = 2080;
    v39 = "-[VCScreenCaptureVirtualDisplay setupCaptureSession:]";
    __int16 v40 = 1024;
    int v41 = 84;
    __int16 v42 = 2112;
    v43 = v25;
    __int16 v44 = 2048;
    v45 = self;
    __int16 v46 = 1024;
    LODWORD(v47) = v24;
    v32 = " [%s] %s:%d %@(%p) FigVirtualDisplayProcessorCreate %d";
LABEL_58:
    _os_log_error_impl(&dword_1E1EA4000, v31, OS_LOG_TYPE_ERROR, v32, buf, 0x36u);
    return v22;
  }
  uint64_t CMBaseObject = FigVirtualDisplayProcessorGetCMBaseObject();
  uint64_t v7 = *(void *)(CMBaseObjectGetVTable() + 8);
  if (v7) {
    uint64_t v8 = v7;
  }
  else {
    uint64_t v8 = 0;
  }
  v9 = *(void (**)(uint64_t, void, void *))(v8 + 56);
  if (v9) {
    v9(CMBaseObject, *MEMORY[0x1E4F34DF0], &unk_1F3DC30A8);
  }
  if ((VCScreenCaptureVirtualDisplay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          uint64_t v13 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description", 0, 0, 0, 0, 0, 0, 0), "UTF8String");
        }
        else {
          uint64_t v13 = "<nil>";
        }
        *(_DWORD *)buf = 136315906;
        uint64_t v37 = v11;
        __int16 v38 = 2080;
        v39 = "-[VCScreenCaptureVirtualDisplay setupCaptureSession:]";
        __int16 v40 = 1024;
        int v41 = 86;
        __int16 v42 = 2080;
        v43 = (void *)v13;
        int v17 = " [%s] %s:%d FigVirtualDisplayProcessorCreate options: %s";
        __int16 v18 = v12;
        uint32_t v19 = 38;
        goto LABEL_23;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v10 = (__CFString *)-[VCScreenCaptureVirtualDisplay performSelector:](self, "performSelector:", sel_logPrefix, 0, 0, 0, 0, 0, 0, 0);
    }
    else {
      v10 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v14 = VRTraceErrorLogLevelToCSTR();
      v15 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        if (a3) {
          __int16 v16 = (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String");
        }
        else {
          __int16 v16 = "<nil>";
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v37 = v14;
        __int16 v38 = 2080;
        v39 = "-[VCScreenCaptureVirtualDisplay setupCaptureSession:]";
        __int16 v40 = 1024;
        int v41 = 86;
        __int16 v42 = 2112;
        v43 = v10;
        __int16 v44 = 2048;
        v45 = self;
        __int16 v46 = 2080;
        v47 = v16;
        int v17 = " [%s] %s:%d %@(%p) FigVirtualDisplayProcessorCreate options: %s";
        __int16 v18 = v15;
        uint32_t v19 = 58;
LABEL_23:
        _os_log_impl(&dword_1E1EA4000, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
      }
    }
  }
  v35 = self;
  int v20 = FigVirtualDisplaySinkConduitCreate();
  if (v20)
  {
    int v26 = v20;
    int v22 = -2146893820;
    if ((VCScreenCaptureVirtualDisplay *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCScreenCaptureVirtualDisplay setupCaptureSession:]();
        }
      }
      return v22;
    }
    if (objc_opt_respondsToSelector()) {
      v27 = (__CFString *)-[VCScreenCaptureVirtualDisplay performSelector:](self, "performSelector:", sel_logPrefix, v35);
    }
    else {
      v27 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
      return v22;
    }
    uint64_t v33 = VRTraceErrorLogLevelToCSTR();
    v31 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
      return v22;
    }
    *(_DWORD *)buf = 136316418;
    uint64_t v37 = v33;
    __int16 v38 = 2080;
    v39 = "-[VCScreenCaptureVirtualDisplay setupCaptureSession:]";
    __int16 v40 = 1024;
    int v41 = 94;
    __int16 v42 = 2112;
    v43 = v27;
    __int16 v44 = 2048;
    v45 = self;
    __int16 v46 = 1024;
    LODWORD(v47) = v26;
    v32 = " [%s] %s:%d %@(%p) FigVirtualDisplaySinkConduitCreate %d";
    goto LABEL_58;
  }
  FigVirtualDisplaySourceScreenGetCurrent();
  int v21 = FigVirtualDisplaySessionCreateWithComponents();
  if (!v21) {
    return 0;
  }
  int v28 = v21;
  int v22 = -2146893820;
  if ((VCScreenCaptureVirtualDisplay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCScreenCaptureVirtualDisplay setupCaptureSession:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v29 = (__CFString *)-[VCScreenCaptureVirtualDisplay performSelector:](self, "performSelector:", sel_logPrefix, v35);
    }
    else {
      v29 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v34 = VRTraceErrorLogLevelToCSTR();
      v31 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v37 = v34;
        __int16 v38 = 2080;
        v39 = "-[VCScreenCaptureVirtualDisplay setupCaptureSession:]";
        __int16 v40 = 1024;
        int v41 = 97;
        __int16 v42 = 2112;
        v43 = v29;
        __int16 v44 = 2048;
        v45 = self;
        __int16 v46 = 1024;
        LODWORD(v47) = v28;
        v32 = " [%s] %s:%d %@(%p) FigVirtualDisplaySessionCreateWithComponents %d";
        goto LABEL_58;
      }
    }
  }
  return v22;
}

- (int)startScreenCaptureWithConfig:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v35 = v5;
      __int16 v36 = 2080;
      uint64_t v37 = "-[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:]";
      __int16 v38 = 1024;
      int v39 = 110;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Starting FigVirtualDisplay Screen Capture", buf, 0x1Cu);
    }
  }
  session = self->_session;
  if (session)
  {
    uint64_t v8 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v8) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    v10 = *(void (**)(OpaqueFigVirtualDisplaySession *))(v9 + 16);
    if (v10) {
      v10(session);
    }
    uint64_t v11 = self->_session;
    if (v11)
    {
      CFRelease(v11);
      self->_session = 0;
    }
  }
  int v12 = [(VCScreenCaptureVirtualDisplay *)self setupCaptureSession:a3];
  if (v12)
  {
    int v22 = v12;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:]();
      }
    }
    return v22;
  }
  uint64_t v13 = self->_session;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __62__VCScreenCaptureVirtualDisplay_startScreenCaptureWithConfig___block_invoke;
  v33[3] = &unk_1E6DB4D98;
  v33[4] = self;
  uint64_t v14 = *(void *)(CMBaseObjectGetVTable() + 16);
  if (v14) {
    uint64_t v15 = v14;
  }
  else {
    uint64_t v15 = 0;
  }
  __int16 v16 = *(uint64_t (**)(OpaqueFigVirtualDisplaySession *, id, void *))(v15 + 8);
  if (v16)
  {
    int v17 = v16(v13, a3, v33);
    if (!v17)
    {
      __int16 v18 = self->_session;
      uint64_t v19 = *(void *)(CMBaseObjectGetVTable() + 16);
      if (v19) {
        uint64_t v20 = v19;
      }
      else {
        uint64_t v20 = 0;
      }
      v27 = *(uint64_t (**)(OpaqueFigVirtualDisplaySession *))(v20 + 40);
      if (v27)
      {
        int v28 = v27(v18);
        if (!v28) {
          return 0;
        }
        int v29 = v28;
      }
      else
      {
        int v29 = -12782;
      }
      int v22 = -2146893820;
      if ((VCScreenCaptureVirtualDisplay *)objc_opt_class() != self)
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v30 = (__CFString *)[(VCScreenCaptureVirtualDisplay *)self performSelector:sel_logPrefix];
        }
        else {
          uint64_t v30 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 3) {
          return v22;
        }
        uint64_t v31 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          return v22;
        }
        *(_DWORD *)buf = 136316418;
        uint64_t v35 = v31;
        __int16 v36 = 2080;
        uint64_t v37 = "-[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:]";
        __int16 v38 = 1024;
        int v39 = 133;
        __int16 v40 = 2112;
        int v41 = v30;
        __int16 v42 = 2048;
        v43 = self;
        __int16 v44 = 1024;
        int v45 = v29;
        int v26 = " [%s] %s:%d %@(%p) FigVirtualDisplaySessionGetStartStatus %d";
LABEL_47:
        _os_log_error_impl(&dword_1E1EA4000, v25, OS_LOG_TYPE_ERROR, v26, buf, 0x36u);
        return v22;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
      {
        VRTraceErrorLogLevelToCSTR();
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
          -[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:]();
        }
      }
      return v22;
    }
    int v21 = v17;
  }
  else
  {
    int v21 = -12782;
  }
  int v22 = -2146893820;
  if ((VCScreenCaptureVirtualDisplay *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:]();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v23 = (__CFString *)[(VCScreenCaptureVirtualDisplay *)self performSelector:sel_logPrefix];
    }
    else {
      v23 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v24 = VRTraceErrorLogLevelToCSTR();
      v25 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316418;
        uint64_t v35 = v24;
        __int16 v36 = 2080;
        uint64_t v37 = "-[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:]";
        __int16 v38 = 1024;
        int v39 = 129;
        __int16 v40 = 2112;
        int v41 = v23;
        __int16 v42 = 2048;
        v43 = self;
        __int16 v44 = 1024;
        int v45 = v21;
        int v26 = " [%s] %s:%d %@(%p) FigVirtualDisplaySessionStart failed %d";
        goto LABEL_47;
      }
    }
  }
  return v22;
}

void __62__VCScreenCaptureVirtualDisplay_startScreenCaptureWithConfig___block_invoke(uint64_t a1, int a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void **)(a1 + 32);
  if (!a2)
  {
    if (objc_opt_class() == *(void *)(a1 + 32))
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return;
      }
      uint64_t v10 = VRTraceErrorLogLevelToCSTR();
      uint64_t v11 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      int v18 = 136315650;
      uint64_t v19 = v10;
      __int16 v20 = 2080;
      int v21 = "-[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 123;
      int v12 = " [%s] %s:%d startPreview FigVirtualDisplaySessionStart succeeded";
      uint64_t v13 = v11;
      uint32_t v14 = 28;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v6 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
      }
      else {
        v6 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        return;
      }
      uint64_t v15 = VRTraceErrorLogLevelToCSTR();
      __int16 v16 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        return;
      }
      uint64_t v17 = *(void *)(a1 + 32);
      int v18 = 136316162;
      uint64_t v19 = v15;
      __int16 v20 = 2080;
      int v21 = "-[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:]_block_invoke";
      __int16 v22 = 1024;
      int v23 = 123;
      __int16 v24 = 2112;
      v25 = v6;
      __int16 v26 = 2048;
      uint64_t v27 = v17;
      int v12 = " [%s] %s:%d %@(%p) startPreview FigVirtualDisplaySessionStart succeeded";
      uint64_t v13 = v16;
      uint32_t v14 = 48;
    }
    _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, v14);
    return;
  }
  [v3 callbackWithEventString:@"vcScreenCaptureFailStart"];
  if (objc_opt_class() == *(void *)(a1 + 32))
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        __62__VCScreenCaptureVirtualDisplay_startScreenCaptureWithConfig___block_invoke_cold_1();
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      uint64_t v5 = (__CFString *)[*(id *)(a1 + 32) performSelector:sel_logPrefix];
    }
    else {
      uint64_t v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v7 = VRTraceErrorLogLevelToCSTR();
      uint64_t v8 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        uint64_t v9 = *(void *)(a1 + 32);
        int v18 = 136316418;
        uint64_t v19 = v7;
        __int16 v20 = 2080;
        int v21 = "-[VCScreenCaptureVirtualDisplay startScreenCaptureWithConfig:]_block_invoke";
        __int16 v22 = 1024;
        int v23 = 126;
        __int16 v24 = 2112;
        v25 = v5;
        __int16 v26 = 2048;
        uint64_t v27 = v9;
        __int16 v28 = 1024;
        int v29 = a2;
        _os_log_error_impl(&dword_1E1EA4000, v8, OS_LOG_TYPE_ERROR, " [%s] %s:%d %@(%p) startPreview FigVirtualDisplaySessionStart error %d", (uint8_t *)&v18, 0x36u);
      }
    }
  }
}

- (int)stopScreenCapture
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      uint64_t v16 = v3;
      __int16 v17 = 2080;
      int v18 = "-[VCScreenCaptureVirtualDisplay stopScreenCapture]";
      __int16 v19 = 1024;
      int v20 = 140;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Stopping FigVirtualDisplay Screen Capture", (uint8_t *)&v15, 0x1Cu);
    }
  }
  session = self->_session;
  if (session)
  {
    uint64_t v6 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v6) {
      uint64_t v7 = v6;
    }
    else {
      uint64_t v7 = 0;
    }
    uint64_t v8 = *(void (**)(OpaqueFigVirtualDisplaySession *))(v7 + 16);
    if (v8) {
      v8(session);
    }
    uint64_t v9 = self->_session;
    if (v9)
    {
      uint64_t v10 = *(void *)(CMBaseObjectGetVTable() + 8);
      if (v10) {
        uint64_t v11 = v10;
      }
      else {
        uint64_t v11 = 0;
      }
      int v12 = *(void (**)(OpaqueFigVirtualDisplaySession *))(v11 + 24);
      if (v12) {
        v12(v9);
      }
      uint64_t v13 = self->_session;
      if (v13)
      {
        CFRelease(v13);
        self->_session = 0;
      }
    }
  }
  return 0;
}

- (int)pauseScreenCapture:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = "Resuming";
      uint64_t v18 = v5;
      int v17 = 136315906;
      int v20 = "-[VCScreenCaptureVirtualDisplay pauseScreenCapture:]";
      __int16 v19 = 2080;
      if (v3) {
        uint64_t v7 = "Pausing";
      }
      __int16 v21 = 1024;
      int v22 = 150;
      __int16 v23 = 2080;
      __int16 v24 = v7;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s FigVirtualDisplay Screen Capture", (uint8_t *)&v17, 0x26u);
    }
  }
  session = self->_session;
  if (session)
  {
    uint64_t v9 = *(void *)(CMBaseObjectGetVTable() + 16);
    if (v3)
    {
      if (v9) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      int v15 = *(void (**)(OpaqueFigVirtualDisplaySession *))(v10 + 24);
      if (v15) {
LABEL_22:
      }
        v15(session);
    }
    else
    {
      if (v9) {
        uint64_t v14 = v9;
      }
      else {
        uint64_t v14 = 0;
      }
      int v15 = *(void (**)(OpaqueFigVirtualDisplaySession *))(v14 + 32);
      if (v15) {
        goto LABEL_22;
      }
    }
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() >= 5)
  {
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    int v12 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v13 = "Resuming";
      int v17 = 136315906;
      uint64_t v18 = v11;
      __int16 v19 = 2080;
      int v20 = "-[VCScreenCaptureVirtualDisplay pauseScreenCapture:]";
      if (v3) {
        uint64_t v13 = "Pausing";
      }
      __int16 v21 = 1024;
      int v22 = 158;
      __int16 v23 = 2080;
      __int16 v24 = v13;
      _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d %s FigVirtualDisplay Screen Capture ignored due to nil session", (uint8_t *)&v17, 0x26u);
    }
  }
  return 0;
}

- (void)finalize
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v3 = VRTraceErrorLogLevelToCSTR();
    v4 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315650;
      uint64_t v6 = v3;
      __int16 v7 = 2080;
      uint64_t v8 = "-[VCScreenCaptureVirtualDisplay finalize]";
      __int16 v9 = 1024;
      int v10 = 164;
      _os_log_impl(&dword_1E1EA4000, v4, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d Finalizing FigVirtualDisplay Screen Capture", (uint8_t *)&v5, 0x1Cu);
    }
  }
  [(VCScreenCaptureVirtualDisplay *)self stopScreenCapture];

  self->_delegate = 0;
  self->_frameCallback.sinkContext = 0;
  self->_frameCallback.sinkCallback = 0;
}

- (void)shouldClearScreen:(BOOL)a3
{
  delegate = self->_delegate;
  if (delegate) {
    [(VCScreenCaptureSourceDelegate *)delegate screenCaptureSourceShouldClearScreen:a3];
  }
}

- (void)callbackWithEventString:(id)a3
{
  delegate = self->_delegate;
  if (delegate) {
    [(VCScreenCaptureSourceDelegate *)delegate screenCaptureSourceProcessEventString:a3];
  }
}

- (void)setupCaptureSession:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d FigVirtualDisplaySessionCreateWithComponents %d", v2, v3, v4, v5);
}

- (void)setupCaptureSession:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d FigVirtualDisplaySinkConduitCreate %d", v2, v3, v4, v5);
}

- (void)setupCaptureSession:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d FigVirtualDisplayProcessorCreate %d", v2, v3, v4, v5);
}

- (void)startScreenCaptureWithConfig:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d FigVirtualDisplaySessionStart failed %d", v2, v3, v4, v5);
}

- (void)startScreenCaptureWithConfig:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d FigVirtualDisplaySessionGetStartStatus %d", v2, v3, v4, v5);
}

- (void)startScreenCaptureWithConfig:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Setup Screen Capture failed error=%d", v2, v3, v4, v5);
}

void __62__VCScreenCaptureVirtualDisplay_startScreenCaptureWithConfig___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, " [%s] %s:%d startPreview FigVirtualDisplaySessionStart error %d", v2, v3, v4, v5);
}

@end