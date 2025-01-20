@interface _DKCategoryCache
+ (id)sharedCached;
- (id)categoryWithInteger:(int64_t)a3 type:(id)a4;
@end

@implementation _DKCategoryCache

- (id)categoryWithInteger:(int64_t)a3 type:(id)a4
{
  id v6 = a4;
  if (categoryWithInteger_type__onceToken != -1) {
    dispatch_once(&categoryWithInteger_type__onceToken, &__block_literal_global_96);
  }
  if ((unint64_t)a3 > 1) {
    goto LABEL_8;
  }
  if (!v6)
  {
    v10 = @"?";
    goto LABEL_10;
  }
  uint64_t v7 = [v6 typeCode];
  if (v7 != categoryWithInteger_type__BOOLTypeCode)
  {
    uint64_t v8 = [v6 typeCode];
    if (v8 != categoryWithInteger_type__anyTypeCode)
    {
LABEL_8:
      v11 = 0;
      goto LABEL_15;
    }
  }
  v9 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v6, "typeCode"));
  v10 = [v9 stringValue];

LABEL_10:
  v12 = NSString;
  v13 = [NSNumber numberWithInteger:a3];
  v14 = [v13 stringValue];
  v15 = [v12 stringWithFormat:@"%@.%@", v14, v10];

  v16 = [(_DKCategoryCache *)self objectForKey:v15];
  v17 = v16;
  if (v16)
  {
    v11 = v16;
  }
  else
  {
    v11 = [[_DKCategory alloc] initWithInteger:a3 type:v6 cache:0];
    if (v11) {
      [(_DKCategoryCache *)self setObject:v11 forKey:v15];
    }
  }

LABEL_15:
  return v11;
}

+ (id)sharedCached
{
  if (sharedCached_onceToken_0 != -1) {
    dispatch_once(&sharedCached_onceToken_0, &__block_literal_global_29);
  }
  v2 = (void *)sharedCached_sharedCache_0;
  return v2;
}

@end