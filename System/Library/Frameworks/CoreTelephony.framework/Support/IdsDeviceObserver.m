@interface IdsDeviceObserver
- (IdsDeviceObserver)initWithCallback:(function<void)(;
- (id).cxx_construct;
- (void)service:(id)a3 connectedDevicesChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)service:(id)a3 linkedDevicesChanged:(id)a4;
@end

@implementation IdsDeviceObserver

- (IdsDeviceObserver)initWithCallback:(function<void)(
{
  v7.receiver = self;
  v7.super_class = (Class)IdsDeviceObserver;
  v4 = [(IdsDeviceObserver *)&v7 init];
  v5 = v4;
  if (v4) {
    sub_1003351AC(v4->fCallback.__f_.__buf_.__lx, (uint64_t)a3);
  }
  return v5;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  f = self->fCallback.__f_.__f_;
  if (!f) {
    sub_10007B600();
  }
  (*(void (**)(void *))(*(void *)f + 48))(f);
}

- (void)service:(id)a3 connectedDevicesChanged:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  f = self->fCallback.__f_.__f_;
  if (!f) {
    sub_10007B600();
  }
  (*(void (**)(void *))(*(void *)f + 48))(f);
}

- (void)service:(id)a3 linkedDevicesChanged:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  f = self->fCallback.__f_.__f_;
  if (!f) {
    sub_10007B600();
  }
  (*(void (**)(void *))(*(void *)f + 48))(f);
}

- (void).cxx_destruct
{
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  return self;
}

@end