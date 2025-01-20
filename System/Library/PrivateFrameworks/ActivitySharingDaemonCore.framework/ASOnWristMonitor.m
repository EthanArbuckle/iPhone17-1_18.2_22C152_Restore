@interface ASOnWristMonitor
- (ASOnWristMonitorDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation ASOnWristMonitor

- (ASOnWristMonitorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ASOnWristMonitorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end