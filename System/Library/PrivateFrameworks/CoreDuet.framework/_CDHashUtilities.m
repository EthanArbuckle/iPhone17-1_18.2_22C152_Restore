@interface _CDHashUtilities
+ (id)hexStringFromData:(id)a3;
+ (id)md5ForData:(id)a3;
+ (id)md5ForObjectDescription:(id)a3;
+ (id)md5ForString:(id)a3;
+ (id)md5forDictionary:(id)a3 error:(id *)a4;
+ (id)sha1ForData:(id)a3;
+ (id)sha1ForString:(id)a3;
+ (id)sha256Hash:(id)a3 withSalt:(id)a4;
@end

@implementation _CDHashUtilities

+ (id)sha1ForString:(id)a3
{
  v4 = (__CFString *)a3;
  if (v4) {
    v5 = v4;
  }
  else {
    v5 = &stru_1EDDE58B8;
  }
  v6 = [(__CFString *)v5 dataUsingEncoding:4];
  v7 = [a1 sha1ForData:v6];

  return v7;
}

+ (id)sha1ForData:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    id v3 = [MEMORY[0x1E4F1C9B8] dataWithBytes:"" length:0];
  }
  id v4 = v3;
  CC_SHA1((const void *)[v4 bytes], objc_msgSend(v4, "length"), md);
  v5 = [MEMORY[0x1E4F28E78] stringWithCapacity:40];
  for (uint64_t i = 0; i != 20; ++i)
    objc_msgSend(v5, "appendFormat:", @"%02x", md[i]);

  return v5;
}

+ (id)md5ForData:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
    CC_MD5((const void *)[v5 bytes], objc_msgSend(v5, "length"), md);
    v6 = [MEMORY[0x1E4F28E78] stringWithCapacity:32];
    for (uint64_t i = 0; i != 16; ++i)
      objc_msgSend(v6, "appendFormat:", @"%02x", md[i]);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)md5ForString:(id)a3
{
  if (a3)
  {
    id v4 = [a3 dataUsingEncoding:4];
    id v5 = [a1 md5ForData:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

+ (id)md5ForObjectDescription:(id)a3
{
  id v4 = [a3 description];
  id v5 = [a1 md5ForString:v4];

  return v5;
}

+ (id)md5forDictionary:(id)a3 error:(id *)a4
{
  id v5 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:0 error:a4];
  if (v5)
  {
    v6 = [a1 md5ForData:v5];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)hexStringFromData:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 bytes];
  id v5 = [MEMORY[0x1E4F28E78] string];
  if ([v3 length])
  {
    unint64_t v6 = 0;
    do
      objc_msgSend(v5, "appendFormat:", @"%hhx", *(unsigned __int8 *)(v4 + v6++));
    while ([v3 length] > v6);
  }
  v7 = (void *)[v5 copy];

  return v7;
}

+ (id)sha256Hash:(id)a3 withSalt:(id)a4
{
  uint64_t v4 = 0;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3 && a4)
  {
    id v7 = a4;
    v8 = [a3 dataUsingEncoding:4];
    uint64_t v9 = (void *)[v8 mutableCopy];

    [v9 appendData:v7];
    md[0] = 0;
    id v10 = v9;
    CC_SHA256((const void *)[v10 bytes], objc_msgSend(v10, "length"), md);
    v11 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:32];
    uint64_t v4 = [a1 hexStringFromData:v11];
  }
  return v4;
}

@end