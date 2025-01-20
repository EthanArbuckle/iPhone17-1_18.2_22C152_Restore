@interface DBBuddyMonitor
- (BOOL)buddyFinished;
- (CARObserverHashTable)observers;
- (DBBuddyMonitor)init;
- (void)_updateBuddyFinished;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setBuddyFinished:(BOOL)a3;
- (void)setObservers:(id)a3;
@end

@implementation DBBuddyMonitor

- (DBBuddyMonitor)init
{
  v7.receiver = self;
  v7.super_class = (Class)DBBuddyMonitor;
  v2 = [(DBBuddyMonitor *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E1E2AF8];
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v3;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)SetupAssistantFinished, (CFStringRef)*MEMORY[0x263F67FC8], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    [(DBBuddyMonitor *)v2 _updateBuddyFinished];
  }
  return v2;
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)DBBuddyMonitor;
  [(DBBuddyMonitor *)&v4 dealloc];
}

- (void)setBuddyFinished:(BOOL)a3
{
  if (self->_buddyFinished != a3)
  {
    self->_buddyFinished = a3;
    id v4 = [(DBBuddyMonitor *)self observers];
    [v4 buddyMonitorDidChangeFinished:self];
  }
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBBuddyMonitor *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBBuddyMonitor *)self observers];
  [v5 removeObserver:v4];
}

- (void)_updateBuddyFinished
{
  uint64_t v3 = BYSetupAssistantNeedsToRun() ^ 1;
  [(DBBuddyMonitor *)self setBuddyFinished:v3];
}

- (BOOL)buddyFinished
{
  return self->_buddyFinished;
}

- (CARObserverHashTable)observers
{
  return (CARObserverHashTable *)objc_getProperty(self, a2, 16, 1);
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
}

@end