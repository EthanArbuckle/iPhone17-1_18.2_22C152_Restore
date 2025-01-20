@interface HREMatterCommandActionMap
+ (id)emptyMap;
- (HREMatterCommandActionMap)init;
- (HREMatterCommandActionMap)initWithCommands:(id)a3;
- (HREMatterCommandActionMap)initWithCondition:(id)a3 childMaps:(id)a4;
- (id)commandsForAccessory:(id)a3 withSnapshotContainer:(id)a4;
@end

@implementation HREMatterCommandActionMap

- (HREMatterCommandActionMap)initWithCommands:(id)a3
{
  type metadata accessor for MatterCommandMap();
  unint64_t v3 = sub_237B92880();
  return (HREMatterCommandActionMap *)MatterCommandActionMap.init(rawCommands:)(v3);
}

+ (id)emptyMap
{
  v2 = (objc_class *)type metadata accessor for MatterCommandActionMap();
  unint64_t v3 = objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR___HREMatterCommandActionMap_commandTemplates] = MEMORY[0x263F8EE78];
  v3[OBJC_IVAR___HREMatterCommandActionMap_enforceExecutionOrder] = 0;
  v6.receiver = v3;
  v6.super_class = v2;
  id v4 = objc_msgSendSuper2(&v6, sel_initWithCondition_childMaps_, 0, 0);

  return v4;
}

- (id)commandsForAccessory:(id)a3 withSnapshotContainer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  uint64_t v9 = sub_237B6F348((uint64_t)v6);

  if (v9)
  {
    sub_237B7057C(0, &qword_268943FF0);
    v10 = (void *)sub_237B92870();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (HREMatterCommandActionMap)initWithCondition:(id)a3 childMaps:(id)a4
{
  id v4 = a3;
  result = (HREMatterCommandActionMap *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (HREMatterCommandActionMap)init
{
  result = (HREMatterCommandActionMap *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end