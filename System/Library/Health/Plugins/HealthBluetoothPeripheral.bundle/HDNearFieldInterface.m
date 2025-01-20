@interface HDNearFieldInterface
- (BOOL)isFieldDetectSessionInProgress;
- (BOOL)isNdefTagSessionInProgress;
- (BOOL)setFieldDetectEnabled:(BOOL)a3;
- (HDNearFieldInterfaceDelegate)delegate;
- (id)releaseSinglePollExpressModeAssertion;
- (id)startSinglePollExpressModeAssertion:(double)a3;
- (void)setDelegate:(id)a3;
- (void)startFieldDetectSessionWithCompletion:(id)a3;
- (void)startNdefTagSessionWithBluetoothLESecureOOBData:(id)a3 completion:(id)a4;
@end

@implementation HDNearFieldInterface

- (BOOL)setFieldDetectEnabled:(BOOL)a3
{
  return 0;
}

- (void)startFieldDetectSessionWithCompletion:(id)a3
{
}

- (BOOL)isFieldDetectSessionInProgress
{
  return 0;
}

- (void)startNdefTagSessionWithBluetoothLESecureOOBData:(id)a3 completion:(id)a4
{
}

- (BOOL)isNdefTagSessionInProgress
{
  return 0;
}

- (id)startSinglePollExpressModeAssertion:(double)a3
{
  return 0;
}

- (id)releaseSinglePollExpressModeAssertion
{
  return 0;
}

- (HDNearFieldInterfaceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDNearFieldInterfaceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end