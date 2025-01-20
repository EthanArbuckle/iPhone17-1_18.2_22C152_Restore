@interface CTServerConnectionGetCellularUsageWorkspaceInfoEx
@end

@implementation CTServerConnectionGetCellularUsageWorkspaceInfoEx

void ___CTServerConnectionGetCellularUsageWorkspaceInfoEx_block_invoke(uint64_t a1, xpc_object_t object)
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
    v11 = &v14;
    v12 = "kCUWorkspaceInfo";
    xpc_object_t v13 = 0;
    xpc::dict::object_proxy::operator xpc::object((uint64_t)&v11, &v13);
    uint64_t v7 = MEMORY[0x1853203E0](v13);
    uint64_t v9 = MEMORY[0x1E4F145D8];
    if (v7 == MEMORY[0x1E4F145D8])
    {
      xpc_object_t objecta = 0;
      v11 = &v14;
      v12 = "kPosixError";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)&v11, &objecta);
      if (MEMORY[0x1853203E0](objecta) != v9) {
        xpc::dyn_cast_or_default((xpc *)&objecta, 0);
      }
      xpc_release(objecta);
      v6 = 0;
    }
    else
    {
      xpc::bridge((uint64_t *)&objecta, (xpc *)&v13, v8);
      ctu::cf::CFSharedRef<__CFDictionary const>::CFSharedRef<void const,void>(&v11, (CFTypeRef *)&objecta);
      v6 = v11;
      v11 = 0;
      if (objecta) {
        CFRelease(objecta);
      }
    }
    xpc_release(v13);
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