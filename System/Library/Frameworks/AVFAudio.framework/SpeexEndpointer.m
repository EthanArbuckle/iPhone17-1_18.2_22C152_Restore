@interface SpeexEndpointer
- (BOOL)configureWithASBD:(AudioStreamBasicDescription *)a3 andFrameRate:(unsigned int)a4;
- (BOOL)configureWithSampleRate:(double)a3 andFrameRate:(unsigned int)a4;
- (SpeexEndpointer)init;
- (double)endWaitTime;
- (double)interspeechWaitTime;
- (double)startWaitTime;
- (int)endpointMode;
- (int)getStatus:(AudioQueueBuffer *)a3;
- (int)getStatus:(float *)a3 count:(unsigned int)a4;
- (void)dealloc;
- (void)reset;
- (void)setEndWaitTime:(double)a3;
- (void)setEndpointMode:(int)a3;
- (void)setInterspeechWaitTime:(double)a3;
- (void)setStartWaitTime:(double)a3;
@end

@implementation SpeexEndpointer

- (void)setEndWaitTime:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  double v5 = fmax(a3, 0.25);
  if (a3 == -1.0) {
    double v6 = 10000000.0;
  }
  else {
    double v6 = v5;
  }
  self->mEndWaitTime = v6;
  if (kAVVCScope)
  {
    v7 = *(NSObject **)kAVVCScope;
    if (!*(void *)kAVVCScope) {
      goto LABEL_10;
    }
  }
  else
  {
    v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315650;
    v11 = "SpeexEndpointer.mm";
    __int16 v12 = 1024;
    int v13 = 260;
    __int16 v14 = 2048;
    double v15 = v6;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer setEndWaitTime: %f", (uint8_t *)&v10, 0x1Cu);
  }
LABEL_10:
  if (!impl->var0) {
    return;
  }
  LODWORD(v5) = self->mFrameRate;
  unsigned int v8 = (self->mEndWaitTime * (double)*(unint64_t *)&v5);
  *((_DWORD *)impl->var0 + 10) = v8;
  if (kAVVCScope)
  {
    v9 = *(NSObject **)kAVVCScope;
    if (!*(void *)kAVVCScope) {
      return;
    }
  }
  else
  {
    v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    v11 = "QualityDetector.cpp";
    __int16 v12 = 1024;
    int v13 = 190;
    __int16 v14 = 1024;
    LODWORD(v15) = v8;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d QualityDetector: End Timeout: %u frames", (uint8_t *)&v10, 0x18u);
  }
}

- (double)endWaitTime
{
  return self->mEndWaitTime;
}

- (void)setInterspeechWaitTime:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  double v5 = fmax(a3, 0.25);
  if (a3 == -1.0) {
    double v6 = 10000000.0;
  }
  else {
    double v6 = v5;
  }
  self->mInterspeechWaitTime = v6;
  if (kAVVCScope)
  {
    v7 = *(NSObject **)kAVVCScope;
    if (!*(void *)kAVVCScope) {
      goto LABEL_10;
    }
  }
  else
  {
    v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315650;
    v11 = "SpeexEndpointer.mm";
    __int16 v12 = 1024;
    int v13 = 246;
    __int16 v14 = 2048;
    double v15 = v6;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer setInterspeechWaitTime: %f", (uint8_t *)&v10, 0x1Cu);
  }
LABEL_10:
  if (!impl->var0) {
    return;
  }
  LODWORD(v5) = self->mFrameRate;
  unsigned int v8 = (self->mInterspeechWaitTime * (double)*(unint64_t *)&v5);
  *((_DWORD *)impl->var0 + 8) = v8;
  if (kAVVCScope)
  {
    v9 = *(NSObject **)kAVVCScope;
    if (!*(void *)kAVVCScope) {
      return;
    }
  }
  else
  {
    v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    v11 = "QualityDetector.cpp";
    __int16 v12 = 1024;
    int v13 = 184;
    __int16 v14 = 1024;
    LODWORD(v15) = v8;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d QualityDetector: Interspeech Timeout: %u frames", (uint8_t *)&v10, 0x18u);
  }
}

- (double)interspeechWaitTime
{
  return self->mInterspeechWaitTime;
}

- (void)setStartWaitTime:(double)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  double v5 = fmax(a3, 0.25);
  if (a3 == -1.0) {
    double v6 = 10000000.0;
  }
  else {
    double v6 = v5;
  }
  self->mStartWaitTime = v6;
  if (kAVVCScope)
  {
    v7 = *(NSObject **)kAVVCScope;
    if (!*(void *)kAVVCScope) {
      goto LABEL_10;
    }
  }
  else
  {
    v7 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v10 = 136315650;
    v11 = "SpeexEndpointer.mm";
    __int16 v12 = 1024;
    int v13 = 232;
    __int16 v14 = 2048;
    double v15 = v6;
    _os_log_impl(&dword_19D794000, v7, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer setStartWaitTime: %f", (uint8_t *)&v10, 0x1Cu);
  }
LABEL_10:
  if (!impl->var0) {
    return;
  }
  LODWORD(v5) = self->mFrameRate;
  unsigned int v8 = (self->mStartWaitTime * (double)*(unint64_t *)&v5);
  *((_DWORD *)impl->var0 + 9) = v8;
  if (kAVVCScope)
  {
    v9 = *(NSObject **)kAVVCScope;
    if (!*(void *)kAVVCScope) {
      return;
    }
  }
  else
  {
    v9 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    int v10 = 136315650;
    v11 = "QualityDetector.cpp";
    __int16 v12 = 1024;
    int v13 = 178;
    __int16 v14 = 1024;
    LODWORD(v15) = v8;
    _os_log_impl(&dword_19D794000, v9, OS_LOG_TYPE_INFO, "%25s:%-5d QualityDetector: Start Timeout: %u frames", (uint8_t *)&v10, 0x18u);
  }
}

- (double)startWaitTime
{
  return self->mStartWaitTime;
}

- (void)setEndpointMode:(int)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  self->mEndpointMode = a3;
  if (kAVVCScope)
  {
    double v6 = *(NSObject **)kAVVCScope;
    if (!*(void *)kAVVCScope) {
      goto LABEL_7;
    }
  }
  else
  {
    double v6 = MEMORY[0x1E4F14500];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    int v8 = 136315650;
    v9 = "SpeexEndpointer.mm";
    __int16 v10 = 1024;
    int v11 = 218;
    __int16 v12 = 1024;
    int v13 = a3;
    _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer setEndpointMode: %d", (uint8_t *)&v8, 0x18u);
  }
LABEL_7:
  if (impl->var0)
  {
    if (self->mEndpointMode == 1) {
      int v7 = 1;
    }
    else {
      int v7 = 2;
    }
    *((_DWORD *)impl->var0 + 5) = v7;
  }
}

- (int)endpointMode
{
  return self->mEndpointMode;
}

- (void)reset
{
  impl = self->_impl;
  var0 = (unsigned int *)impl->var0;
  if (impl->var0)
  {
    if (var0[2])
    {
      unint64_t v4 = 0;
      uint64_t v5 = *(void *)var0;
      do
        *(_DWORD *)(v5 + 4 * v4++) = 0;
      while (v4 < var0[2]);
    }
    *((void *)var0 + 6) = 0;
    var0[11] = 0;
  }
  var1 = impl->var1;
  bzero(*((void **)var1 + 1), 4 * *(_DWORD *)var1);
  *((_DWORD *)var1 + 6) = 0;
}

- (int)getStatus:(AudioQueueBuffer *)a3
{
  return self->mLastStatus;
}

- (BOOL)configureWithASBD:(AudioStreamBasicDescription *)a3 andFrameRate:(unsigned int)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    if ((*(unsigned char *)(kAVVCScope + 12) & 0x10) != 0)
    {
      double v6 = *(NSObject **)kAVVCScope;
      if (*(void *)kAVVCScope)
      {
        if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
        {
          int v10 = 136315394;
          int v11 = "SpeexEndpointer.mm";
          __int16 v12 = 1024;
          int v13 = 169;
          _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer configureWithASBD:andFrameRate", (uint8_t *)&v10, 0x12u);
        }
      }
    }
  }
  var0 = (uint64_t *)self->_impl->var0;
  if (var0) {
    QualityDetectorDestroy(var0);
  }
  if (!a4)
  {
    if (kAVVCScope)
    {
      int v8 = *(NSObject **)kAVVCScope;
      if (!*(void *)kAVVCScope) {
        goto LABEL_9;
      }
    }
    else
    {
      int v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      int v11 = "SpeexEndpointer.mm";
      __int16 v12 = 1024;
      int v13 = 175;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d SpeexEndpointer configureWithSampleRate:andFrameRate: illegal frame rate!", (uint8_t *)&v10, 0x12u);
    }
  }
LABEL_9:
  self->mFrameRate = a4;
  QualityDetectorCreate();
}

- (BOOL)configureWithSampleRate:(double)a3 andFrameRate:(unsigned int)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    if ((*(unsigned char *)(kAVVCScope + 12) & 0x10) != 0)
    {
      double v6 = *(NSObject **)kAVVCScope;
      if (*(void *)kAVVCScope)
      {
        if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
        {
          int v10 = 136315394;
          int v11 = "SpeexEndpointer.mm";
          __int16 v12 = 1024;
          int v13 = 140;
          _os_log_impl(&dword_19D794000, v6, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer configureWithSampleRate:", (uint8_t *)&v10, 0x12u);
        }
      }
    }
  }
  var0 = (uint64_t *)self->_impl->var0;
  if (var0) {
    QualityDetectorDestroy(var0);
  }
  if (!a4)
  {
    if (kAVVCScope)
    {
      int v8 = *(NSObject **)kAVVCScope;
      if (!*(void *)kAVVCScope) {
        goto LABEL_9;
      }
    }
    else
    {
      int v8 = MEMORY[0x1E4F14500];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      int v11 = "SpeexEndpointer.mm";
      __int16 v12 = 1024;
      int v13 = 146;
      _os_log_impl(&dword_19D794000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d SpeexEndpointer configureWithSampleRate:andFrameRate: illegal frame rate!", (uint8_t *)&v10, 0x12u);
    }
  }
LABEL_9:
  self->mFrameRate = a4;
  QualityDetectorCreate();
}

- (void)dealloc
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (kAVVCScope)
  {
    if ((*(unsigned char *)(kAVVCScope + 12) & 0x10) != 0)
    {
      v3 = *(NSObject **)kAVVCScope;
      if (*(void *)kAVVCScope)
      {
        if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          int v10 = "SpeexEndpointer.mm";
          __int16 v11 = 1024;
          int v12 = 128;
          _os_log_impl(&dword_19D794000, v3, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer dealloc:", buf, 0x12u);
        }
      }
    }
  }
  impl = self->_impl;
  if (impl->var0) {
    QualityDetectorDestroy((uint64_t *)impl->var0);
  }
  var1 = impl->var1;
  if (var1)
  {
    uint64_t v6 = *((void *)var1 + 1);
    if (v6) {
      MEMORY[0x19F3ABB10](v6, 0x1000C8052888210);
    }
    uint64_t v7 = *((void *)var1 + 2);
    if (v7) {
      MEMORY[0x19F3ABB10](v7, 0x1000C8052888210);
    }
    MEMORY[0x19F3ABB30](var1, 0x1080C40ABE71A98);
  }
  MEMORY[0x19F3ABB30](impl, 0xA0C40BD48D6D6);
  self->_impl = 0;
  v8.receiver = self;
  v8.super_class = (Class)SpeexEndpointer;
  [(SpeexEndpointer *)&v8 dealloc];
}

- (SpeexEndpointer)init
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v4.receiver = self;
  v4.super_class = (Class)SpeexEndpointer;
  if ([(SpeexEndpointer *)&v4 init]) {
    operator new();
  }
  if (kAVVCScope)
  {
    if ((*(unsigned char *)(kAVVCScope + 12) & 0x10) != 0)
    {
      v2 = *(NSObject **)kAVVCScope;
      if (*(void *)kAVVCScope)
      {
        if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          uint64_t v6 = "SpeexEndpointer.mm";
          __int16 v7 = 1024;
          int v8 = 122;
          _os_log_impl(&dword_19D794000, v2, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer init:", buf, 0x12u);
        }
      }
    }
  }
  return 0;
}

- (int)getStatus:(float *)a3 count:(unsigned int)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  impl = self->_impl;
  if (!impl->var0)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19D794000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, " ASSERTION FAILED: getStatus called before object was configured!", buf, 2u);
    }
    __break(1u);
  }
  if (a4)
  {
    uint64_t v6 = 0;
    int v7 = 0;
    uint64_t v8 = a4;
    while (1)
    {
      var1 = impl->var1;
      float v10 = 0.0;
      float v11 = fmaxf(a3[v6], 0.0);
      size_t v12 = *(_DWORD *)var1;
      unsigned int v13 = (*((_DWORD *)var1 + 6) + 1) % v12;
      *((_DWORD *)var1 + 6) = v13;
      uint64_t v14 = *((void *)var1 + 1);
      *(float *)(v14 + 4 * v13) = v11;
      double v15 = (_DWORD *)*((void *)var1 + 2);
      uint64_t v16 = v15;
      size_t v17 = v12;
      do
      {
        *v16++ = *(_DWORD *)(v14 + 4 * v13);
        float v10 = v10 + *(float *)(v14 + 4 * v13);
        if (!v13) {
          unsigned int v13 = v12;
        }
        --v13;
        --v17;
      }
      while (v17);
      float v18 = v10 / (float)v12;
      float v19 = *(float *)(*((void *)var1 + 2) + ((2 * *(_DWORD *)var1) & 0x1FFFFFFFCLL));
      BOOL v20 = v19 > 7.0 && v18 >= 7.0;
      if (kAVVCScope)
      {
        if ((*(unsigned char *)(kAVVCScope + 12) & 0x10) != 0)
        {
          v21 = *(NSObject **)kAVVCScope;
          if (*(void *)kAVVCScope)
          {
            if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
            {
              double v22 = a3[v6];
              *(_DWORD *)buf = 136316930;
              v60 = "SpeexEndpointer.mm";
              __int16 v61 = 1024;
              int v62 = 281;
              __int16 v63 = 1024;
              unsigned int v64 = v6;
              __int16 v65 = 1024;
              unsigned int v66 = a4;
              __int16 v67 = 2048;
              double v68 = v22;
              __int16 v69 = 2048;
              double v70 = v18;
              __int16 v71 = 2048;
              double v72 = v19;
              __int16 v73 = 1024;
              BOOL v74 = v20;
              _os_log_impl(&dword_19D794000, v21, OS_LOG_TYPE_DEBUG, "%25s:%-5d SpeexEndpointer getStatus: Raw Speex qlty frame %d/%d: %.2f rnng avrg: %.2f, med: %.2f, cls: %d", buf, 0x42u);
            }
          }
        }
      }
      var0 = (unsigned int *)impl->var0;
      unsigned int v24 = (*((_DWORD *)impl->var0 + 11) + 1) % *((_DWORD *)impl->var0 + 2);
      var0[11] = v24;
      *(_DWORD *)(*(void *)var0 + 4 * v24) = v20;
      unsigned int v25 = var0[12];
      switch(v25)
      {
        case 2u:
          unsigned int v31 = v30;
          if (kAVVCScope)
          {
            if ((*(unsigned char *)(kAVVCScope + 12) & 0x10) != 0)
            {
              v32 = *(NSObject **)kAVVCScope;
              if (*(void *)kAVVCScope)
              {
                if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
                {
                  unsigned int v33 = var0[13];
                  unsigned int v34 = var0[8];
                  *(_DWORD *)buf = 136315906;
                  v60 = "QualityDetector.cpp";
                  __int16 v61 = 1024;
                  int v62 = 139;
                  __int16 v63 = 1024;
                  unsigned int v64 = v33;
                  __int16 v65 = 1024;
                  unsigned int v66 = v34;
                  _os_log_impl(&dword_19D794000, v32, OS_LOG_TYPE_DEBUG, "%25s:%-5d QualityDetector: Speech Ending; End Counter %u / %u",
                    buf,
                    0x1Eu);
                }
              }
            }
          }
          unsigned int v35 = var0[13] + 1;
          var0[13] = v35;
          if (v31 > var0[6])
          {
            var0[13] = 0;
            if (kAVVCScope)
            {
              v36 = *(NSObject **)kAVVCScope;
              if (!*(void *)kAVVCScope)
              {
LABEL_72:
                var0[12] = 1;
                break;
              }
            }
            else
            {
              v36 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v60 = "QualityDetector.cpp";
              __int16 v61 = 1024;
              int v62 = 143;
              _os_log_impl(&dword_19D794000, v36, OS_LOG_TYPE_DEBUG, "%25s:%-5d QualityDetector: ENDING => ACTIVE", buf, 0x12u);
            }
            goto LABEL_72;
          }
          if (v35 >= var0[8])
          {
            v41 = (NSObject **)kAVVCScope;
            if (kAVVCScope)
            {
              v42 = *(NSObject **)kAVVCScope;
              if (!*(void *)kAVVCScope) {
                goto LABEL_62;
              }
            }
            else
            {
              v42 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v60 = "QualityDetector.cpp";
              __int16 v61 = 1024;
              int v62 = 147;
              v51 = v42;
              v52 = "%25s:%-5d QualityDetector: ENDING => ENDED";
              goto LABEL_90;
            }
            goto LABEL_91;
          }
          break;
        case 1u:
          unsigned int v38 = var0[13];
          unsigned int v39 = var0[10];
          if (v38 < v39)
          {
            if (kAVVCScope)
            {
              if ((*(unsigned char *)(kAVVCScope + 12) & 0x10) != 0)
              {
                v40 = *(NSObject **)kAVVCScope;
                if (*(void *)kAVVCScope)
                {
                  if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 136315906;
                    v60 = "QualityDetector.cpp";
                    __int16 v61 = 1024;
                    int v62 = 111;
                    __int16 v63 = 1024;
                    unsigned int v64 = v38;
                    __int16 v65 = 1024;
                    unsigned int v66 = v39;
                    _os_log_impl(&dword_19D794000, v40, OS_LOG_TYPE_DEBUG, "%25s:%-5d QualityDetector: Active; End Counter %u / %u",
                      buf,
                      0x1Eu);
                    unsigned int v38 = var0[13];
                  }
                }
              }
            }
            var0[13] = v38 + 1;
            break;
          }
          unsigned int v43 = v37;
          if (kAVVCScope)
          {
            if ((*(unsigned char *)(kAVVCScope + 12) & 0x10) != 0)
            {
              v44 = *(NSObject **)kAVVCScope;
              if (*(void *)kAVVCScope)
              {
                if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315650;
                  v60 = "QualityDetector.cpp";
                  __int16 v61 = 1024;
                  int v62 = 115;
                  __int16 v63 = 1024;
                  unsigned int v64 = v43;
                  _os_log_impl(&dword_19D794000, v44, OS_LOG_TYPE_DEBUG, "%25s:%-5d QualityDetector: Active; Watching for end point (current frame quality: %u)",
                    buf,
                    0x18u);
                }
              }
            }
          }
          if (v43 >= var0[7]) {
            break;
          }
          unsigned int v45 = var0[5];
          if (v45 == 2)
          {
            var0[13] = 0;
            if (kAVVCScope)
            {
              v53 = *(NSObject **)kAVVCScope;
              if (!*(void *)kAVVCScope) {
                goto LABEL_103;
              }
            }
            else
            {
              v53 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v60 = "QualityDetector.cpp";
              __int16 v61 = 1024;
              int v62 = 126;
              _os_log_impl(&dword_19D794000, v53, OS_LOG_TYPE_DEBUG, "%25s:%-5d QualityDetector: ACTIVE => ENDING", buf, 0x12u);
            }
LABEL_103:
            var0[12] = 2;
            if (self->mEndpointMode == 2)
            {
              if (!kAVVCScope)
              {
                v55 = MEMORY[0x1E4F14500];
LABEL_108:
                int v7 = 2;
                if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136315394;
                  v60 = "SpeexEndpointer.mm";
                  __int16 v61 = 1024;
                  int v62 = 289;
                  _os_log_impl(&dword_19D794000, v55, OS_LOG_TYPE_DEBUG, "%25s:%-5d #### SpeexEndpointer: Detected soft end point ####\n", buf, 0x12u);
                }
                break;
              }
              v55 = *(NSObject **)kAVVCScope;
              if (*(void *)kAVVCScope) {
                goto LABEL_108;
              }
              int v7 = 2;
            }
            break;
          }
          if (v45 == 1)
          {
            v41 = (NSObject **)kAVVCScope;
            if (kAVVCScope)
            {
              v46 = *(NSObject **)kAVVCScope;
              if (!*(void *)kAVVCScope)
              {
LABEL_62:
                var0[12] = 3;
                goto LABEL_92;
              }
            }
            else
            {
              v46 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v60 = "QualityDetector.cpp";
              __int16 v61 = 1024;
              int v62 = 120;
              v51 = v46;
              v52 = "%25s:%-5d QualityDetector: ACTIVE => ENDED";
LABEL_90:
              _os_log_impl(&dword_19D794000, v51, OS_LOG_TYPE_DEBUG, v52, buf, 0x12u);
            }
LABEL_91:
            v41 = (NSObject **)kAVVCScope;
            var0[12] = 3;
            if (v41)
            {
LABEL_92:
              v54 = *v41;
              if (!*v41)
              {
LABEL_97:
                int v7 = 3;
                break;
              }
            }
            else
            {
              v54 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v60 = "SpeexEndpointer.mm";
              __int16 v61 = 1024;
              int v62 = 294;
              _os_log_impl(&dword_19D794000, v54, OS_LOG_TYPE_DEBUG, "%25s:%-5d #### SpeexEndpointer: Detected hard end point ####\n", buf, 0x12u);
            }
            goto LABEL_97;
          }
          var0[12] = 4;
          break;
        case 0u:
          unsigned int v26 = var0[13] + 1;
          var0[13] = v26;
          if (v27 <= var0[6])
          {
            if (kAVVCScope)
            {
              if ((*(unsigned char *)(kAVVCScope + 12) & 0x10) != 0)
              {
                v47 = *(NSObject **)kAVVCScope;
                if (*(void *)kAVVCScope)
                {
                  if (os_log_type_enabled(*(os_log_t *)kAVVCScope, OS_LOG_TYPE_DEBUG))
                  {
                    unsigned int v48 = var0[9];
                    *(_DWORD *)buf = 136315906;
                    v60 = "QualityDetector.cpp";
                    __int16 v61 = 1024;
                    int v62 = 100;
                    __int16 v63 = 1024;
                    unsigned int v64 = v26;
                    __int16 v65 = 1024;
                    unsigned int v66 = v48;
                    _os_log_impl(&dword_19D794000, v47, OS_LOG_TYPE_DEBUG, "%25s:%-5d QualityDetector: NoSpeech; End Counter %u / %u",
                      buf,
                      0x1Eu);
                    unsigned int v26 = var0[13];
                  }
                }
              }
            }
            if (v26 <= var0[9]) {
              break;
            }
            v41 = (NSObject **)kAVVCScope;
            if (kAVVCScope)
            {
              v49 = *(NSObject **)kAVVCScope;
              if (!*(void *)kAVVCScope) {
                goto LABEL_62;
              }
            }
            else
            {
              v49 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v60 = "QualityDetector.cpp";
              __int16 v61 = 1024;
              int v62 = 102;
              v51 = v49;
              v52 = "%25s:%-5d QualityDetector: NONE => ENDED (TIMEOUT AT START)";
              goto LABEL_90;
            }
            goto LABEL_91;
          }
          var0[13] = 0;
          v28 = (NSObject **)kAVVCScope;
          if (!kAVVCScope)
          {
            v29 = MEMORY[0x1E4F14500];
LABEL_64:
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v60 = "QualityDetector.cpp";
              __int16 v61 = 1024;
              int v62 = 94;
              _os_log_impl(&dword_19D794000, v29, OS_LOG_TYPE_DEBUG, "%25s:%-5d QualityDetector: NONE => ACTIVE", buf, 0x12u);
              v28 = (NSObject **)kAVVCScope;
            }
            var0[12] = 1;
            if (v28)
            {
              v50 = *v28;
              if (!*v28)
              {
LABEL_76:
                int v7 = 1;
                break;
              }
            }
            else
            {
              v50 = MEMORY[0x1E4F14500];
            }
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136315394;
              v60 = "SpeexEndpointer.mm";
              __int16 v61 = 1024;
              int v62 = 284;
              _os_log_impl(&dword_19D794000, v50, OS_LOG_TYPE_DEBUG, "%25s:%-5d #### SpeexEndpointer: Detected start point ####\n", buf, 0x12u);
            }
            goto LABEL_76;
          }
          v29 = *(NSObject **)kAVVCScope;
          if (*(void *)kAVVCScope) {
            goto LABEL_64;
          }
          int v7 = 1;
          var0[12] = 1;
          break;
      }
      if (++v6 == v8) {
        goto LABEL_111;
      }
    }
  }
  int v7 = 0;
LABEL_111:
  self->mLastStatus = v7;
  return v7;
}

@end