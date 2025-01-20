id AEErrorUserInfo(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  unsigned char v25[128];
  uint64_t v26;
  uint64_t vars8;

  v26 = *MEMORY[0x263EF8340];
  v3 = a2;
  if (AEErrorUserInfo_onceToken != -1) {
    dispatch_once(&AEErrorUserInfo_onceToken, &__block_literal_global);
  }
  v4 = *MEMORY[0x263F08320];
  v5 = [v3 objectForKeyedSubscript:*MEMORY[0x263F08320]];
  if (!v5
    || (v6 = (void *)v5,
        [v3 objectForKeyedSubscript:@"NSDescriptionKey"],
        v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6,
        !v7))
  {
    switch(a1)
    {
      case 1:
      case 2:
      case 3:
      case 4:
        v8 = AELocalizedStringFromTableInBundle();
        [0 setObject:v8 forKeyedSubscript:v4];

        break;
      default:
        break;
    }
  }
  v9 = v3;
  v10 = v9;
  if ([0 count])
  {
    v11 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v9];
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v12 = [0 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      v13 = v12;
      v14 = *(void *)v22;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(0);
          }
          v16 = *(void *)(*((void *)&v21 + 1) + 8 * i);
          v17 = [v11 objectForKeyedSubscript:v16];

          if (!v17)
          {
            v18 = [0 objectForKeyedSubscript:v16];
            [v11 setObject:v18 forKeyedSubscript:v16];
          }
        }
        v13 = [0 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v13);
    }
    v10 = (void *)[v11 copy];
  }
  v19 = [MEMORY[0x263F087E8] errorWithDomain:@"AEAssessmentErrorDomain" code:a1 userInfo:v10];

  return v19;
}

id AEErrorUnderlyingError(uint64_t a1, void *a2)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v8 = *MEMORY[0x263F08608];
  v9[0] = a2;
  v3 = NSDictionary;
  id v4 = a2;
  v5 = [v3 dictionaryWithObjects:v9 forKeys:&v8 count:1];

  v6 = AEErrorUserInfo(a1, v5);

  return v6;
}

uint64_t __AEErrorUserInfo_block_invoke()
{
  AEErrorUserInfo_bundle = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];

  return MEMORY[0x270F9A758]();
}

uint64_t AELocalizedStringFromTableInBundle()
{
  return MEMORY[0x270F08458]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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