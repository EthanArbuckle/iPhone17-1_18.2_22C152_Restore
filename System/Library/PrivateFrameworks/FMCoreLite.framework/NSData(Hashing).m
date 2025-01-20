@interface NSData(Hashing)
- (id)fm_hmac_md5WithKey:()Hashing;
- (id)fm_hmac_sha1WithKey:()Hashing;
- (id)fm_hmac_sha256WithKey:()Hashing;
- (id)fm_hmac_sha512WithKey:()Hashing;
- (id)fm_sha1Hash;
- (id)fm_sha256Hash;
- (id)fm_sha512Hash;
@end

@implementation NSData(Hashing)

- (id)fm_sha1Hash
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_SHA1((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
  return v2;
}

- (id)fm_sha256Hash
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_SHA256((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:32];
  return v2;
}

- (id)fm_sha512Hash
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v1 = a1;
  CC_SHA512((const void *)[v1 bytes], objc_msgSend(v1, "length"), md);
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:64];
  return v2;
}

- (id)fm_hmac_md5WithKey:()Hashing
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (const void *)[v4 bytes];
  size_t v6 = [v4 length];

  id v7 = a1;
  CCHmac(1u, v5, v6, (const void *)[v7 bytes], objc_msgSend(v7, "length"), macOut);
  v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:macOut length:16];
  return v8;
}

- (id)fm_hmac_sha1WithKey:()Hashing
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (const void *)[v4 bytes];
  size_t v6 = [v4 length];

  id v7 = a1;
  CCHmac(0, v5, v6, (const void *)[v7 bytes], objc_msgSend(v7, "length"), macOut);
  v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:macOut length:20];
  return v8;
}

- (id)fm_hmac_sha256WithKey:()Hashing
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (const void *)[v4 bytes];
  size_t v6 = [v4 length];

  id v7 = a1;
  CCHmac(2u, v5, v6, (const void *)[v7 bytes], objc_msgSend(v7, "length"), macOut);
  v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:macOut length:32];
  return v8;
}

- (id)fm_hmac_sha512WithKey:()Hashing
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = (const void *)[v4 bytes];
  size_t v6 = [v4 length];

  id v7 = a1;
  CCHmac(4u, v5, v6, (const void *)[v7 bytes], objc_msgSend(v7, "length"), macOut);
  v8 = [MEMORY[0x1E4F1C9B8] dataWithBytes:macOut length:64];
  return v8;
}

@end