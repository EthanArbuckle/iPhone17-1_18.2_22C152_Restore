@interface HUContainedServicesGridViewController
@end

@implementation HUContainedServicesGridViewController

id __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [MEMORY[0x1E4F1CA48] array];
  if (*(void *)(a1 + 32))
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F69558]) initWithHome:v3 serviceTypes:0];
    [v5 setValueSource:*(void *)(a1 + 40)];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_2;
    v28[3] = &unk_1E6385F78;
    id v29 = *(id *)(a1 + 32);
    [v5 setFilter:v28];
    [v4 addObject:v5];
    v6 = (void *)[objc_alloc(MEMORY[0x1E4F68E20]) initWithHome:v3];
    [v6 setValueSource:*(void *)(a1 + 40)];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_3;
    v25[3] = &unk_1E6385FA0;
    id v26 = *(id *)(a1 + 32);
    long long v27 = *(_OWORD *)(a1 + 56);
    [v6 setFilter:v25];
    [v4 addObject:v6];
    v7 = (void *)[objc_alloc(MEMORY[0x1E4F69428]) initWithHome:v3];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_134;
    v23[3] = &unk_1E6385F78;
    id v24 = *(id *)(a1 + 32);
    [v7 setFilter:v23];
    [v4 addObject:v7];
    v8 = (void *)[objc_alloc(MEMORY[0x1E4F69630]) initWithHome:v3];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_2_136;
    v21[3] = &unk_1E6385F78;
    id v22 = *(id *)(a1 + 32);
    [v8 setFilter:v21];
    [v4 addObject:v8];
  }
  if (*(void *)(a1 + 48))
  {
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F69288]) initWithHome:v3 includeContainedProfiles:0];
    [v9 setValueSource:*(void *)(a1 + 40)];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_3_138;
    v18[3] = &unk_1E6385FA0;
    id v19 = *(id *)(a1 + 48);
    long long v20 = *(_OWORD *)(a1 + 56);
    [v9 setFilter:v18];
    [v4 addObject:v9];
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F69558]) initWithHome:v3 serviceTypes:0];
    [v10 setValueSource:*(void *)(a1 + 40)];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_345;
    v15[3] = &unk_1E6385FA0;
    uint64_t v17 = *(void *)(a1 + 64);
    long long v14 = *(_OWORD *)(a1 + 48);
    id v11 = (id)v14;
    long long v16 = v14;
    [v10 setFilter:v15];
    [v4 addObject:v10];
  }
  v12 = objc_msgSend(v4, "copy", v14);

  return v12;
}

uint64_t __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = objc_msgSend(*(id *)(a1 + 32), "hu_containedServices");
  uint64_t v8 = [v7 containsObject:v6];

  return v8;
}

uint64_t __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = objc_msgSend(*(id *)(a1 + 32), "hu_containedAccessories");
  if (![v7 containsObject:v6])
  {

    goto LABEL_10;
  }
  int v8 = objc_msgSend(v6, "hf_isHomePod");

  if (!v8)
  {
LABEL_10:
    id v11 = objc_msgSend(*(id *)(a1 + 32), "hu_containedAccessories");
    uint64_t v10 = [v11 containsObject:v6];

    goto LABEL_11;
  }
  v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    uint64_t v13 = *(void *)(a1 + 40);
    long long v14 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v15 = 138412802;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    v18 = v14;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_error_impl(&dword_1BE345000, v9, OS_LOG_TYPE_ERROR, "%@:%@ HomePod %@ reports itself as part of the service container, filtering out", (uint8_t *)&v15, 0x20u);
  }
  uint64_t v10 = 0;
LABEL_11:

  return v10;
}

uint64_t __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_134(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  v7 = objc_msgSend(*(id *)(a1 + 32), "hu_containedServices");
  int v8 = (void *)MEMORY[0x1E4F1CAD0];
  v9 = [v6 services];
  uint64_t v10 = [v8 setWithArray:v9];
  uint64_t v11 = [v7 intersectsSet:v10];

  return v11;
}

uint64_t __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_2_136(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass()) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  id v6 = v5;

  if (objc_msgSend(v6, "hf_isRemoteControl"))
  {
    v7 = objc_msgSend(*(id *)(a1 + 32), "hu_containedAccessories");
    int v8 = objc_msgSend(v6, "hf_owningBridgeAccessory");
    uint64_t v9 = [v7 containsObject:v8];
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_3_138(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([v3 conformsToProtocol:&unk_1F1AD86A8])
  {
    id v4 = v3;
    if ([v4 conformsToProtocol:&unk_1F1AD86A8]) {
      v5 = v4;
    }
    else {
      v5 = 0;
    }
    id v6 = v5;

    v7 = [*(id *)(a1 + 32) accessories];
    int v8 = objc_msgSend(v6, "hf_backingAccessory");
    if ([v7 containsObject:v8])
    {
      uint64_t v9 = [*(id *)(a1 + 32) accessories];
      if ([v9 count] == 1)
      {
        uint64_t v10 = objc_msgSend(v6, "hf_backingAccessory");
        int v11 = objc_msgSend(v10, "hf_isHomePod");

        if (v11)
        {
          v12 = HFLogForCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            uint64_t v16 = *(void *)(a1 + 40);
            __int16 v17 = NSStringFromSelector(*(SEL *)(a1 + 48));
            v18 = objc_msgSend(v6, "hf_backingAccessory");
            int v19 = 138412802;
            uint64_t v20 = v16;
            __int16 v21 = 2112;
            id v22 = v17;
            __int16 v23 = 2112;
            id v24 = v18;
            _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "%@:%@ HomePod %@ reports itself as part of the service container as a media item, filtering out", (uint8_t *)&v19, 0x20u);
          }
          uint64_t v13 = 0;
          goto LABEL_15;
        }
LABEL_14:
        long long v14 = [*(id *)(a1 + 32) mediaProfileContainers];
        uint64_t v13 = [v14 containsObject:v6];

LABEL_15:
        goto LABEL_16;
      }
    }
    goto LABEL_14;
  }
  uint64_t v13 = 0;
LABEL_16:

  return v13;
}

uint64_t __124__HUContainedServicesGridViewController_legacy_itemManagerWithServiceContainerItem_shouldGroupByRoom_mediaItem_valueSource___block_invoke_345(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v15 = *(void *)(a1 + 40);
    uint64_t v16 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v20 = 138412802;
    uint64_t v21 = v15;
    __int16 v22 = 2112;
    __int16 v23 = v16;
    __int16 v24 = 2112;
    id v25 = v3;
    _os_log_debug_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEBUG, "%@:%@: Filtering check for: %@", (uint8_t *)&v20, 0x20u);
  }
  objc_opt_class();
  id v5 = v3;
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = v5;
  uint64_t v9 = [*(id *)(a1 + 32) accessories];
  uint64_t v10 = [v8 accessory];
  if (![v9 containsObject:v10])
  {

    goto LABEL_12;
  }
  int v11 = [*(id *)(a1 + 32) isHomePodMediaSystem];

  if (!v11)
  {
LABEL_12:
    v12 = objc_msgSend(*(id *)(a1 + 32), "hu_containedServices");
    uint64_t v13 = [v12 containsObject:v7];
    goto LABEL_13;
  }
  v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    uint64_t v17 = *(void *)(a1 + 40);
    v18 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v19 = [v8 accessory];
    int v20 = 138412802;
    uint64_t v21 = v17;
    __int16 v22 = 2112;
    __int16 v23 = v18;
    __int16 v24 = 2112;
    id v25 = v19;
    _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "%@:%@ HomePod %@ has services but is part of a media group, filtering out", (uint8_t *)&v20, 0x20u);
  }
  uint64_t v13 = 0;
LABEL_13:

  return v13;
}

@end