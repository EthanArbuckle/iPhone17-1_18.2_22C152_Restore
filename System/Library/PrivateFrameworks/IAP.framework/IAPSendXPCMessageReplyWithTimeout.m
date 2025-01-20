@interface IAPSendXPCMessageReplyWithTimeout
@end

@implementation IAPSendXPCMessageReplyWithTimeout

intptr_t ___IAPSendXPCMessageReplyWithTimeout_block_invoke(uint64_t a1, uint64_t a2)
{
  string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "requestType");
  v5 = "unknown";
  if (string) {
    v6 = string;
  }
  else {
    v6 = "unknown";
  }
  uint64_t v7 = *(void *)(a1 + 40);
  if (v7 == __iapd_connection)
  {
    v5 = "iapd";
  }
  else if (v7 == __iap2d_connection)
  {
    v5 = "iap2d";
  }
  else if (v7 == __iaptransportd_connection)
  {
    v5 = "iaptransportd";
  }
  NSLog(&cfstr_SGotReplyForXp.isa, "_IAPSendXPCMessageReplyWithTimeout_block_invoke", v6, v5);
  uint64_t v8 = *(void *)(a1 + 56);
  if (v8) {
    (*(void (**)(uint64_t, uint64_t))(v8 + 16))(v8, a2);
  }
  v9 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v9);
}

@end