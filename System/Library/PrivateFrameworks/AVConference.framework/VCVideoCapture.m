@interface VCVideoCapture
- (VCVideoCapture)initWithCaptureServer:(id)a3 protocolFunctions:(const tagVCVideoCaptureServerProtocolRealtimeInstanceVTable *)a4;
- (VCVideoCaptureServer)captureServer;
- (tagVCVideoCaptureServerProtocolRealtimeInstanceVTable)protocolFunctions;
- (unsigned)addSink:(id)a3;
- (unsigned)removeSink:(id)a3;
- (unsigned)sinkCount;
- (void)cleanupSinkEntry:(tagVCVideoCaptureSinkEntry *)a3;
- (void)dealloc;
@end

@implementation VCVideoCapture

- (VCVideoCaptureServer)captureServer
{
  return (VCVideoCaptureServer *)objc_loadWeak(&self->_captureServer);
}

- (tagVCVideoCaptureServerProtocolRealtimeInstanceVTable)protocolFunctions
{
  return &self->_protocolFunctions;
}

- (VCVideoCapture)initWithCaptureServer:(id)a3 protocolFunctions:(const tagVCVideoCaptureServerProtocolRealtimeInstanceVTable *)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v10.receiver = self;
  v10.super_class = (Class)VCVideoCapture;
  v6 = [(VCVideoCapture *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeWeak(&v6->_captureServer, a3);
    v7->_protocolFunctions = (tagVCVideoCaptureServerProtocolRealtimeInstanceVTable)a4->onCaptureVideoFrame;
    v8 = objc_alloc_init(VideoAttributes);
    v7->_localVideoAttributes = v8;
    [(VideoAttributes *)v8 setCamera:3];
    VCSingleLinkedListInitialize((uint64_t)&v7->_sinkList, (uint64_t)VCVideoCapture_CompareSinkEntries);
    pthread_mutex_init(&v7->_sinkArrayMutex, 0);
    [(VCVideoCapture *)v7 addSink:[(VCVideoCapture *)v7 captureServer]];
  }
  return v7;
}

- (unsigned)addSink:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  p_sinkArrayMutex = &self->_sinkArrayMutex;
  pthread_mutex_lock(&self->_sinkArrayMutex);
  LODWORD(v6) = self->_sinkCount;
  if (!a3)
  {
    if ((VCVideoCapture *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v28 = VRTraceErrorLogLevelToCSTR();
        v29 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v36 = 136315650;
          *(void *)&v36[4] = v28;
          *(_WORD *)&v36[12] = 2080;
          *(void *)&v36[14] = "-[VCVideoCapture addSink:]";
          *(_WORD *)&v36[22] = 1024;
          LODWORD(v37) = 89;
          v13 = " [%s] %s:%d Invalid sink provided";
          v14 = v29;
          uint32_t v15 = 28;
          goto LABEL_23;
        }
      }
      goto LABEL_30;
    }
    if (objc_opt_respondsToSelector()) {
      v26 = (__CFString *)[(VCVideoCapture *)self performSelector:sel_logPrefix];
    }
    else {
      v26 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
      goto LABEL_30;
    }
    uint64_t v32 = VRTraceErrorLogLevelToCSTR();
    v33 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    *(_DWORD *)v36 = 136316162;
    *(void *)&v36[4] = v32;
    *(_WORD *)&v36[12] = 2080;
    *(void *)&v36[14] = "-[VCVideoCapture addSink:]";
    *(_WORD *)&v36[22] = 1024;
    LODWORD(v37) = 89;
    WORD2(v37) = 2112;
    *(void *)((char *)&v37 + 6) = v26;
    HIWORD(v37) = 2048;
    v38 = self;
    v13 = " [%s] %s:%d %@(%p) Invalid sink provided";
    v14 = v33;
LABEL_15:
    uint32_t v15 = 48;
LABEL_23:
    _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, v36, v15);
    goto LABEL_30;
  }
  v7 = malloc_type_calloc(1uLL, 0x18uLL, 0xA00402214FCE6uLL);
  if (!v7)
  {
    if ((VCVideoCapture *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v30 = VRTraceErrorLogLevelToCSTR();
        v31 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v36 = 136315906;
          *(void *)&v36[4] = v30;
          *(_WORD *)&v36[12] = 2080;
          *(void *)&v36[14] = "-[VCVideoCapture addSink:]";
          *(_WORD *)&v36[22] = 1024;
          LODWORD(v37) = 91;
          WORD2(v37) = 2048;
          *(void *)((char *)&v37 + 6) = a3;
          v13 = " [%s] %s:%d Failed to allocate the list entry for sink=%p";
          v14 = v31;
          uint32_t v15 = 38;
          goto LABEL_23;
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        v27 = (__CFString *)[(VCVideoCapture *)self performSelector:sel_logPrefix];
      }
      else {
        v27 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v34 = VRTraceErrorLogLevelToCSTR();
        v35 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v36 = 136316418;
          *(void *)&v36[4] = v34;
          *(_WORD *)&v36[12] = 2080;
          *(void *)&v36[14] = "-[VCVideoCapture addSink:]";
          *(_WORD *)&v36[22] = 1024;
          LODWORD(v37) = 91;
          WORD2(v37) = 2112;
          *(void *)((char *)&v37 + 6) = v27;
          HIWORD(v37) = 2048;
          v38 = self;
          *(_WORD *)v39 = 2048;
          *(void *)&v39[2] = a3;
          v13 = " [%s] %s:%d %@(%p) Failed to allocate the list entry for sink=%p";
          v14 = v35;
          uint32_t v15 = 58;
          goto LABEL_23;
        }
      }
    }
    goto LABEL_30;
  }
  v8 = v7;
  v7[1] = a3;
  if (objc_opt_respondsToSelector()) {
    v8[2] = [a3 copyOnVideoFrameBlock];
  }
  if ((VCSingleLinkedListPush((uint64_t)&self->_sinkList, v8) & 1) == 0)
  {
    if ((VCVideoCapture *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_29;
      }
      uint64_t v16 = VRTraceErrorLogLevelToCSTR();
      v17 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      *(_DWORD *)v36 = 136315906;
      *(void *)&v36[4] = v16;
      *(_WORD *)&v36[12] = 2080;
      *(void *)&v36[14] = "-[VCVideoCapture addSink:]";
      *(_WORD *)&v36[22] = 1024;
      LODWORD(v37) = 98;
      WORD2(v37) = 2048;
      *(void *)((char *)&v37 + 6) = a3;
      v18 = " [%s] %s:%d VCVideoSink %p was in the array, return directly";
      v19 = v17;
      uint32_t v20 = 38;
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_super v10 = (__CFString *)[(VCVideoCapture *)self performSelector:sel_logPrefix];
      }
      else {
        objc_super v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() < 7) {
        goto LABEL_29;
      }
      uint64_t v23 = VRTraceErrorLogLevelToCSTR();
      v24 = *MEMORY[0x1E4F47A50];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_29;
      }
      *(_DWORD *)v36 = 136316418;
      *(void *)&v36[4] = v23;
      *(_WORD *)&v36[12] = 2080;
      *(void *)&v36[14] = "-[VCVideoCapture addSink:]";
      *(_WORD *)&v36[22] = 1024;
      LODWORD(v37) = 98;
      WORD2(v37) = 2112;
      *(void *)((char *)&v37 + 6) = v10;
      HIWORD(v37) = 2048;
      v38 = self;
      *(_WORD *)v39 = 2048;
      *(void *)&v39[2] = a3;
      v18 = " [%s] %s:%d %@(%p) VCVideoSink %p was in the array, return directly";
      v19 = v24;
      uint32_t v20 = 58;
    }
    _os_log_impl(&dword_1E1EA4000, v19, OS_LOG_TYPE_DEFAULT, v18, v36, v20);
LABEL_29:
    -[VCVideoCapture cleanupSinkEntry:](self, "cleanupSinkEntry:", v8, *(_OWORD *)v36, *(void *)&v36[16], v37, v38, *(_OWORD *)v39);
    free(v8);
    goto LABEL_30;
  }
  v6 = (VCVideoCapture *)(self->_sinkCount + 1);
  self->_sinkCount = v6;
  if ((VCVideoCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
      goto LABEL_30;
    }
    uint64_t v11 = VRTraceErrorLogLevelToCSTR();
    v12 = *MEMORY[0x1E4F47A50];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_30;
    }
    *(_DWORD *)v36 = 136316162;
    *(void *)&v36[4] = v11;
    *(_WORD *)&v36[12] = 2080;
    *(void *)&v36[14] = "-[VCVideoCapture addSink:]";
    *(_WORD *)&v36[22] = 1024;
    LODWORD(v37) = 103;
    WORD2(v37) = 2048;
    *(void *)((char *)&v37 + 6) = a3;
    HIWORD(v37) = 2048;
    v38 = v6;
    v13 = " [%s] %s:%d Add VCVideoSink %p, new array count = %lu";
    v14 = v12;
    goto LABEL_15;
  }
  if (objc_opt_respondsToSelector()) {
    v9 = (__CFString *)[(VCVideoCapture *)self performSelector:sel_logPrefix];
  }
  else {
    v9 = &stru_1F3D3E450;
  }
  if ((int)VRTraceGetErrorLogLevelForModule() >= 6)
  {
    uint64_t v21 = VRTraceErrorLogLevelToCSTR();
    v22 = *MEMORY[0x1E4F47A50];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v36 = 136316674;
      *(void *)&v36[4] = v21;
      *(_WORD *)&v36[12] = 2080;
      *(void *)&v36[14] = "-[VCVideoCapture addSink:]";
      *(_WORD *)&v36[22] = 1024;
      LODWORD(v37) = 103;
      WORD2(v37) = 2112;
      *(void *)((char *)&v37 + 6) = v9;
      HIWORD(v37) = 2048;
      v38 = self;
      *(_WORD *)v39 = 2048;
      *(void *)&v39[2] = a3;
      *(_WORD *)&v39[10] = 2048;
      *(void *)&v39[12] = v6;
      v13 = " [%s] %s:%d %@(%p) Add VCVideoSink %p, new array count = %lu";
      v14 = v22;
      uint32_t v15 = 68;
      goto LABEL_23;
    }
  }
LABEL_30:
  pthread_mutex_unlock(p_sinkArrayMutex);
  return v6;
}

- (void)dealloc
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [(VCVideoCapture *)self removeSink:[(VCVideoCapture *)self captureServer]];
  objc_storeWeak(&self->_captureServer, 0);
  pthread_mutex_destroy(&self->_sinkArrayMutex);
  v3 = VCSingleLinkedListPop((uint64_t *)&self->_sinkList);
  if (v3)
  {
    v4 = v3;
    do
    {
      [(VCVideoCapture *)self cleanupSinkEntry:v4];
      free(v4);
      v4 = VCSingleLinkedListPop((uint64_t *)&self->_sinkList);
    }
    while (v4);
  }

  v5.receiver = self;
  v5.super_class = (Class)VCVideoCapture;
  [(VCVideoCapture *)&v5 dealloc];
}

- (unsigned)sinkCount
{
  v2 = self;
  p_sinkArrayMutex = &self->_sinkArrayMutex;
  pthread_mutex_lock(&self->_sinkArrayMutex);
  LODWORD(v2) = v2->_sinkCount;
  pthread_mutex_unlock(p_sinkArrayMutex);
  return v2;
}

- (void)cleanupSinkEntry:(tagVCVideoCaptureSinkEntry *)a3
{
  _Block_release(a3->var2);
  id var1 = a3->var1;
}

- (unsigned)removeSink:(id)a3
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  p_sinkArrayMutex = &self->_sinkArrayMutex;
  pthread_mutex_lock(&self->_sinkArrayMutex);
  LODWORD(v6) = self->_sinkCount;
  if (a3)
  {
    v31[0] = 0;
    v31[1] = a3;
    v31[2] = 0;
    v7 = VCSingleLinkedListRemove((uint64_t)&self->_sinkList, (uint64_t)v31);
    if (v7)
    {
      v8 = v7;
      uint64_t v6 = (VCVideoCapture *)(self->_sinkCount - 1);
      self->_sinkCount = v6;
      if ((VCVideoCapture *)objc_opt_class() == self)
      {
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_17;
        }
        uint64_t v11 = VRTraceErrorLogLevelToCSTR();
        v12 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 136316162;
        uint64_t v33 = v11;
        __int16 v34 = 2080;
        v35 = "-[VCVideoCapture removeSink:]";
        __int16 v36 = 1024;
        int v37 = 120;
        __int16 v38 = 2048;
        id v39 = a3;
        __int16 v40 = 2048;
        v41 = v6;
        v13 = " [%s] %s:%d Remove VCVideoSink %p, new array count = %lu";
        v14 = v12;
        uint32_t v15 = 48;
      }
      else
      {
        if (objc_opt_respondsToSelector()) {
          v9 = (__CFString *)[(VCVideoCapture *)self performSelector:sel_logPrefix];
        }
        else {
          v9 = &stru_1F3D3E450;
        }
        if ((int)VRTraceGetErrorLogLevelForModule() < 6) {
          goto LABEL_17;
        }
        uint64_t v16 = VRTraceErrorLogLevelToCSTR();
        v17 = *MEMORY[0x1E4F47A50];
        if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_17;
        }
        *(_DWORD *)buf = 136316674;
        uint64_t v33 = v16;
        __int16 v34 = 2080;
        v35 = "-[VCVideoCapture removeSink:]";
        __int16 v36 = 1024;
        int v37 = 120;
        __int16 v38 = 2112;
        id v39 = v9;
        __int16 v40 = 2048;
        v41 = self;
        __int16 v42 = 2048;
        id v43 = a3;
        __int16 v44 = 2048;
        v45 = v6;
        v13 = " [%s] %s:%d %@(%p) Remove VCVideoSink %p, new array count = %lu";
        v14 = v17;
        uint32_t v15 = 68;
      }
      _os_log_impl(&dword_1E1EA4000, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
LABEL_17:
      [(VCVideoCapture *)self cleanupSinkEntry:v8];
      free(v8);
      goto LABEL_18;
    }
    if ((VCVideoCapture *)objc_opt_class() == self)
    {
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v19 = VRTraceErrorLogLevelToCSTR();
        uint32_t v20 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315906;
          uint64_t v33 = v19;
          __int16 v34 = 2080;
          v35 = "-[VCVideoCapture removeSink:]";
          __int16 v36 = 1024;
          int v37 = 124;
          __int16 v38 = 2048;
          id v39 = a3;
          uint64_t v21 = " [%s] %s:%d VCVideoSink %p was not in the array, nothing to remove";
          v22 = v20;
          uint32_t v23 = 38;
LABEL_26:
          _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
        }
      }
    }
    else
    {
      if (objc_opt_respondsToSelector()) {
        objc_super v10 = (__CFString *)[(VCVideoCapture *)self performSelector:sel_logPrefix];
      }
      else {
        objc_super v10 = &stru_1F3D3E450;
      }
      if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
      {
        uint64_t v24 = VRTraceErrorLogLevelToCSTR();
        v25 = *MEMORY[0x1E4F47A50];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          uint64_t v33 = v24;
          __int16 v34 = 2080;
          v35 = "-[VCVideoCapture removeSink:]";
          __int16 v36 = 1024;
          int v37 = 124;
          __int16 v38 = 2112;
          id v39 = v10;
          __int16 v40 = 2048;
          v41 = self;
          __int16 v42 = 2048;
          id v43 = a3;
          uint64_t v21 = " [%s] %s:%d %@(%p) VCVideoSink %p was not in the array, nothing to remove";
          v22 = v25;
          uint32_t v23 = 58;
          goto LABEL_26;
        }
      }
    }
  }
  else if ((VCVideoCapture *)objc_opt_class() == self)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v27 = VRTraceErrorLogLevelToCSTR();
      uint64_t v28 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315650;
        uint64_t v33 = v27;
        __int16 v34 = 2080;
        v35 = "-[VCVideoCapture removeSink:]";
        __int16 v36 = 1024;
        int v37 = 114;
        uint64_t v21 = " [%s] %s:%d Invalid sink provided";
        v22 = v28;
        uint32_t v23 = 28;
        goto LABEL_26;
      }
    }
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      v26 = (__CFString *)[(VCVideoCapture *)self performSelector:sel_logPrefix];
    }
    else {
      v26 = &stru_1F3D3E450;
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 7)
    {
      uint64_t v29 = VRTraceErrorLogLevelToCSTR();
      uint64_t v30 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v33 = v29;
        __int16 v34 = 2080;
        v35 = "-[VCVideoCapture removeSink:]";
        __int16 v36 = 1024;
        int v37 = 114;
        __int16 v38 = 2112;
        id v39 = v26;
        __int16 v40 = 2048;
        v41 = self;
        uint64_t v21 = " [%s] %s:%d %@(%p) Invalid sink provided";
        v22 = v30;
        uint32_t v23 = 48;
        goto LABEL_26;
      }
    }
  }
LABEL_18:
  pthread_mutex_unlock(p_sinkArrayMutex);
  return v6;
}

uint64_t __VCVideoCapture_DistributeVideoFrame_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a2 + 16);
  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    objc_super v5 = *(uint64_t (**)(uint64_t, uint64_t, long long *, uint64_t))(v2 + 16);
    long long v13 = *(_OWORD *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 64);
    return v5(v2, v3, &v13, v4);
  }
  else
  {
    v7 = *(void **)(a2 + 8);
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(long long **)(a1 + 40);
    long long v13 = *(_OWORD *)(a1 + 48);
    uint64_t v14 = *(void *)(a1 + 64);
    long long v10 = *v9;
    int v12 = *((_DWORD *)v9 + 4);
    long long v11 = v10;
    return [v7 onVideoFrame:v8 frameTime:&v13 attribute:&v11];
  }
}

@end