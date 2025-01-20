@interface ASPurchaseBatch
- (id)_copyItemsByStorefrontFromItems:(id)a3;
- (id)_tooBigForNetworkErrorForError:(id)a3 withCount:(int64_t)a4;
- (id)copyFilteredItemsFromItems:(id)a3;
- (id)everythingFailedErrorForError:(id)a3;
- (id)mergedErrorForError:(id)a3 withCount:(int64_t)a4;
- (void)errorEqualCallback;
@end

@implementation ASPurchaseBatch

- (id)copyFilteredItemsFromItems:(id)a3
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v4 = -[ASPurchaseBatch _copyItemsByStorefrontFromItems:](self, "_copyItemsByStorefrontFromItems:");
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B148], "currentDevice"), "storeFrontIdentifier");
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v38 count:16];
  if (!v6) {
    goto LABEL_23;
  }
  uint64_t v7 = v6;
  v8 = 0;
  uint64_t v9 = *(void *)v25;
  while (2)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      if (*(void *)v25 != v9) {
        objc_enumerationMutation(v4);
      }
      v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
      if ([v5 hasPrefix:v11])
      {
        v8 = v11;
        goto LABEL_14;
      }
      if (!v8 || [v11 compare:v8] == -1) {
        v8 = v11;
      }
    }
    uint64_t v7 = [v4 countByEnumeratingWithState:&v24 objects:v38 count:16];
    if (v7) {
      continue;
    }
    break;
  }
LABEL_14:
  if (v8)
  {
    id v12 = (id)[v4 objectForKey:v8];
    v13 = (void *)[MEMORY[0x263F7B1F8] sharedConfig];
    int v14 = [v13 shouldLog];
    if ([v13 shouldLogToDisk]) {
      int v15 = v14 | 2;
    }
    else {
      int v15 = v14;
    }
    if (!os_log_type_enabled((os_log_t)[v13 OSLogObject], OS_LOG_TYPE_DEBUG)) {
      v15 &= 2u;
    }
    if (v15)
    {
      uint64_t v16 = objc_opt_class();
      uint64_t v17 = [v4 count];
      uint64_t v18 = [v12 count];
      uint64_t v19 = [a3 count];
      int v28 = 138413314;
      uint64_t v29 = v16;
      __int16 v30 = 2112;
      v31 = v8;
      __int16 v32 = 2048;
      uint64_t v33 = v17;
      __int16 v34 = 2048;
      uint64_t v35 = v18;
      __int16 v36 = 2048;
      uint64_t v37 = v19;
      LODWORD(v23) = 52;
      uint64_t v20 = _os_log_send_and_compose_impl();
      if (v20)
      {
        v21 = (void *)v20;
        objc_msgSend(NSString, "stringWithCString:encoding:", v20, 4, &v28, v23);
        free(v21);
        SSFileLog();
      }
    }
  }
  else
  {
LABEL_23:
    id v12 = 0;
  }

  return v12;
}

- (void)errorEqualCallback
{
  return __ASPurchaseBatchErrorEqual;
}

- (id)everythingFailedErrorForError:(id)a3
{
  id v4 = (void *)[a3 domain];
  v5 = (void *)*MEMORY[0x263F7B758];
  if (![v4 isEqualToString:*MEMORY[0x263F7B758]]) {
    return a3;
  }
  uint64_t v6 = [a3 code];
  if (v6 == 105)
  {
    id v12 = (void *)[MEMORY[0x263F89480] sharedInstance];
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", objc_msgSend((id)ASAppStoreUIBundle(), "localizedStringForKey:value:table:", @"INCOMPATIBLE_DEVICE_ERROR_BODY_ALL", &stru_26F0A7B60, 0), objc_msgSend(v12, "systemName"));
    uint64_t v14 = [a3 code];
    uint64_t v7 = [(id)ASAppStoreUIBundle() localizedStringForKey:@"INCOMPATIBLE_UPDATE_ERROR_TITLE_ALL" value:&stru_26F0A7B60 table:0];
    v8 = v4;
    uint64_t v9 = v14;
    uint64_t v10 = v13;
    goto LABEL_7;
  }
  if (v6 != 103) {
    return a3;
  }
  uint64_t v7 = [(id)ASAppStoreUIBundle() localizedStringForKey:@"NOT_ENOUGH_SPACE_FOR_ALL_APPS" value:&stru_26F0A7B60 table:0];
  v8 = v5;
  uint64_t v9 = 103;
  uint64_t v10 = 0;
LABEL_7:
  return (id)MEMORY[0x270F78EA0](v8, v9, v7, v10);
}

- (id)mergedErrorForError:(id)a3 withCount:(int64_t)a4
{
  if (a4 < 2) {
    return a3;
  }
  uint64_t v7 = (void *)[a3 domain];
  v8 = (void *)*MEMORY[0x263F7B758];
  if (![v7 isEqualToString:*MEMORY[0x263F7B758]]) {
    return a3;
  }
  uint64_t v9 = [a3 code];
  if (v9 != 102)
  {
    if (v9 == 105)
    {
      int v15 = (void *)[MEMORY[0x263F89480] sharedInstance];
      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", objc_msgSend((id)ASAppStoreUIBundle(), "localizedStringForKey:value:table:", @"INCOMPATIBLE_DEVICE_ERROR_BODY_SOME", &stru_26F0A7B60, 0), objc_msgSend(v15, "systemName"));
      uint64_t v17 = [a3 code];
      uint64_t v10 = [(id)ASAppStoreUIBundle() localizedStringForKey:@"INCOMPATIBLE_UPDATE_ERROR_TITLE_SOME" value:&stru_26F0A7B60 table:0];
      v11 = v7;
      uint64_t v12 = v17;
      uint64_t v13 = v16;
      goto LABEL_12;
    }
    if (v9 == 103)
    {
      uint64_t v10 = [(id)ASAppStoreUIBundle() localizedStringForKey:@"NOT_ENOUGH_SPACE_FOR_SOME_APPS" value:&stru_26F0A7B60 table:0];
      v11 = v8;
      uint64_t v12 = 103;
      uint64_t v13 = 0;
LABEL_12:
      return (id)MEMORY[0x270F78EA0](v11, v12, v10, v13);
    }
    return a3;
  }
  return [(ASPurchaseBatch *)self _tooBigForNetworkErrorForError:a3 withCount:a4];
}

- (id)_copyItemsByStorefrontFromItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v5 = (void *)[MEMORY[0x263F89518] loadedMap];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v11 = (__CFString *)[v10 itemIdentifier];
        if (v11)
        {
          uint64_t v12 = (void *)[objc_alloc(NSNumber) initWithItemIdentifier:v11];
          v11 = (__CFString *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "applicationForItemIdentifier:", v12), "storeFrontIdentifier"), "stringValue");
        }
        if (!v11) {
          v11 = &stru_26F0A7B60;
        }
        id v13 = (id)[v4 objectForKey:v11];
        if (!v13)
        {
          id v13 = objc_alloc_init(MEMORY[0x263EFF980]);
          [v4 setObject:v13 forKey:v11];
        }
        [v13 addObject:v10];
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  return v4;
}

- (id)_tooBigForNetworkErrorForError:(id)a3 withCount:(int64_t)a4
{
  if (MGGetBoolAnswer())
  {
    uint64_t v6 = (void *)ASAppStoreUIBundle();
    uint64_t v7 = @"TOO_BIG_FOR_NETWORK_BODY_FOR_APPS_WLAN";
  }
  else
  {
    int v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F7B148], "currentDevice"), "supportsDeviceCapability:", 0);
    uint64_t v6 = (void *)ASAppStoreUIBundle();
    if (v8) {
      uint64_t v7 = @"TOO_BIG_FOR_NETWORK_BODY_FOR_APPS";
    }
    else {
      uint64_t v7 = @"TOO_BIG_FOR_NETWORK_BODY_FOR_APPS_NO_WIFI";
    }
  }
  uint64_t v9 = [v6 localizedStringForKey:v7 value:&stru_26F0A7B60 table:0];
  uint64_t v10 = (void *)[a3 userInfo];
  uint64_t v11 = [v10 objectForKey:*MEMORY[0x263F7B768]];
  if (v11) {
    uint64_t v12 = objc_msgSend(NSString, "stringWithFormat:", objc_msgSend((id)ASAppStoreUIBundle(), "localizedStringForKey:value:table:", @"TOO_BIG_FOR_NETWORK_TITLE_FOR_APPS", &stru_26F0A7B60, 0), a4, v11);
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = [a3 domain];
  uint64_t v14 = [a3 code];
  return (id)MEMORY[0x270F78EA0](v13, v14, v12, v9);
}

@end