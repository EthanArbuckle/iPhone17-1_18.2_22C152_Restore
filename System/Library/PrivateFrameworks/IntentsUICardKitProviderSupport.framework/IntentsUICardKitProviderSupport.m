void sub_2309921B8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_230994BC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id a24)
{
}

id _INUICKPInteractionMatchingCardSectionInCard(uint64_t a1, void *a2)
{
  v2 = [a2 interactions];
  v3 = [v2 anyObject];

  return v3;
}

uint64_t _INUICKPIntrinsicInteractiveBehaviorForCardSection(void *a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v1 = a1;
  v2 = objc_msgSend((id)objc_opt_class(), "inuickp_interactiveBehaviorPrecedenceOrder");
  uint64_t v18 = [v2 count];
  uint64_t v3 = objc_msgSend(v1, "inuickp_intrinsicInteractiveBehavior");
  v4 = [NSNumber numberWithUnsignedInteger:v3];
  v19 = v2;
  uint64_t v5 = [v2 indexOfObject:v4];

  if (objc_opt_respondsToSelector())
  {
    id v17 = v1;
    v6 = [v1 actionCommands];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      unint64_t v9 = v18 - v5;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v6);
          }
          v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v13 = objc_msgSend(v12, "inuickp_intrinsicInteractiveBehavior");
            v14 = [NSNumber numberWithUnsignedInteger:v13];
            unint64_t v15 = v18 - [v19 indexOfObject:v14];

            if (v15 > v9)
            {
              unint64_t v9 = v15;
              uint64_t v3 = v13;
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v8);
    }

    id v1 = v17;
  }

  return v3;
}

id INUICKPInterfaceSectionsFromCard(void *a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v1 = a1;
  id v2 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v16 = v1;
  uint64_t v3 = [v1 cardSections];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v18;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v17 + 1) + 8 * v7);
        uint64_t v9 = objc_opt_respondsToSelector();
        if (v9)
        {
          uint64_t v10 = _INUICKPInteractionMatchingCardSectionInCard(v9, v16);
          v11 = [v8 parametersForInteraction:v10];
        }
        else
        {
          v12 = *MEMORY[0x263F31630];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x263F31630], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            long long v22 = v8;
            _os_log_error_impl(&dword_230990000, v12, OS_LOG_TYPE_ERROR, "Card section %@ doesn't respond to parametersForInteraction:", buf, 0xCu);
          }
          v11 = 0;
        }
        uint64_t v13 = [[INUICKPCardInterfaceSection alloc] initWithInteractiveBehavior:_INUICKPIntrinsicInteractiveBehaviorForCardSection(v8) parameters:v11];
        [(INUICKPCardInterfaceSection *)v13 setCardSection:v8];
        [v2 addObject:v13];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v5);
  }

  v14 = (void *)[v2 copy];
  return v14;
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t _INUIUtilitiesBestFittingSizeForSizeBySystemVersionDictionary()
{
  return MEMORY[0x270EF52E0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
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

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}