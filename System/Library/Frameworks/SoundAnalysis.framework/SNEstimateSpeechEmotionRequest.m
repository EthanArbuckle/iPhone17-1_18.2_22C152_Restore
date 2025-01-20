@interface SNEstimateSpeechEmotionRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SNEstimateSpeechEmotionRequest)init;
- (SNEstimateSpeechEmotionRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SNEstimateSpeechEmotionRequest

- (SNEstimateSpeechEmotionRequest)init
{
  return (SNEstimateSpeechEmotionRequest *)sub_1DC8CE788();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNEstimateSpeechEmotionRequest.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  return SNEstimateSpeechEmotionRequest.hash.getter();
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
  char v6 = SNEstimateSpeechEmotionRequest.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6 & 1;
}

- (SNEstimateSpeechEmotionRequest)initWithCoder:(id)a3
{
  return (SNEstimateSpeechEmotionRequest *)SNEstimateSpeechEmotionRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SNEstimateSpeechEmotionRequest.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end