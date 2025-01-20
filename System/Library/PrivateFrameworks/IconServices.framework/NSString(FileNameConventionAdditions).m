@interface NSString(FileNameConventionAdditions)
- (id)_IS_imageMetadataFromFileName;
- (id)_IS_scaleableResourceMetadataFromFileName;
- (id)imageMetadataFromFileName;
- (id)scaleableResourceMetadataFromFileName;
- (void)_IS_imageMetadataFromFileName;
- (void)_IS_scaleableResourceMetadataFromFileName;
@end

@implementation NSString(FileNameConventionAdditions)

- (id)imageMetadataFromFileName
{
  v2 = objc_opt_new();
  v3 = objc_msgSend(a1, "_IS_imageMetadataFromFileName");
  v4 = [v3 name];

  if (v4)
  {
    v5 = [v3 name];
    [v2 setObject:v5 forKeyedSubscript:kIconCompilerImageInfoNameKey];
  }
  v6 = [v3 dimension];

  if (v6)
  {
    v7 = [v3 dimension];
    [v2 setObject:v7 forKeyedSubscript:kIconCompilerImageInfoSizeKey];
  }
  v8 = [v3 scale];

  if (v8)
  {
    v9 = [v3 scale];
    [v2 setObject:v9 forKeyedSubscript:kIconCompilerImageInfoScaleKey];
  }
  else
  {
    [v2 setObject:&unk_1F064AF90 forKeyedSubscript:kIconCompilerImageInfoScaleKey];
  }
  v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "selectedVariant"));
  [v2 setObject:v10 forKeyedSubscript:kIconCompilerImageInfoIsSelectedVariantKey];

  return v2;
}

- (id)scaleableResourceMetadataFromFileName
{
  v2 = objc_opt_new();
  v3 = objc_msgSend(a1, "_IS_scaleableResourceMetadataFromFileName");
  v4 = [v3 name];

  if (v4)
  {
    v5 = [v3 name];
    [v2 setObject:v5 forKeyedSubscript:kIconCompilerImageInfoNameKey];
  }
  v6 = [v3 dimension];

  if (v6)
  {
    v7 = [v3 dimension];
    [v2 setObject:v7 forKeyedSubscript:kIconCompilerImageInfoSizeKey];
  }
  v8 = [v3 scale];

  if (v8)
  {
    v9 = [v3 scale];
    [v2 setObject:v9 forKeyedSubscript:kIconCompilerImageInfoScaleKey];
  }
  else
  {
    [v2 setObject:&unk_1F064AF90 forKeyedSubscript:kIconCompilerImageInfoScaleKey];
  }
  v10 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v3, "selectedVariant"));
  [v2 setObject:v10 forKeyedSubscript:kIconCompilerImageInfoIsSelectedVariantKey];

  return v2;
}

- (id)_IS_imageMetadataFromFileName
{
  v2 = objc_opt_new();
  if (_IS_imageMetadataFromFileName_onceToken != -1) {
    dispatch_once(&_IS_imageMetadataFromFileName_onceToken, &__block_literal_global_26);
  }
  v3 = objc_msgSend((id)_IS_imageMetadataFromFileName_matcher, "matchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  if ([v3 count])
  {
    if ([v3 count] != 1) {
      -[NSString(FileNameConventionAdditions) _IS_imageMetadataFromFileName]();
    }
    v4 = [v3 lastObject];
    if ([v4 numberOfRanges] != 5) {
      -[NSString(FileNameConventionAdditions) _IS_imageMetadataFromFileName]();
    }
    uint64_t v5 = [v4 rangeAtIndex:1];
    if (!v6)
    {

      id v22 = 0;
      goto LABEL_22;
    }
    v7 = objc_msgSend(a1, "substringWithRange:", v5, v6);
    [v2 setName:v7];

    [v2 setSelectedVariant:0];
    [v4 rangeAtIndex:2];
    if (v8) {
      [v2 setSelectedVariant:1];
    }
    uint64_t v9 = [v4 rangeAtIndex:3];
    if (v10)
    {
      v11 = NSNumber;
      v12 = objc_msgSend(a1, "substringWithRange:", v9, v10);
      v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "integerValue"));
      [v2 setDimension:v13];
    }
    uint64_t v14 = [v4 rangeAtIndex:4];
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = v15;
      if (v15)
      {
        uint64_t v17 = v14;
        if (v14 + v15 < (unint64_t)[a1 length])
        {
          v18 = objc_msgSend(a1, "substringWithRange:", v17, v16);
          if (v18)
          {
            v19 = v18;
            v20 = NSNumber;
            if ([v18 integerValue] < 1) {
              uint64_t v21 = 1;
            }
            else {
              uint64_t v21 = [v19 integerValue];
            }
            v23 = [v20 numberWithInteger:v21];
            [v2 setScale:v23];
          }
        }
      }
    }
  }
  id v22 = v2;
LABEL_22:

  return v22;
}

- (id)_IS_scaleableResourceMetadataFromFileName
{
  v2 = objc_opt_new();
  if (_IS_scaleableResourceMetadataFromFileName_onceToken != -1) {
    dispatch_once(&_IS_scaleableResourceMetadataFromFileName_onceToken, &__block_literal_global_97);
  }
  v3 = objc_msgSend((id)_IS_scaleableResourceMetadataFromFileName_matcher, "matchesInString:options:range:", a1, 0, 0, objc_msgSend(a1, "length"));
  if (![v3 count]) {
    goto LABEL_10;
  }
  if ([v3 count] != 1) {
    -[NSString(FileNameConventionAdditions) _IS_scaleableResourceMetadataFromFileName]();
  }
  v4 = [v3 lastObject];
  if ([v4 numberOfRanges] != 3) {
    -[NSString(FileNameConventionAdditions) _IS_scaleableResourceMetadataFromFileName]();
  }
  uint64_t v5 = [v4 rangeAtIndex:1];
  if (v6)
  {
    v7 = objc_msgSend(a1, "substringWithRange:", v5, v6);
    [v2 setName:v7];

    [v2 setSelectedVariant:0];
    [v4 rangeAtIndex:2];
    if (v8) {
      [v2 setSelectedVariant:1];
    }

LABEL_10:
    id v9 = v2;
    goto LABEL_12;
  }

  id v9 = 0;
LABEL_12:

  return v9;
}

- (void)_IS_imageMetadataFromFileName
{
  __assert_rtn("-[NSString(FileNameConventionAdditions) _IS_imageMetadataFromFileName]", "NSString+FileNameConventionAdditions.m", 118, "[matches count] == 1");
}

- (void)_IS_scaleableResourceMetadataFromFileName
{
  __assert_rtn("-[NSString(FileNameConventionAdditions) _IS_scaleableResourceMetadataFromFileName]", "NSString+FileNameConventionAdditions.m", 183, "[matches count] == 1");
}

@end