@interface NSString(MSStringUtilities)
+ (__CFString)MSMakeUUID;
+ (__CFString)MSStringWithBool:()MSStringUtilities;
+ (uint64_t)MSTempFileOutFileName:()MSStringUtilities;
- (id)MSHexData;
- (unint64_t)MSUniqueID;
@end

@implementation NSString(MSStringUtilities)

- (unint64_t)MSUniqueID
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(&v6, 0, sizeof(v6));
  CC_MD5_Init(&v6);
  v2 = (const char *)[a1 cStringUsingEncoding:4];
  size_t v3 = strlen(v2);
  if (HIDWORD(v3)) {
    __assert_rtn("-[NSString(MSStringUtilities) MSUniqueID]", "MSStringUtilities.m", 85, "len <= UINT32_MAX");
  }
  CC_MD5_Update(&v6, v2, v3);
  CC_MD5_Final(md, &v6);
  uint64_t v4 = 0;
  unint64_t result = 0;
  do
    unint64_t result = md[v4++] | (result << 8);
  while (v4 != 8);
  return result;
}

- (id)MSHexData
{
  v2 = malloc_type_malloc((unint64_t)[a1 length] >> 1, 0x82065DF1uLL);
  id v3 = a1;
  uint64_t v4 = [v3 cStringUsingEncoding:1];
  if ([v3 length] == 1)
  {
LABEL_6:
    v12 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithBytes:length:", v2, (unint64_t)objc_msgSend(v3, "length") >> 1);
  }
  else
  {
    unint64_t v5 = 0;
    CC_MD5_CTX v6 = v2;
    while (1)
    {
      __darwin_ct_rune_t v7 = __tolower(*(char *)(v4 + v5));
      uint64_t v8 = memchr("0123456789abcdef", v7, 0x11uLL);
      if (!v8) {
        break;
      }
      char v9 = (char)v8;
      __darwin_ct_rune_t v10 = __tolower(*(char *)(v4 + v5 + 1));
      v11 = memchr("0123456789abcdef", v10, 0x11uLL);
      if (!v11) {
        break;
      }
      *v6++ = ((_BYTE)v11 - "0123456789abcdef") | (16 * (v9 - "0123456789abcdef"));
      v5 += 2;
      if (v5 >= [v3 length] - 1) {
        goto LABEL_6;
      }
    }
    v12 = 0;
  }
  free(v2);
  return v12;
}

+ (__CFString)MSStringWithBool:()MSStringUtilities
{
  if (a3) {
    return @"Yes";
  }
  else {
    return @"No";
  }
}

+ (uint64_t)MSTempFileOutFileName:()MSStringUtilities
{
  if (MSTempFileOutFileName__onceToken != -1) {
    dispatch_once(&MSTempFileOutFileName__onceToken, &__block_literal_global_800);
  }
  uint64_t v4 = (char *)malloc_type_malloc([(id)MSTempFileOutFileName__formatString length] + 1, 0xB58BFDF0uLL);
  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:@"MSTempFilePathCannotAllocateTemplate" format:@"Cannot allocate temporary file path"];
  }
  unint64_t v5 = strcpy(v4, (const char *)[(id)MSTempFileOutFileName__formatString cStringUsingEncoding:4]);
  uint64_t v6 = mkstemp(v5);
  if (v6 == -1) {
    [MEMORY[0x1E4F1CA00] raise:@"MSTempFilePathCannotCreatePath" format:@"Cannot create temporary file path"];
  }
  if (a3)
  {
    *a3 = [NSString stringWithCString:v4 encoding:1];
  }
  free(v4);
  return v6;
}

+ (__CFString)MSMakeUUID
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  v2 = (__CFString *)CFUUIDCreateString(v0, v1);
  CFRelease(v1);
  return v2;
}

@end