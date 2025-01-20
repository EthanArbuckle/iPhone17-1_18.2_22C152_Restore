@interface BKSMousePointerPreferencesObserverInfo
- (BKSMousePointerPreferencesObserver)observer;
- (void)setObserver:(id)a3;
@end

@implementation BKSMousePointerPreferencesObserverInfo

- (void).cxx_destruct
{
}

- (void)setObserver:(id)a3
{
}

- (BKSMousePointerPreferencesObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (BKSMousePointerPreferencesObserver *)WeakRetained;
}

@end