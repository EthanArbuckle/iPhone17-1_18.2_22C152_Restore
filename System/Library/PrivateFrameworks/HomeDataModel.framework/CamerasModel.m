@interface CamerasModel
- (_TtC13HomeDataModel12CamerasModel)init;
- (void)accessoryDidUpdateName:(id)a3;
- (void)accessoryDidUpdateReachability:(id)a3;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)homeManagerDidUpdatePrimaryHome:(id)a3;
@end

@implementation CamerasModel

- (_TtC13HomeDataModel12CamerasModel)init
{
  v2 = self;
  *(Class *)((char *)&v2->super.isa + OBJC_IVAR____TtC13HomeDataModel12CamerasModel__homesToCameraControllers) = (Class)sub_2519FB890(MEMORY[0x263F8EE78]);
  v3 = (char *)v2 + OBJC_IVAR____TtC13HomeDataModel12CamerasModel__currentHomeIdentifier;
  uint64_t v4 = sub_251F34DA0();
  v5 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 56);
  v5(v3, 1, 1, v4);
  v5(v3, 1, 1, v4);
  sub_251F34F40();

  v7.receiver = v2;
  v7.super_class = (Class)type metadata accessor for CamerasModel();
  return [(CamerasModel *)&v7 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_251B55B48((uint64_t)self + OBJC_IVAR____TtC13HomeDataModel12CamerasModel__currentHomeIdentifier);
  v3 = (char *)self + OBJC_IVAR____TtC13HomeDataModel12CamerasModel___observationRegistrar;
  uint64_t v4 = sub_251F34F50();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  v5 = self;
  CamerasModel.homeManagerDidUpdateHomes(_:)((HMHomeManager)v4);
}

- (void)homeManagerDidUpdatePrimaryHome:(id)a3
{
  id v4 = a3;
  v5 = self;
  CamerasModel.homeManagerDidUpdatePrimaryHome(_:)((HMHomeManager)v4);
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_251D6067C(v7);
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_251D60998(v7);
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CamerasModel.home(_:didAdd:)((HMHome)v6, (HMAccessory)v7);
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  CamerasModel.home(_:didRemove:)((HMHome)v6, (HMAccessory)v7);
}

- (void)accessoryDidUpdateName:(id)a3
{
  id v4 = a3;
  v5 = self;
  CamerasModel.accessoryDidUpdateName(_:)((HMAccessory)v4);
}

- (void)accessoryDidUpdateReachability:(id)a3
{
  id v4 = a3;
  v5 = self;
  CamerasModel.accessoryDidUpdateReachability(_:)((HMAccessory)v4);
}

@end