@interface AARawEventProperty
- (AARawEventProperty)init;
- (AARawEventProperty)initWithDataName:(id)a3 requirement:(int64_t)a4;
@end

@implementation AARawEventProperty

- (AARawEventProperty)initWithDataName:(id)a3 requirement:(int64_t)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = sub_1A916AF90();
  v8 = (uint64_t *)((char *)self + OBJC_IVAR___AARawEventProperty_dataName);
  uint64_t *v8 = v7;
  v8[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawEventProperty_requirement) = (Class)a4;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return [(AARawEventProperty *)&v11 init];
}

- (AARawEventProperty)init
{
  result = (AARawEventProperty *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end