@interface NSString(MCUtilities)
+ (__CFString)MCMakeUUID;
- (id)MCHashedFilenameWithPrefix:()MCUtilities extension:;
- (id)MCHashedIdentifier;
- (id)MCOldStyleSafeFilenameHashWithExtension:()MCUtilities;
- (id)MCSHA256DigestWithSalt:()MCUtilities;
- (uint64_t)MCHash;
- (uint64_t)MCHashedFilenameWithExtension:()MCUtilities;
- (uint64_t)MCOldStyleSafeFilenameHash;
- (uint64_t)MCSHA256DigestWithPasscodeSalt;
@end

@implementation NSString(MCUtilities)

- (uint64_t)MCHashedFilenameWithExtension:()MCUtilities
{
  return [a1 MCHashedFilenameWithPrefix:@"profile" extension:a3];
}

- (id)MCHashedFilenameWithPrefix:()MCUtilities extension:
{
  id v6 = a3;
  id v7 = a4;
  v8 = [a1 MCHashedIdentifier];
  if (v6) {
    [NSString stringWithFormat:@"%@-%@", v6, v8];
  }
  else {
  v9 = [NSString stringWithFormat:@"%@", v8, v13];
  }
  v10 = v9;
  if (v7)
  {
    uint64_t v11 = [v9 stringByAppendingPathExtension:v7];

    v10 = (void *)v11;
  }

  return v10;
}

- (id)MCHashedIdentifier
{
  v1 = [a1 MCSHA256DigestWithSalt:0];
  v2 = [v1 MCHexString];

  return v2;
}

- (uint64_t)MCOldStyleSafeFilenameHash
{
  return [a1 MCOldStyleSafeFilenameHashWithExtension:0];
}

- (id)MCOldStyleSafeFilenameHashWithExtension:()MCUtilities
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28B88] alphanumericCharacterSet];
  id v6 = [v5 invertedSet];
  id v7 = [a1 componentsSeparatedByCharactersInSet:v6];
  v8 = [v7 componentsJoinedByString:@"_"];

  v9 = [NSString stringWithFormat:@"%@+%u", v8, objc_msgSend(a1, "MCHash")];

  if (v4)
  {
    id v10 = [v9 stringByAppendingPathExtension:v4];
  }
  else
  {
    id v10 = v9;
  }
  uint64_t v11 = v10;

  return v11;
}

- (uint64_t)MCSHA256DigestWithPasscodeSalt
{
  if (MCSHA256DigestWithPasscodeSalt_onceToken != -1) {
    dispatch_once(&MCSHA256DigestWithPasscodeSalt_onceToken, &__block_literal_global_6);
  }
  uint64_t v2 = MCSHA256DigestWithPasscodeSalt_salt;
  return [a1 MCSHA256DigestWithSalt:v2];
}

- (id)MCSHA256DigestWithSalt:()MCUtilities
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = (const char *)[a1 cStringUsingEncoding:4];
  CC_LONG v6 = strlen(v5);
  memset(&v10, 0, sizeof(v10));
  CC_SHA256_Init(&v10);
  if ([v4 length])
  {
    id v7 = v4;
    CC_SHA256_Update(&v10, (const void *)[v7 bytes], objc_msgSend(v7, "length"));
  }
  CC_SHA256_Update(&v10, v5, v6);
  CC_SHA256_Final(md, &v10);
  v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:32];

  return v8;
}

- (uint64_t)MCHash
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [a1 length];
  v3 = v9;
  if (v2 >= 0x61)
  {
    objc_msgSend(a1, "getCharacters:range:", v9, 0, 32);
    objc_msgSend(a1, "getCharacters:range:", &v10, (v2 >> 1) - 16, 32);
    objc_msgSend(a1, "getCharacters:range:", &v11, v2 - 32, 32);
    id v4 = (unsigned __int16 *)&v12;
    v5 = (unsigned __int16 *)&v12;
LABEL_5:
    v3 = v9;
    int v6 = v2;
    do
    {
      int v6 = 67503105 * v6 + 16974593 * *v3 + 66049 * v3[1] + 257 * v3[2] + v3[3];
      v3 += 4;
    }
    while (v3 < v5);
    goto LABEL_10;
  }
  objc_msgSend(a1, "getCharacters:range:", v9, 0, v2);
  id v4 = &v9[v2];
  if ((v2 & 0xFFFFFFFFFFFFFFFCLL) != 0)
  {
    v5 = &v9[v2 & 0xFFFFFFFFFFFFFFFCLL];
    goto LABEL_5;
  }
  int v6 = v2;
LABEL_10:
  while (v3 < v4)
  {
    int v7 = *v3++;
    int v6 = 257 * v6 + v7;
  }
  return ((v6 << v2) + v6);
}

+ (__CFString)MCMakeUUID
{
  CFAllocatorRef v0 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFUUIDRef v1 = CFUUIDCreate((CFAllocatorRef)*MEMORY[0x1E4F1CF80]);
  unint64_t v2 = (__CFString *)CFUUIDCreateString(v0, v1);
  CFRelease(v1);
  return v2;
}

@end