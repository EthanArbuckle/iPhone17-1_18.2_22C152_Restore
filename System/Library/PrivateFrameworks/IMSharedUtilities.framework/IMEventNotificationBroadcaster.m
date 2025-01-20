@interface IMEventNotificationBroadcaster
- (void)_didProcessQueue;
- (void)_willProcessQueue;
- (void)broadcastEventToListeners:(id)a3;
@end

@implementation IMEventNotificationBroadcaster

- (void)_willProcessQueue
{
}

- (void)_didProcessQueue
{
}

- (void)broadcastEventToListeners:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A07E54FC;
  v7[3] = &unk_1E5A11DE0;
  id v6 = v4;
  id v8 = v6;
  [(IMEventNotificationQueue *)v5 enumerateObjectsUsingBlock:v7];
  [(IMEventNotificationQueue *)v5 _scheduleIfNeeded:1];

  objc_sync_exit(v5);
}

@end