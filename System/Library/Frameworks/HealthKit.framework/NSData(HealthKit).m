@interface NSData(HealthKit)
+ (id)hk_dataWithHexString:()HealthKit;
+ (id)hk_dataWithSHA256Fingerprint:()HealthKit error:;
+ (id)hk_nilDataMD5;
+ (id)hk_randomDataOfLength:()HealthKit;
- (id)hk_MD5;
- (id)hk_SHA256;
- (id)hk_hexString;
@end

@implementation NSData(HealthKit)

+ (id)hk_dataWithSHA256Fingerprint:()HealthKit error:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 lengthOfBytesUsingEncoding:1] != 95)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    v11 = @"SHA256 fingerprint not of expected length.";
    uint64_t v12 = a4;
    uint64_t v13 = 3;
LABEL_10:
    objc_msgSend(v10, "hk_assignError:code:description:", v12, v13, v11);
    goto LABEL_11;
  }
  memset(v21, 0, sizeof(v21));
  if (([v5 getCString:v21 maxLength:96 encoding:1] & 1) == 0)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    v11 = @"Unable to instantiate C string.";
LABEL_9:
    uint64_t v12 = a4;
    uint64_t v13 = 100;
    goto LABEL_10;
  }
  v6 = malloc_type_malloc(0x20uLL, 0x910A8C9AuLL);
  if (!v6)
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    v11 = @"Unable to allocate space for SHA256 digest.";
    goto LABEL_9;
  }
  v7 = v6;
  char v20 = 0;
  *(_WORD *)__str = v21[0];
  __endptr = 0;
  unsigned char *v6 = strtoul(__str, &__endptr, 16);
  if (__endptr != &v20) {
    goto LABEL_5;
  }
  v16 = (char *)v21 + 4;
  uint64_t v17 = 1;
  while (*(v16 - 2) == 58)
  {
    *(_WORD *)__str = *(_WORD *)(v16 - 1);
    __endptr = 0;
    v7[v17++] = strtoul(__str, &__endptr, 16);
    v16 += 3;
    if (__endptr != &v20) {
      goto LABEL_5;
    }
  }
  if (*(v16 - 2))
  {
LABEL_5:
    free(v7);
    v8 = (void *)MEMORY[0x1E4F28C58];
    v9 = HKSensitiveLogItem(v5);
    objc_msgSend(v8, "hk_assignError:code:format:", a4, 100, @"Invalid fingerprint: %@.", v9);

LABEL_11:
    v14 = 0;
    goto LABEL_12;
  }
  v14 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v7 length:32 freeWhenDone:1];
LABEL_12:

  return v14;
}

+ (id)hk_nilDataMD5
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  CC_MD5(0, 0, md);
  v0 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:16];

  return v0;
}

- (id)hk_MD5
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_MD5((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:16];

  return v2;
}

- (id)hk_SHA256
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_SHA256((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:32];

  return v2;
}

+ (id)hk_randomDataOfLength:()HealthKit
{
  if (a3 < 0)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, a1, @"NSData+HealthKit.m", 98, @"Invalid parameter not satisfying: %@", @"length >= 0" object file lineNumber description];
  }
  v4 = [MEMORY[0x1E4F28CB0] fileHandleForReadingAtPath:@"/dev/random"];
  uint64_t v5 = [v4 readDataOfLength:a3];

  return v5;
}

+ (id)hk_dataWithHexString:()HealthKit
{
  id v3 = a3;
  if ([v3 length])
  {
LABEL_10:
    v11 = 0;
  }
  else
  {
    size_t v4 = (unint64_t)[v3 length] >> 1;
    id v5 = [v3 lowercaseString];
    uint64_t v6 = [v5 UTF8String];

    v7 = malloc_type_calloc(v4, 1uLL, 0x100004077774924uLL);
    if ([v3 length])
    {
      for (unint64_t i = 0; i < [v3 length]; ++i)
      {
        int v9 = *(unsigned __int8 *)(v6 + i);
        char v10 = v9 - 48;
        if ((v9 - 48) >= 0xA)
        {
          if ((v9 - 97) > 5)
          {
            free(v7);
            goto LABEL_10;
          }
          char v10 = v9 - 87;
        }
        *((unsigned char *)v7 + (i >> 1)) += v10 << (~(4 * i) & 4);
      }
    }
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytesNoCopy:v7 length:v4 freeWhenDone:1];
  }

  return v11;
}

- (id)hk_hexString
{
  size_t v2 = 2 * [a1 length];
  id v3 = a1;
  uint64_t v4 = [v3 bytes];
  id v5 = (char *)malloc_type_calloc(v2, 1uLL, 0x100004077774924uLL);
  if ([v3 length])
  {
    unint64_t v6 = 0;
    v7 = v5 + 1;
    do
    {
      *(v7 - 1) = hk_hexString_hexCharacters[(unint64_t)*(unsigned __int8 *)(v4 + v6) >> 4];
      unsigned char *v7 = hk_hexString_hexCharacters[*(unsigned char *)(v4 + v6) & 0xF];
      v7 += 2;
      ++v6;
    }
    while (v6 < [v3 length]);
  }
  v8 = (void *)[[NSString alloc] initWithBytesNoCopy:v5 length:v2 encoding:4 freeWhenDone:1];

  return v8;
}

+ (void)hk_randomDataOfLength:()HealthKit .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19C023000, a2, OS_LOG_TYPE_ERROR, "Failed to create random data: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end