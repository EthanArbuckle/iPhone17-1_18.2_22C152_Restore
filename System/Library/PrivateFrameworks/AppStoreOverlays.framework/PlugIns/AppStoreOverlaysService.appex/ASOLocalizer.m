@interface ASOLocalizer
+ (id)defaultLocalizer;
- (ASOLocalizer)init;
- (ASOLocalizer)initWithBundles:(id)a3 languageCodes:(id)a4;
- (id)stringForKey:(id)a3;
@end

@implementation ASOLocalizer

- (ASOLocalizer)initWithBundles:(id)a3 languageCodes:(id)a4
{
  sub_1000109D8();
  unint64_t v4 = sub_100018970();
  uint64_t v5 = sub_100018970();
  return (ASOLocalizer *)sub_10000FF9C(v4, v5);
}

+ (id)defaultLocalizer
{
  sub_10000EA20(&qword_10002C520);
  unint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_10001C9F0;
  *(void *)(inited + 32) = [self mainBundle];
  sub_100018980();
  uint64_t v3 = sub_10000FDEC();
  id v4 = objc_allocWithZone((Class)type metadata accessor for Localizer());
  uint64_t v5 = sub_10000FF9C(inited, v3);

  return v5;
}

- (id)stringForKey:(id)a3
{
  uint64_t v4 = sub_100018930();
  v6 = v5;
  v7 = self;
  sub_100010320(v4, v6);

  swift_bridgeObjectRelease();
  NSString v8 = sub_100018900();
  swift_bridgeObjectRelease();

  return v8;
}

- (ASOLocalizer)init
{
  result = (ASOLocalizer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___ASOLocalizer_locale;
  uint64_t v4 = sub_1000185C0();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end