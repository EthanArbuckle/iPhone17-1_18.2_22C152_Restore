@interface CNHashBuilder
+ (unint64_t)BOOLHash:(BOOL)a3;
+ (unint64_t)arrayHash:(id)a3;
+ (unint64_t)cgfloatHash:(double)a3;
+ (unint64_t)cgpointHash:(CGPoint)a3;
+ (unint64_t)cgrectHash:(CGRect)a3;
+ (unint64_t)cgsizeHash:(CGSize)a3;
+ (unint64_t)dictionaryHash:(id)a3;
+ (unint64_t)hashWithBlocks:(id)a3;
+ (unint64_t)integerHash:(int64_t)a3;
+ (unint64_t)objectHash:(id)a3;
+ (unint64_t)orderedSetHash:(id)a3;
+ (unint64_t)pointerHash:(void *)a3;
+ (unint64_t)setHash:(id)a3;
+ (unint64_t)unsignedIntegerHash:(unint64_t)a3;
@end

@implementation CNHashBuilder

+ (unint64_t)arrayHash:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      unint64_t v9 = 17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          unint64_t v9 = [a1 objectHash:*(void *)(*((void *)&v12 + 1) + 8 * i)] - v9 + 32 * v9;
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    else
    {
      unint64_t v9 = 17;
    }
  }
  else
  {
    unint64_t v9 = 0;
  }

  return v9;
}

+ (unint64_t)objectHash:(id)a3
{
  if (a3) {
    return [a3 hash];
  }
  else {
    return 0;
  }
}

+ (unint64_t)hashWithBlocks:(id)a3
{
  v3 = (uint64_t (**)(void))a3;
  unint64_t v9 = (const void **)&v10;
  if (!v3) {
    return 17;
  }
  id v4 = v3;
  unint64_t v5 = 17;
  do
  {
    unint64_t v5 = v4[2](v4) - v5 + 32 * v5;
    uint64_t v6 = v9++;
    uint64_t v7 = (uint64_t (**)(void))_Block_copy(*v6);

    id v4 = v7;
  }
  while (v7);
  return v5;
}

+ (unint64_t)BOOLHash:(BOOL)a3
{
  return a3;
}

+ (unint64_t)cgsizeHash:(CGSize)a3
{
  double height = a3.height;
  uint64_t v5 = [a1 cgfloatHash:a3.width];
  return [a1 cgfloatHash:height] - v5 + 32 * v5 + 16337;
}

+ (unint64_t)cgfloatHash:(double)a3
{
  return *(void *)&a3;
}

+ (unint64_t)pointerHash:(void *)a3
{
  return (unint64_t)a3;
}

+ (unint64_t)setHash:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [a3 allObjects];
  uint64_t v5 = objc_msgSend(v4, "_cn_map:", &__block_literal_global_44);
  uint64_t v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_3_0];

  unint64_t v7 = [a1 arrayHash:v6];
  return v7;
}

uint64_t __25__CNHashBuilder_setHash___block_invoke(uint64_t a1, void *a2)
{
  v2 = NSNumber;
  uint64_t v3 = [a2 hash];

  return [v2 numberWithUnsignedInteger:v3];
}

uint64_t __25__CNHashBuilder_setHash___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

+ (unint64_t)orderedSetHash:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v4 = [a3 array];
  unint64_t v5 = [a1 arrayHash:v4];

  return v5;
}

+ (unint64_t)dictionaryHash:(id)a3
{
  id v4 = a3;
  unint64_t v5 = v4;
  if (v4)
  {
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x2020000000;
    uint64_t v12 = 17;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __32__CNHashBuilder_dictionaryHash___block_invoke;
    v8[3] = &unk_1E56A10F0;
    v8[4] = &v9;
    v8[5] = a1;
    objc_msgSend(v4, "_cn_each:", v8);
    unint64_t v6 = v10[3];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

void __32__CNHashBuilder_dictionaryHash___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  unint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  id v7 = a3;
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v5 objectHash:a2] - v6 + 32 * v6;
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  uint64_t v9 = [*(id *)(a1 + 40) objectHash:v7];

  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v9 - v8 + 32 * v8;
}

+ (unint64_t)integerHash:(int64_t)a3
{
  if (a3 >= 0) {
    return a3;
  }
  else {
    return -a3;
  }
}

+ (unint64_t)unsignedIntegerHash:(unint64_t)a3
{
  return a3;
}

+ (unint64_t)cgpointHash:(CGPoint)a3
{
  double y = a3.y;
  uint64_t v5 = [a1 cgfloatHash:a3.x];
  return [a1 cgfloatHash:y] - v5 + 32 * v5 + 16337;
}

+ (unint64_t)cgrectHash:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  uint64_t v6 = objc_msgSend(a1, "cgpointHash:", a3.origin.x, a3.origin.y);
  return objc_msgSend(a1, "cgsizeHash:", width, height) - v6 + 32 * v6 + 16337;
}

@end