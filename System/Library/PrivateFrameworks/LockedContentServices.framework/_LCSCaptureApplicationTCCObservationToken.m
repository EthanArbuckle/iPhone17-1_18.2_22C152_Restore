@interface _LCSCaptureApplicationTCCObservationToken
- (LCSCaptureApplicationTCCObserver)observer;
- (NSSet)bundleIdentifiers;
- (void)invalidate;
- (void)setBundleIdentifiers:(id)a3;
- (void)setObserver:(id)a3;
@end

@implementation _LCSCaptureApplicationTCCObservationToken

- (void)invalidate
{
  id v4 = +[LCSCaptureApplicationTCCMonitor sharedMonitor];
  v3 = [(_LCSCaptureApplicationTCCObservationToken *)self observer];
  [v4 _removeObserver:v3];
}

- (LCSCaptureApplicationTCCObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (LCSCaptureApplicationTCCObserver *)WeakRetained;
}

- (void)setObserver:(id)a3
{
}

- (NSSet)bundleIdentifiers
{
  return self->_bundleIdentifiers;
}

- (void)setBundleIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifiers, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end