@interface LSRemoveDefaultRoleHandlerForContentType
@end

@implementation LSRemoveDefaultRoleHandlerForContentType

void ___LSRemoveDefaultRoleHandlerForContentType_block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = _LSGetOSStatusFromNSError(v3);
}

void ___LSRemoveDefaultRoleHandlerForContentType_block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (a2)
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    _LSContextUpdate(0, 1, 0);
  }
  else
  {
    *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = _LSGetOSStatusFromNSError(v5);
  }
}

@end