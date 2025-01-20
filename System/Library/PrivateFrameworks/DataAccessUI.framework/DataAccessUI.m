id validPathsForPaths(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  id v11;
  char v13;
  long long v14;
  long long v15;
  long long v16;
  long long v17;
  unsigned char v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = [MEMORY[0x263F08850] defaultManager];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v3 = v1;
  v4 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v3);
        }
        v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v13 = 0;
        if (([v2 fileExistsAtPath:v9 isDirectory:&v13] & 1) == 0)
        {
          if (!v6) {
            v6 = (void *)[v3 mutableCopy];
          }
          [v6 removeObject:v9];
        }
      }
      v5 = [v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  if (v6) {
    v10 = v6;
  }
  else {
    v10 = v3;
  }
  v11 = v10;

  return v11;
}

void sub_22CA40574(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int buf, long long a12)
{
  if (a2 == 1)
  {
    id v12 = objc_begin_catch(a1);
    v13 = DALoggingwithCategory();
    os_log_type_t v14 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v13, v14))
    {
      buf = 138412546;
      WORD2(a12) = 2112;
      *(void *)((char *)&a12 + 6) = v12;
      _os_log_impl(&dword_22CA3B000, v13, v14, "Parsing host string \"%@\" led to exception %@", (uint8_t *)&buf, 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x22CA40494);
  }
  _Unwind_Resume(a1);
}

id DAAccountDescriptionFromHostname(void *a1)
{
  id v1 = a1;
  v2 = [v1 componentsSeparatedByString:@"."];
  if ([v2 count] == 1 || objc_msgSend(v2, "count") != 2)
  {
    id v4 = v1;
  }
  else
  {
    v3 = [v2 objectAtIndexedSubscript:0];
    id v4 = [v3 capitalizedString];
  }

  return v4;
}

SInt32 CFUserNotificationDisplayAlert(CFTimeInterval timeout, CFOptionFlags flags, CFURLRef iconURL, CFURLRef soundURL, CFURLRef localizationURL, CFStringRef alertHeader, CFStringRef alertMessage, CFStringRef defaultButtonTitle, CFStringRef alternateButtonTitle, CFStringRef otherButtonTitle, CFOptionFlags *responseFlags)
{
  return MEMORY[0x270EE54D8](flags, iconURL, soundURL, localizationURL, alertHeader, alertMessage, defaultButtonTitle, alternateButtonTitle, timeout);
}

uint64_t DALoggingwithCategory()
{
  return MEMORY[0x270F25140]();
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t PSPIDForProcessNamed()
{
  return MEMORY[0x270F552A8]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t dataaccess_get_global_queue()
{
  return MEMORY[0x270F250F0]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

int kill(pid_t a1, int a2)
{
  return MEMORY[0x270ED9F70](*(void *)&a1, *(void *)&a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
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

int truncate(const char *a1, off_t a2)
{
  return MEMORY[0x270EDB978](a1, a2);
}