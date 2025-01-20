@interface VCAudioRedBuilder
+ (unsigned)redOverheadForNumPayloads:(unsigned int)a3;
- (BOOL)isPayloadTimestampWithinThreshold:(tagVCAudioRedPayload *)a3 forTimestamp:(unsigned int)a4;
- (BOOL)redundantPayloads:(id)a3 containsPointer:(void *)a4;
- (VCAudioRedBuilder)initWithRedPayloadType:(int)a3 sampleRate:(unsigned int)a4 samplesPerFrame:(unsigned int)a5 numPayloads:(unsigned int)a6 maxDelay:(unsigned int)a7 includeSequenceOffset:(BOOL)a8;
- (char)payloadHistoryDescriptionForInfoIndex:(unsigned __int8)a3;
- (char)redPayloadDescription:(tagVCAudioRedPayload *)a3;
- (char)redundantPayloadsDescription:(id)a3;
- (char)resetOutputPayload:(tagVCAudioRedPayload *)a3;
- (id)selectRedPayloadsForPrimaryPayload:(tagVCAudioRedPayload *)a3;
- (int)redPayloadType;
- (tagVCAudioRedPayload)buildRedPayloadWithPrimaryPayload:(tagVCAudioRedPayload *)a3 redPayloads:(id)a4;
- (tagVCAudioRedPayload)nearestRedPayloadForTimestamp:(unsigned int)a3 payloadHistory:(tagVCAudioRedPayload *)a4 payloadHistoryCount:(unsigned int)a5;
- (tagVCAudioRedPayload)redPayloadForPrimaryPayload:(tagVCAudioRedPayload *)a3;
- (unsigned)maxDelay;
- (unsigned)maxREDPayloadSize;
- (unsigned)numPayloads;
- (void)dealloc;
- (void)resetShortREDHistoryAndPrimaryPayloadHistory:(BOOL)a3;
- (void)setMaxDelay:(unsigned int)a3;
- (void)setMaxREDPayloadSize:(unsigned int)a3;
- (void)setNumPayloads:(unsigned int)a3;
@end

@implementation VCAudioRedBuilder

- (void)setMaxREDPayloadSize:(unsigned int)a3
{
  objc_sync_enter(self);
  self->_maxREDPayloadSize = a3;

  objc_sync_exit(self);
}

- (tagVCAudioRedPayload)buildRedPayloadWithPrimaryPayload:(tagVCAudioRedPayload *)a3 redPayloads:(id)a4
{
  v5 = a3;
  v6 = self;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    __str = 0;
    if (objc_opt_class()) {
      v7 = (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String");
    }
    else {
      v7 = "<nil>";
    }
    asprintf(&__str, "%s: primaryPayload:%s redPayloads:%s", v7, [(VCAudioRedBuilder *)v6 redPayloadDescription:v5], [(VCAudioRedBuilder *)v6 redundantPayloadsDescription:a4]);
    if (__str)
    {
      __lasts = 0;
      v8 = strtok_r(__str, "\n", &__lasts);
      v9 = (unsigned char *)MEMORY[0x1E4F47A40];
      v10 = (NSObject **)MEMORY[0x1E4F47A50];
      do
      {
        if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
        {
          uint64_t v11 = VRTraceErrorLogLevelToCSTR();
          v12 = *v10;
          v13 = *v10;
          if (*v9)
          {
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v50 = v11;
              __int16 v51 = 2080;
              v52 = "-[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:]";
              __int16 v53 = 1024;
              int v54 = 157;
              __int16 v55 = 2080;
              *(void *)v56 = "-[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:]";
              *(_WORD *)&v56[8] = 2080;
              v57 = v8;
              _os_log_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          else if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 136316162;
            uint64_t v50 = v11;
            __int16 v51 = 2080;
            v52 = "-[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:]";
            __int16 v53 = 1024;
            int v54 = 157;
            __int16 v55 = 2080;
            *(void *)v56 = "-[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:]";
            *(_WORD *)&v56[8] = 2080;
            v57 = v8;
            _os_log_debug_impl(&dword_1E1EA4000, v12, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
          }
        }
        v8 = strtok_r(0, "\n", &__lasts);
      }
      while (v8);
      free(__str);
      v5 = a3;
    }
    v6 = self;
  }
  p_redPayloadToSend = &v6->_redPayloadToSend;
  v14 = -[VCAudioRedBuilder resetOutputPayload:](v6, "resetOutputPayload:");
  int v15 = [a4 count];
  int v16 = v15;
  LODWORD(v17) = 1472;
  uint64_t v18 = (v15 - 1);
  if (v15 - 1 >= 0)
  {
    uint64_t v19 = 0;
    unsigned __int8 v20 = 0;
    uint64_t v17 = (1472 - 4 * v15);
    while (1)
    {
      uint64_t v21 = [a4 pointerAtIndex:v18];
      unsigned int v22 = *(_DWORD *)(v21 + 16);
      if (v22 >= 0x400) {
        break;
      }
      if (v6->_includeSequenceOffset)
      {
        unsigned int v23 = *(unsigned __int8 *)(v21 + 30);
        if (v23 >= 0x40)
        {
          uint64_t v17 = 1472 - v19;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:].cold.5();
            }
          }
LABEL_37:
          v6 = self;
          v14 = [(VCAudioRedBuilder *)self resetOutputPayload:p_redPayloadToSend];
          goto LABEL_45;
        }
        unsigned int v24 = 100 * (a3->timestamp - *(_DWORD *)(v21 + 20)) / v6->_sampleRate;
        if (v24 >= 0x100)
        {
          uint64_t v28 = 1472 - v19;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:].cold.6();
            }
          }
LABEL_44:
          v6 = self;
          v14 = [(VCAudioRedBuilder *)self resetOutputPayload:p_redPayloadToSend];
          uint64_t v17 = v28;
LABEL_45:
          v5 = a3;
          if ((int)v17 > 0) {
            goto LABEL_46;
          }
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:]();
            }
          }
          uint64_t v33 = 0;
LABEL_61:
          CFStringRef v40 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, @"Max RED payload size overflow. outputPayloadBufferLength=%ld, lastRedPayloadBufferLength=%d, maxPayloadLength=%zu, remainingLength=%d", v14 - v6->_redPayloadToSend.buffer, v33, 1472, v17);
          VCTerminateProcess((uint64_t)v40, @"VCAudioRedBuilder", 0);
          if (v40) {
            CFRelease(v40);
          }
          return 0;
        }
        int v25 = (v23 << 18) | (v24 << 10);
      }
      else
      {
        unsigned int v26 = a3->timestamp - *(_DWORD *)(v21 + 20);
        if (v26 >= 0x4000)
        {
          uint64_t v28 = 1472 - v19;
          if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
          {
            VRTraceErrorLogLevelToCSTR();
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
              -[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:].cold.4();
            }
          }
          goto LABEL_44;
        }
        int v25 = v26 << 10;
      }
      v6 = self;
      if (v19 == 1472)
      {
        v14 += v19;
        if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
        {
          VRTraceErrorLogLevelToCSTR();
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
            -[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:]();
          }
        }
        uint64_t v33 = 0;
        uint64_t v17 = 0;
        goto LABEL_61;
      }
      unsigned int v27 = bswap32(v25 | (*(_DWORD *)v21 << 24) ^ 0x80000000 | v22);
      if (v20 <= *(unsigned __int8 *)(v21 + 31)) {
        unsigned __int8 v20 = *(unsigned char *)(v21 + 31);
      }
      *(_DWORD *)&v14[v19] = v27;
      ++*(unsigned char *)(v21 + 29);
      --v16;
      --v18;
      v19 += 4;
      if (v16 <= 0)
      {
        v14 += v19;
        goto LABEL_45;
      }
    }
    uint64_t v17 = 1472 - v19;
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:]();
      }
    }
    goto LABEL_37;
  }
  unsigned __int8 v20 = 0;
LABEL_46:
  *v14++ = v5->payloadType;
  uint64_t v17 = (v17 - 1);
  int v29 = [a4 count];
  uint64_t v30 = (v29 - 1);
  if (v29 - 1 >= 0)
  {
    while (1)
    {
      uint64_t v31 = [a4 pointerAtIndex:v30];
      uint64_t v32 = v31;
      uint64_t v33 = *(unsigned int *)(v31 + 16);
      if ((int)v17 < (int)v33) {
        break;
      }
      memcpy(v14, *(const void **)(v31 + 8), (int)v33);
      uint64_t v34 = *(int *)(v32 + 16);
      v14 += v34;
      uint64_t v17 = (v17 - v34);
      --v29;
      --v30;
      if (v29 <= 0) {
        goto LABEL_51;
      }
    }
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v37 = VRTraceErrorLogLevelToCSTR();
      v38 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v39 = *(_DWORD *)(v32 + 16);
        *(_DWORD *)buf = 136316162;
        uint64_t v50 = v37;
        __int16 v51 = 2080;
        v52 = "-[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:]";
        __int16 v53 = 1024;
        int v54 = 242;
        __int16 v55 = 1024;
        *(_DWORD *)v56 = v39;
        *(_WORD *)&v56[4] = 1024;
        *(_DWORD *)&v56[6] = v17;
        _os_log_error_impl(&dword_1E1EA4000, v38, OS_LOG_TYPE_ERROR, "VCAudioRedBuilder [%s] %s:%d Buffer size not enough requiredLength %d remainingLength %d", buf, 0x28u);
      }
    }
    goto LABEL_61;
  }
  uint64_t v33 = 0;
LABEL_51:
  size_t bufferLength = v5->bufferLength;
  if ((int)v17 < (int)bufferLength)
  {
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      uint64_t v41 = VRTraceErrorLogLevelToCSTR();
      v42 = *MEMORY[0x1E4F47A50];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR))
      {
        int v43 = v5->bufferLength;
        *(_DWORD *)buf = 136316162;
        uint64_t v50 = v41;
        __int16 v51 = 2080;
        v52 = "-[VCAudioRedBuilder buildRedPayloadWithPrimaryPayload:redPayloads:]";
        __int16 v53 = 1024;
        int v54 = 249;
        __int16 v55 = 1024;
        *(_DWORD *)v56 = v43;
        *(_WORD *)&v56[4] = 1024;
        *(_DWORD *)&v56[6] = v17;
        _os_log_error_impl(&dword_1E1EA4000, v42, OS_LOG_TYPE_ERROR, "VCAudioRedBuilder [%s] %s:%d Buffer size not enough requiredLength %d remainingLength %d", buf, 0x28u);
      }
      v6 = self;
    }
    goto LABEL_61;
  }
  memcpy(v14, v5->buffer, bufferLength);
  v6->_redPayloadToSend.size_t bufferLength = v14 + v5->bufferLength - LODWORD(v6->_redPayloadToSend.buffer);
  v6->_redPayloadToSend.payloadType = v6->_redPayloadType;
  v6->_redPayloadToSend.timestamp = v5->timestamp;
  v6->_redPayloadToSend.priority = v20;
  return p_redPayloadToSend;
}

- (BOOL)isPayloadTimestampWithinThreshold:(tagVCAudioRedPayload *)a3 forTimestamp:(unsigned int)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  unsigned int samplesPerFrame = self->_samplesPerFrame;
  unsigned int v6 = a4 + 2 * samplesPerFrame;
  unsigned int v7 = a4 - 2 * samplesPerFrame;
  if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
  {
    int v8 = 2 * samplesPerFrame;
    uint64_t v9 = VRTraceErrorLogLevelToCSTR();
    v10 = *MEMORY[0x1E4F47A50];
    uint64_t v11 = *MEMORY[0x1E4F47A50];
    if (*MEMORY[0x1E4F47A40])
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int timestamp = a3->timestamp;
        int v18 = 136316674;
        uint64_t v19 = v9;
        __int16 v20 = 2080;
        uint64_t v21 = "-[VCAudioRedBuilder isPayloadTimestampWithinThreshold:forTimestamp:]";
        __int16 v22 = 1024;
        int v23 = 283;
        __int16 v24 = 1024;
        int v25 = v8;
        __int16 v26 = 1024;
        unsigned int v27 = v6;
        __int16 v28 = 1024;
        unsigned int v29 = v7;
        __int16 v30 = 1024;
        unsigned int v31 = timestamp;
        _os_log_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d timestampOffsetThreshold:%d highThreshold:%d lowThreshold:%d payloadTimestamp:%d", (uint8_t *)&v18, 0x34u);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      unsigned int v17 = a3->timestamp;
      int v18 = 136316674;
      uint64_t v19 = v9;
      __int16 v20 = 2080;
      uint64_t v21 = "-[VCAudioRedBuilder isPayloadTimestampWithinThreshold:forTimestamp:]";
      __int16 v22 = 1024;
      int v23 = 283;
      __int16 v24 = 1024;
      int v25 = v8;
      __int16 v26 = 1024;
      unsigned int v27 = v6;
      __int16 v28 = 1024;
      unsigned int v29 = v7;
      __int16 v30 = 1024;
      unsigned int v31 = v17;
      _os_log_debug_impl(&dword_1E1EA4000, v10, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d timestampOffsetThreshold:%d highThreshold:%d lowThreshold:%d payloadTimestamp:%d", (uint8_t *)&v18, 0x34u);
    }
  }
  unsigned int v13 = a3->timestamp;
  if (v13 - v7 <= 0x7FFFFFFE && ((v14 = v13 - v6) != 0 ? (BOOL v15 = v14 > 0x7FFFFFFE) : (BOOL v15 = 1), v15)) {
    return 1;
  }
  else {
    return 0;
  }
}

- (char)resetOutputPayload:(tagVCAudioRedPayload *)a3
{
  *(_OWORD *)&a3->payloadType = 0u;
  *(_OWORD *)&a3->size_t bufferLength = 0u;
  result = (char *)self->_redPayloadBufferToSend;
  a3->buffer = result;
  return result;
}

- (tagVCAudioRedPayload)nearestRedPayloadForTimestamp:(unsigned int)a3 payloadHistory:(tagVCAudioRedPayload *)a4 payloadHistoryCount:(unsigned int)a5
{
  v5 = 0;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (a4 && a5)
  {
    uint64_t v7 = *(void *)&a3;
    if (a4->timestamp - a3 <= 0x7FFFFFFE)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      v5 = a4;
      while (a5 - 1 != v10)
      {
        uint64_t v11 = v5;
        unsigned int v12 = v5[1].timestamp - a3;
        ++v5;
        ++v10;
        uint64_t v9 = v11;
        if (v12 >= 0x7FFFFFFF)
        {
          uint64_t v9 = v5 - 1;
          goto LABEL_10;
        }
      }
      uint64_t v10 = a5 - 1;
      v5 = &a4[v10];
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v10 = 0;
      v5 = a4;
    }
LABEL_10:
    if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
    {
      __str = 0;
      unsigned int v13 = objc_opt_class()
          ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String")
          : "<nil>";
      asprintf(&__str, "%s: redTimestamp:%d current:%s previous:%s", v13, v7, [(VCAudioRedBuilder *)self redPayloadDescription:v5], [(VCAudioRedBuilder *)self redPayloadDescription:v9]);
      if (__str)
      {
        uint64_t v19 = self;
        __lasts = 0;
        unsigned int v14 = strtok_r(__str, "\n", &__lasts);
        do
        {
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            uint64_t v15 = VRTraceErrorLogLevelToCSTR();
            int v16 = *MEMORY[0x1E4F47A50];
            unsigned int v17 = *MEMORY[0x1E4F47A50];
            if (*MEMORY[0x1E4F47A40])
            {
              if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136316162;
                uint64_t v23 = v15;
                __int16 v24 = 2080;
                int v25 = "-[VCAudioRedBuilder nearestRedPayloadForTimestamp:payloadHistory:payloadHistoryCount:]";
                __int16 v26 = 1024;
                int v27 = 316;
                __int16 v28 = 2080;
                unsigned int v29 = "-[VCAudioRedBuilder nearestRedPayloadForTimestamp:payloadHistory:payloadHistoryCount:]";
                __int16 v30 = 2080;
                unsigned int v31 = v14;
                _os_log_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            else if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136316162;
              uint64_t v23 = v15;
              __int16 v24 = 2080;
              int v25 = "-[VCAudioRedBuilder nearestRedPayloadForTimestamp:payloadHistory:payloadHistoryCount:]";
              __int16 v26 = 1024;
              int v27 = 316;
              __int16 v28 = 2080;
              unsigned int v29 = "-[VCAudioRedBuilder nearestRedPayloadForTimestamp:payloadHistory:payloadHistoryCount:]";
              __int16 v30 = 2080;
              unsigned int v31 = v14;
              _os_log_debug_impl(&dword_1E1EA4000, v16, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
            }
          }
          unsigned int v14 = strtok_r(0, "\n", &__lasts);
        }
        while (v14);
        free(__str);
        self = v19;
      }
    }
    if (a4[v10].timestamp != v7)
    {
      if (v9 && v9->timestamp == v7)
      {
        return v9;
      }
      else if (![(VCAudioRedBuilder *)self isPayloadTimestampWithinThreshold:v5 forTimestamp:v7])
      {
        if ([(VCAudioRedBuilder *)self isPayloadTimestampWithinThreshold:v9 forTimestamp:v7])
        {
          return v9;
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return v5;
}

- (id)selectRedPayloadsForPrimaryPayload:(tagVCAudioRedPayload *)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  [(NSPointerArray *)self->_selectedRedPayloads setCount:0];
  if (self->_historyCount)
  {
    LODWORD(v4) = self->_numPayloads;
    int v48 = self->_maxREDPayloadSize + ~a3->bufferLength;
    if (self->_includeSequenceOffset)
    {
      float v5 = (float)self->_maxDelay / (float)v4;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        __str = 0;
        unsigned int v6 = objc_opt_class()
           ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String")
           : "<nil>";
        asprintf(&__str, "%s: primary:%s numPayloads:%d maxDelay:%d strideInBlocks:%f", v6, [(VCAudioRedBuilder *)self redPayloadDescription:a3], self->_numPayloads, self->_maxDelay, v5);
        if (__str)
        {
          __lasts = 0;
          uint64_t v9 = strtok_r(__str, "\n", &__lasts);
          uint64_t v10 = (unsigned char *)MEMORY[0x1E4F47A40];
          uint64_t v11 = (NSObject **)MEMORY[0x1E4F47A50];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              uint64_t v12 = VRTraceErrorLogLevelToCSTR();
              unsigned int v13 = *v11;
              unsigned int v14 = *v11;
              if (*v10)
              {
                if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316162;
                  uint64_t v54 = v12;
                  __int16 v55 = 2080;
                  v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                  __int16 v57 = 1024;
                  int v58 = 352;
                  __int16 v59 = 2080;
                  *(void *)v60 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                  *(_WORD *)&v60[8] = 2080;
                  *(void *)&v60[10] = v9;
                  _os_log_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
                }
              }
              else if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136316162;
                uint64_t v54 = v12;
                __int16 v55 = 2080;
                v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                __int16 v57 = 1024;
                int v58 = 352;
                __int16 v59 = 2080;
                *(void *)v60 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                *(_WORD *)&v60[8] = 2080;
                *(void *)&v60[10] = v9;
                _os_log_debug_impl(&dword_1E1EA4000, v13, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            uint64_t v9 = strtok_r(0, "\n", &__lasts);
          }
          while (v9);
          free(__str);
        }
      }
      if (self->_numPayloads)
      {
        unsigned int v15 = 1;
        while (1)
        {
          unsigned int v16 = vcvtps_s32_f32(v5 * (float)v15);
          unsigned int v17 = self->_samplesPerFrame * v16;
          unsigned int v18 = a3->timestamp - v17;
          unsigned int v19 = self->_historyCount - 1;
          if (v19 >= v15) {
            LOBYTE(v19) = v15;
          }
          __int16 v20 = [(VCAudioRedBuilder *)self nearestRedPayloadForTimestamp:a3->timestamp - v17 payloadHistory:self->_history[v19].payloadHistory payloadHistoryCount:self->_history[v19].payloadHistoryCount];
          if ((int)VRTraceGetErrorLogLevelForModule() < 8) {
            goto LABEL_33;
          }
          uint64_t v21 = VRTraceErrorLogLevelToCSTR();
          __int16 v22 = *MEMORY[0x1E4F47A50];
          uint64_t v23 = *MEMORY[0x1E4F47A50];
          if (*MEMORY[0x1E4F47A40]) {
            break;
          }
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            goto LABEL_33;
          }
          int v25 = [(VCAudioRedBuilder *)self redPayloadDescription:v20];
          *(_DWORD *)buf = 136316674;
          uint64_t v54 = v21;
          __int16 v55 = 2080;
          v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
          __int16 v57 = 1024;
          int v58 = 364;
          __int16 v59 = 1024;
          *(_DWORD *)v60 = v16;
          *(_WORD *)&v60[4] = 1024;
          *(_DWORD *)&v60[6] = v17;
          *(_WORD *)&v60[10] = 1024;
          *(_DWORD *)&v60[12] = v18;
          *(_WORD *)&v60[16] = 2080;
          v61 = v25;
          _os_log_debug_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d blockOffset:%d timestampOffset:%d redTimestamp:%d redPayload:%s", buf, 0x38u);
          if (v20)
          {
LABEL_34:
            if (self->_numPayloads > v20->redCount
              && ![(VCAudioRedBuilder *)self redundantPayloads:self->_selectedRedPayloads containsPointer:v20]&& v48 > v20->bufferLength + 4)
            {
              [(NSPointerArray *)self->_selectedRedPayloads addPointer:v20];
              int v48 = v48 - v20->bufferLength - 4;
            }
          }
LABEL_38:
          if (++v15 > self->_numPayloads) {
            return self->_selectedRedPayloads;
          }
        }
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          __int16 v24 = [(VCAudioRedBuilder *)self redPayloadDescription:v20];
          *(_DWORD *)buf = 136316674;
          uint64_t v54 = v21;
          __int16 v55 = 2080;
          v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
          __int16 v57 = 1024;
          int v58 = 364;
          __int16 v59 = 1024;
          *(_DWORD *)v60 = v16;
          *(_WORD *)&v60[4] = 1024;
          *(_DWORD *)&v60[6] = v17;
          *(_WORD *)&v60[10] = 1024;
          *(_DWORD *)&v60[12] = v18;
          *(_WORD *)&v60[16] = 2080;
          v61 = v24;
          _os_log_impl(&dword_1E1EA4000, v22, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d blockOffset:%d timestampOffset:%d redTimestamp:%d redPayload:%s", buf, 0x38u);
          if (v20) {
            goto LABEL_34;
          }
          goto LABEL_38;
        }
LABEL_33:
        if (v20) {
          goto LABEL_34;
        }
        goto LABEL_38;
      }
    }
    else
    {
      unsigned int payloadHistoryCount = self->_history[0].payloadHistoryCount;
      if (payloadHistoryCount >= v4) {
        uint64_t v4 = v4;
      }
      else {
        uint64_t v4 = payloadHistoryCount;
      }
      uint64_t v49 = v4;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        __str = 0;
        int v8 = objc_opt_class()
           ? (const char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "description"), "UTF8String")
           : "<nil>";
        asprintf(&__str, "%s: primary:%s numPayloads:%d maxDelay:%d count:%d", v8, [(VCAudioRedBuilder *)self redPayloadDescription:a3], self->_numPayloads, self->_maxDelay, v49);
        if (__str)
        {
          __lasts = 0;
          __int16 v26 = strtok_r(__str, "\n", &__lasts);
          int v27 = (unsigned char *)MEMORY[0x1E4F47A40];
          __int16 v28 = (NSObject **)MEMORY[0x1E4F47A50];
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              uint64_t v29 = VRTraceErrorLogLevelToCSTR();
              __int16 v30 = *v28;
              unsigned int v31 = *v28;
              if (*v27)
              {
                if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316162;
                  uint64_t v54 = v29;
                  __int16 v55 = 2080;
                  v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                  __int16 v57 = 1024;
                  int v58 = 375;
                  __int16 v59 = 2080;
                  *(void *)v60 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                  *(_WORD *)&v60[8] = 2080;
                  *(void *)&v60[10] = v26;
                  _os_log_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
                }
              }
              else if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136316162;
                uint64_t v54 = v29;
                __int16 v55 = 2080;
                v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                __int16 v57 = 1024;
                int v58 = 375;
                __int16 v59 = 2080;
                *(void *)v60 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                *(_WORD *)&v60[8] = 2080;
                *(void *)&v60[10] = v26;
                _os_log_debug_impl(&dword_1E1EA4000, v30, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            __int16 v26 = strtok_r(0, "\n", &__lasts);
          }
          while (v26);
          free(__str);
        }
      }
      if (v49)
      {
        uint64_t v32 = 0;
        unsigned __int8 v33 = 0;
        uint64_t v34 = self;
        do
        {
          unsigned int historyCount = self->_historyCount;
          unsigned __int8 v36 = historyCount - 1;
          if (historyCount - 1 >= v32) {
            unsigned __int8 v36 = v32;
          }
          if (historyCount > 1) {
            unsigned __int8 v33 = v36;
          }
          uint64_t v37 = (char *)v34 + 344 * v33;
          v38 = v37 + 64;
          unsigned int v39 = a3->timestamp - *((_DWORD *)v37 + 21);
          if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
          {
            uint64_t v40 = VRTraceErrorLogLevelToCSTR();
            uint64_t v41 = *MEMORY[0x1E4F47A50];
            v42 = *MEMORY[0x1E4F47A50];
            if (*MEMORY[0x1E4F47A40])
            {
              if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
              {
                int v43 = [(VCAudioRedBuilder *)self redPayloadDescription:v38];
                *(_DWORD *)buf = 136316162;
                uint64_t v54 = v40;
                __int16 v55 = 2080;
                v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
                __int16 v57 = 1024;
                int v58 = 387;
                __int16 v59 = 1024;
                *(_DWORD *)v60 = v39;
                *(_WORD *)&v60[4] = 2080;
                *(void *)&v60[6] = v43;
                _os_log_impl(&dword_1E1EA4000, v41, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d timestampOffset:%d redPayload:%s", buf, 0x2Cu);
              }
            }
            else if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              v46 = [(VCAudioRedBuilder *)self redPayloadDescription:v38];
              *(_DWORD *)buf = 136316162;
              uint64_t v54 = v40;
              __int16 v55 = 2080;
              v56 = "-[VCAudioRedBuilder selectRedPayloadsForPrimaryPayload:]";
              __int16 v57 = 1024;
              int v58 = 387;
              __int16 v59 = 1024;
              *(_DWORD *)v60 = v39;
              *(_WORD *)&v60[4] = 2080;
              *(void *)&v60[6] = v46;
              _os_log_debug_impl(&dword_1E1EA4000, v41, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d timestampOffset:%d redPayload:%s", buf, 0x2Cu);
            }
          }
          if (self->_numPayloads > v34->_history[v33].payloadHistory[0].redCount
            && v39 >> 14 == 0
            && ![(VCAudioRedBuilder *)self redundantPayloads:self->_selectedRedPayloads containsPointer:v38])
          {
            v45 = (char *)v34 + 344 * v33;
            if (v48 > *((_DWORD *)v45 + 20) + 4)
            {
              [(NSPointerArray *)self->_selectedRedPayloads addPointer:v38];
              int v48 = v48 - *((_DWORD *)v45 + 20) - 4;
            }
          }
          ++v32;
          uint64_t v34 = (VCAudioRedBuilder *)((char *)v34 + 32);
        }
        while (v49 != v32);
      }
    }
  }
  return self->_selectedRedPayloads;
}

- (BOOL)redundantPayloads:(id)a3 containsPointer:(void *)a4
{
  if ((int)[a3 count] < 1) {
    return 0;
  }
  uint64_t v6 = 0;
  do
  {
    uint64_t v7 = (void *)[a3 pointerAtIndex:v6];
    BOOL v8 = v7 == a4;
    if (v7 == a4) {
      break;
    }
    ++v6;
  }
  while (v6 < (int)[a3 count]);
  return v8;
}

- (char)redPayloadDescription:(tagVCAudioRedPayload *)a3
{
  redPayloadDebugMessage = self->_redPayloadDebugMessage;
  if (a3) {
    snprintf(self->_redPayloadDebugMessage, 0x101uLL, "{ VCAudioRedPayload payloadType=%d bufferLen=%d timestamp=%u isRedAudio=%d redCount=%d sequenceOffset=%d }", a3->payloadType, a3->bufferLength, a3->timestamp, a3->isRedAudio, a3->redCount, a3->sequenceOffset);
  }
  else {
    strcpy(self->_redPayloadDebugMessage, "VCAudioRedPayload NULL");
  }
  return redPayloadDebugMessage;
}

- (char)redundantPayloadsDescription:(id)a3
{
  redPayloadHistoryDebugMessage = self->_redPayloadHistoryDebugMessage;
  strncpy(self->_redPayloadHistoryDebugMessage, "{ \n", 0x101uLL);
  if ((int)[a3 count] >= 1)
  {
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = strncat(redPayloadHistoryDebugMessage, -[VCAudioRedBuilder redPayloadDescription:](self, "redPayloadDescription:", [a3 pointerAtIndex:v6]), 0x101uLL);
      *(_WORD *)&redPayloadHistoryDebugMessage[strlen(v7)] = 10;
      ++v6;
    }
    while (v6 < (int)[a3 count]);
  }
  strcat(redPayloadHistoryDebugMessage, " }");
  return redPayloadHistoryDebugMessage;
}

- (char)payloadHistoryDescriptionForInfoIndex:(unsigned __int8)a3
{
  unsigned int v3 = a3;
  redPayloadHistoryDebugMessage = self->_redPayloadHistoryDebugMessage;
  strncpy(self->_redPayloadHistoryDebugMessage, "{ primary:\n", 0x101uLL);
  uint64_t v6 = (char *)self + 344 * v3;
  if (*((_DWORD *)v6 + 88))
  {
    unint64_t v7 = 0;
    BOOL v8 = (unsigned int *)(v6 + 352);
    payloadHistory = self->_history[v3].payloadHistory;
    do
    {
      uint64_t v10 = strncat(redPayloadHistoryDebugMessage, [(VCAudioRedBuilder *)self redPayloadDescription:payloadHistory], 0x101uLL);
      *(_WORD *)&redPayloadHistoryDebugMessage[strlen(v10)] = 10;
      ++v7;
      ++payloadHistory;
    }
    while (v7 < *v8);
  }
  strcat(redPayloadHistoryDebugMessage, " }");
  return redPayloadHistoryDebugMessage;
}

- (tagVCAudioRedPayload)redPayloadForPrimaryPayload:(tagVCAudioRedPayload *)a3
{
  objc_sync_enter(self);
  float v5 = [(VCAudioRedBuilder *)self buildRedPayloadWithPrimaryPayload:a3 redPayloads:[(VCAudioRedBuilder *)self selectRedPayloadsForPrimaryPayload:a3]];
  objc_sync_exit(self);
  return v5;
}

- (void)resetShortREDHistoryAndPrimaryPayloadHistory:(BOOL)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  BOOL v14 = a3;
  unint64_t v3 = !a3;
  if (self->_historyCount > v3)
  {
    history = self->_history;
    uint64_t v6 = (unsigned char *)MEMORY[0x1E4F47A40];
    unint64_t v7 = (NSObject **)MEMORY[0x1E4F47A50];
    unsigned int v13 = self->_history;
    do
    {
      BOOL v8 = &history[v3];
      v8->unsigned int payloadHistoryCount = 0;
      if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
      {
        __str = 0;
        asprintf(&__str, "resetPrimaryPayloadHistory=%d historyIndex=%u count=%u history=%s", v14, v3, v8->payloadHistoryCount, [(VCAudioRedBuilder *)self payloadHistoryDescriptionForInfoIndex:v3]);
        if (__str)
        {
          __lasts = 0;
          uint64_t v9 = strtok_r(__str, "\n", &__lasts);
          do
          {
            if ((int)VRTraceGetErrorLogLevelForModule() >= 8)
            {
              uint64_t v10 = VRTraceErrorLogLevelToCSTR();
              uint64_t v11 = *v7;
              uint64_t v12 = *v7;
              if (*v6)
              {
                if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136316162;
                  uint64_t v18 = v10;
                  __int16 v19 = 2080;
                  __int16 v20 = "-[VCAudioRedBuilder resetShortREDHistoryAndPrimaryPayloadHistory:]";
                  __int16 v21 = 1024;
                  int v22 = 492;
                  __int16 v23 = 2080;
                  __int16 v24 = "";
                  __int16 v25 = 2080;
                  __int16 v26 = v9;
                  _os_log_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
                }
              }
              else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 136316162;
                uint64_t v18 = v10;
                __int16 v19 = 2080;
                __int16 v20 = "-[VCAudioRedBuilder resetShortREDHistoryAndPrimaryPayloadHistory:]";
                __int16 v21 = 1024;
                int v22 = 492;
                __int16 v23 = 2080;
                __int16 v24 = "";
                __int16 v25 = 2080;
                __int16 v26 = v9;
                _os_log_debug_impl(&dword_1E1EA4000, v11, OS_LOG_TYPE_DEBUG, "VCAudioRedBuilder [%s] %s:%d %s %s", buf, 0x30u);
              }
            }
            uint64_t v9 = strtok_r(0, "\n", &__lasts);
          }
          while (v9);
          free(__str);
          history = v13;
        }
      }
      ++v3;
    }
    while (v3 < self->_historyCount);
  }
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];

  uint64_t v3 = 0;
  char v4 = 1;
  do
  {
    char v5 = v4;
    uint64_t v6 = &self->_history[v3];
    payloadBufferHistory = v6->payloadBufferHistory;
    if (payloadBufferHistory)
    {
      p_payloadBufferHistory = &v6->payloadBufferHistory;
      free(payloadBufferHistory);
      *p_payloadBufferHistory = 0;
    }
    char v4 = 0;
    uint64_t v3 = 1;
  }
  while ((v5 & 1) != 0);
  v9.receiver = self;
  v9.super_class = (Class)VCAudioRedBuilder;
  [(VCAudioRedBuilder *)&v9 dealloc];
}

- (VCAudioRedBuilder)initWithRedPayloadType:(int)a3 sampleRate:(unsigned int)a4 samplesPerFrame:(unsigned int)a5 numPayloads:(unsigned int)a6 maxDelay:(unsigned int)a7 includeSequenceOffset:(BOOL)a8
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)VCAudioRedBuilder;
  BOOL v14 = [(VCAudioRedBuilder *)&v21 init];
  unsigned int v15 = v14;
  if (v14)
  {
    v14->_redPayloadType = a3;
    v14->_sampleRate = a4;
    v14->_unsigned int samplesPerFrame = a5;
    if (a7 <= a6) {
      unsigned int v16 = a6;
    }
    else {
      unsigned int v16 = a7;
    }
    v14->_numPayloads = a6;
    v14->_maxDelay = v16;
    v14->_includeSequenceOffset = a8;
    v14->_maxREDPayloadSize = 1280;
    char v17 = 1;
    v14->_unsigned int historyCount = 1;
    uint64_t v18 = 0;
    v14->_selectedRedPayloads = (NSPointerArray *)[objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:258];
    do
    {
      if ((v17 & 1) == 0)
      {
        v15->_history[1].payloadBufferHistory = 0;
        return v15;
      }
      __int16 v19 = (char *)malloc_type_calloc(9uLL, 0x5C0uLL, 0xCC8079CFuLL);
      char v17 = 0;
      v15->_history[v18].payloadBufferHistory = v19;
      uint64_t v18 = 1;
    }
    while (v19);
    if ((int)VRTraceGetErrorLogLevelForModule() >= 3)
    {
      VRTraceErrorLogLevelToCSTR();
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_ERROR)) {
        -[VCAudioRedBuilder initWithRedPayloadType:sampleRate:samplesPerFrame:numPayloads:maxDelay:includeSequenceOffset:]();
      }
    }

    return 0;
  }
  return v15;
}

+ (unsigned)redOverheadForNumPayloads:(unsigned int)a3
{
  if (a3) {
    return (4 * a3) | 1;
  }
  else {
    return 0;
  }
}

- (unsigned)maxDelay
{
  objc_sync_enter(self);
  unsigned int maxDelay = self->_maxDelay;
  objc_sync_exit(self);
  return maxDelay;
}

- (void)setMaxDelay:(unsigned int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (a3 < 0xA)
  {
    unsigned int v7 = a3;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() < 5)
  {
    unsigned int v7 = 9;
  }
  else
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    unsigned int v7 = 9;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 136316162;
      uint64_t v10 = v5;
      __int16 v11 = 2080;
      uint64_t v12 = "-[VCAudioRedBuilder setMaxDelay:]";
      __int16 v13 = 1024;
      int v14 = 594;
      __int16 v15 = 1024;
      unsigned int v16 = a3;
      __int16 v17 = 1024;
      int v18 = 9;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d Cap exceeded for maxDelay:%d using %d instead", (uint8_t *)&v9, 0x28u);
    }
  }
  if (self->_maxDelay != v7) {
    self->_unsigned int maxDelay = v7;
  }
  unsigned int numPayloads = self->_numPayloads;
  if (numPayloads > v7) {
    self->_unsigned int maxDelay = numPayloads;
  }
  objc_sync_exit(self);
}

- (unsigned)numPayloads
{
  objc_sync_enter(self);
  unsigned int numPayloads = self->_numPayloads;
  objc_sync_exit(self);
  return numPayloads;
}

- (void)setNumPayloads:(unsigned int)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  objc_sync_enter(self);
  if (a3 < 4)
  {
    unsigned int v7 = a3;
  }
  else if ((int)VRTraceGetErrorLogLevelForModule() < 5)
  {
    unsigned int v7 = 3;
  }
  else
  {
    uint64_t v5 = VRTraceErrorLogLevelToCSTR();
    uint64_t v6 = *MEMORY[0x1E4F47A50];
    unsigned int v7 = 3;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F47A50], OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136316162;
      uint64_t v9 = v5;
      __int16 v10 = 2080;
      __int16 v11 = "-[VCAudioRedBuilder setNumPayloads:]";
      __int16 v12 = 1024;
      int v13 = 616;
      __int16 v14 = 1024;
      unsigned int v15 = a3;
      __int16 v16 = 1024;
      int v17 = 3;
      _os_log_impl(&dword_1E1EA4000, v6, OS_LOG_TYPE_DEFAULT, "VCAudioRedBuilder [%s] %s:%d Cap exceeded for number of red payloads:%d using %d instead", (uint8_t *)&v8, 0x28u);
    }
  }
  if (v7 != self->_numPayloads)
  {
    self->_unsigned int numPayloads = v7;
    if (v7 > self->_maxDelay) {
      self->_unsigned int maxDelay = v7;
    }
  }
  objc_sync_exit(self);
}

- (int)redPayloadType
{
  return self->_redPayloadType;
}

- (unsigned)maxREDPayloadSize
{
  return self->_maxREDPayloadSize;
}

- (void)buildRedPayloadWithPrimaryPayload:redPayloads:.cold.1()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCAudioRedBuilder [%s] %s:%d Buffer size not enough remainingLength %d", v2, v3, v4, v5);
}

- (void)buildRedPayloadWithPrimaryPayload:redPayloads:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCAudioRedBuilder [%s] %s:%d Discarding Red payload that is too big :%d", v2, v3, v4, v5);
}

- (void)buildRedPayloadWithPrimaryPayload:redPayloads:.cold.3()
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  int v3 = 223;
  __int16 v4 = v0;
  int v5 = 0;
  _os_log_error_impl(&dword_1E1EA4000, v1, OS_LOG_TYPE_ERROR, "VCAudioRedBuilder [%s] %s:%d Buffer size not enough remainingLength %d", v2, 0x22u);
}

- (void)buildRedPayloadWithPrimaryPayload:redPayloads:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCAudioRedBuilder [%s] %s:%d Discarding Red payload with too old timestamp offset :%d", v2, v3, v4, v5);
}

- (void)buildRedPayloadWithPrimaryPayload:redPayloads:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCAudioRedBuilder [%s] %s:%d Discarding Red payload with too old sequence offset :%d", v2, v3, v4, v5);
}

- (void)buildRedPayloadWithPrimaryPayload:redPayloads:.cold.6()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_4(&dword_1E1EA4000, v0, v1, "VCAudioRedBuilder [%s] %s:%d Discarding Red payload with too old timestamp offset :%d", v2, v3, v4, v5);
}

- (void)initWithRedPayloadType:sampleRate:samplesPerFrame:numPayloads:maxDelay:includeSequenceOffset:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1E1EA4000, v0, v1, "VCAudioRedBuilder [%s] %s:%d Failed to allocate red payload buffer history", v2, v3, v4, v5, v6);
}

@end