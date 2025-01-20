void sub_2405C1488()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void v7[7];

  v7[6] = *MEMORY[0x263EF8340];
  v0 = (void *)MEMORY[0x263EFFA08];
  v1 = *MEMORY[0x263EFAE58];
  v7[0] = *MEMORY[0x263EFAEB0];
  v7[1] = v1;
  v2 = *MEMORY[0x263EFAE90];
  v7[2] = *MEMORY[0x263EFAE80];
  v7[3] = v2;
  v3 = *MEMORY[0x263EFAF18];
  v7[4] = *MEMORY[0x263EFAE78];
  v7[5] = v3;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v7 count:6];
  v5 = [v0 setWithArray:v4];
  v6 = (void *)qword_26AFC70C0;
  qword_26AFC70C0 = v5;
}

uint64_t sub_2405C1574(uint64_t result)
{
  v1 = (unsigned __int8 *)result;
  if (*(unsigned __int8 *)(result + 48) != *(unsigned __int8 *)(result + 49))
  {
    SetExternalSourceEnabledForDataType();
    result = SetAccountNameEnabledForDataType();
  }
  if (v1[50] != v1[51])
  {
    SetExternalSourceEnabledForDataType();
    result = SetAccountNameEnabledForDataType();
  }
  if (v1[52] != v1[53])
  {
    SetExternalSourceEnabledForDataType();
    result = SetAccountNameEnabledForDataType();
  }
  if (v1[54] != v1[55])
  {
    SetExternalSourceEnabledForDataType();
    return SetAccountNameEnabledForDataType();
  }
  return result;
}

uint64_t SetAccountNameEnabledForDataType()
{
  return MEMORY[0x270F0A568]();
}

uint64_t SetExternalSourceEnabledForDataType()
{
  return MEMORY[0x270F0A570]();
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x270F9A480](cls);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_storeStrong(id *location, id obj)
{
}