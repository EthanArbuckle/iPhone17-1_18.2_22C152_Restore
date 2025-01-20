@interface DSRemotePairingWrapper
- (DSRemotePairingWrapper)init;
- (_TtC15DSRemotePairing15DSRemotePairing)remotePairing;
- (id)getPairedDevicesWithCompletion:(id)a3;
- (id)removeAllPairedDevices;
- (void)removeSelectedDevices:(id)a3 onQueue:(id)a4 withCompletion:(id)a5;
- (void)setRemotePairing:(id)a3;
@end

@implementation DSRemotePairingWrapper

- (DSRemotePairingWrapper)init
{
  v3 = objc_alloc_init(_TtC15DSRemotePairing15DSRemotePairing);
  [(DSRemotePairingWrapper *)self setRemotePairing:v3];

  return self;
}

- (id)getPairedDevicesWithCompletion:(id)a3
{
  return [(DSRemotePairing *)self->_remotePairing getPairedDevicesWithCompletion:a3];
}

- (id)removeAllPairedDevices
{
  v2 = [(DSRemotePairingWrapper *)self remotePairing];
  v3 = [v2 removeAllPairedDevices];

  return v3;
}

- (void)removeSelectedDevices:(id)a3 onQueue:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(DSRemotePairingWrapper *)self remotePairing];
  [v11 removeSelectedDevices:v10 invokingCompletionHandlerOn:v9 completion:v8];
}

- (_TtC15DSRemotePairing15DSRemotePairing)remotePairing
{
  return self->_remotePairing;
}

- (void)setRemotePairing:(id)a3
{
}

- (void).cxx_destruct
{
}

@end