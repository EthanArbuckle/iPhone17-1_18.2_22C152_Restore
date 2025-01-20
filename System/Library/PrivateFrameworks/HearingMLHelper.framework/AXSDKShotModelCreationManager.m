@interface AXSDKShotModelCreationManager
- (AXSDKShotModelCreationManager)init;
- (id)trainWithDetectorID:(id)a3 hallucinatorPath:(id)a4 pretrainedWeightsPath:(id)a5 error:(id *)a6;
@end

@implementation AXSDKShotModelCreationManager

- (AXSDKShotModelCreationManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)AXSDKShotModelCreationManager;
  return [(AXSDKShotModelCreationManager *)&v3 init];
}

- (id)trainWithDetectorID:(id)a3 hallucinatorPath:(id)a4 pretrainedWeightsPath:(id)a5 error:(id *)a6
{
  v24[0] = a6;
  uint64_t v7 = sub_22504EFA0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v9 = MEMORY[0x270FA5388](v7);
  v11 = (char *)v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = MEMORY[0x270FA5388](v9);
  v14 = (char *)v24 - v13;
  MEMORY[0x270FA5388](v12);
  v16 = (char *)v24 - v15;
  uint64_t v17 = sub_22504F010();
  uint64_t v19 = v18;
  sub_22504EF90();
  sub_22504EF90();
  v20 = self;
  sub_22504D980(v17, v19, (uint64_t)v14, (uint64_t)v11, (uint64_t)v16);

  swift_bridgeObjectRelease();
  v21 = *(void (**)(char *, uint64_t))(v8 + 8);
  v21(v11, v7);
  v21(v14, v7);
  v22 = (void *)sub_22504EF80();
  v21(v16, v7);
  return v22;
}

@end