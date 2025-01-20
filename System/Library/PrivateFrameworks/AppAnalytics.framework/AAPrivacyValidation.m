@interface AAPrivacyValidation
+ (AAPrivacyValidation)default;
- (AAPrivacyValidation)init;
- (BOOL)enabled;
- (NSSet)denylistDescriptors;
- (id)withDenylistDescriptors:(id)a3;
- (id)withEnabled:(BOOL)a3;
@end

@implementation AAPrivacyValidation

+ (AAPrivacyValidation)default
{
  if (qword_1EB686F50 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1EB686F80;

  return (AAPrivacyValidation *)v2;
}

- (BOOL)enabled
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___AAPrivacyValidation_enabled);
}

- (NSSet)denylistDescriptors
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A916B2A0();
  swift_bridgeObjectRelease();

  return (NSSet *)v2;
}

- (id)withEnabled:(BOOL)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AAPrivacyValidation_denylistDescriptors);
  v7 = objc_allocWithZone(ObjectType);
  v7[OBJC_IVAR___AAPrivacyValidation_enabled] = a3;
  *(void *)&v7[OBJC_IVAR___AAPrivacyValidation_denylistDescriptors] = v6;
  v10.receiver = v7;
  v10.super_class = ObjectType;
  swift_bridgeObjectRetain();
  v8 = [(AAPrivacyValidation *)&v10 init];

  return v8;
}

- (id)withDenylistDescriptors:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v5 = sub_1A916B2B0();
  LOBYTE(self) = *((unsigned char *)&self->super.isa + OBJC_IVAR___AAPrivacyValidation_enabled);
  uint64_t v6 = objc_allocWithZone(ObjectType);
  v6[OBJC_IVAR___AAPrivacyValidation_enabled] = (_BYTE)self;
  *(void *)&v6[OBJC_IVAR___AAPrivacyValidation_denylistDescriptors] = v5;
  v9.receiver = v6;
  v9.super_class = ObjectType;
  v7 = [(AAPrivacyValidation *)&v9 init];

  return v7;
}

- (AAPrivacyValidation)init
{
  result = (AAPrivacyValidation *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end