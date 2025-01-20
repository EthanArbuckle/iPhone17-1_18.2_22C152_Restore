@interface NSData(HKUUID)
- (uint64_t)hk_enumerateUUIDsWithError:()HKUUID block:;
- (unint64_t)hk_countOfUUIDs;
- (void)hk_enumerateUUIDBytesUsingBlock:()HKUUID;
- (void)hk_enumerateUUIDsUsingBlock:()HKUUID;
@end

@implementation NSData(HKUUID)

- (void)hk_enumerateUUIDsUsingBlock:()HKUUID
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __46__NSData_HKUUID__hk_enumerateUUIDsUsingBlock___block_invoke;
  v6[3] = &unk_1E58BF088;
  id v7 = v4;
  id v5 = v4;
  objc_msgSend(a1, "hk_enumerateUUIDBytesUsingBlock:", v6);
}

- (void)hk_enumerateUUIDBytesUsingBlock:()HKUUID
{
  id v4 = a3;
  uint64_t v5 = [a1 length];
  if ((v5 & 0xF) == 0)
  {
    uint64_t v6 = v5;
    unint64_t v7 = [a1 bytes];
    unint64_t v8 = v7 + v6;
    char v11 = 0;
    if (v7 < v8)
    {
      unint64_t v9 = v7;
      do
      {
        v4[2](v4, v9, &v11);
        v9 += 16;
        if (v11) {
          BOOL v10 = 1;
        }
        else {
          BOOL v10 = v9 >= v8;
        }
      }
      while (!v10);
    }
  }
}

- (unint64_t)hk_countOfUUIDs
{
  unint64_t v1 = [a1 length];
  if ((v1 & 0xF) != 0) {
    return 0;
  }
  else {
    return v1 >> 4;
  }
}

- (uint64_t)hk_enumerateUUIDsWithError:()HKUUID block:
{
  id v6 = a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__7;
  v20 = __Block_byref_object_dispose__7;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__NSData_HKUUID__hk_enumerateUUIDsWithError_block___block_invoke;
  v12[3] = &unk_1E58BF0D8;
  v14 = &v16;
  id v7 = v6;
  id v13 = v7;
  v15 = &v22;
  objc_msgSend(a1, "hk_enumerateUUIDBytesUsingBlock:", v12);
  id v8 = (id)v17[5];
  unint64_t v9 = v8;
  if (v8)
  {
    if (a3) {
      *a3 = v8;
    }
    else {
      _HKLogDroppedError(v8);
    }
  }

  uint64_t v10 = *((unsigned __int8 *)v23 + 24);
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

@end