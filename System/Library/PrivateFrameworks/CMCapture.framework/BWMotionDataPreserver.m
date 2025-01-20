@interface BWMotionDataPreserver
+ (void)initialize;
- (BOOL)prependPreservedMotionDataToSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (BOOL)preserveMotionDataForSoonToBeDroppedSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (BWMotionDataPreserver)initWithName:(id)a3;
- (uint64_t)_preserveMotionDataForSampleBuffer:(int)a3 willBeDropped:;
- (void)dealloc;
- (void)reset;
@end

@implementation BWMotionDataPreserver

- (BWMotionDataPreserver)initWithName:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BWMotionDataPreserver;
  v4 = [(BWMotionDataPreserver *)&v6 init];
  if (v4) {
    v4->_name = (NSString *)[[NSString alloc] initWithString:a3];
  }
  return v4;
}

- (uint64_t)_preserveMotionDataForSampleBuffer:(int)a3 willBeDropped:
{
  if (result)
  {
    uint64_t v5 = result;
    objc_super v6 = (void *)CMGetAttachment(target, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    v7 = (void *)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F53F90]];
    v8 = (void *)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F54128]];
    if (v7)
    {
      uint64_t v9 = [v7 bytes];
      uint64_t v10 = [v7 length];
      int v11 = *(_DWORD *)(v9 + 4);
      if (v10 != 40 * v11 + 8 || v11 >= 111) {
        goto LABEL_42;
      }
      v12 = *(void **)(v5 + 16);
      if (v12)
      {
        if (a3)
        {
          unint64_t v13 = *(void *)(v5 + 24);
          unint64_t v14 = [v12 length];
          v12 = *(void **)(v5 + 16);
          if (v13 < v14)
          {
            objc_msgSend(*(id *)(v5 + 16), "replaceBytesInRange:withBytes:length:", *(void *)(v5 + 24), objc_msgSend(v12, "length") - *(void *)(v5 + 24), 0, 0);
            int v15 = *(_DWORD *)(v5 + 32);
            *(_DWORD *)([*(id *)(v5 + 16) mutableBytes] + 4) = v15;
            v12 = *(void **)(v5 + 16);
          }
        }
        int v16 = *(_DWORD *)([v12 bytes] + 4);
        int v17 = *(_DWORD *)(v9 + 4);
        int v18 = v17 + v16;
        int v19 = 110 - v16;
        if (v18 <= 110) {
          int v20 = *(_DWORD *)(v9 + 4);
        }
        else {
          int v20 = v19;
        }
        if (v20)
        {
          int v21 = v17 - v19;
          if (v18 <= 110) {
            int v21 = 0;
          }
          [*(id *)(v5 + 16) appendBytes:v9 + 40 * v21 + 8 length:40 * v20];
          uint64_t v22 = [*(id *)(v5 + 16) mutableBytes];
          *(_DWORD *)(v22 + 4) += v20;
        }
      }
      else
      {
        v23 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithData:v7];
        *(void *)(v5 + 16) = v23;
        *(void *)(v5 + 24) = [v23 length];
        *(_DWORD *)(v5 + 32) = *(_DWORD *)([*(id *)(v5 + 16) mutableBytes] + 4);
      }
    }
    v24 = (void *)[v6 objectForKeyedSubscript:*MEMORY[0x1E4F53F78]];
    if (!v24) {
      return 1;
    }
    v25 = v24;
    v26 = (_DWORD *)[v24 bytes];
    if (*v26) {
      int v27 = 24;
    }
    else {
      int v27 = 16;
    }
    uint64_t v28 = [v25 length];
    int v29 = v26[1];
    if (v28 == v27 * (uint64_t)v29 + 8 && v29 < 511)
    {
      if (!*(void *)(v5 + 40))
      {
        v39 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithData:v25];
        *(void *)(v5 + 40) = v39;
        *(void *)(v5 + 48) = [v39 length];
        *(_DWORD *)(v5 + 56) = *(_DWORD *)([*(id *)(v5 + 40) mutableBytes] + 4);
        v40 = *(const void **)(v5 + 64);
        *(void *)(v5 + 64) = v8;
        if (v8) {
          CFRetain(v8);
        }
        if (v40) {
          CFRelease(v40);
        }
        return 1;
      }
      if ([v8 isEqualToString:*(void *)(v5 + 64)])
      {
        if (a3)
        {
          unint64_t v30 = *(void *)(v5 + 48);
          if (v30 < [*(id *)(v5 + 40) length])
          {
            objc_msgSend(*(id *)(v5 + 40), "replaceBytesInRange:withBytes:length:", *(void *)(v5 + 48), objc_msgSend(*(id *)(v5 + 40), "length") - *(void *)(v5 + 48), 0, 0);
            int v31 = *(_DWORD *)(v5 + 56);
            *(_DWORD *)([*(id *)(v5 + 40) mutableBytes] + 4) = v31;
          }
        }
        int v32 = *(_DWORD *)([*(id *)(v5 + 40) bytes] + 4);
        int v33 = v26[1];
        int v34 = v33 + v32;
        int v35 = 510 - v32;
        int v36 = v33 - (510 - v32);
        if (v34 > 510)
        {
          int v37 = v35;
        }
        else
        {
          int v36 = 0;
          int v37 = v26[1];
        }
        if (v37)
        {
          if (*v26) {
            v38 = &v26[6 * v36];
          }
          else {
            v38 = &v26[4 * v36];
          }
          [*(id *)(v5 + 40) appendBytes:v38 + 2 length:v27 * (uint64_t)v37];
          uint64_t v41 = [*(id *)(v5 + 40) mutableBytes];
          *(_DWORD *)(v41 + 4) += v37;
        }
        return 1;
      }
LABEL_43:
      objc_msgSend((id)v5, "reset", v42, v43);
      return 0;
    }
LABEL_42:
    fig_log_get_emitter();
    uint64_t v43 = v3;
    LODWORD(v42) = 0;
    FigDebugAssert3();
    goto LABEL_43;
  }
  return result;
}

- (BOOL)prependPreservedMotionDataToSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  if (self->_preservedISPMotionData)
  {
    int v5 = -[BWMotionDataPreserver _preserveMotionDataForSampleBuffer:willBeDropped:]((uint64_t)self, a3, 0);
    BOOL result = 0;
    if (!v5) {
      return result;
    }
    v7 = (void *)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E4F53070], 0);
    [v7 setObject:self->_preservedISPMotionData forKeyedSubscript:*MEMORY[0x1E4F53F90]];

    self->_preservedISPMotionData = 0;
    preservedISPHallData = self->_preservedISPHallData;
    if (preservedISPHallData)
    {
      [v7 setObject:preservedISPHallData forKeyedSubscript:*MEMORY[0x1E4F53F78]];

      self->_preservedISPHallData = 0;
      self->_currentISPHallPortType = 0;
    }
  }
  return 1;
}

- (BOOL)preserveMotionDataForSoonToBeDroppedSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return -[BWMotionDataPreserver _preserveMotionDataForSampleBuffer:willBeDropped:]((uint64_t)self, a3, 1);
}

+ (void)initialize
{
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)BWMotionDataPreserver;
  [(BWMotionDataPreserver *)&v3 dealloc];
}

- (void)reset
{
  self->_preservedISPMotionData = 0;
  self->_preservedISPHallData = 0;

  self->_currentISPHallPortType = 0;
}

@end