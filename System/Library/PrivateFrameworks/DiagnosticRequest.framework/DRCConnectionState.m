@interface DRCConnectionState
@end

@implementation DRCConnectionState

uint64_t __44___DRCConnectionState_sharedConnectionState__block_invoke()
{
  sharedConnectionState_connectionState_0 = objc_alloc_init(_DRCConnectionState);

  return MEMORY[0x1F41817F8]();
}

void __27___DRCConnectionState_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14528])
  {
    v6 = DPLogHandle_ClientXPCError();
    if (os_signpost_enabled(v6)) {
      _os_signpost_emit_unreliably_with_name_impl();
    }
    goto LABEL_8;
  }
  if (v3 == (id)MEMORY[0x1E4F14520])
  {
    v5 = DPLogHandle_ClientXPCError();
    if (os_signpost_enabled(v5)) {
LABEL_10:
    }
      _os_signpost_emit_unreliably_with_name_impl();
LABEL_11:

    goto LABEL_12;
  }
  if (MEMORY[0x1E0198410](v3) != MEMORY[0x1E4F14590])
  {
    v5 = DPLogHandle_ClientXPCError();
    if (os_signpost_enabled(v5)) {
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (xpc_dictionary_get_uint64(v4, "ServiceMessageType") != 1)
  {
    v5 = DPLogHandle_ClientXPCError();
    if (!os_signpost_enabled(v5)) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
  xpc_dictionary_get_uint64(v4, "RejectionType");
  v7 = DPLogHandle_ClientXPCError();
  if (os_signpost_enabled(v7)) {
    _os_signpost_emit_unreliably_with_name_impl();
  }

  if ([*(id *)(a1 + 32) hasConnection])
  {
    v6 = [*(id *)(a1 + 32) connection];
    xpc_connection_cancel((xpc_connection_t)v6);
LABEL_8:

    [*(id *)(a1 + 32) setConnection:0];
  }
LABEL_12:
}

void __35___DRCConnectionState_sendMessage___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) hasConnection])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v2 = [*(id *)(a1 + 32) connection];
    xpc_connection_send_message(v2, *(xpc_object_t *)(a1 + 40));
  }
}

uint64_t __48___DRCConnectionState_sendMessageWithReplySync___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [*(id *)(a1 + 32) connection];

  return MEMORY[0x1F41817F8]();
}

@end