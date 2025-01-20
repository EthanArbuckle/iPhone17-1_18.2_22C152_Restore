@interface NSData(ManagedConfiguration)
+ (id)MCDataFromFile:()ManagedConfiguration;
+ (id)MCDataWithHexString:()ManagedConfiguration;
+ (uint64_t)MCDataWithCFData:()ManagedConfiguration;
- (id)MCHexString;
- (id)MCSHA256Hash;
@end

@implementation NSData(ManagedConfiguration)

+ (id)MCDataFromFile:()ManagedConfiguration
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v10 = 0;
  v4 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v3 options:0 error:&v10];
  id v5 = v10;
  if (v5)
  {
    v6 = _MCLogObjects;
    if (os_log_type_enabled((os_log_t)_MCLogObjects, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      id v12 = v3;
      __int16 v13 = 2114;
      id v14 = v5;
      _os_log_impl(&dword_1A13F0000, v6, OS_LOG_TYPE_ERROR, "Could not read data from path %{public}@: %{public}@", buf, 0x16u);
    }
    if (MCIsDaemonProcess)
    {
      if ([v5 code] == 257)
      {
        v7 = [v5 domain];
        int v8 = [v7 isEqualToString:*MEMORY[0x1E4F281F8]];

        if (v8) {
          MCLogUnexpectedFileAccessError(v3, v5);
        }
      }
    }
  }

  return v4;
}

- (id)MCHexString
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 length];
  id v3 = (unsigned __int8 *)[a1 bytes];
  v4 = (char *)v9 - ((2 * v2 + 16) & 0xFFFFFFFFFFFFFFF0);
  if (v2)
  {
    id v5 = (char *)v9 - ((2 * v2 + 16) & 0xFFFFFFFFFFFFFFF0);
    do
    {
      unsigned int v6 = *v3++;
      *id v5 = MCHexString_digits[(unint64_t)v6 >> 4];
      v4 = v5 + 2;
      v5[1] = MCHexString_digits[v6 & 0xF];
      v5 += 2;
      --v2;
    }
    while (v2);
  }
  unsigned char *v4 = 0;
  v7 = objc_msgSend(NSString, "stringWithCString:encoding:");
  return v7;
}

+ (id)MCDataWithHexString:()ManagedConfiguration
{
  id v3 = a3;
  v4 = [MEMORY[0x1E4F1CA58] data];
  uint64_t v5 = [v3 length];
  char v14 = 0;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    char v8 = 1;
    do
    {
      int v9 = [v3 characterAtIndex:v7];
      char v10 = v9 - 48;
      if ((v9 - 65) <= 5) {
        char v11 = v9 - 55;
      }
      else {
        char v11 = 0;
      }
      if ((v9 - 97) <= 5) {
        char v12 = v9 - 87;
      }
      else {
        char v12 = v11;
      }
      if ((unsigned __int16)(v9 - 48) > 9u) {
        char v10 = v12;
      }
      if (v8)
      {
        char v14 = 16 * v10;
      }
      else
      {
        v14 |= v10;
        [v4 appendBytes:&v14 length:1];
      }
      v8 ^= 1u;
      ++v7;
    }
    while (v6 != v7);
  }

  return v4;
}

+ (uint64_t)MCDataWithCFData:()ManagedConfiguration
{
  v4 = (void *)MEMORY[0x1E4F1C9B8];
  BytePtr = CFDataGetBytePtr(theData);
  CFIndex Length = CFDataGetLength(theData);
  return [v4 dataWithBytes:BytePtr length:Length];
}

- (id)MCSHA256Hash
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_SHA256((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  uint64_t v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:32];
  return v2;
}

@end