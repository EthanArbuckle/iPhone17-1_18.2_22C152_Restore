@interface AKProximityAuthFlowController
+ (AKProximityAuthFlowController)shared;
- (AKProximityAuthFlowController)init;
- (BOOL)shouldBeginProximityAuthentiation;
- (void)beginAuthenticationWithClient:(id)a3 context:(id)a4 server:(id)a5 completion:(id)a6;
- (void)centralManagerDidUpdateState:(id)a3;
- (void)endAuthenticationWithCompletion:(id)a3;
- (void)endProximityBroadcastWith:(id)a3;
- (void)performAuthentication;
- (void)showVisualPairingWithEvent:(id)a3;
@end

@implementation AKProximityAuthFlowController

- (BOOL)shouldBeginProximityAuthentiation
{
  return *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKProximityAuthFlowController_server) == 0;
}

+ (AKProximityAuthFlowController)shared
{
  if (qword_10026F998 != -1) {
    swift_once();
  }
  v2 = (void *)static ProximityAuthFlowController.shared;

  return (AKProximityAuthFlowController *)v2;
}

- (void)beginAuthenticationWithClient:(id)a3 context:(id)a4 server:(id)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  _Block_copy(v10);
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  v14 = self;
  sub_1000EED80(v11, v12, v13, (uint64_t)v14, (void (**)(void, void))v10);
  _Block_release(v10);
  _Block_release(v10);
}

- (void)endAuthenticationWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1000EF13C((uint64_t)v5, (void (**)(void, void, void))v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (void)showVisualPairingWithEvent:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000EC69C((uint64_t)v4);
}

- (void)endProximityBroadcastWith:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1000ECB04((uint64_t)v4);
}

- (void)performAuthentication
{
  v2 = self;
  sub_1000ECF10();
}

- (void)centralManagerDidUpdateState:(id)a3
{
  id v4 = a3;
  v5 = self;
  ProximityAuthFlowController.centralManagerDidUpdateState(_:)((CBCentralManager)v4);
}

- (AKProximityAuthFlowController)init
{
  return (AKProximityAuthFlowController *)ProximityAuthFlowController.init()();
}

- (void).cxx_destruct
{
  sub_1000EECD4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AKProximityAuthFlowController_authCompletion));
  sub_1000EECD4(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___AKProximityAuthFlowController_proxAuthCompletion));

  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___AKProximityAuthFlowController_cbManager);
}

@end