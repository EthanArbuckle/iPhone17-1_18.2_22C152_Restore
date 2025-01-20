@interface AVMetricContentKeyRequestEvent
+ (BOOL)supportsSecureCoding;
- (AVContentKeySpecifier)contentKeySpecifier;
- (AVMetricContentKeyRequestEvent)initWithCoder:(id)a3;
- (AVMetricContentKeyRequestEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 contentKeySpecifier:(id)a6 mediaType:(id)a7 isClientInitiated:(BOOL)a8 mediaResourceRequestEvent:(id)a9;
- (AVMetricMediaResourceRequestEvent)mediaResourceRequestEvent;
- (BOOL)isClientInitiated;
- (NSString)mediaType;
- (id)debugDescription;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation AVMetricContentKeyRequestEvent

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricContentKeyRequestEvent;
  [(AVMetricEvent *)&v3 dealloc];
}

- (id)debugDescription
{
  v3.receiver = self;
  v3.super_class = (Class)AVMetricContentKeyRequestEvent;
  return (id)[NSString stringWithFormat:@"<AVMetricContentKeyRequestEvent:%p %@ contentKeySpecifier:%@ mediaType:%@ isClientInitiated:%d mediaResourceRequestEvent: %@>", self, -[AVMetricEvent debugDescriptionForAttr](&v3, sel_debugDescriptionForAttr), self->_contentKeySpecifier, self->_mediaType, self->_isClientInitiated, -[AVMetricMediaResourceRequestEvent debugDescription](self->_mediaResourceRequestEvent, "debugDescription")];
}

- (AVMetricContentKeyRequestEvent)initWithDate:(id)a3 mediaTime:(id *)a4 sessionID:(id)a5 contentKeySpecifier:(id)a6 mediaType:(id)a7 isClientInitiated:(BOOL)a8 mediaResourceRequestEvent:(id)a9
{
  v15.receiver = self;
  v15.super_class = (Class)AVMetricContentKeyRequestEvent;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14 = *a4;
  v12 = [(AVMetricEvent *)&v15 initWithDate:a3 mediaTime:&v14 sessionID:a5];
  if (v12)
  {
    v12->_mediaResourceRequestEvent = (AVMetricMediaResourceRequestEvent *)a9;
    v12->_contentKeySpecifier = (AVContentKeySpecifier *)a6;
    v12->_mediaType = (NSString *)a7;
    v12->_isClientInitiated = a8;
  }
  return v12;
}

- (AVContentKeySpecifier)contentKeySpecifier
{
  return self->_contentKeySpecifier;
}

- (NSString)mediaType
{
  return self->_mediaType;
}

- (BOOL)isClientInitiated
{
  return self->_isClientInitiated;
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
  v12.super_class = (Class)AVMetricContentKeyRequestEvent;
  [(AVMetricEvent *)&v12 encodeWithCoder:a3];
  [a3 encodeObject:self->_contentKeySpecifier forKey:@"contentKeySpecifier"];
  [a3 encodeObject:self->_mediaType forKey:@"mediaType"];
  [a3 encodeBool:self->_isClientInitiated forKey:@"isClientInitiated"];
}

- (AVMetricContentKeyRequestEvent)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)AVMetricContentKeyRequestEvent;
  v4 = -[AVMetricEvent initWithCoder:](&v6, sel_initWithCoder_);
  if (v4)
  {
    v4->_contentKeySpecifier = (AVContentKeySpecifier *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"contentKeySpecifier"];
    v4->_mediaType = (NSString *)(id)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"mediaType"];
    v4->_isClientInitiated = [a3 decodeBoolForKey:@"isClientInitiated"];
  }
  return v4;
}

@end