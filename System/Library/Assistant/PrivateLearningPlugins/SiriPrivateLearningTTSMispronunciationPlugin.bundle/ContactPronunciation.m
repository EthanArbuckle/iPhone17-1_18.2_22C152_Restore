@interface ContactPronunciation
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (ContactPronunciation)init;
- (ContactPronunciation)initWithCoder:(id)a3;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ContactPronunciation

+ (BOOL)supportsSecureCoding
{
  return byte_53AE0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_53AE0 = a3;
}

- (ContactPronunciation)initWithCoder:(id)a3
{
  return (ContactPronunciation *)sub_30458(a3);
}

- (NSString)description
{
  v2 = self;
  sub_309F4();

  NSString v3 = sub_3ED48();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_3F118();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = sub_30B28((uint64_t)v8);

  sub_AC34((uint64_t)v8);
  return v6 & 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_30C98(v4);
}

- (ContactPronunciation)init
{
  result = (ContactPronunciation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end