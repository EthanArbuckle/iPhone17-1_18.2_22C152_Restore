@interface DRCTaskingConnectionState
@end

@implementation DRCTaskingConnectionState

uint64_t __51___DRCTaskingConnectionState_sharedConnectionState__block_invoke()
{
  sharedConnectionState_connectionState = objc_alloc_init(_DRCTaskingConnectionState);

  return MEMORY[0x1F41817F8]();
}

void __34___DRCTaskingConnectionState_init__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = v3;
  if (v3 == (id)MEMORY[0x1E4F14528])
  {
    v8 = DPLogHandle_ClientTaskingXPCError();
    if (os_signpost_enabled(v8))
    {
      LOWORD(v11) = 0;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v8, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "TaskingConnectionInvalid", "Invalid service connection", (uint8_t *)&v11, 2u);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  }
  else
  {
    if (v3 == (id)MEMORY[0x1E4F14520])
    {
      v5 = DPLogHandle_ClientTaskingXPCError();
      if (os_signpost_enabled(v5))
      {
        LOWORD(v11) = 0;
        v6 = "TaskingConnectionInterrupted";
        v7 = "Service connection interrupted";
        goto LABEL_11;
      }
LABEL_12:

      goto LABEL_13;
    }
    if (MEMORY[0x1E0198410](v3) != MEMORY[0x1E4F14590])
    {
      v5 = DPLogHandle_ClientTaskingXPCError();
      if (os_signpost_enabled(v5))
      {
        LOWORD(v11) = 0;
        v6 = "UnexpectedTaskingMessageObjectType";
        v7 = "Unexpected object type from the service";
LABEL_11:
        _os_signpost_emit_with_name_impl(&dword_1DC01F000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v6, v7, (uint8_t *)&v11, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
    v9 = (void *)MEMORY[0x1E0198330](v4);
    v10 = DPLogHandle_ClientTaskingXPCError();
    if (os_signpost_enabled(v10))
    {
      int v11 = 136446210;
      v12 = v9;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ReceivedUnexpectedServiceMessage", "Received an unexpected standalone message from the service: %{public}s", (uint8_t *)&v11, 0xCu);
    }

    if (v9) {
      free(v9);
    }
  }
LABEL_13:
}

void __42___DRCTaskingConnectionState_sendMessage___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) isClosed] & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    v2 = [*(id *)(a1 + 32) connection];
    xpc_connection_send_message(v2, *(xpc_object_t *)(a1 + 40));
  }
}

uint64_t __55___DRCTaskingConnectionState_sendMessageWithReplySync___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isClosed];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

@end