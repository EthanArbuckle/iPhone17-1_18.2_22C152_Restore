@interface NSBPlistMappedString
@end

@implementation NSBPlistMappedString

uint64_t __46___NSBPlistMappedString__fastCStringContents___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  return 1;
}

uint64_t __45___NSBPlistMappedString_getCharacters_range___block_invoke(void *a1, uint64_t a2, unint64_t a3)
{
  char v5 = dyld_program_sdk_at_least();
  unint64_t v6 = a1[6];
  uint64_t v7 = a1[7];
  if (v7 + v6 >= a3) {
    unint64_t v8 = a3;
  }
  else {
    unint64_t v8 = v7 + v6;
  }
  if (v7 + v6) {
    BOOL v9 = v6 == 0;
  }
  else {
    BOOL v9 = 0;
  }
  if (v9) {
    unint64_t v10 = v8;
  }
  else {
    unint64_t v10 = 0;
  }
  unint64_t v11 = v8 - v6;
  if (v6 < a3) {
    unint64_t v12 = a1[6];
  }
  else {
    unint64_t v12 = 0;
  }
  if (v6 < a3) {
    unint64_t v10 = v11;
  }
  if (v5) {
    unint64_t v13 = a1[7];
  }
  else {
    unint64_t v13 = v10;
  }
  if ((v5 & 1) == 0) {
    unint64_t v6 = v12;
  }
  if (v6 + v13 <= a3)
  {
    __CFStrConvertBytesToUnicode();
  }
  else
  {
    *(void *)(*(void *)(a1[4] + 8) + 24) = a3;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  return 1;
}

uint64_t __45___NSBPlistMappedString_getCharacters_range___block_invoke_2(void *a1, uint64_t a2, unint64_t a3)
{
  char v6 = dyld_program_sdk_at_least();
  unint64_t v8 = a1[6];
  unint64_t v7 = a1[7];
  if (v7 + v8 >= a3) {
    unint64_t v9 = a3;
  }
  else {
    unint64_t v9 = v7 + v8;
  }
  if (v7 + v8) {
    BOOL v10 = v8 == 0;
  }
  else {
    BOOL v10 = 0;
  }
  if (v10) {
    unint64_t v11 = v9;
  }
  else {
    unint64_t v11 = 0;
  }
  unint64_t v12 = v9 - v8;
  if (v8 < a3) {
    uint64_t v13 = a1[6];
  }
  else {
    uint64_t v13 = 0;
  }
  if (v8 < a3) {
    unint64_t v11 = v12;
  }
  if (v6)
  {
    uint64_t v14 = a1[6];
  }
  else
  {
    unint64_t v7 = v11;
    uint64_t v14 = v13;
  }
  if (v14 + v7 <= a3)
  {
    if (v7)
    {
      v15 = (_WORD *)a1[8];
      v16 = (unsigned __int16 *)(a2 + 2 * v14);
      do
      {
        unsigned int v17 = *v16++;
        *v15++ = bswap32(v17) >> 16;
        --v7;
      }
      while (v7);
    }
  }
  else
  {
    *(void *)(*(void *)(a1[4] + 8) + 24) = a3;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  return 1;
}

@end