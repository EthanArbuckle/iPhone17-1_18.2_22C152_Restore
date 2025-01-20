@interface FMDDeviceDiscoveringXPCAdapter
- (FMDDeviceDiscovering)discovery;
- (FMDDeviceDiscoveringXPCAdapter)initWithDiscovery:(id)a3 delegate:(id)a4;
- (FindMyDeviceBTDiscoveryDelegateXPCInterface)delegate;
- (void)setDelegate:(id)a3;
- (void)setDiscovery:(id)a3;
- (void)startDiscovery;
- (void)stopDiscovery;
@end

@implementation FMDDeviceDiscoveringXPCAdapter

- (FMDDeviceDiscoveringXPCAdapter)initWithDiscovery:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)FMDDeviceDiscoveringXPCAdapter;
  v8 = [(FMDDeviceDiscoveringXPCAdapter *)&v21 init];
  v9 = v8;
  if (v8)
  {
    [(FMDDeviceDiscoveringXPCAdapter *)v8 setDiscovery:v6];
    [(FMDDeviceDiscoveringXPCAdapter *)v9 setDelegate:v7];
    objc_initWeak(&location, v9);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10000600C;
    v18[3] = &unk_10000C448;
    objc_copyWeak(&v19, &location);
    v10 = [(FMDDeviceDiscoveringXPCAdapter *)v9 discovery];
    [v10 setDidEndDiscovery:v18];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100006078;
    v16[3] = &unk_10000C470;
    objc_copyWeak(&v17, &location);
    v11 = [(FMDDeviceDiscoveringXPCAdapter *)v9 discovery];
    [v11 setDidDiscoverDevice:v16];

    objc_copyWeak(&v15, &location);
    v12 = [(FMDDeviceDiscoveringXPCAdapter *)v9 discovery];
    [v12 setDidLoseDevice:&v14];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (void)startDiscovery
{
  id v2 = [(FMDDeviceDiscoveringXPCAdapter *)self discovery];
  [v2 startDiscovery];
}

- (void)stopDiscovery
{
  id v2 = [(FMDDeviceDiscoveringXPCAdapter *)self discovery];
  [v2 stopDiscovery];
}

- (FMDDeviceDiscovering)discovery
{
  return self->_discovery;
}

- (void)setDiscovery:(id)a3
{
}

- (FindMyDeviceBTDiscoveryDelegateXPCInterface)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);

  objc_storeStrong((id *)&self->_discovery, 0);
}

@end