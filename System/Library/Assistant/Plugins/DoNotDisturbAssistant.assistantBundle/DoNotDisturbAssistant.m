void sub_30E0(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  unsigned __int8 v5;
  id v6;
  char v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t vars8;

  v19 = +[DNDStateService serviceForClientIdentifier:@"com.apple.donotdisturb.siri.assistant"];
  v2 = [v19 queryCurrentStateWithError:0];
  v3 = [v2 isActive];
  if ([*(id *)(a1 + 32) toggle]) {
    v4 = (id)(v3 ^ 1);
  }
  else {
    v4 = [*(id *)(a1 + 32) value];
  }
  v5 = [*(id *)(a1 + 32) dryRun];
  if (v3 == v4)
  {
    v6 = objc_alloc_init((Class)SACommandFailed);
    [v6 setErrorCode:SASettingValueUnchangedErrorCode];
    [v6 setReason:@"Value unchanged, No change was made"];
  }
  else
  {
    v6 = 0;
  }
  if (v6) {
    v7 = 1;
  }
  else {
    v7 = v5;
  }
  if (v7)
  {
    v8 = v6;
    if (v6)
    {
      v9 = v8;
      goto LABEL_18;
    }
  }
  else
  {
    v10 = +[DNDModeAssertionService serviceForClientIdentifier:@"com.apple.donotdisturb.siri.assistant"];
    v11 = v10;
    if (v4)
    {
      v12 = objc_alloc_init((Class)DNDMutableModeAssertionDetails);
      [v12 setIdentifier:@"com.apple.donotdisturb.siri.assistant"];
      v13 = +[DNDModeAssertionLifetime lifetimeUntilEndOfScheduleWithIdentifier:DNDDefaultScheduleIdentifier];
      [v12 setLifetime:v13];

      [v12 setReason:1];
      v14 = [v11 takeModeAssertionWithDetails:v12 error:0];
    }
    else
    {
      [v10 invalidateAllActiveModeAssertionsWithError:0];
    }
  }
  v15 = objc_alloc_init((Class)SASettingBooleanEntity);
  [v15 setValue:v4];
  v16 = +[NSNumber numberWithBool:v3];
  [v15 setPreviousValue:v16];

  v9 = objc_alloc_init((Class)SASettingSetBoolResponse);
  [v9 setSetting:v15];

LABEL_18:
  v17 = *(void *)(a1 + 40);
  v18 = [v9 dictionary];
  (*(void (**)(uint64_t, void *))(v17 + 16))(v17, v18);
}

void sub_3498(uint64_t a1)
{
  id v8 = +[DNDStateService serviceForClientIdentifier:@"com.apple.donotdisturb.siri.assistant"];
  v2 = [v8 queryCurrentStateWithError:0];
  id v3 = [v2 isActive];
  id v4 = objc_alloc_init((Class)SASettingBooleanEntity);
  [v4 setValue:v3];
  id v5 = objc_alloc_init((Class)SASettingGetBoolResponse);
  [v5 setSetting:v4];
  uint64_t v6 = *(void *)(a1 + 32);
  v7 = [v5 dictionary];
  (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_release(id a1)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_dryRun(void *a1, const char *a2, ...)
{
  return [a1 dryRun];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_toggle(void *a1, const char *a2, ...)
{
  return [a1 toggle];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}