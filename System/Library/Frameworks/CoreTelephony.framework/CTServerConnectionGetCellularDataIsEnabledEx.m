@interface CTServerConnectionGetCellularDataIsEnabledEx
@end

@implementation CTServerConnectionGetCellularDataIsEnabledEx

void ___CTServerConnectionGetCellularDataIsEnabledEx_block_invoke(uint64_t a1, xpc_object_t object)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = MEMORY[0x1E4F14590];
  if (object)
  {
    xpc_object_t v4 = object;
    xpc_retain(object);
    xpc_object_t v9 = v4;
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t v9 = v4;
    if (!v4)
    {
LABEL_5:
      xpc_object_t v5 = xpc_null_create();
      xpc_object_t v9 = v5;
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
    if (xpc_dictionary_get_value(v5, "kEnableCellularDataEx"))
    {
      *(void *)buf = &v9;
      v11 = "kEnableCellularDataEx";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, &objecta);
      int v6 = xpc::dyn_cast_or_default((xpc *)&objecta, 0);
      xpc_release(objecta);
    }
    else
    {
      xpc_object_t objecta = 0;
      *(void *)buf = &v9;
      v11 = "kPosixError";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)buf, &objecta);
      if (MEMORY[0x1853203E0](objecta) != MEMORY[0x1E4F145D8]) {
        xpc::dyn_cast_or_default((xpc *)&objecta, 0);
      }
      xpc_release(objecta);
      int v6 = 0;
    }
  }
  else
  {
    int v6 = 0;
  }
  v7 = CTLogPacket();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v6;
    _os_log_impl(&dword_18444A000, v7, OS_LOG_TYPE_DEFAULT, "Calling _CTServerConnectionGetCellularDataIsEnabledEx(): isEnabled = %d", buf, 8u);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  xpc_release(v9);
}

@end