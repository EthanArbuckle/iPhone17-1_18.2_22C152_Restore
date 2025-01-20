uint64_t GRCCopyAllCounterSourceGroup()
{
  uint64_t v0;
  uint64_t v2;

  v2 = 0;
  v0 = GRCCopyAllCounterSourceGroupWithError((uint64_t)&v2);
  if (v2) {
    NSLog(&stru_26CD45870.isa, v2);
  }
  return v0;
}

uint64_t GRCCopyAllCounterSourceGroupWithError(uint64_t a1)
{
  if (GRCCopyAllCounterSourceGroupWithError::onceToken != -1) {
    dispatch_once(&GRCCopyAllCounterSourceGroupWithError::onceToken, &__block_literal_global);
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __GRCCopyAllCounterSourceGroupWithError_block_invoke_2;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)copyAllCounterSourceDispatchQueue, block);
  return [(id)allSourceManagers copy];
}

dispatch_queue_t __GRCCopyAllCounterSourceGroupWithError_block_invoke()
{
  dispatch_queue_t result = dispatch_queue_create("com.GPURawCounter.CopyAllCounterSourceDispatchQueue", 0);
  copyAllCounterSourceDispatchQueue = (uint64_t)result;
  return result;
}

void __GRCCopyAllCounterSourceGroupWithError_block_invoke_2(uint64_t a1)
{
  v40[1] = *MEMORY[0x263EF8340];
  if (!allSourceManagers)
  {
    allSourceManagers = (uint64_t)objc_alloc_init(MEMORY[0x263EFF980]);
    mach_port_t v38 = 0;
    if (MEMORY[0x21D4B2C90](*MEMORY[0x263EF87F0], &v38)
      || (io_iterator_t existing = 0,
          mach_port_t v2 = v38,
          CFDictionaryRef v3 = IOServiceMatching("IOAcceleratorES"),
          IOServiceGetMatchingServices(v2, v3, &existing)))
    {

      allSourceManagers = 0;
      return;
    }
    uint64_t v4 = IOIteratorNext(existing);
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *MEMORY[0x263F08320];
      unint64_t v7 = 0x263F08000uLL;
      do
      {
        v8 = *(id **)(a1 + 32);
        v9 = (void *)MEMORY[0x21D4B2D80]();
        v10 = getenv("CTR_OVERRIDE_BUNDLE");
        if (v10) {
          CFProperty = CFStringCreateWithCString(0, v10, 0x8000100u);
        }
        else {
          CFProperty = IORegistryEntryCreateCFProperty(v5, @"GPURawCounterBundleName", 0, 0);
        }
        v12 = CFProperty;
        if (CFProperty && (CFTypeID v13 = CFGetTypeID(CFProperty), v13 == CFStringGetTypeID()))
        {
          uint64_t v14 = v6;
          uint64_t v15 = objc_msgSend((id)objc_msgSend(@"/System/Library/Extensions", "stringByAppendingPathComponent:", v12), "stringByAppendingString:", @".bundle");
          uint64_t v16 = [MEMORY[0x263F086E0] bundleWithPath:v15];
          if (v16)
          {
            v17 = (void *)v16;
            v18 = getenv("CTR_OVERRIDE_CLASS");
            if (v18) {
              v19 = CFStringCreateWithCString(0, v18, 0x8000100u);
            }
            else {
              v19 = IORegistryEntryCreateCFProperty(v5, @"GPURawCounterPluginClassName", 0, 0);
            }
            v25 = v19;
            if (v19
              && (CFTypeID v26 = CFGetTypeID(v19), v26 == CFStringGetTypeID())
              && (v27 = (objc_class *)[v17 classNamed:v25]) != 0
              && (v28 = v27, [(objc_class *)v27 isSubclassOfClass:objc_opt_class()]))
            {
              id v29 = [v28 alloc];
              if (objc_opt_respondsToSelector())
              {
                v30 = (void *)[v29 initWithAcceleratorPort:v5 error:v8];
                uint64_t v6 = v14;
                if (!v30)
                {
                  char v21 = 0;
                  goto LABEL_50;
                }
LABEL_49:
                [(id)allSourceManagers addObject:v30];
                char v21 = 1;
LABEL_50:
                unint64_t v7 = 0x263F08000;
              }
              else
              {
                uint64_t v34 = [v29 initWithAcceleratorPort:v5];
                uint64_t v6 = v14;
                if (v34)
                {
                  v30 = (void *)v34;
                  goto LABEL_49;
                }
                unint64_t v7 = 0x263F08000uLL;
                if (v8)
                {
                  v35 = (void *)MEMORY[0x263F087E8];
                  uint64_t v39 = v6;
                  v40[0] = [NSString stringWithFormat:@"Fail to instantiate %@", v25, 0];
                  uint64_t v36 = objc_msgSend(v35, "errorWithDomain:code:userInfo:", @"GPURawCounterErrorDomain", -1, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, &v39, 1));
                  v30 = 0;
                  char v21 = 0;
                  id *v8 = (id)v36;
                }
                else
                {
                  v30 = 0;
                  char v21 = 0;
                }
              }
LABEL_35:
              CFRelease(v25);
            }
            else
            {
              uint64_t v6 = v14;
              unint64_t v7 = 0x263F08000uLL;
              if (v8)
              {
                v31 = (void *)MEMORY[0x263F087E8];
                uint64_t v39 = v6;
                v40[0] = [NSString stringWithFormat:@"Fail to find %@ in bundle at \"%@\"!\n", v25, v15, 0];
                id *v8 = (id)objc_msgSend(v31, "errorWithDomain:code:userInfo:", @"GPURawCounterErrorDomain", -1, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, &v39, 1));
              }
              v30 = 0;
              char v21 = 0;
              if (v25) {
                goto LABEL_35;
              }
            }

            goto LABEL_37;
          }
          if (v8)
          {
            v24 = (void *)MEMORY[0x263F087E8];
            uint64_t v39 = v6;
            unint64_t v7 = 0x263F08000uLL;
            v40[0] = [NSString stringWithFormat:@"Fail to load bundle at \"%@\"!\n", v15, 0];
            char v21 = 0;
            id *v8 = (id)objc_msgSend(v24, "errorWithDomain:code:userInfo:", @"GPURawCounterErrorDomain", -1, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, &v39, 1));
          }
          else
          {
            char v21 = 0;
            unint64_t v7 = 0x263F08000;
          }
        }
        else
        {
          if (v8)
          {
            v20 = (void *)MEMORY[0x263F087E8];
            uint64_t v39 = v6;
            v40[0] = objc_msgSend(*(id *)(v7 + 2880), "stringWithFormat:", @"Invalid counter bundle name!\n", 0);
            id *v8 = (id)objc_msgSend(v20, "errorWithDomain:code:userInfo:", @"GPURawCounterErrorDomain", -1, objc_msgSend(NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, &v39, 1));
          }
          char v21 = 0;
          if (!v12)
          {
            if (v8) {
              goto LABEL_20;
            }
            goto LABEL_38;
          }
        }
LABEL_37:
        CFRelease(v12);
        if (v8)
        {
LABEL_20:
          id v22 = *v8;
          id v23 = *v8;
          if ((v21 & 1) == 0) {
            goto LABEL_39;
          }
          goto LABEL_44;
        }
LABEL_38:
        if ((v21 & 1) == 0)
        {
LABEL_39:
          v32 = *(id **)(a1 + 32);
          if (v32 && *v32) {
            v33 = (const char *)objc_msgSend((id)objc_msgSend(*v32, "description"), "UTF8String");
          }
          else {
            v33 = "no vendor error info";
          }
          NSLog(&cfstr_ErrorRegistrin.isa, v5, v33);
        }
LABEL_44:
        uint64_t v5 = IOIteratorNext(existing);
      }
      while (v5);
    }
  }
}

void GRCReleaseAllCounterSourceGroup()
{
  if (copyAllCounterSourceDispatchQueue) {
    dispatch_sync((dispatch_queue_t)copyAllCounterSourceDispatchQueue, &__block_literal_global_9);
  }
}

void __GRCReleaseAllCounterSourceGroup_block_invoke()
{
  allSourceManagers = 0;
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x270EE4A30](cf);
}

void CFRelease(CFTypeRef cf)
{
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x270EE5218]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47A8](*(void *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

void NSLog(NSString *format, ...)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
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

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}