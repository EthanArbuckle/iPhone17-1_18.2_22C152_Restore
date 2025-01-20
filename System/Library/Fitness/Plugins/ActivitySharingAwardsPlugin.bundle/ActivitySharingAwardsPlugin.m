uint64_t sub_223314F78(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__startFriendsQuery);
}

void sub_223315374(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_223315398(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    ASLoggingInitialize();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F23AC8], OS_LOG_TYPE_ERROR)) {
      sub_223315B90();
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateWithFriends:v5];
}

uint64_t sub_2233154C0(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__queue_updateWithFriends_);
}

uint64_t sub_2233156A0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_2233156B0(uint64_t a1)
{
}

void sub_2233156B8(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_queue_friendWithUUID:", *(void *)(a1 + 40));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void sub_223315AC4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_223315AEC(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  v4 = [a2 uniqueName];
  sub_223315AE0();
  _os_log_debug_impl(&dword_223313000, v3, OS_LOG_TYPE_DEBUG, "Responding to resource bundle for template: %@", v5, 0xCu);
}

void sub_223315B90()
{
  sub_223315AE0();
  sub_223315AC4(&dword_223313000, v0, v1, "Error returned from Fitness Friends Query: %{public}@", v2, v3, v4, v5, v6);
}

void sub_223315BF8(void *a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1;
  uint64_t v4 = [a2 UUID];
  sub_223315AE0();
  __int16 v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_223313000, v3, OS_LOG_TYPE_ERROR, "Couldn't find a competition to determine badge style for friend: %{public}@ - %@", v5, 0x16u);
}

void sub_223315CB0()
{
  sub_223315AE0();
  sub_223315AC4(&dword_223313000, v0, v1, "FriendUUID missing from template: %@", v2, v3, v4, v5, v6);
}

void sub_223315D18()
{
  sub_223315AE0();
  sub_223315AC4(&dword_223313000, v0, v1, "Couldn't find friend with UUID: %{public}@", v2, v3, v4, v5, v6);
}

uint64_t ASAchievementLocalizationPathForTemplate()
{
  return MEMORY[0x270F0ABB8]();
}

uint64_t ASCompetitionParticipationResourcePath()
{
  return MEMORY[0x270F0ACA8]();
}

uint64_t ASCompetitionVictoryPropertyListPathForStyle()
{
  return MEMORY[0x270F0ACE0]();
}

uint64_t ASCompetitionVictoryResourcePathForStyle()
{
  return MEMORY[0x270F0ACE8]();
}

uint64_t ASIsCompetitionVictoryTemplate()
{
  return MEMORY[0x270F0ADA0]();
}

uint64_t ASLoggingInitialize()
{
  return MEMORY[0x270F0ADA8]();
}

uint64_t FILocalizedDayName()
{
  return MEMORY[0x270F29A98]();
}

uint64_t HKCreateSerialDispatchQueue()
{
  return MEMORY[0x270EF3660]();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}