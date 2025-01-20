@interface NSData(FMCoreAdditions)
- (__CFString)fm_MACAddressString;
- (id)fm_hexString;
@end

@implementation NSData(FMCoreAdditions)

- (id)fm_hexString
{
  v2 = [MEMORY[0x1E4F28E78] string];
  uint64_t v3 = [a1 length];
  uint64_t v4 = [a1 bytes];
  if (v3 >= 1)
  {
    v5 = (unsigned __int8 *)v4;
    do
    {
      unsigned int v6 = *v5++;
      objc_msgSend(v2, "appendFormat:", @"%02X", v6);
      --v3;
    }
    while (v3);
  }
  v7 = (void *)[v2 copy];

  return v7;
}

- (__CFString)fm_MACAddressString
{
  v1 = (unsigned __int8 *)[a1 bytes];
  if (v1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%02X:%02X:%02X:%02X:%02X:%02X", *v1, v1[1], v1[2], v1[3], v1[4], v1[5]);
    v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = &stru_1F0B11478;
  }
  return v2;
}

@end