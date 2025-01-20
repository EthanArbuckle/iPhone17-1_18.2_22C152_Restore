@interface MuxNotificationSink
- (MuxNotificationSinkDelegate)delegate;
- (id)methodSignatureForSelector:(SEL)a3;
- (void)clientDidTriggerFault:(id)a3;
- (void)forwardInvocation:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MuxNotificationSink

- (id)methodSignatureForSelector:(SEL)a3
{
  v4 = (BOOL *)&-[MuxNotificationSink methodSignatureForSelector:]::opts;
  while (1)
  {
    objc_method_description MethodDescription = protocol_getMethodDescription((Protocol *)&unk_1ED021AE0, a3, *v4, v4[1]);
    if (MethodDescription.name) {
      break;
    }
    v4 += 2;
    {
      v6 = 0;
      goto LABEL_6;
    }
  }
  v6 = [MEMORY[0x1E4F1CA38] signatureWithObjCTypes:MethodDescription.types];
LABEL_6:

  return v6;
}

- (void)forwardInvocation:(id)a3
{
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_delegate);
    [v5 sink:self handleNotification:v6];
  }
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)clientDidTriggerFault:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_18444A000, v0, OS_LOG_TYPE_FAULT, "Fault detected: %@", v1, 0xCu);
}

- (void)clientDidTriggerFault:(id)a3
{
  id v3 = a3;
  v4 = CTLogClient();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
    -[MuxNotificationSink clientDidTriggerFault:]();
  }
}

- (MuxNotificationSinkDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MuxNotificationSinkDelegate *)WeakRetained;
}

@end