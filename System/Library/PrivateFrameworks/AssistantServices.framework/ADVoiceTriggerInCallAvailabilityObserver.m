@interface ADVoiceTriggerInCallAvailabilityObserver
+ (id)sharedObserver;
- (ADVoiceTriggerInCallAvailabilityObserver)init;
- (void)_startObserving;
- (void)_stopObserving;
- (void)_voiceTriggerEnabledDidChange;
- (void)addDelegate:(id)a3;
- (void)dealloc;
- (void)notifyDelegates;
- (void)removeDelegate:(id)a3;
@end

@implementation ADVoiceTriggerInCallAvailabilityObserver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_siriLanguage, 0);
}

- (void)dealloc
{
  [(ADVoiceTriggerInCallAvailabilityObserver *)self _stopObserving];
  v3.receiver = self;
  v3.super_class = (Class)ADVoiceTriggerInCallAvailabilityObserver;
  [(ADVoiceTriggerInCallAvailabilityObserver *)&v3 dealloc];
}

- (void)notifyDelegates
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  objc_super v3 = self->_delegates;
  id v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "voiceTriggerInCallAvailabilityChanged:", self->_available, (void)v8);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100311C14;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100311D08;
  v7[3] = &unk_10050E160;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (void)_voiceTriggerEnabledDidChange
{
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100311DDC;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_stopObserving
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)kVTPreferencesVoiceTriggerEnabledDidChangeDarwinNotification;
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);
}

- (void)_startObserving
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v4 = (const __CFString *)kVTPreferencesVoiceTriggerEnabledDidChangeDarwinNotification;
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_100312104, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

- (ADVoiceTriggerInCallAvailabilityObserver)init
{
  v9.receiver = self;
  v9.super_class = (Class)ADVoiceTriggerInCallAvailabilityObserver;
  v2 = [(ADVoiceTriggerInCallAvailabilityObserver *)&v9 init];
  if (v2)
  {
    v2->_available = AFSupportsCallHangUp();
    uint64_t v3 = +[NSHashTable weakObjectsHashTable];
    delegates = v2->_delegates;
    v2->_delegates = (NSHashTable *)v3;

    id v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v6 = dispatch_queue_create("ADVoiceTriggerInCallAvailabilityObserver", v5);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

+ (id)sharedObserver
{
  if (qword_100586390 != -1) {
    dispatch_once(&qword_100586390, &stru_10050BF80);
  }
  v2 = (void *)qword_100586398;
  return v2;
}

@end