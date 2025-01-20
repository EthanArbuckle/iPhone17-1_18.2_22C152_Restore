@interface ICFXPCServer
@end

@implementation ICFXPCServer

void ____ICFXPCServer_peer_event_handler_block_invoke(uint64_t a1)
{
  IMInsertBoolsToXPCDictionary();
  IMInsertBoolsToXPCDictionary();
  xpc_connection_send_message(*(xpc_connection_t *)(a1 + 40), *(xpc_object_t *)(a1 + 32));
  v2 = *(void **)(a1 + 32);
  xpc_release(v2);
}

@end