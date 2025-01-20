@interface ASVTextureConverter
+ (id)defaultTextureConverters;
+ (id)newConverterOfType:(int64_t)a3;
+ (id)preferredConverterFromConverters:(id)a3 forTextureDescription:(id)a4;
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)estimatedMemoryDeltaForTextureWithDescription:(id)a3;
- (BOOL)canConvertTextureWithDescription:(id)a3;
- (int64_t)converterType;
- (unint64_t)alignUp:(unint64_t)a3 toAlignment:(unint64_t)a4;
@end

@implementation ASVTextureConverter

- (int64_t)converterType
{
  return 0;
}

- (BOOL)canConvertTextureWithDescription:(id)a3
{
  return 1;
}

- (unint64_t)alignUp:(unint64_t)a3 toAlignment:(unint64_t)a4
{
  if ((a4 & (a4 - 1)) != 0) {
    return 0;
  }
  else {
    return (a4 - 1 + a3) & -(uint64_t)a4;
  }
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)estimatedMemoryDeltaForTextureWithDescription:(id)a3
{
  unint64_t v3 = 0;
  unint64_t v4 = 0;
  result.var1 = v4;
  result.var0 = v3;
  return result;
}

+ (id)defaultTextureConverters
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = objc_alloc_init(ASVImageIOTextureConverter);
  v5[0] = v2;
  unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

+ (id)newConverterOfType:(int64_t)a3
{
  if (a3 == 1) {
    return objc_alloc_init(ASVImageIOTextureConverter);
  }
  else {
    return 0;
  }
}

+ (id)preferredConverterFromConverters:(id)a3 forTextureDescription:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v5;
  id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v11, "canConvertTextureWithDescription:", v6, (void)v13))
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

@end