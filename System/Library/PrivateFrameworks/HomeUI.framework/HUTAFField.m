@interface HUTAFField
- (BOOL)required;
- (NSString)formKey;
- (NSString)label;
- (_TtC6HomeUI10HUTAFField)init;
- (id)init:(id)a3;
@end

@implementation HUTAFField

- (NSString)label
{
  return (NSString *)sub_1BE4D16E4();
}

- (NSString)formKey
{
  return (NSString *)sub_1BE4D16E4();
}

- (BOOL)required
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC6HomeUI10HUTAFField_required);
}

- (id)init:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  id v6 = a3;
  v7 = self;
  uint64_t v8 = sub_1BE9C2438();
  v9 = (uint64_t *)((char *)v7 + OBJC_IVAR____TtC6HomeUI10HUTAFField_label);
  uint64_t *v9 = v8;
  v9[1] = v10;
  uint64_t v11 = sub_1BE9C2448();
  v12 = (uint64_t *)((char *)v7 + OBJC_IVAR____TtC6HomeUI10HUTAFField_formKey);
  uint64_t *v12 = v11;
  v12[1] = v13;
  *((unsigned char *)&v7->super.isa + OBJC_IVAR____TtC6HomeUI10HUTAFField_required) = sub_1BE9C2458() & 1;

  v16.receiver = v7;
  v16.super_class = ObjectType;
  v14 = [(HUTAFField *)&v16 init];

  return v14;
}

- (_TtC6HomeUI10HUTAFField)init
{
  result = (_TtC6HomeUI10HUTAFField *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end