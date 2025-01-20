@interface _LSChangeObserver
- (id).cxx_construct;
@end

@implementation _LSChangeObserver

- (id).cxx_construct
{
  *((_DWORD *)self + 5) = -1;
  return self;
}

- (void).cxx_destruct
{
  LaunchServices::notifyd::NotifyToken::~NotifyToken((LaunchServices::notifyd::NotifyToken *)&self->notifyToken);

  objc_storeStrong(&self->block, 0);
}

@end