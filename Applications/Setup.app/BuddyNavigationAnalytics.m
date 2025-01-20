@interface BuddyNavigationAnalytics
- (BuddyNavigationAnalytics)init;
- (BuddyNavigationAnalytics)initWithNavigationController:(id)a3;
- (NSMutableArray)eventPayloads;
- (UIViewController)currentViewController;
- (double)currentViewControllerActiveDuration;
- (double)currentViewControllerBackgroundDuration;
- (unint64_t)activeStartTimestamp;
- (unint64_t)backgroundStartTimestamp;
- (void)_addEventForClass:(Class)a3 activeDuration:(double)a4 backgroundDuration:(double)a5;
- (void)_addEventForCurrentViewController;
- (void)addEventsUsingAnalyticsManager:(id)a3;
- (void)didBecomeActive;
- (void)didEnterBackground;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6;
- (void)prepareEventForCurrentViewController;
- (void)setActiveStartTimestamp:(unint64_t)a3;
- (void)setBackgroundStartTimestamp:(unint64_t)a3;
- (void)setCurrentViewController:(id)a3;
- (void)setCurrentViewControllerActiveDuration:(double)a3;
- (void)setCurrentViewControllerBackgroundDuration:(double)a3;
- (void)setEventPayloads:(id)a3;
@end

@implementation BuddyNavigationAnalytics

- (BuddyNavigationAnalytics)init
{
  SEL v7 = a2;
  id location = 0;
  v6.receiver = self;
  v6.super_class = (Class)BuddyNavigationAnalytics;
  id location = [(BuddyNavigationAnalytics *)&v6 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v2 = objc_alloc_init((Class)NSMutableArray);
    v3 = (void *)*((void *)location + 1);
    *((void *)location + 1) = v2;
  }
  v4 = (BuddyNavigationAnalytics *)location;
  objc_storeStrong(&location, 0);
  return v4;
}

- (BuddyNavigationAnalytics)initWithNavigationController:(id)a3
{
  id v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v3 = v7;
  id v7 = 0;
  id v7 = [v3 init];
  objc_storeStrong(&v7, v7);
  if (v7) {
    [location[0] addDelegateObserver:v7];
  }
  v4 = (BuddyNavigationAnalytics *)v7;
  objc_storeStrong(location, 0);
  objc_storeStrong(&v7, 0);
  return v4;
}

- (void)didBecomeActive
{
  id v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  [(BuddyNavigationAnalytics *)self setActiveStartTimestamp:+[BuddyTimestamp currentTimestamp]];
  if ([(BuddyNavigationAnalytics *)self backgroundStartTimestamp])
  {
    +[BuddyTimestamp intervalSinceTimestamp:[(BuddyNavigationAnalytics *)self backgroundStartTimestamp]];
    double v4 = v3;
    [(BuddyNavigationAnalytics *)self currentViewControllerBackgroundDuration];
    [(BuddyNavigationAnalytics *)self setCurrentViewControllerBackgroundDuration:v5 + v4];
    [(BuddyNavigationAnalytics *)self setBackgroundStartTimestamp:0];
  }
}

- (void)didEnterBackground
{
  id v2 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v2);

  [(BuddyNavigationAnalytics *)self setBackgroundStartTimestamp:+[BuddyTimestamp currentTimestamp]];
  if ([(BuddyNavigationAnalytics *)self activeStartTimestamp])
  {
    +[BuddyTimestamp intervalSinceTimestamp:[(BuddyNavigationAnalytics *)self activeStartTimestamp]];
    double v4 = v3;
    [(BuddyNavigationAnalytics *)self currentViewControllerActiveDuration];
    [(BuddyNavigationAnalytics *)self setCurrentViewControllerActiveDuration:v5 + v4];
    [(BuddyNavigationAnalytics *)self setActiveStartTimestamp:0];
  }
}

- (void)prepareEventForCurrentViewController
{
  id v2 = [(BuddyNavigationAnalytics *)self currentViewController];

  if (v2)
  {
    [(BuddyNavigationAnalytics *)self _addEventForCurrentViewController];
    [(BuddyNavigationAnalytics *)self setCurrentViewController:0];
  }
}

- (void)addEventsUsingAnalyticsManager:(id)a3
{
  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  memset(__b, 0, sizeof(__b));
  double v3 = [(BuddyNavigationAnalytics *)v10 eventPayloads];
  id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:__b objects:v11 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)__b[2];
    do
    {
      for (unint64_t i = 0; i < (unint64_t)v4; ++i)
      {
        if (*(void *)__b[2] != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(__b[1] + 8 * i);
        [location[0] addEvent:@"com.apple.setupassistant.ios.pane_duration" withPayload:v8 persist:1];
      }
      id v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:__b objects:v11 count:16];
    }
    while (v4);
  }

  objc_storeStrong(location, 0);
}

- (void)setCurrentViewController:(id)a3
{
  objc_super v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_storeStrong((id *)&v6->_currentViewController, location[0]);
  if ([(BuddyNavigationAnalytics *)v6 activeStartTimestamp])
  {
    unint64_t v3 = +[BuddyTimestamp currentTimestamp];
    [(BuddyNavigationAnalytics *)v6 setActiveStartTimestamp:v3];
  }
  if ([(BuddyNavigationAnalytics *)v6 backgroundStartTimestamp])
  {
    unint64_t v4 = +[BuddyTimestamp currentTimestamp];
    [(BuddyNavigationAnalytics *)v6 setBackgroundStartTimestamp:v4];
  }
  [(BuddyNavigationAnalytics *)v6 setCurrentViewControllerActiveDuration:0.0];
  [(BuddyNavigationAnalytics *)v6 setCurrentViewControllerBackgroundDuration:0.0];
  objc_storeStrong(location, 0);
}

- (void)_addEventForCurrentViewController
{
  if ([(BuddyNavigationAnalytics *)self activeStartTimestamp])
  {
    +[BuddyTimestamp intervalSinceTimestamp:[(BuddyNavigationAnalytics *)self activeStartTimestamp]];
    double v3 = v2;
    [(BuddyNavigationAnalytics *)self currentViewControllerActiveDuration];
    [(BuddyNavigationAnalytics *)self setCurrentViewControllerActiveDuration:v4 + v3];
  }
  if ([(BuddyNavigationAnalytics *)self backgroundStartTimestamp])
  {
    +[BuddyTimestamp intervalSinceTimestamp:[(BuddyNavigationAnalytics *)self backgroundStartTimestamp]];
    double v6 = v5;
    [(BuddyNavigationAnalytics *)self currentViewControllerBackgroundDuration];
    [(BuddyNavigationAnalytics *)self setCurrentViewControllerBackgroundDuration:v7 + v6];
  }
  uint64_t v8 = [(BuddyNavigationAnalytics *)self currentViewController];
  uint64_t v9 = objc_opt_class();
  [(BuddyNavigationAnalytics *)self currentViewControllerActiveDuration];
  double v11 = v10;
  [(BuddyNavigationAnalytics *)self currentViewControllerBackgroundDuration];
  [(BuddyNavigationAnalytics *)self _addEventForClass:v9 activeDuration:v11 backgroundDuration:v12];
}

- (void)_addEventForClass:(Class)a3 activeDuration:(double)a4 backgroundDuration:(double)a5
{
  double v5 = [(BuddyNavigationAnalytics *)self eventPayloads];
  v13[0] = @"class";
  double v6 = NSStringFromClass(a3);
  v14[0] = v6;
  v13[1] = @"activeDuration";
  double v7 = +[NSNumber numberWithDouble:a4];
  v14[1] = v7;
  v13[2] = @"backgroundDuration";
  uint64_t v8 = +[NSNumber numberWithDouble:a5];
  v14[2] = v8;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:3];
  [(NSMutableArray *)v5 addObject:v9];
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  double v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v8 = 0;
  objc_storeStrong(&v8, a4);
  double v7 = [(BuddyNavigationAnalytics *)v10 currentViewController];

  if (v7) {
    [(BuddyNavigationAnalytics *)v10 _addEventForCurrentViewController];
  }
  [(BuddyNavigationAnalytics *)v10 setCurrentViewController:v8];
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);
}

- (NSMutableArray)eventPayloads
{
  return self->_eventPayloads;
}

- (void)setEventPayloads:(id)a3
{
}

- (unint64_t)activeStartTimestamp
{
  return self->_activeStartTimestamp;
}

- (void)setActiveStartTimestamp:(unint64_t)a3
{
  self->_activeStartTimestamp = a3;
}

- (unint64_t)backgroundStartTimestamp
{
  return self->_backgroundStartTimestamp;
}

- (void)setBackgroundStartTimestamp:(unint64_t)a3
{
  self->_backgroundStartTimestamp = a3;
}

- (UIViewController)currentViewController
{
  return self->_currentViewController;
}

- (double)currentViewControllerActiveDuration
{
  return self->_currentViewControllerActiveDuration;
}

- (void)setCurrentViewControllerActiveDuration:(double)a3
{
  self->_currentViewControllerActiveDuration = a3;
}

- (double)currentViewControllerBackgroundDuration
{
  return self->_currentViewControllerBackgroundDuration;
}

- (void)setCurrentViewControllerBackgroundDuration:(double)a3
{
  self->_currentViewControllerBackgroundDuration = a3;
}

- (void).cxx_destruct
{
}

@end