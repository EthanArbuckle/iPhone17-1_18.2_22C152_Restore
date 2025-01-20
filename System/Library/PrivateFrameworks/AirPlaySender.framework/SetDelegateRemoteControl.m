@interface SetDelegateRemoteControl
@end

@implementation SetDelegateRemoteControl

double __carEndpoint_SetDelegateRemoteControl_block_invoke(uint64_t a1)
{
  v2 = *(const void **)(*(void *)(a1 + 32) + 192);
  if (v2)
  {
    CFRelease(v2);
    *(void *)(*(void *)(a1 + 32) + 192) = 0;
  }
  v3 = *(_OWORD **)(a1 + 40);
  v4 = (_OWORD *)(*(void *)(a1 + 32) + 156);
  if (v3)
  {
    long long v5 = v3[1];
    _OWORD *v4 = *v3;
    v4[1] = v5;
    *(void *)(*(void *)(a1 + 32) + 192) = FigCFWeakReferenceHolderCreateWithReferencedObject();
  }
  else
  {
    double result = 0.0;
    _OWORD *v4 = 0u;
    v4[1] = 0u;
  }
  return result;
}

@end