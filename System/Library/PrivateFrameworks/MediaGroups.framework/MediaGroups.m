id MGLogForCategory(int a1)
{
  void *v2;
  uint64_t vars8;

  if (MGLogForCategory_onceToken != -1) {
    dispatch_once(&MGLogForCategory_onceToken, &__block_literal_global);
  }
  v2 = (void *)MGLogForCategory_oslog[a1];
  return v2;
}

void __MGLogForCategory_block_invoke()
{
  for (uint64_t i = 0; i != 4; ++i)
  {
    os_log_t v1 = os_log_create("com.apple.MediaGroups", MGLogForCategory_categories[i]);
    v2 = (void *)MGLogForCategory_oslog[i];
    MGLogForCategory_oslog[i] = (uint64_t)v1;
  }
}

void sub_222D70AC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
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

void sub_222D714E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222D719FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location,id a22)
{
  objc_destroyWeak(v25);
  objc_destroyWeak(v23);
  objc_destroyWeak(v24);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_222D71B90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_222D71E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222D72568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_222D7296C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222D72DBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222D741BC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_222D744B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_222D74724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_222D74854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void MGSetServiceXPCInterfacesOnConnection(void *a1, char a2)
{
  id v50 = a1;
  v44 = &unk_26D5B3188;
  uint64_t v2 = objc_msgSend(MEMORY[0x263F08D80], "interfaceWithProtocol:");
  v47 = (void *)MEMORY[0x263EFFA08];
  uint64_t v41 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  v42 = objc_msgSend(v47, "setWithObjects:", v41, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:");
  if (a2) {
    [v50 setRemoteObjectInterface:v2];
  }
  else {
    [v50 setExportedInterface:v2];
  }
  v48 = &unk_26D5B3338;

  v12 = [MEMORY[0x263F08D80] interfaceWithProtocol:v48];

  v13 = (void *)MEMORY[0x263EFFA08];
  uint64_t v45 = objc_opt_class();
  uint64_t v40 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v17 = objc_opt_class();
  uint64_t v18 = objc_opt_class();
  uint64_t v19 = objc_opt_class();
  uint64_t v20 = objc_opt_class();
  uint64_t v21 = objc_opt_class();
  v22 = objc_msgSend(v13, "setWithObjects:", v45, v40, v14, v15, v16, v17, v18, v19, v20, v21, objc_opt_class(), 0);

  [v12 setClasses:v22 forSelector:sel_createGroupWithType_name_members_completion_ argumentIndex:2 ofReply:0];
  [v12 setClasses:v22 forSelector:sel_createGroupWithType_name_members_completion_ argumentIndex:0 ofReply:1];
  v46 = (void *)MEMORY[0x263EFFA08];
  uint64_t v43 = objc_opt_class();
  uint64_t v23 = objc_opt_class();
  uint64_t v24 = objc_opt_class();
  uint64_t v25 = objc_opt_class();
  uint64_t v26 = objc_opt_class();
  uint64_t v27 = objc_opt_class();
  uint64_t v28 = objc_opt_class();
  uint64_t v29 = objc_opt_class();
  uint64_t v30 = objc_opt_class();
  v31 = objc_msgSend(v46, "setWithObjects:", v43, v23, v24, v25, v26, v27, v28, v29, v30, objc_opt_class(), 0);

  [v12 setClasses:v31 forSelector:sel_addMember_group_completion_ argumentIndex:0 ofReply:0];
  [v12 setClasses:v31 forSelector:sel_addMember_group_completion_ argumentIndex:1 ofReply:0];
  [v12 setClasses:v31 forSelector:sel_addMember_group_completion_ argumentIndex:0 ofReply:1];
  [v12 setClasses:v31 forSelector:sel_removeMember_group_completion_ argumentIndex:0 ofReply:0];
  [v12 setClasses:v31 forSelector:sel_removeMember_group_completion_ argumentIndex:1 ofReply:0];
  [v12 setClasses:v31 forSelector:sel_removeMember_group_completion_ argumentIndex:0 ofReply:1];
  [v12 setClasses:v31 forSelector:sel_deleteGroup_completion_ argumentIndex:1 ofReply:0];
  v32 = [MEMORY[0x263EFFA08] set];

  [v12 setClasses:v32 forSelector:sel_setName_group_completion_ argumentIndex:1 ofReply:0];
  v33 = (void *)MEMORY[0x263EFFA08];
  uint64_t v34 = objc_opt_class();
  v35 = objc_msgSend(v33, "setWithObjects:", v34, objc_opt_class(), 0);

  [v12 setClasses:v35 forSelector:sel_startQueryWithPredicate_completion_ argumentIndex:0 ofReply:0];
  v36 = (void *)MEMORY[0x263EFFA08];
  uint64_t v37 = objc_opt_class();
  uint64_t v38 = objc_opt_class();
  v39 = objc_msgSend(v36, "setWithObjects:", v37, v38, objc_opt_class(), 0);

  [v12 setClasses:v39 forSelector:sel_HomeKitAccessoryOfType_accessoryIdentifier_homeIdentifier_categoryType_name_properties_completion_ argumentIndex:5 ofReply:0];
  if (a2) {
    [v50 setExportedInterface:v12];
  }
  else {
    [v50 setRemoteObjectInterface:v12];
  }
}

MGGroupIdentifier *MGGroupIdentifierCopyApplyingHashing(void *a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 components];
  uint64_t v3 = [v2 scheme];
  int v4 = [v3 isEqualToString:@"mg-hk-entity"];

  if (!v4) {
    goto LABEL_15;
  }
  uint64_t v5 = _MGRelevantComponentsForGroupIdentifierComponents(v2);
  if (![v5 count])
  {

LABEL_15:
    uint64_t v18 = (MGGroupIdentifier *)[v1 copy];
    goto LABEL_16;
  }
  uint64_t v20 = v2;
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        if (objc_msgSend(@"msi", "isEqualToString:", v12, v20))
        {
          v13 = [v7 objectForKey:v12];
        }
        else
        {
          memset(&c, 0, sizeof(c));
          CC_SHA256_Init(&c);
          data[0] = 0;
          data[1] = 0;
          uint64_t v14 = [v7 objectForKey:v12];
          [v14 getUUIDBytes:data];

          CC_SHA256_Update(&c, data, 0x10u);
          CC_SHA256_Final(md, &c);
          v13 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:md];
        }
        uint64_t v15 = v13;
        uint64_t v16 = [v13 UUIDString];

        uint64_t v17 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:v12 value:v16];
        [v6 addObject:v17];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v9);
  }

  uint64_t v2 = (void *)[v20 copy];
  [v2 setQueryItems:v6];
  uint64_t v18 = [[MGGroupIdentifier alloc] initWithURLComponents:v2];

LABEL_16:
  return v18;
}

id _MGRelevantComponentsForGroupIdentifierComponents(void *a1)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v16 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v2 = [v1 scheme];
  int v3 = [v2 isEqualToString:@"mg-hk-entity"];

  if (v3)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v15 = v1;
    int v4 = [v1 queryItems];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          uint64_t v10 = [v9 name];
          if (([@"hi" isEqualToString:v10] & 1) != 0
            || ([@"zi" isEqualToString:v10] & 1) != 0
            || ([@"ri" isEqualToString:v10] & 1) != 0
            || ([@"ai" isEqualToString:v10] & 1) != 0
            || ([@"msi" isEqualToString:v10] & 1) != 0
            || [@"ht" isEqualToString:v10])
          {
            id v11 = objc_alloc(MEMORY[0x263F08C38]);
            uint64_t v12 = [v9 value];
            v13 = (void *)[v11 initWithUUIDString:v12];

            if (v13) {
              [v16 setObject:v13 forKey:v10];
            }
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    id v1 = v15;
  }

  return v16;
}

id MGHomeUniqueIdentifierForAccessory(void *a1)
{
  id v1 = [a1 home];
  uint64_t v2 = [v1 uniqueIdentifier];

  return v2;
}

id MGAccessoryCategoryTypeForAccessory(void *a1)
{
  id v1 = [a1 category];
  uint64_t v2 = [v1 categoryType];

  return v2;
}

id MGGroupIdentifierForAccessory(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  uint64_t v5 = [v4 uniqueIdentifier];
  uint64_t v6 = [v3 uniqueIdentifier];

  uint64_t v7 = MGAccessoryCategoryTypeForAccessory(v4);

  id v8 = v6;
  id v9 = v5;
  uint64_t v10 = _MGGroupIdentifierAccessoryPathForCategoryType(v7);
  id v11 = [v9 UUIDString];

  long long v18 = _MGGroupIdentifierHomeKitComponents(v10, v8, v12, v13, v14, v15, v16, v17, @"ai", (uint64_t)v11);

  return v18;
}

__CFString *_MGGroupIdentifierAccessoryPathForCategoryType(void *a1)
{
  id v1 = a1;
  if ([@"1D8FD40E-7CAE-4AD5-9973-977D18890DE2" isEqualToString:v1])
  {
    uint64_t v2 = @"com.apple.media-group.solo-HomePodAccessory";
  }
  else if ([@"F6D2A2AC-3A6E-4E6F-8196-678ABE909D8E" isEqualToString:v1])
  {
    uint64_t v2 = @"com.apple.media-group.solo-AppleTVAccessory";
  }
  else if ([@"C0F5EDC5-4003-464A-9E5D-0DB36677BC35" isEqualToString:v1])
  {
    uint64_t v2 = @"com.apple.media-group.solo-SpeakerAccessory";
  }
  else if ([@"BE15659C-3CE6-4FD0-B152-BCDB488446C6" isEqualToString:v1])
  {
    uint64_t v2 = @"com.apple.media-group.solo-AudioReceiverAccessory";
  }
  else
  {
    uint64_t v2 = @"com.apple.media-group.solo-Accessory";
  }

  return v2;
}

MGGroupIdentifier *_MGGroupIdentifierHomeKitComponents(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, uint64_t a10)
{
  id v11 = a1;
  id v12 = a2;
  id v13 = objc_alloc_init(MEMORY[0x263F08BA0]);
  [v13 setScheme:@"mg-hk-entity"];
  if (v11) {
    [v13 setPath:v11];
  }
  id v14 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v15 = objc_alloc(MEMORY[0x263F08BD0]);
  uint64_t v16 = [v12 UUIDString];
  uint64_t v17 = (void *)[v15 initWithName:@"hi" value:v16];
  [v14 addObject:v17];

  uint64_t v27 = (id *)&a10;
  id v18 = a9;
  if (v18)
  {
    do
    {
      long long v19 = v27;
      uint64_t v28 = v27 + 1;
      id v20 = *v19;
      if (!v20) {
        break;
      }
      uint64_t v21 = v20;
      if (([@"hi" isEqualToString:v18] & 1) == 0 && _NSIsNSString())
      {
        uint64_t v22 = (void *)[objc_alloc(MEMORY[0x263F08BD0]) initWithName:v18 value:v21];
        [v14 addObject:v22];
      }
      long long v23 = v28;
      uint64_t v27 = v28 + 1;
      id v24 = *v23;

      id v18 = v24;
    }
    while (v24);
  }
  [v13 setQueryItems:v14];
  long long v25 = [[MGGroupIdentifier alloc] initWithURLComponents:v13];

  return v25;
}

id MGAccessoryIdentifierForGroupIdentifier(void *a1)
{
  return _MGHomeKitIdentifierForGroupIdentifier(a1, @"ai");
}

id _MGHomeKitIdentifierForGroupIdentifier(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = [a1 components];
  uint64_t v5 = _MGRelevantComponentsForGroupIdentifierComponents(v4);
  uint64_t v6 = [v5 objectForKey:v3];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

id MGAccessoryFromHomeManagerForGroupIdentifier(void *a1, void *a2)
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [a2 components];
  uint64_t v5 = _MGRelevantComponentsForGroupIdentifierComponents(v4);
  uint64_t v6 = [v5 objectForKey:@"hi"];
  uint64_t v7 = [v5 objectForKey:@"ai"];
  id v8 = (void *)v7;
  id v9 = 0;
  if (v6 && v7)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v10 = [v3 homes];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v34 = v5;
      v35 = v4;
      uint64_t v13 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          uint64_t v16 = [v15 uniqueIdentifier];
          int v17 = [v16 isEqual:v6];

          if (v17)
          {
            long long v38 = 0u;
            long long v39 = 0u;
            long long v36 = 0u;
            long long v37 = 0u;
            id v18 = [v15 accessories];
            uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
            if (v19)
            {
              uint64_t v20 = v19;
              id v33 = v3;
              uint64_t v21 = *(void *)v37;
              while (2)
              {
                for (uint64_t j = 0; j != v20; ++j)
                {
                  if (*(void *)v37 != v21) {
                    objc_enumerationMutation(v18);
                  }
                  long long v23 = *(void **)(*((void *)&v36 + 1) + 8 * j);
                  id v24 = [v23 uniqueIdentifier];
                  int v25 = [v24 isEqual:v8];

                  if (v25)
                  {
                    uint64_t v26 = [v23 category];
                    uint64_t v27 = [v26 categoryType];

                    id v4 = v35;
                    uint64_t v28 = [v35 path];
                    v32 = v27;
                    uint64_t v29 = _MGGroupIdentifierAccessoryPathForCategoryType(v27);
                    int v30 = [v28 isEqualToString:v29];

                    if (v30) {
                      id v9 = v23;
                    }
                    else {
                      id v9 = 0;
                    }
                    id v3 = v33;
                    uint64_t v5 = v34;

                    goto LABEL_28;
                  }
                }
                uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v44 count:16];
                if (v20) {
                  continue;
                }
                break;
              }
              id v9 = 0;
              id v3 = v33;
            }
            else
            {
              id v9 = 0;
            }
            uint64_t v5 = v34;
            id v4 = v35;
LABEL_28:

            goto LABEL_29;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v40 objects:v45 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      id v9 = 0;
      uint64_t v5 = v34;
      id v4 = v35;
    }
    else
    {
      id v9 = 0;
    }
LABEL_29:
  }
  return v9;
}

id MGMemberIdentifiersForMediaSystem(void *a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = a2;
  id v5 = v3;
  id v6 = v4;
  id v7 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  id v8 = [v5 components];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:&v25 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = [*(id *)(*((void *)&v21 + 1) + 8 * i) mediaProfile];
        uint64_t v13 = [v12 accessory];

        if (v13)
        {
          uint64_t v14 = [v7 arrayByAddingObject:v13];

          id v7 = (id)v14;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:&v25 count:16];
    }
    while (v9);
  }

  uint64_t v25 = 0;
  uint64_t v26 = &v25;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__2;
  uint64_t v29 = __Block_byref_object_dispose__2;
  id v30 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __MGMemberIdentifiersForMediaSystem_block_invoke;
  v18[3] = &unk_26466EAD0;
  id v15 = v6;
  id v19 = v15;
  uint64_t v20 = &v25;
  [v7 enumerateObjectsUsingBlock:v18];
  id v16 = (id)v26[5];

  _Block_object_dispose(&v25, 8);
  return v16;
}

void sub_222D76650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

uint64_t __MGMemberIdentifiersForMediaSystem_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = MGGroupIdentifierForAccessory(a2, *(void **)(a1 + 32));
  if (v3)
  {
    uint64_t v4 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) arrayByAddingObject:v3];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;
  }
  return MEMORY[0x270F9A758]();
}

id MGMediaSystemFromHomeManagerForGroupIdentifier(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = [a2 components];
  uint64_t v5 = _MGRelevantComponentsForGroupIdentifierComponents(v4);
  id v6 = [v5 objectForKey:@"hi"];
  uint64_t v7 = [v5 objectForKey:@"msi"];
  id v8 = (void *)v7;
  id v9 = 0;
  if (v6 && v7)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    uint64_t v10 = [v3 homes];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v26 = v5;
      uint64_t v27 = v4;
      uint64_t v13 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v16 = [v15 uniqueIdentifier];
          int v17 = [v16 isEqual:v6];

          if (v17)
          {
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v18 = [v15 mediaSystems];
            id v9 = (id)[v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v9)
            {
              id v25 = v3;
              uint64_t v19 = *(void *)v29;
              while (2)
              {
                for (uint64_t j = 0; j != v9; uint64_t j = (char *)j + 1)
                {
                  if (*(void *)v29 != v19) {
                    objc_enumerationMutation(v18);
                  }
                  long long v21 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
                  long long v22 = [v21 uniqueIdentifier];
                  int v23 = [v22 isEqual:v8];

                  if (v23)
                  {
                    id v9 = v21;
                    goto LABEL_23;
                  }
                }
                id v9 = (id)[v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
                if (v9) {
                  continue;
                }
                break;
              }
LABEL_23:
              id v3 = v25;
            }

            goto LABEL_25;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      id v9 = 0;
LABEL_25:
      uint64_t v5 = v26;
      uint64_t v4 = v27;
    }
    else
    {
      id v9 = 0;
    }
  }
  return v9;
}

id MGMemberIdentifiersForRoomInHome(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2;
  id v16 = __Block_byref_object_dispose__2;
  id v17 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  uint64_t v5 = [v3 accessories];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __MGMemberIdentifiersForRoomInHome_block_invoke;
  v9[3] = &unk_26466EAD0;
  id v6 = v4;
  id v10 = v6;
  uint64_t v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_222D76AD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MGMemberIdentifiersForRoomInHome_block_invoke(uint64_t a1, void *a2)
{
  MGGroupIdentifierForAccessory(a2, *(void **)(a1 + 32));
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v9 components];
  id v4 = [v3 path];
  char v5 = [@"com.apple.media-group.solo-Accessory" isEqual:v4];

  if ((v5 & 1) == 0)
  {
    uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) arrayByAddingObject:v9];
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

id MGRoomFromHomeManagerForGroupIdentifier(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = [a2 components];
  char v5 = _MGRelevantComponentsForGroupIdentifierComponents(v4);
  uint64_t v6 = [v5 objectForKey:@"hi"];
  uint64_t v7 = [v5 objectForKey:@"ri"];
  id v8 = (void *)v7;
  id v9 = 0;
  if (v6 && v7)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = [v3 homes];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v26 = v5;
      uint64_t v27 = v4;
      uint64_t v13 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v16 = [v15 uniqueIdentifier];
          int v17 = [v16 isEqual:v6];

          if (v17)
          {
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v18 = [v15 rooms];
            id v9 = (id)[v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v9)
            {
              id v25 = v3;
              uint64_t v19 = *(void *)v29;
              while (2)
              {
                for (uint64_t j = 0; j != v9; uint64_t j = (char *)j + 1)
                {
                  if (*(void *)v29 != v19) {
                    objc_enumerationMutation(v18);
                  }
                  long long v21 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
                  long long v22 = [v21 uniqueIdentifier];
                  int v23 = [v22 isEqual:v8];

                  if (v23)
                  {
                    id v9 = v21;
                    goto LABEL_23;
                  }
                }
                id v9 = (id)[v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
                if (v9) {
                  continue;
                }
                break;
              }
LABEL_23:
              id v3 = v25;
            }

            goto LABEL_25;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      id v9 = 0;
LABEL_25:
      char v5 = v26;
      id v4 = v27;
    }
    else
    {
      id v9 = 0;
    }
  }
  return v9;
}

id MGMemberIdentifiersForZoneInHome(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__2;
  id v16 = __Block_byref_object_dispose__2;
  id v17 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  char v5 = [v3 rooms];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __MGMemberIdentifiersForZoneInHome_block_invoke;
  v9[3] = &unk_26466EAF8;
  uint64_t v11 = &v12;
  id v6 = v4;
  id v10 = v6;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void sub_222D76F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MGMemberIdentifiersForZoneInHome_block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  MGGroupIdentifierForRoomInHome(a2, *(void **)(a1 + 32));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 arrayByAddingObject:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

id MGGroupIdentifierForRoomInHome(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uniqueIdentifier];
  uint64_t v5 = [v3 uniqueIdentifier];

  id v6 = MGGroupIdentifierForRoomIdentifierInHome(v4, v5);

  return v6;
}

id MGZoneFromHomeManagerForGroupIdentifier(void *a1, void *a2)
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = [a2 components];
  uint64_t v5 = _MGRelevantComponentsForGroupIdentifierComponents(v4);
  id v6 = [v5 objectForKey:@"hi"];
  uint64_t v7 = [v5 objectForKey:@"zi"];
  id v8 = (void *)v7;
  id v9 = 0;
  if (v6 && v7)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v10 = [v3 homes];
    uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v26 = v5;
      uint64_t v27 = v4;
      uint64_t v13 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v33 != v13) {
            objc_enumerationMutation(v10);
          }
          id v15 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          id v16 = [v15 uniqueIdentifier];
          int v17 = [v16 isEqual:v6];

          if (v17)
          {
            long long v30 = 0u;
            long long v31 = 0u;
            long long v28 = 0u;
            long long v29 = 0u;
            id v18 = [v15 zones];
            id v9 = (id)[v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
            if (v9)
            {
              id v25 = v3;
              uint64_t v19 = *(void *)v29;
              while (2)
              {
                for (uint64_t j = 0; j != v9; uint64_t j = (char *)j + 1)
                {
                  if (*(void *)v29 != v19) {
                    objc_enumerationMutation(v18);
                  }
                  long long v21 = *(void **)(*((void *)&v28 + 1) + 8 * (void)j);
                  long long v22 = [v21 uniqueIdentifier];
                  int v23 = [v22 isEqual:v8];

                  if (v23)
                  {
                    id v9 = v21;
                    goto LABEL_23;
                  }
                }
                id v9 = (id)[v18 countByEnumeratingWithState:&v28 objects:v36 count:16];
                if (v9) {
                  continue;
                }
                break;
              }
LABEL_23:
              id v3 = v25;
            }

            goto LABEL_25;
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v12) {
          continue;
        }
        break;
      }
      id v9 = 0;
LABEL_25:
      uint64_t v5 = v26;
      uint64_t v4 = v27;
    }
    else
    {
      id v9 = 0;
    }
  }
  return v9;
}

id MGGroupIdentifierForHomeInHome(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uniqueIdentifier];
  uint64_t v5 = [v3 uniqueIdentifier];

  id v6 = MGGroupIdentifierForHomeIdentifierInHome(v4, v5);

  return v6;
}

id MGMemberIdentifiersForHome(void *a1)
{
  id v1 = a1;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  uint64_t v12 = __Block_byref_object_copy__2;
  uint64_t v13 = __Block_byref_object_dispose__2;
  id v14 = objc_alloc_init(MEMORY[0x263EFF8C0]);
  uint64_t v2 = [v1 rooms];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __MGMemberIdentifiersForHome_block_invoke;
  v6[3] = &unk_26466EAF8;
  id v8 = &v9;
  id v3 = v1;
  id v7 = v3;
  [v2 enumerateObjectsUsingBlock:v6];

  id v4 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v4;
}

void sub_222D774D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __MGMemberIdentifiersForHome_block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  MGGroupIdentifierForRoomInHome(a2, *(void **)(a1 + 32));
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [v3 arrayByAddingObject:v7];
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;
}

id MGHomeFromHomeManagerForGroupIdentifier(void *a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = a1;
  uint64_t v4 = [a2 components];
  uint64_t v5 = _MGRelevantComponentsForGroupIdentifierComponents(v4);
  id v6 = [v5 objectForKey:@"hi"];
  if (v6)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v7 = [v3 homes];
    id v8 = (id)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      id v15 = v3;
      uint64_t v9 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          uint64_t v12 = [v11 uniqueIdentifier];
          int v13 = [v12 isEqual:v6];

          if (v13)
          {
            id v8 = v11;
            goto LABEL_12;
          }
        }
        id v8 = (id)[v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v8) {
          continue;
        }
        break;
      }
LABEL_12:
      id v3 = v15;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

id MGGroupIdentifierForHomeIdentifierInHome(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 UUIDString];
  uint64_t v11 = _MGGroupIdentifierHomeKitComponents(0, v3, v5, v6, v7, v8, v9, v10, @"hi", (uint64_t)v4);

  return v11;
}

id MGHomeIdentifierForGroupIdentifier(void *a1)
{
  return _MGHomeKitIdentifierForGroupIdentifier(a1, @"hi");
}

id MGGroupIdentifierForZoneInHome(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uniqueIdentifier];
  uint64_t v5 = [v3 uniqueIdentifier];

  uint64_t v6 = MGGroupIdentifierForZoneIdentifierInHome(v4, v5);

  return v6;
}

id MGGroupIdentifierForZoneIdentifierInHome(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 UUIDString];
  uint64_t v11 = _MGGroupIdentifierHomeKitComponents(0, v3, v5, v6, v7, v8, v9, v10, @"zi", (uint64_t)v4);

  return v11;
}

id MGZoneIdentifierForGroupIdentifier(void *a1)
{
  return _MGHomeKitIdentifierForGroupIdentifier(a1, @"zi");
}

id MGGroupIdentifierForRoomIdentifierInHome(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 UUIDString];
  uint64_t v11 = _MGGroupIdentifierHomeKitComponents(0, v3, v5, v6, v7, v8, v9, v10, @"ri", (uint64_t)v4);

  return v11;
}

id MGRoomIdentifierForGroupIdentifier(void *a1)
{
  return _MGHomeKitIdentifierForGroupIdentifier(a1, @"ri");
}

id MGGroupIdentifierForMediaSystemInHome(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 uniqueIdentifier];
  uint64_t v5 = [v3 uniqueIdentifier];

  uint64_t v6 = MGGroupIdentifierForMediaSystemIdentifierInHome(v4, v5);

  return v6;
}

id MGGroupIdentifierForMediaSystemIdentifierInHome(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [a1 UUIDString];
  uint64_t v11 = _MGGroupIdentifierHomeKitComponents(0, v3, v5, v6, v7, v8, v9, v10, @"msi", (uint64_t)v4);

  return v11;
}

id MGMediaSystemIdentifierForGroupIdentifier(void *a1)
{
  return _MGHomeKitIdentifierForGroupIdentifier(a1, @"msi");
}

void sub_222D78264(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromProtocol(Protocol *proto)
{
  return (NSString *)MEMORY[0x270EF2C18](proto);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x270EE57D8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x270F9A440](cls, outCount);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void free(void *a1)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x270F9A648](object, key);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}