@interface SNEstimateDirectionOfArrivalRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSArray)spatialSpectrum;
- (SNEstimateDirectionOfArrivalRequest)init;
- (SNEstimateDirectionOfArrivalRequest)initWithCoder:(id)a3;
- (SNEstimateDirectionOfArrivalRequest)initWithTuningPrefix:(id)a3;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SNEstimateDirectionOfArrivalRequest

- (NSArray)spatialSpectrum
{
  v2 = (void *)sub_1DCB87C08();
  swift_bridgeObjectRelease();

  return (NSArray *)v2;
}

- (SNEstimateDirectionOfArrivalRequest)init
{
  return (SNEstimateDirectionOfArrivalRequest *)sub_1DC99412C();
}

- (SNEstimateDirectionOfArrivalRequest)initWithTuningPrefix:(id)a3
{
  uint64_t v3 = sub_1DCB87938();
  return (SNEstimateDirectionOfArrivalRequest *)sub_1DC994490(v3, v4);
}

- (id)copyWithZone:(void *)a3
{
  uint64_t v3 = self;
  SNEstimateDirectionOfArrivalRequest.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  unint64_t v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = SNEstimateDirectionOfArrivalRequest.hash.getter();

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
    v5 = self;
  }
  char v6 = SNEstimateDirectionOfArrivalRequest.isEqual(_:)((uint64_t)v8);

  sub_1DC901A64((uint64_t)v8, &qword_1EAA9CAB0);
  return v6 & 1;
}

- (SNEstimateDirectionOfArrivalRequest)initWithCoder:(id)a3
{
  return (SNEstimateDirectionOfArrivalRequest *)SNEstimateDirectionOfArrivalRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SNEstimateDirectionOfArrivalRequest.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

@end