@interface AARawDataEvent
+ (NSString)dataName;
- (AARawDataEvent)init;
- (AARawDataEvent)initWithName:(id)a3 dictionary:(id)a4;
- (AARawDataEvent)initWithName:(id)a3 dictionary:(id)a4 requiresDiagnosticsConsent:(BOOL)a5;
- (id)toDict;
@end

@implementation AARawDataEvent

- (AARawDataEvent)initWithName:(id)a3 dictionary:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_1A916AF90();
  uint64_t v8 = v7;
  v9 = (objc_class *)sub_1A916AED0();
  v10 = (uint64_t *)((char *)self + OBJC_IVAR___AARawDataEvent_name);
  uint64_t *v10 = v6;
  v10[1] = v8;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawDataEvent_dictionary) = v9;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___AARawDataEvent_requiresDiagnosticsConsent) = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return [(AARawDataEvent *)&v12 init];
}

- (AARawDataEvent)initWithName:(id)a3 dictionary:(id)a4 requiresDiagnosticsConsent:(BOOL)a5
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v8 = sub_1A916AF90();
  uint64_t v10 = v9;
  v11 = (objc_class *)sub_1A916AED0();
  objc_super v12 = (uint64_t *)((char *)self + OBJC_IVAR___AARawDataEvent_name);
  *objc_super v12 = v8;
  v12[1] = v10;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawDataEvent_dictionary) = v11;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___AARawDataEvent_requiresDiagnosticsConsent) = a5;
  v14.receiver = self;
  v14.super_class = ObjectType;
  return [(AARawDataEvent *)&v14 init];
}

+ (NSString)dataName
{
  result = (NSString *)sub_1A916B7C0();
  __break(1u);
  return result;
}

- (id)toDict
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1A916AEB0();
  swift_bridgeObjectRelease();

  return v2;
}

- (AARawDataEvent)init
{
  result = (AARawDataEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end