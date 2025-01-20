@interface BLTSettingsSendSerializerPassthrough
- (BLTSettingsSendSerializerDelegate)delegate;
- (void)sendNowWithSent:(id)a3 withAcknowledgement:(id)a4 withTimeout:(id)a5;
- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 onlyOneFor:(id)a7 didSend:(id)a8 andResponse:(id)a9 spoolToFile:(BOOL)a10;
- (void)setDelegate:(id)a3;
@end

@implementation BLTSettingsSendSerializerPassthrough

- (void)sendRequest:(id)a3 type:(unsigned __int16)a4 withTimeout:(id)a5 withDescription:(id)a6 onlyOneFor:(id)a7 didSend:(id)a8 andResponse:(id)a9 spoolToFile:(BOOL)a10
{
  uint64_t v14 = a4;
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a3;
  id v23 = [(BLTSettingsSendSerializerPassthrough *)self delegate];
  [v23 sendRequest:v22 type:v14 withTimeout:v21 withDescription:v20 onlyOneFor:v19 didSend:v18 andResponse:v17];
}

- (void)sendNowWithSent:(id)a3 withAcknowledgement:(id)a4 withTimeout:(id)a5
{
  v9 = (void (**)(id, uint64_t, void))a3;
  v7 = (void (**)(void, double))a4;
  id v8 = a5;
  if (v9) {
    v9[2](v9, 1, 0);
  }
  if (v7) {
    v7[2](v7, 1.0);
  }
}

- (BLTSettingsSendSerializerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BLTSettingsSendSerializerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end