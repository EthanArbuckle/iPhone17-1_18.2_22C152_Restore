@interface HomeManager
- (BOOL)homesLoaded;
- (HMAccessory)currentAccessory;
- (HMHome)currentHome;
- (NSArray)allHomes;
- (_TtC10DropInCore11HomeManager)init;
- (void)accessoryDidUpdateControllable:(id)a3;
- (void)accessoryDidUpdateName:(id)a3;
- (void)addDelegate:(id)a3 queue:(id)a4;
- (void)home:(id)a3 didAddAccessory:(id)a4;
- (void)home:(id)a3 didAddUser:(id)a4;
- (void)home:(id)a3 didRemoveAccessory:(id)a4;
- (void)home:(id)a3 didRemoveUser:(id)a4;
- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)homeManager:(id)a3 didRemoveHome:(id)a4;
- (void)homeManagerDidUpdateHomes:(id)a3;
- (void)loadHomeSynchronous;
- (void)loadHomes:(id)a3;
- (void)setHomesLoaded:(BOOL)a3;
@end

@implementation HomeManager

- (BOOL)homesLoaded
{
  return sub_24D0C3834() & 1;
}

- (void)setHomesLoaded:(BOOL)a3
{
}

- (_TtC10DropInCore11HomeManager)init
{
  return (_TtC10DropInCore11HomeManager *)HomeManager.init()();
}

- (void)loadHomes:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  v5 = self;
  sub_24D0C3D3C();

  swift_release();
}

- (void)loadHomeSynchronous
{
  v2 = self;
  sub_24D0C4288();
}

- (void)addDelegate:(id)a3 queue:(id)a4
{
  swift_unknownObjectRetain();
  id v6 = a4;
  v7 = self;
  sub_24D0C42D4();
  swift_unknownObjectRelease();
}

- (NSArray)allHomes
{
  v2 = self;
  sub_24D0C46F0();

  sub_24D05BAFC(0, &qword_26B187280);
  v3 = (void *)sub_24D0F06D0();
  swift_bridgeObjectRelease();

  return (NSArray *)v3;
}

- (HMHome)currentHome
{
  v2 = self;
  id v3 = sub_24D0C4738();

  return (HMHome *)v3;
}

- (HMAccessory)currentAccessory
{
  v2 = self;
  id v3 = sub_24D0C47BC();

  return (HMAccessory *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10DropInCore11HomeManager_delegatesToQueues);
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  v5 = self;
  HomeManager.homeManagerDidUpdateHomes(_:)((HMHomeManager)v4);
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  HomeManager.homeManager(_:didAdd:)((HMHomeManager)v8, (HMHome)v7);
}

- (void)homeManager:(id)a3 didRemoveHome:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  HomeManager.homeManager(_:didRemove:)((HMHomeManager)v8, (HMHome)v7);
}

- (void)homeDidUpdateAccessControlForCurrentUser:(id)a3
{
  id v4 = a3;
  v5 = self;
  HomeManager.homeDidUpdateAccessControl(forCurrentUser:)((HMHome)v4);
}

- (void)home:(id)a3 didAddAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  HomeManager.home(_:didAdd:)((HMHome)v6, (HMAccessory)v7);
}

- (void)home:(id)a3 didRemoveAccessory:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  HomeManager.home(_:didRemove:)((HMHome)v6, (HMAccessory)v7);
}

- (void)home:(id)a3 didAddUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  HomeManager.home(_:didAdd:)((HMHome)v6, (HMUser)v7);
}

- (void)home:(id)a3 didRemoveUser:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  HomeManager.home(_:didRemove:)((HMHome)v6, (HMUser)v7);
}

- (void)accessoryDidUpdateName:(id)a3
{
  id v4 = a3;
  v5 = self;
  HomeManager.accessoryDidUpdateName(_:)((HMAccessory)v4);
}

- (void)accessoryDidUpdateControllable:(id)a3
{
  id v4 = a3;
  v5 = self;
  HomeManager.accessoryDidUpdateControllable(_:)((HMAccessory)v4);
}

@end