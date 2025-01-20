@interface DADeviceObserverEnclosure
- (DADeviceObserver)observer;
- (DADeviceObserverEnclosure)initWithObserver:(id)a3 delegate:(id)a4;
- (DADeviceObserverEnclosureDelegate)delegate;
- (NSCopying)identifier;
- (NSSet)devices;
- (void)begin;
- (void)end;
- (void)oneshotWithHandler:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevices:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation DADeviceObserverEnclosure

- (DADeviceObserverEnclosure)initWithObserver:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DADeviceObserverEnclosure;
  v9 = [(DADeviceObserverEnclosure *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_observer, a3);
    uint64_t v11 = +[NSSet set];
    devices = v10->_devices;
    v10->_devices = (NSSet *)v11;

    objc_storeWeak((id *)&v10->_delegate, v8);
  }

  return v10;
}

- (void)begin
{
  v3 = [(DADeviceObserverEnclosure *)self identifier];

  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = [(DADeviceObserverEnclosure *)self observer];
    v6 = _NSConcreteStackBlock;
    uint64_t v7 = 3221225472;
    id v8 = sub_100004968;
    v9 = &unk_1000145D0;
    objc_copyWeak(&v10, &location);
    v5 = [v4 beginDiscoveringDevicesWithHandler:&v6];
    -[DADeviceObserverEnclosure setIdentifier:](self, "setIdentifier:", v5, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

- (void)end
{
  v3 = [(DADeviceObserverEnclosure *)self identifier];

  if (v3)
  {
    v4 = [(DADeviceObserverEnclosure *)self observer];
    v5 = [(DADeviceObserverEnclosure *)self identifier];
    [v4 endDiscoveringDevicesWithIdentifier:v5];

    [(DADeviceObserverEnclosure *)self setIdentifier:0];
  }
}

- (void)oneshotWithHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = [(DADeviceObserverEnclosure *)self observer];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004BF8;
  v7[3] = &unk_1000145F8;
  objc_copyWeak(&v9, &location);
  id v6 = v4;
  id v8 = v6;
  [v5 discoverAllDevicesWithCompletionHandler:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (NSCopying)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (DADeviceObserver)observer
{
  return self->_observer;
}

- (void)setObserver:(id)a3
{
}

- (NSSet)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
}

- (DADeviceObserverEnclosureDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DADeviceObserverEnclosureDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_observer, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end