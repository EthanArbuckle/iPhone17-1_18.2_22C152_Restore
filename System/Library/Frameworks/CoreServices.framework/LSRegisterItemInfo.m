@interface LSRegisterItemInfo
@end

@implementation LSRegisterItemInfo

uint64_t ___LSRegisterItemInfo_block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = _LSGetOSStatusFromNSError(a2);
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  return result;
}

void ___LSRegisterItemInfo_block_invoke_2(void *a1, char a2, int a3, void *a4, char a5, void *a6)
{
  CFArrayRef theArray = a4;
  id v11 = a6;
  v12 = v11;
  if (a2)
  {
    v13 = (_DWORD *)a1[5];
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = 0;
    if (v13) {
      _DWORD *v13 = a3;
    }
    v14 = (void *)a1[6];
    if (v14)
    {
      if (theArray) {
        *(void *)a1[6] = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, theArray);
      }
      else {
        void *v14 = 0;
      }
    }
    v15 = (unsigned char *)a1[7];
    if (v15) {
      unsigned char *v15 = a5;
    }
  }
  else
  {
    *(_DWORD *)(*(void *)(a1[4] + 8) + 24) = _LSGetOSStatusFromNSError(v11);
  }
}

@end