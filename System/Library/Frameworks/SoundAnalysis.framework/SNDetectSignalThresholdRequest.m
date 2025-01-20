@interface SNDetectSignalThresholdRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SNDetectSignalThresholdRequest)init;
- (SNDetectSignalThresholdRequest)initWithCoder:(id)a3;
- (double)magnitudeThreshold;
- (double)sampleRate;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (unsigned)blockSize;
- (void)encodeWithCoder:(id)a3;
- (void)setBlockSize:(unsigned int)a3;
- (void)setMagnitudeThreshold:(double)a3;
- (void)setSampleRate:(double)a3;
@end

@implementation SNDetectSignalThresholdRequest

- (double)sampleRate
{
  return sub_1DC8A2AAC();
}

- (void)setSampleRate:(double)a3
{
}

- (unsigned)blockSize
{
  return sub_1DC8A2B14();
}

- (void)setBlockSize:(unsigned int)a3
{
}

- (double)magnitudeThreshold
{
  return sub_1DC8A2B88();
}

- (void)setMagnitudeThreshold:(double)a3
{
}

- (SNDetectSignalThresholdRequest)init
{
  return (SNDetectSignalThresholdRequest *)sub_1DC8A2C34();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNDetectSignalThresholdRequest.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  return SNDetectSignalThresholdRequest.hash.getter();
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
  BOOL v6 = SNDetectSignalThresholdRequest.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6;
}

- (SNDetectSignalThresholdRequest)initWithCoder:(id)a3
{
  return (SNDetectSignalThresholdRequest *)SNDetectSignalThresholdRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SNDetectSignalThresholdRequest.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end