@interface CLKDeviceHasNanoRegistryEntitlement
@end

@implementation CLKDeviceHasNanoRegistryEntitlement

void ___CLKDeviceHasNanoRegistryEntitlement_block_invoke()
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v0 = xpc_copy_entitlements_for_self();
  v1 = (void *)v0;
  if (v0 && MEMORY[0x21D4AB0E0](v0) == MEMORY[0x263EF8708])
  {
    uint64_t v14 = 0;
    v15 = &v14;
    uint64_t v16 = 0x3032000000;
    v17 = __Block_byref_object_copy__0;
    v18 = __Block_byref_object_dispose__0;
    id v19 = 0;
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2020000000;
    char v13 = 0;
    *(void *)&long long applier = MEMORY[0x263EF8330];
    *((void *)&applier + 1) = 3221225472;
    v21 = ___CLKDeviceEntitlementWithPrefix_block_invoke;
    v22 = &unk_26440E680;
    v23 = @"com.apple.nano.nanoregistry";
    v24 = &v10;
    v25 = &v14;
    xpc_dictionary_apply(v1, &applier);
    id v2 = (id) v15[5];
    BOOL v3 = *((unsigned char *)v11 + 24) != 0;

    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    id v2 = 0;
    BOOL v3 = 0;
  }

  id v4 = v2;
  _CLKDeviceHasNanoRegistryEntitlement_hasEntitlement = v3;
  v5 = CLKLoggingObjectForDomain(0);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      LODWORD(applier) = 138412290;
      *(void *)((char *)&applier + 4) = v4;
      v7 = "Has NanoRegistry entitlement %@";
      v8 = v5;
      uint32_t v9 = 12;
LABEL_10:
      _os_log_impl(&dword_21C599000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&applier, v9);
    }
  }
  else if (v6)
  {
    LOWORD(applier) = 0;
    v7 = "Doesn't have NanoRegistry entitlement";
    v8 = v5;
    uint32_t v9 = 2;
    goto LABEL_10;
  }
}

@end