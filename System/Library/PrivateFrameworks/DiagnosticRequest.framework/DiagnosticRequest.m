void sub_1DC0203E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id DPLogHandle_ConfigMonitor()
{
  if (DPLogHandle_ConfigMonitor_onceToken != -1) {
    dispatch_once(&DPLogHandle_ConfigMonitor_onceToken, &__block_literal_global_150);
  }
  v0 = (void *)DPLogHandle_ConfigMonitor_handle;

  return v0;
}

void sub_1DC020970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC020C38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id DPLogHandle_ConfigMonitorError()
{
  if (DPLogHandle_ConfigMonitorError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ConfigMonitorError_onceToken, &__block_literal_global_153);
  }
  v0 = (void *)DPLogHandle_ConfigMonitorError_handle;

  return v0;
}

uint64_t DRValidateCKRecordDictionary(void *a1, void *a2)
{
  v52[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (![v3 count])
  {
    if (a2)
    {
      v17 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v51 = *MEMORY[0x1E4F28568];
      v52[0] = @"'recordDictionary' is nil or empty";
      v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
      [v17 errorWithDomain:@"MalformedCKRecordDictionaryError" code:0 userInfo:v4];
      uint64_t v16 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_30;
    }
    uint64_t v16 = 0;
    goto LABEL_31;
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v4 = [v3 allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v39 objects:v50 count:16];
  if (!v5)
  {
    uint64_t v16 = 1;
    goto LABEL_30;
  }
  uint64_t v6 = v5;
  v33 = a2;
  v34 = v4;
  uint64_t v7 = *(void *)v40;
  uint64_t v32 = *(void *)v40;
  while (2)
  {
    for (uint64_t i = 0; i != v6; ++i)
    {
      if (*(void *)v40 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void *)(*((void *)&v39 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v33)
        {
          v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v48 = *MEMORY[0x1E4F28568];
          v49 = @"'recordDictionary' has a non-NSString key";
          id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v49 forKeys:&v48 count:1];
          void *v33 = [v25 errorWithDomain:@"MalformedCKRecordDictionaryError" code:0 userInfo:v11];
          goto LABEL_27;
        }
LABEL_28:
        uint64_t v16 = 0;
        goto LABEL_30;
      }
      v10 = [v3 objectForKeyedSubscript:v9];
      if (_isSupportedRecordDictionaryValueType(v10)) {
        goto LABEL_19;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if (v33)
        {
          v26 = NSString;
          v27 = (objc_class *)objc_opt_class();
          v28 = NSStringFromClass(v27);
          v29 = [v26 stringWithFormat:@"'recordDictionary' value of type '%@' for key '%@' is not allowed", v28, v9];

          v30 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v43 = *MEMORY[0x1E4F28568];
          v44 = v29;
          v31 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v44 forKeys:&v43 count:1];
          void *v33 = [v30 errorWithDomain:@"MalformedCKRecordDictionaryError" code:0 userInfo:v31];
        }
        id v11 = v10;
LABEL_27:

        goto LABEL_28;
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v47 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v36;
        while (2)
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v36 != v14) {
              objc_enumerationMutation(v11);
            }
            if ((_isSupportedRecordDictionaryValueType(*(void **)(*((void *)&v35 + 1) + 8 * j)) & 1) == 0)
            {
              if (v33)
              {
                v18 = NSString;
                v19 = (objc_class *)objc_opt_class();
                v20 = NSStringFromClass(v19);
                v21 = [v18 stringWithFormat:@"'recordDictionary' value of type '%@' for array with key '%@' is not allowed", v20, v9];

                v22 = (void *)MEMORY[0x1E4F28C58];
                uint64_t v45 = *MEMORY[0x1E4F28568];
                v46 = v21;
                v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
                void *v33 = [v22 errorWithDomain:@"MalformedCKRecordDictionaryError" code:0 userInfo:v23];
              }
              v4 = v34;
              goto LABEL_27;
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v47 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }

      v4 = v34;
      uint64_t v7 = v32;
LABEL_19:
    }
    uint64_t v6 = [v4 countByEnumeratingWithState:&v39 objects:v50 count:16];
    uint64_t v16 = 1;
    if (v6) {
      continue;
    }
    break;
  }
LABEL_30:

LABEL_31:
  return v16;
}

uint64_t _isSupportedRecordDictionaryValueType(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char isKindOfClass = 1;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }

  return isKindOfClass & 1;
}

void _DRCTaskingConnectionStateFinalizer(void *a1)
{
  v2 = DPLogHandle_ClientXPC();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    _DRCTaskingConnectionStateFinalizer_cold_1(v2);
  }

  if (a1) {
    [a1 cleanupState];
  }
}

void sub_1DC021EFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _DPCSendTaskingSystemJSONDataMessage(void *a1, BOOL a2, void *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v6, "TaskingClientMessageType", 1uLL);
  id v7 = v5;
  v8 = (const void *)[v7 bytes];
  size_t v9 = [v7 length];

  xpc_dictionary_set_data(v6, "JSONData", v8, v9);
  xpc_dictionary_set_BOOL(v6, "emitCATelemetry", a2);
  v10 = _replyObjectForRequestMessage(v6, a3);
  id v11 = v10;
  if (v10)
  {
    if (xpc_dictionary_get_uint64(v10, "TaskingServiceReplyType") == 1)
    {
      string = xpc_dictionary_get_string(v11, "TaskingAdminRequest_RejectionReason");
      if (!string)
      {
        v17 = DPLogHandle_ClientTaskingXPC();
        if (os_signpost_enabled(v17))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1DC01F000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "JSONMessageRequestSucceeded", (const char *)&unk_1DC03206D, buf, 2u);
        }
        uint64_t v19 = 1;
        goto LABEL_16;
      }
      uint64_t v13 = string;
      uint64_t v14 = DPLogHandle_ClientTaskingXPCError();
      if (os_signpost_enabled(v14))
      {
        *(_DWORD *)buf = 136446210;
        v29 = v13;
        _os_signpost_emit_with_name_impl(&dword_1DC01F000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "JSONMessageRequestFailed", "Failed due to reason: %{public}s", buf, 0xCu);
      }

      if (a3)
      {
        v15 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v16 = kDRTaskingClientError;
        uint64_t v26 = *MEMORY[0x1E4F28568];
        v17 = [NSString stringWithUTF8String:v13];
        v27 = v17;
        v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
        *a3 = [v15 errorWithDomain:v16 code:0 userInfo:v18];

        uint64_t v19 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      v20 = DPLogHandle_ClientTaskingXPCError();
      if (os_signpost_enabled(v20))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DC01F000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidJSONMessageReply", "Received an invalid reply for a JSON message from the tasking service", buf, 2u);
      }

      if (a3)
      {
        v21 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v22 = kDRTaskingClientError;
        uint64_t v24 = *MEMORY[0x1E4F28568];
        v25 = @"Invalid tasking service reply";
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
        [v21 errorWithDomain:v22 code:0 userInfo:v17];
        uint64_t v19 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_16;
      }
    }
  }
  uint64_t v19 = 0;
LABEL_17:

  return v19;
}

void *_replyObjectForRequestMessage(void *a1, void *a2)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  v4 = +[_DRCTaskingConnectionState sharedConnectionState];
  id v5 = [v4 sendMessageWithReplySync:v3];

  if (v5 && MEMORY[0x1E0198410](v5) == MEMORY[0x1E4F14590])
  {
    a2 = v5;
  }
  else
  {
    xpc_object_t v6 = DPLogHandle_ClientTaskingXPCError();
    if (os_signpost_enabled(v6))
    {
      *(_WORD *)id v11 = 0;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v6, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidTaskingServiceReply", "Invalid message type from tasking service. May be an invalid/closed connection", v11, 2u);
    }

    if (a2)
    {
      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = kDRTaskingClientError;
      uint64_t v12 = *MEMORY[0x1E4F28568];
      v13[0] = @"Invalid tasking service reply";
      size_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
      *a2 = [v7 errorWithDomain:v8 code:0 userInfo:v9];

      a2 = 0;
    }
  }

  return a2;
}

uint64_t _DPCGetConfigStateForUUID(void *a1, void *a2, uint64_t *a3, void *a4)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a1;
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "TaskingClientMessageType", 2uLL);
  id v10 = v8;
  id v11 = (const char *)[v10 UTF8String];

  xpc_dictionary_set_string(v9, "teamID", v11);
  uint64_t v12 = [v7 UUIDString];

  id v13 = v12;
  xpc_dictionary_set_string(v9, "configUUID", (const char *)[v13 UTF8String]);

  *a3 = 0;
  uint64_t v14 = _replyObjectForRequestMessage(v9, a4);
  v15 = v14;
  if (!v14) {
    goto LABEL_14;
  }
  if (xpc_dictionary_get_uint64(v14, "TaskingServiceReplyType") == 2)
  {
    string = xpc_dictionary_get_string(v15, "TaskingAdminRequest_RejectionReason");
    if (!string)
    {
      *a3 = xpc_dictionary_get_uint64(v15, "completionType");
      LOBYTE(a4) = xpc_dictionary_get_uint64(v15, "configState");
      goto LABEL_15;
    }
    v17 = string;
    v18 = DPLogHandle_ClientTaskingXPCError();
    if (os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 136446210;
      v34 = v17;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigStateQueryFailed", "Failed due to reason: %{public}s", buf, 0xCu);
    }

    if (a4)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = kDRTaskingClientError;
      uint64_t v31 = *MEMORY[0x1E4F28568];
      v21 = [NSString stringWithUTF8String:v17];
      uint64_t v32 = v21;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      *a4 = [v19 errorWithDomain:v20 code:0 userInfo:v22];

LABEL_14:
      LOBYTE(a4) = 0;
    }
  }
  else
  {
    v23 = (char *)MEMORY[0x1E0198330](v15);
    uint64_t v24 = DPLogHandle_ClientTaskingXPCError();
    if (os_signpost_enabled(v24))
    {
      *(_DWORD *)buf = 136446210;
      v34 = v23;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v24, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidGetConfigStateReply", "Received an invalid reply a config state request from the tasking service: %{public}s", buf, 0xCu);
    }

    if (v23) {
      free(v23);
    }
    if (a4)
    {
      v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v26 = kDRTaskingClientError;
      uint64_t v29 = *MEMORY[0x1E4F28568];
      uint64_t v30 = @"Invalid tasking service reply";
      v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
      *a4 = [v25 errorWithDomain:v26 code:0 userInfo:v27];

      goto LABEL_14;
    }
  }
LABEL_15:

  return a4;
}

uint64_t _DPCSendClearTaskingStateMessage(void *a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "TaskingClientMessageType", 3uLL);
  id v3 = _replyObjectForRequestMessage(v2, a1);
  v4 = v3;
  if (!v3)
  {
    if (!a1) {
      goto LABEL_15;
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = kDRTaskingClientError;
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"Invalid tasking service reply";
    v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = (__CFString **)v27;
    v17 = &v26;
LABEL_14:
    id v10 = objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1, v20, v21);
    [v13 errorWithDomain:v14 code:0 userInfo:v10];
    uint64_t v12 = 0;
    *a1 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (xpc_dictionary_get_uint64(v3, "TaskingServiceReplyType") != 3)
  {
    v18 = DPLogHandle_ClientTaskingXPCError();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidClearTaskingStateMessageReply", "Received an invalid reply for a clear tasking state message from the tasking service", buf, 2u);
    }

    if (!a1) {
      goto LABEL_15;
    }
    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = kDRTaskingClientError;
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21 = @"Invalid tasking service reply";
    v15 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v16 = &v21;
    v17 = &v20;
    goto LABEL_14;
  }
  string = xpc_dictionary_get_string(v4, "TaskingAdminRequest_RejectionReason");
  if (!string)
  {
    id v10 = DPLogHandle_ClientTaskingXPC();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearTaskingStateRequestSucceeded", (const char *)&unk_1DC03206D, buf, 2u);
    }
    uint64_t v12 = 1;
    goto LABEL_19;
  }
  xpc_object_t v6 = string;
  id v7 = DPLogHandle_ClientTaskingXPCError();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 136446210;
    v25 = v6;
    _os_signpost_emit_with_name_impl(&dword_1DC01F000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ClearTaskingStateRequestFailed", "Failed due to reason: %{public}s", buf, 0xCu);
  }

  if (a1)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = kDRTaskingClientError;
    uint64_t v22 = *MEMORY[0x1E4F28568];
    id v10 = [NSString stringWithUTF8String:v6];
    v23 = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    *a1 = [v8 errorWithDomain:v9 code:0 userInfo:v11];

    uint64_t v12 = 0;
LABEL_19:

    goto LABEL_20;
  }
LABEL_15:
  uint64_t v12 = 0;
LABEL_20:

  return v12;
}

uint64_t _DPCMarkConfigUUIDCompletedOrRejected(void *a1, void *a2, int a3, void *a4)
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a1;
  xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "TaskingClientMessageType", 4uLL);
  id v10 = v8;
  id v11 = (const char *)[v10 UTF8String];

  xpc_dictionary_set_string(v9, "teamID", v11);
  id v12 = [v7 UUIDString];
  xpc_dictionary_set_string(v9, "configUUID", (const char *)[v12 UTF8String]);

  if (a3) {
    xpc_dictionary_set_BOOL(v9, "isRejected", 1);
  }
  id v13 = _replyObjectForRequestMessage(v9, a4);
  uint64_t v14 = v13;
  if (!v13)
  {
    if (!a4) {
      goto LABEL_21;
    }
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = kDRTaskingClientError;
    uint64_t v43 = *MEMORY[0x1E4F28568];
    v44[0] = @"Invalid tasking service reply";
    uint64_t v26 = (void *)MEMORY[0x1E4F1C9E8];
    v27 = (__CFString **)v44;
    v28 = &v43;
LABEL_20:
    v21 = objc_msgSend(v26, "dictionaryWithObjects:forKeys:count:", v27, v28, 1, v33, v34);
    [v24 errorWithDomain:v25 code:0 userInfo:v21];
    uint64_t v23 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_27;
  }
  if (xpc_dictionary_get_uint64(v13, "TaskingServiceReplyType") != 4)
  {
    uint64_t v29 = DPLogHandle_ClientTaskingXPCError();
    if (os_signpost_enabled(v29))
    {
      uint64_t v30 = @"completed";
      if (a3) {
        uint64_t v30 = @"rejected";
      }
      *(_DWORD *)buf = 138543618;
      id v38 = v7;
      __int16 v39 = 2114;
      long long v40 = v30;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v29, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidConfigCompletionMessageReply", "Received an invalid reply for marking config %{public}@ %{public}@ message from the tasking service", buf, 0x16u);
    }

    if (!a4) {
      goto LABEL_21;
    }
    uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = kDRTaskingClientError;
    uint64_t v33 = *MEMORY[0x1E4F28568];
    v34 = @"Invalid tasking service reply";
    uint64_t v26 = (void *)MEMORY[0x1E4F1C9E8];
    v27 = &v34;
    v28 = &v33;
    goto LABEL_20;
  }
  string = xpc_dictionary_get_string(v14, "TaskingAdminRequest_RejectionReason");
  if (!string)
  {
    v21 = DPLogHandle_ClientTaskingXPC();
    if (os_signpost_enabled(v21))
    {
      uint64_t v31 = @"completed";
      if (a3) {
        uint64_t v31 = @"rejected";
      }
      *(_DWORD *)buf = 138543618;
      id v38 = v7;
      __int16 v39 = 2114;
      long long v40 = v31;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigCompletionSucceeded", "Config %{public}@ marked %{public}@", buf, 0x16u);
    }
    uint64_t v23 = 1;
    goto LABEL_27;
  }
  uint64_t v16 = string;
  v17 = DPLogHandle_ClientTaskingXPCError();
  if (os_signpost_enabled(v17))
  {
    v18 = @"completed";
    *(_DWORD *)buf = 138543874;
    id v38 = v7;
    if (a3) {
      v18 = @"rejected";
    }
    __int16 v39 = 2114;
    long long v40 = v18;
    __int16 v41 = 2082;
    long long v42 = v16;
    _os_signpost_emit_with_name_impl(&dword_1DC01F000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ConfigCompletionFailed", "Failed to mark config %{public}@ %{public}@ due to reason: %{public}s", buf, 0x20u);
  }

  if (a4)
  {
    uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = kDRTaskingClientError;
    uint64_t v35 = *MEMORY[0x1E4F28568];
    v21 = [NSString stringWithUTF8String:v16];
    long long v36 = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    *a4 = [v19 errorWithDomain:v20 code:0 userInfo:v22];

    uint64_t v23 = 0;
LABEL_27:

    goto LABEL_28;
  }
LABEL_21:
  uint64_t v23 = 0;
LABEL_28:

  return v23;
}

uint64_t _DPCRequestTeamIDBroadcast(void *a1, void *a2)
{
  v31[1] = *MEMORY[0x1E4F143B8];
  if (a2) {
    *a2 = 0;
  }
  id v3 = a1;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v4, "TaskingClientMessageType", 5uLL);
  id v5 = v3;
  xpc_object_t v6 = (const char *)[v5 UTF8String];

  xpc_dictionary_set_string(v4, "teamID", v6);
  id v7 = _replyObjectForRequestMessage(v4, a2);
  id v8 = v7;
  if (!v7)
  {
    if (!a2) {
      goto LABEL_17;
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = kDRTaskingClientError;
    uint64_t v30 = *MEMORY[0x1E4F28568];
    v31[0] = @"Invalid tasking service reply";
    uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v20 = (__CFString **)v31;
    v21 = &v30;
LABEL_16:
    uint64_t v14 = objc_msgSend(v19, "dictionaryWithObjects:forKeys:count:", v20, v21, 1, v24, v25);
    [v17 errorWithDomain:v18 code:0 userInfo:v14];
    uint64_t v16 = 0;
    *a2 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (xpc_dictionary_get_uint64(v7, "TaskingServiceReplyType") != 5)
  {
    uint64_t v22 = DPLogHandle_ClientTaskingXPCError();
    if (os_signpost_enabled(v22))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidBroadcastRequestMessageReply", "Received an invalid reply for a broadcast request message from the tasking service", buf, 2u);
    }

    if (!a2) {
      goto LABEL_17;
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = kDRTaskingClientError;
    uint64_t v24 = *MEMORY[0x1E4F28568];
    uint64_t v25 = @"Invalid tasking service reply";
    uint64_t v19 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v20 = &v25;
    v21 = &v24;
    goto LABEL_16;
  }
  string = xpc_dictionary_get_string(v8, "TaskingAdminRequest_RejectionReason");
  if (!string)
  {
    uint64_t v14 = DPLogHandle_ClientTaskingXPC();
    if (os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v14, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BroadcastRequestSucceeded", (const char *)&unk_1DC03206D, buf, 2u);
    }
    uint64_t v16 = 1;
    goto LABEL_21;
  }
  id v10 = string;
  id v11 = DPLogHandle_ClientTaskingXPCError();
  if (os_signpost_enabled(v11))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v29 = v10;
    _os_signpost_emit_with_name_impl(&dword_1DC01F000, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "BroadcastRequestFailed", "Failed due to reason: %{public}s", buf, 0xCu);
  }

  if (a2)
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = kDRTaskingClientError;
    uint64_t v26 = *MEMORY[0x1E4F28568];
    uint64_t v14 = [NSString stringWithUTF8String:v10];
    v27 = v14;
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
    *a2 = [v12 errorWithDomain:v13 code:0 userInfo:v15];

    uint64_t v16 = 0;
LABEL_21:

    goto LABEL_22;
  }
LABEL_17:
  uint64_t v16 = 0;
LABEL_22:

  return v16;
}

char *_DPCGetCloudChannelConfig(BOOL *a1, unsigned char *a2, unsigned char *a3, unsigned char *a4, BOOL *a5, BOOL *a6, void *a7, char *a8)
{
  id v8 = a8;
  v52[1] = *MEMORY[0x1E4F143B8];
  if (a8) {
    *(void *)a8 = 0;
  }
  *a1 = 0;
  *a2 = 0;
  *a3 = 0;
  *a4 = 0;
  *a6 = 0;
  *a7 = 0;
  *a5 = 0;
  xpc_object_t v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v16, "TaskingClientMessageType", 6uLL);
  v17 = _replyObjectForRequestMessage(v16, v8);
  uint64_t uint64 = xpc_dictionary_get_uint64(v17, "TaskingServiceReplyType");
  if (v17)
  {
    xpc_object_t v42 = v16;
    if (uint64 == 6)
    {
      string = xpc_dictionary_get_string(v17, "TaskingAdminRequest_RejectionReason");
      if (string)
      {
        uint64_t v20 = string;
        v21 = DPLogHandle_ClientTaskingXPCError();
        if (os_signpost_enabled(v21))
        {
          *(_DWORD *)buf = 136446210;
          uint64_t v48 = v20;
          _os_signpost_emit_with_name_impl(&dword_1DC01F000, v21, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetCloudChannelConfigFailed", "Failed due to reason: %{public}s", buf, 0xCu);
        }

        if (!v8) {
          goto LABEL_18;
        }
        uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v23 = kDRTaskingClientError;
        uint64_t v45 = *MEMORY[0x1E4F28568];
        uint64_t v24 = [NSString stringWithUTF8String:v20];
        v46 = v24;
        uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
        *(void *)id v8 = [v22 errorWithDomain:v23 code:0 userInfo:v25];

        goto LABEL_17;
      }
      __int16 v39 = xpc_dictionary_get_string(v17, "description");
      if (v39)
      {
        id v8 = [NSString stringWithUTF8String:v39];
        long long v40 = DPLogHandle_ClientTaskingXPC();
        if (os_signpost_enabled(v40))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v48 = v8;
          _os_signpost_emit_with_name_impl(&dword_1DC01F000, v40, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "GetCloudChannelConfigSucceeded", "CloudChannel description: %{public}@", buf, 0xCu);
        }

        *a2 = xpc_dictionary_get_uint64(v17, "platform");
        *a3 = xpc_dictionary_get_uint64(v17, "type");
        *a4 = xpc_dictionary_get_uint64(v17, "environment");
        *a5 = xpc_dictionary_get_BOOL(v17, "overridesDeviceDefault");
        *a1 = xpc_dictionary_get_BOOL(v17, "hasConfig");
        *a6 = xpc_dictionary_get_BOOL(v17, "dropsMessages");
        __int16 v41 = xpc_dictionary_get_value(v17, "populationSliceNumber");

        if (v41)
        {
          objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", xpc_dictionary_get_uint64(v17, "populationSliceNumber"));
          *a7 = (id)objc_claimAutoreleasedReturnValue();
        }
        goto LABEL_18;
      }
      if (!v8)
      {
LABEL_18:
        xpc_object_t v16 = v42;
        goto LABEL_19;
      }
      uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = kDRTaskingClientError;
      uint64_t v49 = *MEMORY[0x1E4F28568];
      v50 = @"Invalid tasking service reply";
      v34 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v35 = &v50;
      long long v36 = &v49;
    }
    else
    {
      uint64_t v31 = DPLogHandle_ClientTaskingXPCError();
      if (os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1DC01F000, v31, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidGetCloudChannelConfigReply", "Received an invalid reply for a cloud channel config request message from the tasking service", buf, 2u);
      }

      if (!v8) {
        goto LABEL_18;
      }
      uint64_t v32 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v33 = kDRTaskingClientError;
      uint64_t v43 = *MEMORY[0x1E4F28568];
      v44 = @"Invalid tasking service reply";
      v34 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v35 = &v44;
      long long v36 = &v43;
    }
    long long v37 = [v34 dictionaryWithObjects:v35 forKeys:v36 count:1];
    *(void *)id v8 = [v32 errorWithDomain:v33 code:0 userInfo:v37];

LABEL_17:
    id v8 = 0;
    goto LABEL_18;
  }
  if (v8)
  {
    xpc_object_t v26 = v16;
    v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = kDRTaskingClientError;
    uint64_t v51 = *MEMORY[0x1E4F28568];
    v52[0] = @"Invalid tasking service reply";
    uint64_t v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:&v51 count:1];
    uint64_t v30 = v27;
    xpc_object_t v16 = v26;
    *(void *)id v8 = [v30 errorWithDomain:v28 code:0 userInfo:v29];

    id v8 = 0;
  }
LABEL_19:

  return v8;
}

uint64_t _DPCSetCloudChannelConfig(unsigned int a1, unsigned int a2, unsigned int a3, int a4, void *a5, void *a6)
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  if (a6) {
    *a6 = 0;
  }
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v12, "TaskingClientMessageType", 7uLL);
  if (a4)
  {
    xpc_dictionary_set_BOOL(v12, "noSubscription", 1);
  }
  else
  {
    xpc_dictionary_set_uint64(v12, "platform", a1);
    xpc_dictionary_set_uint64(v12, "type", a2);
    xpc_dictionary_set_uint64(v12, "environment", a3);
    if (v11) {
      xpc_dictionary_set_uint64(v12, "populationSliceNumber", [v11 unsignedLongLongValue]);
    }
  }
  uint64_t v13 = _replyObjectForRequestMessage(v12, a6);
  uint64_t v14 = v13;
  if (!v13)
  {
    if (!a6) {
      goto LABEL_21;
    }
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = kDRTaskingClientError;
    uint64_t v36 = *MEMORY[0x1E4F28568];
    v37[0] = @"Invalid tasking service reply";
    uint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
    xpc_object_t v26 = (__CFString **)v37;
    v27 = &v36;
LABEL_20:
    uint64_t v20 = objc_msgSend(v25, "dictionaryWithObjects:forKeys:count:", v26, v27, 1, v30, v31);
    [v23 errorWithDomain:v24 code:0 userInfo:v20];
    uint64_t v22 = 0;
    *a6 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_25;
  }
  if (xpc_dictionary_get_uint64(v13, "TaskingServiceReplyType") != 7)
  {
    uint64_t v28 = DPLogHandle_ClientTaskingXPCError();
    if (os_signpost_enabled(v28))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v28, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidSetCloudChannelConfigReply", "Received an invalid reply for a set cloud channel config message from the tasking service", buf, 2u);
    }

    if (!a6) {
      goto LABEL_21;
    }
    uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = kDRTaskingClientError;
    uint64_t v30 = *MEMORY[0x1E4F28568];
    uint64_t v31 = @"Invalid tasking service reply";
    uint64_t v25 = (void *)MEMORY[0x1E4F1C9E8];
    xpc_object_t v26 = &v31;
    v27 = &v30;
    goto LABEL_20;
  }
  string = xpc_dictionary_get_string(v14, "TaskingAdminRequest_RejectionReason");
  if (!string)
  {
    uint64_t v20 = DPLogHandle_ClientTaskingXPC();
    if (os_signpost_enabled(v20))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetCloudChannelConfigSucceeded", (const char *)&unk_1DC03206D, buf, 2u);
    }
    uint64_t v22 = 1;
    goto LABEL_25;
  }
  xpc_object_t v16 = string;
  v17 = DPLogHandle_ClientTaskingXPCError();
  if (os_signpost_enabled(v17))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v35 = v16;
    _os_signpost_emit_with_name_impl(&dword_1DC01F000, v17, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SetCloudChannelConfigFailed", "Failed due to reason: %{public}s", buf, 0xCu);
  }

  if (a6)
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v19 = kDRTaskingClientError;
    uint64_t v32 = *MEMORY[0x1E4F28568];
    uint64_t v20 = [NSString stringWithUTF8String:v16];
    uint64_t v33 = v20;
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    *a6 = [v18 errorWithDomain:v19 code:0 userInfo:v21];

    uint64_t v22 = 0;
LABEL_25:

    goto LABEL_26;
  }
LABEL_21:
  uint64_t v22 = 0;
LABEL_26:

  return v22;
}

uint64_t _DPCResetToDefaultCloudChannelConfig(void *a1)
{
  v27[1] = *MEMORY[0x1E4F143B8];
  if (a1) {
    *a1 = 0;
  }
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "TaskingClientMessageType", 8uLL);
  id v3 = _replyObjectForRequestMessage(v2, a1);
  xpc_object_t v4 = v3;
  if (!v3)
  {
    if (!a1) {
      goto LABEL_17;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = kDRTaskingClientError;
    uint64_t v26 = *MEMORY[0x1E4F28568];
    v27[0] = @"Invalid tasking service reply";
    v15 = (void *)MEMORY[0x1E4F1C9E8];
    xpc_object_t v16 = (__CFString **)v27;
    v17 = &v26;
LABEL_16:
    id v10 = objc_msgSend(v15, "dictionaryWithObjects:forKeys:count:", v16, v17, 1, v20, v21);
    [v13 errorWithDomain:v14 code:0 userInfo:v10];
    uint64_t v12 = 0;
    *a1 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (xpc_dictionary_get_uint64(v3, "TaskingServiceReplyType") != 8)
  {
    uint64_t v18 = DPLogHandle_ClientTaskingXPCError();
    if (os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v18, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InvalidResetCloudChannelConfigReply", "Received an invalid reply for a set cloud channel config message from the tasking service", buf, 2u);
    }

    if (!a1) {
      goto LABEL_17;
    }
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = kDRTaskingClientError;
    uint64_t v20 = *MEMORY[0x1E4F28568];
    v21 = @"Invalid tasking service reply";
    v15 = (void *)MEMORY[0x1E4F1C9E8];
    xpc_object_t v16 = &v21;
    v17 = &v20;
    goto LABEL_16;
  }
  string = xpc_dictionary_get_string(v4, "TaskingAdminRequest_RejectionReason");
  if (!string)
  {
    id v10 = DPLogHandle_ClientTaskingXPC();
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResetCloudChannelConfigSucceeded", (const char *)&unk_1DC03206D, buf, 2u);
    }
    uint64_t v12 = 1;
    goto LABEL_21;
  }
  xpc_object_t v6 = string;
  id v7 = DPLogHandle_ClientTaskingXPCError();
  if (os_signpost_enabled(v7))
  {
    *(_DWORD *)buf = 136446210;
    uint64_t v25 = v6;
    _os_signpost_emit_with_name_impl(&dword_1DC01F000, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "ResetCloudChannelConfigFailed", "Failed due to reason: %{public}s", buf, 0xCu);
  }

  if (a1)
  {
    id v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = kDRTaskingClientError;
    uint64_t v22 = *MEMORY[0x1E4F28568];
    id v10 = [NSString stringWithUTF8String:v6];
    uint64_t v23 = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    *a1 = [v8 errorWithDomain:v9 code:0 userInfo:v11];

    uint64_t v12 = 0;
LABEL_21:

    goto LABEL_22;
  }
LABEL_17:
  uint64_t v12 = 0;
LABEL_22:

  return v12;
}

NSObject *_dateFromJSONDict(void *a1, uint64_t a2)
{
  xpc_object_t v2 = [a1 objectForKeyedSubscript:a2];
  if (v2)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = (void *)MEMORY[0x1E4F1C9C8];
      [v2 doubleValue];
      xpc_object_t v4 = objc_msgSend(v3, "dateWithTimeIntervalSince1970:");
      id v5 = v4;
      if (v4)
      {
        id v5 = v4;
        xpc_object_t v6 = v5;
      }
      else
      {
        id v7 = DPLogHandle_TaskingMessageError();
        if (os_signpost_enabled(v7)) {
          _os_signpost_emit_unreliably_with_name_impl();
        }

        xpc_object_t v6 = 0;
      }
    }
    else
    {
      id v5 = DPLogHandle_TaskingMessageError();
      if (os_signpost_enabled(v5)) {
        _os_signpost_emit_unreliably_with_name_impl();
      }
      xpc_object_t v6 = 0;
    }
  }
  else
  {
    xpc_object_t v6 = 0;
  }

  return v6;
}

id DPLogHandle_ClientError()
{
  if (DPLogHandle_ClientError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ClientError_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)DPLogHandle_ClientError_handle;

  return v0;
}

id DPLogHandle_AdminError()
{
  if (DPLogHandle_AdminError_onceToken != -1) {
    dispatch_once(&DPLogHandle_AdminError_onceToken, &__block_literal_global_3);
  }
  v0 = (void *)DPLogHandle_AdminError_handle;

  return v0;
}

id DPLogHandle_ClientXPCError()
{
  if (DPLogHandle_ClientXPCError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ClientXPCError_onceToken, &__block_literal_global_6);
  }
  v0 = (void *)DPLogHandle_ClientXPCError_handle;

  return v0;
}

id DPLogHandle_ClientXPC()
{
  if (DPLogHandle_ClientXPC_onceToken != -1) {
    dispatch_once(&DPLogHandle_ClientXPC_onceToken, &__block_literal_global_9);
  }
  v0 = (void *)DPLogHandle_ClientXPC_handle;

  return v0;
}

id DPLogHandle_ClientAPI()
{
  if (DPLogHandle_ClientAPI_onceToken != -1) {
    dispatch_once(&DPLogHandle_ClientAPI_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)DPLogHandle_ClientAPI_handle;

  return v0;
}

id DPLogHandle_ClientAPIError()
{
  if (DPLogHandle_ClientAPIError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ClientAPIError_onceToken, &__block_literal_global_15);
  }
  v0 = (void *)DPLogHandle_ClientAPIError_handle;

  return v0;
}

id DPLogHandle_CKRecordError()
{
  if (DPLogHandle_CKRecordError_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKRecordError_onceToken, &__block_literal_global_18);
  }
  v0 = (void *)DPLogHandle_CKRecordError_handle;

  return v0;
}

id DPLogHandle_CKRecord()
{
  if (DPLogHandle_CKRecord_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKRecord_onceToken, &__block_literal_global_21);
  }
  v0 = (void *)DPLogHandle_CKRecord_handle;

  return v0;
}

id DPLogHandle_CKRecordUpload()
{
  if (DPLogHandle_CKRecordUpload_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKRecordUpload_onceToken, &__block_literal_global_24);
  }
  v0 = (void *)DPLogHandle_CKRecordUpload_handle;

  return v0;
}

id DPLogHandle_CKInverness()
{
  if (DPLogHandle_CKInverness_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKInverness_onceToken, &__block_literal_global_27);
  }
  v0 = (void *)DPLogHandle_CKInverness_handle;

  return v0;
}

id DPLogHandle_CKInvernessError()
{
  if (DPLogHandle_CKInvernessError_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKInvernessError_onceToken, &__block_literal_global_30);
  }
  v0 = (void *)DPLogHandle_CKInvernessError_handle;

  return v0;
}

id DPLogHandle_CKCFUpload()
{
  if (DPLogHandle_CKCFUpload_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKCFUpload_onceToken, &__block_literal_global_33);
  }
  v0 = (void *)DPLogHandle_CKCFUpload_handle;

  return v0;
}

id DPLogHandle_CKCFUploadError()
{
  if (DPLogHandle_CKCFUploadError_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKCFUploadError_onceToken, &__block_literal_global_36);
  }
  v0 = (void *)DPLogHandle_CKCFUploadError_handle;

  return v0;
}

id DPLogHandle_ServiceXPCError()
{
  if (DPLogHandle_ServiceXPCError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceXPCError_onceToken, &__block_literal_global_39);
  }
  v0 = (void *)DPLogHandle_ServiceXPCError_handle;

  return v0;
}

id DPLogHandle_ServiceXPC()
{
  if (DPLogHandle_ServiceXPC_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceXPC_onceToken, &__block_literal_global_42);
  }
  v0 = (void *)DPLogHandle_ServiceXPC_handle;

  return v0;
}

id DPLogHandle_ServiceLifecycle()
{
  if (DPLogHandle_ServiceLifecycle_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceLifecycle_onceToken, &__block_literal_global_45);
  }
  v0 = (void *)DPLogHandle_ServiceLifecycle_handle;

  return v0;
}

id DPLogHandle_ServiceLifecycleError()
{
  if (DPLogHandle_ServiceLifecycleError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceLifecycleError_onceToken, &__block_literal_global_48);
  }
  v0 = (void *)DPLogHandle_ServiceLifecycleError_handle;

  return v0;
}

id DPLogHandle_PermissiveUploadActivity()
{
  if (DPLogHandle_PermissiveUploadActivity_onceToken != -1) {
    dispatch_once(&DPLogHandle_PermissiveUploadActivity_onceToken, &__block_literal_global_51);
  }
  v0 = (void *)DPLogHandle_PermissiveUploadActivity_handle;

  return v0;
}

id DPLogHandle_LogManagement()
{
  if (DPLogHandle_LogManagement_onceToken != -1) {
    dispatch_once(&DPLogHandle_LogManagement_onceToken, &__block_literal_global_54);
  }
  v0 = (void *)DPLogHandle_LogManagement_handle;

  return v0;
}

id DPLogHandle_LogManagementError()
{
  if (DPLogHandle_LogManagementError_onceToken != -1) {
    dispatch_once(&DPLogHandle_LogManagementError_onceToken, &__block_literal_global_57);
  }
  v0 = (void *)DPLogHandle_LogManagementError_handle;

  return v0;
}

id DPLogHandle_DAReporting()
{
  if (DPLogHandle_DAReporting_onceToken != -1) {
    dispatch_once(&DPLogHandle_DAReporting_onceToken, &__block_literal_global_60);
  }
  v0 = (void *)DPLogHandle_DAReporting_handle;

  return v0;
}

id DPLogHandle_DAReportingError()
{
  if (DPLogHandle_DAReportingError_onceToken != -1) {
    dispatch_once(&DPLogHandle_DAReportingError_onceToken, &__block_literal_global_63);
  }
  v0 = (void *)DPLogHandle_DAReportingError_handle;

  return v0;
}

id DPLogHandle_RequestError()
{
  if (DPLogHandle_RequestError_onceToken != -1) {
    dispatch_once(&DPLogHandle_RequestError_onceToken, &__block_literal_global_66);
  }
  v0 = (void *)DPLogHandle_RequestError_handle;

  return v0;
}

id DPLogHandle_Request()
{
  if (DPLogHandle_Request_onceToken != -1) {
    dispatch_once(&DPLogHandle_Request_onceToken, &__block_literal_global_69);
  }
  v0 = (void *)DPLogHandle_Request_handle;

  return v0;
}

id DPLogHandle_TailspinError()
{
  if (DPLogHandle_TailspinError_onceToken != -1) {
    dispatch_once(&DPLogHandle_TailspinError_onceToken, &__block_literal_global_72);
  }
  v0 = (void *)DPLogHandle_TailspinError_handle;

  return v0;
}

id DPLogHandle_Tailspin()
{
  if (DPLogHandle_Tailspin_onceToken != -1) {
    dispatch_once(&DPLogHandle_Tailspin_onceToken, &__block_literal_global_75);
  }
  v0 = (void *)DPLogHandle_Tailspin_handle;

  return v0;
}

id DPLogHandle_SubmitLogError()
{
  if (DPLogHandle_SubmitLogError_onceToken != -1) {
    dispatch_once(&DPLogHandle_SubmitLogError_onceToken, &__block_literal_global_78);
  }
  v0 = (void *)DPLogHandle_SubmitLogError_handle;

  return v0;
}

id DPLogHandle_SubmitLog()
{
  if (DPLogHandle_SubmitLog_onceToken != -1) {
    dispatch_once(&DPLogHandle_SubmitLog_onceToken, &__block_literal_global_81);
  }
  v0 = (void *)DPLogHandle_SubmitLog_handle;

  return v0;
}

id DPLogHandle_SubmitLogToCKContainerError()
{
  if (DPLogHandle_SubmitLogToCKContainerError_onceToken != -1) {
    dispatch_once(&DPLogHandle_SubmitLogToCKContainerError_onceToken, &__block_literal_global_84);
  }
  v0 = (void *)DPLogHandle_SubmitLogToCKContainerError_handle;

  return v0;
}

id DPLogHandle_SubmitLogToCKContainer()
{
  if (DPLogHandle_SubmitLogToCKContainer_onceToken != -1) {
    dispatch_once(&DPLogHandle_SubmitLogToCKContainer_onceToken, &__block_literal_global_87);
  }
  v0 = (void *)DPLogHandle_SubmitLogToCKContainer_handle;

  return v0;
}

id DPLogHandle_EnableDataGatheringQueryError()
{
  if (DPLogHandle_EnableDataGatheringQueryError_onceToken != -1) {
    dispatch_once(&DPLogHandle_EnableDataGatheringQueryError_onceToken, &__block_literal_global_90);
  }
  v0 = (void *)DPLogHandle_EnableDataGatheringQueryError_handle;

  return v0;
}

id DPLogHandle_EnableDataGatheringQuery()
{
  if (DPLogHandle_EnableDataGatheringQuery_onceToken != -1) {
    dispatch_once(&DPLogHandle_EnableDataGatheringQuery_onceToken, &__block_literal_global_93);
  }
  v0 = (void *)DPLogHandle_EnableDataGatheringQuery_handle;

  return v0;
}

id DPLogHandle_CoreDataError()
{
  if (DPLogHandle_CoreDataError_onceToken != -1) {
    dispatch_once(&DPLogHandle_CoreDataError_onceToken, &__block_literal_global_96);
  }
  v0 = (void *)DPLogHandle_CoreDataError_handle;

  return v0;
}

id DPLogHandle_CoreData()
{
  if (DPLogHandle_CoreData_onceToken != -1) {
    dispatch_once(&DPLogHandle_CoreData_onceToken, &__block_literal_global_99);
  }
  v0 = (void *)DPLogHandle_CoreData_handle;

  return v0;
}

id DPLogHandle_SystemProfileError()
{
  if (DPLogHandle_SystemProfileError_onceToken != -1) {
    dispatch_once(&DPLogHandle_SystemProfileError_onceToken, &__block_literal_global_102);
  }
  v0 = (void *)DPLogHandle_SystemProfileError_handle;

  return v0;
}

id DPLogHandle_SystemProfile()
{
  if (DPLogHandle_SystemProfile_onceToken != -1) {
    dispatch_once(&DPLogHandle_SystemProfile_onceToken, &__block_literal_global_105);
  }
  v0 = (void *)DPLogHandle_SystemProfile_handle;

  return v0;
}

id DPLogHandle_DampeningManager()
{
  if (DPLogHandle_DampeningManager_onceToken != -1) {
    dispatch_once(&DPLogHandle_DampeningManager_onceToken, &__block_literal_global_108);
  }
  v0 = (void *)DPLogHandle_DampeningManager_handle;

  return v0;
}

id DPLogHandle_DampeningManagerError()
{
  if (DPLogHandle_DampeningManagerError_onceToken != -1) {
    dispatch_once(&DPLogHandle_DampeningManagerError_onceToken, &__block_literal_global_111);
  }
  v0 = (void *)DPLogHandle_DampeningManagerError_handle;

  return v0;
}

id DPLogHandle_TaskingMessage()
{
  if (DPLogHandle_TaskingMessage_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingMessage_onceToken, &__block_literal_global_114);
  }
  v0 = (void *)DPLogHandle_TaskingMessage_handle;

  return v0;
}

id DPLogHandle_TaskingMessageError()
{
  if (DPLogHandle_TaskingMessageError_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingMessageError_onceToken, &__block_literal_global_117);
  }
  v0 = (void *)DPLogHandle_TaskingMessageError_handle;

  return v0;
}

id DPLogHandle_TaskingDecisionMaker()
{
  if (DPLogHandle_TaskingDecisionMaker_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingDecisionMaker_onceToken, &__block_literal_global_120);
  }
  v0 = (void *)DPLogHandle_TaskingDecisionMaker_handle;

  return v0;
}

id DPLogHandle_TaskingDecisionMakerError()
{
  if (DPLogHandle_TaskingDecisionMakerError_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingDecisionMakerError_onceToken, &__block_literal_global_123);
  }
  v0 = (void *)DPLogHandle_TaskingDecisionMakerError_handle;

  return v0;
}

id DPLogHandle_ConfigPersistedStore()
{
  if (DPLogHandle_ConfigPersistedStore_onceToken != -1) {
    dispatch_once(&DPLogHandle_ConfigPersistedStore_onceToken, &__block_literal_global_126);
  }
  v0 = (void *)DPLogHandle_ConfigPersistedStore_handle;

  return v0;
}

id DPLogHandle_ConfigPersistedStoreError()
{
  if (DPLogHandle_ConfigPersistedStoreError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ConfigPersistedStoreError_onceToken, &__block_literal_global_129);
  }
  v0 = (void *)DPLogHandle_ConfigPersistedStoreError_handle;

  return v0;
}

id DPLogHandle_TaskingManager()
{
  if (DPLogHandle_TaskingManager_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingManager_onceToken, &__block_literal_global_132);
  }
  v0 = (void *)DPLogHandle_TaskingManager_handle;

  return v0;
}

id DPLogHandle_TaskingManagerError()
{
  if (DPLogHandle_TaskingManagerError_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingManagerError_onceToken, &__block_literal_global_135);
  }
  v0 = (void *)DPLogHandle_TaskingManagerError_handle;

  return v0;
}

id DPLogHandle_TaskingMessageChannel()
{
  if (DPLogHandle_TaskingMessageChannel_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingMessageChannel_onceToken, &__block_literal_global_138);
  }
  v0 = (void *)DPLogHandle_TaskingMessageChannel_handle;

  return v0;
}

id DPLogHandle_TaskingMessageChannelError()
{
  if (DPLogHandle_TaskingMessageChannelError_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingMessageChannelError_onceToken, &__block_literal_global_141);
  }
  v0 = (void *)DPLogHandle_TaskingMessageChannelError_handle;

  return v0;
}

id DPLogHandle_ClientTaskingXPC()
{
  if (DPLogHandle_ClientTaskingXPC_onceToken != -1) {
    dispatch_once(&DPLogHandle_ClientTaskingXPC_onceToken, &__block_literal_global_144);
  }
  v0 = (void *)DPLogHandle_ClientTaskingXPC_handle;

  return v0;
}

id DPLogHandle_ClientTaskingXPCError()
{
  if (DPLogHandle_ClientTaskingXPCError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ClientTaskingXPCError_onceToken, &__block_literal_global_147);
  }
  v0 = (void *)DPLogHandle_ClientTaskingXPCError_handle;

  return v0;
}

id DPLogHandle_ServiceTasking()
{
  if (DPLogHandle_ServiceTasking_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceTasking_onceToken, &__block_literal_global_156);
  }
  v0 = (void *)DPLogHandle_ServiceTasking_handle;

  return v0;
}

id DPLogHandle_ServiceTaskingError()
{
  if (DPLogHandle_ServiceTaskingError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceTaskingError_onceToken, &__block_literal_global_159);
  }
  v0 = (void *)DPLogHandle_ServiceTaskingError_handle;

  return v0;
}

id DPLogHandle_ServiceTaskingXPC()
{
  if (DPLogHandle_ServiceTaskingXPC_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceTaskingXPC_onceToken, &__block_literal_global_162);
  }
  v0 = (void *)DPLogHandle_ServiceTaskingXPC_handle;

  return v0;
}

id DPLogHandle_ServiceTaskingXPCError()
{
  if (DPLogHandle_ServiceTaskingXPCError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceTaskingXPCError_onceToken, &__block_literal_global_165);
  }
  v0 = (void *)DPLogHandle_ServiceTaskingXPCError_handle;

  return v0;
}

id DPLogHandle_ServiceEventPublisher()
{
  if (DPLogHandle_ServiceEventPublisher_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceEventPublisher_onceToken, &__block_literal_global_168);
  }
  v0 = (void *)DPLogHandle_ServiceEventPublisher_handle;

  return v0;
}

id DPLogHandle_ServiceEventPublisherError()
{
  if (DPLogHandle_ServiceEventPublisherError_onceToken != -1) {
    dispatch_once(&DPLogHandle_ServiceEventPublisherError_onceToken, &__block_literal_global_171);
  }
  v0 = (void *)DPLogHandle_ServiceEventPublisherError_handle;

  return v0;
}

id DPLogHandle_Telemetry()
{
  if (DPLogHandle_Telemetry_onceToken != -1) {
    dispatch_once(&DPLogHandle_Telemetry_onceToken, &__block_literal_global_174);
  }
  v0 = (void *)DPLogHandle_Telemetry_handle;

  return v0;
}

id DPLogHandle_TaskingDSTelemetry()
{
  if (DPLogHandle_TaskingDSTelemetry_onceToken != -1) {
    dispatch_once(&DPLogHandle_TaskingDSTelemetry_onceToken, &__block_literal_global_177);
  }
  v0 = (void *)DPLogHandle_TaskingDSTelemetry_handle;

  return v0;
}

id DPLogHandle_CKConfig()
{
  if (DPLogHandle_CKConfig_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKConfig_onceToken, &__block_literal_global_180);
  }
  v0 = (void *)DPLogHandle_CKConfig_handle;

  return v0;
}

id DPLogHandle_CKConfigError()
{
  if (DPLogHandle_CKConfigError_onceToken != -1) {
    dispatch_once(&DPLogHandle_CKConfigError_onceToken, &__block_literal_global_183);
  }
  v0 = (void *)DPLogHandle_CKConfigError_handle;

  return v0;
}

id DPLogHandle_UploadSessionDate()
{
  if (DPLogHandle_UploadSessionDate_onceToken != -1) {
    dispatch_once(&DPLogHandle_UploadSessionDate_onceToken, &__block_literal_global_186);
  }
  v0 = (void *)DPLogHandle_UploadSessionDate_handle;

  return v0;
}

id DPLogHandle_UploadSessionDateError()
{
  if (DPLogHandle_UploadSessionDateError_onceToken != -1) {
    dispatch_once(&DPLogHandle_UploadSessionDateError_onceToken, &__block_literal_global_189);
  }
  v0 = (void *)DPLogHandle_UploadSessionDateError_handle;

  return v0;
}

id DPLogHandle_DPConfig()
{
  if (DPLogHandle_DPConfig_onceToken != -1) {
    dispatch_once(&DPLogHandle_DPConfig_onceToken, &__block_literal_global_192);
  }
  v0 = (void *)DPLogHandle_DPConfig_handle;

  return v0;
}

id DPLogHandle_DPConfigError()
{
  if (DPLogHandle_DPConfigError_onceToken != -1) {
    dispatch_once(&DPLogHandle_DPConfigError_onceToken, &__block_literal_global_195);
  }
  v0 = (void *)DPLogHandle_DPConfigError_handle;

  return v0;
}

id DPLogHandle_DRSConfig()
{
  if (DPLogHandle_DRSConfig_onceToken != -1) {
    dispatch_once(&DPLogHandle_DRSConfig_onceToken, &__block_literal_global_198);
  }
  v0 = (void *)DPLogHandle_DRSConfig_handle;

  return v0;
}

id DPLogHandle_DRSConfigError()
{
  if (DPLogHandle_DRSConfigError_onceToken != -1) {
    dispatch_once(&DPLogHandle_DRSConfigError_onceToken, &__block_literal_global_201);
  }
  v0 = (void *)DPLogHandle_DRSConfigError_handle;

  return v0;
}

void _DRRequestResetTailspinHysteresis()
{
  v0 = _hysteresisQueue();
  dispatch_sync(v0, &__block_literal_global_1);
}

id _hysteresisQueue()
{
  if (_hysteresisQueue_onceToken != -1) {
    dispatch_once(&_hysteresisQueue_onceToken, &__block_literal_global_39_0);
  }
  v0 = (void *)_hysteresisQueue_hysteresisQueue;

  return v0;
}

uint64_t _DRRequestPassesTailspinHysteresis(double a1)
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 1;
  xpc_object_t v2 = _hysteresisQueue();
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = ___DRRequestPassesTailspinHysteresis_block_invoke;
  v5[3] = &unk_1E6C2AD98;
  *(double *)&v5[5] = a1;
  v5[4] = &v6;
  dispatch_sync(v2, v5);

  uint64_t v3 = *((unsigned __int8 *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t _doesPassHysteresis(uint64_t a1, uint64_t a2, double a3)
{
  if (_doesPassHysteresis_onceToken == -1)
  {
    if (a1) {
      return *(double *)&_doesPassHysteresis_timebaseRatio * (double)(unint64_t)(a2 - a1) / 1000000000.0 >= a3;
    }
  }
  else
  {
    dispatch_once(&_doesPassHysteresis_onceToken, &__block_literal_global_42_0);
    if (a1) {
      return *(double *)&_doesPassHysteresis_timebaseRatio * (double)(unint64_t)(a2 - a1) / 1000000000.0 >= a3;
    }
  }
  return 1;
}

uint64_t _tailspinRequestShared(void *a1, void *a2, void *a3, void *a4, BOOL a5, BOOL a6, void *a7, void *a8, void *a9)
{
  xpc_object_t v16 = a9;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v17 = a1;
  id v18 = a2;
  id v19 = a3;
  id v20 = a4;
  id v21 = a7;
  id v22 = a8;
  uint64_t v23 = mach_continuous_time();
  id v42 = 0;
  uint64_t v24 = _DPCTailspinRequestMessage(v17, v18, v19, v20, v23, a5, a6, v21, v22, &v42);
  id v25 = v42;
  uint64_t v26 = v25;
  if (!v24)
  {
    if (a9)
    {
      id v33 = v25;
LABEL_21:
      uint64_t v32 = 0;
      *xpc_object_t v16 = v33;
      goto LABEL_23;
    }
LABEL_22:
    uint64_t v32 = 0;
    goto LABEL_23;
  }
  id v36 = v25;
  id v37 = v17;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v27 = v22;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v38 objects:v49 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v39 != v30) {
          objc_enumerationMutation(v27);
        }
        if ([*(id *)(*((void *)&v38 + 1) + 8 * i) transferOwnership])
        {

          goto LABEL_13;
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v38 objects:v49 count:16];
      if (v29) {
        continue;
      }
      break;
    }
  }

  if (_DRRequestPassesTailspinHysteresis(300.0))
  {
LABEL_13:
    uint64_t v26 = v36;
    id v17 = v37;
    if (_DPClientXPCSendMessage(v24))
    {
      uint64_t v32 = 1;
      goto LABEL_23;
    }
    v34 = DPLogHandle_ClientXPCError();
    if (os_signpost_enabled(v34))
    {
      int v43 = 138543874;
      id v44 = v37;
      __int16 v45 = 2114;
      id v46 = v18;
      __int16 v47 = 2114;
      id v48 = v19;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    xpc_object_t v16 = a9;
    if (a9)
    {
      _clientError(@"Failed to send message to DiagnosticRequest service potentially due to missing com.apple.diagnosticpipeline.request entitlement");
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  uint64_t v32 = 1;
  uint64_t v26 = v36;
  id v17 = v37;
LABEL_23:

  return v32;
}

uint64_t DRTailspinRequest(void *a1, void *a2, void *a3, void *a4, BOOL a5, BOOL a6, void *a7, void *a8, void *a9)
{
  id v15 = a1;
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a7;
  id v20 = a8;
  id v21 = (void *)MEMORY[0x1E0197F60]();
  uint64_t v26 = v15;
  id v27 = 0;
  uint64_t v22 = _tailspinRequestShared(v15, v16, v17, v18, a5, a6, v19, 0, &v27);
  id v23 = v27;
  if (a9) {
    *a9 = v23;
  }

  return v22;
}

uint64_t DRTailspinRequestWithLogs(void *a1, void *a2, void *a3, void *a4, BOOL a5, BOOL a6, void *a7, void *a8, void *a9)
{
  id v16 = a1;
  id v17 = a2;
  id v18 = a3;
  id v19 = a4;
  id v20 = a7;
  id v21 = a8;
  if ([v21 count])
  {
    uint64_t v22 = (void *)MEMORY[0x1E0197F60]();
    id v27 = 0;
    uint64_t v23 = _tailspinRequestShared(v16, v17, v18, v19, a5, a6, v20, v21, &v27);
    id v24 = v27;
    if (a9) {
      *a9 = v24;
    }
  }
  else
  {
    id v25 = DPLogHandle_ClientError();
    if (os_signpost_enabled(v25))
    {
      *(_WORD *)buf = 0;
    }

    if (a9)
    {
      uint64_t v23 = 0;
      *a9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v23 = 0;
    }
  }

  return v23;
}

id _clientError(void *a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v1 = (void *)MEMORY[0x1E4F28C58];
  xpc_object_t v2 = kDRRequestClientError;
  uint64_t v8 = *MEMORY[0x1E4F28568];
  v9[0] = a1;
  uint64_t v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a1;
  id v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];
  uint64_t v6 = [v1 errorWithDomain:v2 code:0 userInfo:v5];

  return v6;
}

uint64_t _sendSubmitLogMessageAndHandleReply(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  char v9 = a2;
  id v10 = a3;
  id v11 = a4;
  uint64_t v12 = _DPClientXPCSendMessageWithReplySync(a1);
  uint64_t v13 = v12;
  if (!v12)
  {
    id v15 = DPLogHandle_ClientXPCError();
    if (os_signpost_enabled(v15))
    {
      int v26 = 138543874;
      id v27 = v9;
      __int16 v28 = 2114;
      id v29 = v10;
      __int16 v30 = 2114;
      id v31 = v11;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (a5)
    {
      _clientError(@"Failed to send message to DiagnosticRequest service potentially due to missing com.apple.diagnosticpipeline.request entitlement");
      uint64_t v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
LABEL_17:
    uint64_t v14 = 0;
    goto LABEL_18;
  }
  if (!xpc_dictionary_get_BOOL(v12, "SubmitLog_DidSucceed"))
  {
    string = xpc_dictionary_get_string(v13, "SubmitLog_FailureReason");
    id v17 = DPLogHandle_ClientError();
    if (os_signpost_enabled(v17))
    {
      id v18 = "Unknown";
      if (string) {
        id v18 = string;
      }
      int v26 = 136446210;
      id v27 = v18;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (a5)
    {
      if (string)
      {
        id v19 = [NSString stringWithUTF8String:string];
      }
      else
      {
        id v19 = @"Unknown";
      }
      id v20 = (void *)MEMORY[0x1E4F28C58];
      id v21 = kDRRequestClientError;
      uint64_t v24 = *MEMORY[0x1E4F28568];
      id v25 = v19;
      uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      *a5 = [v20 errorWithDomain:v21 code:0 userInfo:v22];
    }
    goto LABEL_17;
  }
  uint64_t v14 = 1;
LABEL_18:

  return v14;
}

uint64_t DRSubmitLog(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, void *a8)
{
  id v15 = a1;
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  context = (void *)MEMORY[0x1E0197F60]();
  uint64_t v21 = mach_continuous_time();
  id v31 = 0;
  uint64_t v22 = _DPCSubmitLogRequestMessage(v15, v16, v17, v18, v21, v19, v20, a7, &v31);
  id v23 = v31;
  uint64_t v24 = v23;
  if (v22)
  {
    id v30 = v23;
    unsigned int v28 = _sendSubmitLogMessageAndHandleReply(v22, v15, v16, v17, &v30);
    id v25 = a8;
    id v26 = v30;

    uint64_t v24 = v26;
    a8 = v25;
  }
  else
  {
    unsigned int v28 = 0;
  }

  if (a8) {
    *a8 = v24;
  }

  return v28;
}

uint64_t DRSubmitLogs(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = (void *)MEMORY[0x1E0197F60]();
  uint64_t v17 = mach_continuous_time();
  id v26 = 0;
  id v18 = _DPCSubmitLogsRequestMessage(v11, v12, v13, v14, v17, v15, &v26);
  id v19 = v26;
  id v20 = v19;
  if (v18)
  {
    id v25 = v19;
    unsigned int v24 = _sendSubmitLogMessageAndHandleReply(v18, v11, v12, v13, &v25);
    uint64_t v21 = a6;
    id v22 = v25;

    id v20 = v22;
    a6 = v21;
  }
  else
  {
    unsigned int v24 = 0;
  }

  if (a6) {
    *a6 = v20;
  }

  return v24;
}

uint64_t DRSubmitLogToCKContainer(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, unsigned int a7, void *a8, void *a9, void *a10, void *a11, void *a12)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v52 = a1;
  id v55 = a2;
  id v54 = a3;
  id v53 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v58 = 0;
  LOBYTE(a6) = DRValidateCKRecordDictionary(v24, &v58);
  id v25 = v58;
  uint64_t v51 = v22;
  if ((a6 & 1) == 0)
  {
    id v36 = DPLogHandle_ClientError();
    if (os_signpost_enabled(v36))
    {
      uint64_t v37 = [v25 localizedDescription];
      long long v38 = (void *)v37;
      long long v39 = @"Unknown error";
      if (v37) {
        long long v39 = (__CFString *)v37;
      }
      int v61 = 138543362;
      v62 = v39;
      _os_signpost_emit_unreliably_with_name_impl();
    }
    unsigned int v28 = v52;
    id v29 = v55;
    uint64_t v35 = 0;
    if (a12) {
      *a12 = v25;
    }
    goto LABEL_16;
  }
  id v26 = [v24 objectForKeyedSubscript:v23];

  if (v26)
  {
    id v27 = DPLogHandle_ClientError();
    unsigned int v28 = v52;
    id v29 = v55;
    if (os_signpost_enabled(v27))
    {
      LOWORD(v61) = 0;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (a12)
    {
      uint64_t v49 = (void *)MEMORY[0x1E4F28C58];
      id v30 = kDRRequestClientError;
      uint64_t v59 = *MEMORY[0x1E4F28568];
      v60 = @"'recordDictionary' and 'fileAssetField' collide";
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      id v31 = v21;
      id v32 = v20;
      v34 = id v33 = v19;
      *a12 = [v49 errorWithDomain:v30 code:0 userInfo:v34];

      id v19 = v33;
      id v20 = v32;
      id v21 = v31;
    }
    uint64_t v35 = 0;
LABEL_16:
    __int16 v45 = v54;
    goto LABEL_17;
  }
  context = (void *)MEMORY[0x1E0197F60]();
  uint64_t v40 = mach_continuous_time();
  id v57 = 0;
  id v48 = v21;
  id v50 = v19;
  unsigned int v28 = v52;
  long long v41 = _DPCSubmitLogToCKContainerRequestMessage(v52, v55, v54, v53, v40, v19, v20, a7, v21, v22, v23, v24, &v57);
  id v42 = v57;
  int v43 = v42;
  if (v41)
  {
    id v56 = v42;
    uint64_t v35 = _sendSubmitLogMessageAndHandleReply(v41, v52, v55, v54, &v56);
    id v44 = v56;

    int v43 = v44;
  }
  else
  {
    uint64_t v35 = 0;
  }

  id v21 = v48;
  if (a12) {
    *a12 = v43;
  }

  __int16 v45 = v54;
  id v29 = v55;
  id v19 = v50;
LABEL_17:

  return v35;
}

uint64_t DRSubmitRapidLog(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, void *a8)
{
  id v15 = a1;
  id v16 = a2;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  context = (void *)MEMORY[0x1E0197F60]();
  uint64_t v21 = mach_continuous_time();
  id v31 = 0;
  id v22 = _DPCSubmitRapidLogRequestMessage(v15, v16, v17, v18, v21, v19, v20, a7, &v31);
  id v23 = v31;
  id v24 = v23;
  if (v22)
  {
    id v30 = v23;
    unsigned int v28 = _sendSubmitLogMessageAndHandleReply(v22, v15, v16, v17, &v30);
    id v25 = a8;
    id v26 = v30;

    id v24 = v26;
    a8 = v25;
  }
  else
  {
    unsigned int v28 = 0;
  }

  if (a8) {
    *a8 = v24;
  }

  return v28;
}

uint64_t DRShouldGatherLog()
{
  return 1;
}

uint64_t DRShouldEnableLogGathering(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a1;
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = mach_continuous_time();
  id v31 = 0;
  id v14 = _DPCEnableLogGatheringQueryMessage(v9, v10, v12, v11, v13, &v31);
  id v15 = v31;
  if (v14)
  {
    uint64_t v16 = _DPClientXPCSendMessageWithReplySync(v14);
    id v17 = (void *)v16;
    if (v16)
    {
      if (v16 != MEMORY[0x1E4F14528])
      {
        if (v16 == MEMORY[0x1E4F14520])
        {
          unsigned __int8 v24 = 2;
LABEL_36:

          goto LABEL_37;
        }
        if (MEMORY[0x1E0198410](v16) != MEMORY[0x1E4F14590])
        {
          id v18 = (void *)MEMORY[0x1E0198330](v17);
          id v19 = DPLogHandle_ClientXPCError();
          if (os_signpost_enabled(v19))
          {
            int v32 = 136446210;
            id v33 = v18;
            _os_signpost_emit_unreliably_with_name_impl();
          }

          if (v18) {
            free(v18);
          }
          goto LABEL_35;
        }
        id v25 = xpc_dictionary_get_value(v17, "EnableLogGatheringQueryReply");

        if (v25)
        {
          unsigned __int8 uint64 = xpc_dictionary_get_uint64(v17, "EnableLogGatheringQueryReply");
          if (uint64 < 3uLL)
          {
            unsigned __int8 v24 = uint64;
            goto LABEL_36;
          }
          id v27 = DPLogHandle_ClientXPCError();
          if (!os_signpost_enabled(v27)) {
            goto LABEL_46;
          }
          if (v11)
          {
LABEL_27:
            unsigned int v28 = [v11 debugDescription];
            goto LABEL_44;
          }
          unsigned int v28 = @"-";
        }
        else
        {
          id v27 = DPLogHandle_ClientXPCError();
          if (!os_signpost_enabled(v27))
          {
LABEL_46:

            if (!a5) {
              goto LABEL_35;
            }
            id v29 = _unexpectedReplyError();
            goto LABEL_34;
          }
          if (v11) {
            goto LABEL_27;
          }
          unsigned int v28 = @"-";
        }
LABEL_44:
        int v32 = 138544130;
        id v33 = v9;
        __int16 v34 = 2114;
        id v35 = v10;
        __int16 v36 = 2114;
        id v37 = v12;
        __int16 v38 = 2114;
        long long v39 = v28;
        _os_signpost_emit_unreliably_with_name_impl();
        if (v11) {

        }
        goto LABEL_46;
      }
    }
    else
    {
      id v22 = DPLogHandle_ClientXPCError();
      if (os_signpost_enabled(v22))
      {
        if (v11)
        {
          id v23 = [v11 debugDescription];
        }
        else
        {
          id v23 = @"-";
        }
        int v32 = 138544130;
        id v33 = v9;
        __int16 v34 = 2114;
        id v35 = v10;
        __int16 v36 = 2114;
        id v37 = v12;
        __int16 v38 = 2114;
        long long v39 = v23;
        _os_signpost_emit_unreliably_with_name_impl();
        if (v11) {
      }
        }
    }
    if (!a5)
    {
LABEL_35:
      unsigned __int8 v24 = 3;
      goto LABEL_36;
    }
    id v29 = _clientError(@"Failed to send message to DiagnosticRequest service potentially due to missing com.apple.diagnosticpipeline.request entitlement");
LABEL_34:
    *a5 = v29;
    goto LABEL_35;
  }
  id v20 = DPLogHandle_ClientXPCError();
  if (os_signpost_enabled(v20))
  {
    if (v11)
    {
      uint64_t v21 = [v11 debugDescription];
    }
    else
    {
      uint64_t v21 = @"-";
    }
    int v32 = 138544130;
    id v33 = v9;
    __int16 v34 = 2114;
    id v35 = v10;
    __int16 v36 = 2114;
    id v37 = v12;
    __int16 v38 = 2114;
    long long v39 = v21;
    _os_signpost_emit_unreliably_with_name_impl();
    if (v11) {
  }
    }
  if (a5) {
    *a5 = v15;
  }
  unsigned __int8 v24 = 3;
LABEL_37:

  return v24;
}

id _unexpectedReplyError()
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v0 = (void *)MEMORY[0x1E4F28C58];
  id v1 = kDRRequestClientError;
  uint64_t v5 = *MEMORY[0x1E4F28568];
  v6[0] = @"Received unexpected or malformed reply from DiagnosticRequest service. Please file a bug against DiagnosticPipeline | All and attach a sysdiagnose.";
  xpc_object_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v3 = [v0 errorWithDomain:v1 code:0 userInfo:v2];

  return v3;
}

NSObject *DRGetAllLogFileURLs(void *a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (a1) {
    *a1 = 0;
  }
  if (@"/private/var/mobile/Library/Logs/DiagnosticPipeline")
  {
    xpc_object_t v2 = [objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:@"/private/var/mobile/Library/Logs/DiagnosticPipeline"];
    if (v2)
    {
      uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
      v9[0] = *MEMORY[0x1E4F1D738];
      id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
      uint64_t v5 = [v3 contentsOfDirectoryAtURL:v2 includingPropertiesForKeys:v4 options:0 error:a1];

      if (!a1 || !*a1)
      {
        uint64_t v5 = v5;
        id v7 = v5;
LABEL_17:

        goto LABEL_18;
      }
      uint64_t v6 = DPLogHandle_ClientAPIError();
      if (os_signpost_enabled(v6)) {
        _os_signpost_emit_unreliably_with_name_impl();
      }
    }
    else
    {
      uint64_t v5 = DPLogHandle_ClientAPIError();
      if (os_signpost_enabled(v5)) {
        _os_signpost_emit_unreliably_with_name_impl();
      }
    }
    id v7 = 0;
    goto LABEL_17;
  }
  xpc_object_t v2 = DPLogHandle_ClientAPIError();
  if (os_signpost_enabled(v2)) {
    _os_signpost_emit_unreliably_with_name_impl();
  }
  id v7 = 0;
LABEL_18:

  return v7;
}

BOOL DRCheckRapidLogSize(void *a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  if (a2) {
    *a2 = 0;
  }
  id v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v19 = 0;
  if (([v4 fileExistsAtPath:v3 isDirectory:&v19] & 1) == 0)
  {
    id v11 = DPLogHandle_ClientAPIError();
    if (os_signpost_enabled(v11))
    {
      int v24 = 138543362;
      id v25 = v3;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (!a2) {
      goto LABEL_14;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = kDRRequestClientError;
    uint64_t v22 = *MEMORY[0x1E4F28568];
    id v23 = @"File does not exist";
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = &v23;
    id v10 = &v22;
    goto LABEL_13;
  }
  if (v19)
  {
    uint64_t v5 = DPLogHandle_ClientAPIError();
    if (os_signpost_enabled(v5))
    {
      int v24 = 138543362;
      id v25 = v3;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (!a2) {
      goto LABEL_14;
    }
    uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = kDRRequestClientError;
    uint64_t v20 = *MEMORY[0x1E4F28568];
    uint64_t v21 = @"File is a directory";
    uint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
    id v9 = &v21;
    id v10 = &v20;
LABEL_13:
    id v12 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
    *a2 = [v6 errorWithDomain:v7 code:0 userInfo:v12];

LABEL_14:
    BOOL v13 = 0;
    goto LABEL_15;
  }
  id v18 = 0;
  id v15 = [v4 attributesOfItemAtPath:v3 error:&v18];
  id v16 = v18;
  id v17 = v16;
  if (v16)
  {
    BOOL v13 = 0;
    if (a2) {
      *a2 = v16;
    }
  }
  else
  {
    BOOL v13 = (unint64_t)[v15 fileSize] <= 0x6400000;
  }

LABEL_15:
  return v13;
}

void _DRRequestResetHysteresisDict()
{
  v0 = _hysteresisQueue();
  dispatch_sync(v0, &__block_literal_global_33_0);
}

id _hysteresisDict()
{
  if (_hysteresisDict_onceToken != -1) {
    dispatch_once(&_hysteresisDict_onceToken, &__block_literal_global_50);
  }
  v0 = (void *)_hysteresisDict_hysteresisDict;

  return v0;
}

BOOL DRRequestPassesTimeHysteresis(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  id v7 = v6;
  BOOL v8 = 0;
  if (v5 && v6 && a3 > 0.0)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x2020000000;
    char v19 = 0;
    id v9 = _hysteresisQueue();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __DRRequestPassesTimeHysteresis_block_invoke;
    v11[3] = &unk_1E6C2ADC0;
    id v12 = v5;
    id v13 = v7;
    id v14 = &v16;
    double v15 = a3;
    dispatch_sync(v9, v11);

    BOOL v8 = *((unsigned char *)v17 + 24) != 0;
    _Block_object_dispose(&v16, 8);
  }

  return v8;
}

void __DRRequestPassesTimeHysteresis_block_invoke(uint64_t a1)
{
  uint64_t v2 = mach_continuous_time();
  id v8 = (id)[[NSString alloc] initWithFormat:@"%@_||_%@", *(void *)(a1 + 32), *(void *)(a1 + 40)];
  id v3 = _hysteresisDict();
  id v4 = [v3 objectForKeyedSubscript:v8];
  uint64_t v5 = [v4 unsignedLongLongValue];

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = _doesPassHysteresis(v5, v2, *(double *)(a1 + 56));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v6 = [NSNumber numberWithUnsignedLongLong:v2];
    id v7 = _hysteresisDict();
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
}

uint64_t ___hysteresisQueue_block_invoke()
{
  _hysteresisQueue_hysteresisQueue = (uint64_t)dispatch_queue_create("DiagnosticPipeline Client hysteresis queue", 0);

  return MEMORY[0x1F41817F8]();
}

uint64_t ___doesPassHysteresis_block_invoke()
{
  mach_timebase_info info = 0;
  uint64_t result = mach_timebase_info(&info);
  double v1 = 1.0;
  if (info.numer != info.denom) {
    double v1 = (double)info.numer / (double)info.denom;
  }
  _doesPassHysteresis_timebaseRatio = *(void *)&v1;
  return result;
}

uint64_t ___hysteresisDict_block_invoke()
{
  _hysteresisDict_hysteresisDict = (uint64_t)objc_alloc_init(MEMORY[0x1E4F1CA60]);

  return MEMORY[0x1F41817F8]();
}

uint64_t _oneIsNil(uint64_t a1, uint64_t a2)
{
  return (a1 != 0) ^ (a2 != 0);
}

void sub_1DC02A6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

BOOL _argIsNonNil(uint64_t a1, uint64_t a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (!a1)
  {
    id v4 = DPLogHandle_TaskingMessageError();
    if (os_signpost_enabled(v4))
    {
      int v6 = 136446210;
      uint64_t v7 = a2;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "DRConfigInitError", "Encountered a nil argument for '%{public}s' that should have been non-nil", (uint8_t *)&v6, 0xCu);
    }
  }
  return a1 != 0;
}

__CFString *DRConfigStringForState(unsigned int a1)
{
  if (a1 > 3) {
    return @"Unknown";
  }
  else {
    return off_1E6C2AE80[(char)a1];
  }
}

void _DRCConnectionStateFinalizer()
{
  v0 = DPLogHandle_ClientXPC();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR)) {
    _DRCTaskingConnectionStateFinalizer_cold_1(v0);
  }
}

void sub_1DC02C360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DC02C51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t _DPClientXPCSendMessage(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[_DRCConnectionState sharedConnectionState];
  uint64_t v3 = [v2 sendMessage:v1];

  return v3;
}

id _DPClientXPCSendMessageWithReplySync(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[_DRCConnectionState sharedConnectionState];
  uint64_t v3 = [v2 sendMessageWithReplySync:v1];

  if (v3 && MEMORY[0x1E0198410](v3) == MEMORY[0x1E4F14590])
  {
    id v5 = v3;
  }
  else
  {
    id v4 = DPLogHandle_ClientXPCError();
    if (os_signpost_enabled(v4)) {
      _os_signpost_emit_unreliably_with_name_impl();
    }

    id v5 = 0;
  }

  return v5;
}

id _xpcArrayForStringArray(void *a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  if ([v1 count])
  {
    xpc_object_t empty = xpc_array_create_empty();
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v3 = v1;
    uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v11;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v11 != v6) {
            objc_enumerationMutation(v3);
          }
          id v8 = *(id *)(*((void *)&v10 + 1) + 8 * i);
          xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v8, "UTF8String", (void)v10));
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v5);
    }
  }
  else
  {
    xpc_object_t empty = 0;
  }

  return empty;
}

id _DPCTailspinRequestMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, BOOL a6, BOOL a7, void *a8, void *a9, void *a10)
{
  id v17 = a10;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v18 = a8;
  char v19 = _DPClientLogRequestBaseMessage(a1, a2, a3, a4, @"Tailspin", a9, a5, a10);
  uint64_t v20 = v19;
  if (!v19) {
    goto LABEL_10;
  }
  xpc_dictionary_set_uint64(v19, "ClientMessageType", 1uLL);
  xpc_dictionary_set_BOOL(v20, "IncludeOSSignpost", a6);
  xpc_dictionary_set_BOOL(v20, "IncludeOSLog", a7);
  uint64_t v21 = mach_absolute_time();
  if (!v18)
  {
LABEL_5:
    id v17 = v20;
    goto LABEL_11;
  }
  uint64_t v22 = v21;
  if ([v18 unsignedLongLongValue] < v21)
  {
    xpc_dictionary_set_uint64(v20, "MinMAT", [v18 unsignedLongLongValue]);
    goto LABEL_5;
  }
  id v23 = DPLogHandle_ClientError();
  if (os_signpost_enabled(v23))
  {
    int v30 = 134349312;
    uint64_t v31 = [v18 unsignedLongLongValue];
    __int16 v32 = 2050;
    uint64_t v33 = v22;
    _os_signpost_emit_unreliably_with_name_impl();
  }

  if (a10)
  {
    int v24 = (void *)MEMORY[0x1E4F28C58];
    id v25 = kDRRequestClientError;
    uint64_t v28 = *MEMORY[0x1E4F28568];
    id v29 = @"Min timestamp >= current timestamp";
    uint64_t v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    *a10 = [v24 errorWithDomain:v25 code:0 userInfo:v26];

LABEL_10:
    id v17 = 0;
  }
LABEL_11:

  return v17;
}

void *_DPClientLogRequestBaseMessage(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, uint64_t a7, void *a8)
{
  v66[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a6;
  id v17 = _DPClientBaseMessage(a1, a2, a4, a5, a7, a8);
  if (!v17) {
    goto LABEL_41;
  }
  if (v15)
  {
    xpc_dictionary_set_string(v17, "Description", (const char *)[v15 UTF8String]);
    if (![v16 count])
    {
LABEL_29:
      a8 = v17;
      goto LABEL_42;
    }
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v19 = v16;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v57;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v57 != v22) {
            objc_enumerationMutation(v19);
          }
          int v24 = [*(id *)(*((void *)&v56 + 1) + 8 * i) path];
          [v18 addObject:v24];
        }
        uint64_t v21 = [v19 countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v21);
    }

    id v25 = _xpcArrayForStringArray(v18);
    if (v25)
    {
      uint64_t v26 = v25;
      xpc_dictionary_set_value(v17, "LogArray", v25);

      id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v27 = v19;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v52 objects:v61 count:16];
      if (v28)
      {
        uint64_t v29 = v28;
        uint64_t v30 = *(void *)v53;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v53 != v30) {
              objc_enumerationMutation(v27);
            }
            __int16 v32 = [*(id *)(*((void *)&v52 + 1) + 8 * j) sandboxExtension];
            [v18 addObject:v32];
          }
          uint64_t v29 = [v27 countByEnumeratingWithState:&v52 objects:v61 count:16];
        }
        while (v29);
      }

      uint64_t v33 = _xpcArrayForStringArray(v18);
      if (v33)
      {
        uint64_t v34 = v33;
        xpc_dictionary_set_value(v17, "SandboxExtensions", v33);

        xpc_object_t empty = xpc_array_create_empty();
        if (empty)
        {
          __int16 v36 = empty;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          id v37 = v27;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v48 objects:v60 count:16];
          if (v38)
          {
            uint64_t v39 = v38;
            uint64_t v40 = *(void *)v49;
            do
            {
              for (uint64_t k = 0; k != v39; ++k)
              {
                if (*(void *)v49 != v40) {
                  objc_enumerationMutation(v37);
                }
                xpc_array_set_BOOL(v36, 0xFFFFFFFFFFFFFFFFLL, objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * k), "transferOwnership", (void)v48));
              }
              uint64_t v39 = [v37 countByEnumeratingWithState:&v48 objects:v60 count:16];
            }
            while (v39);
          }

          xpc_dictionary_set_value(v17, "TransferOwnership", v36);
          goto LABEL_29;
        }
        id v18 = DPLogHandle_ClientError();
        if (os_signpost_enabled(v18))
        {
          LOWORD(v62) = 0;
          _os_signpost_emit_unreliably_with_name_impl();
        }
        goto LABEL_40;
      }
      id v46 = DPLogHandle_ClientError();
      if (os_signpost_enabled(v46))
      {
        int v62 = 138543362;
        uint64_t v63 = v18;
        goto LABEL_38;
      }
    }
    else
    {
      id v46 = DPLogHandle_ClientError();
      if (os_signpost_enabled(v46))
      {
        int v62 = 138543362;
        uint64_t v63 = v18;
LABEL_38:
        _os_signpost_emit_unreliably_with_name_impl();
      }
    }

LABEL_40:
    goto LABEL_41;
  }
  id v42 = DPLogHandle_ClientError();
  if (os_signpost_enabled(v42))
  {
    LOWORD(v62) = 0;
    _os_signpost_emit_unreliably_with_name_impl();
  }

  if (a8)
  {
    int v43 = (void *)MEMORY[0x1E4F28C58];
    id v44 = kDRRequestClientError;
    uint64_t v65 = *MEMORY[0x1E4F28568];
    v66[0] = @"Missing required issueDescription argument";
    __int16 v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v66 forKeys:&v65 count:1];
    *a8 = [v43 errorWithDomain:v44 code:0 userInfo:v45];

LABEL_41:
    a8 = 0;
  }
LABEL_42:

  return a8;
}

id _DPCSubmitLogRequestMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, uint64_t a8, void *a9)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v16 = a1;
  id v17 = a2;
  id v18 = a3;
  id v19 = a4;
  id v20 = a6;
  id v21 = a7;
  if (v21)
  {
    uint64_t v22 = [[DRClientLog alloc] initWithPath:v21 transferOwnership:a8 errorOut:a9];
    id v23 = v22;
    if (v22)
    {
      uint64_t v31 = v22;
      int v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      id v25 = _DPClientLogRequestBaseMessage(v16, v17, v18, v19, v20, v24, a5, a9);

      if (v25)
      {
        xpc_dictionary_set_uint64(v25, "ClientMessageType", 2uLL);
        id v26 = v25;
      }
    }
    else
    {
      id v25 = 0;
    }
    goto LABEL_11;
  }
  id v27 = DPLogHandle_ClientError();
  if (os_signpost_enabled(v27)) {
    _os_signpost_emit_unreliably_with_name_impl();
  }

  if (a9)
  {
    uint64_t v28 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = kDRRequestClientError;
    uint64_t v32 = *MEMORY[0x1E4F28568];
    v33[0] = @"Missing required logPath argument";
    id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    [v28 errorWithDomain:v29 code:0 userInfo:v23];
    id v25 = 0;
    *a9 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

    goto LABEL_12;
  }
  id v25 = 0;
LABEL_12:

  return v25;
}

void *_DPCSubmitLogsRequestMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7)
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v13 = a1;
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  if ([v17 count])
  {
    id v18 = _DPClientLogRequestBaseMessage(v13, v14, v15, v16, @"MultipleLogs", v17, a5, a7);
    a7 = v18;
    if (v18)
    {
      xpc_dictionary_set_uint64(v18, "ClientMessageType", 2uLL);
      id v19 = a7;
    }
  }
  else
  {
    id v20 = DPLogHandle_ClientError();
    if (os_signpost_enabled(v20)) {
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (a7)
    {
      id v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v22 = kDRRequestClientError;
      uint64_t v25 = *MEMORY[0x1E4F28568];
      v26[0] = @"No logs provided";
      id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
      *a7 = [v21 errorWithDomain:v22 code:0 userInfo:v23];

      a7 = 0;
    }
  }

  return a7;
}

id _DPCSubmitLogToCKContainerRequestMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, unsigned int a8, void *a9, void *a10, void *a11, void *a12, void *a13)
{
  v90[1] = *MEMORY[0x1E4F143B8];
  id v67 = a1;
  id v19 = a2;
  id v65 = a3;
  id v64 = a4;
  id v70 = a6;
  id v69 = a7;
  id v20 = a9;
  id v68 = a10;
  id v66 = a11;
  id v21 = a12;
  if (![v21 count])
  {
    uint64_t v22 = DPLogHandle_ClientError();
    if (os_signpost_enabled(v22))
    {
      LOWORD(v86) = 0;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (a13)
    {
      id v23 = (void *)MEMORY[0x1E4F28C58];
      int v24 = kDRRequestClientError;
      uint64_t v89 = *MEMORY[0x1E4F28568];
      v90[0] = @"'recordDictionary' contains no keys";
      uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v90 forKeys:&v89 count:1];
      *a13 = [v23 errorWithDomain:v24 code:0 userInfo:v25];
    }
  }
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v26 = [v21 allKeys];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v72 objects:v88 count:16];
  if (!v27)
  {
LABEL_14:

    uint64_t v32 = v67;
    uint64_t v33 = v19;
    uint64_t v34 = v19;
    __int16 v36 = v64;
    id v35 = v65;
    id v26 = _DPCSubmitLogRequestMessage(v67, v34, v65, v64, a5, v70, v69, a8, a13);
    if (v26)
    {
      if (v20)
      {
        if (v68)
        {
          if (v66)
          {
            if (v21)
            {
              id v71 = 0;
              id v37 = _DPCConvertDictionaryToPlistData(v21, @"Record dictionary", &v71);
              id v38 = v71;
              uint64_t v39 = v38;
              uint64_t v40 = v37;
              if (v37)
              {
                id v63 = v37;
                xpc_dictionary_set_uint64(v26, "ClientMessageType", 4uLL);
                long long v41 = v20;
                xpc_dictionary_set_string(v26, "containerName", (const char *)[v20 UTF8String]);
                xpc_dictionary_set_string(v26, "RecordType", (const char *)[v68 UTF8String]);
                xpc_dictionary_set_string(v26, "FileAssetField", (const char *)[v66 UTF8String]);
                id v42 = v37;
                int v43 = (const void *)[v42 bytes];
                id v44 = v42;
                uint64_t v32 = v67;
                xpc_dictionary_set_data(v26, "RecordDictionaryData", v43, [v44 length]);
                id v45 = v26;
              }
              else
              {
                long long v41 = v20;
                if (!a13)
                {
                  id v45 = 0;
                  goto LABEL_48;
                }
                id v63 = 0;
                id v45 = 0;
                *a13 = v38;
              }
              uint64_t v40 = v63;
LABEL_48:

              goto LABEL_49;
            }
            long long v59 = DPLogHandle_ClientError();
            if (os_signpost_enabled(v59))
            {
              LOWORD(v86) = 0;
              _os_signpost_emit_unreliably_with_name_impl();
            }
            long long v41 = v20;

            long long v51 = a13;
            if (a13)
            {
              long long v52 = (void *)MEMORY[0x1E4F28C58];
              long long v53 = kDRRequestClientError;
              uint64_t v76 = *MEMORY[0x1E4F28568];
              v77 = @"Missing required 'recordDictionary' argument";
              long long v54 = (void *)MEMORY[0x1E4F1C9E8];
              long long v55 = &v77;
              long long v56 = &v76;
              goto LABEL_44;
            }
LABEL_27:
            id v45 = 0;
            goto LABEL_50;
          }
          long long v58 = DPLogHandle_ClientError();
          if (os_signpost_enabled(v58))
          {
            LOWORD(v86) = 0;
            _os_signpost_emit_unreliably_with_name_impl();
          }
          long long v41 = v20;

          long long v51 = a13;
          if (!a13) {
            goto LABEL_27;
          }
          long long v52 = (void *)MEMORY[0x1E4F28C58];
          long long v53 = kDRRequestClientError;
          uint64_t v78 = *MEMORY[0x1E4F28568];
          v79 = @"Missing required 'fileAssetField' argument";
          long long v54 = (void *)MEMORY[0x1E4F1C9E8];
          long long v55 = &v79;
          long long v56 = &v78;
        }
        else
        {
          long long v57 = DPLogHandle_ClientError();
          if (os_signpost_enabled(v57))
          {
            LOWORD(v86) = 0;
            _os_signpost_emit_unreliably_with_name_impl();
          }
          long long v41 = v20;

          long long v51 = a13;
          if (!a13) {
            goto LABEL_27;
          }
          long long v52 = (void *)MEMORY[0x1E4F28C58];
          long long v53 = kDRRequestClientError;
          uint64_t v80 = *MEMORY[0x1E4F28568];
          v81 = @"Missing required 'recordType' argument";
          long long v54 = (void *)MEMORY[0x1E4F1C9E8];
          long long v55 = &v81;
          long long v56 = &v80;
        }
      }
      else
      {
        long long v50 = DPLogHandle_ClientError();
        if (os_signpost_enabled(v50))
        {
          LOWORD(v86) = 0;
          _os_signpost_emit_unreliably_with_name_impl();
        }
        long long v41 = 0;

        long long v51 = a13;
        if (!a13) {
          goto LABEL_27;
        }
        long long v52 = (void *)MEMORY[0x1E4F28C58];
        long long v53 = kDRRequestClientError;
        uint64_t v82 = *MEMORY[0x1E4F28568];
        v83 = @"Missing required 'targetCKContainer' argument";
        long long v54 = (void *)MEMORY[0x1E4F1C9E8];
        long long v55 = &v83;
        long long v56 = &v82;
      }
LABEL_44:
      uint64_t v39 = [v54 dictionaryWithObjects:v55 forKeys:v56 count:1];
      v60 = v53;
      uint64_t v32 = v67;
      [v52 errorWithDomain:v60 code:0 userInfo:v39];
      id v45 = 0;
      *long long v51 = (id)objc_claimAutoreleasedReturnValue();
LABEL_49:

      goto LABEL_50;
    }
    long long v41 = v20;
    goto LABEL_27;
  }
  uint64_t v28 = v27;
  uint64_t v29 = *(void *)v73;
LABEL_8:
  uint64_t v30 = 0;
  while (1)
  {
    if (*(void *)v73 != v29) {
      objc_enumerationMutation(v26);
    }
    uint64_t v31 = *(void *)(*((void *)&v72 + 1) + 8 * v30);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      break;
    }
    if (v28 == ++v30)
    {
      uint64_t v28 = [v26 countByEnumeratingWithState:&v72 objects:v88 count:16];
      if (v28) {
        goto LABEL_8;
      }
      goto LABEL_14;
    }
  }
  id v46 = DPLogHandle_ClientError();
  if (os_signpost_enabled(v46))
  {
    int v86 = 138543362;
    uint64_t v87 = v31;
    _os_signpost_emit_unreliably_with_name_impl();
  }
  long long v41 = v20;

  uint64_t v32 = v67;
  uint64_t v33 = v19;
  if (a13)
  {
    __int16 v47 = (void *)MEMORY[0x1E4F28C58];
    long long v48 = kDRRequestClientError;
    uint64_t v84 = *MEMORY[0x1E4F28568];
    v85 = @"Invalid 'recordDictionary' key";
    uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
    long long v49 = v48;
    uint64_t v32 = v67;
    [v47 errorWithDomain:v49 code:0 userInfo:v39];
    id v45 = 0;
    *a13 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v36 = v64;
    id v35 = v65;
    goto LABEL_49;
  }
  id v45 = 0;
  __int16 v36 = v64;
  id v35 = v65;
LABEL_50:

  return v45;
}

id _DPCConvertDictionaryToPlistData(void *a1, void *a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v25 = 0;
    id v7 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v5 format:200 options:0 error:&v25];
    id v8 = v25;
    if (v8)
    {
      id v9 = DPLogHandle_ClientError();
      if (os_signpost_enabled(v9))
      {
        long long v10 = [v8 localizedDescription];
        int v30 = 138543618;
        id v31 = v6;
        __int16 v32 = 2114;
        id v33 = v10;
        _os_signpost_emit_unreliably_with_name_impl();
      }
      id v11 = [NSString alloc];
      uint64_t v12 = [v8 localizedDescription];
      id v13 = (void *)v12;
      id v14 = @"Unknown";
      if (v12) {
        id v14 = (__CFString *)v12;
      }
      id v15 = (void *)[v11 initWithFormat:@"Could not serialize %@ due to error: %@", v6, v14];

      id v16 = (void *)MEMORY[0x1E4F28C58];
      id v17 = kDRRequestClientError;
      uint64_t v26 = *MEMORY[0x1E4F28568];
      uint64_t v27 = v15;
      id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v27 forKeys:&v26 count:1];
      *a3 = [v16 errorWithDomain:v17 code:0 userInfo:v18];

      id v19 = 0;
    }
    else
    {
      id v7 = v7;
      id v19 = v7;
    }
    goto LABEL_13;
  }
  id v20 = DPLogHandle_ClientError();
  if (os_signpost_enabled(v20))
  {
    id v21 = (objc_class *)objc_opt_class();
    NSStringFromClass(v21);
    int v30 = 138543618;
    id v31 = v6;
    __int16 v32 = 2114;
    id v33 = (id)objc_claimAutoreleasedReturnValue();
    _os_signpost_emit_unreliably_with_name_impl();
  }
  if (a3)
  {
    id v8 = [NSString stringWithFormat:@"%@ object is not a dictionary", v6];
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    id v23 = kDRRequestClientError;
    uint64_t v28 = *MEMORY[0x1E4F28568];
    id v29 = v8;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    [v22 errorWithDomain:v23 code:0 userInfo:v7];
    id v19 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_13:

    goto LABEL_14;
  }
  id v19 = 0;
LABEL_14:

  return v19;
}

id _DPCSubmitRapidLogRequestMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, void *a7, uint64_t a8, void *a9)
{
  id v9 = _DPCSubmitLogRequestMessage(a1, a2, a3, a4, a5, a6, a7, a8, a9);
  long long v10 = v9;
  if (v9)
  {
    xpc_dictionary_set_uint64(v9, "ClientMessageType", 5uLL);
    id v11 = v10;
  }

  return v10;
}

id _DPCEnableLogGatheringQueryMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  id v6 = _DPClientBaseMessage(a1, a2, a4, a3, a5, a6);
  id v7 = v6;
  if (v6)
  {
    xpc_dictionary_set_uint64(v6, "ClientMessageType", 3uLL);
    id v8 = v7;
  }

  return v7;
}

void *_DPClientBaseMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6)
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v11 = a1;
  id v12 = a2;
  id v13 = a3;
  id v14 = a4;
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  if (!v11)
  {
    id v21 = DPLogHandle_ClientError();
    if (os_signpost_enabled(v21))
    {
      LOWORD(v40) = 0;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (!a6) {
      goto LABEL_28;
    }
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    id v23 = kDRRequestClientError;
    uint64_t v46 = *MEMORY[0x1E4F28568];
    v47[0] = @"Missing required teamIdentifier argument";
    int v24 = (void *)MEMORY[0x1E4F1C9E8];
    id v25 = (__CFString **)v47;
    uint64_t v26 = &v46;
LABEL_26:
    int v30 = [v24 dictionaryWithObjects:v25 forKeys:v26 count:1];
    *a6 = [v22 errorWithDomain:v23 code:0 userInfo:v30];

LABEL_27:
    a6 = 0;
    goto LABEL_28;
  }
  if (!v12)
  {
    uint64_t v27 = DPLogHandle_ClientError();
    if (os_signpost_enabled(v27))
    {
      LOWORD(v40) = 0;
      _os_signpost_emit_unreliably_with_name_impl();
    }

    if (!a6) {
      goto LABEL_28;
    }
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    id v23 = kDRRequestClientError;
    uint64_t v44 = *MEMORY[0x1E4F28568];
    id v45 = @"Missing required issueCategory argument";
    int v24 = (void *)MEMORY[0x1E4F1C9E8];
    id v25 = &v45;
    uint64_t v26 = &v44;
    goto LABEL_26;
  }
  if (!v14)
  {
    if (!a6) {
      goto LABEL_28;
    }
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    id v23 = kDRRequestClientError;
    uint64_t v42 = *MEMORY[0x1E4F28568];
    int v43 = @"Missing required logType argument";
    int v24 = (void *)MEMORY[0x1E4F1C9E8];
    id v25 = &v43;
    uint64_t v26 = &v42;
    goto LABEL_26;
  }
  xpc_dictionary_set_string(v15, "TeamID", (const char *)[v11 UTF8String]);
  xpc_dictionary_set_string(v15, "Category", (const char *)[v12 UTF8String]);
  xpc_dictionary_set_string(v15, "LogType", (const char *)[v14 UTF8String]);
  xpc_dictionary_set_uint64(v15, "RequestMCT", a5);
  if (!v13)
  {
LABEL_35:
    a6 = v15;
    goto LABEL_28;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v35 = 0;
    id v16 = _DPCConvertDictionaryToPlistData(v13, @"Context dictionary", &v35);
    id v17 = v35;
    id v18 = v17;
    if (!v16)
    {
      if (a6) {
        *a6 = v17;
      }
      goto LABEL_33;
    }
    if ((unint64_t)[v16 length] >= 0x800)
    {
      id v19 = DPLogHandle_ClientError();
      if (os_signpost_enabled(v19))
      {
        LOWORD(v40) = 0;
        _os_signpost_emit_unreliably_with_name_impl();
      }

      if (a6)
      {
        uint64_t v34 = (void *)MEMORY[0x1E4F28C58];
        id v33 = kDRRequestClientError;
        uint64_t v36 = *MEMORY[0x1E4F28568];
        id v37 = kDRRequestOversizedContextDictErrorString;
        id v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
        *a6 = [v34 errorWithDomain:v33 code:0 userInfo:v20];
      }
LABEL_33:

      goto LABEL_27;
    }
    id v32 = v16;
    xpc_dictionary_set_data(v15, "ContextDict", (const void *)[v32 bytes], objc_msgSend(v32, "length"));

    goto LABEL_35;
  }
  uint64_t v28 = DPLogHandle_ClientError();
  if (os_signpost_enabled(v28))
  {
    id v29 = (objc_class *)objc_opt_class();
    NSStringFromClass(v29);
    int v40 = 138543362;
    id v41 = (id)objc_claimAutoreleasedReturnValue();
    _os_signpost_emit_unreliably_with_name_impl();
  }
  if (a6)
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    id v23 = kDRRequestClientError;
    uint64_t v38 = *MEMORY[0x1E4F28568];
    uint64_t v39 = @"Context dictionary object is not a dictionary";
    int v24 = (void *)MEMORY[0x1E4F1C9E8];
    id v25 = &v39;
    uint64_t v26 = &v38;
    goto LABEL_26;
  }
LABEL_28:

  return a6;
}

id _DPCEnableLogGatheringQueryResultInjectionMessage(void *a1, void *a2, void *a3, void *a4, uint64_t a5, unsigned int a6, void *a7)
{
  id v8 = _DPClientBaseMessage(a1, a2, a4, a3, a5, a7);
  id v9 = v8;
  if (v8)
  {
    xpc_dictionary_set_uint64(v8, "ClientMessageType", 0x68uLL);
    xpc_dictionary_set_uint64(v9, "InjectEnableLogGatheringQueryInjectedResult", a6);
    id v10 = v9;
  }

  return v9;
}

uint64_t _DRCSetDampeningIsEnabled(BOOL a1, uint64_t a2)
{
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  id v5 = v4;
  if (v4)
  {
    xpc_dictionary_set_uint64(v4, "ClientMessageType", 0x64uLL);
    xpc_dictionary_set_BOOL(v5, "DampeningEnabled", a1);
    uint64_t v6 = _sendAdminRequestMessage_WaitForReply(v5, a2);
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t _sendAdminRequestMessage_WaitForReply(void *a1, uint64_t a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = _DPClientXPCSendMessageWithReplySync(a1);
  xpc_object_t v4 = v3;
  if (v3)
  {
    if (xpc_dictionary_get_BOOL(v3, "AdminRequest_Reply"))
    {
      a2 = 1;
      goto LABEL_18;
    }
    string = xpc_dictionary_get_string(v4, "AdminRequest_RejectionReason");
    id v10 = DPLogHandle_AdminError();
    if (os_signpost_enabled(v10))
    {
      id v11 = "Unknown";
      if (string) {
        id v11 = string;
      }
      *(_DWORD *)buf = 136446210;
      id v19 = v11;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AdminRequestRejected", "Rejected due to reason: %{public}s", buf, 0xCu);
    }

    if (a2)
    {
      if (string)
      {
        id v8 = [NSString stringWithUTF8String:string];
      }
      else
      {
        id v8 = @"Unknown";
      }
      id v12 = (void *)MEMORY[0x1E4F28C58];
      id v13 = kDRRequestClientError;
      uint64_t v16 = *MEMORY[0x1E4F28568];
      id v17 = v8;
      id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v17 forKeys:&v16 count:1];
      *(void *)a2 = [v12 errorWithDomain:v13 code:0 userInfo:v14];

      goto LABEL_17;
    }
  }
  else
  {
    id v5 = DPLogHandle_AdminError();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AdminRequestFailed", "Failed due to invalid/interrupted service connection", buf, 2u);
    }

    if (a2)
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F28C58];
      id v7 = kDRRequestClientError;
      uint64_t v20 = *MEMORY[0x1E4F28568];
      v21[0] = @"Invalid/interrupted service connection";
      id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
      *(void *)a2 = [v6 errorWithDomain:v7 code:0 userInfo:v8];
LABEL_17:

      a2 = 0;
    }
  }
LABEL_18:

  return a2;
}

uint64_t _DRCResetDampeningConfigurationToDefault(uint64_t a1)
{
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  id v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_uint64(v2, "ClientMessageType", 0x65uLL);
    uint64_t v4 = _sendAdminRequestMessage_WaitForReply(v3, a1);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t _DRCSetDampeningConfigurationDefaults(void *a1, void *a2, void *a3, void *a4, void *a5, void *a6, void *a7, void *a8, void *a9, void *a10, void *a11, uint64_t a12)
{
  id v33 = a1;
  id v37 = a2;
  id v36 = a3;
  id v35 = a4;
  id v34 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  xpc_object_t v25 = xpc_dictionary_create(0, 0, 0);
  uint64_t v26 = v25;
  if (v25)
  {
    xpc_dictionary_set_uint64(v25, "ClientMessageType", 0x66uLL);
    uint64_t v27 = v33;
    if (v33) {
      xpc_dictionary_set_BOOL(v26, "EnforceResourceHysteresis", [v33 BOOLValue]);
    }
    uint64_t v28 = v37;
    if (v37) {
      xpc_dictionary_set_BOOL(v26, "EnforceResourceCap", [v37 BOOLValue]);
    }
    if (v36) {
      xpc_dictionary_set_BOOL(v26, "EnforceResourceDownsampling", [v36 BOOLValue]);
    }
    if (v35) {
      xpc_dictionary_set_BOOL(v26, "EnforceSignatureHysteresis", [v35 BOOLValue]);
    }
    if (v34) {
      xpc_dictionary_set_BOOL(v26, "EnforceSignatureCap", [v34 BOOLValue]);
    }
    if (v20) {
      xpc_dictionary_set_BOOL(v26, "EnforceTotalCap", [v20 BOOLValue]);
    }
    if (v19) {
      xpc_dictionary_set_BOOL(v26, "EnforceSignatureDownsampling", [v19 BOOLValue]);
    }
    if (v22) {
      xpc_dictionary_set_uint64(v26, "DefaultSignatureCap", [v22 unsignedIntegerValue]);
    }
    if (v24) {
      xpc_dictionary_set_uint64(v26, "TotalCap", [v24 unsignedIntegerValue]);
    }
    if (v21)
    {
      [v21 doubleValue];
      uint64_t v28 = v37;
      xpc_dictionary_set_double(v26, "DefaultSignatureHysteresis", v29);
    }
    if (v23)
    {
      [v23 doubleValue];
      uint64_t v28 = v37;
      xpc_dictionary_set_double(v26, "AcceptanceRate", v30);
    }
    uint64_t v31 = _sendAdminRequestMessage_WaitForReply(v26, a12);
  }
  else
  {
    uint64_t v31 = 0;
    uint64_t v27 = v33;
    uint64_t v28 = v37;
  }

  return v31;
}

uint64_t _DPCRefreshDampeningConfiguration(void *a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  id v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_uint64(v2, "ClientMessageType", 0x6AuLL);
    uint64_t v4 = _sendAdminRequestMessage_WaitForReply(v3, (uint64_t)a1);
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v6 = kDRRequestClientError;
    uint64_t v9 = *MEMORY[0x1E4F28568];
    v10[0] = @"Failed to create message";
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    *a1 = [v5 errorWithDomain:v6 code:0 userInfo:v7];

    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t _DRCTriggerCloudKitWork(BOOL a1, BOOL a2, uint64_t a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  id v7 = v6;
  if (v6)
  {
    xpc_dictionary_set_uint64(v6, "ClientMessageType", 0x67uLL);
    xpc_dictionary_set_BOOL(v7, "isExpedited", a1);
    xpc_dictionary_set_BOOL(v7, "isAsync", a2);
    uint64_t v8 = _sendAdminRequestMessage_WaitForReply(v7, a3);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t _DPCInjectEnableLogGatheringQueryResult(void *a1, void *a2, void *a3, void *a4, unsigned int a5, id *a6)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  id v12 = a3;
  id v13 = a2;
  id v14 = a1;
  uint64_t v15 = mach_continuous_time();
  uint64_t v16 = _DPCEnableLogGatheringQueryResultInjectionMessage(v14, v13, v12, v11, v15, a5, a6);

  if (v16)
  {
    uint64_t v17 = _sendAdminRequestMessage_WaitForReply(v16, (uint64_t)a6);
  }
  else
  {
    id v18 = @"Unknown";
    if (a6)
    {
      uint64_t v19 = [*a6 localizedDescription];
      id v20 = (void *)v19;
      if (v19) {
        id v21 = (__CFString *)v19;
      }
      else {
        id v21 = @"Unknown";
      }
      id v18 = v21;
    }
    id v22 = DPLogHandle_AdminError();
    if (os_signpost_enabled(v22))
    {
      int v24 = 138543362;
      xpc_object_t v25 = v18;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v22, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "InjectEnableLogGatheringQueryResultFailure", "Failed due to error: %{public}@", (uint8_t *)&v24, 0xCu);
    }

    uint64_t v17 = 0;
  }

  return v17;
}

uint64_t _DPCTriggerRequestClean(BOOL a1, BOOL a2, uint64_t a3)
{
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  id v7 = v6;
  if (v6)
  {
    if (a1 && a2)
    {
      uint64_t v8 = 1;
    }
    else
    {
      xpc_dictionary_set_uint64(v6, "ClientMessageType", 0x69uLL);
      xpc_dictionary_set_BOOL(v7, "KeepRequestRecords", a1);
      xpc_dictionary_set_BOOL(v7, "KeepRequestLogs", a2);
      uint64_t v8 = _sendAdminRequestMessage_WaitForReply(v7, a3);
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t _getCKConfig(int a1, BOOL *a2, BOOL *a3, BOOL *a4, void *a5)
{
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  id v11 = v10;
  if (a1) {
    uint64_t v12 = 109;
  }
  else {
    uint64_t v12 = 108;
  }
  xpc_dictionary_set_uint64(v10, "ClientMessageType", v12);
  uint64_t v13 = _sendCKConfigMessageAndHandleReply(v11, a2, a3, a4, a5);

  return v13;
}

uint64_t _sendCKConfigMessageAndHandleReply(void *a1, BOOL *a2, BOOL *a3, BOOL *a4, void *a5)
{
  uint64_t v5 = (uint64_t)a5;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = _sendAdminRequestMessage_GetReply(a1, a5);
  xpc_object_t v10 = v9;
  if (!v9) {
    goto LABEL_21;
  }
  id v11 = v9;
  if (MEMORY[0x1E0198410]() != MEMORY[0x1E4F14590])
  {
    uint64_t v12 = (char *)MEMORY[0x1E0198330](v11);
    uint64_t v13 = DPLogHandle_ClientXPCError();
    if (!os_signpost_enabled(v13)) {
      goto LABEL_17;
    }
    id v14 = "Unknown";
    if (v12) {
      id v14 = v12;
    }
    *(_DWORD *)buf = 136446210;
    double v30 = v14;
    uint64_t v15 = "InvalidCKConfigReplyType";
    uint64_t v16 = "Unexpected reply type: %{public}s";
    goto LABEL_16;
  }
  uint64_t v17 = xpc_dictionary_get_value(v11, "ContainerEnv");
  if (v17)
  {
    id v18 = (void *)v17;
    uint64_t v19 = xpc_dictionary_get_value(v11, "RapidEnv");
    if (v19)
    {
      id v20 = (void *)v19;
      id v21 = xpc_dictionary_get_value(v11, "OverridesDefault");

      if (v21)
      {

        *a2 = xpc_dictionary_get_BOOL(v11, "ContainerEnv");
        *a3 = xpc_dictionary_get_BOOL(v11, "RapidEnv");
        *a4 = xpc_dictionary_get_BOOL(v11, "OverridesDefault");
        uint64_t v5 = 1;
        goto LABEL_22;
      }
    }
    else
    {
    }
  }
  uint64_t v12 = (char *)MEMORY[0x1E0198330](v11);
  uint64_t v13 = DPLogHandle_ClientXPCError();
  if (os_signpost_enabled(v13))
  {
    id v22 = "Unknown";
    if (v12) {
      id v22 = v12;
    }
    *(_DWORD *)buf = 136446210;
    double v30 = v22;
    uint64_t v15 = "CKConfigMissingKeys";
    uint64_t v16 = "Missing required keys from reply: %{public}s";
LABEL_16:
    _os_signpost_emit_with_name_impl(&dword_1DC01F000, v13, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v15, v16, buf, 0xCu);
  }
LABEL_17:

  if (v12) {
    free(v12);
  }

  if (v5)
  {
    id v23 = (void *)MEMORY[0x1E4F28C58];
    int v24 = kDRRequestClientError;
    uint64_t v27 = *MEMORY[0x1E4F28568];
    uint64_t v28 = @"Invalid reply";
    xpc_object_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    *(void *)uint64_t v5 = [v23 errorWithDomain:v24 code:0 userInfo:v25];

LABEL_21:
    uint64_t v5 = 0;
  }
LABEL_22:

  return v5;
}

uint64_t _DPCResetCKConfig(BOOL *a1, BOOL *a2, BOOL *a3, void *a4)
{
  return _getCKConfig(1, a1, a2, a3, a4);
}

uint64_t _DPCGetCKConfig(BOOL *a1, BOOL *a2, BOOL *a3, void *a4)
{
  return _getCKConfig(0, a1, a2, a3, a4);
}

uint64_t _DPCSetCKConfig(BOOL a1, BOOL a2, BOOL *a3, BOOL *a4, BOOL *a5, void *a6)
{
  xpc_object_t v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v12, "ClientMessageType", 0x6BuLL);
  xpc_dictionary_set_BOOL(v12, "ContainerEnv", a1);
  xpc_dictionary_set_BOOL(v12, "RapidEnv", a2);
  xpc_dictionary_set_BOOL(v12, "OverridesDefault", 1);
  uint64_t v13 = _sendCKConfigMessageAndHandleReply(v12, a3, a4, a5, a6);

  return v13;
}

void *_DPCSchedulePermissiveExpeditedUploadActivity(unsigned int a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  uint64_t v5 = v4;
  if (v4)
  {
    xpc_dictionary_set_uint64(v4, "ClientMessageType", 0x6EuLL);
    xpc_dictionary_set_uint64(v5, "delaySeconds", a1);
    a2 = (void *)_sendAdminRequestMessage_WaitForReply(v5, (uint64_t)a2);
  }
  else if (a2)
  {
    xpc_object_t v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = kDRRequestClientError;
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"Failed to allocate XPC message";
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a2 = [v6 errorWithDomain:v7 code:0 userInfo:v8];

    a2 = 0;
  }

  return a2;
}

void *_DPCCancelPermissiveExpeditedUploadActivity(void *a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  xpc_object_t v2 = xpc_dictionary_create(0, 0, 0);
  id v3 = v2;
  if (v2)
  {
    xpc_dictionary_set_uint64(v2, "ClientMessageType", 0x6FuLL);
    a1 = (void *)_sendAdminRequestMessage_WaitForReply(v3, (uint64_t)a1);
  }
  else if (a1)
  {
    xpc_object_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = kDRRequestClientError;
    uint64_t v8 = *MEMORY[0x1E4F28568];
    v9[0] = @"Failed to allocate XPC message";
    xpc_object_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    *a1 = [v4 errorWithDomain:v5 code:0 userInfo:v6];

    a1 = 0;
  }

  return a1;
}

void *_DPCSetIgnoreAutomatedDeviceGroup(void *a1, void *a2, void *a3)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  id v7 = v6;
  if (v6)
  {
    xpc_dictionary_set_uint64(v6, "ClientMessageType", 0x71uLL);
    if (v5) {
      xpc_dictionary_set_BOOL(v7, "IgnoreADGValue", [v5 BOOLValue]);
    }
    a3 = (void *)_sendIgnoreADGMessage(v7, a2, a3);
  }
  else if (a3)
  {
    uint64_t v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = kDRRequestClientError;
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"Failed to allocate XPC message";
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    *a3 = [v8 errorWithDomain:v9 code:0 userInfo:v10];

    a3 = 0;
  }

  return a3;
}

BOOL _sendIgnoreADGMessage(void *a1, void *a2, void *a3)
{
  xpc_object_t v4 = _sendAdminRequestMessage_GetReply(a1, a3);
  id v5 = v4;
  if (v4)
  {
    *a2 = 0;
    xpc_object_t v6 = xpc_dictionary_get_value(v4, "IgnoreADGValue");

    if (v6)
    {
      objc_msgSend(NSNumber, "numberWithBool:", xpc_dictionary_get_BOOL(v5, "IgnoreADGValue"));
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v5 != 0;
}

void *_DPCGetIgnoreAutomatedDeviceGroup(void *a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  id v5 = v4;
  if (v4)
  {
    xpc_dictionary_set_uint64(v4, "ClientMessageType", 0x70uLL);
    a2 = (void *)_sendIgnoreADGMessage(v5, a1, a2);
  }
  else if (a2)
  {
    xpc_object_t v6 = (void *)MEMORY[0x1E4F28C58];
    id v7 = kDRRequestClientError;
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"Failed to allocate XPC message";
    uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    *a2 = [v6 errorWithDomain:v7 code:0 userInfo:v8];

    a2 = 0;
  }

  return a2;
}

void *_sendAdminRequestMessage_GetReply(void *a1, void *a2)
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v3 = _DPClientXPCSendMessageWithReplySync(a1);
  xpc_object_t v4 = v3;
  if (v3)
  {
    if (xpc_dictionary_get_BOOL(v3, "AdminRequest_Reply"))
    {
      a2 = v4;
      goto LABEL_18;
    }
    string = xpc_dictionary_get_string(v4, "AdminRequest_RejectionReason");
    uint64_t v10 = DPLogHandle_AdminError();
    if (os_signpost_enabled(v10))
    {
      id v11 = "Unknown";
      if (string) {
        id v11 = string;
      }
      *(_DWORD *)buf = 136446210;
      id v20 = v11;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v10, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AdminRequestRejected", "Rejected due to reason: %{public}s", buf, 0xCu);
    }

    if (a2)
    {
      if (string)
      {
        uint64_t v12 = [NSString stringWithUTF8String:string];
      }
      else
      {
        uint64_t v12 = @"Unknown";
      }
      uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
      id v14 = kDRRequestClientError;
      uint64_t v17 = *MEMORY[0x1E4F28568];
      id v18 = v12;
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
      *a2 = [v13 errorWithDomain:v14 code:0 userInfo:v15];

      goto LABEL_17;
    }
  }
  else
  {
    id v5 = DPLogHandle_AdminError();
    if (os_signpost_enabled(v5))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1DC01F000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "AdminRequestFailed", "Failed due to invalid/interrupted service connection", buf, 2u);
    }

    if (a2)
    {
      xpc_object_t v6 = (void *)MEMORY[0x1E4F28C58];
      id v7 = kDRRequestClientError;
      uint64_t v21 = *MEMORY[0x1E4F28568];
      v22[0] = @"Invalid/interrupted service connection";
      uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:&v21 count:1];
      *a2 = [v6 errorWithDomain:v7 code:0 userInfo:v8];

LABEL_17:
      a2 = 0;
    }
  }
LABEL_18:

  return a2;
}

void _DRCTaskingConnectionStateFinalizer_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1DC01F000, log, OS_LOG_TYPE_ERROR, "Deallocated service connection", v1, 2u);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_signpost_emit_unreliably_with_name_impl()
{
  return MEMORY[0x1F40CA058]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1F40CC910]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1F40CC930]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1F40CCA60](info);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1F4181648]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1F4181660](a1);
}

{
  MEMORY[0x1F4181668](context);
}

{
  return (void *)MEMORY[0x1F4181670]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181678](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1F4181688]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1F4181758](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1F4181780](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1F41817A8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1F41817B0]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1F41817B8]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1F41818B0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1F41818B8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1F40CD360](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1F40CDE00]();
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1F40CEA38]();
}

void xpc_array_set_BOOL(xpc_object_t xarray, size_t index, BOOL value)
{
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
}

void xpc_connection_activate(xpc_connection_t connection)
{
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1F40CEC68](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

uint64_t xpc_copy_event()
{
  return MEMORY[0x1F40CED58]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1F40CEE98](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1F40CF148](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1F40CF250]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}