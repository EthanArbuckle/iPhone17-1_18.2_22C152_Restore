@interface AAPrivacyValidationProvider
- (AAPrivacyValidation)privacyValidation;
- (AAPrivacyValidationProvider)init;
- (AAPrivacyValidationProvider)initWithPrivacyValidation:(id)a3;
- (void)setPrivacyValidation:(id)a3;
@end

@implementation AAPrivacyValidationProvider

- (AAPrivacyValidation)privacyValidation
{
  v2 = (id *)((char *)&self->super.isa + OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation);
  swift_beginAccess();
  return (AAPrivacyValidation *)*v2;
}

- (void)setPrivacyValidation:(id)a3
{
  v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation);
  swift_beginAccess();
  v5 = *v4;
  *v4 = a3;
  id v6 = a3;
}

- (AAPrivacyValidationProvider)initWithPrivacyValidation:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AAPrivacyValidationProvider_bridgedPrivacyValidation) = (Class)a3;
  v8.receiver = self;
  v8.super_class = ObjectType;
  id v6 = a3;
  return [(AAPrivacyValidationProvider *)&v8 init];
}

- (AAPrivacyValidationProvider)init
{
  result = (AAPrivacyValidationProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end