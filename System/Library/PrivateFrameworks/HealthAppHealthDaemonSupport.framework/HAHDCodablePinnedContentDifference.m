@interface HAHDCodablePinnedContentDifference
+ (BOOL)supportsSecureCoding;
- (HAHDCodablePinnedContentDifference)init;
- (HAHDCodablePinnedContentDifference)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HAHDCodablePinnedContentDifference

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_250D7C440(v4);
}

- (HAHDCodablePinnedContentDifference)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (HAHDCodablePinnedContentDifference *)sub_250D7C884(v3);

  return v4;
}

- (HAHDCodablePinnedContentDifference)init
{
  result = (HAHDCodablePinnedContentDifference *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end