@interface _SNClassifySoundRequest
+ (BOOL)supportsSecureCoding;
+ (id)eagerlyAllocateModelsForRequest:(id)a3 error:(id *)a4;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)windowDuration;
- (BOOL)isEqual:(id)a3;
- (BOOL)setOverlapFactor:(double)a3 error:(id *)a4;
- (NSArray)knownClassifications;
- (SNTimeDurationConstraint)windowDurationConstraint;
- (_SNClassifySoundRequest)init;
- (_SNClassifySoundRequest)initWithClassifierIdentifier:(id)a3 error:(id *)a4;
- (_SNClassifySoundRequest)initWithCoder:(id)a3;
- (_SNClassifySoundRequest)initWithMLModel:(id)a3 error:(id *)a4;
- (double)overlapFactor;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setWindowDuration:(id *)a3;
@end

@implementation _SNClassifySoundRequest

- (_SNClassifySoundRequest)init
{
}

- (_SNClassifySoundRequest)initWithMLModel:(id)a3 error:(id *)a4
{
  return (_SNClassifySoundRequest *)sub_1DCA1DEF8((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))sub_1DCA1D470);
}

- (_SNClassifySoundRequest)initWithClassifierIdentifier:(id)a3 error:(id *)a4
{
  return (_SNClassifySoundRequest *)sub_1DCA1DEF8((uint64_t)self, (uint64_t)a2, a3, (uint64_t)a4, (uint64_t (*)(uint64_t))sub_1DCA1DE5C);
}

- (double)overlapFactor
{
  return sub_1DCA1DFAC();
}

- (BOOL)setOverlapFactor:(double)a3 error:(id *)a4
{
  v5 = self;
  sub_1DCA1DFC0(a3);

  return 1;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)windowDuration
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)sub_1DCA1E12C();
  retstr->var0 = (int64_t)result;
  retstr->var1 = v5;
  retstr->var2 = v6;
  retstr->var3 = v7;
  return result;
}

- (void)setWindowDuration:(id *)a3
{
  CMTimeValue var0 = a3->var0;
  uint64_t v4 = *(void *)&a3->var1;
  CMTimeEpoch var3 = a3->var3;
  unsigned int v6 = self;
  sub_1DCA1E1AC(var0, v4, var3);
}

- (SNTimeDurationConstraint)windowDurationConstraint
{
  v2 = self;
  id v3 = sub_1DCA1E248();

  return (SNTimeDurationConstraint *)v3;
}

- (NSArray)knownClassifications
{
  sub_1DCA1E36C();
  v2 = (void *)sub_1DCB87C08();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (id)copyWithZone:(void *)a3
{
  id v3 = self;
  _SNClassifySoundRequest.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  uint64_t v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = _SNClassifySoundRequest.hash.getter();

  return v3;
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
  char v6 = _SNClassifySoundRequest.isEqual(_:)((uint64_t)v8);

  sub_1DC8A8F50((uint64_t)v8, &qword_1EAA9CAB0);
  return v6 & 1;
}

- (_SNClassifySoundRequest)initWithCoder:(id)a3
{
  return (_SNClassifySoundRequest *)_SNClassifySoundRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = self;
  _SNClassifySoundRequest.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)eagerlyAllocateModelsForRequest:(id)a3 error:(id *)a4
{
  id v4 = a3;
  sub_1DCA1F568(v7);

  sub_1DC881A8C(v7, (uint64_t)v7[3]);
  int v5 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v7);

  return v5;
}

- (void).cxx_destruct
{
  uint64_t v2 = *(void *)&self->impl[OBJC_IVAR____SNClassifySoundRequest_impl + 48];
  uint64_t v3 = *(void *)&self->impl[OBJC_IVAR____SNClassifySoundRequest_impl + 56];
  uint64_t v4 = *(void *)&self->impl[OBJC_IVAR____SNClassifySoundRequest_impl + 64];
  uint64_t v5 = *(void *)&self->impl[OBJC_IVAR____SNClassifySoundRequest_impl + 72];
  uint64_t v6 = *(void *)&self->impl[OBJC_IVAR____SNClassifySoundRequest_impl + 80];
  uint64_t v7 = *(void *)&self->impl[OBJC_IVAR____SNClassifySoundRequest_impl + 88];
  char v8 = self->impl[OBJC_IVAR____SNClassifySoundRequest_impl + 96];
  sub_1DC8823A0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____SNClassifySoundRequest_impl), *(void *)&self->impl[OBJC_IVAR____SNClassifySoundRequest_impl], self->impl[OBJC_IVAR____SNClassifySoundRequest_impl + 8]);
  sub_1DC8823B0(v2, v3, v4, v5, v6, v7, v8);

  swift_bridgeObjectRelease();
}

@end