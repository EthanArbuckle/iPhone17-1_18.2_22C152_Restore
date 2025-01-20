@interface HistStatLinkedListNode
- (HistStatLinkedListNode)initWithStreamId:(int64_t)a3 bufferSize:(unsigned __int16)a4;
- (HistStatLinkedListNode)next;
- (HistStatLinkedListNode)prev;
- (double)targetMaxBuffer;
- (float)avgValBuffer;
- (float)maxValBuffer;
- (float)minValBuffer;
- (float)prctValBuffer;
- (float)prevAvgVal;
- (float)prevMaxVal;
- (float)prevNormHistHeight;
- (float)stdValBuffer;
- (int64_t)streamId;
- (unint64_t)numOfProcessedFrames;
- (void)dealloc;
- (void)detachAllNodes;
- (void)setAvgValBuffer:(float *)a3;
- (void)setMaxValBuffer:(float *)a3;
- (void)setMinValBuffer:(float *)a3;
- (void)setNext:(id)a3;
- (void)setNumOfProcessedFrames:(unint64_t)a3;
- (void)setPrctValBuffer:(float *)a3;
- (void)setPrev:(id)a3;
- (void)setPrevAvgVal:(float)a3;
- (void)setPrevMaxVal:(float)a3;
- (void)setPrevNormHistHeight:(float *)a3;
- (void)setStdValBuffer:(float *)a3;
- (void)setStreamId:(int64_t)a3;
- (void)setTargetMaxBuffer:(double *)a3;
@end

@implementation HistStatLinkedListNode

- (HistStatLinkedListNode)initWithStreamId:(int64_t)a3 bufferSize:(unsigned __int16)a4
{
  unsigned int v4 = a4;
  uint64_t v33 = *MEMORY[0x263EF8340];
  v26.receiver = self;
  v26.super_class = (Class)HistStatLinkedListNode;
  v6 = [(HistStatLinkedListNode *)&v26 init];
  v7 = v6;
  if (v6)
  {
    v6->_streamId = a3;
    v6->_numOfProcessedFrames = 0;
    next = v6->_next;
    v6->_next = 0;

    prev = v7->_prev;
    v7->_prev = 0;

    v10 = (float *)malloc_type_calloc(v4, 4uLL, 0x100004052888210uLL);
    v7->_minValBuffer = v10;
    if (v10)
    {
      v11 = (float *)malloc_type_calloc(v4, 4uLL, 0x100004052888210uLL);
      v7->_maxValBuffer = v11;
      if (v11)
      {
        v12 = (float *)malloc_type_calloc(v4, 4uLL, 0x100004052888210uLL);
        v7->_avgValBuffer = v12;
        if (v12)
        {
          v13 = (float *)malloc_type_calloc(v4, 4uLL, 0x100004052888210uLL);
          v7->_stdValBuffer = v13;
          if (v13)
          {
            v14 = (float **)malloc_type_calloc(0xFuLL, 8uLL, 0x80040B8603338uLL);
            v7->_prctValBuffer = v14;
            if (v14)
            {
              for (uint64_t i = 0; i != 15; ++i)
              {
                v7->_prctValBuffer[i] = (float *)malloc_type_calloc(v4, 4uLL, 0x100004052888210uLL);
                if (!v7->_prctValBuffer[i])
                {
                  if (enableLogInstance)
                  {
                    if (logInstanceID) {
                      uint64_t v19 = logInstanceID;
                    }
                    else {
                      uint64_t v19 = prevLogInstanceID;
                    }
                    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 134217984;
                      v28 = (const char *)WORD1(v19);
                      v20 = &_os_log_internal;
                      v21 = " [1.419.54] #%04llx Memory allocation for prctValBuffer[i] failed";
                      goto LABEL_73;
                    }
                    goto LABEL_74;
                  }
                  if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                    goto LABEL_87;
                  }
                  *(_WORD *)buf = 0;
                  v22 = &_os_log_internal;
                  v23 = " [1.419.54] Memory allocation for prctValBuffer[i] failed";
                  goto LABEL_79;
                }
              }
              v7->_prevAvgVal = -1.0;
              v16 = (float *)malloc_type_calloc(0x80uLL, 4uLL, 0x100004052888210uLL);
              v7->_prevNormHistHeight = v16;
              if (v16)
              {
                v17 = (double *)malloc_type_calloc(v4, 8uLL, 0x100004000313F17uLL);
                v7->_targetMaxBuffer = v17;
                if (v17)
                {
                  v18 = v7;
                  goto LABEL_90;
                }
                if (enableLogInstance)
                {
                  if (logInstanceID) {
                    uint64_t v19 = logInstanceID;
                  }
                  else {
                    uint64_t v19 = prevLogInstanceID;
                  }
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134217984;
                    v28 = (const char *)WORD1(v19);
                    v20 = &_os_log_internal;
                    v21 = " [1.419.54] #%04llx Memory allocation for targetMaxBuffer failed";
                    goto LABEL_73;
                  }
                  goto LABEL_74;
                }
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_87;
                }
                *(_WORD *)buf = 0;
                v22 = &_os_log_internal;
                v23 = " [1.419.54] Memory allocation for targetMaxBuffer failed";
              }
              else
              {
                if (enableLogInstance)
                {
                  if (logInstanceID) {
                    uint64_t v19 = logInstanceID;
                  }
                  else {
                    uint64_t v19 = prevLogInstanceID;
                  }
                  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)buf = 134217984;
                    v28 = (const char *)WORD1(v19);
                    v20 = &_os_log_internal;
                    v21 = " [1.419.54] #%04llx Memory allocation for prevNormHistHeight failed";
                    goto LABEL_73;
                  }
                  goto LABEL_74;
                }
                if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                  goto LABEL_87;
                }
                *(_WORD *)buf = 0;
                v22 = &_os_log_internal;
                v23 = " [1.419.54] Memory allocation for prevNormHistHeight failed";
              }
LABEL_79:
              _os_log_impl(&dword_22224D000, v22, OS_LOG_TYPE_DEFAULT, v23, buf, 2u);
              goto LABEL_80;
            }
            if (!enableLogInstance)
            {
              if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
                goto LABEL_87;
              }
              *(_WORD *)buf = 0;
              v22 = &_os_log_internal;
              v23 = " [1.419.54] Memory allocation for prctValBuffer failed";
              goto LABEL_79;
            }
            if (logInstanceID) {
              uint64_t v19 = logInstanceID;
            }
            else {
              uint64_t v19 = prevLogInstanceID;
            }
            if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134217984;
              v28 = (const char *)WORD1(v19);
              v20 = &_os_log_internal;
              v21 = " [1.419.54] #%04llx Memory allocation for prctValBuffer failed";
              goto LABEL_73;
            }
LABEL_74:
            prevLogInstanceID = v19;
            goto LABEL_80;
          }
          if (!enableLogInstance)
          {
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_87;
            }
            *(_WORD *)buf = 0;
            v22 = &_os_log_internal;
            v23 = " [1.419.54] Memory allocation for stdValBuffer failed";
            goto LABEL_79;
          }
          if (logInstanceID) {
            uint64_t v19 = logInstanceID;
          }
          else {
            uint64_t v19 = prevLogInstanceID;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_74;
          }
          *(_DWORD *)buf = 134217984;
          v28 = (const char *)WORD1(v19);
          v20 = &_os_log_internal;
          v21 = " [1.419.54] #%04llx Memory allocation for stdValBuffer failed";
        }
        else
        {
          if (!enableLogInstance)
          {
            if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
              goto LABEL_87;
            }
            *(_WORD *)buf = 0;
            v22 = &_os_log_internal;
            v23 = " [1.419.54] Memory allocation for avgValBuffer failed";
            goto LABEL_79;
          }
          if (logInstanceID) {
            uint64_t v19 = logInstanceID;
          }
          else {
            uint64_t v19 = prevLogInstanceID;
          }
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_74;
          }
          *(_DWORD *)buf = 134217984;
          v28 = (const char *)WORD1(v19);
          v20 = &_os_log_internal;
          v21 = " [1.419.54] #%04llx Memory allocation for avgValBuffer failed";
        }
      }
      else
      {
        if (!enableLogInstance)
        {
          if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_87;
          }
          *(_WORD *)buf = 0;
          v22 = &_os_log_internal;
          v23 = " [1.419.54] Memory allocation for maxValBuffer failed";
          goto LABEL_79;
        }
        if (logInstanceID) {
          uint64_t v19 = logInstanceID;
        }
        else {
          uint64_t v19 = prevLogInstanceID;
        }
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_74;
        }
        *(_DWORD *)buf = 134217984;
        v28 = (const char *)WORD1(v19);
        v20 = &_os_log_internal;
        v21 = " [1.419.54] #%04llx Memory allocation for maxValBuffer failed";
      }
    }
    else
    {
      if (!enableLogInstance)
      {
        if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_87;
        }
        *(_WORD *)buf = 0;
        v22 = &_os_log_internal;
        v23 = " [1.419.54] Memory allocation for minValBuffer failed";
        goto LABEL_79;
      }
      if (logInstanceID) {
        uint64_t v19 = logInstanceID;
      }
      else {
        uint64_t v19 = prevLogInstanceID;
      }
      if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_74;
      }
      *(_DWORD *)buf = 134217984;
      v28 = (const char *)WORD1(v19);
      v20 = &_os_log_internal;
      v21 = " [1.419.54] #%04llx Memory allocation for minValBuffer failed";
    }
LABEL_73:
    _os_log_impl(&dword_22224D000, v20, OS_LOG_TYPE_DEFAULT, v21, buf, 0xCu);
    goto LABEL_74;
  }
LABEL_80:
  if (enableLogInstance)
  {
    if (logInstanceID) {
      uint64_t v24 = logInstanceID;
    }
    else {
      uint64_t v24 = prevLogInstanceID;
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v28 = (const char *)WORD1(v24);
      __int16 v29 = 2080;
      v30 = "-[HistStatLinkedListNode initWithStreamId:bufferSize:]";
      __int16 v31 = 2048;
      v32 = v7;
      _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] #%04llx %s : Initialization Failed, self=%p\n", buf, 0x20u);
    }
    v18 = 0;
    prevLogInstanceID = v24;
    goto LABEL_90;
  }
LABEL_87:
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[HistStatLinkedListNode initWithStreamId:bufferSize:]";
    __int16 v29 = 2048;
    v30 = (const char *)v7;
    _os_log_impl(&dword_22224D000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, " [1.419.54] %s : Initialization Failed, self=%p\n", buf, 0x16u);
  }
  v18 = 0;
LABEL_90:

  return v18;
}

- (void)dealloc
{
  minValBuffer = self->_minValBuffer;
  if (minValBuffer)
  {
    free(minValBuffer);
    self->_minValBuffer = 0;
  }
  maxValBuffer = self->_maxValBuffer;
  if (maxValBuffer)
  {
    free(maxValBuffer);
    self->_maxValBuffer = 0;
  }
  avgValBuffer = self->_avgValBuffer;
  if (avgValBuffer)
  {
    free(avgValBuffer);
    self->_avgValBuffer = 0;
  }
  stdValBuffer = self->_stdValBuffer;
  if (stdValBuffer)
  {
    free(stdValBuffer);
    self->_stdValBuffer = 0;
  }
  if (self->_prctValBuffer)
  {
    for (uint64_t i = 0; i != 15; ++i)
    {
      v8 = self->_prctValBuffer[i];
      if (v8)
      {
        free(v8);
        self->_prctValBuffer[i] = 0;
      }
    }
    free(self->_prctValBuffer);
    self->_prctValBuffer = 0;
  }
  prevNormHistHeight = self->_prevNormHistHeight;
  if (prevNormHistHeight)
  {
    free(prevNormHistHeight);
    self->_prevNormHistHeight = 0;
  }
  targetMaxBuffer = self->_targetMaxBuffer;
  if (targetMaxBuffer)
  {
    free(targetMaxBuffer);
    self->_targetMaxBuffer = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)HistStatLinkedListNode;
  [(HistStatLinkedListNode *)&v11 dealloc];
}

- (void)detachAllNodes
{
  v2 = self;
  if (v2)
  {
    v3 = v2;
    do
    {
      unsigned int v4 = [v3 prev];
      uint64_t v5 = [v3 next];
      [v3 setNext:0];
      [v3 setPrev:0];

      v3 = (void *)v5;
    }
    while (v5);
  }
}

- (int64_t)streamId
{
  return self->_streamId;
}

- (void)setStreamId:(int64_t)a3
{
  self->_streamId = a3;
}

- (unint64_t)numOfProcessedFrames
{
  return self->_numOfProcessedFrames;
}

- (void)setNumOfProcessedFrames:(unint64_t)a3
{
  self->_numOfProcessedFrames = a3;
}

- (float)minValBuffer
{
  return self->_minValBuffer;
}

- (void)setMinValBuffer:(float *)a3
{
  self->_minValBuffer = a3;
}

- (float)maxValBuffer
{
  return self->_maxValBuffer;
}

- (void)setMaxValBuffer:(float *)a3
{
  self->_maxValBuffer = a3;
}

- (float)avgValBuffer
{
  return self->_avgValBuffer;
}

- (void)setAvgValBuffer:(float *)a3
{
  self->_avgValBuffer = a3;
}

- (float)stdValBuffer
{
  return self->_stdValBuffer;
}

- (void)setStdValBuffer:(float *)a3
{
  self->_stdValBuffer = a3;
}

- (float)prctValBuffer
{
  return self->_prctValBuffer;
}

- (void)setPrctValBuffer:(float *)a3
{
  self->_prctValBuffer = a3;
}

- (float)prevAvgVal
{
  return self->_prevAvgVal;
}

- (void)setPrevAvgVal:(float)a3
{
  self->_prevAvgVal = a3;
}

- (float)prevMaxVal
{
  return self->_prevMaxVal;
}

- (void)setPrevMaxVal:(float)a3
{
  self->_prevMaxVal = a3;
}

- (float)prevNormHistHeight
{
  return self->_prevNormHistHeight;
}

- (void)setPrevNormHistHeight:(float *)a3
{
  self->_prevNormHistHeight = a3;
}

- (double)targetMaxBuffer
{
  return self->_targetMaxBuffer;
}

- (void)setTargetMaxBuffer:(double *)a3
{
  self->_targetMaxBuffer = a3;
}

- (HistStatLinkedListNode)next
{
  return (HistStatLinkedListNode *)objc_getProperty(self, a2, 88, 1);
}

- (void)setNext:(id)a3
{
}

- (HistStatLinkedListNode)prev
{
  return (HistStatLinkedListNode *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPrev:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prev, 0);
  objc_storeStrong((id *)&self->_next, 0);
}

@end