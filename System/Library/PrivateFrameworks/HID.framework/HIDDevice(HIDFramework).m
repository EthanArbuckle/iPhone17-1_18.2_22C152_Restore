@interface HIDDevice(HIDFramework)
- (BOOL)conformsToUsagePage:()HIDFramework usage:;
- (BOOL)getReport:()HIDFramework reportLength:withIdentifier:forType:error:timeout:callback:;
- (BOOL)openWithOptions:()HIDFramework error:;
- (BOOL)setProperty:()HIDFramework forKey:;
- (BOOL)setReport:()HIDFramework reportLength:withIdentifier:forType:error:timeout:callback:;
- (CFArrayRef)elementsMatching:()HIDFramework;
- (CFTypeRef)propertyForKey:()HIDFramework;
- (IOHIDDeviceRef)initWithService:()HIDFramework;
- (uint64_t)close;
- (uint64_t)commitElements:()HIDFramework direction:error:;
- (uint64_t)commitElements:()HIDFramework direction:error:timeout:callback:;
- (uint64_t)getReport:()HIDFramework reportLength:withIdentifier:forType:error:;
- (uint64_t)open;
- (uint64_t)setReport:()HIDFramework reportLength:withIdentifier:forType:error:;
- (void)activate;
- (void)setBatchInputElementHandler:()HIDFramework;
- (void)setCancelHandler:()HIDFramework;
- (void)setDispatchQueue:()HIDFramework;
- (void)setInputElementHandler:()HIDFramework;
- (void)setInputElementMatching:()HIDFramework;
- (void)setInputReportHandler:()HIDFramework;
- (void)setRemovalHandler:()HIDFramework;
@end

@implementation HIDDevice(HIDFramework)

- (IOHIDDeviceRef)initWithService:()HIDFramework
{
  IOHIDDeviceRef v4 = IOHIDDeviceCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80], service);

  return v4;
}

- (CFTypeRef)propertyForKey:()HIDFramework
{
  return IOHIDDeviceGetProperty(a1, key);
}

- (BOOL)setProperty:()HIDFramework forKey:
{
  return IOHIDDeviceSetProperty(a1, key, a3) != 0;
}

- (BOOL)conformsToUsagePage:()HIDFramework usage:
{
  return IOHIDDeviceConformsTo(a1, usagePage, usage) != 0;
}

- (CFArrayRef)elementsMatching:()HIDFramework
{
  CFArrayRef v3 = IOHIDDeviceCopyMatchingElements(a1, matching, 0);
  return v3;
}

- (uint64_t)setReport:()HIDFramework reportLength:withIdentifier:forType:error:
{
  return [a1 setReport:a3 reportLength:a4 withIdentifier:a5 forType:a6 error:a7 timeout:0 callback:0];
}

- (BOOL)setReport:()HIDFramework reportLength:withIdentifier:forType:error:timeout:callback:
{
  id v16 = a9;
  v17 = v16;
  if (v16)
  {
    v18 = _Block_copy(v16);
    uint64_t v19 = IOHIDDeviceSetReportWithCallback(a1, a6, a5, a3, a4, (double)a8, (IOHIDReportCallback)asyncReportCallback, v18);
  }
  else
  {
    uint64_t v19 = IOHIDDeviceSetReport(a1, a6, a5, a3, a4);
  }
  int v20 = v19;
  if (a7)
  {
    if (v19)
    {
      *a7 = [MEMORY[0x1E4F28C58] errorWithIOReturn:v19];
      if (v17) {
        _Block_release(v17);
      }
    }
  }

  return v20 == 0;
}

- (uint64_t)getReport:()HIDFramework reportLength:withIdentifier:forType:error:
{
  return [a1 getReport:a3 reportLength:a4 withIdentifier:a5 forType:a6 error:a7 timeout:0 callback:0];
}

- (BOOL)getReport:()HIDFramework reportLength:withIdentifier:forType:error:timeout:callback:
{
  id v16 = a9;
  v17 = v16;
  CFIndex pReportLength = *a4;
  if (v16)
  {
    v18 = _Block_copy(v16);
    uint64_t ReportWithCallback = IOHIDDeviceGetReportWithCallback(a1, a6, a5, a3, &pReportLength, (double)a8, (IOHIDReportCallback)asyncReportCallback, v18);
    if (!a7) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t ReportWithCallback = IOHIDDeviceGetReport(a1, a6, a5, a3, &pReportLength);
    *a4 = pReportLength;
    if (!a7) {
      goto LABEL_8;
    }
  }
  if (ReportWithCallback)
  {
    *a7 = [MEMORY[0x1E4F28C58] errorWithIOReturn:ReportWithCallback];
    if (v17) {
      _Block_release(v17);
    }
  }
LABEL_8:

  return ReportWithCallback == 0;
}

- (uint64_t)commitElements:()HIDFramework direction:error:
{
  return [a1 commitElements:a3 direction:a4 error:a5 timeout:0 callback:0];
}

- (uint64_t)commitElements:()HIDFramework direction:error:timeout:callback:
{
  id v12 = a3;
  id v13 = a7;
  uint64_t v14 = a1 + (int)*MEMORY[0x1E4F2EED8];
  os_unfair_recursive_lock_lock_with_options();
  v15 = *(HIDTransaction **)(v14 + 256);
  if (!v15)
  {
    v15 = [[HIDTransaction alloc] initWithDevice:a1];
    *(void *)(v14 + 256) = v15;
  }
  id v16 = v15;
  [(HIDTransaction *)v16 setDirection:a4 != 0];
  if (v13) {
    uint64_t v17 = [(HIDTransaction *)v16 commitElements:v12 error:a5 timeout:a6 callback:v13];
  }
  else {
    uint64_t v17 = [(HIDTransaction *)v16 commitElements:v12 error:a5];
  }
  uint64_t v18 = v17;
  os_unfair_recursive_lock_unlock();

  return v18;
}

- (void)setInputElementMatching:()HIDFramework
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  CFDictionaryRef v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      -[HIDDevice(HIDFramework) setInputElementMatching:](&v9, v10);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([(__CFDictionary *)v8 count])
    {
      IOHIDDeviceRef v4 = a1;
      CFDictionaryRef v5 = v8;
    }
    else
    {
      IOHIDDeviceRef v4 = a1;
      CFDictionaryRef v5 = 0;
    }
    IOHIDDeviceSetInputValueMatching(v4, v5);
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([(__CFDictionary *)v8 count])
      {
        v6 = a1;
        CFArrayRef v7 = v8;
      }
      else
      {
        v6 = a1;
        CFArrayRef v7 = 0;
      }
      IOHIDDeviceSetInputValueMatchingMultiple(v6, v7);
    }
  }
}

- (void)setInputElementHandler:()HIDFramework
{
  id v4 = a3;
  if (atomic_exchange((atomic_ullong *volatile)((char *)a1 + *MEMORY[0x1E4F2EED8] + 312), (unint64_t)_Block_copy(v4)))
  {
    -[HIDManager setInputElementHandler:]();
  }
  IOHIDDeviceRegisterInputValueCallback(a1, (IOHIDValueCallback)inputValueCallback_0, a1);
}

- (void)setBatchInputElementHandler:()HIDFramework
{
  id v4 = a3;
  CFDictionaryRef v5 = (atomic_ullong *)((char *)a1 + (int)*MEMORY[0x1E4F2EED8]);
  id v6 = v4;
  if (atomic_exchange(v5 + 39, (unint64_t)_Block_copy(v4))) {
    -[HIDManager setInputElementHandler:]();
  }
  v5[35] = (atomic_ullong)CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D510]);
  IOHIDDeviceRegisterInputValueCallback(a1, (IOHIDValueCallback)batchInputValueCallback, a1);
}

- (void)setRemovalHandler:()HIDFramework
{
  id v4 = a3;
  if (atomic_exchange((atomic_ullong *volatile)((char *)a1 + *MEMORY[0x1E4F2EED8] + 320), (unint64_t)_Block_copy(v4)))
  {
    -[HIDServiceClient(HIDFramework) setRemovalHandler:]();
  }
  IOHIDDeviceRegisterRemovalCallback(a1, (IOHIDCallback)removalCallback, a1);
}

- (void)setInputReportHandler:()HIDFramework
{
  id v4 = a3;
  CFDictionaryRef v5 = &a1[*MEMORY[0x1E4F2EED8]];
  id v13 = v4;
  if (atomic_exchange((atomic_ullong *volatile)v5 + 41, (unint64_t)_Block_copy(v4))) {
    -[HIDManager setInputReportHandler:]();
  }
  id v6 = [a1 propertyForKey:@"MaxInputReportSize"];
  CFArrayRef v7 = v6;
  if (v6) {
    CFIndex v8 = [v6 unsignedIntegerValue];
  }
  else {
    CFIndex v8 = 1;
  }
  uint64_t v9 = (__CFData *)*((void *)v5 + 34);
  if (!v9)
  {
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v8);
    *((void *)v5 + 34) = Mutable;
    CFDataSetLength(Mutable, v8);
    uint64_t v9 = (__CFData *)*((void *)v5 + 34);
  }
  MutableBytePtr = CFDataGetMutableBytePtr(v9);
  CFIndex Length = CFDataGetLength(*((CFDataRef *)v5 + 34));
  IOHIDDeviceRegisterInputReportWithTimeStampCallback((IOHIDDeviceRef)a1, MutableBytePtr, Length, (IOHIDReportWithTimeStampCallback)inputReportCallback_0, a1);
}

- (void)setCancelHandler:()HIDFramework
{
}

- (void)setDispatchQueue:()HIDFramework
{
}

- (uint64_t)open
{
  return IOHIDDeviceOpen(a1, 0);
}

- (BOOL)openWithOptions:()HIDFramework error:
{
  uint64_t v5 = IOHIDDeviceOpen(a1, options);
  int v6 = v5;
  if (a4 && v5)
  {
    *a4 = [MEMORY[0x1E4F28C58] errorWithIOReturn:v5];
  }
  return v6 == 0;
}

- (uint64_t)close
{
  return IOHIDDeviceClose(a1, 0);
}

- (void)activate
{
  v2 = &a1[*MEMORY[0x1E4F2EED8]];
  os_unfair_recursive_lock_lock_with_options();
  if (*((void *)v2 + 35))
  {
    if (*((void *)v2 + 30)) {
      objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithArray:");
    }
    else {
    CFArrayRef v3 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithObjects:", &unk_1F35BDFC8, &unk_1F35BDFF0, &unk_1F35BE018, &unk_1F35BE040, 0);
    }
    [v3 addObject:&unk_1F35BE068];
    os_unfair_recursive_lock_unlock();
    [a1 setInputElementMatching:v3];
  }
  else
  {
    os_unfair_recursive_lock_unlock();
  }
  IOHIDDeviceActivate((IOHIDDeviceRef)a1);
}

- (void)setInputElementMatching:()HIDFramework .cold.1(void *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

@end