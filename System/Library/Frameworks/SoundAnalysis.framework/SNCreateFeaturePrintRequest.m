@interface SNCreateFeaturePrintRequest
+ (BOOL)supportsSecureCoding;
+ (id)eagerlyAllocateModelsForRequest:(id)a3 error:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)windowDuration;
- (BOOL)isEqual:(id)a3;
- (SNCreateFeaturePrintRequest)init;
- (SNCreateFeaturePrintRequest)initWithCoder:(id)a3;
- (SNCreateFeaturePrintRequest)initWithFeaturePrintType:(int64_t)a3;
- (SNCreateFeaturePrintRequest)initWithFeaturePrintType:(int64_t)a3 version:(int64_t)a4 error:(id *)a5;
- (SNTimeDurationConstraint)windowDurationConstraint;
- (float)overlapFactor;
- (id)copyWithZone:(void *)a3;
- (int64_t)featurePrintType;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setFeaturePrintType:(int64_t)a3;
- (void)setOverlapFactor:(float)a3;
- (void)setWindowDuration:(id *)a3;
@end

@implementation SNCreateFeaturePrintRequest

- (SNTimeDurationConstraint)windowDurationConstraint
{
  v2 = self;
  id v3 = sub_1DCA65328();

  return (SNTimeDurationConstraint *)v3;
}

- (int64_t)featurePrintType
{
  return sub_1DCA65420();
}

- (void)setFeaturePrintType:(int64_t)a3
{
}

- (float)overlapFactor
{
  return sub_1DCA654B0();
}

- (void)setOverlapFactor:(float)a3
{
  v4 = self;
  sub_1DCA6551C(a3);
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)windowDuration
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)sub_1DCA656AC();
  retstr->var0 = (int64_t)result;
  retstr->var1 = v5;
  retstr->var2 = v6;
  retstr->var3 = v7;
  return result;
}

- (void)setWindowDuration:(id *)a3
{
  int64_t var0 = a3->var0;
  uint64_t v4 = *(void *)&a3->var1;
  CMTimeEpoch var3 = a3->var3;
  unsigned int v6 = self;
  sub_1DCA6572C(var0, v4, var3);
}

- (SNCreateFeaturePrintRequest)init
{
  return (SNCreateFeaturePrintRequest *)sub_1DCA6585C();
}

- (SNCreateFeaturePrintRequest)initWithFeaturePrintType:(int64_t)a3
{
  return (SNCreateFeaturePrintRequest *)sub_1DCA658C8(a3);
}

- (SNCreateFeaturePrintRequest)initWithFeaturePrintType:(int64_t)a3 version:(int64_t)a4 error:(id *)a5
{
  return (SNCreateFeaturePrintRequest *)sub_1DCA659E4(a3, a4);
}

- (id)copyWithZone:(void *)a3
{
  id v3 = self;
  SNCreateFeaturePrintRequest.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  uint64_t v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  return SNCreateFeaturePrintRequest.hash.getter();
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    uint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    int v5 = self;
  }
  BOOL v6 = SNCreateFeaturePrintRequest.isEqual(_:)((uint64_t)v8);

  sub_1DC901A64((uint64_t)v8, &qword_1EAA9CAB0);
  return v6;
}

- (SNCreateFeaturePrintRequest)initWithCoder:(id)a3
{
  return (SNCreateFeaturePrintRequest *)SNCreateFeaturePrintRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = self;
  SNCreateFeaturePrintRequest.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eagerlyAllocateModelsForRequest:(id)a3 error:(id *)a4
{
  id v4 = a3;
  sub_1DCA664B0((uint64_t)v4, v7);

  sub_1DC881A8C(v7, v7[3]);
  int v5 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v7);

  return v5;
}

@end