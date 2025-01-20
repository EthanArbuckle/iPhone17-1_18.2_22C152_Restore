id getErrorCascading(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  void v16[2];
  uint64_t vars8;

  v16[1] = *MEMORY[0x263EF8340];
  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (!v3)
  {
    v6 = v4;
    v7 = v6;
    if (v6
      && (v8 = *MEMORY[0x263F225D0],
          [v6 objectForKeyedSubscript:*MEMORY[0x263F225D0]],
          v9 = objc_claimAutoreleasedReturnValue(),
          objc_opt_class(),
          isKindOfClass = objc_opt_isKindOfClass(),
          v9,
          (isKindOfClass & 1) != 0))
    {
      v11 = (void *)MEMORY[0x263F087E8];
      v15 = *MEMORY[0x263F08320];
      v12 = [v7 objectForKeyedSubscript:v8];
      v16[0] = v12;
      v13 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];
      v3 = [v11 errorWithDomain:@"AXContainerManager" code:0 userInfo:v13];
    }
    else
    {
      v3 = 0;
    }
  }
  return v3;
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
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