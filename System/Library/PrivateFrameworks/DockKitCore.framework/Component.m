@interface Component
+ (BOOL)supportsSecureCoding;
- (_TtC11DockKitCore9Component)init;
- (_TtC11DockKitCore9Component)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation Component

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_24CEBECAC(v4);
}

- (_TtC11DockKitCore9Component)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC11DockKitCore9Component *)sub_24CEBFE04();

  return v4;
}

- (_TtC11DockKitCore9Component)init
{
  result = (_TtC11DockKitCore9Component *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end