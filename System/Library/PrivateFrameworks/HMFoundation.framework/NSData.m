@interface NSData
@end

@implementation NSData

uint64_t __40__NSData_HMFoundation__shortDescription__block_invoke()
{
  _MergedGlobals_55 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"<>"];
  return MEMORY[0x1F41817F8]();
}

uint64_t __36__NSData_HMFoundation__hmf_isZeroed__block_invoke(uint64_t result, unsigned __int8 *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  if (a4)
  {
    while (!*a2++)
    {
      if (!--a4) {
        return result;
      }
    }
    *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 0;
    if (a5) {
      *a5 = 1;
    }
  }
  return result;
}

uint64_t __57__NSData_HMFoundation__hmf_hexadecimalStringWithOptions___block_invoke(uint64_t result, unsigned __int8 *a2, uint64_t a3, uint64_t a4)
{
  for (; a4; --a4)
  {
    unsigned int v5 = *a2++;
    unsigned int v4 = v5;
    if (v5 < 0xA0)
    {
      char v6 = 48;
    }
    else if (*(unsigned char *)(result + 40))
    {
      char v6 = 87;
    }
    else
    {
      char v6 = 55;
    }
    uint64_t v7 = *(void *)(*(void *)(result + 32) + 8);
    v8 = *(unsigned char **)(v7 + 24);
    *(void *)(v7 + 24) = v8 + 1;
    unsigned char *v8 = v6 + (v4 >> 4);
    unsigned int v9 = v4 & 0xF;
    if (v9 < 0xA)
    {
      char v10 = 48;
    }
    else if (*(unsigned char *)(result + 40))
    {
      char v10 = 87;
    }
    else
    {
      char v10 = 55;
    }
    char v11 = v10 + v9;
    uint64_t v12 = *(void *)(*(void *)(result + 32) + 8);
    v13 = *(unsigned char **)(v12 + 24);
    *(void *)(v12 + 24) = v13 + 1;
    unsigned char *v13 = v11;
  }
  return result;
}

@end