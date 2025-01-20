@interface AVCScreenCaptureAttributes
- (AVCScreenCaptureAttributes)initWithConfiguration:(id)a3;
- (CGRect)contentRect;
- (float)pointPixelScale;
- (int64_t)contentType;
- (unsigned)displayID;
- (void)dealloc;
@end

@implementation AVCScreenCaptureAttributes

- (AVCScreenCaptureAttributes)initWithConfiguration:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  v22.receiver = self;
  v22.super_class = (Class)AVCScreenCaptureAttributes;
  v4 = [(AVCScreenCaptureAttributes *)&v22 init];
  if (!v4) {
    goto LABEL_34;
  }
  if ((char *)objc_opt_class() == v4)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v6 = VRTraceErrorLogLevelToCSTR();
      v7 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        *(void *)&buf[4] = v6;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[AVCScreenCaptureAttributes initWithConfiguration:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 22;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = a3;
        v8 = " [%s] %s:%d configuration=%@";
        v9 = v7;
        uint32_t v10 = 38;
LABEL_12:
        _os_log_impl(&dword_1E1EA4000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v5 = (__CFString *)[v4 performSelector:sel_logPrefix];
    }
    else {
      v5 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v11 = VRTraceErrorLogLevelToCSTR();
      v12 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316418;
        *(void *)&buf[4] = v11;
        *(_WORD *)&buf[12] = 2080;
        *(void *)&buf[14] = "-[AVCScreenCaptureAttributes initWithConfiguration:]";
        *(_WORD *)&buf[22] = 1024;
        *(_DWORD *)&buf[24] = 22;
        *(_WORD *)&buf[28] = 2112;
        *(void *)&buf[30] = v5;
        __int16 v30 = 2048;
        v31 = v4;
        __int16 v32 = 2112;
        id v33 = a3;
        v8 = " [%s] %s:%d %@(%p) configuration=%@";
        v9 = v12;
        uint32_t v10 = 58;
        goto LABEL_12;
      }
    }
  }
  v13 = (void *)[a3 objectForKey:@"vcScreenCaptureAttributesStreamType"];
  if (!v13)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCScreenCaptureAttributes initWithConfiguration:]();
      }
    }
    goto LABEL_34;
  }
  *((void *)v4 + 2) = [v13 integerValue];
  v14 = (void *)[a3 objectForKey:@"vcScreenCaptureAttributesPixelScale"];
  if (!v14)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCScreenCaptureAttributes initWithConfiguration:]();
      }
    }
    goto LABEL_34;
  }
  [v14 floatValue];
  *((_DWORD *)v4 + 2) = v15;
  CFDictionaryRef v16 = (const __CFDictionary *)[a3 objectForKey:@"vcScreenCaptureAttributesContentsRect"];
  if (!v16)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCScreenCaptureAttributes initWithConfiguration:]();
      }
    }
    goto LABEL_34;
  }
  memset(buf, 0, 32);
  CGRectMakeWithDictionaryRepresentation(v16, (CGRect *)buf);
  long long v17 = *(_OWORD *)&buf[16];
  *(_OWORD *)(v4 + 24) = *(_OWORD *)buf;
  *(_OWORD *)(v4 + 40) = v17;
  if (*((void *)v4 + 2))
  {
    v18 = (void *)[a3 objectForKey:@"vcScreenCaptureAttributesDisplayID"];
    if (v18)
    {
      *((_DWORD *)v4 + 3) = [v18 unsignedIntValue];
      return (AVCScreenCaptureAttributes *)v4;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[AVCScreenCaptureAttributes initWithConfiguration:].cold.4();
      }
    }
LABEL_34:

    return 0;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
  {
    uint64_t v19 = VRTraceErrorLogLevelToCSTR();
    v20 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v23 = 136315650;
      uint64_t v24 = v19;
      __int16 v25 = 2080;
      v26 = "-[AVCScreenCaptureAttributes initWithConfiguration:]";
      __int16 v27 = 1024;
      int v28 = 38;
      _os_log_impl(&dword_1E1EA4000, v20, OS_LOG_TYPE_DEFAULT, " [%s] %s:%d displayID ignored sinced contentType is not display bound", v23, 0x1Cu);
    }
  }
  return (AVCScreenCaptureAttributes *)v4;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if ((AVCScreenCaptureAttributes *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v4 = VRTraceErrorLogLevelToCSTR();
      v5 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v13 = v4;
        __int16 v14 = 2080;
        int v15 = "-[AVCScreenCaptureAttributes dealloc]";
        __int16 v16 = 1024;
        int v17 = 54;
        uint64_t v6 = " [%s] %s:%d ";
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
      v3 = (__CFString *)[(AVCScreenCaptureAttributes *)self performSelector:sel_logPrefix];
    }
    else {
      v3 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
    {
      uint64_t v9 = VRTraceErrorLogLevelToCSTR();
      uint32_t v10 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v13 = v9;
        __int16 v14 = 2080;
        int v15 = "-[AVCScreenCaptureAttributes dealloc]";
        __int16 v16 = 1024;
        int v17 = 54;
        __int16 v18 = 2112;
        uint64_t v19 = v3;
        __int16 v20 = 2048;
        v21 = self;
        uint64_t v6 = " [%s] %s:%d %@(%p) ";
        v7 = v10;
        uint32_t v8 = 48;
        goto LABEL_11;
      }
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)AVCScreenCaptureAttributes;
  [(AVCScreenCaptureAttributes *)&v11 dealloc];
}

- (int64_t)contentType
{
  return self->_contentType;
}

- (float)pointPixelScale
{
  return self->_pointPixelScale;
}

- (CGRect)contentRect
{
  double x = self->_contentRect.origin.x;
  double y = self->_contentRect.origin.y;
  double width = self->_contentRect.size.width;
  double height = self->_contentRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (unsigned)displayID
{
  return self->_displayID;
}

- (void)initWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Content type is not provided", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Pixel scale is not provided", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Contents rect is not provided", v2, v3, v4, v5, v6);
}

- (void)initWithConfiguration:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, " [%s] %s:%d Display ID is not provided, but content type is display bound", v2, v3, v4, v5, v6);
}

@end