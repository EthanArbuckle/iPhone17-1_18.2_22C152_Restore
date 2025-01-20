@interface _LSSettingStoreChangeObserver
- (id).cxx_construct;
@end

@implementation _LSSettingStoreChangeObserver

- (id).cxx_construct
{
  *((_DWORD *)self + 4) = -1;
  return self;
}

- (void).cxx_destruct
{
  LaunchServices::notifyd::NotifyToken::~NotifyToken((LaunchServices::notifyd::NotifyToken *)&self->notifyToken);

  objc_storeStrong(&self->block, 0);
}

@end