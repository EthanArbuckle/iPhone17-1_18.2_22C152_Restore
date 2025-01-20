@interface GameModeCCUIStatusBundleInfo
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (_TtC10GamePolicy28GameModeCCUIStatusBundleInfo)init;
- (_TtC10GamePolicy28GameModeCCUIStatusBundleInfo)initWithCoder:(id)a3;
- (_TtC10GamePolicy28GameModeCCUIStatusBundleInfo)initWithExecutableDisplayName:(id)a3 bundleIdentifier:(id)a4 isSystemService:(BOOL)a5 isAAAGame:(BOOL)a6 usedRecently:(BOOL)a7 state:(int64_t)a8;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GameModeCCUIStatusBundleInfo

+ (BOOL)supportsSecureCoding
{
  return static GameModeCCUIStatusBundleInfo.supportsSecureCoding;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  static GameModeCCUIStatusBundleInfo.supportsSecureCoding = a3;
}

- (_TtC10GamePolicy28GameModeCCUIStatusBundleInfo)initWithExecutableDisplayName:(id)a3 bundleIdentifier:(id)a4 isSystemService:(BOOL)a5 isAAAGame:(BOOL)a6 usedRecently:(BOOL)a7 state:(int64_t)a8
{
  uint64_t v13 = sub_24F93C978();
  uint64_t v15 = v14;
  uint64_t v16 = sub_24F93C978();
  v17 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_executableDisplayName);
  uint64_t *v17 = v13;
  v17[1] = v15;
  v18 = (uint64_t *)((char *)self + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_bundleIdentifier);
  uint64_t *v18 = v16;
  v18[1] = v19;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isSystemService) = a5;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_isAAAGame) = a6;
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_usedRecently) = a7;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10GamePolicy28GameModeCCUIStatusBundleInfo_state) = (Class)a8;
  v21.receiver = self;
  v21.super_class = (Class)type metadata accessor for GameModeCCUIStatusBundleInfo();
  return [(GameModeCCUIStatusBundleInfo *)&v21 init];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  GameModeCCUIStatusBundleInfo.encode(with:)((NSCoder)v4);
}

- (_TtC10GamePolicy28GameModeCCUIStatusBundleInfo)initWithCoder:(id)a3
{
  return (_TtC10GamePolicy28GameModeCCUIStatusBundleInfo *)GameModeCCUIStatusBundleInfo.init(coder:)(a3);
}

- (_TtC10GamePolicy28GameModeCCUIStatusBundleInfo)init
{
  result = (_TtC10GamePolicy28GameModeCCUIStatusBundleInfo *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end