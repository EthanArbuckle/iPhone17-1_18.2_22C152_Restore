@interface CNMonogramPosterConfigurationReader
+ (BOOL)canReadConfiguration;
+ (id)monogramPosterConfigurationDataFromUserInfo:(id)a3;
- (NSString)initials;
- (UIColor)backgroundColor;
- (_TtC10ContactsUI35CNMonogramPosterConfigurationReader)init;
- (_TtC10ContactsUI35CNMonogramPosterConfigurationReader)initWithPosterConfigurationUserInfo:(id)a3;
@end

@implementation CNMonogramPosterConfigurationReader

+ (BOOL)canReadConfiguration
{
  return 1;
}

- (UIColor)backgroundColor
{
  sub_18B64AE5C();
  v3 = self;
  sub_18B9841F8();
  v4 = (void *)sub_18B986338();

  return (UIColor *)v4;
}

- (NSString)initials
{
  v2 = self;
  sub_18B984208();
  v3 = (void *)sub_18B985E38();

  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (_TtC10ContactsUI35CNMonogramPosterConfigurationReader)initWithPosterConfigurationUserInfo:(id)a3
{
  uint64_t v3 = sub_18B985D78();
  return (_TtC10ContactsUI35CNMonogramPosterConfigurationReader *)CNMonogramPosterConfigurationReader.init(posterConfigurationUserInfo:)(v3);
}

+ (id)monogramPosterConfigurationDataFromUserInfo:(id)a3
{
  uint64_t v3 = sub_18B985D78();
  uint64_t v4 = sub_18B64B714(v3);
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  if (v6 >> 60 == 15)
  {
    v7 = 0;
  }
  else
  {
    v7 = (void *)sub_18B983BB8();
    sub_18B64B8DC(v4, v6);
  }

  return v7;
}

- (_TtC10ContactsUI35CNMonogramPosterConfigurationReader)init
{
  result = (_TtC10ContactsUI35CNMonogramPosterConfigurationReader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC10ContactsUI35CNMonogramPosterConfigurationReader_monogramPosterConfiguration;
  uint64_t v3 = sub_18B984218();
  uint64_t v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);

  v4(v2, v3);
}

@end