@interface DeveloperModeServiceXPCBridge
- (_TtC20AttributionKitDaemon29DeveloperModeServiceXPCBridge)init;
- (void)getDeveloperModeEnabledWithReply:(id)a3;
- (void)setDeveloperModeEnabled:(BOOL)a3 reply:(id)a4;
@end

@implementation DeveloperModeServiceXPCBridge

- (void)getDeveloperModeEnabledWithReply:(id)a3
{
  uint64_t v5 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  v10 = (char *)self + OBJC_IVAR____TtC20AttributionKitDaemon29DeveloperModeServiceXPCBridge_service;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v7, 1, 1, v11);
  v12 = self;
  sub_100142878("Get Developer Mode Enabled", (unint64_t *)0x1A, 2, (void (*)(void))sub_100147474, v9, (uint64_t)v10, (uint64_t)v7, (uint64_t)&unk_1001E4B20, 0, (uint64_t)&unk_1001CCD78, (uint64_t)&unk_1001E4B30, &qword_1001E4B48, &qword_1001E4B50);
  sub_100019960((uint64_t)v7, &qword_1001E0EC0);

  swift_release();
}

- (void)setDeveloperModeEnabled:(BOOL)a3 reply:(id)a4
{
  uint64_t v7 = sub_100012960(&qword_1001E0EC0);
  __chkstk_darwin(v7 - 8);
  uint64_t v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = v10;
  v12 = (char *)self + OBJC_IVAR____TtC20AttributionKitDaemon29DeveloperModeServiceXPCBridge_service;
  uint64_t v13 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  uint64_t v14 = swift_allocObject();
  *(unsigned char *)(v14 + 16) = a3;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = &unk_1001E4AB8;
  *(void *)(v15 + 24) = v14;
  v16 = self;
  swift_retain();
  swift_retain();
  sub_100142878("Set Developer Mode Enabled", (unint64_t *)0x1A, 2, (void (*)(void))sub_100147474, v11, (uint64_t)v12, (uint64_t)v9, (uint64_t)&unk_1001E4AC8, v15, (uint64_t)&unk_1001CCD28, (uint64_t)&unk_1001E4AD8, &qword_1001E4B10, &qword_1001E4B18);
  swift_release();
  swift_release();
  swift_release();
  sub_100019960((uint64_t)v9, &qword_1001E0EC0);

  swift_release();
}

- (_TtC20AttributionKitDaemon29DeveloperModeServiceXPCBridge)init
{
  result = (_TtC20AttributionKitDaemon29DeveloperModeServiceXPCBridge *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end