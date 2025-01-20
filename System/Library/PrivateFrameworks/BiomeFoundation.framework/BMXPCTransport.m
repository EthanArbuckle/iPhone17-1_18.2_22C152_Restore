@interface BMXPCTransport
@end

@implementation BMXPCTransport

void __32___BMXPCTransport__handleEvent___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  v3 = [*(id *)(a1 + 32) queue];
  dispatch_assert_queue_V2(v3);

  if (MEMORY[0x1B3EB6010](xdict) == MEMORY[0x1E4F145A8])
  {
    uint64_t v7 = [*(id *)(a1 + 32) errorHandler];
    v4 = (void (**)(void, void, void))v7;
    if (v7) {
      (*(void (**)(uint64_t, xpc_object_t))(v7 + 16))(v7, xdict);
    }
  }
  else
  {
    if (MEMORY[0x1B3EB6010](xdict) != MEMORY[0x1E4F14590]) {
      goto LABEL_11;
    }
    v4 = [*(id *)(a1 + 32) messageHandler];
    if (v4)
    {
      v5 = xpc_dictionary_get_dictionary(xdict, "bm_info");
      if (v5)
      {
        v6 = (void *)_CFXPCCreateCFObjectFromXPCObject();
        [*(id *)(a1 + 32) setRemoteUserInfo:v6];
      }
      else
      {
        [*(id *)(a1 + 32) setRemoteUserInfo:MEMORY[0x1E4F1CC08]];
      }
      xpc_object_t reply = xpc_dictionary_create_reply(xdict);
      ((void (**)(void, xpc_object_t, xpc_object_t))v4)[2](v4, xdict, reply);
    }
  }

LABEL_11:
}

@end