@interface SNDirectionOfArrivalResult
+ (BOOL)supportsSecureCoding;
- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange;
- (BOOL)isEqual:(id)a3;
- (NSArray)spatialSpectrum;
- (NSString)description;
- (SNDirectionOfArrivalResult)init;
- (SNDirectionOfArrivalResult)initWithCoder:(id)a3;
- (float)azimuth;
- (float)elevation;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setAzimuth:(float)a3;
- (void)setElevation:(float)a3;
- (void)setSpatialSpectrum:(id)a3;
- (void)setTimeRange:(id *)a3;
@end

@implementation SNDirectionOfArrivalResult

- ($A0D62BC7BB322857EA05296DE7D5C3FF)timeRange
{
  SNDirectionOfArrivalResult.timeRange.getter((uint64_t)v9);
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
  SNDirectionOfArrivalResult.timeRange.setter((uint64_t)v4);
}

- (float)azimuth
{
  return SNDirectionOfArrivalResult.azimuth.getter();
}

- (void)setAzimuth:(float)a3
{
}

- (float)elevation
{
  return SNDirectionOfArrivalResult.elevation.getter();
}

- (void)setElevation:(float)a3
{
}

- (NSArray)spatialSpectrum
{
  v2 = self;
  SNDirectionOfArrivalResult.spatialSpectrum.getter();

  sub_1DC917CC4();
  v3 = (void *)sub_1DCB87C08();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (void)setSpatialSpectrum:(id)a3
{
  sub_1DC917CC4();
  unint64_t v4 = sub_1DCB87C38();
  long long v5 = self;
  SNDirectionOfArrivalResult.spatialSpectrum.setter(v4);
}

- (SNDirectionOfArrivalResult)init
{
  return (SNDirectionOfArrivalResult *)sub_1DC91718C();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNDirectionOfArrivalResult.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  unint64_t v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = SNDirectionOfArrivalResult.hash.getter();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    unint64_t v4 = self;
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    long long v5 = self;
  }
  char v6 = SNDirectionOfArrivalResult.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6 & 1;
}

- (SNDirectionOfArrivalResult)initWithCoder:(id)a3
{
  return (SNDirectionOfArrivalResult *)SNDirectionOfArrivalResult.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  long long v5 = self;
  SNDirectionOfArrivalResult.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)description
{
  v2 = self;
  SNDirectionOfArrivalResult.description.getter();

  int64_t v3 = (void *)sub_1DCB87908();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void).cxx_destruct
{
}

@end