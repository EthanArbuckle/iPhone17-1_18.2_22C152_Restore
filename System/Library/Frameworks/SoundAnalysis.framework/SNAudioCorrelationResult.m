@interface SNAudioCorrelationResult
+ (BOOL)supportsSecureCoding;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)peakTime;
- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (SNAudioCorrelationResult)init;
- (SNAudioCorrelationResult)initWithCoder:(id)a3;
- (double)peakValue;
- (id)copyWithZone:(void *)a3;
- (int64_t)channelIndex;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setChannelIndex:(int64_t)a3;
- (void)setPeakTime:(id *)a3;
- (void)setPeakValue:(double)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation SNAudioCorrelationResult

- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange
{
  SNAudioCorrelationResult.timeRange.getter((uint64_t)v9);
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
  SNAudioCorrelationResult.timeRange.setter((uint64_t)v4);
}

- (double)peakValue
{
  return sub_1DCB281A0();
}

- (void)setPeakValue:(double)a3
{
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)peakTime
{
  result = ($3CC8671D27C23BF42ADDB32F2B5E48AE *)sub_1DCB28210();
  retstr->var0 = (int64_t)result;
  retstr->var1 = v5;
  retstr->var2 = v6;
  retstr->int64_t var3 = v7;
  return result;
}

- (void)setPeakTime:(id *)a3
{
}

- (int64_t)channelIndex
{
  return sub_1DCB28278();
}

- (void)setChannelIndex:(int64_t)a3
{
}

- (SNAudioCorrelationResult)init
{
  return (SNAudioCorrelationResult *)sub_1DCB282B4();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNAudioCorrelationResult.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  return SNAudioCorrelationResult.hash.getter();
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
    int v5 = self;
  }
  BOOL v6 = SNAudioCorrelationResult.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6;
}

- (SNAudioCorrelationResult)initWithCoder:(id)a3
{
  return (SNAudioCorrelationResult *)SNAudioCorrelationResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  int v5 = self;
  SNAudioCorrelationResult.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v2 = self;
  SNAudioCorrelationResult.description.getter();

  v3 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end