@interface HGMLConfigurationInternal
+ (HGMLConfigurationInternal)defaultEmptyMLConfiguration;
+ (HGMLConfigurationInternal)defaultMLConfiguration;
+ (HGMLConfigurationInternal)defaultTestMLConfiguration;
- (HGMLConfigurationInternal)init;
@end

@implementation HGMLConfigurationInternal

+ (HGMLConfigurationInternal)defaultMLConfiguration
{
  return (HGMLConfigurationInternal *)sub_250BE19A4((uint64_t)a1, (uint64_t)a2, &qword_269AF8F50, (void **)&qword_269AF91D8);
}

+ (HGMLConfigurationInternal)defaultEmptyMLConfiguration
{
  return (HGMLConfigurationInternal *)sub_250BE19A4((uint64_t)a1, (uint64_t)a2, &qword_269AF8F58, (void **)&qword_269AF91E0);
}

+ (HGMLConfigurationInternal)defaultTestMLConfiguration
{
  return (HGMLConfigurationInternal *)sub_250BE19A4((uint64_t)a1, (uint64_t)a2, &qword_269AF8F60, (void **)&qword_269AF91E8);
}

- (HGMLConfigurationInternal)init
{
  result = (HGMLConfigurationInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end