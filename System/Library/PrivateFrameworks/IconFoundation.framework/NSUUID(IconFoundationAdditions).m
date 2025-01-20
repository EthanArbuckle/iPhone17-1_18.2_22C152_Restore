@interface NSUUID(IconFoundationAdditions)
+ (id)_IF_UUIDByXORingUUIDs:()IconFoundationAdditions;
+ (id)_IF_UUIDWithBytes:()IconFoundationAdditions size:;
+ (id)_IF_UUIDWithDouble:()IconFoundationAdditions;
+ (id)_IF_UUIDWithInt64:()IconFoundationAdditions;
+ (id)_IF_UUIDWithOSType:()IconFoundationAdditions;
+ (id)_IF_UUIDWithString:()IconFoundationAdditions;
+ (id)_IF_nullUUID;
+ (uint64_t)_IF_UUIDWithData:()IconFoundationAdditions;
- (uint64_t)_IF_getUUIDBytes:()IconFoundationAdditions hash64:;
@end

@implementation NSUUID(IconFoundationAdditions)

- (uint64_t)_IF_getUUIDBytes:()IconFoundationAdditions hash64:
{
  if (!a3) {
    -[NSUUID(IconFoundationAdditions) _IF_getUUIDBytes:hash64:]();
  }
  uint64_t result = objc_msgSend(a1, "getUUIDBytes:");
  if (a4) {
    *a4 = a3[1] ^ *a3;
  }
  return result;
}

+ (id)_IF_nullUUID
{
  if (_IF_nullUUID_onceToken != -1) {
    dispatch_once(&_IF_nullUUID_onceToken, &__block_literal_global_10);
  }
  v0 = (void *)_IF_nullUUID_nullUUID;

  return v0;
}

+ (uint64_t)_IF_UUIDWithData:()IconFoundationAdditions
{
  v3 = (void *)MEMORY[0x1E4F29128];
  id v4 = a3;
  uint64_t v5 = [v4 bytes];
  uint64_t v6 = [v4 length];

  return objc_msgSend(v3, "_IF_UUIDWithBytes:size:", v5, v6);
}

+ (id)_IF_UUIDWithString:()IconFoundationAdditions
{
  id v3 = a3;
  id v4 = v3;
  if (!v3
    || (uint64_t v5 = (const char *)[v3 UTF8String]) == 0
    || (objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithBytes:size:", v5, strlen(v5)),
        (uint64_t v6 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_nullUUID");
  }

  return v6;
}

+ (id)_IF_UUIDWithBytes:()IconFoundationAdditions size:
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  memset(uu, 0, 16);
  if (data && len)
  {
    CC_SHA256(data, len, v6);
    *(_OWORD *)uu = *(_OWORD *)v6;
    uu[6] = v6[6] & 0xF | 0x30;
    uu[8] = v6[8] & 0x3F | 0x80;
  }
  else
  {
    uuid_clear(uu);
  }
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];

  return v4;
}

+ (id)_IF_UUIDWithInt64:()IconFoundationAdditions
{
  uint64_t v5 = a3;
  id v3 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithBytes:size:", &v5, 8);

  return v3;
}

+ (id)_IF_UUIDWithDouble:()IconFoundationAdditions
{
  double v3 = a1;
  v1 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithBytes:size:", &v3, 8);

  return v1;
}

+ (id)_IF_UUIDWithOSType:()IconFoundationAdditions
{
  int v5 = a3;
  double v3 = objc_msgSend(MEMORY[0x1E4F29128], "_IF_UUIDWithBytes:size:", &v5, 4);

  return v3;
}

+ (id)_IF_UUIDByXORingUUIDs:()IconFoundationAdditions
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  memset(uu, 0, sizeof(uu));
  uuid_clear(uu);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        int8x16_t v16 = 0uLL;
        objc_msgSend(v9, "getUUIDBytes:", &v16, (void)v12);
        *(int8x16_t *)uuid_t uu = veorq_s8(*(int8x16_t *)uu, v16);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:uu];

  return v10;
}

- (void)_IF_getUUIDBytes:()IconFoundationAdditions hash64:.cold.1()
{
}

@end