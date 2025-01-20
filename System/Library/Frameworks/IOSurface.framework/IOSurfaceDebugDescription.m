@interface IOSurfaceDebugDescription
+ (id)surfaceDescriptions;
@end

@implementation IOSurfaceDebugDescription

+ (id)surfaceDescriptions
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  outputStruct = 0;
  uint64_t input = 1;
  size_t v19 = -3;
  mach_port_t v2 = _ioSurfaceConnect();
  if (IOConnectCallMethod(v2, 0x1Eu, &input, 1u, 0, 0, 0, 0, &outputStruct, &v19)) {
    return 0;
  }
  CFStringRef errorString = 0;
  CFTypeRef v4 = IOCFUnserializeBinary(outputStruct, v19, 0, 0, &errorString);
  if (!v4)
  {
    if (errorString)
    {
      NSLog(&cfstr_FailedToUnseri.isa, errorString);
      CFRelease(errorString);
    }
    else
    {
      NSLog(&cfstr_FailedToUnseri_0.isa);
    }
    mach_vm_deallocate(*MEMORY[0x1E4F14960], (mach_vm_address_t)outputStruct, v19);
    return 0;
  }
  v5 = (void *)v4;
  mach_vm_deallocate(*MEMORY[0x1E4F14960], (mach_vm_address_t)outputStruct, v19);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7 = (void *)[v5 objectForKey:@"Kernel Surfaces"];
  if (v7)
  {
    id v8 = _copyDescriptions(v7);
    [v6 setObject:v8 forKey:&unk_1EFE15230];
  }
  v9 = (void *)[v5 objectForKey:@"User Clients"];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        uint64_t v15 = [v14 objectForKey:@"pid"];
        if (v15)
        {
          uint64_t v16 = v15;
          id v17 = _copyDescriptions((void *)[v14 objectForKey:@"Client Surfaces"]);
          [v6 setObject:v17 forKey:v16];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v22 count:16];
    }
    while (v11);
  }

  return v6;
}

@end