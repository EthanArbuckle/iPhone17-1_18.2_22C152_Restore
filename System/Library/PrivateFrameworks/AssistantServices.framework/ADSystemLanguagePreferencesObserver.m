@interface ADSystemLanguagePreferencesObserver
+ (id)sharedObserver;
- (ADSystemLanguagePreferencesObserver)init;
- (BOOL)systemLanguagePreferenceHasChanged;
- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4;
@end

@implementation ADSystemLanguagePreferencesObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_notifyObserver, 0);
}

- (BOOL)systemLanguagePreferenceHasChanged
{
  return self->_changed;
}

- (void)notifyObserver:(id)a3 didReceiveNotificationWithToken:(int)a4
{
  self->_changed = 1;
}

- (ADSystemLanguagePreferencesObserver)init
{
  v9.receiver = self;
  v9.super_class = (Class)ADSystemLanguagePreferencesObserver;
  v2 = [(ADSystemLanguagePreferencesObserver *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("ADSystemLanguagePreferencesObserver", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (AFNotifyObserver *)[objc_alloc((Class)AFNotifyObserver) initWithName:@"AppleLanguagePreferencesChangedNotification" options:0 queue:v2->_queue delegate:v2];
    notifyObserver = v2->_notifyObserver;
    v2->_notifyObserver = v6;
  }
  return v2;
}

+ (id)sharedObserver
{
  if (qword_100585E80 != -1) {
    dispatch_once(&qword_100585E80, &stru_100506AB8);
  }
  v2 = (void *)qword_100585E88;
  return v2;
}

@end