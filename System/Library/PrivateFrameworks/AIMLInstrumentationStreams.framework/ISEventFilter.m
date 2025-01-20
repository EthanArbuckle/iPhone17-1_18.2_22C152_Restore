@interface ISEventFilter
+ (ISEventFilter)everything;
+ (id)allOf:(Class)a3;
+ (id)someOf:(Class)a3 types:(id)a4;
- (ISEventFilter)init;
- (id)combine:(id)a3;
@end

@implementation ISEventFilter

- (ISEventFilter)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ISEventFilter_filter) = (Class)sub_22A77CA7C(MEMORY[0x263F8EE78]);
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for EventFilter();
  return [(ISEventFilter *)&v4 init];
}

+ (id)allOf:(Class)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837FFD8);
  uint64_t inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_22AEABF00;
  *(void *)(inited + 32) = ObjCClassMetadata;
  *(void *)(inited + 40) = 0;
  unint64_t v5 = sub_22A77CA7C((void *)inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_26837FFE0);
  swift_arrayDestroy();
  v6 = (objc_class *)type metadata accessor for EventFilter();
  v7 = (char *)objc_allocWithZone(v6);
  *(void *)&v7[OBJC_IVAR___ISEventFilter_filter] = v5;
  v10.receiver = v7;
  v10.super_class = v6;
  id v8 = objc_msgSendSuper2(&v10, sel_init);
  return v8;
}

+ (id)someOf:(Class)a3 types:(id)a4
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  __swift_instantiateConcreteTypeFromMangledName(&qword_268380A90);
  uint64_t v5 = sub_22AEAA0F8();
  id v6 = _s26AIMLInstrumentationStreams11EventFilterC4some2of5typesACSo25SISchemaTopLevelUnionTypeCm_SaySo0H22InstrumentationMessageCmGtFZ_0(ObjCClassMetadata, v5);
  swift_bridgeObjectRelease();
  return v6;
}

+ (ISEventFilter)everything
{
  v2 = (objc_class *)type metadata accessor for EventFilter();
  v3 = (char *)objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR___ISEventFilter_filter] = 0;
  v6.receiver = v3;
  v6.super_class = v2;
  id v4 = objc_msgSendSuper2(&v6, sel_init);
  return (ISEventFilter *)v4;
}

- (id)combine:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = _s26AIMLInstrumentationStreams11EventFilterC1poiyA2C_ACtFZ_0((uint64_t)v5, (uint64_t)v4);

  return v6;
}

- (void).cxx_destruct
{
}

@end