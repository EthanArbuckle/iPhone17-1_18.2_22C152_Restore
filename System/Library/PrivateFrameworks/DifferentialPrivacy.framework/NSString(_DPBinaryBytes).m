@interface NSString(_DPBinaryBytes)
- (id)dp_binaryBytesData;
- (id)dp_floatVectorBytesData;
@end

@implementation NSString(_DPBinaryBytes)

- (id)dp_binaryBytesData
{
  v2 = [MEMORY[0x1E4F1CA58] data];
  if (![a1 length])
  {
LABEL_8:
    v6 = (void *)[v2 copy];
    goto LABEL_10;
  }
  uint64_t v3 = 0;
  while (1)
  {
    int v4 = [a1 characterAtIndex:v3];
    if (v4 == 49)
    {
      char v8 = 1;
      v5 = &v8;
      goto LABEL_7;
    }
    if (v4 != 48) {
      break;
    }
    char v9 = 0;
    v5 = &v9;
LABEL_7:
    [v2 appendBytes:v5 length:1];
    if (++v3 >= (unint64_t)[a1 length]) {
      goto LABEL_8;
    }
  }
  v6 = 0;
LABEL_10:

  return v6;
}

- (id)dp_floatVectorBytesData
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E019F810]();
  uint64_t v3 = [MEMORY[0x1E4F1CA58] data];
  int v4 = objc_opt_new();
  [v4 setNumberStyle:1];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@","];
  v6 = [a1 componentsSeparatedByCharactersInSet:v5];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = [v4 numberFromString:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        if (!v11)
        {

          v14 = 0;
          goto LABEL_11;
        }
        v12 = v11;
        int v16 = 0;
        [v11 floatValue];
        int v16 = v13;
        [v3 appendBytes:&v16 length:4];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  v14 = (void *)[v3 copy];
LABEL_11:

  return v14;
}

@end