@interface NSNotificationQueue
+ (NSNotificationQueue)defaultQueue;
- (NSNotificationQueue)init;
- (NSNotificationQueue)initWithNotificationCenter:(NSNotificationCenter *)notificationCenter;
- (void)_flushNotificationQueue;
- (void)dealloc;
- (void)dequeueNotificationsMatching:(NSNotification *)notification coalesceMask:(NSUInteger)coalesceMask;
- (void)enqueueNotification:(NSNotification *)notification postingStyle:(NSPostingStyle)postingStyle;
- (void)enqueueNotification:(NSNotification *)notification postingStyle:(NSPostingStyle)postingStyle coalesceMask:(NSNotificationCoalescing)coalesceMask forModes:(NSArray *)modes;
@end

@implementation NSNotificationQueue

- (void)enqueueNotification:(NSNotification *)notification postingStyle:(NSPostingStyle)postingStyle coalesceMask:(NSNotificationCoalescing)coalesceMask forModes:(NSArray *)modes
{
  if (postingStyle == NSPostWhenIdle)
  {
    if (removeNotificationsFromQueue(self->_asapQueue, notification, 1, coalesceMask)
      || removeNotificationsFromQueue(self->_idleQueue, notification, 1, coalesceMask))
    {
      return;
    }
    v11 = self;
    v12 = notification;
    v13 = modes;
    int v14 = 0;
  }
  else
  {
    if (postingStyle != NSPostASAP)
    {
      if (postingStyle == NSPostNow)
      {
        removeNotificationsFromQueue(self->_idleQueue, notification, 0, coalesceMask);
        removeNotificationsFromQueue(self->_asapQueue, notification, 0, coalesceMask);
        notificationCenter = self->_notificationCenter;
        [(NSNotificationCenter *)notificationCenter postNotification:notification];
      }
      return;
    }
    removeNotificationsFromQueue(self->_idleQueue, notification, 0, coalesceMask);
    if (removeNotificationsFromQueue(self->_asapQueue, notification, 1, coalesceMask)) {
      return;
    }
    v11 = self;
    v12 = notification;
    v13 = modes;
    int v14 = 1;
  }

  addNotificationToQueue(v11, (uint64_t)v12, v13, v14);
}

+ (NSNotificationQueue)defaultQueue
{
  v3 = [+[NSThread currentThread] threadDictionary];
  uint64_t v4 = [(NSMutableDictionary *)v3 objectForKey:@"NSDefaultNotificationQueue"];
  v5 = (NSNotificationQueue *)v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    v5 = (NSNotificationQueue *)[objc_allocWithZone((Class)a1) init];
    [(NSMutableDictionary *)v3 setObject:v5 forKey:@"NSDefaultNotificationQueue"];
  }
  return v5;
}

- (NSNotificationQueue)init
{
  v3 = +[NSNotificationCenter defaultCenter];

  return [(NSNotificationQueue *)self initWithNotificationCenter:v3];
}

- (NSNotificationQueue)initWithNotificationCenter:(NSNotificationCenter *)notificationCenter
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v6.receiver = self;
  v6.super_class = (Class)NSNotificationQueue;
  uint64_t v4 = [(NSNotificationQueue *)&v6 init];
  if (v4)
  {
    v4->_notificationCenter = notificationCenter;
    v4->_asapQueue = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] array];
    v4->_idleQueue = (NSMutableArray *)(id)[MEMORY[0x1E4F1CA48] array];
  }
  return v4;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [(NSNotificationQueue *)self _flushNotificationQueue];

  v3.receiver = self;
  v3.super_class = (Class)NSNotificationQueue;
  [(NSNotificationQueue *)&v3 dealloc];
}

- (void)_flushNotificationQueue
{
  asapQueue = self->_asapQueue;
  idleQueue = self->_idleQueue;
  self->_asapQueue = 0;
  self->_idleQueue = 0;
}

- (void)enqueueNotification:(NSNotification *)notification postingStyle:(NSPostingStyle)postingStyle
{
}

- (void)dequeueNotificationsMatching:(NSNotification *)notification coalesceMask:(NSUInteger)coalesceMask
{
  removeNotificationsFromQueue(self->_asapQueue, notification, 0, coalesceMask);
  idleQueue = self->_idleQueue;

  removeNotificationsFromQueue(idleQueue, notification, 0, coalesceMask);
}

@end