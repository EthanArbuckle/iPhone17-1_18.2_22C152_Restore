@interface AVCaptionGroup
- (AVCaptionGroup)initWithCaptions:(NSArray *)captions timeRange:(CMTimeRange *)timeRange;
- (AVCaptionGroup)initWithTimeRange:(CMTimeRange *)timeRange;
- (CMTimeRange)timeRange;
- (NSArray)captions;
- (id)description;
- (opaqueCMSampleBuffer)copySampleBufferWithError:(id *)a3;
- (void)dealloc;
@end

@implementation AVCaptionGroup

- (AVCaptionGroup)initWithCaptions:(NSArray *)captions timeRange:(CMTimeRange *)timeRange
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if (!captions)
  {
    v37 = self;
    v32 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v33 = *MEMORY[0x1E4F1C3C8];
    v34 = "captions != nil";
LABEL_30:
    v35 = (void *)[v32 exceptionWithName:v33, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v27, v28, v29, v30, v31, (uint64_t)v34), 0 reason userInfo];
    objc_exception_throw(v35);
  }
  if ((timeRange->start.flags & 1) == 0
    || (timeRange->duration.flags & 1) == 0
    || timeRange->duration.epoch
    || timeRange->duration.value < 0)
  {
    v36 = self;
    v32 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v33 = *MEMORY[0x1E4F1C3C8];
    v34 = "CMTIMERANGE_IS_VALID(timeRange)";
    goto LABEL_30;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v8 = [(NSArray *)captions countByEnumeratingWithState:&v47 objects:v52 count:16];
  if (!v8) {
    goto LABEL_17;
  }
  uint64_t v9 = v8;
  uint64_t v10 = *(void *)v48;
  do
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      if (*(void *)v48 != v10) {
        objc_enumerationMutation(captions);
      }
      v12 = *(void **)(*((void *)&v47 + 1) + 8 * i);
      memset(&v46, 0, sizeof(v46));
      if (v12) {
        [v12 timeRange];
      }
      else {
        memset(&range, 0, sizeof(range));
      }
      long long v13 = *(_OWORD *)&timeRange->start.epoch;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&timeRange->start.value;
      *(_OWORD *)&otherRange.start.epoch = v13;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
      CMTimeRangeGetIntersection(&v46, &range, &otherRange);
      long long v14 = *(_OWORD *)&timeRange->start.epoch;
      *(_OWORD *)&otherRange.start.value = *(_OWORD *)&timeRange->start.value;
      *(_OWORD *)&otherRange.start.epoch = v14;
      *(_OWORD *)&otherRange.duration.timescale = *(_OWORD *)&timeRange->duration.timescale;
      CMTimeRange range2 = v46;
      if (!CMTimeRangeEqual(&otherRange, &range2))
      {
        v26 = self;
        v32 = (void *)MEMORY[0x1E4F1CA00];
        uint64_t v33 = *MEMORY[0x1E4F1C3C8];
        v34 = "CMTimeRangeEqual( timeRange, intersection)";
        goto LABEL_30;
      }
    }
    uint64_t v9 = [(NSArray *)captions countByEnumeratingWithState:&v47 objects:v52 count:16];
  }
  while (v9);
LABEL_17:
  v42.receiver = self;
  v42.super_class = (Class)AVCaptionGroup;
  v15 = [(AVCaptionGroup *)&v42 init];
  if (v15)
  {
    v16 = objc_alloc_init(AVCaptionGroupInternal);
    v15->_internal = v16;
    if (v16)
    {
      CFRetain(v16);
      v17 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v18 = [(NSArray *)captions countByEnumeratingWithState:&v38 objects:v51 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v39;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v39 != v20) {
              objc_enumerationMutation(captions);
            }
            -[NSArray addObject:](v17, "addObject:", (id)[*(id *)(*((void *)&v38 + 1) + 8 * j) copy]);
          }
          uint64_t v19 = [(NSArray *)captions countByEnumeratingWithState:&v38 objects:v51 count:16];
        }
        while (v19);
      }
      v15->_internal->captions = v17;
      internal = v15->_internal;
      long long v23 = *(_OWORD *)&timeRange->start.value;
      long long v24 = *(_OWORD *)&timeRange->duration.timescale;
      *(_OWORD *)&internal->timeRange.start.epoch = *(_OWORD *)&timeRange->start.epoch;
      *(_OWORD *)&internal->timeRange.duration.timescale = v24;
      *(_OWORD *)&internal->timeRange.start.value = v23;
    }
    else
    {

      return 0;
    }
  }
  return v15;
}

- (AVCaptionGroup)initWithTimeRange:(CMTimeRange *)timeRange
{
  if ((timeRange->start.flags & 1) == 0
    || (timeRange->duration.flags & 1) == 0
    || timeRange->duration.epoch
    || timeRange->duration.value < 0)
  {
    v7 = self;
    long long v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"invalid parameter not satisfying: %s", v8, v9, v10, v11, v12, (uint64_t)"CMTIMERANGE_IS_VALID(timeRange)"), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  long long v3 = *(_OWORD *)&timeRange->start.epoch;
  v14[0] = *(_OWORD *)&timeRange->start.value;
  v14[1] = v3;
  v14[2] = *(_OWORD *)&timeRange->duration.timescale;
  return [(AVCaptionGroup *)self initWithCaptions:MEMORY[0x1E4F1CBF0] timeRange:v14];
}

- (void)dealloc
{
  internal = self->_internal;
  if (internal)
  {

    CFRelease(self->_internal);
    internal = self->_internal;
  }

  v4.receiver = self;
  v4.super_class = (Class)AVCaptionGroup;
  [(AVCaptionGroup *)&v4 dealloc];
}

- (id)description
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  internal = self->_internal;
  long long v5 = *(_OWORD *)&internal->timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&internal->timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v5;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&internal->timeRange.duration.timescale;
  CFStringRef v6 = (id)CMTimeRangeCopyDescription(v3, &range);
  v7 = NSString;
  uint64_t v8 = (objc_class *)objc_opt_class();
  return (id)[v7 stringWithFormat:@"<%@: %p, timeRange = %@ captions=%@>", NSStringFromClass(v8), self, v6, self->_internal->captions];
}

- (CMTimeRange)timeRange
{
  CFAllocatorRef v3 = *(_OWORD **)&self->start.timescale;
  long long v4 = v3[2];
  *(_OWORD *)&retstr->start.value = v3[1];
  *(_OWORD *)&retstr->start.epoch = v4;
  *(_OWORD *)&retstr->duration.timescale = v3[3];
  return self;
}

- (NSArray)captions
{
  return self->_internal->captions;
}

- (opaqueCMSampleBuffer)copySampleBufferWithError:(id *)a3
{
  unint64_t v4 = [(NSArray *)[(AVCaptionGroup *)self captions] count];
  v32 = 0;
  CFTypeRef v33 = 0;
  CFTypeRef v31 = 0;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v4, MEMORY[0x1E4F1D510]);
  CFStringRef v6 = 0;
  v7 = 0;
  if (v4 > 0xAAAAAAAAAAAAAAALL
    || (v7 = (char *)malloc_type_malloc((24 * v4) | 1, 0x5CC9CBA6uLL),
        CFStringRef v6 = (char *)malloc_type_malloc((24 * v4) | 1, 0x5CC9CBA6uLL),
        v4))
  {
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    while (1)
    {
      id v10 = [(NSArray *)[(AVCaptionGroup *)self captions] objectAtIndexedSubscript:v9];
      [v10 _figCaptionData];
      if (FigCaptionDataCreateMutableCopy()) {
        break;
      }
      if (self)
      {
        [(AVCaptionGroup *)self timeRange];
      }
      else
      {
        long long v27 = 0u;
        long long v28 = 0u;
        long long v26 = 0u;
      }
      *(_OWORD *)&lhs.value = v26;
      lhs.epoch = v27;
      if (v10)
      {
        [v10 timeRange];
      }
      else
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v22 = 0u;
      }
      uint64_t v11 = &v7[v8];
      *(_OWORD *)&rhs.value = v22;
      rhs.epoch = v23;
      CMTimeSubtract(&v30, &lhs, &rhs);
      long long v12 = *(_OWORD *)&v30.value;
      *((void *)v11 + 2) = v30.epoch;
      *(_OWORD *)uint64_t v11 = v12;
      if (v10) {
        [v10 timeRange];
      }
      else {
        memset(&range, 0, sizeof(range));
      }
      CMTimeRangeGetEnd(&v21, &range);
      if (self) {
        [(AVCaptionGroup *)self timeRange];
      }
      else {
        memset(&v18, 0, sizeof(v18));
      }
      long long v13 = &v6[v8];
      CMTimeRangeGetEnd(&v19, &v18);
      CMTimeSubtract(&v30, &v21, &v19);
      long long v14 = *(_OWORD *)&v30.value;
      CFTypeRef v15 = v31;
      *((void *)v13 + 2) = v30.epoch;
      *(_OWORD *)long long v13 = v14;
      CFArrayAppendValue(Mutable, v15);
      if (v31)
      {
        CFRelease(v31);
        CFTypeRef v31 = 0;
      }
      ++v9;
      v8 += 24;
      if (v4 == v9) {
        goto LABEL_20;
      }
    }
  }
  else
  {
LABEL_20:
    if (!FigCaptionGroupCreate())
    {
      if (self)
      {
        [(AVCaptionGroup *)self timeRange];
        [(AVCaptionGroup *)self timeRange];
      }
      if (!FigSampleBufferCreateForCaptionGroup())
      {
        v16 = v32;
        v32 = 0;
        goto LABEL_25;
      }
    }
  }
  v16 = 0;
LABEL_25:
  free(v7);
  free(v6);
  if (Mutable) {
    CFRelease(Mutable);
  }
  if (v31) {
    CFRelease(v31);
  }
  if (v33) {
    CFRelease(v33);
  }
  if (v32) {
    CFRelease(v32);
  }
  return v16;
}

@end