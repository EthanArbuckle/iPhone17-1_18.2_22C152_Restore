@interface CTServerConnectionProbeSIMConnectivityStatus
@end

@implementation CTServerConnectionProbeSIMConnectivityStatus

void ___CTServerConnectionProbeSIMConnectivityStatus_block_invoke(uint64_t a1, xpc_object_t object)
{
  CFTypeRef cf = 0;
  uint64_t v3 = MEMORY[0x1E4F14590];
  if (object)
  {
    xpc_object_t v4 = object;
    xpc_retain(object);
    xpc_object_t xdict = v4;
  }
  else
  {
    xpc_object_t v4 = xpc_null_create();
    xpc_object_t xdict = v4;
    if (!v4)
    {
LABEL_5:
      xpc_object_t v5 = xpc_null_create();
      xpc_object_t xdict = v5;
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
    if (xpc_dictionary_get_value(v5, "kCPProbeSIMConnectivityStatus"))
    {
      v6[0] = &xdict;
      v6[1] = "kCPProbeSIMConnectivityStatus";
      xpc::dict::object_proxy::operator xpc::object((uint64_t)v6, &objecta);
      xpc::dyn_cast_or_default((xpc *)&objecta, 0);
      xpc_release(objecta);
      xpc_object_t v5 = xdict;
    }
    if (xpc_dictionary_get_value(v5, "kCPProbeSIMConnectivityError"))
    {
      xpc_dictionary_get_value(xdict, "kCPProbeSIMConnectivityError");
      v6[0] = (CFTypeRef)_CFXPCCreateCFObjectFromXPCObject();
      ctu::cf::CFSharedRef<__CFError>::operator=<void const,void>(&cf, v6);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  xpc_release(xdict);
  if (cf) {
    CFRelease(cf);
  }
}

@end