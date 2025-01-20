@interface CHSessionStateTracker
- (BOOL)isActive;
- (CHSessionStateTracker)init;
- (void)dealloc;
- (void)setActive;
- (void)setIdle;
@end

@implementation CHSessionStateTracker

- (CHSessionStateTracker)init
{
  v10.receiver = self;
  v10.super_class = (Class)CHSessionStateTracker;
  v2 = [(CHSessionStateTracker *)&v10 init];
  v8 = v2;
  if (v2) {
    objc_msgSend_setActive(v2, v3, v4, v5, v6, v7);
  }
  return v8;
}

- (void)dealloc
{
  sub_1C4A2CC14(self);
  v3.receiver = self;
  v3.super_class = (Class)CHSessionStateTracker;
  [(CHSessionStateTracker *)&v3 dealloc];
}

- (void)setIdle
{
}

- (void)setActive
{
}

- (BOOL)isActive
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = v2->_state == 1;
  objc_sync_exit(v2);

  return v3;
}

- (void).cxx_destruct
{
}

@end