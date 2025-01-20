@interface NWAdvertiser
@end

@implementation NWAdvertiser

void __22___NWAdvertiser_start__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  WeakRetained = (void **)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = *((void *)WeakRetained[1] + 2);
    if (v6 && !nw_path_parameters_get_logging_disabled(*(void *)(v6 + 104)))
    {
      if (__nwlog_listener_log::onceToken != -1) {
        dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
      }
      v7 = (id)glistenerLogObj;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id_string = nw_listener_get_id_string(v5[1]);
        int v11 = 136446466;
        v12 = "-[_NWAdvertiser start]_block_invoke";
        __int16 v13 = 2082;
        v14 = id_string;
        _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_INFO, "%{public}s [%{public}s] Advertiser path update", (uint8_t *)&v11, 0x16u);
      }
    }
    id v9 = v3;
    nw_context_assert_queue(*((void **)v5[1] + 3));
    v10 = v5[1];
    if ((v10[32] - 1) <= 1 && (*((unsigned char *)v10 + 302) & 1) == 0)
    {
      -[_NWAdvertiser updateFlows:]((uint64_t)v5, v9);
      -[_NWAdvertiser reconcileChildren:]((uint64_t)v5, v9);
    }
  }
}

void __65___NWAdvertiser_handleBonjourUpdateFlags_error_name_type_domain___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 280), *(id *)(a1 + 40));
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 64));
  v2 = _Block_copy(*(const void **)(*(void *)(*(void *)(a1 + 32) + 8) + 120));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  id v5 = *(id *)(*(void *)(a1 + 32) + 40);
  BOOL v6 = -[NWConcrete_nw_parameters initWithParameters:stripConnected:shallowCopy:]((id *)[NWConcrete_nw_parameters alloc], v5, 0, 0);

  uint64_t v7 = *(void *)(*(void *)(a1 + 64) + 8);
  v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

void __65___NWAdvertiser_handleBonjourUpdateFlags_error_name_type_domain___block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __65___NWAdvertiser_handleBonjourUpdateFlags_error_name_type_domain___block_invoke_3;
  v3[3] = &unk_1E524A130;
  uint64_t v5 = *(void *)(a1 + 48);
  id v4 = *(id *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 56);
  nw_utilities_execute_block_as_persona_from_parameters(v2, v3);
}

uint64_t __65___NWAdvertiser_handleBonjourUpdateFlags_error_name_type_domain___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)
                                                           + 16))(*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

void __21___NWAdvertiser_stop__block_invoke(uint64_t a1)
{
}

void __21___NWAdvertiser_stop__block_invoke_2(void *a1)
{
  objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), *(id *)(*(void *)(a1[4] + 8) + 64));
  v2 = _Block_copy(*(const void **)(*(void *)(a1[4] + 8) + 120));
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void **)(*(void *)(a1[4] + 8) + 280);
  char v6 = (id *)(*(void *)(a1[7] + 8) + 40);

  objc_storeStrong(v6, v5);
}

uint64_t __21___NWAdvertiser_stop__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) + 16))();
}

uint64_t __29___NWAdvertiser_updateFlows___block_invoke(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v5 = a3;
  char v6 = nw_path_copy_flow_for_registration(*(NWConcrete_nw_path **)(a1 + 32), v5);
  if (v6)
  {
    char v7 = v6[186];

    if ((v7 & 4) != 0) {
      nw_dictionary_set_value(*(void *)(a1 + 40), a2, v5);
    }
  }

  return 1;
}

uint64_t __29___NWAdvertiser_updateFlows___block_invoke_2(uint64_t a1, const char *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 16);
  if (v6 && !nw_path_parameters_get_logging_disabled(*(void *)(v6 + 104)))
  {
    if (__nwlog_listener_log::onceToken != -1) {
      dispatch_once(&__nwlog_listener_log::onceToken, &__block_literal_global_40_44887);
    }
    char v7 = (id)glistenerLogObj;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      id_string = nw_listener_get_id_string(*(void **)(*(void *)(a1 + 32) + 8));
      int v10 = 136446722;
      int v11 = "-[_NWAdvertiser updateFlows:]_block_invoke_2";
      __int16 v12 = 2082;
      __int16 v13 = id_string;
      __int16 v14 = 2114;
      id v15 = v5;
      _os_log_impl(&dword_1830D4000, v7, OS_LOG_TYPE_DEBUG, "%{public}s [%{public}s] Removing defunct flow registration %{public}@", (uint8_t *)&v10, 0x20u);
    }
  }
  nw_path_flow_registration_close(v5);
  nw_dictionary_set_value(*(void *)(*(void *)(a1 + 32) + 56), a2, 0);

  return 1;
}

void __29___NWAdvertiser_updateFlows___block_invoke_8(uint64_t a1, unsigned __int8 *uu)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(out, 0, 37);
  uuid_unparse(uu, out);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 56);
  if (!v5) {
    goto LABEL_4;
  }
  flow_inner = nw_dictionary_copy_value(v5, (uint64_t)out);
  if (!flow_inner)
  {
    uint64_t v4 = *(void *)(a1 + 32);
LABEL_4:
    flow_inner = nw_path_evaluator_create_flow_inner(*(void **)(v4 + 32), 0, 0, 1, 0, uu, 0, 0, 0);
  }
  nw_dictionary_set_value(*(void *)(a1 + 40), out, flow_inner);
}

@end