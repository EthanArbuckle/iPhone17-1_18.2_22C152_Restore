void sub_215217B5C(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;

  if (MarcoShouldLogRegistration())
  {
    if (!qword_267866A28) {
      goto LABEL_8;
    }
    v10 = objc_alloc(MEMORY[0x263F089D8]);
    v11 = (void *)[v10 initWithCapacity:2 * qword_267866A28 + 3];
    if (qword_267866A28)
    {
      v12 = 0;
      do
      {
        [v11 appendString:@"  "];
        ++v12;
      }
      while (v12 < qword_267866A28);
    }
    [v11 appendString:@"=> "];
    if (v11)
    {
      v13 = (id)[[NSString alloc] initWithFormat:@"%@%@", v11, a2];
    }
    else
    {
LABEL_8:
      v13 = a2;
      v11 = 0;
    }
    v14 = (void *)[[NSString alloc] initWithFormat:v13 arguments:&a9];
    MarcoLogRegistration();
  }
}

void sub_215217C98()
{
}

void sub_215217CAC()
{
  if (qword_267866A28) {
    --qword_267866A28;
  }
}

__CFString *FTCServiceNameForServiceType(uint64_t a1)
{
  switch(a1)
  {
    case 0:
      v1 = FTCServiceNameFaceTime;
      return *v1;
    case 1:
      v1 = FTCServiceNameMadrid;
      return *v1;
    case 2:
      v1 = FTCServiceNameCalling;
      return *v1;
  }
  return 0;
}

uint64_t FTCServiceTypeForServiceName(void *a1)
{
  if ([a1 isEqualToString:@"iMessage"]) {
    return 1;
  }
  if ([a1 isEqualToString:@"Calling"]) {
    return 2;
  }
  return 0;
}

FTCServiceAvailabilityCenter *sub_215217D64()
{
  result = objc_alloc_init(FTCServiceAvailabilityCenter);
  qword_26AA5F6D8 = (uint64_t)result;
  return result;
}

uint64_t sub_215218858(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) object];
  return MEMORY[0x270F9A6D0](v1, sel_updateAvailability);
}

uint64_t sub_215218C28(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateAvailability];
}

uint64_t IMDispatchForNotify()
{
  return MEMORY[0x270F3CCF0]();
}

uint64_t IMUserScopedNotification()
{
  return MEMORY[0x270F3CEA0]();
}

uint64_t MarcoLogRegistration()
{
  return MEMORY[0x270F496C8]();
}

uint64_t MarcoShouldLogRegistration()
{
  return MEMORY[0x270F496F0]();
}

uint64_t OSLogHandleForRegistrationCategory()
{
  return MEMORY[0x270F3CF08]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

uint64_t im_dispatch_after_primary_queue()
{
  return MEMORY[0x270F3CFD0]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

void objc_end_catch(void)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

void objc_release(id a1)
{
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

uint64_t os_log_shim_legacy_logging_enabled()
{
  return MEMORY[0x270EDA9C0]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}