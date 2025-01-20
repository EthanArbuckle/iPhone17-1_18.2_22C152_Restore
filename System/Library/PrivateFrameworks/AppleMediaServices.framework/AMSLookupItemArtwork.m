@interface AMSLookupItemArtwork
- (AMSLookupItemArtwork)initWithArtworkDictionary:(id)a3;
- (NSDictionary)artworkDictionary;
- (NSString)URLString;
- (double)height;
- (double)width;
- (id)URLWithHeight:(int64_t)a3 width:(int64_t)a4 cropStyle:(id)a5 format:(id)a6;
- (id)colorWithKind:(id)a3;
@end

@implementation AMSLookupItemArtwork

- (AMSLookupItemArtwork)initWithArtworkDictionary:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AMSLookupItemArtwork;
  v6 = [(AMSLookupItemArtwork *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_artworkDictionary, a3);
  }

  return v7;
}

- (id)colorWithKind:(id)a3
{
  id v4 = a3;
  id v5 = [(AMSLookupItemArtwork *)self artworkDictionary];
  v6 = [v5 objectForKeyedSubscript:v4];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;

    if (v7)
    {
      id v7 = v7;
      int v8 = strtoul((const char *)[v7 UTF8String], 0, 16);
      objc_super v9 = objc_alloc_init(AMSLookupItemArtworkColor);
      [(AMSLookupItemArtworkColor *)v9 setRed:(double)BYTE2(v8) / 255.0];
      [(AMSLookupItemArtworkColor *)v9 setGreen:(double)BYTE1(v8) / 255.0];
      [(AMSLookupItemArtworkColor *)v9 setBlue:(double)v8 / 255.0];
      [(AMSLookupItemArtworkColor *)v9 setAlpha:1.0];
      goto LABEL_6;
    }
  }
  else
  {

    id v7 = 0;
  }
  objc_super v9 = 0;
LABEL_6:

  return v9;
}

- (double)width
{
  v2 = [(AMSLookupItemArtwork *)self artworkDictionary];
  v3 = [v2 objectForKeyedSubscript:@"width"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (double)height
{
  v2 = [(AMSLookupItemArtwork *)self artworkDictionary];
  v3 = [v2 objectForKeyedSubscript:@"height"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  [v4 doubleValue];
  double v6 = v5;

  return v6;
}

- (NSString)URLString
{
  v2 = [(AMSLookupItemArtwork *)self artworkDictionary];
  v3 = [v2 objectForKeyedSubscript:@"url"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  return (NSString *)v4;
}

- (id)URLWithHeight:(int64_t)a3 width:(int64_t)a4 cropStyle:(id)a5 format:(id)a6
{
  v31[12] = *MEMORY[0x1E4F143B8];
  v10 = (__CFString *)a5;
  v11 = (__CFString *)a6;
  if (v10) {
    v12 = v10;
  }
  else {
    v12 = @"bb";
  }
  if (v11) {
    v13 = v11;
  }
  else {
    v13 = @"jpg";
  }
  v14 = [(AMSLookupItemArtwork *)self URLString];
  v15 = v14;
  if (!v14)
  {
    v23 = 0;
    goto LABEL_24;
  }
  v28 = v14;
  id v16 = v14;
  v31[0] = @"{h}";
  v31[1] = a3;
  v31[2] = 0;
  v31[3] = @"{w}";
  v31[4] = a4;
  v31[5] = 0;
  v31[6] = @"{f}";
  v31[7] = 0;
  v29 = v13;
  v31[8] = v13;
  v31[9] = @"{c}";
  v31[10] = 0;
  v30 = v12;
  uint64_t v17 = 0;
  id v18 = 0;
  v31[11] = v12;
  do
  {
    uint64_t v20 = [v16 rangeOfString:v31[v17] options:4];
    if (v20 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_16;
    }
    uint64_t v21 = v19;
    id v22 = (id)v31[v17 + 2];
    if (v22)
    {
      if (!v18) {
        goto LABEL_14;
      }
    }
    else
    {
      id v22 = (id)objc_msgSend([NSString alloc], "initWithFormat:", @"%ld", v31[v17 + 1]);
      if (!v18)
      {
LABEL_14:
        id v18 = (id)[v16 mutableCopy];

        id v16 = v18;
      }
    }
    objc_msgSend(v18, "replaceCharactersInRange:withString:", v20, v21, v22);

LABEL_16:
    v17 += 3;
  }
  while (v17 != 12);
  v13 = v29;
  v12 = v30;
  v15 = v28;
  if (!v18
    || ([MEMORY[0x1E4F1CB10] URLWithString:v18],
        (v23 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    v24 = (void *)MEMORY[0x1E4F1CB10];
    v25 = [(AMSLookupItemArtwork *)self URLString];
    v23 = [v24 URLWithString:v25];
  }
  for (uint64_t i = 0; i != -12; i -= 3)
  {
  }
LABEL_24:

  return v23;
}

- (NSDictionary)artworkDictionary
{
  return self->_artworkDictionary;
}

- (void).cxx_destruct
{
}

@end