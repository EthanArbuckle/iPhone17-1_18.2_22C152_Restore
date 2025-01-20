@interface SNGenerateShazamSignatureRequest
+ (BOOL)supportsSecureCoding;
+ (SNShazamMixingOptions)shazamChannelsMixingInfo;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)strideDuration;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)windowDuration;
- (BOOL)isEqual:(id)a3;
- (SNGenerateShazamSignatureRequest)init;
- (SNGenerateShazamSignatureRequest)initWithCoder:(id)a3;
- (SNGenerateShazamSignatureRequest)initWithWindowDuration:(id *)a3 strideDuration:(id *)a4 ringBufferDuration:(double)a5;
- (double)getRingBufferDuration;
- (double)ringBufferDuration;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setRingBufferDuration:(double)a3;
- (void)setStrideDuration:(id *)a3;
- (void)setWindowDuration:(id *)a3;
@end

@implementation SNGenerateShazamSignatureRequest

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)windowDuration
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)sub_1DCA80274(sub_1DCA801F8, (uint64_t)retstr);
}

- (void)setWindowDuration:(id *)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)strideDuration
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)sub_1DCA80274(sub_1DCA802B0, (uint64_t)retstr);
}

- (void)setStrideDuration:(id *)a3
{
}

- (double)ringBufferDuration
{
  return sub_1DCA80338();
}

- (void)setRingBufferDuration:(double)a3
{
}

- (SNGenerateShazamSignatureRequest)init
{
  return (SNGenerateShazamSignatureRequest *)sub_1DCA8037C();
}

- (SNGenerateShazamSignatureRequest)initWithWindowDuration:(id *)a3 strideDuration:(id *)a4 ringBufferDuration:(double)a5
{
  return (SNGenerateShazamSignatureRequest *)sub_1DCA80450(a3->var0, *(void *)&a3->var1, a3->var3, a4->var0, *(void *)&a4->var1, a4->var3, a5);
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNGenerateShazamSignatureRequest.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  SNGenerateShazamSignatureRequest.hash.getter();
  return result;
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
  BOOL v6 = SNGenerateShazamSignatureRequest.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6;
}

- (SNGenerateShazamSignatureRequest)initWithCoder:(id)a3
{
  return (SNGenerateShazamSignatureRequest *)SNGenerateShazamSignatureRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SNGenerateShazamSignatureRequest.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (double)getRingBufferDuration
{
  return sub_1DCA80338();
}

+ (SNShazamMixingOptions)shazamChannelsMixingInfo
{
  int64_t result = (SNShazamMixingOptions *)sub_1DCA80AC0((uint64_t)&v8);
  float v5 = v9;
  unsigned __int16 v6 = v10;
  uint64_t v7 = v11;
  retstr->var0 = v8;
  retstr->var1 = v5;
  retstr->var2 = v6;
  *(void *)&retstr->var3 = v7;
  return result;
}

@end