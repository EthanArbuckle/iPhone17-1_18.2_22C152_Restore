@interface SNMeasureLKFSRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SNMeasureLKFSRequest)init;
- (SNMeasureLKFSRequest)initWithCoder:(id)a3;
- (id)copyWithZone:(void *)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SNMeasureLKFSRequest

- (SNMeasureLKFSRequest)init
{
  return (SNMeasureLKFSRequest *)sub_1DC8CE788();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNMeasureLKFSRequest.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  return SNMeasureLKFSRequest.hash.getter();
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
  char v6 = SNMeasureLKFSRequest.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6 & 1;
}

- (SNMeasureLKFSRequest)initWithCoder:(id)a3
{
  return (SNMeasureLKFSRequest *)SNMeasureLKFSRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SNMeasureLKFSRequest.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end