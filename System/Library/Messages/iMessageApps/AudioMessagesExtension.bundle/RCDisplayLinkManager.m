@interface RCDisplayLinkManager
+ (RCDisplayLinkManager)sharedManager;
- (BOOL)paused;
- (RCDisplayLinkManager)init;
- (RCTimeController)timeController;
- (void)_applicationDidEnterBackground:(id)a3;
- (void)_applicationWillEnterForeground:(id)a3;
- (void)_displayLinkDidUpdate:(id)a3;
- (void)addDisplayLinkObserver:(id)a3;
- (void)removeDisplayLinkObserver:(id)a3;
- (void)setPaused:(BOOL)a3;
- (void)setTimeController:(id)a3;
@end

@implementation RCDisplayLinkManager

+ (RCDisplayLinkManager)sharedManager
{
  if (qword_82EC8 != -1) {
    dispatch_once(&qword_82EC8, &stru_6D978);
  }
  v2 = (void *)qword_82EC0;

  return (RCDisplayLinkManager *)v2;
}

- (RCDisplayLinkManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)RCDisplayLinkManager;
  v2 = [(RCDisplayLinkManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = +[CADisplayLink displayLinkWithTarget:v2 selector:"_displayLinkDidUpdate:"];
    displayLink = v2->_displayLink;
    v2->_displayLink = (CADisplayLink *)v3;

    v5 = v2->_displayLink;
    v6 = +[NSRunLoop mainRunLoop];
    [(CADisplayLink *)v5 addToRunLoop:v6 forMode:NSRunLoopCommonModes];

    [(CADisplayLink *)v2->_displayLink setPaused:1];
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 addObserver:v2 selector:"_applicationWillEnterForeground:" name:UIApplicationWillEnterForegroundNotification object:0];
    [v7 addObserver:v2 selector:"_applicationDidEnterBackground:" name:UIApplicationDidEnterBackgroundNotification object:0];
    uint64_t v8 = +[NSHashTable weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v8;
  }
  return v2;
}

- (void)_applicationWillEnterForeground:(id)a3
{
  BOOL v4 = [(NSHashTable *)self->_observers count] == 0;
  displayLink = self->_displayLink;

  [(CADisplayLink *)displayLink setPaused:v4];
}

- (void)_applicationDidEnterBackground:(id)a3
{
}

- (void)setPaused:(BOOL)a3
{
}

- (BOOL)paused
{
  return [(CADisplayLink *)self->_displayLink isPaused];
}

- (void)addDisplayLinkObserver:(id)a3
{
  observers = self->_observers;
  id v5 = a3;
  NSUInteger v6 = [(NSHashTable *)observers count];
  [(NSHashTable *)self->_observers addObject:v5];

  if (!v6)
  {
    displayLink = self->_displayLink;
    [(CADisplayLink *)displayLink setPaused:0];
  }
}

- (void)removeDisplayLinkObserver:(id)a3
{
  [(NSHashTable *)self->_observers removeObject:a3];
  if (![(NSHashTable *)self->_observers count])
  {
    displayLink = self->_displayLink;
    [(CADisplayLink *)displayLink setPaused:1];
  }
}

- (void)_displayLinkDidUpdate:(id)a3
{
  id v4 = a3;
  id v5 = self->_timeController;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  NSUInteger v6 = [(NSHashTable *)self->_observers allObjects];
  id v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * (void)v10) displayLinkDidUpdate:v4 withTimeController:v5];
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (RCTimeController)timeController
{
  return self->_timeController;
}

- (void)setTimeController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeController, 0);
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_displayLink, 0);
}

@end