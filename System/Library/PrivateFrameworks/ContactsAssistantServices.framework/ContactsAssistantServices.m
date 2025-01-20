void sub_21DE82384(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  _Unwind_Resume(exception_object);
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

id GetURLParameters(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v1 = [a1 query];
  v2 = [v1 componentsSeparatedByString:@"&"];

  if (v2 && [v2 count])
  {
    v3 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithCapacity:", objc_msgSend(v2, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      v14 = v2;
      char v7 = 0;
      uint64_t v8 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v4);
          }
          v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) componentsSeparatedByString:@"="];
          if ([v10 count] == 2)
          {
            v11 = [v10 objectAtIndexedSubscript:1];
            v12 = [v10 objectAtIndexedSubscript:0];
            [v3 setObject:v11 forKeyedSubscript:v12];
          }
          else
          {
            char v7 = 1;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v6);

      if ((v7 & 1) == 0)
      {
        v2 = v14;
        goto LABEL_18;
      }
      id v4 = v3;
      v3 = 0;
      v2 = v14;
    }
  }
  else
  {
    v3 = 0;
  }
LABEL_18:

  return v3;
}

id NonEmptyOrNilString(void *a1)
{
  id v1 = a1;
  if ([v1 length]) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id NonEmptyOrNilArray(void *a1)
{
  id v1 = a1;
  if ([v1 count]) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

uint64_t _AFServiceLog()
{
  return MEMORY[0x270F0F078]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void objc_enumerationMutation(id obj)
{
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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