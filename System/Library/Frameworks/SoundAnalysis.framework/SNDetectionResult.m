@interface SNDetectionResult
+ (BOOL)supportsSecureCoding;
- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange;
- (BOOL)detected;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)detectorIdentifier;
- (NSString)identifier;
- (SNDetectionResult)init;
- (SNDetectionResult)initWithBinarySampleRepresentation:(id)a3;
- (SNDetectionResult)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5;
- (SNDetectionResult)initWithCoder:(id)a3;
- (SNDetectionResult)initWithIdentifier:(id)a3;
- (SNDetectionResult)initWithIdentifier:(id)a3 detectedValue:(BOOL)a4;
- (double)confidence;
- (id)binarySampleRepresentation;
- (id)copyWithZone:(void *)a3;
- (id)plistRepresentationWithError:(id *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setConfidence:(double)a3;
- (void)setDetected:(BOOL)a3;
- (void)setDetectorIdentifier:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation SNDetectionResult

- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange
{
  SNDetectionResult.timeRange.getter((uint64_t)v9);
  int64_t v5 = v12;
  uint64_t v6 = v9[1];
  uint64_t v7 = v11;
  long long v8 = v10;
  retstr->var0.var0 = v9[0];
  *(void *)&retstr->var0.var1 = v6;
  *(_OWORD *)&retstr->var0.var3 = v8;
  *(void *)&retstr->var1.var1 = v7;
  retstr->var1.var3 = v5;
  return result;
}

- (void)setTimeRange:(id *)a3
{
  int64_t var3 = a3->var1.var3;
  v4[0] = a3->var0.var0;
  v4[1] = *(void *)&a3->var0.var1;
  long long v5 = *(_OWORD *)&a3->var0.var3;
  uint64_t v6 = *(void *)&a3->var1.var1;
  int64_t v7 = var3;
  SNDetectionResult.timeRange.setter((uint64_t)v4);
}

- (double)confidence
{
  return SNDetectionResult.confidence.getter();
}

- (void)setConfidence:(double)a3
{
}

- (BOOL)detected
{
  return SNDetectionResult.detected.getter() & 1;
}

- (void)setDetected:(BOOL)a3
{
}

- (NSString)identifier
{
  return (NSString *)sub_1DCACD6A4((uint64_t)self, (uint64_t)a2, (void (*)(void))SNDetectionResult.identifier.getter);
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)detectorIdentifier
{
  return (NSString *)sub_1DCACD6A4((uint64_t)self, (uint64_t)a2, (void (*)(void))SNDetectionResult.detectorIdentifier.getter);
}

- (void)setDetectorIdentifier:(id)a3
{
}

- (SNDetectionResult)init
{
  return (SNDetectionResult *)sub_1DCACD8D8();
}

- (SNDetectionResult)initWithIdentifier:(id)a3
{
  return (SNDetectionResult *)sub_1DCACD948();
}

- (SNDetectionResult)initWithIdentifier:(id)a3 detectedValue:(BOOL)a4
{
  return (SNDetectionResult *)sub_1DCACDA10();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNDetectionResult.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = SNDetectionResult.hash.getter();

  return v3;
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
    long long v5 = self;
  }
  char v6 = SNDetectionResult.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6 & 1;
}

- (SNDetectionResult)initWithCoder:(id)a3
{
  return (SNDetectionResult *)SNDetectionResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  SNDetectionResult.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v2 = self;
  SNDetectionResult.description.getter();

  int64_t v3 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (SNDetectionResult)initWithBinarySampleRepresentation:(id)a3
{
  id v3 = a3;
  uint64_t v4 = sub_1DCB86AD8();
  unint64_t v6 = v5;

  return (SNDetectionResult *)sub_1DCACE624(v4, v6);
}

- (id)binarySampleRepresentation
{
  v2 = self;
  uint64_t v3 = sub_1DCACE890();
  unint64_t v5 = v4;

  unint64_t v6 = (void *)sub_1DCB86AB8();
  sub_1DC881920(v3, v5);

  return v6;
}

- (SNDetectionResult)initWithBinarySampleRepresentation:(id)a3 metadata:(id)a4 timestamp:(double)a5
{
  id v6 = a3;
  id v7 = a4;
  sub_1DCB86AD8();

  sub_1DCB877B8();
  return (SNDetectionResult *)sub_1DC91F404();
}

- (id)plistRepresentationWithError:(id *)a3
{
  uint64_t v3 = self;
  sub_1DCACEA94(v6);

  sub_1DC881A8C(v6, v6[3]);
  unint64_t v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);

  return v4;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end