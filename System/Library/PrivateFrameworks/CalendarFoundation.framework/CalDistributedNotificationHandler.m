@interface CalDistributedNotificationHandler
- (CalDistributedNotificationHandler)initWithObserver:(id)a3 selector:(SEL)a4;
- (id)observer;
- (void)handleNotification:(id)a3;
@end

@implementation CalDistributedNotificationHandler

- (CalDistributedNotificationHandler)initWithObserver:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CalDistributedNotificationHandler;
  v7 = [(CalDistributedNotificationHandler *)&v11 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_observer, v6);
    if (a4) {
      SEL v9 = a4;
    }
    else {
      SEL v9 = 0;
    }
    v8->_selector = v9;
  }

  return v8;
}

- (void)handleNotification:(id)a3
{
  id v12 = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_observer);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    SEL selector = self->_selector;
    p_SEL selector = &self->_selector;
    SEL v6 = selector;
    if (selector) {
      SEL v9 = v6;
    }
    else {
      SEL v9 = 0;
    }
    v10 = (void (*)(void *, SEL, id))[WeakRetained methodForSelector:v9];
    if (*p_selector) {
      SEL v11 = *p_selector;
    }
    else {
      SEL v11 = 0;
    }
    v10(v5, v11, v12);
  }
}

- (id)observer
{
  id WeakRetained = objc_loadWeakRetained(&self->_observer);

  return WeakRetained;
}

- (void).cxx_destruct
{
}

@end