@interface PhonemeString
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (PhonemeString)init;
- (PhonemeString)initWithCoder:(id)a3;
- (int64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PhonemeString

+ (BOOL)supportsSecureCoding
{
  return byte_53490;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_53490 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19C70(v4);
}

- (PhonemeString)initWithCoder:(id)a3
{
  return (PhonemeString *)sub_19E58(a3);
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_3F118();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_1A25C((uint64_t)v8);

  sub_AC34((uint64_t)v8);
  return v6 & 1;
}

- (int64_t)hash
{
  v2 = self;
  Swift::Int v3 = sub_1A414();

  return v3;
}

- (NSString)description
{
  v2 = self;
  sub_1A574();

  NSString v3 = sub_3ED48();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (PhonemeString)init
{
  result = (PhonemeString *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end