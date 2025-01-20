@interface TrackingStand
+ (BOOL)supportsSecureCoding;
- (BOOL)returnToBase;
- (BOOL)searchWithCalibrate:(BOOL)a3;
- (BOOL)stopReturnToBase;
- (BOOL)stopSearchWithCalibrate:(BOOL)a3;
- (_TtC11DockKitCore13TrackingStand)initWithCoder:(id)a3;
- (_TtC11DockKitCore13TrackingStand)initWithInfo:(id)a3 systems:(id)a4;
- (id)dumpStateWithDirectory:(id)a3;
- (id)getDiagnostics;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)flip180WithClockwise:(BOOL)a3 completionHandler:(id)a4;
- (void)startTrackingWithCompletionHandler:(id)a3;
- (void)stopTracking;
- (void)trackObservationsWithMetadata:(_TtC11DockKitCore16FollowerMetadata *)a3 image:(CIImage *)a4 completionHandler:(id)a5;
@end

@implementation TrackingStand

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_TtC11DockKitCore13TrackingStand)initWithInfo:(id)a3 systems:(id)a4
{
  type metadata accessor for System();
  uint64_t v5 = sub_24CF3B470();
  return (_TtC11DockKitCore13TrackingStand *)TrackingStand.init(info:systems:)(a3, v5);
}

- (void)dealloc
{
  v2 = self;
  TrackingStand.__deallocating_deinit();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.isa
                     + OBJC_IVAR____TtC11DockKitCore13TrackingStand__trackingButtonSemaphore));
  swift_release();
  swift_unknownObjectRelease();

  swift_release();
  swift_release();
  swift_release();

  v3 = (char *)self + OBJC_IVAR____TtC11DockKitCore13TrackingStand_timeElapsedSinceStartup;
  uint64_t v4 = sub_24CF3A960();
  uint64_t v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  v6 = (char *)self + OBJC_IVAR____TtC11DockKitCore13TrackingStand__intelligentTracking;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26983ADA8);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  swift_release();
  v5((char *)self + OBJC_IVAR____TtC11DockKitCore13TrackingStand_lastSummaryPrintTime, v4);
  swift_release();
  swift_release();
  sub_24CEBCF5C(*(id *)((char *)&self->super.super.isa
                      + OBJC_IVAR____TtC11DockKitCore13TrackingStand____lazy_storage___trackingSensor));
  v8 = (char *)self + OBJC_IVAR____TtC11DockKitCore13TrackingStand__selectedFaceIDs;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26983AE08);
  v10 = *(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8);
  v10(v8, v9);
  v10((char *)self + OBJC_IVAR____TtC11DockKitCore13TrackingStand__selectedBodyIDs, v9);
  swift_release();
  swift_release();
  sub_24CEBA7C0(*(void **)((char *)&self->super.super.isa + OBJC_IVAR____TtC11DockKitCore13TrackingStand_currentObservation), *(void **)&self->super._xpcConnection[OBJC_IVAR____TtC11DockKitCore13TrackingStand_currentObservation]);
  swift_release();
  swift_release();
  v11 = (char *)self + OBJC_IVAR____TtC11DockKitCore13TrackingStand__lastLatency;
  uint64_t v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26983B620);
  v13 = *(void (**)(char *, uint64_t))(*(void *)(v12 - 8) + 8);
  v13(v11, v12);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_24CE79674(v4);
}

- (_TtC11DockKitCore13TrackingStand)initWithCoder:(id)a3
{
  return (_TtC11DockKitCore13TrackingStand *)TrackingStand.init(coder:)(a3);
}

- (void)startTrackingWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v5 - 8);
  uint64_t v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26983B8B8;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26983B8C0;
  v12[5] = v11;
  v13 = self;
  sub_24CF244A8((uint64_t)v7, (uint64_t)&unk_26983B8C8, (uint64_t)v12);
  swift_release();
}

- (void)stopTracking
{
  v2 = self;
  sub_24CEAC258();
}

- (void)trackObservationsWithMetadata:(_TtC11DockKitCore16FollowerMetadata *)a3 image:(CIImage *)a4 completionHandler:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26983B898;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26983B8A0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_24CF244A8((uint64_t)v11, (uint64_t)&unk_26983B8A8, (uint64_t)v16);
  swift_release();
}

- (id)getDiagnostics
{
  v2 = self;
  swift_retain();
  v3 = (void *)sub_24CF2921C();

  swift_release();
  return v3;
}

- (id)dumpStateWithDirectory:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26983ADA8);
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  v8 = (char *)v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_26983B888);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)v16 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_24CF3A830();
    uint64_t v12 = sub_24CF3A840();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v11, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_24CF3A840();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v11, 1, 1, v13);
  }
  (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, (char *)self + OBJC_IVAR____TtC11DockKitCore13TrackingStand__intelligentTracking, v5);
  uint64_t v14 = self;
  sub_24CF3AD60();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  if (v16[1])
  {
    sub_24CF3AC90();

    swift_release();
  }
  else
  {
  }
  sub_24CE3C198((uint64_t)v11, &qword_26983B888);
  return 0;
}

- (BOOL)searchWithCalibrate:(BOOL)a3
{
  v3 = self;
  BOOL v4 = sub_24CEBB9A8((uint64_t)&unk_26FF45580, (uint64_t)&unk_26983ADB8);

  return v4;
}

- (BOOL)stopSearchWithCalibrate:(BOOL)a3
{
  v3 = self;
  BOOL v4 = sub_24CEBB9A8((uint64_t)&unk_26FF45558, (uint64_t)&unk_26983ADB0);

  return v4;
}

- (BOOL)returnToBase
{
  v2 = self;
  BOOL v3 = sub_24CEB90E8();

  return v3;
}

- (BOOL)stopReturnToBase
{
  v2 = self;
  BOOL v3 = sub_24CEB91E4();

  return v3;
}

- (void)flip180WithClockwise:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26B1826F0);
  MEMORY[0x270FA5388](v7 - 8);
  uint64_t v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(unsigned char *)(v11 + 16) = a3;
  *(void *)(v11 + 24) = v10;
  *(void *)(v11 + 32) = self;
  uint64_t v12 = sub_24CF3B520();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  uint64_t v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_26983B870;
  v13[5] = v11;
  uint64_t v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_26983BBD0;
  v14[5] = v13;
  v15 = self;
  sub_24CF244A8((uint64_t)v9, (uint64_t)&unk_26983B880, (uint64_t)v14);
  swift_release();
}

@end