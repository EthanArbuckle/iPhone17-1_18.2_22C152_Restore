@interface AARawEvent
- (AARawEvent)init;
- (AARawEvent)initWithName:(id)a3 properties:(id)a4;
- (AARawEvent)initWithName:(id)a3 sessionGroup:(id)a4 requiresDiagnosticsConsent:(BOOL)a5 timestampGranularity:(int64_t)a6 timeDurationGranularity:(int64_t)a7 properties:(id)a8;
- (AARawEvent)initWithName:(id)a3 sessionGroup:(id)a4 timestampGranularity:(int64_t)a5 properties:(id)a6;
@end

@implementation AARawEvent

- (AARawEvent)initWithName:(id)a3 properties:(id)a4
{
  uint64_t v4 = sub_1A916AF90();
  uint64_t v6 = v5;
  type metadata accessor for BridgedRawEventProperty();
  uint64_t v7 = sub_1A916AED0();
  return (AARawEvent *)BridgedRawEvent.init(name:properties:)(v4, v6, v7);
}

- (AARawEvent)initWithName:(id)a3 sessionGroup:(id)a4 timestampGranularity:(int64_t)a5 properties:(id)a6
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v10 = sub_1A916AF90();
  uint64_t v12 = v11;
  type metadata accessor for BridgedRawEventProperty();
  v13 = (objc_class *)sub_1A916AED0();
  v14 = (uint64_t *)((char *)self + OBJC_IVAR___AARawEvent_name);
  uint64_t *v14 = v10;
  v14[1] = v12;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawEvent_properties) = v13;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawEvent_sessionGroup) = (Class)a4;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___AARawEvent_requiresDiagnosticsConsent) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawEvent_timestampGranularity) = (Class)a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawEvent_timeDurationGranularity) = 0;
  v17.receiver = self;
  v17.super_class = ObjectType;
  id v15 = a4;
  return [(AARawEvent *)&v17 init];
}

- (AARawEvent)initWithName:(id)a3 sessionGroup:(id)a4 requiresDiagnosticsConsent:(BOOL)a5 timestampGranularity:(int64_t)a6 timeDurationGranularity:(int64_t)a7 properties:(id)a8
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v14 = sub_1A916AF90();
  uint64_t v16 = v15;
  type metadata accessor for BridgedRawEventProperty();
  objc_super v17 = (objc_class *)sub_1A916AED0();
  v18 = (uint64_t *)((char *)self + OBJC_IVAR___AARawEvent_name);
  uint64_t *v18 = v14;
  v18[1] = v16;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawEvent_properties) = v17;
  *((unsigned char *)&self->super.isa + OBJC_IVAR___AARawEvent_requiresDiagnosticsConsent) = a5;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawEvent_sessionGroup) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawEvent_timestampGranularity) = (Class)a6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___AARawEvent_timeDurationGranularity) = (Class)a7;
  v21.receiver = self;
  v21.super_class = ObjectType;
  id v19 = a4;
  return [(AARawEvent *)&v21 init];
}

- (AARawEvent)init
{
  result = (AARawEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end