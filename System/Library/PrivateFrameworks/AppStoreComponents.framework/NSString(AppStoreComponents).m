@interface NSString(AppStoreComponents)
- (id)asc_sha246Hash;
- (id)asc_sha246HashData;
- (id)collapsingNewlines;
@end

@implementation NSString(AppStoreComponents)

- (id)asc_sha246HashData
{
  v1 = [a1 dataUsingEncoding:1];
  v2 = [MEMORY[0x1E4F1CA58] dataWithLength:32];
  id v3 = v1;
  v4 = (const void *)[v3 bytes];
  CC_LONG v5 = [v3 length];
  id v6 = v2;
  CC_SHA256(v4, v5, (unsigned __int8 *)[v6 mutableBytes]);

  return v6;
}

- (id)asc_sha246Hash
{
  v1 = objc_msgSend(a1, "asc_sha246HashData");
  v2 = [v1 base64EncodedStringWithOptions:0];

  return v2;
}

- (id)collapsingNewlines
{
  v1 = [MEMORY[0x1E4F28E78] stringWithString:a1];
  objc_msgSend(v1, "replaceOccurrencesOfString:withString:options:range:", @"([\\v]+)", @"\n", 1024, 0, objc_msgSend(v1, "length"));
  v2 = (void *)[v1 copy];

  return v2;
}

@end