@interface CTServerConnectionStandaloneDownloadProfile
@end

@implementation CTServerConnectionStandaloneDownloadProfile

void ___CTServerConnectionStandaloneDownloadProfile_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3 = MEMORY[0x1E4F14590];
  if (object)
  {
    xpc_object_t v4 = object;
    xpc_retain(object);
    xpc_object_t objecta = v4;
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t objecta = v4;
    if (!v4)
    {
LABEL_5:
      xpc_object_t v5 = xpc_null_create();
      xpc_object_t objecta = v5;
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
  uint64_t v6 = *(void *)(a1 + 32);
  if (MEMORY[0x1853203E0](v5) == v3)
  {
    v9[0] = &objecta;
    v9[1] = "kCPStandaloneProfileResult";
    char v8 = 1;
    BOOL v7 = xpc::operator==<BOOL>((uint64_t)v9, (BOOL *)&v8);
  }
  else
  {
    BOOL v7 = 0;
  }
  (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v7);
  xpc_release(objecta);
}

@end