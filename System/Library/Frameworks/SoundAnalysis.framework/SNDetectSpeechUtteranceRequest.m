@interface SNDetectSpeechUtteranceRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SNDetectSpeechUtteranceRequest)init;
- (SNDetectSpeechUtteranceRequest)initWithCoder:(id)a3;
- (SNDetectSpeechUtteranceRequest)initWithRequestType:(int64_t)a3;
- (double)decisionDelay;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SNDetectSpeechUtteranceRequest

- (double)decisionDelay
{
  v2 = self;
  double v3 = sub_1DC8D3290();

  return v3;
}

- (SNDetectSpeechUtteranceRequest)init
{
  return (SNDetectSpeechUtteranceRequest *)sub_1DC8D33FC();
}

- (SNDetectSpeechUtteranceRequest)initWithRequestType:(int64_t)a3
{
  return (SNDetectSpeechUtteranceRequest *)sub_1DC8D3464(a3);
}

- (id)copyWithZone:(void *)a3
{
  double v3 = self;
  SNDetectSpeechUtteranceRequest.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  return SNDetectSpeechUtteranceRequest.hash.getter();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  BOOL v6 = SNDetectSpeechUtteranceRequest.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6;
}

- (SNDetectSpeechUtteranceRequest)initWithCoder:(id)a3
{
  return (SNDetectSpeechUtteranceRequest *)SNDetectSpeechUtteranceRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SNDetectSpeechUtteranceRequest.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end