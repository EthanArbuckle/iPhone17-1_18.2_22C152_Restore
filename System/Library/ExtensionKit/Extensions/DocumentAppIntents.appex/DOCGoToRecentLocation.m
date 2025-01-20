@interface DOCGoToRecentLocation
+ (BOOL)supportsSecureCoding;
- (DOCGoToRecentLocation)init;
- (DOCGoToRecentLocation)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation DOCGoToRecentLocation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (DOCGoToRecentLocation)initWithCoder:(id)a3
{
  return (DOCGoToRecentLocation *)sub_1003EED80(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1003EF594(v4);
}

- (DOCGoToRecentLocation)init
{
  result = (DOCGoToRecentLocation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
}

@end