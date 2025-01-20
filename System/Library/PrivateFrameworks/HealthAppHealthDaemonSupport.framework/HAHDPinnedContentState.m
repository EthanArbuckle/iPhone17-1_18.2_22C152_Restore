@interface HAHDPinnedContentState
+ (BOOL)supportsSecureCoding;
- (HAHDPinnedContentState)init;
- (HAHDPinnedContentState)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HAHDPinnedContentState

- (HAHDPinnedContentState)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (HAHDPinnedContentState *)sub_250D70D38(v3);

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_250D71434(v4);
}

- (void).cxx_destruct
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAHDPinnedContentState)init
{
  result = (HAHDPinnedContentState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end