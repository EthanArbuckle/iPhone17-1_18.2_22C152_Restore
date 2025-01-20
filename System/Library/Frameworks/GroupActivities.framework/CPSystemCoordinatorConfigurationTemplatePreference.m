@interface CPSystemCoordinatorConfigurationTemplatePreference
+ (BOOL)supportsSecureCoding;
- (CPSystemCoordinatorConfigurationTemplatePreference)init;
- (CPSystemCoordinatorConfigurationTemplatePreference)initWithCoder:(id)a3;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CPSystemCoordinatorConfigurationTemplatePreference

- (NSString)description
{
  return (NSString *)@objc SystemCoordinatorConfiguration.description.getter(self, (uint64_t)a2, SystemCoordinatorConfiguration._SpatialTemplatePreference.description.getter);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  SystemCoordinatorConfiguration._SpatialTemplatePreference.encode(with:)((NSCoder)v4);
}

- (CPSystemCoordinatorConfigurationTemplatePreference)initWithCoder:(id)a3
{
  id v3 = a3;
  id v4 = (CPSystemCoordinatorConfigurationTemplatePreference *)specialized SystemCoordinatorConfiguration._SpatialTemplatePreference.init(coder:)(v3);

  return v4;
}

- (CPSystemCoordinatorConfigurationTemplatePreference)init
{
  result = (CPSystemCoordinatorConfigurationTemplatePreference *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end