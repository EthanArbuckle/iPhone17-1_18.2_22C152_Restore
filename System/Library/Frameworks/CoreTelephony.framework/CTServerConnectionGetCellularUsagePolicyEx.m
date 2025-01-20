@interface CTServerConnectionGetCellularUsagePolicyEx
@end

@implementation CTServerConnectionGetCellularUsagePolicyEx

void ___CTServerConnectionGetCellularUsagePolicyEx_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3 = MEMORY[0x1E4F14590];
  if (object)
  {
    xpc_object_t v4 = object;
    xpc_retain(object);
    xpc_object_t v14 = v4;
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v14 = v4;
    if (!v4)
    {
LABEL_5:
      xpc_object_t v5 = xpc_null_create();
      xpc_object_t v14 = v5;
      goto LABEL_7;
    }
  }
  if (MEMORY[0x1853203E0](v4) != v3) {
    goto LABEL_5;
  }
  xpc_retain(v4);
  xpc_object_t v5 = v4;
LABEL_7:
  xpc_release(v4);
  if (MEMORY[0x1853203E0](v5) == v3)
  {
    if (xpc_dictionary_get_value(v5, "kCUPolicyKeyDataAllowed"))
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      v6 = Mutable;
      if (Mutable)
      {
        CFMutableDictionaryRef v13 = Mutable;
        CFRetain(Mutable);
        setLegacyCellularDataPolicy(&v13, (uint64_t)&v14);
        CFRelease(v6);
        CFMutableDictionaryRef v12 = v6;
        CFRetain(v6);
        setCellularDataPolicy(&v12, (uint64_t)&v14);
        CFRelease(v6);
        CFMutableDictionaryRef v11 = v6;
        CFRetain(v6);
        setDisallowedCellularDataPolicy(&v11, &v14);
        CFRelease(v6);
        CFMutableDictionaryRef v10 = v6;
        CFRetain(v6);
        setWiFiDataPolicy(&v10, (uint64_t)&v14);
        CFRelease(v6);
      }
      else
      {
        CFMutableDictionaryRef v13 = 0;
        setLegacyCellularDataPolicy(&v13, (uint64_t)&v14);
        CFMutableDictionaryRef v12 = 0;
        setCellularDataPolicy(&v12, (uint64_t)&v14);
        CFMutableDictionaryRef v11 = 0;
        setDisallowedCellularDataPolicy(&v11, &v14);
        CFMutableDictionaryRef v10 = 0;
        setWiFiDataPolicy(&v10, (uint64_t)&v14);
      }
    }
    else
    {
      if (xpc_dictionary_get_value(v14, "kPosixError"))
      {
        v8[0] = &v14;
        v8[1] = "kPosixError";
        xpc::dict::object_proxy::operator xpc::object((uint64_t)v8, &objecta);
        xpc::dyn_cast_or_default((xpc *)&objecta, 0);
        xpc_release(objecta);
      }
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  xpc_release(v14);
  if (v6) {
    CFRelease(v6);
  }
}

@end