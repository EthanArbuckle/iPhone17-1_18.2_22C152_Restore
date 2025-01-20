@interface ToolboxXPCServiceServer.Server
- (_TtCC23IntelligenceFlowRuntime23ToolboxXPCServiceServer6Server)init;
- (void)baseRelativeURLWithPlannerType:(id)a3 with:(id)a4;
- (void)countWithPlannerType:(id)a3 toolType:(id)a4 clientIdentifier:(id)a5 with:(id)a6;
- (void)listToolsWithPlannerType:(id)a3 toolType:(id)a4 clientIdentifier:(id)a5 with:(id)a6;
- (void)metadataWithPlannerType:(id)a3 enableAllowList:(BOOL)a4 with:(id)a5;
- (void)populateWithPlannerType:(id)a3 with:(id)a4;
- (void)queryWithPlannerType:(id)a3 query:(id)a4 bundleIDs:(id)a5 with:(id)a6;
- (void)queryWithPlannerType:(id)a3 query:(id)a4 k:(int64_t)a5 clientIdentifier:(id)a6 availableClientActions:(id)a7 with:(id)a8;
- (void)queryWithPlannerType:(id)a3 query:(id)a4 toolIDs:(id)a5 with:(id)a6;
- (void)readinessWithPlannerType:(id)a3 with:(id)a4;
- (void)sandboxWithInjectionId:(id)a3 plannerType:(id)a4 with:(id)a5;
- (void)toolMappingWithPlannerType:(id)a3 customKey:(id)a4 with:(id)a5;
@end

@implementation ToolboxXPCServiceServer.Server

- (void)readinessWithPlannerType:(id)a3 with:(id)a4
{
}

- (void)populateWithPlannerType:(id)a3 with:(id)a4
{
}

- (void)baseRelativeURLWithPlannerType:(id)a3 with:(id)a4
{
}

- (void)queryWithPlannerType:(id)a3 query:(id)a4 k:(int64_t)a5 clientIdentifier:(id)a6 availableClientActions:(id)a7 with:(id)a8
{
  v10 = _Block_copy(a8);
  uint64_t v11 = sub_253DF5270();
  uint64_t v13 = v12;
  uint64_t v14 = sub_253DF5270();
  uint64_t v16 = v15;
  if (a6)
  {
    uint64_t v17 = sub_253DF5270();
    a6 = v18;
  }
  else
  {
    uint64_t v17 = 0;
  }
  uint64_t v19 = sub_253DF5680();
  uint64_t v20 = swift_allocObject();
  *(void *)(v20 + 16) = v10;
  v21 = self;
  sub_253DE1504(v11, v13, v14, v16, a5, v17, (uint64_t)a6, v19, (uint64_t)sub_253DEBCC8, v20, v22, a5, v24, v25, v26, v27, v28, v29, v30,
    v31,
    v32,
    v33);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();

  swift_bridgeObjectRelease();
}

- (void)queryWithPlannerType:(id)a3 query:(id)a4 bundleIDs:(id)a5 with:(id)a6
{
  v7 = _Block_copy(a6);
  sub_253DF5270();
  sub_253DF5270();
  sub_253DF53A0();
  *(void *)(swift_allocObject() + 16) = v7;
  v8 = self;
  sub_253DE3CD0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)queryWithPlannerType:(id)a3 query:(id)a4 toolIDs:(id)a5 with:(id)a6
{
  v7 = _Block_copy(a6);
  sub_253DF5270();
  sub_253DF5270();
  sub_253DF53A0();
  *(void *)(swift_allocObject() + 16) = v7;
  v8 = self;
  sub_253DE3CD0();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)sandboxWithInjectionId:(id)a3 plannerType:(id)a4 with:(id)a5
{
  v6 = _Block_copy(a5);
  sub_253DF5270();
  sub_253DF5270();
  *(void *)(swift_allocObject() + 16) = v6;
  v7 = self;
  sub_253DE4934();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)countWithPlannerType:(id)a3 toolType:(id)a4 clientIdentifier:(id)a5 with:(id)a6
{
}

- (void)toolMappingWithPlannerType:(id)a3 customKey:(id)a4 with:(id)a5
{
  v6 = _Block_copy(a5);
  sub_253DF5270();
  sub_253DF5270();
  *(void *)(swift_allocObject() + 16) = v6;
  v7 = self;
  sub_253DE68E4();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)listToolsWithPlannerType:(id)a3 toolType:(id)a4 clientIdentifier:(id)a5 with:(id)a6
{
}

- (void)metadataWithPlannerType:(id)a3 enableAllowList:(BOOL)a4 with:(id)a5
{
  v6 = _Block_copy(a5);
  sub_253DF5270();
  *(void *)(swift_allocObject() + 16) = v6;
  v7 = self;
  sub_253DE8B30();

  swift_bridgeObjectRelease();

  swift_release();
}

- (_TtCC23IntelligenceFlowRuntime23ToolboxXPCServiceServer6Server)init
{
}

- (void).cxx_destruct
{
}

@end