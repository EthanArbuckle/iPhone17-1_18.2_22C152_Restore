@interface CameraLimit
+ (BOOL)supportsSecureCoding;
- (_TtC11DockKitCore11CameraLimit)init;
- (_TtC11DockKitCore11CameraLimit)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CameraLimit

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  CameraLimit.encode(with:)((NSCoder)v4);
}

- (_TtC11DockKitCore11CameraLimit)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (_TtC11DockKitCore11CameraLimit *)sub_24CE3CDBC();

  return v4;
}

- (_TtC11DockKitCore11CameraLimit)init
{
  result = (_TtC11DockKitCore11CameraLimit *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end