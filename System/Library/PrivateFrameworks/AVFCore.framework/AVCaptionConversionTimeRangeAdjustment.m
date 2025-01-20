@interface AVCaptionConversionTimeRangeAdjustment
+ (AVCaptionConversionTimeRangeAdjustment)captionConversionTimeRangeAdjustmentWithFigDictionary:(__CFDictionary *)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationAdjustment;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startAdjustment;
- (AVCaptionConversionTimeRangeAdjustment)initWithFigDictionary:(__CFDictionary *)a3;
- (CMTime)durationOffset;
- (CMTime)startTimeOffset;
- (id)adjustmentType;
- (id)description;
- (void)dealloc;
@end

@implementation AVCaptionConversionTimeRangeAdjustment

+ (AVCaptionConversionTimeRangeAdjustment)captionConversionTimeRangeAdjustmentWithFigDictionary:(__CFDictionary *)a3
{
  v3 = (void *)[objc_alloc((Class)objc_opt_class()) initWithFigDictionary:a3];
  return (AVCaptionConversionTimeRangeAdjustment *)v3;
}

- (AVCaptionConversionTimeRangeAdjustment)initWithFigDictionary:(__CFDictionary *)a3
{
  self->_timeRangeAdjustmentInternal = (void *)[(__CFDictionary *)a3 copy];
  return self;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVCaptionConversionTimeRangeAdjustment;
  [(AVCaptionConversionTimeRangeAdjustment *)&v3 dealloc];
}

- (id)adjustmentType
{
  return @"AVCaptionConversionAdjustmentTypeTimeRange";
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)startAdjustment
{
  CFDictionaryRef v4 = (const __CFDictionary *)[self->_timeRangeAdjustmentInternal objectForKeyedSubscript:*MEMORY[0x1E4F32820]];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary((CMTime *)retstr, v4);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)durationAdjustment
{
  CFDictionaryRef v4 = (const __CFDictionary *)[self->_timeRangeAdjustmentInternal objectForKeyedSubscript:*MEMORY[0x1E4F32818]];
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeFromDictionary((CMTime *)retstr, v4);
}

- (CMTime)startTimeOffset
{
  if (self) {
    return (CMTime *)[(CMTime *)self startAdjustment];
  }
  retstr->value = 0;
  *(void *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return self;
}

- (CMTime)durationOffset
{
  if (self) {
    return (CMTime *)[(CMTime *)self durationAdjustment];
  }
  retstr->value = 0;
  *(void *)&retstr->timescale = 0;
  retstr->epoch = 0;
  return self;
}

- (id)description
{
  CFAllocatorRef v3 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  if (self)
  {
    [(AVCaptionConversionTimeRangeAdjustment *)self startAdjustment];
    CFStringRef v4 = CMTimeCopyDescription(v3, &time);
    [(AVCaptionConversionTimeRangeAdjustment *)self durationAdjustment];
  }
  else
  {
    memset(&time, 0, sizeof(time));
    CFStringRef v4 = CMTimeCopyDescription(v3, &time);
    memset(&v10, 0, sizeof(v10));
  }
  CFStringRef v5 = CMTimeCopyDescription(v3, &v10);
  v6 = NSString;
  v7 = (objc_class *)objc_opt_class();
  v8 = (void *)[v6 stringWithFormat:@"<%@: %p, start time adjusted by %@, duration adjusted by %@", NSStringFromClass(v7), self, v4, v5];
  if (v4) {
    CFRelease(v4);
  }
  if (v5) {
    CFRelease(v5);
  }
  return v8;
}

@end