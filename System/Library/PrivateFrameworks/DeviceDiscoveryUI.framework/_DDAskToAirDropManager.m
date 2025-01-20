@interface _DDAskToAirDropManager
- (_TtC17DeviceDiscoveryUI22_DDAskToAirDropManager)init;
- (void)didChangeRadioState:(BOOL)a3;
@end

@implementation _DDAskToAirDropManager

- (_TtC17DeviceDiscoveryUI22_DDAskToAirDropManager)init
{
  return (_TtC17DeviceDiscoveryUI22_DDAskToAirDropManager *)sub_24CB7AC54();
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC17DeviceDiscoveryUI22_DDAskToAirDropManager__isSearching;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269814EC0);
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
  v5((char *)self + OBJC_IVAR____TtC17DeviceDiscoveryUI22_DDAskToAirDropManager__isNFCEnabled, v4);
  v6 = (char *)self + OBJC_IVAR____TtC17DeviceDiscoveryUI22_DDAskToAirDropManager__nearbyDeviceCount;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_2698148D8);
  (*(void (**)(char *, uint64_t))(*(void *)(v7 - 8) + 8))(v6, v7);
  v8 = (char *)self + OBJC_IVAR____TtC17DeviceDiscoveryUI22_DDAskToAirDropManager__sharingName;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_269814EB0);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = *(Class *)((char *)&self->super.isa
                 + OBJC_IVAR____TtC17DeviceDiscoveryUI22_DDAskToAirDropManager_airDropController);
}

- (void)didChangeRadioState:(BOOL)a3
{
  v3 = self;
  sub_24CB7B3DC();
}

@end