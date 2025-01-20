@interface SYMultiSuspendableQueue
@end

@implementation SYMultiSuspendableQueue

_DWORD *__64___SYMultiSuspendableQueue_initWithName_qosClass_serial_target___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = [WeakRetained stateForLogging];
    v4 = [v3 data];
    v5 = malloc_type_calloc(1uLL, [v4 length] + 200, 0x40CF3819uLL);
    _DWORD *v5 = 2;
    __strlcpy_chk();
    __strlcpy_chk();
    v5[1] = [v4 length];
    __strlcpy_chk();
    objc_msgSend(v4, "getBytes:length:", v5 + 50, objc_msgSend(v4, "length"));
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end