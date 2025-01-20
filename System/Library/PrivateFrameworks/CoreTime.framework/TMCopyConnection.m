@interface TMCopyConnection
@end

@implementation TMCopyConnection

xpc_object_t ___TMCopyConnection_block_invoke(uint64_t a1)
{
  uint64_t v2 = _TMCopyConnection_sConnection;
  if (!_TMCopyConnection_sConnection)
  {
    mach_service = *(_xpc_connection_s **)(a1 + 32);
    if (!mach_service)
    {
      if (_TMConnectionQueue_sPred != -1) {
        dispatch_once(&_TMConnectionQueue_sPred, &__block_literal_global_1);
      }
      mach_service = xpc_connection_create_mach_service("com.apple.timed.xpc", (dispatch_queue_t)_TMConnectionQueue_sConnectionQueue, 0);
    }
    _TMCopyConnection_sConnection = (uint64_t)mach_service;
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_4);
    xpc_connection_resume((xpc_connection_t)_TMCopyConnection_sConnection);
    uint64_t v2 = _TMCopyConnection_sConnection;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v2;
  v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  return xpc_retain(v4);
}

void ___TMCopyConnection_block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 != MEMORY[0x1E4F14520])
  {
    if (a2 == MEMORY[0x1E4F14528])
    {
      NSLog(&cfstr_ErrorDaemonCon.isa);
      xpc_release((xpc_object_t)_TMCopyConnection_sConnection);
      _TMCopyConnection_sConnection = 0;
    }
    else
    {
      NSLog(&cfstr_ErrorUnexpecte.isa, a2);
    }
  }
}

@end