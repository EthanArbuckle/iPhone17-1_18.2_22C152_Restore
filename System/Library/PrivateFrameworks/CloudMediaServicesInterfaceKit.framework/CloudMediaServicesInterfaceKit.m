void sub_22B1015D0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
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

void applyHeaderOverrides(void *a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __applyHeaderOverrides_block_invoke;
  v5[3] = &unk_2648880F0;
  id v6 = v3;
  id v4 = v3;
  [a1 enumerateKeysAndObjectsUsingBlock:v5];
}

void __applyHeaderOverrides_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v7 = _CMSILogingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __applyHeaderOverrides_block_invoke_cold_1();
    }

    goto LABEL_29;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    headerStringFormat(v6);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v8) {
      v16 = v8;
    }
    else {
      v16 = &stru_26DE5AB78;
    }
    [*(id *)(a1 + 32) setValue:v16 forHTTPHeaderField:v5];
    goto LABEL_28;
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v8 = (__CFString *)v6;
  uint64_t v9 = [(__CFString *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (!v9) {
    goto LABEL_28;
  }
  uint64_t v10 = v9;
  uint64_t v11 = *(void *)v19;
  while (2)
  {
    for (uint64_t i = 0; i != v10; ++i)
    {
      if (*(void *)v19 != v11) {
        objc_enumerationMutation(v8);
      }
      v13 = *(void **)(*((void *)&v18 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = _CMSILogingFacility();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __applyHeaderOverrides_block_invoke_cold_2();
        }
        goto LABEL_27;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v17 = _CMSILogingFacility();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          __applyHeaderOverrides_block_invoke_cold_3();
        }
LABEL_27:

        goto LABEL_28;
      }
      v14 = headerStringFormat(v13);
      v15 = *(void **)(a1 + 32);
      if (v14) {
        [v15 addValue:v14 forHTTPHeaderField:v5];
      }
      else {
        objc_msgSend(v15, "setValue:forHTTPHeaderField:", &stru_26DE5AB78, v5, (void)v18);
      }
    }
    uint64_t v10 = [(__CFString *)v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_28:

LABEL_29:
}

__CFString *headerStringFormat(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v2 = (__CFString *)v1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v3 = v1;
      CFTypeID TypeID = CFBooleanGetTypeID();
      if (CFGetTypeID(v3) == TypeID)
      {
        int v5 = [v3 BOOLValue];
        id v6 = @"false";
        if (v5) {
          id v6 = @"true";
        }
        v7 = v6;
      }
      else
      {
        v7 = [v3 stringValue];
      }
      v2 = v7;
    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

id cmsDateFormatter()
{
  if (cmsDateFormatter_onceToken != -1) {
    dispatch_once(&cmsDateFormatter_onceToken, &__block_literal_global);
  }
  v0 = (void *)cmsDateFormatter_formatter;
  return v0;
}

uint64_t __cmsDateFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F088C0]);
  id v1 = (void *)cmsDateFormatter_formatter;
  cmsDateFormatter_formatter = (uint64_t)v0;

  v2 = (void *)cmsDateFormatter_formatter;
  return [v2 setFormatOptions:1907];
}

id cmsSafeDictionary(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id cmsDateCalender()
{
  if (cmsDateCalender_onceToken != -1) {
    dispatch_once(&cmsDateCalender_onceToken, &__block_literal_global_658);
  }
  id v0 = (void *)cmsDateCalender_gregorian;
  return v0;
}

id _userInfoValueToJSONValue(void *a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = [MEMORY[0x263EFF9D0] null];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v1 absoluteString];
LABEL_8:
    id v4 = v3;

    id v2 = v4;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v1 UUIDString];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v3 = v1;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    cmsDateFormatter();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = [v6 stringFromDate:v1];
LABEL_14:
    uint64_t v8 = v7;

LABEL_15:
    id v2 = (void *)v8;
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v1 base64EncodedStringWithOptions:0];
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v1;
    uint64_t v10 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v9, "count"));
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id v11 = v9;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v34 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = _userInfoValueToJSONValue(*(void *)(*((void *)&v33 + 1) + 8 * i));
          [v10 addObject:v16];
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v33 objects:v38 count:16];
      }
      while (v13);
    }

    uint64_t v17 = [v10 copy];
    id v2 = (void *)v17;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v1, "count"));
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      long long v29 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      id v18 = v1;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
      if (v19)
      {
        uint64_t v20 = v19;
        uint64_t v21 = *(void *)v30;
        do
        {
          for (uint64_t j = 0; j != v20; ++j)
          {
            if (*(void *)v30 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = _userInfoValueToJSONValue(*(void *)(*((void *)&v29 + 1) + 8 * j));
            [v6 addObject:v23];
          }
          uint64_t v20 = [v18 countByEnumeratingWithState:&v29 objects:v37 count:16];
        }
        while (v20);
      }

      uint64_t v7 = [v6 copy];
      goto LABEL_14;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = (void *)MEMORY[0x263EFF9A0];
      id v25 = v1;
      v26 = objc_msgSend(v24, "dictionaryWithCapacity:", objc_msgSend(v25, "count"));
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = ___userInfoValueToJSONValue_block_invoke;
      v27[3] = &unk_2648882C8;
      id v28 = v26;
      id v6 = v26;
      [v25 enumerateKeysAndObjectsUsingBlock:v27];

      uint64_t v8 = [v6 copy];
      goto LABEL_15;
    }
  }
LABEL_9:

  return v2;
}

id _JSONValueToUserInfoValue(void *a1)
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
    id v3 = [v2 cmsOptionalStringForKey:@"$typ"];
    id v4 = [v2 objectForKey:@"$val"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || !v4 || [v2 count] != 2) {
      goto LABEL_38;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v4;
      if ([v3 isEqualToString:@"url"])
      {
        uint64_t v6 = [NSURL URLWithString:v5];
LABEL_31:
        id v13 = (id)v6;
        goto LABEL_37;
      }
      if ([v3 isEqualToString:@"uuid"])
      {
        uint64_t v6 = [objc_alloc(MEMORY[0x263F08C38]) initWithUUIDString:v5];
        goto LABEL_31;
      }
      if ([v3 isEqualToString:@"date"])
      {
        v22 = cmsDateFormatter();
        id v13 = [v22 dateFromString:v5];

        goto LABEL_37;
      }
      if ([v3 isEqualToString:@"data"])
      {
        uint64_t v6 = [objc_alloc(MEMORY[0x263EFF8F8]) initWithBase64EncodedString:v5 options:0];
        goto LABEL_31;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_38;
      }
      id v5 = v4;
      if ([v3 isEqualToString:@"set"])
      {
        v15 = objc_msgSend(MEMORY[0x263EFF9C0], "setWithCapacity:", objc_msgSend(v5, "count"));
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v27 = v5;
        id v16 = v5;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v35;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v35 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = _JSONValueToUserInfoValue(*(void *)(*((void *)&v34 + 1) + 8 * i));
              [v15 addObject:v21];
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v34 objects:v39 count:16];
          }
          while (v18);
        }

        id v13 = (id)[v15 copy];
        id v5 = v27;
LABEL_37:

        if (v13)
        {
LABEL_39:

          goto LABEL_40;
        }
LABEL_38:
        uint64_t v23 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        v32[2] = ___JSONValueToUserInfoValue_block_invoke;
        v32[3] = &unk_2648882C8;
        id v33 = v23;
        id v24 = v23;
        [v2 enumerateKeysAndObjectsUsingBlock:v32];
        id v13 = (id)[v24 copy];

        goto LABEL_39;
      }
    }
    id v13 = 0;
    goto LABEL_37;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v1, "count"));
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v7 = v1;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v9; ++j)
        {
          if (*(void *)v29 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = _JSONValueToUserInfoValue(*(void *)(*((void *)&v28 + 1) + 8 * j));
          [v2 addObject:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v9);
    }

    id v13 = (id)[v2 copy];
LABEL_40:

    if (v13) {
      goto LABEL_41;
    }
LABEL_18:
    id v14 = [MEMORY[0x263EFF9D0] null];
    goto LABEL_42;
  }
  id v13 = v1;
  if (!v13) {
    goto LABEL_18;
  }
LABEL_41:
  id v14 = v13;
LABEL_42:
  id v25 = v14;

  return v25;
}

uint64_t INIntentHandlingStatusFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"ready"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"inProgress"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"success"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"failure"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"deferredToApplication"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"userConfirmationRequired"])
  {
    uint64_t v2 = 6;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *INIntentHandlingStatusToString(unint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"##%ld##", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_2648882E8[a1];
  }
  return v1;
}

uint64_t INInteractionDirectionFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"outgoing"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"incoming"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    [v1 isEqualToString:@"unspecified"];
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *INInteractionDirectionToString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"##%ld##", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_264888320[a1];
  }
  return v1;
}

uint64_t INRecurrenceFrequencyFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"minute"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"hourly"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"daily"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"weekly"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"monthly"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"yearly"])
  {
    uint64_t v2 = 6;
  }
  else
  {
    [v1 isEqualToString:@"unknown"];
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *INRecurrenceFrequencyToString(unint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"##%ld##", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_264888338[a1];
  }
  return v1;
}

uint64_t INMediaItemTypeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"song"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"album"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"artist"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"genre"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"playlist"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"podcastShow"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"podcastEpisode"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"podcastPlaylist"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"musicStation"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"audioBook"])
  {
    uint64_t v2 = 10;
  }
  else if ([v1 isEqualToString:@"movie"])
  {
    uint64_t v2 = 11;
  }
  else if ([v1 isEqualToString:@"tvShow"])
  {
    uint64_t v2 = 12;
  }
  else if ([v1 isEqualToString:@"tvShowEpisode"])
  {
    uint64_t v2 = 13;
  }
  else if ([v1 isEqualToString:@"musicVideo"])
  {
    uint64_t v2 = 14;
  }
  else if ([v1 isEqualToString:@"podcastStation"])
  {
    uint64_t v2 = 15;
  }
  else if ([v1 isEqualToString:@"radioStation"])
  {
    uint64_t v2 = 16;
  }
  else if ([v1 isEqualToString:@"station"])
  {
    uint64_t v2 = 17;
  }
  else if ([v1 isEqualToString:@"music"])
  {
    uint64_t v2 = 18;
  }
  else if ([v1 isEqualToString:@"algorithmicRadioStation"])
  {
    uint64_t v2 = 19;
  }
  else if ([v1 isEqualToString:@"news"])
  {
    uint64_t v2 = 20;
  }
  else
  {
    [v1 isEqualToString:@"unknown"];
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *INMediaItemTypeToString(unint64_t a1)
{
  if (a1 >= 0x15)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"##%ld##", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_264888370[a1];
  }
  return v1;
}

uint64_t INMediaReferenceFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"currentlyPlaying"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"my"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    [v1 isEqualToString:@"unknown"];
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *INMediaReferenceToString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"##%ld##", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_264888418[a1];
  }
  return v1;
}

uint64_t INMediaSortOrderFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"newest"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"oldest"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"best"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"worst"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"popular"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"unpopular"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"trending"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"recommended"])
  {
    uint64_t v2 = 8;
  }
  else
  {
    [v1 isEqualToString:@"unknown"];
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *INMediaSortOrderToString(unint64_t a1)
{
  if (a1 >= 9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"##%ld##", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_264888430[a1];
  }
  return v1;
}

uint64_t INMediaDestinationTypeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"library"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"playlist"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    [v1 isEqualToString:@"unknown"];
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *INMediaDestinationTypeToString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"##%ld##", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_264888478[a1];
  }
  return v1;
}

uint64_t INPlaybackRepeatModeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"none"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"all"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"one"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *INPlaybackRepeatModeToString(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"##%ld##", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_264888490[a1];
  }
  return v1;
}

uint64_t INPlaybackQueueLocationFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"now"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"next"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"later"])
  {
    uint64_t v2 = 3;
  }
  else
  {
    [v1 isEqualToString:@"unknown"];
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *INPlaybackQueueLocationToString(unint64_t a1)
{
  if (a1 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"##%ld##", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_2648884B0[a1];
  }
  return v1;
}

uint64_t INPlayMediaIntentResponseCodeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"ready"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"continueInApp"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"inProgress"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"success"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"handleInApp"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"failure"])
  {
    uint64_t v2 = 6;
  }
  else if ([v1 isEqualToString:@"failureRequiringAppLaunch"])
  {
    uint64_t v2 = 7;
  }
  else if ([v1 isEqualToString:@"failureUnknownMediaType"])
  {
    uint64_t v2 = 8;
  }
  else if ([v1 isEqualToString:@"failureNoUnplayedContent"])
  {
    uint64_t v2 = 9;
  }
  else if ([v1 isEqualToString:@"failureRestrictedContent"])
  {
    uint64_t v2 = 10;
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *INPlayMediaIntentResponseCodeToString(unint64_t a1)
{
  if (a1 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"##%ld##", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_2648884D0[a1];
  }
  return v1;
}

uint64_t INAddMediaIntentResponseCodeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"ready"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"inProgress"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"success"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"handleInApp"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"Failure"])
  {
    uint64_t v2 = 5;
  }
  else if ([v1 isEqualToString:@"FailureRequiringAppLaunch"])
  {
    uint64_t v2 = 6;
  }
  else
  {
    [v1 isEqualToString:@"unspecified"];
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *INAddMediaIntentResponseCodeToString(unint64_t a1)
{
  if (a1 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"##%ld##", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_264888530[a1];
  }
  return v1;
}

uint64_t INMediaAffinityTypeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"like"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"dislike"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    [v1 isEqualToString:@"unknown"];
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *INMediaAffinityTypeToString(unint64_t a1)
{
  if (a1 >= 3)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"##%ld##", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_264888568[a1];
  }
  return v1;
}

uint64_t INUpdateMediaAffinityIntentResponseCodeFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"ready"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"inProgress"])
  {
    uint64_t v2 = 2;
  }
  else if ([v1 isEqualToString:@"success"])
  {
    uint64_t v2 = 3;
  }
  else if ([v1 isEqualToString:@"failure"])
  {
    uint64_t v2 = 4;
  }
  else if ([v1 isEqualToString:@"failureRequiringAppLaunch"])
  {
    uint64_t v2 = 5;
  }
  else
  {
    [v1 isEqualToString:@"unspecified"];
    uint64_t v2 = 0;
  }

  return v2;
}

__CFString *INUpdateMediaAffinityIntentResponseCodeToString(unint64_t a1)
{
  if (a1 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"##%ld##", a1);
    id v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v1 = off_264888580[a1];
  }
  return v1;
}

uint64_t INAddMediaMediaDestinationUnsupportedReasonFromString(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"playlistNameNotFound"])
  {
    uint64_t v2 = 1;
  }
  else if ([v1 isEqualToString:@"playlistNotEditable"])
  {
    uint64_t v2 = 2;
  }
  else
  {
    uint64_t v2 = 1;
  }

  return v2;
}

__CFString *INAddMediaMediaDestinationUnsupportedReasonToString(uint64_t a1)
{
  if (a1 == 2)
  {
    uint64_t v2 = @"playlistNotEditable";
  }
  else if (a1 == 1)
  {
    uint64_t v2 = @"playlistNameNotFound";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"##%ld##", a1);
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t __cmsDateCalender_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x263EFF8F0]);
  cmsDateCalender_gregorian = [v0 initWithCalendarIdentifier:*MEMORY[0x263EFF3F8]];
  return MEMORY[0x270F9A758]();
}

void ___userInfoValueToJSONValue_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  _userInfoValueToJSONValue(a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setValue:v6 forKey:v5];
}

id CreateDataWithSerializedJSON(void *a1, void *a2)
{
  id v3 = a1;
  if ([MEMORY[0x263F08900] isValidJSONObject:v3])
  {
    id v4 = [MEMORY[0x263F08900] dataWithJSONObject:v3 options:0 error:a2];
  }
  else
  {
    id v5 = _CMSILogingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      CreateDataWithSerializedJSON_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }

    if (a2)
    {
      [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.cloudextension.errors.session" code:13 userInfo:0];
      id v4 = 0;
      *a2 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v4 = 0;
    }
  }

  return v4;
}

void sub_22B10E114(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22B10E76C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
}

void sub_22B10EBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  objc_destroyWeak(v11);
  objc_destroyWeak((id *)(v12 - 120));
  _Unwind_Resume(a1);
}

BOOL _isValidMethod(void *a1)
{
  uint64_t v1 = CMSExtensionEndpointForProtocolMethodName(a1);
  BOOL v2 = v1 != 0;

  return v2;
}

void sub_22B10FEB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22B110FB4(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Cu);
}

void sub_22B113A70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_22B113CC0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id nwActivityFromUUID(void *a1)
{
  v2[2] = *MEMORY[0x263EF8340];
  if (a1)
  {
    v2[0] = 0;
    v2[1] = 0;
    [a1 getUUIDBytes:v2];
    a1 = (void *)nw_activity_create_from_token();
  }
  return a1;
}

__CFString *CMSActivityReportTypeToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 0x12) {
    return @"local.report.undefined";
  }
  else {
    return off_264888980[a1 - 1];
  }
}

__CFString *CMSActivityTransitionTypeToString(unint64_t a1)
{
  if (a1 > 3) {
    return @"undefined";
  }
  else {
    return off_264888A18[a1];
  }
}

__CFString *CMSCloudExtensionSpecVersion()
{
  return @"1.1.0";
}

id CMSCloudExtensionLanguageCode()
{
  if (CMSCloudExtensionLanguageCode_onceToken != -1) {
    dispatch_once(&CMSCloudExtensionLanguageCode_onceToken, &__block_literal_global_1);
  }
  id v0 = (void *)CMSCloudExtensionLanguageCode_languageCode;
  return v0;
}

void __CMSCloudExtensionLanguageCode_block_invoke()
{
  id v5 = [MEMORY[0x263EFF960] currentLocale];
  id v0 = NSString;
  uint64_t v1 = [v5 languageCode];
  BOOL v2 = [v5 countryCode];
  uint64_t v3 = [v0 stringWithFormat:@"%@-%@", v1, v2];
  uint64_t v4 = (void *)CMSCloudExtensionLanguageCode_languageCode;
  CMSCloudExtensionLanguageCode_languageCode = v3;
}

id CMSCreateCloudExtensionHTTPRequest(void *a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  uint64_t v9 = (objc_class *)MEMORY[0x263F089E0];
  id v10 = a1;
  uint64_t v11 = (void *)[[v9 alloc] initWithURL:v10 cachePolicy:a3 timeoutInterval:6.0];

  [v11 setValue:@"AppleCloudExtension/1.1.0" forHTTPHeaderField:@"User-Agent"];
  if (v7) {
    [v11 setValue:v7 forHTTPHeaderField:@"Authorization"];
  }
  if (v8) {
    [v11 setValue:v8 forHTTPHeaderField:@"x-com-apple-cloudextension-session"];
  }

  return v11;
}

id CMSExtensionEndpointForProtocolMethodName(void *a1)
{
  uint64_t v1 = CMSExtensionEndpointForProtocolMethodName_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&CMSExtensionEndpointForProtocolMethodName_onceToken, &__block_literal_global_2);
  }
  uint64_t v3 = [(id)CMSExtensionEndpointForProtocolMethodName_methodNameToEndpointMapping objectForKeyedSubscript:v2];

  return v3;
}

void __CMSExtensionEndpointForProtocolMethodName_block_invoke()
{
  v3[16] = *MEMORY[0x263EF8340];
  v2[0] = @"PlayMediaIntentHandling.resolveMediaItems";
  v2[1] = @"PlayMediaIntentHandling.resolvePlayShuffled";
  v3[0] = @"intent/playMedia";
  v3[1] = @"intent/playMedia";
  v2[2] = @"PlayMediaIntentHandling.resolvePlaybackQueueLocation";
  void v2[3] = @"PlayMediaIntentHandling.resolvePlaybackRepeatMode";
  v3[2] = @"intent/playMedia";
  v3[3] = @"intent/playMedia";
  v2[4] = @"PlayMediaIntentHandling.resolvePlaybackSpeed";
  v2[5] = @"PlayMediaIntentHandling.resolveResumePlayback";
  v3[4] = @"intent/playMedia";
  v3[5] = @"intent/playMedia";
  v2[6] = @"PlayMediaIntentHandling.confirm";
  v2[7] = @"PlayMediaIntentHandling.handle";
  v3[6] = @"intent/playMedia";
  v3[7] = @"intent/playMedia";
  v2[8] = @"AddMediaIntentHandling.resolveMediaItems";
  v2[9] = @"AddMediaIntentHandling.resolveMediaDestination";
  v3[8] = @"intent/addMedia";
  v3[9] = @"intent/addMedia";
  v2[10] = @"AddMediaIntentHandling.confirm";
  v2[11] = @"AddMediaIntentHandling.handle";
  v3[10] = @"intent/addMedia";
  v3[11] = @"intent/addMedia";
  v2[12] = @"UpdateMediaAffinityIntentHandling.resolveMediaItems";
  v2[13] = @"UpdateMediaAffinityIntentHandling.resolveAffinityType";
  v3[12] = @"intent/updateMediaAffinity";
  v3[13] = @"intent/updateMediaAffinity";
  v2[14] = @"UpdateMediaAffinityIntentHandling.confirm";
  v2[15] = @"UpdateMediaAffinityIntentHandling.handle";
  v3[14] = @"intent/updateMediaAffinity";
  v3[15] = @"intent/updateMediaAffinity";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:16];
  uint64_t v1 = (void *)CMSExtensionEndpointForProtocolMethodName_methodNameToEndpointMapping;
  CMSExtensionEndpointForProtocolMethodName_methodNameToEndpointMapping = v0;
}

id CMSProtocolNameForExtensionEndpoint(void *a1)
{
  uint64_t v1 = CMSProtocolNameForExtensionEndpoint_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&CMSProtocolNameForExtensionEndpoint_onceToken, &__block_literal_global_57);
  }
  uint64_t v3 = [(id)CMSProtocolNameForExtensionEndpoint_nameMapping objectForKeyedSubscript:v2];

  return v3;
}

void __CMSProtocolNameForExtensionEndpoint_block_invoke()
{
  v3[3] = *MEMORY[0x263EF8340];
  v2[0] = @"intent/playMedia";
  v2[1] = @"intent/addMedia";
  v3[0] = @"PlayMediaIntentHandling";
  v3[1] = @"AddMediaIntentHandling";
  v2[2] = @"intent/updateMediaAffinity";
  v3[2] = @"UpdateMediaAffinityIntentHandling";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:3];
  uint64_t v1 = (void *)CMSProtocolNameForExtensionEndpoint_nameMapping;
  CMSProtocolNameForExtensionEndpoint_nameMapping = v0;
}

id CMSPredictedMethodNameForElidingMethod(void *a1)
{
  uint64_t v1 = CMSPredictedMethodNameForElidingMethod_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&CMSPredictedMethodNameForElidingMethod_onceToken, &__block_literal_global_59);
  }
  uint64_t v3 = [(id)CMSPredictedMethodNameForElidingMethod_predictionDependencies objectForKeyedSubscript:v2];

  return v3;
}

void __CMSPredictedMethodNameForElidingMethod_block_invoke()
{
  v3[7] = *MEMORY[0x263EF8340];
  v2[0] = @"PlayMediaIntentHandling.resolvePlayShuffled";
  v2[1] = @"PlayMediaIntentHandling.resolvePlaybackQueueLocation";
  v3[0] = @"PlayMediaIntentHandling.handle";
  v3[1] = @"PlayMediaIntentHandling.handle";
  v2[2] = @"PlayMediaIntentHandling.resolvePlaybackRepeatMode";
  void v2[3] = @"PlayMediaIntentHandling.resolvePlaybackSpeed";
  v3[2] = @"PlayMediaIntentHandling.handle";
  v3[3] = @"PlayMediaIntentHandling.handle";
  v2[4] = @"PlayMediaIntentHandling.resolveResumePlayback";
  v2[5] = @"AddMediaIntentHandling.resolveMediaDestination";
  void v3[4] = @"PlayMediaIntentHandling.handle";
  v3[5] = @"AddMediaIntentHandling.handle";
  v2[6] = @"UpdateMediaAffinityIntentHandling.resolveAffinityType";
  v3[6] = @"UpdateMediaAffinityIntentHandling.handle";
  uint64_t v0 = [NSDictionary dictionaryWithObjects:v3 forKeys:v2 count:7];
  uint64_t v1 = (void *)CMSPredictedMethodNameForElidingMethod_predictionDependencies;
  CMSPredictedMethodNameForElidingMethod_predictionDependencies = v0;
}

id _CMSILogingFacility()
{
  if (_CMSILogingFacility_onceToken != -1) {
    dispatch_once(&_CMSILogingFacility_onceToken, &__block_literal_global_3);
  }
  uint64_t v0 = (void *)_CMSILogingFacility_oslog;
  return v0;
}

BOOL DEROidCompare(uint64_t a1, uint64_t a2)
{
  BOOL result = 0;
  if (a1 && a2)
  {
    size_t v4 = *(void *)(a1 + 8);
    return v4 == *(void *)(a2 + 8) && memcmp(*(const void **)a1, *(const void **)a2, v4) == 0;
  }
  return result;
}

void __applyHeaderOverrides_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22B0FF000, v0, v1, "Unexpected dictionary in header map: %@", v2, v3, v4, v5, v6);
}

void __applyHeaderOverrides_block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22B0FF000, v0, v1, "Unexpected dictionary in header value list: %@", v2, v3, v4, v5, v6);
}

void __applyHeaderOverrides_block_invoke_cold_3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_22B0FF000, v0, v1, "Unexpected array in header value list: %@", v2, v3, v4, v5, v6);
}

void CreateDataWithSerializedJSON_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x270EE4528]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

OSStatus SecAsn1CoderCreate(SecAsn1CoderRef *coder)
{
  return MEMORY[0x270EFD690](coder);
}

OSStatus SecAsn1CoderRelease(SecAsn1CoderRef coder)
{
  return MEMORY[0x270EFD698](coder);
}

OSStatus SecAsn1Decode(SecAsn1CoderRef coder, const void *src, size_t len, const SecAsn1Template *templates, void *dest)
{
  return MEMORY[0x270EFD6A0](coder, src, len, templates, dest);
}

OSStatus SecAsn1EncodeItem(SecAsn1CoderRef coder, const void *src, const SecAsn1Template *templates, SecAsn1Item *dest)
{
  return MEMORY[0x270EFD6B0](coder, src, templates, dest);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x270EFDA60](keyData, attributes, error);
}

Boolean SecKeyVerifySignature(SecKeyRef key, SecKeyAlgorithm algorithm, CFDataRef signedData, CFDataRef signature, CFErrorRef *error)
{
  return MEMORY[0x270EFDAC8](key, algorithm, signedData, signature, error);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

uint64_t nw_activity_activate()
{
  return MEMORY[0x270EF7998]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x270EF79A8]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x270EF79C8]();
}

uint64_t nw_activity_create_from_token()
{
  return MEMORY[0x270EF79D8]();
}

uint64_t nw_activity_create_retry()
{
  return MEMORY[0x270EF79F0]();
}

uint64_t nw_activity_get_token()
{
  return MEMORY[0x270EF7A08]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x270EF7A28]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
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