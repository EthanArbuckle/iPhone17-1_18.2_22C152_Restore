@interface IFResourceMetadata
+ (id)metadataWithFileName:(id)a3;
- (BOOL)selectedVariant;
- (NSNumber)dimension;
- (NSNumber)scale;
- (NSString)name;
- (void)setDimension:(id)a3;
- (void)setName:(id)a3;
- (void)setScale:(id)a3;
- (void)setSelectedVariant:(BOOL)a3;
@end

@implementation IFResourceMetadata

+ (id)metadataWithFileName:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  if (metadataWithFileName__onceToken != -1) {
    dispatch_once(&metadataWithFileName__onceToken, &__block_literal_global_4);
  }
  v5 = objc_msgSend((id)metadataWithFileName__matcher, "matchesInString:options:range:", v3, 0, 0, objc_msgSend(v3, "length"));
  if ([v5 count])
  {
    if ([v5 count] != 1) {
      +[IFResourceMetadata metadataWithFileName:]();
    }
    v6 = [v5 lastObject];
    if ([v6 numberOfRanges] != 6) {
      +[IFResourceMetadata metadataWithFileName:]();
    }
    uint64_t v7 = [v6 rangeAtIndex:1];
    if (!v8)
    {

      id v24 = 0;
      goto LABEL_22;
    }
    v9 = objc_msgSend(v3, "substringWithRange:", v7, v8);
    [v4 setName:v9];

    [v4 setSelectedVariant:0];
    [v6 rangeAtIndex:2];
    if (v10) {
      [v4 setSelectedVariant:1];
    }
    uint64_t v11 = [v6 rangeAtIndex:3];
    if (v12)
    {
      v13 = NSNumber;
      v14 = objc_msgSend(v3, "substringWithRange:", v11, v12);
      [v14 floatValue];
      v15 = objc_msgSend(v13, "numberWithFloat:");
      [v4 setDimension:v15];
    }
    uint64_t v16 = [v6 rangeAtIndex:4];
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v18 = v17;
      if (v17)
      {
        uint64_t v19 = v16;
        if (v16 + v17 < (unint64_t)[v3 length])
        {
          v20 = objc_msgSend(v3, "substringWithRange:", v19, v18);
          if (v20)
          {
            v21 = v20;
            v22 = NSNumber;
            if ([v20 integerValue] < 1) {
              uint64_t v23 = 1;
            }
            else {
              uint64_t v23 = [v21 integerValue];
            }
            v25 = [v22 numberWithInteger:v23];
            [v4 setScale:v25];
          }
        }
      }
    }
  }
  id v24 = v4;
LABEL_22:

  return v24;
}

void __43__IFResourceMetadata_metadataWithFileName___block_invoke()
{
  v0 = (void *)metadataWithFileName__regexp;
  metadataWithFileName__regexp = @"^(.+?)[_|-]?(?:\\[(selected)\\])?([0-9]+.?[0-9]?)?(?:x[0-9]+)?(?:@([1|2|3])x)?(~ipad|~iphone)*$";

  if (!metadataWithFileName__matcher)
  {
    uint64_t v1 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"^(.+?)[_|-]?(?:\\[(selected)\\])?([0-9]+.?[0-9]?)?(?:x[0-9]+)?(?:@([1|2|3])x)?(~ipad|~iphone)*$" options:0 error:0];
    v2 = (void *)metadataWithFileName__matcher;
    metadataWithFileName__matcher = v1;

    if (!metadataWithFileName__matcher) {
      __43__IFResourceMetadata_metadataWithFileName___block_invoke_cold_1();
    }
  }
}

- (NSNumber)dimension
{
  return (NSNumber *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDimension:(id)a3
{
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setName:(id)a3
{
}

- (NSNumber)scale
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (void)setScale:(id)a3
{
}

- (BOOL)selectedVariant
{
  return self->_selectedVariant;
}

- (void)setSelectedVariant:(BOOL)a3
{
  self->_selectedVariant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scale, 0);
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_diension, 0);
}

+ (void)metadataWithFileName:.cold.1()
{
  __assert_rtn("+[IFResourceMetadata metadataWithFileName:]", "IFResourceMetadata.m", 61, "numberOfRanges == 6");
}

+ (void)metadataWithFileName:.cold.2()
{
  __assert_rtn("+[IFResourceMetadata metadataWithFileName:]", "IFResourceMetadata.m", 58, "[matches count] == 1");
}

void __43__IFResourceMetadata_metadataWithFileName___block_invoke_cold_1()
{
}

@end