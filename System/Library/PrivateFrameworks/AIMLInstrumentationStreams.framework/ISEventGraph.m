@interface ISEventGraph
- (ISComponentGroup)asrBridge;
- (ISComponentGroup)nlxBridge;
- (ISComponentGroup)orchBridge;
- (ISComponentGroup)ueiBridge;
- (ISEventGraph)init;
- (NSDate)date;
- (NSSet)componentIdentifiersBridge;
- (double)timestamp;
- (id)getComponentGroupBridgeWithType:(Class)a3;
- (id)getComponentGroupBridgesWithType:(Class)a3;
- (id)sieventWithInnerType:(Class)a3;
- (id)sievents;
- (id)sieventsWithComponentIdentifier:(id)a3;
- (id)sieventsWithComponentName:(int)a3;
- (id)sieventsWithInnerType:(Class)a3;
- (id)sieventsWithType:(Class)a3;
@end

@implementation ISEventGraph

- (id)sievents
{
  v2 = self;
  EventGraph.sievents()();

  sub_22A766DE4(0, (unint64_t *)&qword_26837FE78);
  v3 = (void *)sub_22AEAA0E8();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)sieventsWithType:(Class)a3
{
  return sub_22A760AB0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))EventGraph.sievents(type:));
}

- (id)sieventsWithComponentName:(int)a3
{
  v4 = self;
  EventGraph.sievents(componentName:)(a3);

  sub_22A766DE4(0, (unint64_t *)&qword_26837FE78);
  v5 = (void *)sub_22AEAA0E8();
  swift_bridgeObjectRelease();
  return v5;
}

- (id)sieventsWithComponentIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self;
  EventGraph.sievents(componentIdentifier:)((uint64_t)v4);

  sub_22A766DE4(0, (unint64_t *)&qword_26837FE78);
  v6 = (void *)sub_22AEAA0E8();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)sieventsWithInnerType:(Class)a3
{
  return sub_22A760AB0(self, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))EventGraph.sievents(innerType:));
}

- (id)sieventWithInnerType:(Class)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  v5 = self;
  unint64_t v6 = sub_22A795980(ObjCClassMetadata);
  unint64_t v7 = v6;
  if (v6 >> 62)
  {
    id result = (id)sub_22AEAA6D8();
    if (result) {
      goto LABEL_3;
    }
LABEL_8:

    swift_bridgeObjectRelease();
    v10 = 0;
    goto LABEL_9;
  }
  id result = *(id *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (!result) {
    goto LABEL_8;
  }
LABEL_3:
  if ((v7 & 0xC000000000000001) != 0)
  {
    MEMORY[0x230F35410](0, v7);
  }
  else
  {
    if (!*(void *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v9 = *(id *)(v7 + 32);
  }
  swift_bridgeObjectRelease();
  sub_22A766DE4(0, (unint64_t *)&qword_26837FE78);
  v10 = (void *)sub_22AEAA348();

LABEL_9:
  return v10;
}

- (id)getComponentGroupBridgesWithType:(Class)a3
{
  uint64_t ObjCClassMetadata = swift_getObjCClassMetadata();
  v5 = self;
  EventGraph.getComponentGroupBridges(type:)(ObjCClassMetadata);

  type metadata accessor for ComponentGroupBridge();
  unint64_t v6 = (void *)sub_22AEAA0E8();
  swift_bridgeObjectRelease();
  return v6;
}

- (id)getComponentGroupBridgeWithType:(Class)a3
{
  id v4 = self;
  id v5 = [(ISEventGraph *)v4 getComponentGroupBridgesWithType:a3];
  type metadata accessor for ComponentGroupBridge();
  unint64_t v6 = sub_22AEAA0F8();

  if (v6 >> 62)
  {
    swift_bridgeObjectRetain();
    v8 = (void *)sub_22AEAA6D8();
    id result = (id)swift_bridgeObjectRelease();
    if (!v8) {
      goto LABEL_7;
    }
  }
  else
  {
    v8 = *(void **)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10);
    if (!v8) {
      goto LABEL_7;
    }
  }
  if ((v6 & 0xC000000000000001) != 0)
  {
    id v9 = (id)MEMORY[0x230F35410](0, v6);
  }
  else
  {
    if (!*(void *)((v6 & 0xFFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      return result;
    }
    id v9 = *(id *)(v6 + 32);
  }
  v8 = v9;
LABEL_7:

  swift_bridgeObjectRelease();
  return v8;
}

- (ISComponentGroup)ueiBridge
{
  return (ISComponentGroup *)sub_22A761310(self, (uint64_t)a2, (unint64_t *)&qword_26838BC30);
}

- (ISComponentGroup)orchBridge
{
  return (ISComponentGroup *)sub_22A761310(self, (uint64_t)a2, &qword_26837FE88);
}

- (ISComponentGroup)nlxBridge
{
  return (ISComponentGroup *)sub_22A761310(self, (uint64_t)a2, (unint64_t *)&qword_26837FE90);
}

- (ISComponentGroup)asrBridge
{
  return (ISComponentGroup *)sub_22A761310(self, (uint64_t)a2, &qword_26837FE98);
}

- (NSSet)componentIdentifiersBridge
{
  v2 = self;
  uint64_t v3 = sub_22A795894();
  unint64_t v4 = sub_22A760140(v3);
  swift_bridgeObjectRelease();
  sub_22AE7D354(v4);

  swift_bridgeObjectRelease();
  type metadata accessor for ComponentIdentifierBridge();
  sub_22A766E88(&qword_26837FF20, (void (*)(uint64_t))type metadata accessor for ComponentIdentifierBridge);
  id v5 = (void *)sub_22AEAA238();
  swift_bridgeObjectRelease();
  return (NSSet *)v5;
}

- (double)timestamp
{
  return *(double *)((char *)&self->super.isa + OBJC_IVAR___ISEventGraph_timestamp);
}

- (NSDate)date
{
  uint64_t v2 = sub_22AEA9328();
  uint64_t v3 = *(void *)(v2 - 8);
  MEMORY[0x270FA5388](v2, v4);
  unint64_t v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_22AEA9298();
  unint64_t v7 = (void *)sub_22AEA92C8();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  return (NSDate *)v7;
}

- (ISEventGraph)init
{
  id result = (ISEventGraph *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end