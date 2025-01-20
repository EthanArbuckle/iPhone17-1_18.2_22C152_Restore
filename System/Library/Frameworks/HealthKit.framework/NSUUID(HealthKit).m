@interface NSUUID(HealthKit)
+ (id)hk_UUIDWithData:()HealthKit;
+ (id)hk_v3UUIDWithNameSpace:()HealthKit name:;
- (id)hk_dataForUUIDBytes;
- (id)hk_shortRepresentation;
- (uint64_t)hk_compare:()HealthKit;
@end

@implementation NSUUID(HealthKit)

- (id)hk_dataForUUIDBytes
{
  v3[2] = *MEMORY[0x1E4F143B8];
  v3[0] = 0;
  v3[1] = 0;
  [a1 getUUIDBytes:v3];
  v1 = [MEMORY[0x1E4F1C9B8] dataWithBytes:v3 length:16];

  return v1;
}

+ (id)hk_UUIDWithData:()HealthKit
{
  id v3 = a3;
  if ([v3 length] == 16) {
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F29128]), "initWithUUIDBytes:", objc_msgSend(v3, "bytes"));
  }
  else {
    v4 = 0;
  }

  return v4;
}

+ (id)hk_v3UUIDWithNameSpace:()HealthKit name:
{
  v5 = (objc_class *)MEMORY[0x1E4F1CA58];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithData:v7];

  [v8 appendData:v6];
  v9 = objc_msgSend(v8, "hk_MD5");

  v10 = (void *)[objc_alloc(MEMORY[0x1E4F1CA58]) initWithLength:16];
  uint64_t v20 = 0;
  objc_msgSend(v9, "getBytes:range:", &v20, 0, 6);
  objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", 0, 6, &v20, 6);
  char v19 = 0;
  objc_msgSend(v9, "getBytes:range:", &v19, 6, 1);
  char v19 = v19 & 0xF | 0x30;
  objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", 6, 1, &v19, 1);
  char v18 = 0;
  objc_msgSend(v9, "getBytes:range:", &v18, 7, 1);
  objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", 7, 1, &v18, 1);
  char v17 = 0;
  objc_msgSend(v9, "getBytes:range:", &v17, 8, 1);
  char v17 = v17 & 0x3F | 0x80;
  objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", 8, 1, &v17, 1);
  char v16 = 0;
  objc_msgSend(v9, "getBytes:range:", &v16, 9, 1);
  objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", 9, 1, &v16, 1);
  uint64_t v15 = 0;
  objc_msgSend(v9, "getBytes:range:", &v15, 10, 6);
  objc_msgSend(v10, "replaceBytesInRange:withBytes:length:", 10, 6, &v15, 6);
  id v11 = objc_alloc(MEMORY[0x1E4F29128]);
  id v12 = v10;
  v13 = objc_msgSend(v11, "initWithUUIDBytes:", objc_msgSend(v12, "bytes"));

  return v13;
}

- (uint64_t)hk_compare:()HealthKit
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  *(void *)uu1 = 0;
  uint64_t v10 = 0;
  *(void *)uu2 = 0;
  uint64_t v8 = 0;
  id v4 = a3;
  [a1 getUUIDBytes:uu1];
  [v4 getUUIDBytes:uu2];

  int v5 = uuid_compare(uu1, uu2);
  if (v5 < 0) {
    return -1;
  }
  else {
    return v5 != 0;
  }
}

- (id)hk_shortRepresentation
{
  v1 = [a1 UUIDString];
  v2 = objc_msgSend(v1, "substringFromIndex:", objc_msgSend(v1, "length") - 4);

  return v2;
}

@end