@interface CloudDeviceObserver
- (BOOL)isReadyToProcessChanges;
- (_TtC23ActivitySharingServices19CloudDeviceObserver)init;
- (void)cloudKitManager:(id)a3 didEndUpdatesForFetchWithType:(int64_t)a4 activity:(id)a5 cloudKitGroup:(id)a6 changesProcessedHandler:(id)a7;
- (void)cloudKitManager:(id)a3 didReceiveNewCloudDevices:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6;
@end

@implementation CloudDeviceObserver

- (_TtC23ActivitySharingServices19CloudDeviceObserver)init
{
  result = (_TtC23ActivitySharingServices19CloudDeviceObserver *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC23ActivitySharingServices19CloudDeviceObserver_cloudDeviceSystem);
  v3 = (char *)self + OBJC_IVAR____TtC23ActivitySharingServices19CloudDeviceObserver_cloudKitCoordinator;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (BOOL)isReadyToProcessChanges
{
  return 1;
}

- (void)cloudKitManager:(id)a3 didReceiveNewCloudDevices:(id)a4 moreComing:(BOOL)a5 changesProcessedHandler:(id)a6
{
  v8 = (void (**)(void))_Block_copy(a6);
  sub_247596220();
  sub_2476B2B48();
  v9 = __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC23ActivitySharingServices19CloudDeviceObserver_cloudDeviceSystem), *(void *)&self->cloudDeviceSystem[OBJC_IVAR____TtC23ActivitySharingServices19CloudDeviceObserver_cloudDeviceSystem+ 16]);
  v10 = (os_unfair_lock_s *)__swift_project_boxed_opaque_existential_1(v9, v9[3])[6];
  uint64_t v11 = (uint64_t)&v10[4];
  v12 = v10 + 6;
  id v13 = a3;
  v14 = self;
  os_unfair_lock_lock(v12);
  sub_247596260(v11);
  os_unfair_lock_unlock(v12);
  v8[2](v8);
  _Block_release(v8);

  swift_bridgeObjectRelease();
}

- (void)cloudKitManager:(id)a3 didEndUpdatesForFetchWithType:(int64_t)a4 activity:(id)a5 cloudKitGroup:(id)a6 changesProcessedHandler:(id)a7
{
  uint64_t v11 = (void (**)(void))_Block_copy(a7);
  v12 = __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.isa+ OBJC_IVAR____TtC23ActivitySharingServices19CloudDeviceObserver_cloudDeviceSystem), *(void *)&self->cloudDeviceSystem[OBJC_IVAR____TtC23ActivitySharingServices19CloudDeviceObserver_cloudDeviceSystem+ 16]);
  __swift_project_boxed_opaque_existential_1(v12, v12[3]);
  id v13 = a3;
  swift_unknownObjectRetain();
  id v14 = a6;
  v16 = self;
  if (a4)
  {
    sub_2476728A8();
  }
  else
  {
    sub_247672F80();
    sub_2476B2A38();
    uint64_t v15 = sub_2476B2A58();
    swift_bridgeObjectRelease();
    notify_post((const char *)(v15 + 32));
    swift_release();
  }
  v11[2](v11);
  _Block_release(v11);

  swift_unknownObjectRelease();
}

@end