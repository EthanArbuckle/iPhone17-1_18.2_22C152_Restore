@interface AAEventProperty
- (AAEventProperty)init;
- (AAEventProperty)initWithDataType:(Class)a3 requirement:(int64_t)a4;
@end

@implementation AAEventProperty

- (AAEventProperty)initWithDataType:(Class)a3 requirement:(int64_t)a4
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AAEventProperty_dataType) = (Class)swift_getObjCClassMetadata();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AAEventProperty_requirement) = (Class)a4;
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  v7 = self;
  id v8 = objc_msgSend(ObjCClassFromMetadata, sel_dataName);
  uint64_t v9 = sub_1A916AF90();
  uint64_t v11 = v10;

  v12 = (uint64_t *)((char *)v7 + OBJC_IVAR___AAEventProperty_dataKey);
  uint64_t *v12 = v9;
  v12[1] = v11;

  v14.receiver = v7;
  v14.super_class = (Class)type metadata accessor for BridgedEventProperty();
  return [(AAEventProperty *)&v14 init];
}

- (AAEventProperty)init
{
  result = (AAEventProperty *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end