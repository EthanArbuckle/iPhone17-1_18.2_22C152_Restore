@interface HFMatterSnapshotContainer
+ (id)fetchCurrent;
+ (void)fetchCurrentWithCompletionHandler:(id)a3;
- (HFMatterSnapshotContainer)init;
@end

@implementation HFMatterSnapshotContainer

- (HFMatterSnapshotContainer)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___HFMatterSnapshotContainer_internalContainer) = 0;
  v3.receiver = self;
  v3.super_class = (Class)HFMatterSnapshotContainer;
  return [(HFMatterSnapshotContainer *)&v3 init];
}

+ (void)fetchCurrentWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AB2E3E0);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = a1;
  uint64_t v10 = sub_20BCE7870();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_2676AF510;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_2676AEEB8;
  v12[5] = v11;
  sub_20BAC5AB0((uint64_t)v7, (uint64_t)&unk_2676AEEC0, (uint64_t)v12);
  swift_release();
}

+ (id)fetchCurrent
{
  v2 = _sSo25HFMatterSnapshotContainerC4HomeE12fetchCurrentAByFZ_0();
  return v2;
}

- (void).cxx_destruct
{
}

@end