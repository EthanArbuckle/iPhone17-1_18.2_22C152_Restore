@interface SandboxExtensionURL
+ (BOOL)supportsSecureCoding;
- (_TtC8Feedback19SandboxExtensionURL)init;
- (_TtC8Feedback19SandboxExtensionURL)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SandboxExtensionURL

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23CF5CC64(v4);
}

- (_TtC8Feedback19SandboxExtensionURL)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC8Feedback19SandboxExtensionURL *)sub_23CF5DEA8();

  return v4;
}

- (_TtC8Feedback19SandboxExtensionURL)init
{
  result = (_TtC8Feedback19SandboxExtensionURL *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC8Feedback19SandboxExtensionURL_url;
  uint64_t v3 = sub_23D003CE8();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);

  swift_bridgeObjectRelease();
}

@end