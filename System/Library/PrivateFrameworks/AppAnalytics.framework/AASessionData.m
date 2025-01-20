@interface AASessionData
- (AASessionData)init;
- (AASessionData)initWithKey:(id)a3 data:(id)a4;
@end

@implementation AASessionData

- (AASessionData)initWithKey:(id)a3 data:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v7 = sub_1A916AF90();
  v8 = (uint64_t *)((char *)self + OBJC_IVAR___AASessionData_key);
  uint64_t *v8 = v7;
  v8[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AASessionData_data) = (Class)a4;
  v11.receiver = self;
  v11.super_class = ObjectType;
  swift_unknownObjectRetain();
  return [(AASessionData *)&v11 init];
}

- (AASessionData)init
{
  result = (AASessionData *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
}

@end