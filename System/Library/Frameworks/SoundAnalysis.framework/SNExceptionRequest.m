@interface SNExceptionRequest
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (SNExceptionRequest)init;
- (SNExceptionRequest)initWithCoder:(id)a3;
- (SNExceptionRequest)initWithExceptionLocation:(int64_t)a3;
- (id)copyWithZone:(void *)a3;
- (int64_t)exceptionLocation;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setExceptionLocation:(int64_t)a3;
@end

@implementation SNExceptionRequest

- (int64_t)exceptionLocation
{
  return sub_1DC934720();
}

- (void)setExceptionLocation:(int64_t)a3
{
}

- (SNExceptionRequest)initWithExceptionLocation:(int64_t)a3
{
  return (SNExceptionRequest *)sub_1DC9347B4(a3);
}

- (SNExceptionRequest)init
{
  return (SNExceptionRequest *)sub_1DC93482C();
}

- (id)copyWithZone:(void *)a3
{
  v3 = self;
  SNExceptionRequest.copy(with:)(v6);

  sub_1DC881A8C(v6, v6[3]);
  v4 = (void *)sub_1DCB89008();
  sub_1DC8818D0((uint64_t)v6);
  return v4;
}

- (int64_t)hash
{
  return SNExceptionRequest.hash.getter();
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
  BOOL v6 = SNExceptionRequest.isEqual(_:)((uint64_t)v8);

  sub_1DC881978((uint64_t)v8);
  return v6;
}

- (SNExceptionRequest)initWithCoder:(id)a3
{
  return (SNExceptionRequest *)SNExceptionRequest.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SNExceptionRequest.encode(with:)((NSCoder)v4);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end