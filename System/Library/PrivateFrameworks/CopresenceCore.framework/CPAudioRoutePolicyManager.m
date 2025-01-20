@interface CPAudioRoutePolicyManager
+ (CPAudioRoutePolicyManager)sharedInstance;
- (BOOL)sharePlaySupported;
- (CPAudioRoutePolicyManager)init;
- (TURoute)pickedRoute;
- (void)addObserver:(id)a3 withQueue:(id)a4;
- (void)routesChangedForRouteController:(id)a3;
- (void)setPickedRoute:(id)a3;
- (void)switchToSpeakerRouteIfNecessary;
@end

@implementation CPAudioRoutePolicyManager

+ (CPAudioRoutePolicyManager)sharedInstance
{
  if (one-time initialization token for shared != -1) {
    swift_once();
  }
  v2 = (void *)static CPAudioRoutePolicyManager.shared;
  return (CPAudioRoutePolicyManager *)v2;
}

- (TURoute)pickedRoute
{
  uint64_t v2 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___CPAudioRoutePolicyManager__pickedRoute);
  v3 = (void **)(v2 + 16);
  v4 = (os_unfair_lock_s *)(v2 + 24);
  v5 = self;
  os_unfair_lock_lock(v4);
  closure #1 in CPAudioRoutePolicyManager.pickedRoute.getter(v3, &v8);
  os_unfair_lock_unlock(v4);
  v6 = v8;

  return (TURoute *)v6;
}

- (void)setPickedRoute:(id)a3
{
  id v5 = a3;
  v6 = self;
  CPAudioRoutePolicyManager.pickedRoute.setter(a3);
}

- (BOOL)sharePlaySupported
{
  uint64_t v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x80);
  v3 = self;
  v4 = (void *)v2();
  if (v4)
  {
    id v5 = v4;
    if (objc_msgSend(v4, sel_supportsSharePlay))
    {
      unsigned __int8 v6 = objc_msgSend(v5, sel_isCarKitRoute);

      return v6 ^ 1;
    }
    else
    {

      return 0;
    }
  }
  else
  {

    return 1;
  }
}

- (CPAudioRoutePolicyManager)init
{
  return (CPAudioRoutePolicyManager *)CPAudioRoutePolicyManager.init()();
}

- (void)switchToSpeakerRouteIfNecessary
{
  uint64_t v2 = self;
  CPAudioRoutePolicyManager.switchToSpeakerRouteIfNecessary()();
}

- (void)addObserver:(id)a3 withQueue:(id)a4
{
  v7 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.isa) + 0x68);
  swift_unknownObjectRetain();
  id v8 = a4;
  v9 = self;
  uint64_t v10 = v7();
  (*(void (**)(id, id))(*(void *)v10 + 160))(a3, v8);
  swift_unknownObjectRelease();

  swift_release();
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___CPAudioRoutePolicyManager_routeController);
}

- (void)routesChangedForRouteController:(id)a3
{
  id v4 = a3;
  unsigned __int8 v6 = self;
  id v5 = objc_msgSend(v4, sel_pickedRoute);
  (*(void (**)(id))((*MEMORY[0x1E4FBC8C8] & (uint64_t)v6->super.isa) + 0x88))(v5);
}

@end