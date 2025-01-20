@interface TestFlightServiceHost
@end

@implementation TestFlightServiceHost

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentExtension, 0);
  objc_storeStrong((id *)&self->_runQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_monitor, 0);
}

@end