void sub_1C94(uint64_t a1, void *a2)
{
  unsigned int v3;
  uint64_t v4;
  id v5;
  uint64_t vars8;

  v5 = a2;
  v3 = [v5 isActive];
  v4 = 40;
  if (v3) {
    v4 = 32;
  }
  [*(id *)(a1 + v4) addObject:v5];
}

int64_t sub_1CF8(id a1, NCSComplication *a2, NCSComplication *a3)
{
  v4 = a2;
  v5 = a3;
  uint64_t v6 = [(NCSComplication *)v4 name];
  if (v6
    && (v7 = (void *)v6,
        [(NCSComplication *)v5 name],
        v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        v8))
  {
    v9 = [(NCSComplication *)v4 name];
    v10 = [(NCSComplication *)v5 name];
    id v11 = [v9 localizedCaseInsensitiveCompare:v10];
  }
  else
  {
    v12 = [(NCSComplication *)v4 name];
    if (v12)
    {
    }
    else
    {
      v18 = [(NCSComplication *)v5 name];

      if (v18)
      {
        int64_t v16 = 1;
        goto LABEL_10;
      }
    }
    uint64_t v13 = [(NCSComplication *)v4 name];
    if (v13)
    {
      v14 = (void *)v13;
      v15 = [(NCSComplication *)v5 name];

      if (!v15)
      {
        int64_t v16 = -1;
        goto LABEL_10;
      }
    }
    v9 = [(NCSComplication *)v4 complicationIdentifier];
    v10 = [(NCSComplication *)v5 complicationIdentifier];
    id v11 = [v9 compare:v10];
  }
  int64_t v16 = (int64_t)v11;

LABEL_10:
  return v16;
}

void sub_1E48(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [v3 name];
  v5 = +[PSSpecifier preferenceSpecifierNamed:v4 target:*(void *)(a1 + 32) set:"setActiveState:forSpecifier:" get:"activeStateForSpecifier:" detail:0 cell:-1 edit:0];

  [v5 setComplication:v3];
  uint64_t v6 = [v3 complicationIdentifier];
  [v5 setIdentifier:v6];

  v7 = [*(id *)(a1 + 32) _iconForSpecifier:v5];
  if (v7)
  {
    [v5 setProperty:v7 forKey:PSIconImageKey];
  }
  else
  {
    v8 = [v3 appBundleIdentifier];
    if (v8)
    {
    }
    else
    {
      v9 = [v3 sockPuppetIdentifier];

      if (!v9) {
        goto LABEL_13;
      }
    }
    v10 = [v3 sockPuppetIdentifier];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [v3 appBundleIdentifier];
    }
    uint64_t v13 = v12;

    v14 = +[UIScreen mainScreen];
    v15 = [v14 traitCollection];
    [v15 displayScale];
    if (v16 <= 2.0) {
      uint64_t v17 = 47;
    }
    else {
      uint64_t v17 = 48;
    }

    v18 = +[NanoResourceGrabber sharedInstance];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_208C;
    v19[3] = &unk_4220;
    v19[4] = *(void *)(a1 + 32);
    id v20 = v3;
    [v18 getIconForBundleID:v13 iconVariant:v17 block:v19 timeout:-1.0];
  }
LABEL_13:
  [*(id *)(a1 + 40) addObject:v5];
}

void sub_208C(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_213C;
  block[3] = &unk_41F8;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_213C(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = *(void **)(a1 + 40);
    id v3 = [*(id *)(a1 + 48) complicationIdentifier];
    id v9 = [v2 specifierForID:v3];

    uint64_t v4 = *(void *)(a1 + 32);
    v5 = *(void **)(*(void *)(a1 + 40) + 208);
    id v6 = [*(id *)(a1 + 48) complicationIdentifier];
    [v5 setObject:v4 forKeyedSubscript:v6];

    [v9 setProperty:*(void *)(a1 + 32) forKey:PSIconImageKey];
    v7 = *(void **)(a1 + 40);
    id v8 = [v9 identifier];
    [v7 reloadSpecifierID:v8];
  }
}

void sub_2310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2328(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  v7 = [a2 complicationIdentifier];
  unsigned int v8 = [v7 isEqualToString:*(void *)(a1 + 32)];

  if (v8)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
    *a4 = 1;
  }
}

void sub_249C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Block_object_dispose((const void *)(v11 - 48), 8);
  _Unwind_Resume(a1);
}

id sub_24CC(uint64_t a1, void *a2, uint64_t a3, char *a4)
{
  id result = [a2 isActive];
  if (*(unsigned __int8 *)(a1 + 64) == result)
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
    }
                                                                             + 24) > v7;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    char v8 = 1;
  }
  else
  {
    ++*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    char v8 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  }
  *a4 = v8;
  return result;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend__specifiersFromSettingsManager(void *a1, const char *a2, ...)
{
  return [a1 _specifiersFromSettingsManager];
}

id objc_msgSend_appBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 appBundleIdentifier];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_complication(void *a1, const char *a2, ...)
{
  return [a1 complication];
}

id objc_msgSend_complicationIdentifier(void *a1, const char *a2, ...)
{
  return [a1 complicationIdentifier];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_hasSettings(void *a1, const char *a2, ...)
{
  return [a1 hasSettings];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedSettingsManager(void *a1, const char *a2, ...)
{
  return [a1 sharedSettingsManager];
}

id objc_msgSend_sockPuppetIdentifier(void *a1, const char *a2, ...)
{
  return [a1 sockPuppetIdentifier];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}