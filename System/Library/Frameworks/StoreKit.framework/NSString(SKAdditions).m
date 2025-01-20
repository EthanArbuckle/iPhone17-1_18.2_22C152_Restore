@interface NSString(SKAdditions)
- (id)sk_SHA1Hash;
@end

@implementation NSString(SKAdditions)

- (id)sk_SHA1Hash
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  [a1 dataUsingEncoding:4];
  v5[0] = 0;
  v5[1] = 0;
  LODWORD(v6) = 0;
  id v1 = objc_claimAutoreleasedReturnValue();
  CC_SHA1((const void *)objc_msgSend(v1, "bytes", 0, 0, v6), objc_msgSend(v1, "length"), (unsigned __int8 *)v5);
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:v5 length:20];
  v3 = [v2 base64EncodedStringWithOptions:0];

  return v3;
}

@end