@interface DSContinuityPairingWrapper
- (DSContinuityPairingWrapper)init;
- (_TtC19DSContinuityPairing19DSContinuityPairing)continuityPairing;
- (void)fetchContinuityEligibleDevicesWithCompletion:(id)a3;
- (void)setContinuityPairing:(id)a3;
- (void)unpairHostWithDeviceID:(id)a3 completion:(id)a4;
@end

@implementation DSContinuityPairingWrapper

- (DSContinuityPairingWrapper)init
{
  v5.receiver = self;
  v5.super_class = (Class)DSContinuityPairingWrapper;
  v2 = [(DSContinuityPairingWrapper *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(_TtC19DSContinuityPairing19DSContinuityPairing);
    [(DSContinuityPairingWrapper *)v2 setContinuityPairing:v3];
  }
  return v2;
}

- (void)fetchContinuityEligibleDevicesWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(DSContinuityPairingWrapper *)self continuityPairing];
  [v5 fetchContinuityDevicesWithCompletionHandler:v4];
}

- (void)unpairHostWithDeviceID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(DSContinuityPairingWrapper *)self continuityPairing];
  [v8 unpairDeviceWith:v7 completionHandler:v6];
}

- (_TtC19DSContinuityPairing19DSContinuityPairing)continuityPairing
{
  return self->_continuityPairing;
}

- (void)setContinuityPairing:(id)a3
{
}

- (void).cxx_destruct
{
}

@end