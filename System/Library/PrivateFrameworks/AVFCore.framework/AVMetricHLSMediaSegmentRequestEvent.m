@interface AVMetricHLSMediaSegmentRequestEvent
+ (BOOL)supportsSecureCoding;
- (AVMetricHLSMediaSegmentRequestEvent)initWithCoder:(id)a3;
- (AVMetricHLSMediaSegmentRequestEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 indexFileURL:(id)a6 byteRange:(_NSRange)a7 isMapSegment:(BOOL)a8 mediaType:(id)a9 mediaResourceRequestEvent:(id)a10;
- (AVMetricMediaResourceRequestEvent)mediaResourceRequestEvent;
- (BOOL)isMapSegment;
- (NSString)mediaType;
- (NSURL)indexFileURL;
- (NSURL)url;
- (_NSRange)byteRange;
- (id)debugDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVMetricHLSMediaSegmentRequestEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricHLSMediaSegmentRequestEvent;
  [(AVMetricEvent *)&v3 dealloc];
}

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricHLSMediaSegmentRequestEvent;
  return (id)[NSString stringWithFormat:@"<AVMetricHLSMediaSegmentRequestEvent:%p %@ indexFileURL:%@ isMapSegment:%d mediaType:%@ mediaResourceRequestEvent:%@>", self, -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_indexFileURL, self->_isMapSegment, self->_mediaType, -[AVMetricMediaResourceRequestEvent debugDescription](self->_mediaResourceRequestEvent, "debugDescription")];
}

- (AVMetricHLSMediaSegmentRequestEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 indexFileURL:(id)a6 byteRange:(_NSRange)a7 isMapSegment:(BOOL)a8 mediaType:(id)a9 mediaResourceRequestEvent:(id)a10
{
  NSUInteger length = a7.length;
  NSUInteger location = a7.location;
  v16.receiver = self;
  v16.super_class = (Class)AVMetricHLSMediaSegmentRequestEvent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a4;
  v13 = [(AVMetricEvent *)&v16 initWithDate:a3 mediaTime:&v15 sessionID:a5];
  if (v13)
  {
    v13->_mediaResourceRequestEvent = (AVMetricMediaResourceRequestEvent *)a10;
    v13->_isMapSegment = a8;
    v13->_indexFileURL = (NSURL *)a6;
    v13->_byteRange.NSUInteger location = location;
    v13->_byteRange.NSUInteger length = length;
    v13->_mediaType = (NSString *)a9;
  }
  return v13;
}

- (BOOL)isMapSegment
{
  return self->_isMapSegment;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (NSURL)indexFileURL
{
  return self->_indexFileURL;
}

- (_NSRange)byteRange
{
  p_byteRange = &self->_byteRange;
  NSUInteger location = self->_byteRange.location;
  NSUInteger length = p_byteRange->length;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (AVMetricMediaResourceRequestEvent)mediaResourceRequestEvent
{
  return self->_mediaResourceRequestEvent;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, @"supports only keyed archivers", v6, v7, v8, v9, v10, (uint64_t)v12.receiver), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)AVMetricHLSMediaSegmentRequestEvent;
  [(AVMetricEvent *)&v12 encodeWithCoder:a3];
  [a3 encodeBool:self->_isMapSegment forKey:@"isMapSegment"];
  [a3 encodeObject:self->_mediaType forKey:@"mediaType"];
  [a3 encodeObject:self->_indexFileURL forKey:@"indexFileURL"];
}

- (AVMetricHLSMediaSegmentRequestEvent)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMetricHLSMediaSegmentRequestEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_isMapSegment = [a3 decodeBoolForKey:@"isMapSegment"];
    v4->_mediaType = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"mediaType"];
    v4->_indexFileURL = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"indexFileURL"];
  }
  return v4;
}

- (NSURL)url
{
  return self->_url;
}

@end