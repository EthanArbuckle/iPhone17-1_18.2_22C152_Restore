@interface BKSMousePointerDeviceObserverInfo
- (BKSMousePointerDeviceObserver)observer;
- (NSSet)visibleDevices;
- (void)setObserver:(id)a3;
- (void)setVisibleDevices:(id)a3;
@end

@implementation BKSMousePointerDeviceObserverInfo

- (BKSMousePointerDeviceObserver)observer
{
  return self->_observer;
}

- (NSSet)visibleDevices
{
  return self->_visibleDevices;
}

- (void)setVisibleDevices:(id)a3
{
}

- (void)setObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleDevices, 0);
  objc_storeStrong((id *)&self->_observer, 0);
}

@end