@interface FAFamilyFeatureFlag
+ (id)megadomeAdoption;
- (BOOL)isEnabled;
- (FAFamilyFeatureFlag)init;
- (FAFamilyFeatureFlag)initWithRawValue:(id)a3;
@end

@implementation FAFamilyFeatureFlag

+ (id)megadomeAdoption
{
  if (qword_1EA68E708 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EA68ED08;
  return v2;
}

- (FAFamilyFeatureFlag)initWithRawValue:(id)a3
{
  uint64_t v4 = sub_1D25AA9B0();
  v6 = v5;
  v7 = self;
  v8._countAndFlagsBits = v4;
  v8._object = v6;
  FamilyFeatureFlags.init(rawValue:)(v8);
  *((unsigned char *)&v7->super.isa + OBJC_IVAR___FAFamilyFeatureFlag_swiftVariant) = v11;

  v10.receiver = v7;
  v10.super_class = (Class)FAFamilyFeatureFlag;
  return [(FAFamilyFeatureFlag *)&v10 init];
}

- (BOOL)isEnabled
{
  v2 = self;
  char v3 = sub_1D256C5F0();

  return v3 & 1;
}

- (FAFamilyFeatureFlag)init
{
  result = (FAFamilyFeatureFlag *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end