@interface NSData(EmailFoundationAdditions)
+ (id)ef_crlfData;
- (BOOL)ef_containsData:()EmailFoundationAdditions;
- (id)ef_hexString;
- (id)ef_md5Digest;
- (id)ef_sha256DigestWithSalts:()EmailFoundationAdditions;
- (uint64_t)ef_hasSuffix:()EmailFoundationAdditions;
- (uint64_t)ef_rangeOfData:()EmailFoundationAdditions;
- (uint64_t)ef_rangeOfData:()EmailFoundationAdditions options:;
- (uint64_t)ef_sha256Digest;
- (uint64_t)ef_subdataFromIndex:()EmailFoundationAdditions;
- (uint64_t)ef_subdataToIndex:()EmailFoundationAdditions;
- (void)ef_enumerateSubdataOfSize:()EmailFoundationAdditions usingBlock:;
@end

@implementation NSData(EmailFoundationAdditions)

- (void)ef_enumerateSubdataOfSize:()EmailFoundationAdditions usingBlock:
{
  v6 = a4;
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  unsigned __int8 v13 = 0;
  do
  {
    if (v8 >= [a1 length]) {
      break;
    }
    uint64_t v9 = [a1 length];
    unint64_t v10 = v7 + v9 >= a3 ? a3 : v7 + v9;
    v11 = objc_msgSend(a1, "subdataWithRange:", v8, v10);
    v6[2](v6, v11, &v13);
    int v12 = v13;

    v8 += a3;
    v7 -= a3;
  }
  while (!v12);
}

- (id)ef_md5Digest
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(&c, 0, sizeof(c));
  CC_MD5_Init(&c);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __48__NSData_EmailFoundationAdditions__ef_md5Digest__block_invoke;
  v4[3] = &__block_descriptor_40_e29_v40__0r_v8__NSRange_QQ_16_B32l;
  v4[4] = &c;
  [a1 enumerateByteRangesUsingBlock:v4];
  *(void *)md = 0;
  uint64_t v7 = 0;
  CC_MD5_Final(md, &c);
  v2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:16];
  return v2;
}

- (id)ef_hexString
{
  uint64_t v2 = [a1 length];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithCapacity:2 * v2];
  uint64_t v4 = [a1 bytes];
  if (v2)
  {
    v5 = (unsigned __int8 *)v4;
    do
    {
      unsigned int v6 = *v5++;
      objc_msgSend(v3, "appendFormat:", @"%02X", v6);
      --v2;
    }
    while (v2);
  }
  return v3;
}

- (id)ef_sha256DigestWithSalts:()EmailFoundationAdditions
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  *(void *)&long long v5 = 0xAAAAAAAAAAAAAAAALL;
  *((void *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)md = v5;
  long long v22 = v5;
  *(void *)&c.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&c.wbuf[6] = v5;
  *(_OWORD *)&c.wbuf[10] = v5;
  *(_OWORD *)&c.hash[6] = v5;
  *(_OWORD *)&c.wbuf[2] = v5;
  *(_OWORD *)c.count = v5;
  *(_OWORD *)&c.hash[2] = v5;
  CC_SHA256_Init(&c);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        unint64_t v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "length", (void)v15))
        {
          id v11 = v10;
          CC_SHA256_Update(&c, (const void *)[v11 bytes], objc_msgSend(v11, "length"));
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v7);
  }

  id v12 = a1;
  CC_SHA256_Update(&c, (const void *)[v12 bytes], objc_msgSend(v12, "length"));
  CC_SHA256_Final(md, &c);
  unsigned __int8 v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:32];

  return v13;
}

- (uint64_t)ef_sha256Digest
{
  return objc_msgSend(a1, "ef_sha256DigestWithSalts:", MEMORY[0x1E4F1CBF0]);
}

+ (id)ef_crlfData
{
  if (ef_crlfData_onceToken != -1) {
    dispatch_once(&ef_crlfData_onceToken, &__block_literal_global_14);
  }
  v0 = (void *)ef_crlfData_crlfData;
  return v0;
}

- (uint64_t)ef_subdataFromIndex:()EmailFoundationAdditions
{
  uint64_t v5 = [a1 length] - a3;
  return objc_msgSend(a1, "subdataWithRange:", a3, v5);
}

- (uint64_t)ef_subdataToIndex:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "subdataWithRange:", 0, a3);
}

- (uint64_t)ef_rangeOfData:()EmailFoundationAdditions
{
  return objc_msgSend(a1, "ef_rangeOfData:options:", a3, 0);
}

- (uint64_t)ef_rangeOfData:()EmailFoundationAdditions options:
{
  id v6 = a3;
  uint64_t v7 = objc_msgSend(a1, "rangeOfData:options:range:", v6, a4, 0, objc_msgSend(a1, "length"));

  return v7;
}

- (uint64_t)ef_hasSuffix:()EmailFoundationAdditions
{
  id v4 = a3;
  unint64_t v5 = [a1 length];
  if (v5 >= [v4 length])
  {
    uint64_t v7 = objc_msgSend(a1, "subdataWithRange:", objc_msgSend(a1, "length") - objc_msgSend(v4, "length"), objc_msgSend(v4, "length"));
    uint64_t v6 = [v7 isEqualToData:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (BOOL)ef_containsData:()EmailFoundationAdditions
{
  id v4 = a3;
  objc_msgSend(a1, "ef_rangeOfData:", v4);
  BOOL v6 = v5 == [v4 length];

  return v6;
}

@end