@interface CTServerConnectionEraseCellularDataUsageRecordsEx
@end

@implementation CTServerConnectionEraseCellularDataUsageRecordsEx

void ___CTServerConnectionEraseCellularDataUsageRecordsEx_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v3 = MEMORY[0x1E4F14590];
  if (object)
  {
    xpc_object_t v4 = object;
    xpc_retain(object);
    xpc_object_t v8 = v4;
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v8 = v4;
    if (!v4)
    {
LABEL_5:
      xpc_object_t v5 = xpc_null_create();
      xpc_object_t v8 = v5;
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
    v6[0] = &v8;
    v6[1] = "kPosixError";
    xpc_object_t objecta = 0;
    xpc::dict::object_proxy::operator xpc::object((uint64_t)v6, &objecta);
    if (MEMORY[0x1853203E0](objecta) != MEMORY[0x1E4F145D8]) {
      xpc::dyn_cast_or_default((xpc *)&objecta, 0);
    }
    xpc_release(objecta);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  xpc_release(v8);
}

@end