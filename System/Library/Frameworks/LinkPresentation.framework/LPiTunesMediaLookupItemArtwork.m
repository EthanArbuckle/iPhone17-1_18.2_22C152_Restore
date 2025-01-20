@interface LPiTunesMediaLookupItemArtwork
+ (id)colorForColorKind:(id)a3 inColorDictionary:(id)a4;
- (LPiTunesMediaLookupItemArtwork)initWithDictionary:(id)a3;
- (id)URLWithHeight:(int64_t)a3 width:(int64_t)a4 cropStyle:(id)a5 format:(id)a6;
- (id)colors;
- (int64_t)height;
- (int64_t)width;
@end

@implementation LPiTunesMediaLookupItemArtwork

- (LPiTunesMediaLookupItemArtwork)initWithDictionary:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)LPiTunesMediaLookupItemArtwork;
  v6 = [(LPiTunesMediaLookupItemArtwork *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dictionary, a3);
    v8 = v7;
  }

  return v7;
}

- (int64_t)height
{
  v2 = [(NSDictionary *)self->_dictionary objectForKey:@"height"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (int64_t)width
{
  v2 = [(NSDictionary *)self->_dictionary objectForKey:@"width"];
  if (objc_opt_respondsToSelector()) {
    int64_t v3 = [v2 integerValue];
  }
  else {
    int64_t v3 = 0;
  }

  return v3;
}

- (id)colors
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v15[0] = @"bgColor";
  v15[1] = @"textColor1";
  v15[2] = @"textColor2";
  v15[3] = @"textColor3";
  v15[4] = @"textColor4";
  v4 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v15, 5, 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        v9 = [(NSDictionary *)self->_dictionary objectForKey:v8];
        if (v9)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v3 setObject:v9 forKey:v8];
          }
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }

  return v3;
}

- (id)URLWithHeight:(int64_t)a3 width:(int64_t)a4 cropStyle:(id)a5 format:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  long long v12 = [(NSDictionary *)self->_dictionary objectForKeyedSubscript:@"url"];
  if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    uint64_t v19 = 0;
    v20 = &v19;
    uint64_t v21 = 0x3032000000;
    v22 = __Block_byref_object_copy__1;
    v23 = __Block_byref_object_dispose__1;
    id v24 = 0;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3032000000;
    v17[3] = __Block_byref_object_copy__1;
    v17[4] = __Block_byref_object_dispose__1;
    id v18 = v12;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __71__LPiTunesMediaLookupItemArtwork_URLWithHeight_width_cropStyle_format___block_invoke;
    v16[3] = &unk_1E5B059A0;
    v16[4] = v17;
    v16[5] = &v19;
    long long v13 = (void (**)(void *, __CFString *, int64_t, void))_Block_copy(v16);
    v13[2](v13, @"{h}", a3, 0);
    v13[2](v13, @"{w}", a4, 0);
    ((void (**)(void *, __CFString *, int64_t, id))v13)[2](v13, @"{f}", 0, v11);
    ((void (**)(void *, __CFString *, int64_t, id))v13)[2](v13, @"{c}", 0, v10);
    if (v20[5])
    {
      long long v14 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
    }
    else
    {
      long long v14 = 0;
    }

    _Block_object_dispose(v17, 8);
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    long long v14 = 0;
  }

  return v14;
}

void __71__LPiTunesMediaLookupItemArtwork_URLWithHeight_width_cropStyle_format___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v16 = a2;
  id v7 = a4;
  uint64_t v9 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) rangeOfString:v16 options:4];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = v8;
    if (!v7)
    {
      id v11 = [NSNumber numberWithInteger:a3];
      id v7 = [v11 stringValue];
    }
    long long v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    if (!v12)
    {
      uint64_t v13 = [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) mutableCopy];
      uint64_t v14 = *(void *)(*(void *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
      long long v12 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    }
    objc_msgSend(v12, "replaceCharactersInRange:withString:", v9, v10, v7);
  }
}

+ (id)colorForColorKind:(id)a3 inColorDictionary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:v5];
    uint64_t v9 = v8;
    if (v8)
    {
      unint64_t v10 = strtoul((const char *)[v8 UTF8String], 0, 16);
      id v11 = [MEMORY[0x1E4FB1618] colorWithRed:(double)BYTE2(v10) / 255.0 green:(double)BYTE1(v10) / 255.0 blue:(double)v10 / 255.0 alpha:1.0];
    }
    else
    {
      id v11 = 0;
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
}

@end