id defaultFormatter()
{
  void *v0;
  uint64_t vars8;

  if (defaultFormatter_onceToken != -1) {
    dispatch_once(&defaultFormatter_onceToken, &__block_literal_global_749);
  }
  v0 = (void *)defaultFormatter_formatter;
  return v0;
}

void sub_22A2CE968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_22A2CEBDC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

id getSubstring(void *a1, void *a2, void *a3, int a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = a3;
  v10 = v9;
  if (a4) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = 0;
  }
  if (v8)
  {
    uint64_t v12 = [v7 rangeOfString:v8];
    if (!v13)
    {
LABEL_8:
      v17 = 0;
      goto LABEL_12;
    }
    uint64_t v14 = v12 + v13;
    if (v10) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v15 = 0;
    goto LABEL_11;
  }
  uint64_t v14 = 0;
  if (!v9) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v15 = [v7 rangeOfString:v10 options:v11];
  if (!v16) {
    goto LABEL_8;
  }
LABEL_11:
  v17 = objc_msgSend(v7, "substringWithRange:", v14, v15 - v14);
LABEL_12:

  return v17;
}

__CFString *getIntervalString(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v5 = v4;
  if (v4)
  {
    char v6 = [v4 isEqualToDate:v3];
    double v7 = 0.5;
    double v8 = 0.5;
    if (v6) {
      goto LABEL_3;
    }
    objc_msgSend(v5, "timeIntervalSinceDate:", v3, 0.5, 0.5);
    if (v7 >= 0.0)
    {
      if (v7 >= 3600.0)
      {
        id v9 = @"hours";
        double v8 = v7 / 3600.0;
LABEL_5:
        v10 = [NSString stringWithFormat:@"%3.2lf %@", *(void *)&v8, v9];
        goto LABEL_8;
      }
      if (v7 >= 60.0) {
        double v8 = v7 / 60.0;
      }
      else {
        double v8 = v7;
      }
LABEL_3:
      id v9 = @"minutes";
      if (v7 < 60.0) {
        id v9 = @"seconds";
      }
      goto LABEL_5;
    }
  }
  v10 = &stru_26DDDA0E0;
LABEL_8:

  return v10;
}

void sub_22A2D4D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
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

void sub_22A2D5004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __defaultFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = (void *)defaultFormatter_formatter;
  defaultFormatter_formatter = (uint64_t)v0;

  [(id)defaultFormatter_formatter setDateStyle:1];
  [(id)defaultFormatter_formatter setTimeStyle:2];
  v2 = (void *)defaultFormatter_formatter;
  id v3 = [MEMORY[0x263EFFA18] localTimeZone];
  [v2 setTimeZone:v3];
}

void __timeOnlyFormatter_block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x263F08790]);
  uint64_t v1 = (void *)timeOnlyFormatter_timeOnlyFormatter;
  timeOnlyFormatter_timeOnlyFormatter = (uint64_t)v0;

  [(id)timeOnlyFormatter_timeOnlyFormatter setDateStyle:0];
  [(id)timeOnlyFormatter_timeOnlyFormatter setTimeStyle:2];
  v2 = (void *)timeOnlyFormatter_timeOnlyFormatter;
  id v3 = [MEMORY[0x263EFFA18] localTimeZone];
  [v2 setTimeZone:v3];
}

void NSLog(NSString *format, ...)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}