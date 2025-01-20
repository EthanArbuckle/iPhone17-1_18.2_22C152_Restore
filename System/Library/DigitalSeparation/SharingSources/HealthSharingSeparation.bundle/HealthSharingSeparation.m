void sub_20D8(uint64_t a1, char a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  HealthDigitalSeparationSharedResource *v10;
  void *v11;
  void (*v12)(void);
  HealthDigitalSeparationSharedResource *v13;
  uint64_t vars8;

  if (a2)
  {
    v3 = *(void **)(a1 + 32);
    v4 = [v3 sharingEntryStore];
    v5 = [v4 sharingEntries];
    v6 = [v3 _outgoingSharingEntriesFromEntries:v5];
    v7 = objc_msgSend(v6, "hk_map:", &stru_4178);

    v8 = [v7 count];
    v9 = *(void *)(a1 + 40);
    if (v8)
    {
      v10 = [[HealthDigitalSeparationSharedResource alloc] initWithDigitalSeparationEntries:v7];
      v13 = v10;
      v11 = +[NSArray arrayWithObjects:&v13 count:1];
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, v11, 0);
    }
    else
    {
      (*(void (**)(uint64_t, void *, void))(v9 + 16))(v9, &__NSArray0__struct, 0);
    }
  }
  else
  {
    v12 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v12();
  }
}

id sub_2270(id a1, HKSummarySharingEntry *a2)
{
  v2 = a2;
  v3 = [[HealthDigitalSeparationEntry alloc] initWithSharingEntry:v2];

  return v3;
}

id sub_23B8(id a1, HealthDigitalSeparationEntry *a2)
{
  return [(HealthDigitalSeparationEntry *)a2 sharingEntry];
}

void sub_281C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_2844(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2854(uint64_t a1)
{
}

void sub_285C(uint64_t a1, char a2, void *a3)
{
  id v9 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void *)(v6 + 40);
    v7 = (id *)(v6 + 40);
    if (!v8) {
      objc_storeStrong(v7, a3);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t sub_28D4(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

id sub_2900(id a1, HKSummarySharingEntry *a2)
{
  v2 = a2;
  if ([(HKSummarySharingEntry *)v2 direction]
    || [(HKSummarySharingEntry *)v2 status] != (char *)&dword_0 + 1
    && [(HKSummarySharingEntry *)v2 status])
  {
    v3 = 0;
  }
  else
  {
    v3 = v2;
  }

  return v3;
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend__appearsToBeEmail(void *a1, const char *a2, ...)
{
  return [a1 _appearsToBeEmail];
}

id objc_msgSend__appearsToBePhoneNumber(void *a1, const char *a2, ...)
{
  return [a1 _appearsToBePhoneNumber];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_digitalEntries(void *a1, const char *a2, ...)
{
  return [a1 digitalEntries];
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return [a1 direction];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return [a1 lastName];
}

id objc_msgSend_primaryContactIdentifier(void *a1, const char *a2, ...)
{
  return [a1 primaryContactIdentifier];
}

id objc_msgSend_sharingEntries(void *a1, const char *a2, ...)
{
  return [a1 sharingEntries];
}

id objc_msgSend_sharingEntry(void *a1, const char *a2, ...)
{
  return [a1 sharingEntry];
}

id objc_msgSend_sharingEntryStore(void *a1, const char *a2, ...)
{
  return [a1 sharingEntryStore];
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return [a1 status];
}