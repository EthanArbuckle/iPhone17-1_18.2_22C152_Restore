@interface AVMetricEvent
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)mediaTime;
- (AVMetricEvent)initWithCoder:(id)a3;
- (AVMetricEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5;
- (NSDate)date;
- (NSString)sessionID;
- (id)debugDescription;
- (id)debugDescriptionForAttr;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVMetricEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricEvent;
  [(AVMetricEvent *)&v3 dealloc];
}

- (id)debugDescriptionForAttr
{
  date = self->_date;
  *(_OWORD *)&time.value = *(_OWORD *)&self->_mediaTime.value;
  sessionID = self->_sessionID;
  time.epoch = self->_mediaTime.epoch;
  return (id)[NSString stringWithFormat:@"sessionID:%@ date:%@ mediaTime:%f", sessionID, date, CMTimeGetSeconds(&time)];
}

- (id)debugDescription
{
  return (id)[NSString stringWithFormat:@"<AVMetricEvent:%p %@>", self, -[AVMetricEvent debugDescriptionForAttr](self, "debugDescriptionForAttr")];
}

- (AVMetricEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5
{
  v11.receiver = self;
  v11.super_class = (Class)AVMetricEvent;
  v8 = [(AVMetricEvent *)&v11 init];
  if (v8)
  {
    v8->_date = (NSDate *)a3;
    int64_t var3 = a4->var3;
    *(_OWORD *)&v8->_mediaTime.value = *(_OWORD *)&a4->var0;
    v8->_mediaTime.epoch = var3;
    v8->_sessionID = (NSString *)a5;
  }
  return v8;
}

- (NSDate)date
{
  return self->_date;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)mediaTime
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)&self->var3;
  return self;
}

- (NSString)sessionID
{
  return self->_sessionID;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v13 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports only keyed archivers", v6, v7, v8, v9, v10, mediaTime.value), 0 reason userInfo];
    objc_exception_throw(v13);
  }
  [a3 encodeObject:self->_date forKey:@"date"];
  CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  $95D729B680665BEAEFA1D6FCA8238556 mediaTime = self->_mediaTime;
  CFDictionaryRef v12 = CMTimeCopyAsDictionary((CMTime *)&mediaTime, v11);
  [a3 encodeObject:v12 forKey:@"mediaTime"];

  [a3 encodeObject:self->_sessionID forKey:@"sessionID"];
}

- (AVMetricEvent)initWithCoder:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)AVMetricEvent;
  v4 = [(AVMetricEvent *)&v9 init];
  if (v4)
  {
    v4->_date = (NSDate *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"date"];
    CFDictionaryRef v5 = (const __CFDictionary *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"mediaTime"];
    CMTimeMakeFromDictionary(&v8, v5);
    CMTimeEpoch epoch = v8.epoch;
    *(_OWORD *)&v4->_mediaTime.value = *(_OWORD *)&v8.value;
    v4->_mediaTime.CMTimeEpoch epoch = epoch;
    v4->_sessionID = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"sessionID"];
  }
  return v4;
}

@end