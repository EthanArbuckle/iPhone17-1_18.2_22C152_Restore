void sub_28C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  objc_destroyWeak((id *)(v17 - 112));
  _Unwind_Resume(a1);
}

uint64_t sub_28E8(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_28F8(uint64_t a1)
{
}

void sub_2900(uint64_t a1)
{
}

void sub_2910(uint64_t a1)
{
}

void sub_2920(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateCheckedSpecifierFromPreferences];
}

void sub_2A8C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_2AB8(uint64_t a1, int a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v13 = v3;
    uint64_t v14 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = WeakRetained;
    if (a2 == 2)
    {
      v8 = [WeakRetained actAsTeacherSpecifier];
    }
    else if (a2 == 1)
    {
      v8 = [WeakRetained actAsStudentSpecifier];
    }
    else if (a2)
    {
      v8 = 0;
    }
    else
    {
      v8 = [WeakRetained actAsOffSpecifier];
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_2BB0;
    v10[3] = &unk_41B8;
    id v11 = v8;
    v12 = v7;
    id v9 = v8;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
}

void sub_2BB0(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) actAsGroupSpecifier];
  uint64_t v4 = v3;
  if (v2) {
    [v3 setProperty:*(void *)(a1 + 32) forKey:PSRadioGroupCheckedSpecifierKey];
  }
  else {
    [v3 removePropertyForKey:PSRadioGroupCheckedSpecifierKey];
  }

  v5 = *(void **)(a1 + 40);
  id v6 = [v5 actAsGroupSpecifier];
  [v5 reloadSpecifier:v6];
}

void sub_2C5C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a3)
  {
    uint64_t v13 = v3;
    uint64_t v14 = v4;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = [WeakRetained catalogEnvProdSpecifier];
    if (a2 == 1)
    {
      uint64_t v8 = [WeakRetained catalogEnvDevSpecifier];

      v7 = (void *)v8;
    }
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_2D40;
    v10[3] = &unk_41B8;
    id v11 = v7;
    id v12 = WeakRetained;
    id v9 = v7;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v10);
  }
}

void sub_2D40(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) catalogEnvGroupSpecifier];
  uint64_t v4 = v3;
  if (v2) {
    [v3 setProperty:*(void *)(a1 + 32) forKey:PSRadioGroupCheckedSpecifierKey];
  }
  else {
    [v3 removePropertyForKey:PSRadioGroupCheckedSpecifierKey];
  }

  v5 = *(void **)(a1 + 40);
  id v6 = [v5 catalogEnvGroupSpecifier];
  [v5 reloadSpecifier:v6];
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

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend_actAsGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 actAsGroupSpecifier];
}

id objc_msgSend_actAsOffSpecifier(void *a1, const char *a2, ...)
{
  return [a1 actAsOffSpecifier];
}

id objc_msgSend_actAsStudentSpecifier(void *a1, const char *a2, ...)
{
  return [a1 actAsStudentSpecifier];
}

id objc_msgSend_actAsTeacherSpecifier(void *a1, const char *a2, ...)
{
  return [a1 actAsTeacherSpecifier];
}

id objc_msgSend_catalogEnvDevSpecifier(void *a1, const char *a2, ...)
{
  return [a1 catalogEnvDevSpecifier];
}

id objc_msgSend_catalogEnvGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 catalogEnvGroupSpecifier];
}

id objc_msgSend_catalogEnvProdSpecifier(void *a1, const char *a2, ...)
{
  return [a1 catalogEnvProdSpecifier];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_updateCheckedSpecifierFromPreferences(void *a1, const char *a2, ...)
{
  return [a1 updateCheckedSpecifierFromPreferences];
}