void sub_3048(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;
  uint64_t vars8;

  if ((unint64_t)(a2 + 1) <= 3) {
    [*(id *)(a1 + 32) setValue:(((_BYTE)a2 + 1) & 0xF) == 3];
  }
  v3 = *(void *)(a1 + 48);
  v4 = [*(id *)(a1 + 40) dictionary];
  (*(void (**)(uint64_t, id))(v3 + 16))(v3, v4);
}

void sub_342C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_3454(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_3464(uint64_t a1)
{
}

void sub_346C(uint64_t a1, uint64_t a2)
{
  switch(a2)
  {
    case -1:
      v3 = (objc_class *)SACommandFailed;
      goto LABEL_7;
    case 0:
      goto LABEL_6;
    case 1:
      if (([*(id *)(a1 + 40) value] & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_6;
    case 2:
      if ([*(id *)(a1 + 40) value])
      {
LABEL_4:
        id v4 = objc_alloc((Class)SACommandFailed);
        id v5 = [v4 initWithErrorCode:SASettingValueUnchangedErrorCode];
      }
      else
      {
LABEL_6:
        [*(id *)(a1 + 32) setEffectiveGlobalSpokenNotificationSetting:*(void *)(a1 + 64)];
        v3 = (objc_class *)SACommandSucceeded;
LABEL_7:
        id v5 = objc_alloc_init(v3);
      }
      uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
      v7 = *(void **)(v6 + 40);
      *(void *)(v6 + 40) = v5;

      break;
    default:
      break;
  }
  uint64_t v8 = *(void *)(a1 + 48);
  id v9 = [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) dictionary];
  (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
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

id objc_msgSend_announceSetting(void *a1, const char *a2, ...)
{
  return [a1 announceSetting];
}

id objc_msgSend_appBundleId(void *a1, const char *a2, ...)
{
  return [a1 appBundleId];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_sectionID(void *a1, const char *a2, ...)
{
  return [a1 sectionID];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_timeToReEnable(void *a1, const char *a2, ...)
{
  return [a1 timeToReEnable];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return [a1 value];
}