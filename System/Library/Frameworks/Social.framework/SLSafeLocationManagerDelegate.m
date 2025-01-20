@interface SLSafeLocationManagerDelegate
- (CLLocationManagerDelegate)delegate;
- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation SLSafeLocationManagerDelegate

- (void)locationManager:(id)a3 didChangeAuthorizationStatus:(int)a4
{
  uint64_t v5 = *(void *)&a4;
  id v8 = a3;
  v7 = [(SLSafeLocationManagerDelegate *)self delegate];
  _SLLog(v4, 7, @"SLSafeLocationManagerDelegate locationManager:didChangeAuthorizationStatus: calling strong delegate %@");
  if (v7 && (objc_opt_respondsToSelector() & 1) != 0) {
    objc_msgSend(v7, "locationManager:didChangeAuthorizationStatus:", v8, v5, v7);
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(SLSafeLocationManagerDelegate *)self delegate];
  _SLLog(v4, 7, @"SLSafeLocationManagerDelegate locationManager:didUpdateLocations: calling strong delegate %@");
  objc_msgSend(v9, "locationManager:didUpdateLocations:", v8, v7, v9);
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [(SLSafeLocationManagerDelegate *)self delegate];
  _SLLog(v4, 7, @"SLSafeLocationManagerDelegate locationManager:didFailWithError: calling strong delegate %@");
  objc_msgSend(v9, "locationManager:didFailWithError:", v8, v7, v9);
}

- (CLLocationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CLLocationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end