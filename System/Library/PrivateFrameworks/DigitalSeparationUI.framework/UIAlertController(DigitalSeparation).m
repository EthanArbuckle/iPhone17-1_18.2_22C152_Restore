@interface UIAlertController(DigitalSeparation)
+ (id)ds_alertControllerContinuityUnpairError:()DigitalSeparation;
+ (id)ds_alertControllerWithAppDeletionError:()DigitalSeparation;
+ (id)ds_alertControllerWithFetchSharingError:()DigitalSeparation;
+ (id)ds_alertControllerWithStopPermissionSharingError:()DigitalSeparation;
+ (id)ds_alertControllerWithStopSharingError:()DigitalSeparation;
@end

@implementation UIAlertController(DigitalSeparation)

+ (id)ds_alertControllerWithStopSharingError:()DigitalSeparation
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "ds_underlyingErrorsBySource");
  v6 = [v5 objectForKeyedSubscript:*MEMORY[0x263F3A330]];
  v7 = [v6 domain];
  int v8 = [v7 isEqualToString:*MEMORY[0x263F3A308]];

  if (v8)
  {
    v9 = [v6 underlyingErrors];
    uint64_t v10 = [v9 firstObject];

    v6 = (void *)v10;
  }
  v11 = [v6 domain];
  if ([v11 isEqualToString:@"HMDigitalSeparationErrorDomain"])
  {
    uint64_t v12 = [v6 code];

    if (v12 == 1)
    {
      v13 = DSUILocStringForKey(@"STOP_SHARING_FAILED_WITH_PIN_CODE_ERROR_MESSAGE");
      v14 = DSUILocStringForKey(@"STOP_SHARING_FAILED_WITH_PIN_CODE_ERROR_TITLE");
      v15 = [a1 alertControllerWithTitle:v14 message:v13 preferredStyle:1];
      goto LABEL_22;
    }
  }
  else
  {
  }
  v13 = objc_msgSend(v4, "ds_localizedAppNames");
  if ([v13 count] == 1)
  {
    v16 = NSString;
    v17 = DSUILocStringForKey(@"STOP_SHARING_FAILED_TITLE_WITH_APP_NAME");
    v18 = [v13 firstObject];
    v19 = objc_msgSend(v16, "stringWithFormat:", v17, v18);

    v20 = [v4 underlyingErrors];
    if (__79__UIAlertController_DigitalSeparation__ds_alertControllerWithStopSharingError___block_invoke((uint64_t)v20, v20))v21 = @"STOP_SHARING_SOURCE_FAILED_RESTRICTIONS_SINGLE_APP"; {
    else
    }
      v21 = @"STOP_SHARING_FAILED_WITH_APP_NAME";
    v22 = DSUILocStringForKey(v21);

    v23 = NSString;
    v24 = [v13 firstObject];
    objc_msgSend(v23, "stringWithFormat:", v22, v24);
  }
  else
  {
    unint64_t v25 = [v13 count];
    v19 = DSUILocStringForKey(@"STOP_SHARING_FAILED_TITLE");
    if (v25 < 2)
    {
      v14 = DSUILocStringForKey(@"STOP_SHARING_FAILED");
      goto LABEL_19;
    }
    v22 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v13];
    v26 = [v4 underlyingErrors];
    if (__79__UIAlertController_DigitalSeparation__ds_alertControllerWithStopSharingError___block_invoke((uint64_t)v26, v26))v27 = @"STOP_SHARING_SOURCE_FAILED_RESTRICTIONS_MULTIPLE_APPS"; {
    else
    }
      v27 = @"STOP_SHARING_FAILED_WITH_MULTIPLE_APPS";
    v24 = DSUILocStringForKey(v27);

    objc_msgSend(NSString, "stringWithFormat:", v24, v22);
  v14 = };

LABEL_19:
  if (os_variant_has_internal_content())
  {
    v28 = NSString;
    v29 = objc_msgSend(v4, "ds_underlyingErrorsBySource");
    uint64_t v30 = [v28 stringWithFormat:@"%@\n\nInternal Only: %@", v14, v29];

    v14 = (void *)v30;
  }
  v15 = [a1 alertControllerWithTitle:v19 message:v14 preferredStyle:1];

LABEL_22:
  return v15;
}

+ (id)ds_alertControllerWithFetchSharingError:()DigitalSeparation
{
  id v4 = a3;
  v5 = objc_msgSend(v4, "ds_localizedAppNames");
  if ([v5 count] == 1)
  {
    v6 = NSString;
    v7 = DSUILocStringForKey(@"FETCH_SHARING_FAILED_TITLE_WITH_APP_NAME");
    int v8 = [v5 firstObject];
    v9 = objc_msgSend(v6, "stringWithFormat:", v7, v8);

    uint64_t v10 = NSString;
    v11 = DSUILocStringForKey(@"FETCH_SHARING_FAILED_WITH_APP_NAME");
    uint64_t v12 = [v5 firstObject];
    objc_msgSend(v10, "stringWithFormat:", v11, v12);
    v14 = LABEL_5:;

    goto LABEL_7;
  }
  unint64_t v13 = [v5 count];
  v9 = DSUILocStringForKey(@"FETCH_SHARING_FAILED_TITLE");
  if (v13 >= 2)
  {
    v11 = [MEMORY[0x263F08950] localizedStringByJoiningStrings:v5];
    uint64_t v12 = DSUILocStringForKey(@"FETCH_SHARING_FAILED_WITH_MULTIPLE_APPS");
    objc_msgSend(NSString, "stringWithFormat:", v12, v11);
    goto LABEL_5;
  }
  v14 = DSUILocStringForKey(@"FETCH_SHARING_FAILED");
LABEL_7:
  if (os_variant_has_internal_content())
  {
    v15 = NSString;
    v16 = objc_msgSend(v4, "ds_underlyingErrorsBySource");
    uint64_t v17 = [v15 stringWithFormat:@"%@\n\nInternal Only: %@", v14, v16];

    v14 = (void *)v17;
  }
  v18 = [a1 alertControllerWithTitle:v9 message:v14 preferredStyle:1];

  return v18;
}

+ (id)ds_alertControllerWithAppDeletionError:()DigitalSeparation
{
  id v4 = a3;
  if ([v4 code] == 8)
  {
    v5 = [v4 userInfo];

    id v4 = [v5 objectForKeyedSubscript:*MEMORY[0x263F3A310]];

    v6 = NSString;
    v7 = DSUILocStringForKey(@"DELETE_APP_FAILED_TITLE");
    int v8 = objc_msgSend(v6, "stringWithFormat:", v7, v4);

    v9 = NSString;
    uint64_t v10 = DSUILocStringForKey(@"DELETE_APP_FAILED_RESTRICTIONS");
    v11 = objc_msgSend(v9, "stringWithFormat:", v10, v4);

    uint64_t v12 = [a1 alertControllerWithTitle:v8 message:v11 preferredStyle:1];
  }
  else
  {
    NSLog(&cfstr_EncounteredAnU.isa, v4);
    uint64_t v12 = 0;
  }

  return v12;
}

+ (id)ds_alertControllerWithStopPermissionSharingError:()DigitalSeparation
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = objc_msgSend(v4, "ds_localizedPermissionNames");
  v6 = (void *)MEMORY[0x263F08950];
  v7 = [v5 allObjects];
  int v8 = [v6 localizedStringByJoiningStrings:v7];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v9 = [v4 underlyingErrors];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    char v12 = 0;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v9);
        }
        v12 |= [*(id *)(*((void *)&v26 + 1) + 8 * i) code] == 7;
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);

    if (v12)
    {
      if ([v5 count] == 1)
      {
        v15 = NSString;
        v16 = DSUILocStringForKey(@"RESET_APP_PERMISSIONS_FAILED_RESTRICTIONS_SINGLE_APP");
        uint64_t v17 = objc_msgSend(v15, "stringWithFormat:", v16, v8);

        v18 = NSString;
        v19 = @"RESET_APP_PERMISSIONS_FAILED_TITLE_SINGLE_APP";
        goto LABEL_14;
      }
      if ((unint64_t)[v5 count] >= 2)
      {
        v24 = NSString;
        unint64_t v25 = DSUILocStringForKey(@"RESET_APP_PERMISSIONS_FAILED_RESTRICTIONS_MULTIPLE_APPS");
        uint64_t v17 = objc_msgSend(v24, "stringWithFormat:", v25, v8);

        v18 = NSString;
        goto LABEL_13;
      }
    }
  }
  else
  {
  }
  uint64_t v17 = DSUILocStringForKey(@"RESET_APP_PERMISSIONS_FAILED");
  v18 = NSString;
LABEL_13:
  v19 = @"RESET_APP_PERMISSIONS_FAILED_TITLE_MULTIPLE_APPS";
LABEL_14:
  v20 = DSUILocStringForKey(v19);
  v21 = objc_msgSend(v18, "stringWithFormat:", v20, v8);

  v22 = [a1 alertControllerWithTitle:v21 message:v17 preferredStyle:1];

  return v22;
}

+ (id)ds_alertControllerContinuityUnpairError:()DigitalSeparation
{
  id v4 = a3;
  v5 = DSUILocStringForKey(@"CONTINUITY_DISCONNECT_ERROR_TITLE");
  v6 = DSUILocStringForKey(@"CONTINUITY_DISCONNECT_ERROR_DETAIL");
  if (os_variant_has_internal_content())
  {
    uint64_t v7 = [NSString stringWithFormat:@"%@\n\nInternal Only: %@", v6, v4];

    v6 = (void *)v7;
  }
  int v8 = [a1 alertControllerWithTitle:v5 message:v6 preferredStyle:1];

  return v8;
}

@end