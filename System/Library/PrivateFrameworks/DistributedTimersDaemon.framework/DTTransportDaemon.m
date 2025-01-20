@interface DTTransportDaemon
- (_TtC23DistributedTimersDaemon17DTTransportDaemon)init;
- (void)home:(id)a3 didAddMediaSystem:(id)a4;
- (void)home:(id)a3 didRemoveMediaSystem:(id)a4;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4;
- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4;
- (void)homeManagerDidUpdateDataSyncInProgress:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)siriEndpointProfile:(id)a3 didUpdateSessionHubIdentifier:(id)a4;
@end

@implementation DTTransportDaemon

- (void)homeManagerDidUpdateHomes:(id)a3
{
}

- (void)homeManagerDidUpdateDataSyncInProgress:(id)a3
{
}

- (void)homeManager:(id)a3 didUpdateStatus:(unint64_t)a4
{
  id v4 = a3;
  swift_retain();
  sub_24CDC01FC(v4, "didUpdateStatus: %{public}s", (uint64_t)&unk_26FF3B450, (uint64_t)&unk_2698359E8);
  swift_release();
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  sub_24CDC0814((uint64_t)self, (uint64_t)a2, a3, a4, "HomeKit didAddHome: name%s, id=%s", (uint64_t)&unk_26FF3B428, (uint64_t)&unk_2698359D0, (uint64_t)&unk_2698359D8);
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  sub_24CDC0814((uint64_t)self, (uint64_t)a2, a3, a4, "HomeKit didRemoveHome: name%s, id=%s", (uint64_t)&unk_26FF3B400, (uint64_t)&unk_2698359B8, (uint64_t)&unk_2698359C0);
}

- (void)homeManager:(id)a3 didUpdateHH2State:(BOOL)a4
{
  id v5 = a3;
  swift_retain();
  sub_24CDCD078(a4);
  swift_release();
}

- (void)home:(id)a3 didAddMediaSystem:(id)a4
{
}

- (void)home:(id)a3 didRemoveMediaSystem:(id)a4
{
}

- (void)siriEndpointProfile:(id)a3 didUpdateSessionHubIdentifier:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_269835430);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a4)
  {
    sub_24CE0D8D0();
    uint64_t v9 = sub_24CE0D900();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_24CE0D900();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  id v11 = a3;
  swift_retain();
  DTTransportDaemon.siriEndpointProfile(_:didUpdateSessionHubIdentifier:)(v11);
  swift_release();

  sub_24CD9218C((uint64_t)v8, &qword_269835430);
}

- (_TtC23DistributedTimersDaemon17DTTransportDaemon)init
{
  result = (_TtC23DistributedTimersDaemon17DTTransportDaemon *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end