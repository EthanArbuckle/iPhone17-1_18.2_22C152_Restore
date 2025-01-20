@interface _HDHealthServiceConnectionInfo
@end

@implementation _HDHealthServiceConnectionInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_peripheralUUID, 0);
  objc_storeStrong((id *)&self->_autoPairData, 0);
  objc_storeStrong(&self->_mfaSuccessHandler, 0);
  objc_storeStrong(&self->_characteristicsHandler, 0);
  objc_storeStrong(&self->_dataHandler, 0);

  objc_storeStrong(&self->_sessionHandler, 0);
}

@end