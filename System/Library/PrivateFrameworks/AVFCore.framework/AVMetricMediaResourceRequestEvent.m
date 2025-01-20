@interface AVMetricMediaResourceRequestEvent
+ (BOOL)supportsSecureCoding;
- (AVMetricErrorEvent)errorEvent;
- (AVMetricMediaResourceRequestEvent)initWithCoder:(id)a3;
- (AVMetricMediaResourceRequestEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 url:(id)a6 serverAddress:(id)a7 requestStartTime:(id)a8 requestEndTime:(id)a9 responseStartTime:(id)a10 responseEndTime:(id)a11 byteRange:(_NSRange)a12 readFromCache:(BOOL)a13 errorEvent:(id)a14 networkTransactionMetrics:(id)a15;
- (BOOL)wasReadFromCache;
- (NSDate)requestEndTime;
- (NSDate)requestStartTime;
- (NSDate)responseEndTime;
- (NSDate)responseStartTime;
- (NSString)serverAddress;
- (NSURL)url;
- (NSURLSessionTaskMetrics)networkTransactionMetrics;
- (_NSRange)byteRange;
- (id)debugDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVMetricMediaResourceRequestEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricMediaResourceRequestEvent;
  [(AVMetricEvent *)&v3 dealloc];
}

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricMediaResourceRequestEvent;
  return (id)[NSString stringWithFormat:@"<AVMetricMediaResourceRequestEvent:%p %@ url:%@ serverAddress:%@ requestStartTime:%@ requestEndTime:%@ responseStartTime:%@ responseEndTime:%@ error:%@ byteRange:(%lu,%lu) readFromCache:%d networkTransactionMetrics:%@>", self, -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_url, self->_serverAddress, self->_requestStartTime, self->_requestEndTime, self->_responseStartTime, self->_responseEndTime, -[AVMetricErrorEvent debugDescription](self->_errorEvent, "debugDescription"), self->_byteRange.location, self->_byteRange.length, self->_readFromCache, -[NSURLSessionTaskMetrics debugDescription](self->_networkTransactionMetrics, "debugDescription")];
}

- (AVMetricMediaResourceRequestEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 url:(id)a6 serverAddress:(id)a7 requestStartTime:(id)a8 requestEndTime:(id)a9 responseStartTime:(id)a10 responseEndTime:(id)a11 byteRange:(_NSRange)a12 readFromCache:(BOOL)a13 errorEvent:(id)a14 networkTransactionMetrics:(id)a15
{
  v21.receiver = self;
  v21.super_class = (Class)AVMetricMediaResourceRequestEvent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v20 = *a4;
  v18 = [(AVMetricEvent *)&v21 initWithDate:a3 mediaTime:&v20 sessionID:a5];
  if (v18)
  {
    v18->_url = (NSURL *)a6;
    v18->_serverAddress = (NSString *)a7;
    v18->_requestStartTime = (NSDate *)a8;
    v18->_requestEndTime = (NSDate *)a9;
    v18->_responseStartTime = (NSDate *)a10;
    v18->_responseEndTime = (NSDate *)a11;
    v18->_byteRange = a12;
    v18->_readFromCache = a13;
    v18->_errorEvent = (AVMetricErrorEvent *)a14;
    v18->_networkTransactionMetrics = (NSURLSessionTaskMetrics *)a15;
  }
  return v18;
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)serverAddress
{
  return self->_serverAddress;
}

- (NSDate)requestStartTime
{
  return self->_requestStartTime;
}

- (NSDate)requestEndTime
{
  return self->_requestEndTime;
}

- (NSDate)responseStartTime
{
  return self->_responseStartTime;
}

- (NSDate)responseEndTime
{
  return self->_responseEndTime;
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

- (BOOL)wasReadFromCache
{
  return self->_readFromCache;
}

- (AVMetricErrorEvent)errorEvent
{
  return self->_errorEvent;
}

- (NSURLSessionTaskMetrics)networkTransactionMetrics
{
  return self->_networkTransactionMetrics;
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
  v12.super_class = (Class)AVMetricMediaResourceRequestEvent;
  [(AVMetricEvent *)&v12 encodeWithCoder:a3];
  [a3 encodeObject:self->_url forKey:@"url"];
  [a3 encodeObject:self->_serverAddress forKey:@"serverAddress"];
  [a3 encodeObject:self->_requestStartTime forKey:@"requestStartTime"];
  [a3 encodeObject:self->_requestEndTime forKey:@"requestEndTime"];
  [a3 encodeObject:self->_responseStartTime forKey:@"responseStartTime"];
  [a3 encodeObject:self->_responseEndTime forKey:@"responseEndTime"];
  [a3 encodeInteger:self->_byteRange.length forKey:@"byteRangeLength"];
  [a3 encodeInteger:self->_byteRange.location forKey:@"byteRangeLocation"];
  [a3 encodeBool:self->_readFromCache forKey:@"readFromCache"];
  [a3 encodeObject:self->_errorEvent forKey:@"errorEvent"];
  [a3 encodeObject:self->_networkTransactionMetrics forKey:@"networkTransactionMetrics"];
}

- (AVMetricMediaResourceRequestEvent)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMetricMediaResourceRequestEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_url = (NSURL *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"url"];
    v4->_serverAddress = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"serverAddress"];
    v4->_requestStartTime = (NSDate *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"requestStartTime"];
    v4->_requestEndTime = (NSDate *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"requestEndTime"];
    v4->_responseStartTime = (NSDate *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"responseStartTime"];
    v4->_responseEndTime = (NSDate *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"responseEndTime"];
    v4->_byteRange.NSUInteger length = [a3 decodeIntegerForKey:@"byteRangeLength"];
    v4->_byteRange.NSUInteger location = [a3 decodeIntegerForKey:@"byteRangeLocation"];
    v4->_readFromCache = [a3 decodeBoolForKey:@"readFromCache"];
    v4->_errorEvent = (AVMetricErrorEvent *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"errorEvent"];
    v4->_networkTransactionMetrics = (NSURLSessionTaskMetrics *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"networkTransactionMetrics"];
  }
  return v4;
}

@end