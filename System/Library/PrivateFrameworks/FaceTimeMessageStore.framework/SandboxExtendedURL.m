@interface SandboxExtendedURL
+ (BOOL)supportsSecureCoding;
- (NSString)description;
- (_TtC20FaceTimeMessageStore18SandboxExtendedURL)init;
- (_TtC20FaceTimeMessageStore18SandboxExtendedURL)initWithCoder:(id)a3;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SandboxExtendedURL

- (void)dealloc
{
  v2 = self;
  SandboxExtendedURL.__deallocating_deinit();
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC20FaceTimeMessageStore18SandboxExtendedURL_sandboxExtensionToken);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC20FaceTimeMessageStore18SandboxExtendedURL)initWithCoder:(id)a3
{
  return (_TtC20FaceTimeMessageStore18SandboxExtendedURL *)SandboxExtendedURL.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24DE6FD8C(v4);
}

- (NSString)description
{
  v2 = self;
  sub_24DE70D84();

  v3 = (void *)sub_24DF1ECA0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (_TtC20FaceTimeMessageStore18SandboxExtendedURL)init
{
}

@end