void sub_1D773AC64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D773B6CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1D7744184(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D774716C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void ___containermanagerd_listener_handler_block_invoke(void *a1, void *a2)
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)a1[4];
  v5 = (void *)a1[5];
  v7 = (void *)a1[6];
  v6 = (void *)a1[7];
  id v65 = v4;
  id v8 = v5;
  id v9 = v7;
  connection = v6;
  id v66 = v3;
  if (_containermanagerd_connection_handler_onceToken != -1) {
    dispatch_once(&_containermanagerd_connection_handler_onceToken, &__block_literal_global_204);
  }
  BOOL v10 = MEMORY[0x1D94798D0](v66) == MEMORY[0x1E4F145A8];
  v11 = v66;
  if (!v10)
  {
    v12 = (void *)_containermanagerd_connection_handler_dispatcher;
    id v13 = v66;
    id v62 = v65;
    id v63 = v8;
    id v14 = v9;
    id v61 = v12;
    xpc_object_t reply = xpc_dictionary_create_reply(v13);
    v58 = v14;
    if (!reply)
    {
      container_log_handle_for_category();
      v23 = (MCMReply *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v23->super, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D7739000, &v23->super, OS_LOG_TYPE_ERROR, "Dictionary does not have reply context", buf, 2u);
      }
      goto LABEL_41;
    }
    uint64_t uint64 = xpc_dictionary_get_uint64(v13, "Command");
    v54 = (void *)MEMORY[0x1D9478DF0]();
    uint64_t v70 = 0;
    v71 = &v70;
    uint64_t v72 = 0x3032000000;
    v73 = __Block_byref_object_copy__8990;
    v74 = __Block_byref_object_dispose__8991;
    id v75 = 0;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __MCMProcessXPCEvent_block_invoke;
    block[3] = &unk_1E6A80730;
    id v16 = v14;
    id v69 = v16;
    if (MCMProcessXPCEvent_onceToken != -1) {
      dispatch_once(&MCMProcessXPCEvent_onceToken, block);
    }
    v17 = container_log_handle_for_category();
    os_signpost_id_t v59 = os_signpost_id_make_with_pointer(v17, v13);

    v18 = container_log_handle_for_category();
    v19 = v18;
    if (v59 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_DWORD *)buf = 134349056;
      *(void *)&buf[4] = uint64;
      _os_signpost_emit_with_name_impl(&dword_1D7739000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v59, "XPCEventProcessing", " command=%{public, signpost.description:attribute}llu ", buf, 0xCu);
    }

    if (uint64 >= 0x32)
    {
      v20 = container_log_handle_for_category();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        *(void *)&buf[4] = uint64;
        _os_log_error_impl(&dword_1D7739000, v20, OS_LOG_TYPE_ERROR, "Invalid command index: %lld", buf, 0xCu);
      }

      v56 = [[MCMError alloc] initWithErrorType:49 category:3];
      v21 = 0;
      v55 = 0;
      v22 = 0;
      id v57 = 0;
LABEL_30:
      int v40 = 0;
LABEL_37:
      uint64_t v41 = os_transaction_create();
      v42 = (void *)v71[5];
      v71[5] = v41;

      v43 = [MCMResultPromise alloc];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __MCMProcessXPCEvent_block_invoke_10;
      v78 = &unk_1E6A801F8;
      os_signpost_id_t v81 = v59;
      uint64_t v82 = uint64;
      id v44 = v21;
      id v79 = v44;
      v80 = &v70;
      v45 = [(MCMResultPromise *)v43 initWithCompletion:buf];

      v23 = [[MCMReply alloc] initWithXpcReply:reply slowWorkloop:v63 fastWorkloop:v62 resultPromise:v45];
      if (v40)
      {
        [v61 dispatchMessage:v13 context:v22 reply:v23];
      }
      else
      {
        v46 = [[MCMResultBase alloc] initWithError:v56];
        [(MCMResultPromise *)v45 completeWithResult:v46];
      }
      _Block_object_dispose(&v70, 8);

      [(MCMReply *)v23 send];

LABEL_41:
      v11 = v66;
      if (!reply)
      {
        xpc_connection_cancel(connection);
        v11 = v66;
      }
      goto LABEL_43;
    }
    id v57 = [[MCMClientMessageContext alloc] initForCurrentThreadContextWithXPCMessage:v13 userIdentityCache:v16];
    id v67 = 0;
    v21 = [(id)MCMProcessXPCEvent_clientFactory clientIdentityWithClientMessageContext:v57 xpcMessage:v13 error:&v67];
    v56 = (MCMError *)v67;
    if (!v21)
    {
      v39 = container_log_handle_for_category();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        int v47 = [v57 pid];
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = v47;
        *(_WORD *)&buf[8] = 2112;
        *(void *)&buf[10] = v56;
        _os_log_error_impl(&dword_1D7739000, v39, OS_LOG_TYPE_ERROR, "Error creating client identity for pid %d; error = %@",
          buf,
          0x12u);
      }

      v21 = 0;
      v55 = 0;
      v22 = 0;
      goto LABEL_30;
    }
    v24 = [MCMContainerFactory alloc];
    v55 = [(MCMContainerFactory *)v24 initWithContainerCache:gContainerCache clientIdentity:v21 userIdentityCache:v16];
    uint64_t current_persona = voucher_get_current_persona();
    v26 = [MCMCommandContext alloc];
    uint64_t v27 = gContainerCache;
    id v28 = containermanager_copy_global_configuration();
    v22 = [(MCMCommandContext *)v26 initWithClientIdentity:v21 containerCache:v27 containerFactory:v55 userIdentityCache:v16 kernelPersonaID:current_persona globalConfiguration:v28];

    id v29 = containermanager_copy_global_configuration();
    LODWORD(v27) = [v29 dispositionForContainerClass:2] == 1;

    if (!v27)
    {
LABEL_36:
      int v40 = 1;
      goto LABEL_37;
    }
    v22 = v22;
    v30 = [(MCMCommandContext *)v22 clientIdentity];
    v53 = [v30 codeSignInfo];
    if ([v30 cached] & 1) != 0 || (objc_msgSend(v53, "cached"))
    {
LABEL_35:

      goto LABEL_36;
    }
    context = (void *)MEMORY[0x1D9478DF0]();
    v31 = (void *)gCodeSigningMapping;
    v32 = [v53 entitlements];
    v33 = [v53 identifier];
    id v76 = 0;
    v52 = [v31 processCallerRegisteredEntitlements:v32 identifier:v33 error:&v76];
    id v50 = v76;

    if (v52)
    {
      if (![v52 count])
      {
LABEL_34:

        goto LABEL_35;
      }
      oslog = objc_alloc_init(MCMResultPromise);
      v34 = [v52 allObjects];
      v35 = +[MCMCommandOperationDelete commandForOperationDeleteWithContainerIdentities:v34 removeAllCodeSignInfo:0 context:v22 resultPromise:oslog];

      [v35 execute];
      v36 = [(MCMResultPromise *)oslog result];
      v37 = [v36 error];

      if (v37)
      {
        v38 = container_log_handle_for_category();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v37;
          _os_log_error_impl(&dword_1D7739000, v38, OS_LOG_TYPE_ERROR, "Failed to destroy container(s) when processing codesign entitlements; error = %@",
            buf,
            0xCu);
        }
      }
    }
    else
    {
      container_log_handle_for_category();
      oslog = (MCMResultPromise *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&oslog->super, OS_LOG_TYPE_ERROR))
      {
        v48 = [v53 identifier];
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v48;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v50;
        _os_log_error_impl(&dword_1D7739000, &oslog->super, OS_LOG_TYPE_ERROR, "Error processing entitlements for %@ : %@", buf, 0x16u);
      }
    }

    goto LABEL_34;
  }
LABEL_43:
}

void sub_1D77482C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

id containermanager_copy_global_configuration()
{
  v0 = (void *)_gGlobalConfiguration;
  if (!_gGlobalConfiguration)
  {
    _os_crash();
    __break(1u);
  }

  return v0;
}

void sub_1D774AE38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
}

void sub_1D774B3D8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D774B498(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8990(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8991(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
}

void sub_1D774DFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

id MCMContainerSchemaDefinitionForClass(unint64_t a1)
{
  if (MCMContainerSchemaDefinitionForClass_onceToken != -1) {
    dispatch_once(&MCMContainerSchemaDefinitionForClass_onceToken, &__block_literal_global_7656);
  }
  if (a1 <= 0xD)
  {
    if (((1 << a1) & 0xE54) != 0)
    {
      v2 = (void *)MCMContainerSchemaDefinitionForClass_userDataSchemaDefinition;
LABEL_10:
      id v3 = v2;
      goto LABEL_11;
    }
    if (((1 << a1) & 0x2080) != 0)
    {
      v2 = (void *)MCMContainerSchemaDefinitionForClass_groupSchemaDefinition;
      goto LABEL_10;
    }
    if (a1 == 12)
    {
      v2 = (void *)MCMContainerSchemaDefinitionForClass_systemSchemaDefinition;
      goto LABEL_10;
    }
  }
  id v3 = (id)MEMORY[0x1E4F1CBF0];
  id v5 = MEMORY[0x1E4F1CBF0];
LABEL_11:

  return v3;
}

void sub_1D774E7CC(_Unwind_Exception *exception_object)
{
}

id __MCMProcessXPCEvent_block_invoke_10(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = container_log_handle_for_category();
  id v5 = v4;
  os_signpost_id_t v6 = *(void *)(a1 + 48);
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    uint64_t v7 = *(void *)(a1 + 56);
    id v8 = [*(id *)(a1 + 32) codeSignInfo];
    uint64_t v9 = [v8 identifier];
    BOOL v10 = (void *)v9;
    v11 = @"<unknown>";
    if (v9) {
      v11 = (__CFString *)v9;
    }
    int v26 = 134349315;
    *(void *)uint64_t v27 = v7;
    *(_WORD *)&v27[8] = 2113;
    *(void *)&v27[10] = v11;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v5, OS_SIGNPOST_INTERVAL_END, v6, "XPCEventProcessing", " command=%{public, signpost.description:attribute}llu  clientIdentifier=%{private, signpost.description:attribute}@ ", (uint8_t *)&v26, 0x16u);
  }
  v12 = [v3 error];

  id v13 = container_log_handle_for_category();
  id v14 = v13;
  if (v12)
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    id v15 = containermanager_copy_global_configuration();
    id v16 = [v15 currentUser];
    int v17 = [v16 UID];
    uint64_t v18 = *(void *)(a1 + 56);
    v19 = [*(id *)(a1 + 32) shortDescription];
    v20 = [v3 error];
    int v26 = 67109890;
    *(_DWORD *)uint64_t v27 = v17;
    *(_WORD *)&v27[4] = 2048;
    *(void *)&v27[6] = v18;
    *(_WORD *)&v27[14] = 2112;
    *(void *)&v27[16] = v19;
    __int16 v28 = 2112;
    id v29 = v20;
    _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "[%u] command=%llu, client=%@, error=%@", (uint8_t *)&v26, 0x26u);
  }
  else
  {
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_12;
    }
    id v15 = containermanager_copy_global_configuration();
    id v16 = [v15 currentUser];
    int v21 = [v16 UID];
    uint64_t v22 = *(void *)(a1 + 56);
    v19 = [*(id *)(a1 + 32) shortDescription];
    int v26 = 67109634;
    *(_DWORD *)uint64_t v27 = v21;
    *(_WORD *)&v27[4] = 2048;
    *(void *)&v27[6] = v22;
    *(_WORD *)&v27[14] = 2112;
    *(void *)&v27[16] = v19;
    _os_log_impl(&dword_1D7739000, v14, OS_LOG_TYPE_DEFAULT, "[%u] command=%llu, client=%@, error=(null)", (uint8_t *)&v26, 0x1Cu);
  }

LABEL_12:
  uint64_t v23 = *(void *)(*(void *)(a1 + 40) + 8);
  v24 = *(void **)(v23 + 40);
  *(void *)(v23 + 40) = 0;

  return v3;
}

void sub_1D7750B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D7752CE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D7759224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
}

void sub_1D775A694(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void ___containermanagerd_start_xpc_block_invoke_149(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    _containermanagerd_listener_handler_for_permanent_error(v5, v3, v4);
    _containermanagerd_self_destruct(*(void **)(a1 + 40));
  }
  else
  {
    os_signpost_id_t v6 = *(void **)(a1 + 48);
    uint64_t v7 = *(void **)(a1 + 56);
    id v8 = v5;
    id v9 = v6;
    id v10 = v7;
    v11 = (_xpc_connection_s *)v3;
    if (MEMORY[0x1D94798D0]() == MEMORY[0x1E4F14578])
    {
      xpc_connection_set_target_queue(v11, v8);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = ___containermanagerd_listener_handler_block_invoke;
      handler[3] = &unk_1E6A7F4D8;
      id v14 = v8;
      id v15 = v9;
      id v16 = v10;
      v12 = v11;
      int v17 = v12;
      xpc_connection_set_event_handler(v12, handler);
      xpc_connection_resume(v12);
    }
  }
}

void sub_1D775C95C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _Xget_process_containers(uint64_t a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ((*(_DWORD *)a1 & 0x80000000) == 0 || *(_DWORD *)(a1 + 24) != 1 || *(_DWORD *)(a1 + 4) != 56)
  {
    int v4 = -304;
    goto LABEL_10;
  }
  if (*(unsigned char *)(a1 + 39) != 1 || *(_DWORD *)(a1 + 40) != *(_DWORD *)(a1 + 52))
  {
    int v4 = -300;
    goto LABEL_10;
  }
  int v11 = 0;
  if (*(_DWORD *)(a1 + 56) || *(_DWORD *)(a1 + 60) <= 0x1Fu)
  {
    int v4 = -309;
LABEL_10:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_11;
  }
  *(_DWORD *)(a2 + 52) = 0;
  id v5 = (mach_msg_type_number_t *)(a2 + 52);
  os_signpost_id_t v6 = (vm_offset_t *)(a2 + 28);
  *(_DWORD *)(a2 + 36) = *(unsigned __int8 *)(a2 + 36) | 0x1000100;
  uint64_t v7 = *(void **)(a1 + 28);
  unsigned int v8 = *(_DWORD *)(a1 + 40);
  long long v9 = *(_OWORD *)(a1 + 92);
  v12[0] = *(_OWORD *)(a1 + 76);
  v12[1] = v9;
  int process_containers = server_get_process_containers(v7, v8, v6, v5, &v11, v12);
  mig_deallocate(*(void *)(a1 + 28), *(unsigned int *)(a1 + 40));
  *(void *)(a1 + 28) = 0;
  *(_DWORD *)(a1 + 40) = 0;
  if (!process_containers)
  {
    *(unsigned char *)(a2 + 36) = v11;
    *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
    *(void *)(a2 + 44) = *MEMORY[0x1E4F14068];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return;
  }
  *(_DWORD *)(a2 + 32) = process_containers;
LABEL_11:
  *(void *)(a2 + 24) = *MEMORY[0x1E4F14068];
}

uint64_t server_get_process_containers(void *a1, unsigned int a2, vm_offset_t *a3, mach_msg_type_number_t *a4, _DWORD *a5, _OWORD *a6)
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  if (_os_feature_enabled_impl())
  {
    long long v12 = a6[1];
    *(_OWORD *)atoken = *a6;
    *(_OWORD *)&atoken[16] = v12;
    pidp[0] = 0;
    audit_token_to_au32((audit_token_t *)atoken, 0, 0, 0, 0, 0, pidp, 0, 0);
    if (pidp[0]) {
      return 5;
    }
    uint64_t v22 = (void *)MEMORY[0x1D9478DF0]();
    uint64_t v23 = (uint64_t *)sb_packbuff_new(0x1000uLL);
    if (v23)
    {
      v24 = v23;
      sb_packbuff_pack_uint32(v23, 0, 1);
      vm_address_t bytes = sb_packbuff_get_bytes((uint64_t)v24);
      uint64_t size = sb_packbuff_get_size((uint64_t)v24);
      uint64_t v13 = vm_read(*MEMORY[0x1E4F14960], bytes, size, a3, a4);
      if (v13)
      {
        uint64_t v27 = container_log_handle_for_category();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)atoken = 134218496;
          *(void *)&atoken[4] = bytes;
          *(_WORD *)&atoken[12] = 2048;
          *(void *)&atoken[14] = size;
          *(_WORD *)&atoken[22] = 1024;
          *(_DWORD *)&atoken[24] = v13;
          _os_log_error_impl(&dword_1D7739000, v27, OS_LOG_TYPE_ERROR, "vm_read(%p, %lu) fails: %d", atoken, 0x1Cu);
        }

        *a5 = 0;
        *a4 = 0;
      }
      else
      {
        *a5 = 1;
        v53 = container_log_handle_for_category();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
        {
          mach_msg_type_number_t v71 = *a4;
          *(_DWORD *)atoken = 134218496;
          *(void *)&atoken[4] = bytes;
          *(_WORD *)&atoken[12] = 2048;
          *(void *)&atoken[14] = a3;
          *(_WORD *)&atoken[22] = 1024;
          *(_DWORD *)&atoken[24] = v71;
          _os_log_debug_impl(&dword_1D7739000, v53, OS_LOG_TYPE_DEBUG, "packbuff bytes: %p, reply bytes: %p, reply size: %u", atoken, 0x1Cu);
        }
      }
      sb_packbuff_free(v24);
    }
    else
    {
      uint64_t v13 = 9;
    }
    return v13;
  }
  unsigned int active_platform = dyld_get_active_platform();
  id v15 = container_log_handle_for_category();
  os_signpost_id_t v16 = os_signpost_id_make_with_pointer(v15, a1);

  int v17 = container_log_handle_for_category();
  uint64_t v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    *(_WORD *)atoken = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "KernelUpcall", "", atoken, 2u);
  }

  v19 = container_log_handle_for_category();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)atoken = 134217984;
    *(void *)&atoken[4] = v16;
    _os_log_impl(&dword_1D7739000, v19, OS_LOG_TYPE_DEFAULT, "<%llx> upcall start ~~~~~~~~~~~~~~~~", atoken, 0xCu);
  }

  long long v20 = a6[1];
  *(_OWORD *)atoken = *a6;
  *(_OWORD *)&atoken[16] = v20;
  pidp[0] = 0;
  audit_token_to_au32((audit_token_t *)atoken, 0, 0, 0, 0, 0, pidp, 0, 0);
  if (pidp[0])
  {
    id v21 = 0;
    uint64_t v13 = 5;
    goto LABEL_170;
  }
  unsigned int v113 = active_platform;
  __int16 v28 = (void *)MEMORY[0x1D9478DF0]();
  unsigned __int16 v125 = 0;
  int v124 = 0;
  id v29 = container_log_handle_for_category();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)atoken = 67109376;
    *(_DWORD *)&atoken[4] = a2;
    *(_WORD *)&atoken[8] = 2048;
    *(void *)&atoken[10] = a1;
    _os_log_debug_impl(&dword_1D7739000, v29, OS_LOG_TYPE_DEBUG, "request size: %u (%p)", atoken, 0x12u);
  }

  uint64_t v30 = sb_packbuff_init_with_buffer(a1, a2, 1, 0);
  uint64_t v31 = container_log_handle_for_category();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v55 = sb_packbuff_get_bytes((uint64_t)v30);
    *(_DWORD *)atoken = 134217984;
    *(void *)&atoken[4] = v55;
    _os_log_debug_impl(&dword_1D7739000, v31, OS_LOG_TYPE_DEBUG, "request packbuff byte address:%p", atoken, 0xCu);
  }

  if (!v30)
  {
    id v65 = container_log_handle_for_category();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)atoken = 0;
      _os_log_error_impl(&dword_1D7739000, v65, OS_LOG_TYPE_ERROR, "sb_packbuff_init() of request data fails", atoken, 2u);
    }
    v64 = 0;
    uint64_t v32 = 0;
    uint64_t v33 = 0;
    id v21 = 0;
    uint64_t v13 = 9;
    goto LABEL_168;
  }
  v111 = a5;
  data = a3;
  v116 = v28;
  uint64_t v119 = 0;
  v120 = 0;
  unsigned int v117 = 0;
  uint64_t v32 = 0;
  uint64_t v33 = 0;
  while (2)
  {
    if (sb_packbuff_get_item_value_type(v30, &v125))
    {
      switch(v125)
      {
        case 0u:
          uint64_t v34 = unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_CODE_SIGNATURE_ID");

          v35 = container_log_handle_for_category();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218242;
            *(void *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 2112;
            *(void *)&atoken[14] = v34;
            _os_log_impl(&dword_1D7739000, v35, OS_LOG_TYPE_DEFAULT, "<%llx> code signature: [%@]", atoken, 0x16u);
          }

          uint64_t v33 = v34;
          if (v34) {
            continue;
          }
          goto LABEL_73;
        case 1u:
          uint64_t v36 = unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_CONTAINER_ID");

          v37 = container_log_handle_for_category();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218242;
            *(void *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 2112;
            *(void *)&atoken[14] = v36;
            _os_log_impl(&dword_1D7739000, v37, OS_LOG_TYPE_DEFAULT, "<%llx> container id: [%@]", atoken, 0x16u);
          }

          uint64_t v32 = v36;
          if (v36) {
            continue;
          }
          goto LABEL_73;
        case 2u:
          uint64_t v38 = unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_APPLICATION_ID");

          v39 = container_log_handle_for_category();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218242;
            *(void *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 2112;
            *(void *)&atoken[14] = v38;
            _os_log_impl(&dword_1D7739000, v39, OS_LOG_TYPE_DEFAULT, "<%llx> application id: [%@]", atoken, 0x16u);
          }

          v120 = (void *)v38;
          if (v38) {
            continue;
          }
          v64 = 0;
          id v21 = 0;
          uint64_t v13 = 5;
          __int16 v28 = v116;
          goto LABEL_169;
        case 3u:
          unsigned int v40 = sb_packbuff_unpack_uint32(v30, &v124);
          uint64_t v41 = container_log_handle_for_category();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218240;
            *(void *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 1024;
            *(_DWORD *)&atoken[14] = v40;
            _os_log_impl(&dword_1D7739000, v41, OS_LOG_TYPE_DEFAULT, "<%llx> uid: [%u]", atoken, 0x12u);
          }
          unsigned int v117 = v40;

          if (!v124) {
            continue;
          }
          id v65 = container_log_handle_for_category();
          if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            goto LABEL_101;
          }
          *(_DWORD *)atoken = 67109120;
          *(_DWORD *)&atoken[4] = v124;
          v48 = "failed: to unpack uint32 for CM_KERN_REQUEST_UID. error: %d\n";
          goto LABEL_176;
        case 4u:
          v42 = unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_APP_GROUP_ID");
          v43 = container_log_handle_for_category();
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_51;
          }
          *(_DWORD *)atoken = 134218242;
          *(void *)&atoken[4] = v16;
          *(_WORD *)&atoken[12] = 2112;
          *(void *)&atoken[14] = v42;
          id v44 = v43;
          v45 = "<%llx> app group id: [%@]";
          goto LABEL_50;
        case 5u:
          LODWORD(v119) = sb_packbuff_unpack_uint32(v30, &v124);
          v46 = container_log_handle_for_category();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218240;
            *(void *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 1024;
            *(_DWORD *)&atoken[14] = v119;
            _os_log_impl(&dword_1D7739000, v46, OS_LOG_TYPE_DEFAULT, "<%llx> container type: [%u]", atoken, 0x12u);
          }

          if (!v124) {
            continue;
          }
          id v65 = container_log_handle_for_category();
          if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            goto LABEL_101;
          }
          *(_DWORD *)atoken = 67109120;
          *(_DWORD *)&atoken[4] = v124;
          v48 = "failed: to unpack uint32 for CM_KERN_REQUEST_CONTAINER_TYPE. error: %d\n";
          goto LABEL_176;
        case 6u:
          v42 = unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_CONTAINER_ID");
          v43 = container_log_handle_for_category();
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_51;
          }
          *(_DWORD *)atoken = 134218242;
          *(void *)&atoken[4] = v16;
          *(_WORD *)&atoken[12] = 2112;
          *(void *)&atoken[14] = v42;
          id v44 = v43;
          v45 = "<%llx> system container id: [%@]";
          goto LABEL_50;
        case 7u:
          v42 = unpackToNSString(v30, (uint64_t)"CM_KERN_REQUEST_SYSTEM_GROUP_CONTAINER_ID");
          v43 = container_log_handle_for_category();
          if (!os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT)) {
            goto LABEL_51;
          }
          *(_DWORD *)atoken = 134218242;
          *(void *)&atoken[4] = v16;
          *(_WORD *)&atoken[12] = 2112;
          *(void *)&atoken[14] = v42;
          id v44 = v43;
          v45 = "<%llx> system group id: [%@]";
LABEL_50:
          _os_log_impl(&dword_1D7739000, v44, OS_LOG_TYPE_DEFAULT, v45, atoken, 0x16u);
LABEL_51:

          if (v42) {
            continue;
          }
LABEL_73:
          id v21 = 0;
          uint64_t v13 = 5;
          __int16 v28 = v116;
          break;
        case 8u:
          HIDWORD(v119) = sb_packbuff_unpack_uint32(v30, &v124);
          int v47 = container_log_handle_for_category();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218240;
            *(void *)&atoken[4] = v16;
            *(_WORD *)&atoken[12] = 1024;
            *(_DWORD *)&atoken[14] = HIDWORD(v119);
            _os_log_impl(&dword_1D7739000, v47, OS_LOG_TYPE_DEFAULT, "<%llx> persona id: [%u]", atoken, 0x12u);
          }

          if (!v124) {
            continue;
          }
          id v65 = container_log_handle_for_category();
          if (!os_log_type_enabled(v65, OS_LOG_TYPE_ERROR)) {
            goto LABEL_101;
          }
          *(_DWORD *)atoken = 67109120;
          *(_DWORD *)&atoken[4] = v124;
          v48 = "failed: to unpack uint32 for CM_KERN_REQUEST_PERSONA_ID. error: %d\n";
LABEL_176:
          _os_log_error_impl(&dword_1D7739000, v65, OS_LOG_TYPE_ERROR, v48, atoken, 8u);
LABEL_101:
          id v21 = 0;
          uint64_t v13 = 5;
          __int16 v28 = v116;
          goto LABEL_111;
        default:
          id v65 = container_log_handle_for_category();
          __int16 v28 = v116;
          if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)atoken = 67109120;
            *(_DWORD *)&atoken[4] = v125;
            _os_log_error_impl(&dword_1D7739000, v65, OS_LOG_TYPE_ERROR, "unexpected value: %u\n", atoken, 8u);
          }
          id v21 = 0;
          goto LABEL_110;
      }
      goto LABEL_75;
    }
    break;
  }
  sb_packbuff_free(v30);
  __int16 v28 = v116;
  v118 = (uint64_t *)sb_packbuff_new(0x1000uLL);
  if (v118)
  {
    uint64_t v33 = (uint64_t)(id)v33;
    id v21 = (id)v33;
    if (v32)
    {
      id v21 = (id)v32;
    }
    uint64_t v123 = 1;
    id v65 = [(id)gContainerCache userIdentityCache];
    *(_DWORD *)atoken = 0;
    host_t v49 = MEMORY[0x1D9478CB0]();
    if (host_get_multiuser_config_flags(v49, (uint32_t *)atoken) || (*(_DWORD *)atoken & 0x80000000) == 0)
    {
      uint64_t v147 = 0;
      long long v145 = 0u;
      long long v146 = 0u;
      long long v143 = 0u;
      long long v144 = 0u;
      long long v142 = 0u;
      long long v141 = 0u;
      long long v140 = 0u;
      long long v139 = 0u;
      long long v138 = 0u;
      long long v137 = 0u;
      long long v136 = 0u;
      long long v135 = 0u;
      long long v134 = 0u;
      long long v133 = 0u;
      long long v132 = 0u;
      long long v131 = 0u;
      long long v130 = 0u;
      long long v129 = 0u;
      long long v128 = 0u;
      memset(&atoken[4], 0, 32);
      *(_DWORD *)atoken = 1;
      if (HIDWORD(v119) == -1) {
        goto LABEL_81;
      }
      if ((kpersona_info() & 0x80000000) != 0)
      {
        v60 = container_log_handle_for_category();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
        {
          pidp[0] = 67109120;
          pidp[1] = HIDWORD(v119);
          id v61 = "Could not look up info for persona id %u";
          id v62 = (uint8_t *)pidp;
          goto LABEL_108;
        }
LABEL_109:

LABEL_110:
        uint64_t v13 = 4;
LABEL_111:
        v64 = v120;
LABEL_168:

        goto LABEL_169;
      }
      if (*(_DWORD *)&atoken[8] == 5 || *(_DWORD *)&atoken[8] == 2)
      {
        uint64_t v54 = [v65 userIdentityWithPersonaID:HIDWORD(v119)];
      }
      else
      {
LABEL_81:
        uint64_t v54 = [v65 userIdentityForPersonalPersona];
      }
      v52 = (void *)v54;
    }
    else
    {
      id v50 = +[MCMPOSIXUser posixUserWithUID:v117];
      uint64_t v51 = [v65 userIdentityForPersonalPersonaWithPOSIXUser:v50];

      v52 = (void *)v51;
    }
    if (v52)
    {
      BOOL v56 = 1;
      v110 = v52;
      v108 = +[MCMClientConnection privilegedClientConnectionWithUserIdentity:v52 kernel:1];
      v109 = v65;
      if (!(v32 | v33))
      {
        v106 = 0;
        id v107 = 0;
        id v63 = 0;
LABEL_136:
        v87 = container_log_handle_for_category();
        if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
        {
          v88 = [v63 path];
          *(_DWORD *)atoken = 134218498;
          *(void *)&atoken[4] = v16;
          *(_WORD *)&atoken[12] = 1024;
          *(_DWORD *)&atoken[14] = v56;
          *(_WORD *)&atoken[18] = 2112;
          *(void *)&atoken[20] = v88;
          _os_log_impl(&dword_1D7739000, v87, OS_LOG_TYPE_DEFAULT, "<%llx> upcall result %d; data container [%@]",
            atoken,
            0x1Cu);
        }
        v121 = v63;

        v89 = objc_opt_new();
        v90 = v89;
        if (v120) {
          [v89 appendFormat:@"appID[%@]", v120];
        }
        v115 = v90;
        if (v32)
        {
          if ([v90 length]) {
            v91 = @", ";
          }
          else {
            v91 = &stru_1F2EF6598;
          }
          [v90 appendFormat:@"%@conID[%@]", v91, v32];
        }
        if (v33)
        {
          if ([v90 length]) {
            v92 = @", ";
          }
          else {
            v92 = &stru_1F2EF6598;
          }
          [v90 appendFormat:@"%@codID[%@]", v92, v33];
        }
        v93 = container_log_handle_for_category();
        v94 = v118;
        if (os_log_type_enabled(v93, OS_LOG_TYPE_DEFAULT))
        {
          if (v63)
          {
            v95 = [v63 path];
          }
          else
          {
            v95 = &stru_1F2EF6598;
          }
          *(_DWORD *)atoken = 67110402;
          *(_DWORD *)&atoken[4] = v119;
          *(_WORD *)&atoken[8] = 1024;
          *(_DWORD *)&atoken[10] = v117;
          *(_WORD *)&atoken[14] = 1024;
          *(_DWORD *)&atoken[16] = HIDWORD(v119);
          *(_WORD *)&atoken[20] = 2114;
          *(void *)&atoken[22] = v115;
          *(_WORD *)&atoken[30] = 1024;
          *(_DWORD *)&atoken[32] = v56;
          LOWORD(v128) = 2114;
          *(void *)((char *)&v128 + 2) = v95;
          _os_log_impl(&dword_1D7739000, v93, OS_LOG_TYPE_DEFAULT, "kernel_upcall {%d; %u.%u; %{public}@} -> {%d; [%{public}@]}",
            atoken,
            0x2Eu);
          if (v121) {

          }
          id v63 = v121;
        }

        if (v56 && v63) {
          BOOL v56 = __server_get_process_containers_block_invoke(v118, v63) == 0;
        }
        __server_get_process_containers_block_invoke_11(v118, v56);
        vm_address_t v96 = sb_packbuff_get_bytes((uint64_t)v118);
        uint64_t v97 = sb_packbuff_get_size((uint64_t)v118);
        uint64_t v13 = vm_read(*MEMORY[0x1E4F14960], v96, v97, data, a4);
        if (v13)
        {
          v98 = container_log_handle_for_category();
          if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)atoken = 134218496;
            *(void *)&atoken[4] = v96;
            *(_WORD *)&atoken[12] = 2048;
            *(void *)&atoken[14] = v97;
            *(_WORD *)&atoken[22] = 1024;
            *(_DWORD *)&atoken[24] = v13;
            _os_log_error_impl(&dword_1D7739000, v98, OS_LOG_TYPE_ERROR, "vm_read(%p, %lu) fails: %d", atoken, 0x1Cu);
          }

          _DWORD *v111 = 0;
          *a4 = 0;
          v94 = v118;
        }
        else
        {
          _DWORD *v111 = 1;
          v99 = container_log_handle_for_category();
          if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
          {
            mach_msg_type_number_t v103 = *a4;
            *(_DWORD *)atoken = 134218496;
            *(void *)&atoken[4] = v96;
            *(_WORD *)&atoken[12] = 2048;
            *(void *)&atoken[14] = data;
            *(_WORD *)&atoken[22] = 1024;
            *(_DWORD *)&atoken[24] = v103;
            _os_log_debug_impl(&dword_1D7739000, v99, OS_LOG_TYPE_DEBUG, "packbuff bytes: %p, reply bytes: %p, reply size: %u", atoken, 0x1Cu);
          }
        }
        sb_packbuff_free(v94);

        __int16 v28 = v116;
        v64 = v120;
        id v65 = v109;
        goto LABEL_168;
      }
      unint64_t v57 = [(id)gCodeSigningMapping dataContainerTypeForIdentifier:v21];
      uint64_t v58 = v57;
      if (v57 <= 0xB && ((1 << v57) & 0xED4) != 0)
      {
        if (v119 == 1 && v57 != 4)
        {
          os_signpost_id_t v59 = container_log_handle_for_category();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 67109376;
            *(_DWORD *)&atoken[4] = 1;
            *(_WORD *)&atoken[8] = 2048;
            *(void *)&atoken[10] = v58;
            _os_log_impl(&dword_1D7739000, v59, OS_LOG_TYPE_DEFAULT, "SB Type: %u, MI Type: %llu.  Declaring this a plugin", atoken, 0x12u);
          }
          uint64_t v58 = 4;
          goto LABEL_120;
        }
        if (v119 || v57 == 2)
        {
LABEL_121:
          v73 = [v110 posixUser];
          v74 = +[MCMContainerClassPath posixOwnerForContainerClass:v58 user:v73];

          v105 = v74;
          if (v117 != [v74 UID])
          {
            id v75 = container_log_handle_for_category();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              int v76 = [v105 UID];
              *(_DWORD *)atoken = 67109376;
              *(_DWORD *)&atoken[4] = v117;
              *(_WORD *)&atoken[8] = 1024;
              *(_DWORD *)&atoken[10] = v76;
              _os_log_impl(&dword_1D7739000, v75, OS_LOG_TYPE_DEFAULT, "Invalid UID from kernel: %u, expected: %u", atoken, 0xEu);
            }
          }
          id v77 = containermanager_copy_global_configuration();
          v78 = [v77 staticConfig];
          uint64_t v79 = [v78 configForContainerClass:v58];

          v104 = (void *)v79;
          v80 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v110 identifier:v21 containerConfig:v79 platform:v113 userIdentityCache:v109 error:&v123];
          if (v80)
          {
            os_signpost_id_t v81 = [v108 context];
            uint64_t v82 = [v81 containerFactory];
            id v122 = 0;
            BOOL v56 = 1;
            v114 = v80;
            uint64_t v83 = [v82 containerForContainerIdentity:v80 createIfNecessary:1 error:&v122];
            id v107 = v122;

            v84 = [v83 metadataMinimal];

            if (v84)
            {
              v80 = v114;
LABEL_133:

              id v63 = 0;
              v106 = v84;
              if (v84 && v56)
              {
                v86 = [v84 containerPath];
                id v63 = [v86 containerDataURL];

                BOOL v56 = 1;
              }
              goto LABEL_136;
            }
            v80 = v114;
          }
          else
          {
            id v107 = 0;
          }
          v85 = container_log_handle_for_category();
          if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)atoken = 134218242;
            *(void *)&atoken[4] = v123;
            *(_WORD *)&atoken[12] = 2112;
            *(void *)&atoken[14] = v107;
            _os_log_impl(&dword_1D7739000, v85, OS_LOG_TYPE_DEFAULT, "createOrLookupContainerForUser: Failed with error: (%llu) %@", atoken, 0x16u);
          }

          v84 = 0;
          BOOL v56 = 0;
          goto LABEL_133;
        }
        os_signpost_id_t v59 = container_log_handle_for_category();
        if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
LABEL_120:

          goto LABEL_121;
        }
        *(_DWORD *)atoken = 134217984;
        *(void *)&atoken[4] = v58;
        v68 = "SB type is app, but MI type is %llu";
        id v69 = v59;
        uint32_t v70 = 12;
      }
      else
      {
        uint64_t v72 = container_log_handle_for_category();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)atoken = 138412546;
          *(void *)&atoken[4] = v21;
          *(_WORD *)&atoken[12] = 2048;
          *(void *)&atoken[14] = v58;
          _os_log_impl(&dword_1D7739000, v72, OS_LOG_TYPE_DEFAULT, "Invalid data container class for %@: %llu", atoken, 0x16u);
        }

        if (v119 == 1) {
          uint64_t v58 = 4;
        }
        else {
          uint64_t v58 = 2;
        }
        os_signpost_id_t v59 = container_log_handle_for_category();
        if (!os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_120;
        }
        *(_DWORD *)atoken = 67109376;
        *(_DWORD *)&atoken[4] = v119;
        *(_WORD *)&atoken[8] = 2048;
        *(void *)&atoken[10] = v58;
        v68 = "SB Type: %u, falling back to class: %llu";
        id v69 = v59;
        uint32_t v70 = 18;
      }
      _os_log_impl(&dword_1D7739000, v69, OS_LOG_TYPE_DEFAULT, v68, atoken, v70);
      goto LABEL_120;
    }
    v60 = container_log_handle_for_category();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)atoken = 67109120;
      *(_DWORD *)&atoken[4] = HIDWORD(v119);
      id v61 = "Unable to find user identity for persona id %u";
      id v62 = atoken;
LABEL_108:
      _os_log_impl(&dword_1D7739000, v60, OS_LOG_TYPE_DEFAULT, v61, v62, 8u);
      goto LABEL_109;
    }
    goto LABEL_109;
  }
  id v21 = 0;
  uint64_t v13 = 9;
LABEL_75:
  v64 = v120;
LABEL_169:

LABEL_170:
  v100 = container_log_handle_for_category();
  v101 = v100;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v100))
  {
    *(_DWORD *)atoken = 138477827;
    *(void *)&atoken[4] = v21;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v101, OS_SIGNPOST_INTERVAL_END, v16, "KernelUpcall", " identifier=%{private, signpost.description:attribute}@ ", atoken, 0xCu);
  }

  return v13;
}

uint64_t sb_packbuff_get_item_value_type(void *a1, _WORD *a2)
{
  unint64_t v3 = a1[5];
  v2 = (_WORD *)a1[6];
  if ((unint64_t)v2 < v3 || (unint64_t)(v2 + 4) > v3 + a1[4] || !*v2) {
    return 0;
  }
  *a2 = v2[1];
  return 1;
}

id unpackToNSString(void *a1, uint64_t a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = 0;
  int v7 = 0;
  unint64_t v3 = sb_packbuff_unpack_string(a1, &v8, &v7);
  if (v3)
  {
    int v4 = (void *)[[NSString alloc] initWithUTF8String:v3];
  }
  else
  {
    id v5 = container_log_handle_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v10 = a2;
      __int16 v11 = 1024;
      int v12 = v7;
      _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "failed: to unpack string for %s. error: %d\n", buf, 0x12u);
    }

    int v4 = 0;
  }

  return v4;
}

unsigned __int16 *sb_packbuff_unpack_string(void *a1, void *a2, int *a3)
{
  int v9 = 0;
  uint64_t v8 = 0;
  int v5 = sb_packbuff_unpack_item(a1, 2, 0, &v8, &v9);
  if (!v5)
  {
    if (v9 && (uint64_t v6 = (v9 - 1), !*((unsigned char *)v8 + v6)))
    {
      int v5 = 0;
      if (a2) {
        *a2 = v6;
      }
    }
    else
    {
      int v5 = 22;
    }
  }
  if (a3) {
    *a3 = v5;
  }
  return v8;
}

uint64_t sb_packbuff_unpack_item(void *a1, int a2, _DWORD *a3, unsigned __int16 **a4, _DWORD *a5)
{
  unint64_t v5 = a1[5];
  unint64_t v6 = a1[6];
  if (v6 < v5) {
    return 34;
  }
  int v7 = (unsigned __int16 *)(v6 + 8);
  if (v6 + 8 > v5 + a1[4]) {
    return 34;
  }
  if (*(unsigned __int16 *)v6 != a2) {
    return 22;
  }
  if ((a2 - 2) >= 2)
  {
    if (a2 == 1 && a3)
    {
      *a3 = *(_DWORD *)(v6 + 4);
      uint64_t v11 = 8;
      goto LABEL_16;
    }
    return 22;
  }
  uint64_t v8 = 22;
  if (!a4 || !a5) {
    return v8;
  }
  uint64_t v10 = *(unsigned int *)(v6 + 4);
  LODWORD(v6) = 8 - (*(_DWORD *)(v6 + 4) & 7);
  *a4 = v7;
  *a5 = v10;
  if ((v10 & 7) != 0) {
    unint64_t v6 = v6;
  }
  else {
    unint64_t v6 = 0;
  }
  uint64_t v11 = v10 + v6 + 8;
  unint64_t v5 = a1[5];
  unint64_t v6 = a1[6];
LABEL_16:
  int v12 = (char *)(v6 + v11);
  if ((unint64_t)v12 < v5 || (unint64_t)v12 >= v5 + a1[2]) {
    return 34;
  }
  if ((v11 & 7) != 0) {
    sb_packbuff_unpack_item_cold_1();
  }
  uint64_t v8 = 0;
  a1[6] = v12;
  return v8;
}

uint64_t sb_packbuff_unpack_uint32(void *a1, int *a2)
{
  unint64_t v2 = a1[5];
  unint64_t v3 = a1[6];
  if (v3 < v2 || (unint64_t v5 = v3 + 8, v3 + 8 > v2 + a1[4]))
  {
    uint64_t result = 0;
LABEL_4:
    int v7 = 34;
    goto LABEL_5;
  }
  if (*(_WORD *)v3 == 1)
  {
    uint64_t result = *(unsigned int *)(v3 + 4);
    if (v5 >= v2 + a1[2]) {
      goto LABEL_4;
    }
    int v7 = 0;
    a1[6] = v5;
  }
  else
  {
    uint64_t result = 0;
    int v7 = 22;
  }
LABEL_5:
  if (a2) {
    *a2 = v7;
  }
  return result;
}

void sb_packbuff_free(uint64_t *a1)
{
  if (a1)
  {
    if (*(_DWORD *)a1 == 2)
    {
      if (MEMORY[0x1D9479680](*MEMORY[0x1E4F14960], a1[5], a1[2])
        && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        sb_packbuff_free_cold_1(a1 + 5, a1 + 2);
      }
    }
    else if (*(_DWORD *)a1 == 1)
    {
      free((void *)a1[5]);
    }
    free(a1);
  }
}

void *sb_packbuff_new(unint64_t a1)
{
  unint64_t v2 = malloc_type_calloc(1uLL, 0x38uLL, 0x1010040EDCA6020uLL);
  unint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = 256;
    if (a1 >= 8) {
      uint64_t v4 = a1;
    }
    v2[1] = v4;
    *(_DWORD *)unint64_t v2 = 1;
    if (sb_packbuff_realloc((uint64_t)v2, 0))
    {
      free(v3);
      return 0;
    }
    else
    {
      *((void *)v3 + 3) -= 8;
      *((void *)v3 + 4) = 8;
      **((void **)v3 + 6) = 0;
    }
  }
  return v3;
}

uint64_t sb_packbuff_realloc(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 8);
  if (!v2 || *(_DWORD *)a1 != 1) {
    return 45;
  }
  unsigned int v5 = 8 - (a2 & 7);
  BOOL v6 = (a2 & 7) == 0;
  size_t v7 = *(void *)(a1 + 16) + v2;
  *(void *)(a1 + 16) = v7;
  if (v6) {
    uint64_t v8 = 0;
  }
  else {
    uint64_t v8 = v5;
  }
  size_t v9 = v8 + a2;
  if (v9 > v7 - *(void *)(a1 + 32))
  {
    v7 += v9;
    *(void *)(a1 + 16) = v7;
  }
  uint64_t v10 = reallocf(*(void **)(a1 + 40), v7);
  *(void *)(a1 + 40) = v10;
  if (!v10) {
    return 12;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t result = 0;
  uint64_t v13 = *(void *)(a1 + 32);
  *(void *)(a1 + 24) = *(void *)(a1 + 16) - v13;
  if (v13) {
    uint64_t v11 = v11 + v13 - 8;
  }
  *(void *)(a1 + 48) = v11;
  return result;
}

void *sb_packbuff_init_with_buffer(void *a1, uint64_t a2, int a3, int a4)
{
  uint64_t result = malloc_type_calloc(1uLL, 0x38uLL, 0x1010040EDCA6020uLL);
  if (result)
  {
    *(_DWORD *)uint64_t result = a4;
    result[1] = 0;
    result[2] = a2;
    uint64_t v9 = a2;
    result[5] = a1;
    result[6] = a1;
    if (!a3)
    {
      *a1 = 0;
      a2 = result[2];
      uint64_t v9 = 8;
    }
    result[3] = a2 - v9;
    result[4] = v9;
  }
  return result;
}

uint64_t sb_packbuff_get_size(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t sb_packbuff_get_bytes(uint64_t a1)
{
  return *(void *)(a1 + 40);
}

void __server_get_process_containers_block_invoke_11(void *a1, int a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = sb_packbuff_pack_uint32(a1, 0, a2);
  if (v3)
  {
    int v4 = v3;
    unsigned int v5 = container_log_handle_for_category();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109632;
      v6[1] = v4;
      __int16 v7 = 1024;
      int v8 = 0;
      __int16 v9 = 1024;
      int v10 = a2;
      _os_log_impl(&dword_1D7739000, v5, OS_LOG_TYPE_DEFAULT, "sb_packbuff_pack_uint32() fails: %d; type: %u, value: %u\n",
        (uint8_t *)v6,
        0x14u);
    }
  }
}

uint64_t sb_packbuff_pack_item(void *a1, unsigned int a2, __int16 a3, int a4, void *__src, size_t __n)
{
  unsigned int v6 = __n;
  unint64_t v12 = 8;
  if (__n)
  {
    if ((__n & 7) != 0) {
      unsigned int v13 = 8 - (__n & 7);
    }
    else {
      unsigned int v13 = 0;
    }
    uint64_t result = 34;
    unsigned int v15 = __n + v13;
    if (__CFADD__(__n, v13) || v15 > 0xFFFFFFF7) {
      return result;
    }
    unint64_t v12 = v15 + 8;
  }
  else
  {
    unsigned int v15 = 0;
    unsigned int v13 = 0;
  }
  if (a1[3] >= v12 || (uint64_t result = sb_packbuff_realloc((uint64_t)a1, v12), !result))
  {
    uint64_t v16 = a1[6];
    *(_WORD *)uint64_t v16 = a2;
    *(_WORD *)(v16 + 2) = a3;
    if (a2 - 2 < 2)
    {
      if (!__src) {
        sb_packbuff_pack_item_cold_2();
      }
      *(_DWORD *)(v16 + 4) = v6;
      int v17 = (char *)(a1[6] + 8);
      memcpy(v17, __src, v6);
      if (v13) {
        bzero(&v17[v6], v13);
      }
      goto LABEL_18;
    }
    if (a2 <= 1)
    {
      if (v15) {
        sb_packbuff_pack_item_cold_1();
      }
      *(_DWORD *)(v16 + 4) = a4;
LABEL_18:
      uint64_t result = 0;
      unint64_t v18 = a1[4] + v12;
      a1[3] -= v12;
      a1[4] = v18;
      v19 = (void *)(a1[6] + v12);
      a1[6] = v19;
      void *v19 = 0;
      return result;
    }
    return 22;
  }
  return result;
}

uint64_t sb_packbuff_pack_uint32(void *a1, __int16 a2, int a3)
{
  return sb_packbuff_pack_item(a1, 1u, a2, a3, 0, 0);
}

uint64_t __server_get_process_containers_block_invoke(void *a1, id a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v3 = (char *)[a2 fileSystemRepresentation];
  size_t v4 = strlen(v3);
  uint64_t v5 = sb_packbuff_pack_string(a1, 1, v3, v4);
  if (v5)
  {
    unsigned int v6 = container_log_handle_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8[0] = 67109634;
      v8[1] = v5;
      __int16 v9 = 1024;
      int v10 = 1;
      __int16 v11 = 2080;
      unint64_t v12 = v3;
      _os_log_impl(&dword_1D7739000, v6, OS_LOG_TYPE_DEFAULT, "sb_packbuff_pack_string() fails: %d; type: %u, path: %s\n",
        (uint8_t *)v8,
        0x18u);
    }
  }
  return v5;
}

uint64_t sb_packbuff_pack_string(void *a1, __int16 a2, void *__src, unint64_t a4)
{
  if (a4 > 0xFFFFFFFE || *((unsigned char *)__src + a4)) {
    return 22;
  }
  else {
    return sb_packbuff_pack_item(a1, 2u, a2, 0, __src, (a4 + 1));
  }
}

void sub_1D775F038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MCMKernServerStart_block_invoke_30(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  switch(a2)
  {
    case 1:
      uint64_t v5 = container_log_handle_for_category();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_1D7739000, v5, OS_LOG_TYPE_DEFAULT, "Mach channel connected", (uint8_t *)&v11, 2u);
      }
      goto LABEL_14;
    case 2:
      if ((dispatch_mach_mig_demux() & 1) == 0)
      {
        msg = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
        __int16 v7 = container_log_handle_for_category();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
        {
          mach_msg_id_t msgh_id = msg->msgh_id;
          int v11 = 67109120;
          LODWORD(v12) = msgh_id;
          _os_log_fault_impl(&dword_1D7739000, v7, OS_LOG_TYPE_FAULT, "Got mach message we didn't understand; mach_msg_id_t msgh_id = %d",
            (uint8_t *)&v11,
            8u);
        }

        mach_msg_destroy(msg);
      }
      goto LABEL_15;
    case 7:
      uint64_t v5 = container_log_handle_for_category();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      LOWORD(v11) = 0;
      __int16 v9 = "Mach channel disconnected, this is probably very bad";
      break;
    case 8:
      uint64_t v5 = container_log_handle_for_category();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      LOWORD(v11) = 0;
      __int16 v9 = "Mach channel canceled, this is probably very bad";
      break;
    default:
      int v8 = container_log_handle_for_category();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v11 = 134217984;
        uint64_t v12 = a2;
        _os_log_error_impl(&dword_1D7739000, v8, OS_LOG_TYPE_ERROR, "Unhandled message type; reason = %lu",
          (uint8_t *)&v11,
          0xCu);
      }

      goto LABEL_15;
  }
  _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, v9, (uint8_t *)&v11, 2u);
LABEL_14:

LABEL_15:
}

void __Block_byref_object_dispose__9189(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
}

uint64_t __Block_byref_object_copy__9188(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_1D7762EDC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D7763008(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_1D7767050(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, int a12)
{
  if (a12) {
    objc_end_catch();
  }
  _Unwind_Resume(a1);
}

void sub_1D77670A0(uint64_t a1, int a2)
{
  if (!a2) {
    JUMPOUT(0x1D77670A4);
  }
  objc_terminate();
}

void sub_1D77697FC(_Unwind_Exception *exception_object)
{
}

void sub_1D7772750(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Block_object_dispose((const void *)(v1 - 176), 8);
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
  uint64_t v1 = *(void **)(a1 + 40);
}

void sub_1D777429C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void _containermanagerd_main(int a1, char *const *a2, uint64_t a3)
{
  uint64_t v142 = *MEMORY[0x1E4F143B8];
  uint64_t v113 = 91;
  [MEMORY[0x1E4F28C58] _setFileNameLocalizationEnabled:0];
  objc_setExceptionPreprocessor((objc_exception_preprocessor)_containermanagerd_exception_preprocessor);
  _CFPrefsSetDirectModeEnabled();
  v106 = MCMSharedFastWorkloop();
  id v107 = MCMSharedSlowWorkloop();
  dispatch_queue_t v108 = dispatch_queue_create_with_target_V2("com.apple.containermanagerd.listener", 0, v106);
  context = (void *)MEMORY[0x1D9478DF0]();
  unsigned int v6 = objc_alloc_init(MCMRuntimeState);
  [(MCMRuntimeState *)v6 restore];
  [(MCMRuntimeState *)v6 reset];
  __int16 v7 = +[MCMPOSIXUser currentPOSIXUser];
  int v8 = v7;
  if (!v7)
  {
    int v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      LODWORD(buf) = 67109120;
      DWORD1(buf) = geteuid();
      _os_log_fault_impl(&dword_1D7739000, v11, OS_LOG_TYPE_FAULT, "Could not get user details for current uid: %d", (uint8_t *)&buf, 8u);
    }
    id v12 = 0;
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    id v16 = 0;
    int v17 = 2;
    goto LABEL_115;
  }
  if (!_containermanagerd_posix_user_has_home_dir(v7, (uint64_t)"current", &v113))
  {
    id v12 = 0;
    id v13 = 0;
    id v14 = 0;
    id v15 = 0;
    id v16 = 0;
    int v17 = 2;
    goto LABEL_116;
  }
  getpid();
  int v9 = memorystatus_control();
  if (v9)
  {
    int v10 = container_log_handle_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      unsigned int v40 = strerror(v9);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v40;
      _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "Error elevating inactive jetsam priority: %{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v134 = 0x3032000000;
    long long v135 = __Block_byref_object_copy__1003;
    long long v136 = __Block_byref_object_dispose__1004;
    long long v137 = 0;
    unint64_t v18 = dispatch_get_global_queue(17, 0);
    dispatch_source_t v19 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v18);
    long long v20 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v19;

    dispatch_time_t v21 = dispatch_time(0, 240000000000);
    dispatch_source_set_timer(*(dispatch_source_t *)(*((void *)&buf + 1) + 40), v21, 0xFFFFFFFFFFFFFFFFLL, 0x4A817C800uLL);
    uint64_t v22 = *(NSObject **)(*((void *)&buf + 1) + 40);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = ___containermanagerd_main_block_invoke;
    handler[3] = &unk_1E6A80420;
    void handler[4] = &buf;
    dispatch_source_set_event_handler(v22, handler);
    dispatch_activate(*(dispatch_object_t *)(*((void *)&buf + 1) + 40));
    _Block_object_dispose(&buf, 8);
  }
  v105 = [NSString stringWithUTF8String:a3];
  v98 = @"root";
  v99 = @"_installd";
  v100 = @"no";
  mach_msg_type_number_t v103 = @"fixed";
  v104 = @"normal";
  uint64_t v23 = (void *)MEMORY[0x1E4F149E8];
  v101 = @"global";
  v102 = @"global";
  while (1)
  {
    while (1)
    {
      while (1)
      {
        int v24 = getopt_long_only(a1, a2, "r:u:b:B:s:S:c:", (const option *)&_containermanagerd_main_opts, 0);
        if (v24 != 99) {
          break;
        }
        if (os_variant_has_internal_content())
        {
          [NSString stringWithUTF8String:*v23];
          v25 = v105;
          v105 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
      }
      if (v24 <= 106) {
        break;
      }
      if (v24 > 114)
      {
        if (v24 == 115)
        {
          [NSString stringWithUTF8String:*v23];
          v25 = v101;
          v101 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v24 != 117)
          {
LABEL_47:
            uint64_t v113 = 148;
            _containermanagerd_usage();
            id v12 = 0;
            id v13 = 0;
            id v14 = 0;
            id v15 = 0;
            id v16 = 0;
            goto LABEL_113;
          }
          [NSString stringWithUTF8String:*v23];
          v25 = v103;
          mach_msg_type_number_t v103 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
      }
      else if (v24 == 107)
      {
        [NSString stringWithUTF8String:*v23];
        v25 = v100;
        v100 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        if (v24 != 114) {
          goto LABEL_47;
        }
        [NSString stringWithUTF8String:*v23];
        v25 = v104;
        v104 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
LABEL_36:
    }
    if (v24 > 82)
    {
      if (v24 != 83)
      {
        if (v24 != 98) {
          goto LABEL_47;
        }
        [NSString stringWithUTF8String:*v23];
        v25 = v102;
        v102 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      }
      v25 = [NSString stringWithUTF8String:*v23];

      v98 = v25;
      if ([(__CFString *)v25 isEqualToString:@"-"])
      {
        v98 = 0;
        goto LABEL_36;
      }
    }
    else
    {
      if (v24 == -1)
      {
        int v26 = [MCMStaticConfiguration alloc];
        uint64_t v27 = +[MCMStaticConfiguration defaultPlistDirectoryURL];
        id v15 = [(MCMStaticConfiguration *)v26 initFromPlistAtPathOrName:v105 defaultPlistDirectoryURL:v27];

        __int16 v28 = container_log_handle_for_category();
        os_signpost_id_t v29 = os_signpost_id_make_with_pointer(v28, v15);

        uint64_t v30 = container_log_handle_for_category();
        uint64_t v31 = v30;
        if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          LODWORD(buf) = 138477827;
          *(void *)((char *)&buf + 4) = v105;
          _os_signpost_emit_with_name_impl(&dword_1D7739000, v31, OS_SIGNPOST_INTERVAL_BEGIN, v29, "LoadConfiguration", " path=%{private, signpost.description:attribute}@ ", (uint8_t *)&buf, 0xCu);
        }

        id v111 = 0;
        char v32 = [v15 loadWithError:&v111];
        id v16 = v111;
        uint64_t v33 = container_log_handle_for_category();
        uint64_t v34 = v33;
        if (v29 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v33))
        {
          v35 = [v15 sourceFileURL];
          uint64_t v36 = [v35 path];
          LODWORD(buf) = 138477827;
          *(void *)((char *)&buf + 4) = v36;
          _os_signpost_emit_with_name_impl(&dword_1D7739000, v34, OS_SIGNPOST_INTERVAL_END, v29, "LoadConfiguration", " path=%{private, signpost.description:attribute}@ ", (uint8_t *)&buf, 0xCu);
        }
        if ((v32 & 1) == 0)
        {
          id v12 = 0;
          id v13 = 0;
          id v14 = 0;
          uint64_t v113 = [v16 type];
          goto LABEL_113;
        }
        if ([(__CFString *)v104 isEqualToString:@"privileged"])
        {
          if (geteuid())
          {
            v37 = (FILE *)*MEMORY[0x1E4F143C8];
            uint64_t v38 = getprogname();
            fprintf(v37, "ERROR: %s must be run as root when in privileged mode\n", v38);
            goto LABEL_111;
          }
          uint64_t v39 = 0;
LABEL_61:
          if ([(__CFString *)v103 isEqualToString:@"none"])
          {
            unsigned int v97 = 0;
            goto LABEL_68;
          }
          if ([(__CFString *)v103 isEqualToString:@"current"])
          {
            int v41 = 1;
LABEL_67:
            unsigned int v97 = v41;
LABEL_68:
            if ([(__CFString *)v102 isEqualToString:@"none"])
            {
              uint64_t v42 = 0;
              goto LABEL_77;
            }
            if ([(__CFString *)v102 isEqualToString:@"global"])
            {
              uint64_t v42 = 1;
              goto LABEL_77;
            }
            if ([(__CFString *)v102 isEqualToString:@"per-user"])
            {
              uint64_t v42 = 2;
              goto LABEL_77;
            }
            if ([(__CFString *)v102 isEqualToString:@"proxy"])
            {
              uint64_t v42 = 3;
LABEL_77:
              if (v99)
              {
                +[MCMPOSIXUser posixUserWithName:](MCMPOSIXUser, "posixUserWithName:");
                id v44 = (id)objc_claimAutoreleasedReturnValue();
              }
              else
              {
                id v44 = v8;
              }
              id v13 = v44;
              if (!v44)
              {
                id v13 = v8;
                v45 = container_log_handle_for_category();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
                {
                  LODWORD(buf) = 138543362;
                  *(void *)((char *)&buf + 4) = v99;
                  _os_log_error_impl(&dword_1D7739000, v45, OS_LOG_TYPE_ERROR, "Cannot find user [%{public}@] specified for bundle container owner, continuing without bundle container support", (uint8_t *)&buf, 0xCu);
                }

                uint64_t v42 = 0;
              }
              if ([(__CFString *)v101 isEqualToString:@"none"])
              {
                uint64_t v46 = 0;
                goto LABEL_92;
              }
              if ([(__CFString *)v101 isEqualToString:@"global"])
              {
                uint64_t v46 = 1;
                goto LABEL_92;
              }
              if ([(__CFString *)v101 isEqualToString:@"per-user"])
              {
                uint64_t v46 = 2;
                goto LABEL_92;
              }
              if ([(__CFString *)v101 isEqualToString:@"proxy"])
              {
                uint64_t v46 = 3;
LABEL_92:
                if (v98)
                {
                  +[MCMPOSIXUser posixUserWithName:](MCMPOSIXUser, "posixUserWithName:");
                  id v47 = (id)objc_claimAutoreleasedReturnValue();
                }
                else
                {
                  id v47 = v8;
                }
                id v12 = v47;
                v48 = v100;
                if (!v12)
                {
                  id v12 = v8;
                  host_t v49 = container_log_handle_for_category();
                  if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
                  {
                    LODWORD(buf) = 138543362;
                    *(void *)((char *)&buf + 4) = v98;
                    _os_log_error_impl(&dword_1D7739000, v49, OS_LOG_TYPE_ERROR, "Cannot find user [%{public}@] specified for system container owner, continuing without system container support", (uint8_t *)&buf, 0xCu);
                  }

                  uint64_t v46 = 0;
                  v48 = v100;
                }
                if (v48) {
                  char v50 = [(__CFString *)v48 isEqualToString:@"yes"];
                }
                else {
                  char v50 = 0;
                }
                LOBYTE(v96) = v50;
                id v14 = [[MCMGlobalConfiguration alloc] initWithStaticConfig:v15 runMode:v39 userContainerMode:v97 bundleContainerMode:v42 bundleContainerOwner:v13 systemContainerMode:v46 systemContainerOwner:v12 kernelUpcallEnabled:v96];
                objc_storeStrong((id *)&_gGlobalConfiguration, v14);
                uint64_t v51 = [v15 defaultUser];
                int has_home_dir = _containermanagerd_posix_user_has_home_dir(v51, (uint64_t)"default", &v113);

                if (has_home_dir) {
                  int v17 = 0;
                }
                else {
                  int v17 = 2;
                }
LABEL_114:

                int v11 = v104;
LABEL_115:

LABEL_116:
                if (v17 != 2)
                {
                  unint64_t v57 = v106;
                  id v58 = v107;
                  os_signpost_id_t v59 = v108;
                  v131[0] = 0;
                  v131[1] = v131;
                  v131[2] = 0x3032000000;
                  v131[3] = __Block_byref_object_copy__1003;
                  v131[4] = __Block_byref_object_dispose__1004;
                  id v132 = 0;
                  v60 = (void *)MEMORY[0x1D9478DF0]();
                  if (_os_feature_enabled_impl())
                  {
                    id v61 = containermanager_copy_global_configuration();
                    if ([v61 runmode])
                    {
                    }
                    else
                    {
                      id v62 = containermanager_copy_global_configuration();
                      int v63 = [v62 isInternalImage];

                      if (v63 && _containermanagerd_setup_log_replication_onceToken != -1) {
                        dispatch_once(&_containermanagerd_setup_log_replication_onceToken, &__block_literal_global_1008);
                      }
                    }
                  }
                  v64 = +[MCMUserIdentitySharedCache sharedInstance];
                  id v65 = container_log_handle_for_category();
                  os_signpost_id_t v66 = os_signpost_id_make_with_pointer(v65, &_containermanagerd_start_xpc_userListener);

                  id v67 = containermanager_copy_global_configuration();
                  BOOL v68 = [v67 runmode] == 3;

                  if (!v68)
                  {
                    uint64_t v114 = 0;
                    uint64_t v115 = (uint64_t)&v114;
                    uint64_t v116 = 0x3032000000;
                    unsigned int v117 = __Block_byref_object_copy__1003;
                    v118 = __Block_byref_object_dispose__1004;
                    id v119 = (id)os_transaction_create();
                    *(void *)&long long buf = MEMORY[0x1E4F143A8];
                    *((void *)&buf + 1) = 3221225472;
                    uint64_t v134 = (uint64_t)___containermanagerd_start_xpc_block_invoke;
                    long long v135 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6A7F3F0;
                    v88 = v59;
                    long long v136 = (void (*)(uint64_t))v88;
                    long long v137 = v57;
                    os_signpost_id_t v141 = v66;
                    id v89 = v64;
                    id v138 = v89;
                    long long v139 = v131;
                    long long v140 = &v114;
                    dispatch_block_t v90 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, &buf);
                    dispatch_async(v88, v90);
                    id v91 = containermanager_copy_global_configuration();
                    BOOL contexta = [v91 runmode] == 4;

                    if (!contexta)
                    {
                      v129[0] = 0;
                      v129[1] = v129;
                      v129[2] = 0x3032000000;
                      v129[3] = __Block_byref_object_copy__1003;
                      v129[4] = __Block_byref_object_dispose__1004;
                      id v130 = (id)os_transaction_create();
                      block[0] = MEMORY[0x1E4F143A8];
                      block[1] = 3221225472;
                      block[2] = ___containermanagerd_start_xpc_block_invoke_2;
                      block[3] = &unk_1E6A7F418;
                      os_signpost_id_t v128 = v66;
                      id v124 = v89;
                      v126 = v131;
                      v92 = v88;
                      unsigned __int16 v125 = v92;
                      v127 = v129;
                      dispatch_block_t v93 = dispatch_block_create(DISPATCH_BLOCK_INHERIT_QOS_CLASS, block);
                      dispatch_async(v92, v93);

                      _Block_object_dispose(v129, 8);
                    }

                    _Block_object_dispose(&v114, 8);
                  }
                  uint64_t v114 = MEMORY[0x1E4F143A8];
                  uint64_t v115 = 3221225472;
                  uint64_t v116 = (uint64_t)___containermanagerd_start_xpc_block_invoke_3;
                  unsigned int v117 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6A7F468;
                  id v69 = v59;
                  v118 = v69;
                  id v122 = v131;
                  uint32_t v70 = v57;
                  id v119 = v70;
                  id v71 = v58;
                  id v120 = v71;
                  id v72 = v64;
                  id v121 = v72;
                  v73 = (void (**)(void, void))MEMORY[0x1D9479020](&v114);
                  id v74 = containermanager_copy_global_configuration();
                  BOOL v75 = [v74 runmode] == 0;

                  if (v75)
                  {
                    uint64_t v76 = ((void (**)(void, const char *))v73)[2](v73, "com.apple.containermanagerd.system");
                    id v77 = (void *)_containermanagerd_start_xpc_systemListener;
                    _containermanagerd_start_xpc_systemListener = v76;
                  }
                  id v78 = containermanager_copy_global_configuration();
                  BOOL v79 = [v78 runmode] == 0;

                  if (!v79)
                  {
                    uint64_t v94 = ((void (**)(void, const char *))v73)[2](v73, "com.apple.containermanagerd");
                    v95 = (void *)_containermanagerd_start_xpc_userListener;
                    _containermanagerd_start_xpc_userListener = v94;
                  }
                  CFRunLoopRun();
                  _Block_object_dispose(v131, 8);
                }
                v80 = v113;
                os_signpost_id_t v81 = v108;
                *(void *)&long long buf = MEMORY[0x1E4F143A8];
                *((void *)&buf + 1) = 3221225472;
                uint64_t v134 = (uint64_t)___containermanagerd_start_xpc_with_permanent_error_block_invoke;
                long long v135 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6A7F500;
                long long v137 = v80;
                uint64_t v82 = v81;
                long long v136 = v82;
                uint64_t v83 = MEMORY[0x1D9479020](&buf);
                uint64_t v84 = (*(void (**)(uint64_t, const char *))(v83 + 16))(v83, "com.apple.containermanagerd.system");
                v85 = (void *)_containermanagerd_start_xpc_with_permanent_error_systemListener;
                _containermanagerd_start_xpc_with_permanent_error_systemListener = v84;

                uint64_t v86 = (*(void (**)(uint64_t, const char *))(v83 + 16))(v83, "com.apple.containermanagerd");
                v87 = (void *)_containermanagerd_start_xpc_with_permanent_error_userListener;
                _containermanagerd_start_xpc_with_permanent_error_userListener = v86;

                _containermanagerd_self_destruct(v82);
                dispatch_main();
              }
              uint64_t v54 = (FILE *)*MEMORY[0x1E4F143C8];
              v101 = v101;
              fprintf(v54, "ERROR: Unrecognized system container mode: [%s]\n", (const char *)[(__CFString *)v101 UTF8String]);
              _containermanagerd_usage();
              id v12 = 0;
LABEL_112:
              id v14 = 0;
LABEL_113:
              int v17 = 2;
              goto LABEL_114;
            }
            v53 = (FILE *)*MEMORY[0x1E4F143C8];
            v102 = v102;
            fprintf(v53, "ERROR: Unrecognized bundle container mode: [%s]\n", (const char *)[(__CFString *)v102 UTF8String]);
            _containermanagerd_usage();
          }
          else
          {
            if ([(__CFString *)v103 isEqualToString:@"fixed"])
            {
              int v41 = 2;
              goto LABEL_67;
            }
            v43 = (FILE *)*MEMORY[0x1E4F143C8];
            mach_msg_type_number_t v103 = v103;
            fprintf(v43, "ERROR: Unrecognized user container mode: [%s]\n", (const char *)[(__CFString *)v103 UTF8String]);
            _containermanagerd_usage();
          }
LABEL_111:
          id v12 = 0;
          id v13 = 0;
          goto LABEL_112;
        }
        if ([(__CFString *)v104 isEqualToString:@"agent"])
        {
          if (![v8 isRoleUser]
            || ([v8 hasUseableHomeDirectory] & 1) != 0
            || ([v8 isRoot] & 1) != 0)
          {
            uint64_t v39 = 2;
            goto LABEL_61;
          }
          uint64_t v55 = container_log_handle_for_category();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            LODWORD(buf) = 138412290;
            *(void *)((char *)&buf + 4) = v8;
            _os_log_impl(&dword_1D7739000, v55, OS_LOG_TYPE_DEFAULT, "Starting up in PROXY mode because current user %@ does not have a home directory.", (uint8_t *)&buf, 0xCu);
          }
        }
        else if (([(__CFString *)v104 isEqualToString:@"proxy"] & 1) == 0)
        {
          if ([(__CFString *)v104 isEqualToString:@"sync"])
          {
            uint64_t v39 = 4;
            goto LABEL_61;
          }
          if ([(__CFString *)v104 isEqualToString:@"normal"])
          {
            uint64_t v39 = 1;
            goto LABEL_61;
          }
          BOOL v56 = (FILE *)*MEMORY[0x1E4F143C8];
          v104 = v104;
          fprintf(v56, "ERROR: Unrecognized run mode: [%s]\n", (const char *)[(__CFString *)v104 UTF8String]);
          _containermanagerd_usage();
          goto LABEL_111;
        }
        uint64_t v39 = 3;
        goto LABEL_61;
      }
      if (v24 != 66) {
        goto LABEL_47;
      }
      v25 = [NSString stringWithUTF8String:*v23];

      v99 = v25;
      if ([(__CFString *)v25 isEqualToString:@"-"])
      {
        v99 = 0;
        goto LABEL_36;
      }
    }
  }
}

void sub_1D7776BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 256), 8);
  _Unwind_Resume(a1);
}

uint64_t _containermanagerd_posix_user_has_home_dir(void *a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  __int16 v23 = 0;
  unsigned int v6 = +[MCMFileManager defaultManager];
  __int16 v7 = [v5 unvalidatedHomeDirectoryURL];
  id v22 = 0;
  char v8 = [v6 itemAtURL:v7 followSymlinks:1 exists:(char *)&v23 + 1 isDirectory:&v23 error:&v22];
  id v9 = v22;

  if (v8)
  {
    if (!HIBYTE(v23) || !(_BYTE)v23)
    {
      id v12 = container_log_handle_for_category();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        long long v20 = [v5 unvalidatedHomeDirectoryURL];
        dispatch_time_t v21 = [v20 path];
        *(_DWORD *)long long buf = 136315394;
        uint64_t v25 = a2;
        __int16 v26 = 2112;
        uint64_t v27 = v21;
        _os_log_error_impl(&dword_1D7739000, v12, OS_LOG_TYPE_ERROR, "%s user home directory [%@] not found or not a directory.", buf, 0x16u);
      }
      uint64_t v13 = 102;
      goto LABEL_11;
    }
    int v10 = [v5 homeDirectoryURL];

    if (v10)
    {
      uint64_t v11 = 1;
      goto LABEL_13;
    }
    id v12 = container_log_handle_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v5 unvalidatedHomeDirectoryURL];
      id v16 = [v15 path];
      *(_DWORD *)long long buf = 136315394;
      uint64_t v25 = a2;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      int v17 = "Could not realpath %s home directory [%@]";
      unint64_t v18 = v12;
      uint32_t v19 = 22;
LABEL_17:
      _os_log_error_impl(&dword_1D7739000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    }
  }
  else
  {
    id v12 = container_log_handle_for_category();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v15 = [v5 unvalidatedHomeDirectoryURL];
      id v16 = [v15 path];
      *(_DWORD *)long long buf = 136315650;
      uint64_t v25 = a2;
      __int16 v26 = 2112;
      uint64_t v27 = v16;
      __int16 v28 = 2114;
      id v29 = v9;
      int v17 = "Failed to check for existence of %s user home directory [%@]: %{public}@";
      unint64_t v18 = v12;
      uint32_t v19 = 32;
      goto LABEL_17;
    }
  }
  uint64_t v13 = 103;
LABEL_11:

  uint64_t v11 = 0;
  if (a3) {
    *a3 = v13;
  }
LABEL_13:

  return v11;
}

uint64_t __Block_byref_object_copy__1003(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1004(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
}

void ___containermanagerd_main_block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  getpid();
  int v2 = memorystatus_control();
  if (v2)
  {
    int v3 = v2;
    id v4 = container_log_handle_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446210;
      char v8 = strerror(v3);
      _os_log_error_impl(&dword_1D7739000, v4, OS_LOG_TYPE_ERROR, "Error de-elevating inactive jetsam priority: %{public}s", (uint8_t *)&v7, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  unsigned int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = 0;
}

uint64_t _containermanagerd_usage()
{
  v0 = getprogname();
  printf("usage:\n%s <options>\n", v0);
  puts("\tOptions:\n");
  printf("\t\t[--runmode <%s|%s|%s|%s|%s>]\n", (const char *)[@"privileged" UTF8String], (const char *)objc_msgSend(@"normal", "UTF8String"), (const char *)objc_msgSend(@"agent", "UTF8String"), (const char *)objc_msgSend(@"proxy", "UTF8String"), (const char *)objc_msgSend(@"sync", "UTF8String"));
  printf("\t\t\tSets the daemon run mode. Default is [%s].\n\n", (const char *)[@"normal" UTF8String]);
  printf("\t\t[--user-container-mode <%s|%s|%s>]\n", (const char *)[@"none" UTF8String], (const char *)objc_msgSend(@"current", "UTF8String"), (const char *)objc_msgSend(@"fixed", "UTF8String"));
  printf("\t\t\tSets the user container mode. Default is [%s].\n\n", (const char *)[@"fixed" UTF8String]);
  printf("\t\t[--bundle-container-mode <%s|%s|%s|%s>]\n", (const char *)[@"none" UTF8String], (const char *)objc_msgSend(@"global", "UTF8String"), (const char *)objc_msgSend(@"per-user", "UTF8String"), (const char *)objc_msgSend(@"proxy", "UTF8String"));
  printf("\t\t\tSets the bundle container mode. Default is [%s].\n\n", (const char *)[@"global" UTF8String]);
  puts("\t\t[--bundle-container-owner <username>]");
  uint64_t v1 = [@"_installd" UTF8String];
  if (v1) {
    int v2 = (const char *)v1;
  }
  else {
    int v2 = "<current user>";
  }
  printf("\t\t\tSets the bundle container owner when mode is global. Default is [%s].\n\n", v2);
  printf("\t\t[--system-container-mode <%s|%s|%s|%s>]\n", (const char *)[@"none" UTF8String], (const char *)objc_msgSend(@"global", "UTF8String"), (const char *)objc_msgSend(@"per-user", "UTF8String"), (const char *)objc_msgSend(@"proxy", "UTF8String"));
  printf("\t\t\tSets the system container mode. Default is [%s].\n\n", (const char *)[@"global" UTF8String]);
  puts("\t\t[--system-container-owner <username>]");
  uint64_t v3 = [@"root" UTF8String];
  if (v3) {
    id v4 = (const char *)v3;
  }
  else {
    id v4 = "<current user>";
  }
  printf("\t\t\tSets the system container owner when mode is global. Default is [%s].\n\n", v4);
  return printf("\t\t[--kernel-upcall <%s|%s>]\n", (const char *)[@"no" UTF8String], (const char *)objc_msgSend(@"yes", "UTF8String"));
}

void ___containermanagerd_start_xpc_block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  int v2 = *(void **)(a1 + 40);
  os_signpost_id_t v3 = *(void *)(a1 + 72);
  id v4 = *(void **)(a1 + 48);
  id v5 = *(id *)(a1 + 32);
  id v64 = v2;
  id v6 = v4;
  int v7 = container_log_handle_for_category();
  char v8 = v7;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v3, "StartingUp", "", buf, 2u);
  }

  uint64_t v9 = (void *)MEMORY[0x1D9478DF0]();
  if (setiopolicy_np(9, 0, 1))
  {
    int v10 = container_log_handle_for_category();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v61 = *__error();
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v61;
      _os_log_error_impl(&dword_1D7739000, v10, OS_LOG_TYPE_ERROR, "Unable to set low disk space io policy: %{darwin.errno}d", buf, 8u);
    }
  }
  uint64_t v11 = container_log_handle_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136446722;
    *(void *)&uint8_t buf[4] = "MobileContainerManager-689~6623";
    *(_WORD *)&buf[12] = 2082;
    *(void *)&buf[14] = "Nov 14 2024";
    *(_WORD *)&buf[22] = 2082;
    v73 = "23:05:14";
    _os_log_impl(&dword_1D7739000, v11, OS_LOG_TYPE_DEFAULT, "containermanagerd (%{public}s) built at %{public}s %{public}s started", buf, 0x20u);
  }

  id v12 = (void *)_CFCopySystemVersionDictionary();
  uint64_t v13 = v12;
  if (v12)
  {
    id v14 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4F1CD10]];
    if (v14)
    {
      id v15 = [v13 objectForKeyedSubscript:@"ReleaseType"];
      id v16 = container_log_handle_for_category();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)&uint8_t buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v15;
        _os_log_impl(&dword_1D7739000, v16, OS_LOG_TYPE_DEFAULT, "Current build version (%@ / %@)", buf, 0x16u);
      }
    }
    else
    {
      id v15 = container_log_handle_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)long long buf = 0;
        _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "Could not get current build string", buf, 2u);
      }
    }
  }
  else
  {
    id v14 = container_log_handle_for_category();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D7739000, v14, OS_LOG_TYPE_ERROR, "Could not get current build info", buf, 2u);
    }
  }

  dispatch_queue_t v17 = dispatch_queue_create("com.apple.containermanagerd.lockstate", 0);
  unint64_t v18 = (void *)gLockStateQueue;
  gLockStateQueue = (uint64_t)v17;

  if (!gLockStateQueue)
  {
    _os_crash();
    __break(1u);
  }
  id v19 = containermanager_copy_global_configuration();
  int v20 = [v19 kernelUpcallEnabled];

  if (v20)
  {
    id v21 = v5;
    id v68 = 0;
    id v69 = &v68;
    uint64_t v70 = 0x2020000000;
    char v71 = 0;
    *(void *)long long buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __MCMKernServerStart_block_invoke;
    v73 = (const char *)&unk_1E6A80180;
    id v74 = v21;
    BOOL v75 = &v68;
    uint64_t v22 = MCMKernServerStart_onceToken;
    id v23 = v21;
    if (v22 != -1) {
      dispatch_once(&MCMKernServerStart_onceToken, buf);
    }
    int v24 = *((unsigned __int8 *)v69 + 24);

    _Block_object_dispose(&v68, 8);
    if (!v24)
    {
      _os_crash();
      __break(1u);
      return;
    }
  }
  id v25 = containermanager_copy_global_configuration();
  __int16 v26 = [v25 libraryRepair];
  id v68 = 0;
  char v27 = [v26 createPathsIfNecessaryWithError:&v68];
  id v28 = v68;

  if ((v27 & 1) == 0)
  {
    unsigned int v40 = container_log_handle_for_category();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v28;
      _os_log_error_impl(&dword_1D7739000, v40, OS_LOG_TYPE_ERROR, "Failed creating working directories: %{public}@", buf, 0xCu);
    }
    char v41 = 0;
    goto LABEL_45;
  }
  id v29 = containermanager_copy_global_configuration();
  int v30 = [v29 dispositionForContainerClass:2];

  if (v30 == 1)
  {
    id v31 = v5;
    char v32 = [v6 defaultUserIdentity];
    uint64_t v33 = [v6 libraryRepairForUserIdentity:v32];
    id v67 = v28;
    char v34 = [v33 createPathsIfNecessaryWithError:&v67];
    id v35 = v67;

    if ((v34 & 1) == 0)
    {
      unsigned int v40 = container_log_handle_for_category();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v35;
        _os_log_error_impl(&dword_1D7739000, v40, OS_LOG_TYPE_ERROR, "Failed creating working directories: %{public}@", buf, 0xCu);
      }
      char v41 = 0;
      id v28 = v35;
      id v5 = v31;
      goto LABEL_45;
    }
    id v28 = v35;
    id v5 = v31;
  }
  id v36 = containermanager_copy_global_configuration();
  int v37 = [v36 dispositionForContainerClass:2];

  if (v37 == 1)
  {
    id v66 = v28;
    uint64_t v38 = +[MCMCodeSigningMapping codeSignMappingWithError:&v66];
    id v39 = v66;

    if (!v38)
    {
      unsigned int v40 = container_log_handle_for_category();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        *(void *)&uint8_t buf[4] = v39;
        _os_log_error_impl(&dword_1D7739000, v40, OS_LOG_TYPE_ERROR, "Failed to connect codesign mapping database: %{public}@", buf, 0xCu);
      }
      char v41 = 0;
      id v28 = v39;
      goto LABEL_45;
    }
    id v63 = v5;
    objc_storeStrong((id *)&gCodeSigningMapping, v38);
    id v28 = v39;
  }
  else
  {
    id v63 = v5;
    uint64_t v38 = 0;
  }
  uint64_t v42 = [MCMContainerCache alloc];
  v43 = [v38 childParentMapCache];
  uint64_t v44 = objc_opt_class();
  id v65 = 0;
  v45 = [(MCMContainerCache *)v42 initWithUserIdentityCache:v6 childParentMapCache:v43 classCacheClass:v44 cacheEntryClass:objc_opt_class() error:&v65];
  unsigned int v40 = v65;

  if (v45)
  {
    uint64_t v46 = (void *)gContainerCache;
    gContainerCache = (uint64_t)v45;
    id v62 = v45;

    id v47 = [MCMSystemChangeMonitor alloc];
    *(void *)long long buf = gContainerCache;
    v48 = v6;
    host_t v49 = v9;
    id v50 = containermanager_copy_global_configuration();
    uint64_t v51 = [v50 classPathCache];
    *(void *)&buf[8] = v51;
    v52 = [MEMORY[0x1E4F1C978] arrayWithObjects:buf count:2];
    uint64_t v53 = [(MCMSystemChangeMonitor *)v47 initWithQueue:v64 flushables:v52];
    uint64_t v54 = (void *)gMCMChangeMonitor;
    gMCMChangeMonitor = v53;

    uint64_t v9 = v49;
    id v6 = v48;
    [v48 addObserver:gMCMChangeMonitor];

    char v41 = 1;
  }
  else
  {
    uint64_t v55 = container_log_handle_for_category();
    if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      *(void *)&uint8_t buf[4] = v40;
      _os_log_error_impl(&dword_1D7739000, v55, OS_LOG_TYPE_ERROR, "Failed to connect container cache database: %{public}@", buf, 0xCu);
    }

    char v41 = 0;
  }
  id v5 = v63;
LABEL_45:

  if ((v41 & 1) == 0)
  {
    BOOL v56 = [[MCMError alloc] initWithErrorType:91];
    uint64_t v57 = *(void *)(*(void *)(a1 + 56) + 8);
    id v58 = *(void **)(v57 + 40);
    *(void *)(v57 + 40) = v56;

    _containermanagerd_self_destruct(*(void **)(a1 + 32));
  }
  uint64_t v59 = *(void *)(*(void *)(a1 + 64) + 8);
  v60 = *(void **)(v59 + 40);
  *(void *)(v59 + 40) = 0;
}

void ___containermanagerd_start_xpc_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  os_signpost_id_t v2 = *(void *)(a1 + 64);
  id v3 = *(id *)(a1 + 32);
  uint64_t v84 = MEMORY[0x1D9478DF0]();
  v85 = +[MCMClientConnection sharedClientConnection];
  id v4 = v3;
  id v5 = containermanager_copy_global_configuration();
  id v6 = [v5 managedPathRegistry];
  int v7 = [v6 containermanagerLibrary];

  id v8 = containermanager_copy_global_configuration();
  LODWORD(v6) = [v8 runmode];

  if (v6)
  {
    uint64_t v9 = [v4 defaultUserIdentity];
    int v10 = [v4 managedUserPathRegistryForUserIdentity:v9];
    uint64_t v11 = [v10 containermanagerUserLibrary];

    int v7 = (void *)v11;
  }
  id v12 = [v7 url];
  uint64_t v13 = [v12 URLByAppendingPathComponent:@"boot.txt" isDirectory:0];

  id v14 = v13;
  *(void *)&long long out_token = 0;
  id v15 = [MEMORY[0x1E4F1C9B8] dataWithBytes:container_internal_get_first_boot_uuid() length:0];
  id v16 = +[MCMFileManager defaultManager];
  *(void *)dispatch_block_t v90 = 0;
  uint64_t v86 = v14;
  dispatch_queue_t v17 = [v16 readDataFromURL:v14 options:2 error:v90];
  id v18 = *(id *)v90;

  id v19 = container_log_handle_for_category();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138413058;
    id v99 = v86;
    __int16 v100 = 2112;
    id v101 = v15;
    __int16 v102 = 2112;
    mach_msg_type_number_t v103 = v17;
    __int16 v104 = 2112;
    id v105 = v18;
    _os_log_impl(&dword_1D7739000, v19, OS_LOG_TYPE_DEFAULT, "First boot check with [%@]; uuid = [%@], marker = [%@], error = %@",
      buf,
      0x2Au);
  }

  if (v17) {
    int v20 = [v15 isEqualToData:v17] ^ 1;
  }
  else {
    int v20 = 1;
  }
  id v21 = v85;

  int v83 = v20;
  if (v20)
  {
    uint64_t v22 = container_log_handle_for_category();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D7739000, v22, OS_LOG_TYPE_DEFAULT, "containermanagerd performing first boot initialization", buf, 2u);
    }

    id v23 = container_log_handle_for_category();
    if (os_signpost_enabled(v23))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7739000, v23, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FirstBootSetup", "", buf, 2u);
    }

    [v85 rebootContainerManagerSetup];
    int v24 = container_log_handle_for_category();
    if (os_signpost_enabled(v24))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7739000, v24, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FirstBootSetup", "", buf, 2u);
    }

    id v25 = v86;
    *(void *)&long long out_token = 0;
    __int16 v26 = [MEMORY[0x1E4F1C9B8] dataWithBytes:container_internal_get_first_boot_uuid() length:0];
    char v27 = +[MCMFileManager defaultManager];
    uint64_t v28 = [v27 dataWritingOptionsForFileAtURL:v25];

    id v29 = +[MCMFileManager defaultManager];
    *(void *)dispatch_block_t v90 = 0;
    char v30 = [v29 writeData:v26 toURL:v25 options:v28 mode:384 error:v90];
    id v31 = *(id *)v90;

    char v32 = container_log_handle_for_category();
    uint64_t v33 = v32;
    if (v30)
    {
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v99 = v25;
        __int16 v100 = 2112;
        id v101 = v26;
        _os_log_impl(&dword_1D7739000, v33, OS_LOG_TYPE_DEFAULT, "First boot set complete with [%@]; uuid = [%@]",
          buf,
          0x16u);
      }
    }
    else if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      id v99 = v25;
      __int16 v100 = 2112;
      id v101 = v31;
      _os_log_error_impl(&dword_1D7739000, v33, OS_LOG_TYPE_ERROR, "Could not write boot marker at [%@]; error = %@",
        buf,
        0x16u);
    }

    id v21 = v85;
  }
  char v34 = container_log_handle_for_category();
  if (os_signpost_enabled(v34))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v34, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BootSetup", "", buf, 2u);
  }

  [v21 containerManagerSetup];
  id v35 = containermanager_copy_global_configuration();
  int v36 = [v35 dispositionForContainerClass:2];

  int v37 = v20;
  os_signpost_id_t v38 = v2;
  id v39 = (void *)v84;
  if (v36 != 1) {
    goto LABEL_41;
  }
  unsigned int v40 = [(id)gContainerCache userIdentityCache];
  uint64_t v41 = [v40 userIdentityForPersonalPersona];
  if (v41)
  {
    uint64_t v42 = (void *)v41;
    BOOL v79 = v40;
    id v80 = v4;
    os_signpost_id_t v81 = v38;
    uint64_t v82 = v1;
    uint64_t v43 = +[MCMClientIdentity privilegedClientIdentityWithUserIdentity:v41 kernel:1];
    uint64_t v44 = +[MCMUserIdentitySharedCache sharedInstance];
    v45 = [MCMContainerFactory alloc];
    id v78 = (void *)v43;
    v88 = [(MCMContainerFactory *)v45 initWithContainerCache:gContainerCache clientIdentity:v43 userIdentityCache:v44];
    id v46 = containermanager_copy_global_configuration();
    id v47 = [v46 staticConfig];
    v48 = [v47 configForContainerClass:2];

    long long v108 = 0u;
    long long v109 = 0u;
    long long out_token = 0u;
    long long v107 = 0u;
    host_t v49 = +[MCMEntitlementBypassList sharedBypassList];
    id v50 = [v49 wellKnownContainerIdentifiersForSandboxPushDownCompatibilitySet];

    id obj = v50;
    uint64_t v51 = [v50 countByEnumeratingWithState:&out_token objects:buf count:16];
    if (v51)
    {
      uint64_t v52 = v51;
      uint64_t v53 = *(void *)v107;
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v107 != v53) {
            objc_enumerationMutation(obj);
          }
          uint64_t v55 = *(void *)(*((void *)&out_token + 1) + 8 * i);
          uint64_t v95 = 1;
          BOOL v56 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v42 identifier:v55 containerConfig:v48 platform:dyld_get_active_platform() userIdentityCache:v44 error:&v95];
          if (v56)
          {
            id v89 = 0;
            uint64_t v57 = [(MCMContainerFactory *)v88 containerForContainerIdentity:v56 createIfNecessary:1 error:&v89];
            id v58 = v89;
            uint64_t v59 = v58;
            if (!v57) {
              uint64_t v95 = [v58 type];
            }
          }
          if (v95 != 1)
          {
            v60 = container_log_handle_for_category();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)dispatch_block_t v90 = 138543618;
              *(void *)&v90[4] = v55;
              __int16 v91 = 2048;
              uint64_t v92 = v95;
              _os_log_impl(&dword_1D7739000, v60, OS_LOG_TYPE_DEFAULT, "_create_well_known_containers: Failed for bundleID '%{public}@' with error: %llu", v90, 0x16u);
            }
          }
        }
        uint64_t v52 = [obj countByEnumeratingWithState:&out_token objects:buf count:16];
      }
      while (v52);
    }

    os_signpost_id_t v38 = v81;
    uint64_t v1 = v82;
    id v4 = v80;
    id v39 = (void *)v84;
    id v21 = v85;
    int v37 = v83;
LABEL_41:
    id v61 = containermanager_copy_global_configuration();
    int v62 = [v61 dispositionForContainerClass:13];

    if (v62 == 1)
    {
      uint64_t v95 = (uint64_t)"systemgroup.com.apple.installcoordinationd";
      uint64_t v96 = "/private/var/containers/Shared/SystemGroup/systemgroup.com.apple.installcoordinationd";
      uint64_t v97 = 0;
      int v63 = sandbox_set_user_state_item_with_persona();
      if (v63)
      {
        int v64 = v63;
        id v65 = container_log_handle_for_category();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)dispatch_block_t v90 = 136315650;
          *(void *)&v90[4] = v95;
          __int16 v91 = 2080;
          uint64_t v92 = (uint64_t)v96;
          __int16 v93 = 1024;
          int v94 = v64;
          _os_log_error_impl(&dword_1D7739000, v65, OS_LOG_TYPE_ERROR, "Failed to set systemgroup mapping for identifier %s, path: %s : %d", v90, 0x1Cu);
        }
      }
    }
    goto LABEL_49;
  }
  id v66 = container_log_handle_for_category();
  id v39 = (void *)v84;
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D7739000, v66, OS_LOG_TYPE_DEFAULT, "_create_well_known_containers: Unable to find user identity!", buf, 2u);
  }

LABEL_49:
  id v67 = container_log_handle_for_category();
  if (os_signpost_enabled(v67))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v67, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "BootSetup", "", buf, 2u);
  }

  LODWORD(out_token) = 0;
  id v68 = (void *)*MEMORY[0x1E4F78160];
  uint32_t v69 = notify_register_dispatch((const char *)*MEMORY[0x1E4F78160], (int *)&out_token, MEMORY[0x1E4F14428], &__block_literal_global_181);
  if (v69)
  {
    uint32_t v70 = v69;
    char v71 = container_log_handle_for_category();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315394;
      id v99 = v68;
      __int16 v100 = 1024;
      LODWORD(v101) = v70;
      _os_log_error_impl(&dword_1D7739000, v71, OS_LOG_TYPE_ERROR, "notify_register_dispatch for notification \"%s\" failed; returned %d\n",
        buf,
        0x12u);
    }
  }
  _containermanagerd_keybagd_notification_callback();
  if (v37)
  {
    id v72 = container_log_handle_for_category();
    if (os_signpost_enabled(v72))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1D7739000, v72, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "FirstBootCleanup", "", buf, 2u);
    }

    [v21 rebootContainerManagerCleanupWithCompletion:&__block_literal_global_184];
  }
  v73 = container_log_handle_for_category();
  if (os_signpost_enabled(v73))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v73, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "BootCleanup", "", buf, 2u);
  }

  [v21 containerManagerCleanupWithCompletion:&__block_literal_global_187];
  id v74 = container_log_handle_for_category();
  BOOL v75 = v74;
  if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v75, OS_SIGNPOST_INTERVAL_END, v38, "StartingUp", "", buf, 2u);
  }

  uint64_t v76 = *(void *)(*(void *)(v1 + 56) + 8);
  id v77 = *(void **)(v76 + 40);
  *(void *)(v76 + 40) = 0;
}

_xpc_connection_s *___containermanagerd_start_xpc_block_invoke_3(uint64_t a1, char *name)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  xpc_connection_t mach_service = xpc_connection_create_mach_service(name, *(dispatch_queue_t *)(a1 + 32), 1uLL);
  if (!mach_service)
  {
    id v6 = container_log_handle_for_category();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_error_impl(&dword_1D7739000, v6, OS_LOG_TYPE_ERROR, "unable to start xpc service!", buf, 2u);
    }

    exit(100);
  }
  id v4 = mach_service;
  __xpc_connection_set_logging();
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = ___containermanagerd_start_xpc_block_invoke_149;
  handler[3] = &unk_1E6A7F440;
  uint64_t v12 = *(void *)(a1 + 64);
  id v8 = *(id *)(a1 + 40);
  id v9 = *(id *)(a1 + 32);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  xpc_connection_set_event_handler(v4, handler);
  xpc_connection_resume(v4);

  return v4;
}

_xpc_connection_s *___containermanagerd_start_xpc_with_permanent_error_block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = [[MCMError alloc] initWithErrorType:*(void *)(a1 + 40)];
  xpc_connection_t mach_service = xpc_connection_create_mach_service(a2, *(dispatch_queue_t *)(a1 + 32), 1uLL);
  if (mach_service)
  {
    __xpc_connection_set_logging();
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = ___containermanagerd_start_xpc_with_permanent_error_block_invoke_2;
    handler[3] = &unk_1E6A7F4B0;
    id v8 = *(id *)(a1 + 32);
    id v9 = v4;
    xpc_connection_set_event_handler(mach_service, handler);
    xpc_connection_resume(mach_service);
  }

  return mach_service;
}

void _containermanagerd_self_destruct(void *a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___containermanagerd_self_destruct_block_invoke;
  v4[3] = &unk_1E6A80730;
  id v5 = v1;
  uint64_t v2 = _containermanagerd_self_destruct_onceToken;
  id v3 = v1;
  if (v2 != -1) {
    dispatch_once(&_containermanagerd_self_destruct_onceToken, v4);
  }
}

void ___containermanagerd_self_destruct_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x3032000000;
  v5[3] = __Block_byref_object_copy__1003;
  v5[4] = __Block_byref_object_dispose__1004;
  id v6 = (id)os_transaction_create();
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  id v3 = *(NSObject **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = ___containermanagerd_self_destruct_block_invoke_2;
  v4[3] = &unk_1E6A80420;
  void v4[4] = v5;
  dispatch_after(v2, v3, v4);
  _Block_object_dispose(v5, 8);
}

void ___containermanagerd_self_destruct_block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v2 = container_log_handle_for_category();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v5 = 0;
    _os_log_error_impl(&dword_1D7739000, v2, OS_LOG_TYPE_ERROR, "Exiting when clean.", v5, 2u);
  }

  xpc_transaction_exit_clean();
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = 0;
}

void ___containermanagerd_start_xpc_with_permanent_error_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(a1 + 40);

  _containermanagerd_listener_handler_for_permanent_error(v3, a2, v4);
}

void _containermanagerd_listener_handler_for_permanent_error(void *a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a1;
  uint64_t v6 = a2;
  id v7 = a3;
  if (MEMORY[0x1D94798D0](v6) == MEMORY[0x1E4F14578])
  {
    xpc_connection_set_target_queue(v6, v5);
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = ___containermanagerd_listener_handler_for_permanent_error_block_invoke;
    handler[3] = &unk_1E6A7F4B0;
    id v8 = v6;
    uint64_t v10 = v8;
    id v11 = v7;
    xpc_connection_set_event_handler(v8, handler);
    xpc_connection_resume(v8);
  }
}

void ___containermanagerd_listener_handler_for_permanent_error_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (MEMORY[0x1D94798D0]() != MEMORY[0x1E4F145A8])
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = (_xpc_connection_s *)*(id *)(a1 + 32);
    id v6 = v3;
    id v7 = v4;
    xpc_object_t reply = xpc_dictionary_create_reply(v6);
    if (reply)
    {
      xpc_object_t v9 = xpc_dictionary_create(0, 0, 0);
      [v7 libsystemError];
      container_xpc_encode_error();
      xpc_dictionary_set_value(reply, "ReplyErrorExtended", v9);
      uint64_t uint64 = xpc_dictionary_get_uint64(v6, "Command");
      long long v26 = 0u;
      long long v27 = 0u;
      xpc_dictionary_get_audit_token();
      uint64_t v15 = container_audit_token_copy_codesign_identifier();
      int euid = container_audit_token_get_euid();
      memset(buf, 0, 32);
      int pid = container_audit_token_get_pid();
      uid_t v12 = geteuid();
      uint64_t v13 = container_log_handle_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        uint64_t v14 = [v7 type];
        [v7 type];
        *(_DWORD *)long long buf = 67110914;
        *(_DWORD *)&uint8_t buf[4] = v12;
        *(_WORD *)&uint8_t buf[8] = 2082;
        *(void *)&buf[10] = " EXITING AFTER REPLYING TO:";
        *(_WORD *)&buf[18] = 2048;
        *(void *)&buf[20] = uint64;
        *(_WORD *)&buf[28] = 2080;
        *(void *)&buf[30] = v15;
        __int16 v18 = 1024;
        int v19 = euid;
        __int16 v20 = 1024;
        int v21 = pid;
        __int16 v22 = 2048;
        uint64_t v23 = v14;
        __int16 v24 = 2080;
        uint64_t error_description = container_get_error_description();
        _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "[%u]%{public}s command=%llu, client=%s(uid: %d, pid: %d), error=%llu (%s)", buf, 0x46u);
      }

      xpc_connection_send_message(v5, reply);
      xpc_connection_send_barrier(v5, &__block_literal_global_202);
    }
    else
    {
      xpc_connection_cancel(v5);
    }
  }
}

void ___containermanagerd_reply_with_error_block_invoke()
{
}

void ___containermanagerd_connection_handler_block_invoke()
{
  v0 = objc_alloc_init(MCMCommandDispatcher);
  id v1 = (void *)_containermanagerd_connection_handler_dispatcher;
  _containermanagerd_connection_handler_dispatcher = (uint64_t)v0;

  id v3 = (id)_containermanagerd_connection_handler_dispatcher;
  int has_internal_content = os_variant_has_internal_content();
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  if (has_internal_content) {
    [v3 registerCommandClass:objc_opt_class()];
  }
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  if (has_internal_content) {
    [v3 registerCommandClass:objc_opt_class()];
  }
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
  [v3 registerCommandClass:objc_opt_class()];
}

void _containermanagerd_keybagd_notification_callback()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  int v0 = MKBGetDeviceLockState();
  id v1 = container_log_handle_for_category();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG))
  {
    v2[0] = 67109120;
    v2[1] = v0;
    _os_log_debug_impl(&dword_1D7739000, v1, OS_LOG_TYPE_DEBUG, "LockState=%d", (uint8_t *)v2, 8u);
  }

  if (v0 == 1)
  {
    if (_containermanagerd_keybagd_notification_callback_previousState != 1) {
      dispatch_suspend((dispatch_object_t)gLockStateQueue);
    }
  }
  else
  {
    if (v0) {
      return;
    }
    if (_containermanagerd_keybagd_notification_callback_previousState == 1) {
      dispatch_resume((dispatch_object_t)gLockStateQueue);
    }
  }
  _containermanagerd_keybagd_notification_callback_previousState = v0;
}

void ___containermanagerd_perform_launch_tasks_block_invoke_185()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v0 = container_log_handle_for_category();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D7739000, v0, OS_LOG_TYPE_DEFAULT, "containermanagerd cleanup complete", buf, 2u);
  }

  id v1 = container_log_handle_for_category();
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)dispatch_time_t v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v1, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "BootCleanup", "", v2, 2u);
  }
}

void ___containermanagerd_perform_launch_tasks_block_invoke_182()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v0 = container_log_handle_for_category();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1D7739000, v0, OS_LOG_TYPE_DEFAULT, "containermanagerd first boot cleanup complete", buf, 2u);
  }

  id v1 = container_log_handle_for_category();
  if (os_signpost_enabled(v1))
  {
    *(_WORD *)dispatch_time_t v2 = 0;
    _os_signpost_emit_with_name_impl(&dword_1D7739000, v1, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "FirstBootCleanup", "", v2, 2u);
  }
}

void ___containermanagerd_perform_launch_tasks_block_invoke()
{
  _containermanagerd_keybagd_notification_callback();
}

void ___containermanagerd_setup_log_replication_block_invoke()
{
  int v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v9 = dispatch_queue_create("com.apple.containermanagerd.volume-notification", v0);

  id v1 = MCMSharedFastWorkloop();
  id v2 = containermanager_copy_global_configuration();
  uint64_t v3 = [v2 defaultUser];
  [v3 UID];
  container_log_replication_prune_for_uid();

  uint64_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:@"/private/var" isDirectory:1 relativeToURL:0];
  id v5 = [[MCMLogReplicator alloc] initWithWorkloop:v1];
  id v6 = (void *)_containermanagerd_setup_log_replication_logReplicator;
  _containermanagerd_setup_log_replication_logReplicator = (uint64_t)v5;

  id v7 = [[MCMVolumeChangeMonitor alloc] initWithWorkloop:v9 mountPointURL:v4];
  id v8 = (void *)gMCMVolumeMonitor;
  gMCMVolumeMonitor = (uint64_t)v7;

  [(id)gMCMVolumeMonitor addObserver:_containermanagerd_setup_log_replication_logReplicator];
  [(id)gMCMVolumeMonitor start];
}

uint64_t _containermanagerd_exception_preprocessor(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
    id v2 = [v1 reason];
    [v2 UTF8String];
    _os_log_send_and_compose_impl();

    _os_crash_msg();
    __break(1u);
  }
  uint64_t result = _os_crash();
  __break(1u);
  return result;
}

void sub_1D777BC6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D777C058(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1077(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1078(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
}

uint64_t _fix_permissions_on_path(const char *a1, const char *a2, char *a3, int *a4)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  char v45 = 0;
  memset(&v49, 0, sizeof(v49));
  int v44 = 0;
  uint64_t v43 = 0;
  if (a2)
  {
    size_t v8 = strlen(a2);
    if (strncmp(a1, a2, v8))
    {
      int v44 = 62;
      dispatch_queue_t v9 = container_log_handle_for_category();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315394;
        *(void *)id v47 = a1;
        *(_WORD *)&v47[8] = 2080;
        v48[0] = a2;
        _os_log_error_impl(&dword_1D7739000, v9, OS_LOG_TYPE_ERROR, "Path [%s] does not have accepted path prefix [%s] when trying to fix permissions", buf, 0x16u);
      }

      uint64_t v10 = 0;
      goto LABEL_44;
    }
  }
  if (lstat(a1, &v49))
  {
    int v44 = *__error();
    id v11 = strdup(a1);
    uint64_t v43 = v11;
    uid_t v12 = rindex(v11, 47);
    uint64_t v13 = container_log_handle_for_category();
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
    if (!v12 || v11 == v12)
    {
      if (v14)
      {
        int v23 = *__error();
        __int16 v24 = __error();
        id v25 = strerror(*v24);
        *(_DWORD *)long long buf = 136315650;
        *(void *)id v47 = a1;
        *(_WORD *)&v47[8] = 1024;
        LODWORD(v48[0]) = v23;
        WORD2(v48[0]) = 2080;
        *(void *)((char *)v48 + 6) = v25;
        int v19 = "Failed to stat [%s] when trying to fix permissions, could not recover: (%d) %s";
        goto LABEL_39;
      }
      goto LABEL_40;
    }
    if (v14)
    {
      int v37 = *__error();
      os_signpost_id_t v38 = __error();
      id v39 = strerror(*v38);
      *(_DWORD *)long long buf = 136315650;
      *(void *)id v47 = a1;
      *(_WORD *)&v47[8] = 1024;
      LODWORD(v48[0]) = v37;
      WORD2(v48[0]) = 2080;
      *(void *)((char *)v48 + 6) = v39;
      _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "Failed to stat [%s] when trying to fix permissions, attempting to recover: (%d) %s", buf, 0x1Cu);
    }

    char *v12 = 0;
    if (!_fix_permissions_on_path(v11, a2, &v45, &v44))
    {
      uint64_t v10 = 0;
      goto LABEL_42;
    }
    if (lstat(a1, &v49))
    {
      int v15 = *__error();
      int v44 = v15;
      if (v15 != 13 && v15 != 1)
      {
        uint64_t v13 = container_log_handle_for_category();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          int v40 = *__error();
          uint64_t v41 = __error();
          uint64_t v42 = strerror(*v41);
          *(_DWORD *)long long buf = 136315650;
          *(void *)id v47 = a1;
          *(_WORD *)&v47[8] = 1024;
          LODWORD(v48[0]) = v40;
          WORD2(v48[0]) = 2080;
          *(void *)((char *)v48 + 6) = v42;
          _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, "Failed to stat [%s] when trying to fix permissions, but no longer a permission error: (%d) %s", buf, 0x1Cu);
        }
        uint64_t v10 = 1;
        goto LABEL_41;
      }
      uint64_t v13 = container_log_handle_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        int v16 = *__error();
        dispatch_queue_t v17 = __error();
        __int16 v18 = strerror(*v17);
        *(_DWORD *)long long buf = 136315650;
        *(void *)id v47 = a1;
        *(_WORD *)&v47[8] = 1024;
        LODWORD(v48[0]) = v16;
        WORD2(v48[0]) = 2080;
        *(void *)((char *)v48 + 6) = v18;
        int v19 = "Failed to stat [%s] when trying to fix permissions, gave up: (%d) %s";
LABEL_39:
        _os_log_error_impl(&dword_1D7739000, v13, OS_LOG_TYPE_ERROR, v19, buf, 0x1Cu);
        goto LABEL_40;
      }
      goto LABEL_40;
    }
  }
  else
  {
    id v11 = 0;
  }
  if ((v49.st_flags & 6) == 0)
  {
LABEL_28:
    int v27 = v49.st_mode & 0xF000;
    if (v27 == 40960 || v27 == 0x4000) {
      int v29 = 448;
    }
    else {
      int v29 = 384;
    }
    if ((v49.st_mode & 0x1C0) == v29)
    {
      uint64_t v10 = 1;
      goto LABEL_42;
    }
    int v30 = v49.st_mode & 0xFE3F;
    int v31 = v29 | v30;
    if (!lchmod(a1, v29 | v30))
    {
      uint64_t v10 = 1;
      char v45 = 1;
      uint64_t v13 = container_log_handle_for_category();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109634;
        *(_DWORD *)id v47 = v49.st_mode;
        *(_WORD *)&v47[4] = 1024;
        *(_DWORD *)&v47[6] = v31;
        LOWORD(v48[0]) = 2080;
        *(void *)((char *)v48 + 2) = a1;
        _os_log_impl(&dword_1D7739000, v13, OS_LOG_TYPE_DEFAULT, "lchmod u+rw(x) (0%o → 0%o) on [%s]", buf, 0x18u);
      }
      goto LABEL_41;
    }
    int v44 = *__error();
    uint64_t v13 = container_log_handle_for_category();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_40;
    }
    int v32 = *__error();
    uint64_t v33 = __error();
    char v34 = strerror(*v33);
    *(_DWORD *)long long buf = 136315650;
    *(void *)id v47 = a1;
    *(_WORD *)&v47[8] = 1024;
    LODWORD(v48[0]) = v32;
    WORD2(v48[0]) = 2080;
    *(void *)((char *)v48 + 6) = v34;
    int v19 = "lchmod() for [%s] failed during permissions repair: (%d) %s";
    goto LABEL_39;
  }
  if (!lchflags(a1, v49.st_flags & 0xFFFFFFF9))
  {
    char v45 = 1;
    long long v26 = container_log_handle_for_category();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 136315138;
      *(void *)id v47 = a1;
      _os_log_impl(&dword_1D7739000, v26, OS_LOG_TYPE_DEFAULT, "Unset UF_IMMUTABLE | UF_APPEND on [%s]", buf, 0xCu);
    }

    goto LABEL_28;
  }
  int v44 = *__error();
  uint64_t v13 = container_log_handle_for_category();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    int v20 = *__error();
    int v21 = __error();
    __int16 v22 = strerror(*v21);
    *(_DWORD *)long long buf = 136315650;
    *(void *)id v47 = a1;
    *(_WORD *)&v47[8] = 1024;
    LODWORD(v48[0]) = v20;
    WORD2(v48[0]) = 2080;
    *(void *)((char *)v48 + 6) = v22;
    int v19 = "Failed to lchflags [%s]: (%d) %s";
    goto LABEL_39;
  }
LABEL_40:
  uint64_t v10 = 0;
LABEL_41:

LABEL_42:
  if (v11)
  {
    free(v11);
    memset_s(&v43, 8uLL, 0, 8uLL);
  }
LABEL_44:
  if (a4 && (v10 & 1) == 0) {
    *a4 = v44;
  }
  char v35 = v10 ^ 1;
  if (!a3) {
    char v35 = 1;
  }
  if ((v35 & 1) == 0) {
    *a3 = v45;
  }
  return v10;
}

void sub_1D7786760(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t _removefile_error_callback(_removefile_state *a1, const char *a2, _DWORD *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  int dst = 0;
  if (!removefile_state_get(a1, 5u, &dst))
  {
    if (dst == 2) {
      goto LABEL_15;
    }
    id v7 = container_log_handle_for_category();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v13 = dst;
      BOOL v14 = strerror(dst);
      v26.st_dev = 136315650;
      *(void *)&v26.st_mode = a2;
      WORD2(v26.st_ino) = 1024;
      *(_DWORD *)((char *)&v26.st_ino + 6) = v13;
      HIWORD(v26.st_uid) = 2080;
      *(void *)&v26.st_gid = v14;
      _os_log_error_impl(&dword_1D7739000, v7, OS_LOG_TYPE_ERROR, "removefile hit error for [%s]: (%d) %s", (uint8_t *)&v26, 0x1Cu);
    }
    if ((v7, dst != 13) && dst != 1 || (char v18 = 0, _fix_permissions_on_path(a2, 0, &v18, 0), !v18))
    {
LABEL_15:
      uint64_t result = 0;
      if (!a3) {
        return result;
      }
      goto LABEL_16;
    }
    memset(&v26, 0, sizeof(v26));
    if (lstat(a2, &v26))
    {
      size_t v8 = container_log_handle_for_category();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
LABEL_14:

        goto LABEL_15;
      }
      int v15 = *__error();
      int v16 = __error();
      dispatch_queue_t v17 = strerror(*v16);
      *(_DWORD *)long long buf = 136315650;
      int v21 = a2;
      __int16 v22 = 1024;
      int v23 = v15;
      __int16 v24 = 2080;
      id v25 = v17;
      uid_t v12 = "lstat of [%s] failed when trying to figure out why unlink failed: (%d) %s";
    }
    else
    {
      if ((v26.st_mode & 0xF000) == 0x4000)
      {
        int dst = 35;
        uint64_t result = 2;
        if (!a3) {
          return result;
        }
        goto LABEL_16;
      }
      uint64_t result = unlink(a2);
      if (!result) {
        return result;
      }
      size_t v8 = container_log_handle_for_category();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        goto LABEL_14;
      }
      int v9 = *__error();
      uint64_t v10 = __error();
      id v11 = strerror(*v10);
      *(_DWORD *)long long buf = 136315650;
      int v21 = a2;
      __int16 v22 = 1024;
      int v23 = v9;
      __int16 v24 = 2080;
      id v25 = v11;
      uid_t v12 = "unlink of [%s] failed: (%d) %s";
    }
    _os_log_error_impl(&dword_1D7739000, v8, OS_LOG_TYPE_ERROR, v12, buf, 0x1Cu);
    goto LABEL_14;
  }
  id v5 = container_log_handle_for_category();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v26.st_dev = 136315138;
    *(void *)&v26.st_mode = a2;
    _os_log_error_impl(&dword_1D7739000, v5, OS_LOG_TYPE_ERROR, "removefile hit error for [%s] but we failed to get the error number", (uint8_t *)&v26, 0xCu);
  }

  uint64_t result = 0;
  int dst = 2;
  if (a3)
  {
LABEL_16:
    if (!*a3) {
      *a3 = dst;
    }
  }
  return result;
}

uint64_t __containermanager_copy_default_file_manager_block_invoke()
{
  gMCMDefaultFileManager = objc_alloc_init(MCMFileManager);

  return MEMORY[0x1F41817F8]();
}

void sub_1D7792960(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void containermanager_set_global_configuration(id obj)
{
  objc_storeStrong((id *)&_gGlobalConfiguration, obj);
}

void sub_1D7797234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51)
{
}

uint64_t __Block_byref_object_copy__2311(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2312(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
}

void sub_1D779B73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D779E284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

uint64_t __Block_byref_object_copy__2992(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2993(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
}

void sub_1D779F9D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D77A032C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D77A30A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

uint64_t __Block_byref_object_copy__3634(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3635(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
}

void sub_1D77A36F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_1D77A4D60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D77A4F10(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D77A59A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77A5BC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77A613C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va1, a10);
  va_start(va, a10);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4018(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4019(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
}

void sub_1D77A6450(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
}

void sub_1D77A6668(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_1D77A6BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
}

void sub_1D77A75E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77A78E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77A7AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77A7CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77A7FB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va1, a8);
  va_start(va, a8);
  uint64_t v9 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D77A874C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  _Block_object_dispose(&a59, 8);
  _Block_object_dispose(&a48, 8);
  _Block_object_dispose(&a65, 8);
  _Unwind_Resume(a1);
}

void sub_1D77A8EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77A91AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v12 - 120), 8);
  _Unwind_Resume(a1);
}

void sub_1D77A98C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77A9AB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77AB3D4(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x1D77AB3E0);
}

void sub_1D77ACA48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
}

void sub_1D77AE53C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77AF878(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1D77B02DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose((const void *)(v17 - 144), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77B07F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _moveSystemContainerIntoPlace(void *a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v7 = a1;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v7 lastPathComponent];
  id v77 = [v7 URLByDeletingLastPathComponent];
  uint64_t v11 = [v77 URLByAppendingPathExtension:@"failed"];
  uint64_t v82 = [v11 URLByAppendingPathComponent:v10 isDirectory:1];

  uint64_t v93 = 1;
  id v12 = containermanager_copy_global_configuration();
  uint64_t v13 = [v12 staticConfig];
  uint64_t v14 = [v13 configForContainerClass:a2];

  uint64_t v15 = (void *)v14;
  uint64_t v16 = +[MCMUserIdentitySharedCache sharedInstance];
  BOOL v79 = (void *)v10;
  uint64_t v17 = +[MCMContainerIdentity containerIdentityWithUserIdentity:v9 identifier:v10 containerConfig:v14 platform:0 userIdentityCache:v16 error:&v93];

  char v18 = (void *)v17;
  if (v17)
  {
    int v19 = [v8 containerFactory];
    id v92 = 0;
    int v20 = [v19 containerForContainerIdentity:v18 createIfNecessary:1 error:&v92];
    id v21 = v92;

    id v78 = v20;
    if (v20)
    {
      __int16 v22 = [v20 metadataMinimal];
      int v23 = +[MCMFileManager defaultManager];
      os_log_t log = v22;
      __int16 v24 = [v22 containerPath];
      uint64_t v84 = [v24 containerRootURL];

      id v25 = container_log_handle_for_category();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        [v7 path];
        v66 = id v65 = v18;
        [v84 path];
        v68 = id v67 = v15;
        *(_DWORD *)long long buf = 138412802;
        uint64_t v97 = (uint64_t)v79;
        __int16 v98 = 2112;
        uint64_t v99 = (uint64_t)v66;
        __int16 v100 = 2112;
        id v101 = v68;
        _os_log_error_impl(&dword_1D7739000, v25, OS_LOG_TYPE_ERROR, "Restoring container for %@ at %@ to %@", buf, 0x20u);

        uint64_t v15 = v67;
        char v18 = v65;
      }

      id v91 = 0;
      stat v26 = [v23 urlsForItemsInDirectoryAtURL:v7 error:&v91];
      id v27 = v91;
      BOOL v75 = v26;
      if (v26 && !v21)
      {
        id v72 = v9;
        id v73 = v8;
        id v74 = v7;
        long long v107 = 0u;
        long long v108 = 0u;
        long long v105 = 0u;
        long long v106 = 0u;
        id obj = v26;
        uint64_t v85 = [obj countByEnumeratingWithState:&v105 objects:v104 count:16];
        uint32_t v70 = v18;
        char v71 = v15;
        if (!v85)
        {
          id v28 = v27;
          goto LABEL_39;
        }
        uint64_t v83 = *(void *)v106;
        os_signpost_id_t v81 = v23;
        id v28 = v27;
        p_info = MCMContainerSchemaActionMkdir.info;
        while (1)
        {
          for (uint64_t i = 0; i != v85; ++i)
          {
            if (*(void *)v106 != v83) {
              objc_enumerationMutation(obj);
            }
            int v31 = *(void **)(*((void *)&v105 + 1) + 8 * i);
            int v32 = [v31 lastPathComponent];
            uint64_t v33 = [v84 URLByAppendingPathComponent:v32 isDirectory:0];
            id v90 = v28;
            char v34 = [v23 removeItemAtURL:v33 error:&v90];
            id v35 = v90;

            uint64_t v86 = (void *)v33;
            if (v34)
            {
              int v36 = [p_info + 66 defaultManager];
              id v89 = v35;
              char v37 = [v36 moveItemAtURL:v31 toURL:v33 error:&v89];
              id v28 = v89;

              if (v37) {
                goto LABEL_28;
              }
              os_signpost_id_t v38 = container_log_handle_for_category();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                id v39 = [v31 path];
                int v40 = [v86 path];
                *(_DWORD *)long long buf = 138413058;
                uint64_t v97 = (uint64_t)v79;
                __int16 v98 = 2112;
                uint64_t v99 = (uint64_t)v39;
                __int16 v100 = 2112;
                id v101 = v40;
                __int16 v102 = 2112;
                id v103 = v28;
                _os_log_error_impl(&dword_1D7739000, v38, OS_LOG_TYPE_ERROR, "Failed to move file in restored system container %@:%@ to destination %@: %@", buf, 0x2Au);
              }
            }
            else
            {
              os_signpost_id_t v38 = container_log_handle_for_category();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412802;
                uint64_t v97 = (uint64_t)v79;
                __int16 v98 = 2112;
                uint64_t v99 = (uint64_t)v86;
                __int16 v100 = 2112;
                id v101 = v35;
                _os_log_error_impl(&dword_1D7739000, v38, OS_LOG_TYPE_ERROR, "Failed to remove destination %@:%@: %@", buf, 0x20u);
              }
              id v28 = v35;
            }

            id v87 = v31;
            id v41 = v82;
            id v42 = v32;
            uint64_t v43 = [p_info + 66 defaultManager];
            id v95 = 0;
            char v44 = [v43 createDirectoryAtURL:v41 withIntermediateDirectories:1 mode:511 error:&v95];
            id v45 = v95;

            if ((v44 & 1) == 0)
            {
              id v46 = container_log_handle_for_category();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412546;
                uint64_t v97 = (uint64_t)v82;
                __int16 v98 = 2112;
                uint64_t v99 = (uint64_t)v45;
                _os_log_error_impl(&dword_1D7739000, v46, OS_LOG_TYPE_ERROR, "Failed to create %@: %@", buf, 0x16u);
              }
            }
            id v47 = v32;
            id v48 = v28;
            stat v49 = [v41 URLByAppendingPathComponent:v42 isDirectory:0];
            uint64_t v50 = [p_info + 66 defaultManager];
            id v94 = v45;
            char v51 = [v50 moveItemAtURL:v87 toURL:v49 error:&v94];
            id v52 = v94;

            if ((v51 & 1) == 0)
            {
              uint64_t v53 = container_log_handle_for_category();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412802;
                uint64_t v97 = (uint64_t)v87;
                __int16 v98 = 2112;
                uint64_t v99 = (uint64_t)v49;
                __int16 v100 = 2112;
                id v101 = v52;
                _os_log_error_impl(&dword_1D7739000, v53, OS_LOG_TYPE_ERROR, "Failed to move %@ to %@: %@", buf, 0x20u);
              }
            }
            int v23 = v81;
            id v21 = 0;
            id v28 = v48;
            p_info = (__objc2_class_ro **)(MCMContainerSchemaActionMkdir + 32);
            int v32 = v47;
LABEL_28:
          }
          uint64_t v85 = [obj countByEnumeratingWithState:&v105 objects:v104 count:16];
          if (!v85)
          {
LABEL_39:
            id v27 = v28;

            BOOL v56 = objc_alloc_init(MCMResultPromise);
            uint64_t v59 = [MCMCommandProcessRestoredContainer alloc];
            v60 = [log containerIdentity];
            id v8 = v73;
            id v61 = [(MCMCommandProcessRestoredContainer *)v59 initWithConcreteContainerIdentity:v60 context:v73 resultPromise:v56];

            [(MCMCommandProcessRestoredContainer *)v61 execute];
            int v62 = [(MCMResultPromise *)v56 result];
            int v63 = [v62 error];

            id v7 = v74;
            id v9 = v72;
            if (v63)
            {
              int v64 = container_log_handle_for_category();
              if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
              {
                v88 = [(MCMResultPromise *)v56 result];
                uint32_t v69 = [v88 error];
                *(_DWORD *)long long buf = 138412546;
                uint64_t v97 = (uint64_t)v79;
                __int16 v98 = 2112;
                uint64_t v99 = (uint64_t)v69;
                _os_log_error_impl(&dword_1D7739000, v64, OS_LOG_TYPE_ERROR, "Error processing restored system container %@: %@", buf, 0x16u);
              }
            }

            char v18 = v70;
            uint64_t v15 = v71;
            goto LABEL_44;
          }
        }
      }
      container_log_handle_for_category();
      BOOL v56 = (MCMResultPromise *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v56->super, OS_LOG_TYPE_ERROR))
      {
        [v7 path];
        v58 = uint64_t v57 = v18;
        *(_DWORD *)long long buf = 138412802;
        uint64_t v97 = (uint64_t)v79;
        __int16 v98 = 2112;
        uint64_t v99 = (uint64_t)v58;
        __int16 v100 = 2112;
        id v101 = v27;
        _os_log_error_impl(&dword_1D7739000, &v56->super, OS_LOG_TYPE_ERROR, "Failed to enumerate contents of restored system container %@ at %@: %@", buf, 0x20u);

        char v18 = v57;
      }
LABEL_44:
    }
    else
    {
      container_log_handle_for_category();
      os_log_t log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v97 = (uint64_t)v79;
        __int16 v98 = 2112;
        uint64_t v99 = (uint64_t)v21;
        _os_log_error_impl(&dword_1D7739000, log, OS_LOG_TYPE_ERROR, "Failed to create system container %@: %@", buf, 0x16u);
      }
    }
    uint64_t v55 = v77;
  }
  else
  {
    uint64_t v54 = container_log_handle_for_category();
    id v78 = v54;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v97 = v10;
      __int16 v98 = 2048;
      uint64_t v99 = v93;
      _os_log_error_impl(&dword_1D7739000, v54, OS_LOG_TYPE_ERROR, "Failed to create container identity %@: %llu", buf, 0x16u);
    }
    id v21 = 0;
    uint64_t v55 = v77;
  }
}

void sub_1D77B3E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4718(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4719(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
}

void sub_1D77B4ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77B6558(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4951(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4952(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
}

void sub_1D77B8168(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D77B8370(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *_MCMVolumeChangeMonitorCallback(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  if (a1)
  {
    return (void *)[a1 _callbackWithVolume:a2 notificationType:a3 margs:a4];
  }
  return a1;
}

void sub_1D77B8990(_Unwind_Exception *exception_object)
{
}

void sub_1D77B8A58(_Unwind_Exception *exception_object)
{
}

void __MCMKernServerStart_block_invoke(uint64_t a1)
{
  kern_return_t v2;
  mach_error_t v3;
  NSObject *v4;
  char *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  mach_port_t sp;
  uint8_t buf[4];
  char *v14;
  uint64_t v15;

  uint64_t v15 = *MEMORY[0x1E4F143B8];
  sp = 0;
  id v2 = bootstrap_check_in(*MEMORY[0x1E4F14638], "com.apple.containermanagerd.upcall", &sp);
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = container_log_handle_for_category();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = mach_error_string(v3);
      *(_DWORD *)long long buf = 136315138;
      uint64_t v14 = v5;
      _os_log_error_impl(&dword_1D7739000, v4, OS_LOG_TYPE_ERROR, "bootstrap_check_in: %s", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v4 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    id v6 = *(NSObject **)(a1 + 32);
    if (v6) {
      id v7 = dispatch_queue_create_with_target_V2("com.apple.containermanagerd.upcall", v4, v6);
    }
    else {
      id v7 = dispatch_queue_create("com.apple.containermanagerd.upcall", v4);
    }
    id v8 = (void *)MCMKernServerStart_upcallQueue;
    MCMKernServerStart_upcallQueue = (uint64_t)v7;

    id v9 = dispatch_mach_create();
    uint64_t v10 = (void *)MCMKernServerStart_channel;
    MCMKernServerStart_channel = v9;

    uint64_t v11 = container_log_handle_for_category();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D7739000, v11, OS_LOG_TYPE_DEFAULT, "Starting kernel upcall mach channel", buf, 2u);
    }

    dispatch_mach_connect();
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

void sub_1D77C0774(_Unwind_Exception *a1)
{
}

void sub_1D77C37D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t __Block_byref_object_copy__6701(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6702(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
}

void sub_1D77C78D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

uint64_t __Block_byref_object_copy__7166(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7167(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
}

void __MCMContainerSchemaDefinitionForClass_block_invoke()
{
  v75[1] = *MEMORY[0x1E4F143B8];
  id v73 = @"script";
  stat v49 = [(MCMActionArgumentBase *)[MCMActionArgumentCommand alloc] initWithString:@"mkdir"];
  v71[0] = v49;
  id v47 = [(MCMActionArgumentBase *)[MCMActionArgumentRelativeDirectory alloc] initWithString:@"Library"];
  v71[1] = v47;
  id v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
  v72[0] = v45;
  uint64_t v43 = [(MCMActionArgumentBase *)[MCMActionArgumentCommand alloc] initWithString:@"mkdir"];
  v70[0] = v43;
  id v41 = [(MCMActionArgumentBase *)[MCMActionArgumentRelativeDirectory alloc] initWithString:@"Library/Preferences"];
  v70[1] = v41;
  id v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v70 count:2];
  v72[1] = v39;
  char v37 = [(MCMActionArgumentBase *)[MCMActionArgumentCommand alloc] initWithString:@"mkdir"];
  v69[0] = v37;
  id v35 = [(MCMActionArgumentBase *)[MCMActionArgumentRelativeDirectory alloc] initWithString:@"Library/Caches"];
  v69[1] = v35;
  char v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
  v72[2] = v34;
  uint64_t v33 = [(MCMActionArgumentBase *)[MCMActionArgumentCommand alloc] initWithString:@"mkdir"];
  v68[0] = v33;
  int v32 = [(MCMActionArgumentBase *)[MCMActionArgumentRelativeDirectory alloc] initWithString:@"Documents"];
  v68[1] = v32;
  int v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:2];
  v72[3] = v0;
  id v1 = [(MCMActionArgumentBase *)[MCMActionArgumentCommand alloc] initWithString:@"mkdir"];
  v67[0] = v1;
  id v2 = [(MCMActionArgumentBase *)[MCMActionArgumentRelativeDirectory alloc] initWithString:@"SystemData"];
  v67[1] = v2;
  uint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v67 count:2];
  v72[4] = v3;
  uint64_t v4 = [(MCMActionArgumentBase *)[MCMActionArgumentCommand alloc] initWithString:@"mkdir"];
  v66[0] = v4;
  id v5 = [(MCMActionArgumentBase *)[MCMActionArgumentRelativeDirectory alloc] initWithString:@"tmp"];
  v66[1] = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
  v72[5] = v6;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:6];
  id v74 = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
  v75[0] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v75 count:1];
  uint64_t v10 = (void *)MCMContainerSchemaDefinitionForClass_userDataSchemaDefinition;
  MCMContainerSchemaDefinitionForClass_userDataSchemaDefinition = v9;

  int v63 = @"script";
  uint64_t v50 = [(MCMActionArgumentBase *)[MCMActionArgumentCommand alloc] initWithString:@"mkdir"];
  v61[0] = v50;
  id v48 = [(MCMActionArgumentBase *)[MCMActionArgumentRelativeDirectory alloc] initWithString:@"Library"];
  v61[1] = v48;
  id v46 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
  v62[0] = v46;
  char v44 = [(MCMActionArgumentBase *)[MCMActionArgumentCommand alloc] initWithString:@"mkdir"];
  v60[0] = v44;
  id v42 = [(MCMActionArgumentBase *)[MCMActionArgumentRelativeDirectory alloc] initWithString:@"Library/Preferences"];
  v60[1] = v42;
  int v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:2];
  v62[1] = v40;
  os_signpost_id_t v38 = [(MCMActionArgumentBase *)[MCMActionArgumentCommand alloc] initWithString:@"mkdir"];
  v59[0] = v38;
  int v36 = [(MCMActionArgumentBase *)[MCMActionArgumentRelativeDirectory alloc] initWithString:@"Library/Caches"];
  v59[1] = v36;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
  v62[2] = v11;
  uint64_t v12 = [(MCMActionArgumentBase *)[MCMActionArgumentCommand alloc] initWithString:@"mkdir"];
  v58[0] = v12;
  uint64_t v13 = [(MCMActionArgumentBase *)[MCMActionArgumentRelativeDirectory alloc] initWithString:@"Documents"];
  v58[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:2];
  v62[3] = v14;
  uint64_t v15 = [(MCMActionArgumentBase *)[MCMActionArgumentCommand alloc] initWithString:@"mkdir"];
  v57[0] = v15;
  uint64_t v16 = [(MCMActionArgumentBase *)[MCMActionArgumentRelativeDirectory alloc] initWithString:@"tmp"];
  v57[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:2];
  v62[4] = v17;
  char v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:5];
  int v64 = v18;
  int v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  id v65 = v19;
  uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v65 count:1];
  id v21 = (void *)MCMContainerSchemaDefinitionForClass_systemSchemaDefinition;
  MCMContainerSchemaDefinitionForClass_systemSchemaDefinition = v20;

  uint64_t v54 = @"script";
  __int16 v22 = [(MCMActionArgumentBase *)[MCMActionArgumentCommand alloc] initWithString:@"mkdir"];
  v52[0] = v22;
  int v23 = [(MCMActionArgumentBase *)[MCMActionArgumentRelativeDirectory alloc] initWithString:@"Library"];
  v52[1] = v23;
  __int16 v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  v53[0] = v24;
  id v25 = [(MCMActionArgumentBase *)[MCMActionArgumentCommand alloc] initWithString:@"mkdir"];
  v51[0] = v25;
  stat v26 = [(MCMActionArgumentBase *)[MCMActionArgumentRelativeDirectory alloc] initWithString:@"Library/Caches"];
  v51[1] = v26;
  id v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
  v53[1] = v27;
  id v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:2];
  uint64_t v55 = v28;
  int v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v55 forKeys:&v54 count:1];
  BOOL v56 = v29;
  uint64_t v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
  int v31 = (void *)MCMContainerSchemaDefinitionForClass_groupSchemaDefinition;
  MCMContainerSchemaDefinitionForClass_groupSchemaDefinition = v30;
}

id MCMSharedBackgroundQueue()
{
  if (MCMSharedBackgroundQueue_onceToken != -1) {
    dispatch_once(&MCMSharedBackgroundQueue_onceToken, &__block_literal_global_7926);
  }
  int v0 = (void *)MCMSharedBackgroundQueue_queue;

  return v0;
}

void __MCMSharedBackgroundQueue_block_invoke()
{
  int v0 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  attr = dispatch_queue_attr_make_with_qos_class(v0, QOS_CLASS_BACKGROUND, 0);

  dispatch_queue_t v1 = dispatch_queue_create("com.apple.containermanagerd.background", attr);
  id v2 = (void *)MCMSharedBackgroundQueue_queue;
  MCMSharedBackgroundQueue_queue = (uint64_t)v1;
}

id MCMSharedDeathrowQueue()
{
  if (MCMSharedDeathrowQueue_onceToken != -1) {
    dispatch_once(&MCMSharedDeathrowQueue_onceToken, &__block_literal_global_3);
  }
  int v0 = (void *)MCMSharedDeathrowQueue_queue;

  return v0;
}

void __MCMSharedDeathrowQueue_block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.containermanagerd.deathrow", v2);
  dispatch_queue_t v1 = (void *)MCMSharedDeathrowQueue_queue;
  MCMSharedDeathrowQueue_queue = (uint64_t)v0;
}

id MCMSharedFastWorkloop()
{
  if (MCMSharedFastWorkloop_onceToken != -1) {
    dispatch_once(&MCMSharedFastWorkloop_onceToken, &__block_literal_global_6);
  }
  dispatch_queue_t v0 = (void *)MCMSharedFastWorkloop_fastWorkloop;

  return v0;
}

uint64_t __MCMSharedFastWorkloop_block_invoke()
{
  MCMSharedFastWorkloop_fastWorkloop = (uint64_t)dispatch_workloop_create("com.apple.containermanagerd.fast");

  return MEMORY[0x1F41817F8]();
}

id MCMSharedSlowWorkloop()
{
  if (MCMSharedSlowWorkloop_onceToken != -1) {
    dispatch_once(&MCMSharedSlowWorkloop_onceToken, &__block_literal_global_9);
  }
  dispatch_queue_t v0 = (void *)MCMSharedSlowWorkloop_slowWorkloop;

  return v0;
}

uint64_t __MCMSharedSlowWorkloop_block_invoke()
{
  MCMSharedSlowWorkloop_slowWorkloop = (uint64_t)dispatch_workloop_create("com.apple.containermanagerd.slow");

  return MEMORY[0x1F41817F8]();
}

id MCMDataProtectionQueue()
{
  if (MCMDataProtectionQueue_onceToken != -1) {
    dispatch_once(&MCMDataProtectionQueue_onceToken, &__block_literal_global_12);
  }
  dispatch_queue_t v0 = (void *)MCMDataProtectionQueue_dataProtQueue;

  return v0;
}

void __MCMDataProtectionQueue_block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.containermanagerd.dataprot", v2);
  dispatch_queue_t v1 = (void *)MCMDataProtectionQueue_dataProtQueue;
  MCMDataProtectionQueue_dataProtQueue = (uint64_t)v0;
}

void sub_1D77CE338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8254(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8255(uint64_t a1)
{
  dispatch_queue_t v1 = *(void **)(a1 + 40);
}

void sub_1D77CFDBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t __Block_byref_object_copy__8424(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8425(uint64_t a1)
{
  dispatch_queue_t v1 = *(void **)(a1 + 40);
}

void sub_1D77D00F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_1D77D042C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_1D77D07CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
}

void sub_1D77D319C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77D3B4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,char a24)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a24, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8533(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8534(uint64_t a1)
{
  dispatch_queue_t v1 = *(void **)(a1 + 40);
}

void *__MCMPersonasAreSupported_block_invoke()
{
  kern_return_t multiuser_config_flags;
  int v3;
  int v4;
  int is_system_session;
  int v6;
  int v7;
  BOOL v8;
  int v9;
  BOOL v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  const char *v14;
  const char *v15;
  const char *v16;
  const char *v17;
  pid_t v18;
  uid_t v19;
  pid_t v20;
  uid_t v21;
  au_asid_t v22;
  const char *v24;
  const char *v25;
  const char *v26;
  void *__s;
  audit_token_t multiuser_flags;
  __int16 v29;
  const char *v30;
  __int16 v31;
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  const char *v38;
  __int16 v39;
  pid_t v40;
  __int16 v41;
  uid_t v42;
  __int16 v43;
  pid_t v44;
  __int16 v45;
  uid_t v46;
  __int16 v47;
  au_asid_t v48;
  __int16 v49;
  void *v50;
  audit_token_t v51;
  uint64_t v52;

  id v52 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = objc_opt_class();
  multiuser_flags.val[0] = 0;
  host_t v1 = MEMORY[0x1D9478CB0]();
  multiuser_config_flags = host_get_multiuser_config_flags(v1, multiuser_flags.val);
  uint64_t v3 = multiuser_flags.val[0];
  uint64_t v4 = os_variant_uses_ephemeral_storage();
  is_system_session = xpc_is_system_session();
  id v6 = MGGetBoolAnswer();
  id v7 = v6;
  if (multiuser_config_flags) {
    id v8 = 0;
  }
  else {
    id v8 = v3 < 0;
  }
  uint64_t v9 = !v8;
  uint64_t v10 = !v8 && v0 != 0;
  MCMPersonasAreSupported_staticPersonasSupported = v10 & ~(_BYTE)v4 & ~(_BYTE)v6 & (is_system_session ^ 1);
  memset(&v51, 0, sizeof(v51));
  container_codesign_get_self_audit_token();
  __s = 0;
  vproc_swap_string();
  uint64_t v11 = container_log_handle_for_category();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (MCMPersonasAreSupported_staticPersonasSupported) {
      uint64_t v12 = "YES";
    }
    else {
      uint64_t v12 = "NO";
    }
    uint64_t v13 = "!hasUserManager ";
    if (v0) {
      uint64_t v13 = "";
    }
    id v25 = v13;
    stat v26 = v12;
    if (v9) {
      uint64_t v14 = "";
    }
    else {
      uint64_t v14 = "configuredForMultiUser ";
    }
    if (v7) {
      uint64_t v15 = "inDiagnosticsMode ";
    }
    else {
      uint64_t v15 = "";
    }
    if (v4) {
      uint64_t v16 = "usesEphemeralStorage ";
    }
    else {
      uint64_t v16 = "";
    }
    uint64_t v17 = "isSystemSession";
    if (!is_system_session) {
      uint64_t v17 = "";
    }
    __int16 v24 = v17;
    char v18 = getpid();
    int v19 = getuid();
    multiuser_flags = v51;
    uint64_t v20 = audit_token_to_pid(&multiuser_flags);
    multiuser_flags = v51;
    id v21 = audit_token_to_auid(&multiuser_flags);
    multiuser_flags = v51;
    __int16 v22 = audit_token_to_asid(&multiuser_flags);
    multiuser_flags.val[0] = 136318466;
    *(void *)&multiuser_flags.val[1] = v26;
    LOWORD(multiuser_flags.val[3]) = 2080;
    *(void *)((char *)&multiuser_flags.val[3] + 2) = v25;
    HIWORD(multiuser_flags.val[5]) = 2080;
    *(void *)&multiuser_flags.val[6] = v14;
    int v29 = 2080;
    uint64_t v30 = v15;
    int v31 = 2080;
    int v32 = v16;
    uint64_t v33 = 2080;
    char v34 = "";
    id v35 = 2080;
    int v36 = "";
    char v37 = 2080;
    os_signpost_id_t v38 = v24;
    id v39 = 1024;
    int v40 = v18;
    id v41 = 1024;
    id v42 = v19;
    uint64_t v43 = 1024;
    char v44 = v20;
    id v45 = 1024;
    id v46 = v21;
    id v47 = 1024;
    id v48 = v22;
    stat v49 = 2082;
    uint64_t v50 = __s;
    _os_log_impl(&dword_1D7739000, v11, OS_LOG_TYPE_DEFAULT, "Personas are supported (static): %s (%s%s%s%s%s%s%s) {pid: %d, uid: %d, apid: %d, auid: %d, asid: %d, session: %{public}s}", (uint8_t *)&multiuser_flags, 0x7Au);
  }

  return __s;
}

uint64_t __MCMRequirePersona_block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  MCMRequirePersona_uint64_t result = result;
  return result;
}

uint64_t __MCMRequirePersonaAndConvertSystemToPersonal_block_invoke()
{
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_14);
  }
  if (MCMRequirePersona_result) {
    uint64_t result = _os_feature_enabled_impl();
  }
  else {
    uint64_t result = 0;
  }
  MCMRequirePersonaAndConvertSystemToPersonal_uint64_t result = result;
  return result;
}

uint64_t __MCMRequirePersonaTelemetryOnly_block_invoke()
{
  if (MCMRequirePersona_onceToken != -1) {
    dispatch_once(&MCMRequirePersona_onceToken, &__block_literal_global_14);
  }
  if (MCMRequirePersona_result) {
    uint64_t result = _os_feature_enabled_impl();
  }
  else {
    uint64_t result = 0;
  }
  MCMRequirePersonaTelemetryOnly_uint64_t result = result;
  return result;
}

void __MCMProcessXPCEvent_block_invoke(uint64_t a1)
{
  id v5 = (id)objc_opt_new();
  id v2 = objc_opt_new();
  uint64_t v3 = [[MCMClientFactory alloc] initWithUserIdentityCache:*(void *)(a1 + 32) clientCodeSignInfoCache:v5 clientIdentityCache:v2];
  uint64_t v4 = (void *)MCMProcessXPCEvent_clientFactory;
  MCMProcessXPCEvent_clientFactory = (uint64_t)v3;
}

void sub_1D77D80DC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D77DCEE8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10782(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10783(uint64_t a1)
{
  host_t v1 = *(void **)(a1 + 40);
}

void sub_1D77DE9D4(_Unwind_Exception *exception_object)
{
}

void sub_1D77DEA9C(_Unwind_Exception *exception_object)
{
}

void sub_1D77E1AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77E5C9C(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, long long buf)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v14 = objc_begin_catch(a1);
      [[MCMError alloc] initWithErrorType:40];

      uint64_t v15 = container_log_handle_for_category();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        char v18 = [v14 callStackSymbols];
        LODWORD(buf) = 138412546;
        *(void *)((char *)&buf + 4) = v14;
        WORD6(buf) = 2112;
        *(void *)((char *)&buf + 14) = v18;
        _os_log_error_impl(&dword_1D7739000, v15, OS_LOG_TYPE_ERROR, "Got exception: %@ : %@", (uint8_t *)&buf, 0x16u);
      }
      id v16 = containermanager_copy_global_configuration();
      int v17 = [v16 isInternalImage];

      if (v17) {
        MCMCrashOnException(v14);
      }

      objc_end_catch();
    }
    else
    {
      objc_begin_catch(a1);
    }
    JUMPOUT(0x1D77E5B60);
  }
  _Unwind_Resume(a1);
}

void sub_1D77E5DF8(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1D77E5E1CLL);
  }
  JUMPOUT(0x1D77E5E34);
}

void sub_1D77E6F1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11440(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11441(uint64_t a1)
{
  host_t v1 = *(void **)(a1 + 40);
}

uint64_t RunningBoardServicesLibraryCore()
{
  if (!RunningBoardServicesLibraryCore_frameworkLibrary) {
    RunningBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return RunningBoardServicesLibraryCore_frameworkLibrary;
}

uint64_t __RunningBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  RunningBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_1D77E81BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRBSProcessPredicateClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSProcessPredicate");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    abort_report_np();
  }
  getRBSProcessPredicateClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRBSTerminateContextClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSTerminateContext");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    abort_report_np();
  }
  getRBSTerminateContextClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getRBSTerminationAssertionClass_block_invoke(uint64_t a1)
{
  RunningBoardServicesLibrary();
  Class result = objc_getClass("RBSTerminationAssertion");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    abort_report_np();
  }
  getRBSTerminationAssertionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void RunningBoardServicesLibrary()
{
  if (!RunningBoardServicesLibraryCore())
  {
    uint64_t v0 = (void *)abort_report_np();
    free(v0);
  }
}

void sub_1D77ED14C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id (*a20)(uint64_t a1),void *a21,id a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id (*a32)(uint64_t a1),void *a33,void *a34)
{
  if (a2)
  {
    int v36 = v35;
    if (a2 == 2)
    {
      id v37 = objc_begin_catch(exception_object);
      a30 = MEMORY[0x1E4F143A8];
      a31 = 3221225472;
      a32 = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_235;
      a33 = &unk_1E6A80A30;
      id v38 = v37;
      a34 = v38;
      uint64_t v39 = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_235((uint64_t)&a30);

      id v40 = containermanager_copy_global_configuration();
      int v41 = [v40 isInternalImage];

      if (v41) {
        MCMCrashOnException(v38);
      }

      objc_end_catch();
      int v36 = (void *)v39;
    }
    else
    {
      objc_begin_catch(exception_object);
    }
    a23 = v36;
    char v42 = [v34 _sqliteExec:@"ROLLBACK;" error:&a23];
    id v43 = a23;

    if ((v42 & 1) == 0)
    {
      a18 = MEMORY[0x1E4F143A8];
      a19 = 3221225472;
      a20 = __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_241;
      a21 = &unk_1E6A80A30;
      a22 = v43;
      __70__MCMSQLiteDB_invalidateCodeSigningForIdentifierAndAllChildren_error___block_invoke_241((uint64_t)&a18);
      objc_claimAutoreleasedReturnValue();
      JUMPOUT(0x1D77ED0ACLL);
    }
    JUMPOUT(0x1D77ED0B8);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D77EE95C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id (*a24)(uint64_t a1),void *a25,void *a26)
{
  if (a2)
  {
    if (a2 == 2)
    {
      id v27 = objc_begin_catch(exception_object);
      a22 = MEMORY[0x1E4F143A8];
      a23 = 3221225472;
      a24 = __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_186;
      a25 = &unk_1E6A80A30;
      id v28 = v27;
      a26 = v28;
      __56__MCMSQLiteDB_addCodeSigningEntry_withIdentifier_error___block_invoke_186((uint64_t)&a22);
      objc_claimAutoreleasedReturnValue();

      id v29 = containermanager_copy_global_configuration();
      int v30 = [v29 isInternalImage];

      if (v30) {
        MCMCrashOnException(v28);
      }

      objc_end_catch();
    }
    else
    {
      objc_begin_catch(exception_object);
    }
    JUMPOUT(0x1D77EE848);
  }
  _Unwind_Resume(exception_object);
}

void sub_1D77F5A74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 184), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11811(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11812(uint64_t a1)
{
  host_t v1 = *(void **)(a1 + 40);
}

void sub_1D77F8F50(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D77FB7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77FCF88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12355(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12356(uint64_t a1)
{
  host_t v1 = *(void **)(a1 + 40);
}

void sub_1D77FD3B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D77FD6A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v10 - 88), 8);
  _Unwind_Resume(a1);
}

void __MCMRunTransactionalTask_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  JUMPOUT(0x1D9479920);
}

void __MCMRunTransactionalTaskWithDelay_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();

  JUMPOUT(0x1D9479920);
}

void MCMCrashOnException(void *a1)
{
  id v1 = a1;
  id v2 = [MEMORY[0x1E4F29060] currentThread];
  uint64_t v3 = [v2 name];

  uint64_t v4 = (void *)[objc_allocWithZone(MEMORY[0x1E4F28E78]) initWithString:@"** INTERNAL ERROR: Uncaught Exception **\n"];
  [v4 appendString:@"Exception: "];
  if (v3)
  {
    [v4 appendString:@"<"];
    [v4 appendString:v3];
    [v4 appendString:@"> "];
  }
  id v5 = [v1 name];

  if (v5)
  {
    id v6 = [v1 name];
    [v4 appendString:v6];

    [v4 appendString:@": "];
  }
  id v7 = [v1 reason];

  if (v7)
  {
    id v8 = [v1 reason];
    [v4 appendString:v8];
  }
  [v4 appendString:@"\nStack:\n"];
  uint64_t v9 = [v1 callStackSymbols];
  uint64_t v10 = [v9 componentsJoinedByString:@"\n"];
  [v4 appendString:v10];

  if (MCMCrashOnException_onceToken != -1) {
    dispatch_once(&MCMCrashOnException_onceToken, &__block_literal_global_12609);
  }
  pthread_mutex_lock(&MCMCrashOnException_crashLock);
  if (v4) {
    qword_1EA8411E0 = (uint64_t)strdup((const char *)[v4 UTF8String]);
  }
  abort();
}

uint64_t __MCMCrashOnException_block_invoke()
{
  return pthread_mutex_init(&MCMCrashOnException_crashLock, 0);
}

void sub_1D77FF008(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1D780393C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

uint64_t __Block_byref_object_copy__13157(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13158(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
}

uint64_t __Block_byref_object_copy__13729(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13730(uint64_t a1)
{
  id v1 = *(void **)(a1 + 40);
}

void (*container_manager_kern_server_routine(uint64_t a1))(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 322514900) {
    return _Xget_process_containers;
  }
  else {
    return 0;
  }
}

void sb_packbuff_free_cold_1(uint64_t *a1, uint64_t *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  uint64_t v3 = *a2;
  int v4 = 134218240;
  uint64_t v5 = v2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_error_impl(&dword_1D7739000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failed: vm_deallocate(%p, %zu)", (uint8_t *)&v4, 0x16u);
}

void sb_packbuff_unpack_item_cold_1()
{
  __assert_rtn("sb_packbuff_unpack_item", "packbuff.c", 369, "(bytes_to_advance % BYTE_ALIGNMENT) == 0");
}

void sb_packbuff_pack_item_cold_1()
{
  __assert_rtn("sb_packbuff_pack_item", "packbuff.c", 267, "extra_bytes_needed == 0");
}

void sb_packbuff_pack_item_cold_2()
{
  __assert_rtn("sb_packbuff_pack_item", "packbuff.c", 273, "additional_bytes != NULL");
}

uint64_t APFSContainerGetBootDevice()
{
  return MEMORY[0x1F4105370]();
}

uint64_t APFSVolumeRoleFind()
{
  return MEMORY[0x1F41053A0]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1F40C9770](data, *(void *)&len, md);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x1F40D70A8]();
  return result;
}

void CFRunLoopRun(void)
{
}

CFMutableDictionaryRef IOBSDNameMatching(mach_port_t mainPort, uint32_t options, const char *bsdName)
{
  return (CFMutableDictionaryRef)MEMORY[0x1F40E8680](*(void *)&mainPort, *(void *)&options, bsdName);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1F40E8F08](*(void *)&mainPort);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x1F40E8F38](*(void *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1F40E8F60](*(void *)&object);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1F40E9230](notifyPort, *(void *)&service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1F40E9250](*(void *)&mainPort, matching);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1F417CE00]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1F412F980]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1F40E7280](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1F40E72B0](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1F40D8D10]();
}

uint64_t _CFPrefsSetDirectModeEnabled()
{
  return MEMORY[0x1F40D9000]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1F40D9438]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1F40D9450]();
}

uint64_t _NSDefaultFileSystemEncoding()
{
  return MEMORY[0x1F40E7320]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x1F40C9B88]();
}

double __exp10(double a1)
{
  MEMORY[0x1F40C9B90](a1);
  return result;
}

uint64_t __xpc_connection_set_logging()
{
  return MEMORY[0x1F40C9D38]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1F40C9FA0]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1F40C9FA8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1F40C9FB0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1F40C9FF8]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1F415B160]();
}

uint64_t _sqlite3_db_copy_compact()
{
  return MEMORY[0x1F4181F38]();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return MEMORY[0x1F40CA1E8]();
}

uint64_t abort_with_reason()
{
  return MEMORY[0x1F40CA1F8]();
}

int acl_add_flag_np(acl_flagset_t flagset_d, acl_flag_t flag)
{
  return MEMORY[0x1F40CA220](flagset_d, *(void *)&flag);
}

int acl_add_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1F40CA228](permset_d, *(void *)&perm);
}

int acl_create_entry(acl_t *acl_p, acl_entry_t *entry_p)
{
  return MEMORY[0x1F40CA250](acl_p, entry_p);
}

int acl_delete_perm(acl_permset_t permset_d, acl_perm_t perm)
{
  return MEMORY[0x1F40CA260](permset_d, *(void *)&perm);
}

int acl_free(void *obj_p)
{
  return MEMORY[0x1F40CA270](obj_p);
}

int acl_get_entry(acl_t acl, int entry_id, acl_entry_t *entry_p)
{
  return MEMORY[0x1F40CA280](acl, *(void *)&entry_id, entry_p);
}

acl_t acl_get_file(const char *path_p, acl_type_t type)
{
  return (acl_t)MEMORY[0x1F40CA298](path_p, *(void *)&type);
}

int acl_get_flagset_np(void *obj_p, acl_flagset_t *flagset_p)
{
  return MEMORY[0x1F40CA2A0](obj_p, flagset_p);
}

int acl_get_permset(acl_entry_t entry_d, acl_permset_t *permset_p)
{
  return MEMORY[0x1F40CA2B8](entry_d, permset_p);
}

int acl_get_tag_type(acl_entry_t entry_d, acl_tag_t *tag_type_p)
{
  return MEMORY[0x1F40CA2C8](entry_d, tag_type_p);
}

acl_t acl_init(int count)
{
  return (acl_t)MEMORY[0x1F40CA2D0](*(void *)&count);
}

int acl_set_file(const char *path_p, acl_type_t type, acl_t acl)
{
  return MEMORY[0x1F40CA2E8](path_p, *(void *)&type, acl);
}

int acl_set_flagset_np(void *obj_p, acl_flagset_t flagset_d)
{
  return MEMORY[0x1F40CA2F0](obj_p, flagset_d);
}

int acl_set_permset(acl_entry_t entry_d, acl_permset_t permset_d)
{
  return MEMORY[0x1F40CA300](entry_d, permset_d);
}

int acl_set_qualifier(acl_entry_t entry_d, const void *tag_qualifier_p)
{
  return MEMORY[0x1F40CA310](entry_d, tag_qualifier_p);
}

int acl_set_tag_type(acl_entry_t entry_d, acl_tag_t tag_type)
{
  return MEMORY[0x1F40CA318](entry_d, *(void *)&tag_type);
}

uint64_t amfi_launch_constraint_matches_process()
{
  return MEMORY[0x1F40CA3A0]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1F40CA440](a1, a2);
}

uint64_t atol(const char *a1)
{
  return MEMORY[0x1F40CA4B8](a1);
}

au_asid_t audit_token_to_asid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2B8](atoken);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

uid_t audit_token_to_auid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2C8](atoken);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1F417E2E8](atoken);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1F40CA538](*(void *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CB3A8](a1, *(void *)&a2, *(void *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1F40CB3F8](*(void *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1F40CB400](a1);
}

uint64_t container_audit_token_copy_codesign_hash()
{
  return MEMORY[0x1F40CB450]();
}

uint64_t container_audit_token_copy_codesign_identifier()
{
  return MEMORY[0x1F40CB458]();
}

uint64_t container_audit_token_copy_entitlement()
{
  return MEMORY[0x1F40CB460]();
}

uint64_t container_audit_token_get_codesign_status()
{
  return MEMORY[0x1F40CB468]();
}

uint64_t container_audit_token_get_euid()
{
  return MEMORY[0x1F40CB470]();
}

uint64_t container_audit_token_get_pid()
{
  return MEMORY[0x1F40CB478]();
}

uint64_t container_audit_token_get_platform()
{
  return MEMORY[0x1F40CB480]();
}

uint64_t container_class_for_each_normalized_class()
{
  return MEMORY[0x1F40CB488]();
}

uint64_t container_class_normalized()
{
  return MEMORY[0x1F40CB490]();
}

uint64_t container_class_supports_data_subdirectory()
{
  return MEMORY[0x1F40CB498]();
}

uint64_t container_class_supports_randomized_path()
{
  return MEMORY[0x1F40CB4A0]();
}

uint64_t container_client_copy_decoded_from_xpc_object()
{
  return MEMORY[0x1F40CB4A8]();
}

uint64_t container_client_copy_encoded_xpc_object()
{
  return MEMORY[0x1F40CB4B0]();
}

uint64_t container_client_copy_entitlement()
{
  return MEMORY[0x1F40CB4B8]();
}

uint64_t container_client_create_from_audit_token()
{
  return MEMORY[0x1F40CB4C0]();
}

uint64_t container_client_get_audit_token()
{
  return MEMORY[0x1F40CB4C8]();
}

uint64_t container_client_get_codesign_identifier()
{
  return MEMORY[0x1F40CB4D0]();
}

uint64_t container_client_get_codesign_team_identifier()
{
  return MEMORY[0x1F40CB4D8]();
}

uint64_t container_client_get_euid()
{
  return MEMORY[0x1F40CB4E0]();
}

uint64_t container_client_get_persona_unique_string()
{
  return MEMORY[0x1F40CB4E8]();
}

uint64_t container_client_get_pid()
{
  return MEMORY[0x1F40CB4F0]();
}

uint64_t container_client_get_platform()
{
  return MEMORY[0x1F40CB4F8]();
}

uint64_t container_client_initializer()
{
  return MEMORY[0x1F40CB500]();
}

uint64_t container_client_is_alive()
{
  return MEMORY[0x1F40CB508]();
}

uint64_t container_client_is_sandboxed()
{
  return MEMORY[0x1F40CB510]();
}

uint64_t container_client_is_signed()
{
  return MEMORY[0x1F40CB518]();
}

uint64_t container_client_is_test_client()
{
  return MEMORY[0x1F40CB520]();
}

uint64_t container_codesign_copy_current_identifier()
{
  return MEMORY[0x1F40CB528]();
}

uint64_t container_codesign_get_self_audit_token()
{
  return MEMORY[0x1F40CB530]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x1F40CB5D0]();
}

uint64_t container_error_create()
{
  return MEMORY[0x1F40CB5D8]();
}

uint64_t container_error_free()
{
  return MEMORY[0x1F40CB5E0]();
}

uint64_t container_error_get_category()
{
  return MEMORY[0x1F40CB5E8]();
}

uint64_t container_error_get_path()
{
  return MEMORY[0x1F40CB5F0]();
}

uint64_t container_error_get_posix_errno()
{
  return MEMORY[0x1F40CB5F8]();
}

uint64_t container_error_get_type()
{
  return MEMORY[0x1F40CB600]();
}

uint64_t container_free_array_of_containers()
{
  return MEMORY[0x1F40CB608]();
}

uint64_t container_free_client()
{
  return MEMORY[0x1F40CB610]();
}

uint64_t container_free_object()
{
  return MEMORY[0x1F40CB618]();
}

uint64_t container_frozenset_create()
{
  return MEMORY[0x1F40CB620]();
}

uint64_t container_frozenset_destroy()
{
  return MEMORY[0x1F40CB628]();
}

uint64_t container_get_class()
{
  return MEMORY[0x1F40CB630]();
}

uint64_t container_get_error_description()
{
  return MEMORY[0x1F40CB638]();
}

uint64_t container_get_identifier()
{
  return MEMORY[0x1F40CB640]();
}

uint64_t container_get_persona_unique_string()
{
  return MEMORY[0x1F40CB658]();
}

uint64_t container_get_uid()
{
  return MEMORY[0x1F40CB660]();
}

uint64_t container_get_unique_path_component()
{
  return MEMORY[0x1F40CB668]();
}

uint64_t container_internal_get_first_boot_uuid()
{
  return MEMORY[0x1F40CB678]();
}

uint64_t container_is_new()
{
  return MEMORY[0x1F40CB690]();
}

uint64_t container_is_transient()
{
  return MEMORY[0x1F40CB698]();
}

uint64_t container_log_handle_for_category()
{
  return MEMORY[0x1F40CB6A0]();
}

uint64_t container_log_replication_enable_to_uid_relative_path()
{
  return MEMORY[0x1F40CB6B0]();
}

uint64_t container_log_replication_prune_for_uid()
{
  return MEMORY[0x1F40CB6B8]();
}

uint64_t container_object_create()
{
  return MEMORY[0x1F40CB6C0]();
}

uint64_t container_object_get_info()
{
  return MEMORY[0x1F40CB6C8]();
}

uint64_t container_object_get_path()
{
  return MEMORY[0x1F40CB6D0]();
}

uint64_t container_object_get_uuid()
{
  return MEMORY[0x1F40CB6D8]();
}

uint64_t container_object_set_creator_codesign_identifier()
{
  return MEMORY[0x1F40CB6E0]();
}

uint64_t container_object_set_path()
{
  return MEMORY[0x1F40CB6E8]();
}

uint64_t container_object_set_user_managed_assets_relative_path()
{
  return MEMORY[0x1F40CB6F0]();
}

uint64_t container_paths_copy_container_from_path()
{
  return MEMORY[0x1F40CB708]();
}

uint64_t container_perform_with_client_context()
{
  return MEMORY[0x1F40CB710]();
}

uint64_t container_query_count_results()
{
  return MEMORY[0x1F40CB718]();
}

uint64_t container_query_create()
{
  return MEMORY[0x1F40CB720]();
}

uint64_t container_query_free()
{
  return MEMORY[0x1F40CB730]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x1F40CB738]();
}

uint64_t container_query_iterate_results_sync()
{
  return MEMORY[0x1F40CB748]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x1F40CB750]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x1F40CB760]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x1F40CB770]();
}

uint64_t container_query_set_include_other_owners()
{
  return MEMORY[0x1F40CB778]();
}

uint64_t container_realpath()
{
  return MEMORY[0x1F40CB798]();
}

uint64_t container_sandbox_issue_custom_extension()
{
  return MEMORY[0x1F40CB7B8]();
}

uint64_t container_seam_fs_ensure_lazy_loaded()
{
  return MEMORY[0x1F40CB7C0]();
}

uint64_t container_set_info_value()
{
  return MEMORY[0x1F40CB7E8]();
}

uint64_t container_traverse_directory()
{
  return MEMORY[0x1F40CB808]();
}

uint64_t container_traverse_node_get_name()
{
  return MEMORY[0x1F40CB810]();
}

uint64_t container_traverse_node_get_optional_dp_class()
{
  return MEMORY[0x1F40CB818]();
}

uint64_t container_traverse_node_get_optional_parent_fd()
{
  return MEMORY[0x1F40CB820]();
}

uint64_t container_traverse_node_get_path()
{
  return MEMORY[0x1F40CB828]();
}

uint64_t container_traverse_node_is_directory()
{
  return MEMORY[0x1F40CB830]();
}

uint64_t container_xpc_decode_container_object()
{
  return MEMORY[0x1F40CB840]();
}

uint64_t container_xpc_decode_create_container_object_array()
{
  return MEMORY[0x1F40CB848]();
}

uint64_t container_xpc_encode_container_as_object()
{
  return MEMORY[0x1F40CB850]();
}

uint64_t container_xpc_encode_container_metadata_as_object()
{
  return MEMORY[0x1F40CB858]();
}

uint64_t container_xpc_encode_container_object()
{
  return MEMORY[0x1F40CB860]();
}

uint64_t container_xpc_encode_error()
{
  return MEMORY[0x1F40CB868]();
}

uint64_t container_xpc_send_sync_message()
{
  return MEMORY[0x1F40CB870]();
}

uint64_t container_xpc_set_use_shared_connection()
{
  return MEMORY[0x1F40CB878]();
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return MEMORY[0x1F40CB880](from, to, state, *(void *)&flags);
}

int dirfd(DIR *dirp)
{
  return MEMORY[0x1F40CB900](dirp);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1F40CB9C0](flags, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1F40CBA10](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1F40CBA60](identifier, flags);
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1F40CBB40]();
}

uint64_t dispatch_mach_create()
{
  return MEMORY[0x1F40CBB48]();
}

uint64_t dispatch_mach_mig_demux()
{
  return MEMORY[0x1F40CBB58]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1F40CBB68]();
}

void dispatch_main(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBA8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1F40CBBB8](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBC0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1F40CBBD0](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1F40CBC30](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1F40CBC40](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1F40CBC50](dsema, timeout);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1F40CBC98](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_suspend(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1F40CBD30](when, delta);
}

dispatch_workloop_t dispatch_workloop_create(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1F40CBD50](label);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x1F40CBE10]();
}

void exit(int a1)
{
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1F40CC058](*(void *)&a1, *(void *)&a2);
}

char *__cdecl fflagstostr(unint64_t a1)
{
  return (char *)MEMORY[0x1F40CC0C0](a1);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1F40CC1D8](a1, a2);
}

void free(void *a1)
{
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1F40CC2B8](*(void *)&a1, a2);
}

int fts_close(FTS *a1)
{
  return MEMORY[0x1F40CC2F8](a1);
}

FTS *__cdecl fts_open(char *const *a1, int a2, int (__cdecl *a3)(const FTSENT **, const FTSENT **))
{
  return (FTS *)MEMORY[0x1F40CC300](a1, *(void *)&a2, a3);
}

FTSENT *__cdecl fts_read(FTS *a1)
{
  return (FTSENT *)MEMORY[0x1F40CC308](a1);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1F40CC360](a1, a2, a3, a4, *(void *)&a5);
}

gid_t getegid(void)
{
  return MEMORY[0x1F40CC3A8]();
}

uid_t geteuid(void)
{
  return MEMORY[0x1F40CC3B8]();
}

int getopt_long_only(int a1, char *const *a2, const char *a3, const option *a4, int *a5)
{
  return MEMORY[0x1F40CC478](*(void *)&a1, a2, a3, a4, a5);
}

pid_t getpid(void)
{
  return MEMORY[0x1F40CC4A0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1F40CC4C0]();
}

int getpwnam_r(const char *a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1F40CC4E0](a1, a2, a3, a4, a5);
}

int getpwuid_r(uid_t a1, passwd *a2, char *a3, size_t a4, passwd **a5)
{
  return MEMORY[0x1F40CC4F0](*(void *)&a1, a2, a3, a4, a5);
}

uid_t getuid(void)
{
  return MEMORY[0x1F40CC570]();
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return MEMORY[0x1F40CC600](*(void *)&host, multiuser_flags);
}

uint64_t kpersona_info()
{
  return MEMORY[0x1F40CC740]();
}

int lchflags(const char *a1, __uint32_t a2)
{
  return MEMORY[0x1F40CC7E8](a1, *(void *)&a2);
}

int lchmod(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CC7F0](a1, a2);
}

int lchown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1F40CC7F8](a1, *(void *)&a2, *(void *)&a3);
}

long double log10(long double __x)
{
  MEMORY[0x1F40CC880](__x);
  return result;
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CC900](a1, a2);
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1F40CC940](*(void *)&error_value);
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1F40CC950]();
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_vm_allocate(vm_map_t target, mach_vm_address_t *address, mach_vm_size_t size, int flags)
{
  return MEMORY[0x1F40CCA68](*(void *)&target, address, size, *(void *)&flags);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCB90](count, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1F40CCBA8](ptr, size, type_id);
}

int mbr_identifier_to_uuid(int id_type, const void *identifier, size_t identifier_size, uuid_t uu)
{
  return MEMORY[0x1F40CCC78](*(void *)&id_type, identifier, identifier_size, uu);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1F40CCCF0](__dst, __src, __n);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1F40CCD18]();
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1F40CCD40](__s, __smax, *(void *)&__c, __n);
}

void mig_deallocate(vm_address_t a1, vm_size_t a2)
{
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1F40CCDD0](a1, a2);
}

char *__cdecl mkdtemp(char *a1)
{
  return (char *)MEMORY[0x1F40CCDE0](a1);
}

int mkpath_np(const char *path, mode_t omode)
{
  return MEMORY[0x1F40CCE00](path, omode);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1F40CD050](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1F40CD060](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1F4181638](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1F4181640](a1);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1F4181680](exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1F4181728](name);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1F41817C0]();
}

uint64_t self
{
  return MEMORY[0x1F41817D0]();
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F41818C8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1F41818D0](a1);
}

objc_exception_preprocessor objc_setExceptionPreprocessor(objc_exception_preprocessor fn)
{
  return (objc_exception_preprocessor)MEMORY[0x1F41819C0](fn);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1F4181A18](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1F4181A28](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1F4181A30](obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1F4181A40](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1F40CD0E0](a1, *(void *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1F40CD120](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1F40CD3B8](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1F40CD550](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1F40CD560](log, ptr);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1F40CD5A0]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1F40CD5E8]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1F40CD648]();
}

uint64_t os_variant_uses_ephemeral_storage()
{
  return MEMORY[0x1F40CD670]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1F40CD838](a1);
}

const char *__cdecl property_getAttributes(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AC8](property);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1F4181AD0](property);
}

objc_property_t *__cdecl protocol_copyPropertyList2(Protocol *proto, unsigned int *outCount, BOOL isRequiredProperty, BOOL isInstanceProperty)
{
  return (objc_property_t *)MEMORY[0x1F4181AF8](proto, outCount, isRequiredProperty, isInstanceProperty);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1F40CDA80](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1F40CDA88](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1F40CDBB8](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1F40CDC50](*(void *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1F40CDC60](a1);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1F40CDC70](a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1F40CDC88](__ptr, __size);
}

int removefile(const char *path, removefile_state_t state, removefile_flags_t flags)
{
  return MEMORY[0x1F40CDD18](path, state, *(void *)&flags);
}

removefile_state_t removefile_state_alloc(void)
{
  return (removefile_state_t)MEMORY[0x1F40CDD20]();
}

int removefile_state_free(removefile_state_t a1)
{
  return MEMORY[0x1F40CDD28](a1);
}

int removefile_state_get(removefile_state_t state, uint32_t key, void *dst)
{
  return MEMORY[0x1F40CDD30](state, *(void *)&key, dst);
}

int removefile_state_set(removefile_state_t state, uint32_t key, const void *value)
{
  return MEMORY[0x1F40CDD38](state, *(void *)&key, value);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
}

char *__cdecl rindex(const char *a1, int a2)
{
  return (char *)MEMORY[0x1F40CDD88](a1, *(void *)&a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1F40CDDD0]();
}

uint64_t sandbox_container_path_for_audit_token()
{
  return MEMORY[0x1F40CDDE0]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1F40CDDF8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1F40CDE50]();
}

uint64_t sandbox_set_container_path_for_audit_token()
{
  return MEMORY[0x1F40CDE80]();
}

uint64_t sandbox_set_user_state_item_with_persona()
{
  return MEMORY[0x1F4181EA8]();
}

uint64_t sandbox_user_state_iterate_items()
{
  return MEMORY[0x1F4181EB0]();
}

int setiopolicy_np(int a1, int a2, int a3)
{
  return MEMORY[0x1F40CDF78](*(void *)&a1, *(void *)&a2, *(void *)&a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1F40CE080](__str, __size, __format);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181F98](a1, *(void *)&a2, a3, a4, a5);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1F4181FB0](a1, *(void *)&a2, *(void *)&a3);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1F4181FE8](a1, *(void *)&a2, a3, *(void *)&a4, a5);
}

int sqlite3_changes(sqlite3 *a1)
{
  return MEMORY[0x1F4182050](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1F4182060](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1F4182070](a1, *(void *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F4182078](a1, *(void *)&iCol);
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1F41820A0](a1, *(void *)&iCol);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1F41820C8](a1, *(void *)&iCol);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1F4182198](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1F41821A8](a1, sql, callback, a4, errmsg);
}

int sqlite3_extended_errcode(sqlite3 *db)
{
  return MEMORY[0x1F41821C0](db);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1F41821D8](pStmt);
}

void sqlite3_free(void *a1)
{
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1F4182280](filename, ppDb, *(void *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1F4182290](db, zSql, *(void *)&nByte, ppStmt, pzTail);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1F41823B0](a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1F40CE110](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1F40CE118](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1F40CE158](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1F40CE178](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1F40CE188](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1F40CE1C8](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1F40CE1F0](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1F40CE200](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1F40CE208](__s1, __n);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1F40CE210](__big, __little, __len);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1F40CE258](__s1, __s2);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1F40CE2F0](__str, __endptr, *(void *)&__base);
}

int symlink(const char *a1, const char *a2)
{
  return MEMORY[0x1F40CE360](a1, a2);
}

uint64_t sysconf(int a1)
{
  return MEMORY[0x1F40CE3B8](*(void *)&a1);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1F40CE3D0](a1, a2, a3, a4, a5);
}

int unlink(const char *a1)
{
  return MEMORY[0x1F40CE5E0](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1F40CE608](*(void *)&a1);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1F40CE6C0](*(void *)&target_task, address, size);
}

kern_return_t vm_read(vm_map_read_t target_task, vm_address_t address, vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return MEMORY[0x1F40CE6E8](*(void *)&target_task, address, size, data, dataCnt);
}

uint64_t voucher_get_current_persona()
{
  return MEMORY[0x1F40CE728]();
}

uint64_t voucher_get_current_persona_originator_info()
{
  return MEMORY[0x1F40CE730]();
}

uint64_t voucher_get_current_persona_proximate_info()
{
  return MEMORY[0x1F40CE738]();
}

uint64_t vproc_swap_string()
{
  return MEMORY[0x1F40CE788]();
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1F40CEA18](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEA30](objects, count);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1F40CEBD0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1F40CED28](object);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1F40CEDA0](ddata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1F40CEE08](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1F40CEE20](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1F40CEE40](original);
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEE68](xdict, key);
}

uint64_t xpc_dictionary_get_audit_token()
{
  return MEMORY[0x1F40CEE78]();
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEE80](xdict, key);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEEA8](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEC8](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1F40CEEE0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1F40CEEF0](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1F40CEEF8](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x1F40CEF00](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1F40CEF10](xdict, key);
}

uint64_t xpc_dictionary_handoff_reply()
{
  return MEMORY[0x1F40CEF18]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
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

uint64_t xpc_is_system_session()
{
  return MEMORY[0x1F40CF1A8]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1F40CF208]();
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1F40CF290](string);
}

void xpc_transaction_begin(void)
{
}

void xpc_transaction_end(void)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return MEMORY[0x1F40CF2F0]();
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1F40CF330](xuint);
}