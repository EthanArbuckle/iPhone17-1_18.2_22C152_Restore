@interface GPImageFormat
+ (BOOL)supportsSecureCoding;
- (GPImageFormat)init;
- (GPImageFormat)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation GPImageFormat

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  ImageFormat.encode(with:)((NSCoder)v4);
}

- (GPImageFormat)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (GPImageFormat *)sub_243F0F2DC(v3);

  return v4;
}

- (GPImageFormat)init
{
  result = (GPImageFormat *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end