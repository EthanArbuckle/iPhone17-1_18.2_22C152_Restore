@interface CorrectedPronunciation
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (BOOL)isEqual:(id)a3;
- (CorrectedPronunciation)init;
- (CorrectedPronunciation)initWithCoder:(id)a3;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CorrectedPronunciation

+ (BOOL)supportsSecureCoding
{
  return byte_52AA0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_52AA0 = a3;
}

- (NSString)description
{
  v2 = self;
  sub_7AE0();

  NSString v3 = sub_3ED48();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (CorrectedPronunciation)initWithCoder:(id)a3
{
  return (CorrectedPronunciation *)sub_7CA0(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_7E84(v4);
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
  char v6 = sub_8080((uint64_t)v8);

  sub_AC34((uint64_t)v8);
  return v6 & 1;
}

- (CorrectedPronunciation)init
{
  result = (CorrectedPronunciation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  NSString v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CorrectedPronunciation_maybeNickNamePhonemeString);
}

@end