@interface CPSystemCoordinatorConfiguration
+ (BOOL)supportsSecureCoding;
- (CPSystemCoordinatorConfiguration)init;
- (CPSystemCoordinatorConfiguration)initWithCoder:(id)a3;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPSystemCoordinatorConfiguration

- (NSString)description
{
  return (NSString *)@objc SystemCoordinatorConfiguration.description.getter(self, (uint64_t)a2, SystemCoordinatorConfiguration.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SystemCoordinatorConfiguration.encode(with:)((NSCoder)v4);
}

- (CPSystemCoordinatorConfiguration)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (CPSystemCoordinatorConfiguration *)specialized SystemCoordinatorConfiguration.init(coder:)(v3);

  return v4;
}

- (CPSystemCoordinatorConfiguration)init
{
  result = (CPSystemCoordinatorConfiguration *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end