@interface NSString(ClipServicesExtras)
- (BOOL)cps_isAlphaNumeric;
- (__CFString)cps_privacyPreservingDescription;
- (id)cps_sha256;
- (id)cps_sha256String;
- (id)cps_stringByRemovingPrefix:()ClipServicesExtras;
- (uint64_t)cps_isAMSPlaceholderBundleIdentifier;
- (uint64_t)cps_looksLikeUUIDOrWebClipIdentifier;
@end

@implementation NSString(ClipServicesExtras)

- (id)cps_sha256
{
  v2 = (unsigned __int8 *)malloc_type_calloc(0x20uLL, 1uLL, 0x100004077774924uLL);
  id v3 = [a1 dataUsingEncoding:4];
  CC_SHA256((const void *)[v3 bytes], objc_msgSend(v3, "length"), v2);
  v4 = [MEMORY[0x263EFF8F8] dataWithBytesNoCopy:v2 length:32];

  return v4;
}

- (id)cps_sha256String
{
  objc_msgSend(a1, "cps_sha256");
  id v1 = objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 bytes];

  id v3 = [MEMORY[0x263F089D8] stringWithCapacity:64];
  for (uint64_t i = 0; i != 32; ++i)
    objc_msgSend(v3, "appendFormat:", @"%02x", *(unsigned __int8 *)(v2 + i));

  return v3;
}

- (__CFString)cps_privacyPreservingDescription
{
  unint64_t v1 = [a1 length];
  if (v1)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"about %lu characters", 5 * (unint64_t)((double)v1 / 5.0));
    uint64_t v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v2 = @"empty";
  }

  return v2;
}

- (id)cps_stringByRemovingPrefix:()ClipServicesExtras
{
  id v4 = a3;
  if ([a1 hasPrefix:v4])
  {
    objc_msgSend(a1, "substringFromIndex:", objc_msgSend(v4, "length"));
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = a1;
  }
  v6 = v5;

  return v6;
}

- (BOOL)cps_isAlphaNumeric
{
  uint64_t v2 = [MEMORY[0x263F08708] alphanumericCharacterSet];
  id v3 = [v2 invertedSet];
  BOOL v4 = [a1 rangeOfCharacterFromSet:v3] == 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (uint64_t)cps_looksLikeUUIDOrWebClipIdentifier
{
  uint64_t result = [a1 length];
  if (result)
  {
    uint64_t v3 = result;
    return ([a1 hasPrefix:@"com.apple.appclip-"] & 1) != 0
        || ([a1 hasPrefix:@"com.apple.webapp-"] & 1) != 0
        || v3 == 32 && (objc_msgSend(a1, "cps_isAlphaNumeric") & 1) != 0;
  }
  return result;
}

- (uint64_t)cps_isAMSPlaceholderBundleIdentifier
{
  return [a1 isEqualToString:@"com.apple.ams.ac"];
}

@end