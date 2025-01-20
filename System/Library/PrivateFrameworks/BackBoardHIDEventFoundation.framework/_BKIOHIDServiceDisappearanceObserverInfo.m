@interface _BKIOHIDServiceDisappearanceObserverInfo
@end

@implementation _BKIOHIDServiceDisappearanceObserverInfo

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_queue);

  objc_destroyWeak((id *)&self->_observer);
}

@end