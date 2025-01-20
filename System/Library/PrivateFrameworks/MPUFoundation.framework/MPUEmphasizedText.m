@interface MPUEmphasizedText
+ (BOOL)supportsSecureCoding;
+ (id)attributedStringWithString:(id)a3 emphasisDelimiter:(id)a4 regularTextAttributes:(id)a5 emphasizedTextAttributes:(id)a6;
+ (id)attributedStringWithString:(id)a3 emphasisSubstring:(id)a4 options:(unint64_t)a5 regularTextAttributes:(id)a6 emphasizedTextAttributes:(id)a7;
+ (id)emphasizedTextUsingString:(id)a3 emphasisDelimiter:(id)a4;
+ (id)emphasizedTextUsingString:(id)a3 emphasisSubstring:(id)a4 options:(unint64_t)a5;
+ (id)emphasizedTextWithString:(id)a3;
+ (void)_enumerateEmphasisRangesInString:(id)a3 withEmphasisDelimiter:(id)a4 usingBlock:(id)a5;
+ (void)_enumerateEmphasisRangesInString:(id)a3 withEmphasisSubstring:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6;
- (BOOL)isEqual:(id)a3;
- (MPUEmphasizedText)init;
- (MPUEmphasizedText)initWithCoder:(id)a3;
- (MPUEmphasizedText)initWithString:(id)a3 emphasisRanges:(id)a4;
- (NSArray)emphasisRanges;
- (NSString)string;
- (id)description;
- (id)newAttributedStringWithRegularTextAttributes:(id)a3 emphasizedTextAttributes:(id)a4;
- (id)newAttributedStringWithTextAttributes:(id)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateEmphasisRangesUsingBlock:(id)a3;
@end

@implementation MPUEmphasizedText

- (MPUEmphasizedText)init
{
  return [(MPUEmphasizedText *)self initWithString:0 emphasisRanges:0];
}

+ (id)attributedStringWithString:(id)a3 emphasisDelimiter:(id)a4 regularTextAttributes:(id)a5 emphasizedTextAttributes:(id)a6
{
  id v10 = a6;
  if (a3)
  {
    id v11 = a5;
    id v12 = a4;
    id v13 = a3;
    v14 = [v13 stringByReplacingOccurrencesOfString:v12 withString:&stru_26DABBB08];
    v15 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v14 attributes:0];
    objc_msgSend(v15, "addAttributes:range:", v11, 0, objc_msgSend(v15, "length"));

    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __113__MPUEmphasizedText_attributedStringWithString_emphasisDelimiter_regularTextAttributes_emphasizedTextAttributes___block_invoke;
    v18[3] = &unk_2647D1098;
    id v16 = v15;
    id v19 = v16;
    id v20 = v10;
    [a1 _enumerateEmphasisRangesInString:v13 withEmphasisDelimiter:v12 usingBlock:v18];
  }
  else
  {
    id v16 = 0;
  }

  return v16;
}

uint64_t __113__MPUEmphasizedText_attributedStringWithString_emphasisDelimiter_regularTextAttributes_emphasizedTextAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", *(void *)(a1 + 40), a2, a3);
}

+ (id)attributedStringWithString:(id)a3 emphasisSubstring:(id)a4 options:(unint64_t)a5 regularTextAttributes:(id)a6 emphasizedTextAttributes:(id)a7
{
  id v12 = a7;
  if (a3)
  {
    id v13 = (objc_class *)MEMORY[0x263F089B8];
    id v14 = a6;
    id v15 = a4;
    id v16 = a3;
    v17 = (void *)[[v13 alloc] initWithString:v16 attributes:0];
    objc_msgSend(v17, "addAttributes:range:", v14, 0, objc_msgSend(v17, "length"));

    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __121__MPUEmphasizedText_attributedStringWithString_emphasisSubstring_options_regularTextAttributes_emphasizedTextAttributes___block_invoke;
    v20[3] = &unk_2647D1098;
    id v18 = v17;
    id v21 = v18;
    id v22 = v12;
    [a1 _enumerateEmphasisRangesInString:v16 withEmphasisSubstring:v15 options:a5 usingBlock:v20];
  }
  else
  {
    id v18 = 0;
  }

  return v18;
}

uint64_t __121__MPUEmphasizedText_attributedStringWithString_emphasisSubstring_options_regularTextAttributes_emphasizedTextAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", *(void *)(a1 + 40), a2, a3);
}

- (MPUEmphasizedText)initWithString:(id)a3 emphasisRanges:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)MPUEmphasizedText;
  v8 = [(MPUEmphasizedText *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    string = v8->_string;
    v8->_string = (NSString *)v9;

    if ([v7 count])
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x263EFF9C0]) initWithArray:v7];
      emphasisRangesSet = v8->_emphasisRangesSet;
      v8->_emphasisRangesSet = (NSMutableSet *)v11;
    }
    else
    {
      emphasisRangesSet = v8->_emphasisRangesSet;
      v8->_emphasisRangesSet = 0;
    }
  }
  return v8;
}

+ (id)emphasizedTextWithString:(id)a3
{
  id v3 = a3;
  v4 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:v3 emphasisRanges:0];

  return v4;
}

+ (id)emphasizedTextUsingString:(id)a3 emphasisDelimiter:(id)a4
{
  v5 = (objc_class *)MEMORY[0x263EFF980];
  id v6 = a4;
  id v7 = a3;
  v8 = (void *)[[v5 alloc] initWithCapacity:2];
  uint64_t v9 = [v7 stringByReplacingOccurrencesOfString:v6 withString:&stru_26DABBB08];
  id v10 = objc_opt_class();
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __65__MPUEmphasizedText_emphasizedTextUsingString_emphasisDelimiter___block_invoke;
  v14[3] = &unk_2647D10C0;
  id v15 = v8;
  id v11 = v8;
  [v10 _enumerateEmphasisRangesInString:v7 withEmphasisDelimiter:v6 usingBlock:v14];

  id v12 = (void *)[objc_alloc((Class)objc_opt_class()) initWithString:v9 emphasisRanges:v11];

  return v12;
}

void __65__MPUEmphasizedText_emphasizedTextUsingString_emphasisDelimiter___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

+ (id)emphasizedTextUsingString:(id)a3 emphasisSubstring:(id)a4 options:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1;
  id v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  uint64_t v9 = objc_opt_class();
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __73__MPUEmphasizedText_emphasizedTextUsingString_emphasisSubstring_options___block_invoke;
  v13[3] = &unk_2647D10E8;
  v13[4] = &v14;
  [v9 _enumerateEmphasisRangesInString:v7 withEmphasisSubstring:v8 options:a5 usingBlock:v13];
  id v10 = objc_alloc((Class)objc_opt_class());
  id v11 = (void *)[v10 initWithString:v7 emphasisRanges:v15[5]];
  _Block_object_dispose(&v14, 8);

  return v11;
}

void __73__MPUEmphasizedText_emphasizedTextUsingString_emphasisSubstring_options___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (!v5)
  {
    uint64_t v7 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:1];
    uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;

    v5 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  }
  objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", a2, a3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  [v5 addObject:v10];
}

- (id)description
{
  id v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MPUEmphasizedText *)self string];
  id v6 = [(MPUEmphasizedText *)self emphasisRanges];
  uint64_t v7 = [v3 stringWithFormat:@"<%@ %p '%@' emphasisRanges:%@>", v4, self, v5, v6];

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_string hash];
  return [(NSMutableSet *)self->_emphasisRangesSet hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (MPUEmphasizedText *)a3;
  if (self == v4) {
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (string = self->_string, v4->_string != string) && !-[NSString isEqualToString:](string, "isEqualToString:"))
  {
    char v7 = 0;
    goto LABEL_9;
  }
  emphasisRangesSet = v4->_emphasisRangesSet;
  if (emphasisRangesSet == self->_emphasisRangesSet) {
LABEL_7:
  }
    char v7 = 1;
  else {
    char v7 = -[NSMutableSet isEqualToSet:](emphasisRangesSet, "isEqualToSet:");
  }
LABEL_9:

  return v7;
}

- (MPUEmphasizedText)initWithCoder:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPUEmphasizedTextString"];
  id v6 = (void *)MEMORY[0x263EFFA08];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_msgSend(v6, "setWithObjects:", v7, objc_opt_class(), 0);
  uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"MPUEmphasizedTextEmphasisRanges"];

  if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
LABEL_13:
    id v15 = 0;
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v10 = v9;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v18;
      while (2)
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v18 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {

            goto LABEL_13;
          }
          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v12) {
          continue;
        }
        break;
      }
    }

    self = [(MPUEmphasizedText *)self initWithString:v5 emphasisRanges:v10];
    id v15 = self;
  }

  return v15;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  id v4 = [(MPUEmphasizedText *)self string];
  if (v4) {
    [v6 encodeObject:v4 forKey:@"MPUEmphasizedTextString"];
  }
  v5 = [(MPUEmphasizedText *)self emphasisRanges];
  if (v5) {
    [v6 encodeObject:v5 forKey:@"MPUEmphasizedTextEmphasisRanges"];
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSArray)emphasisRanges
{
  return (NSArray *)[(NSMutableSet *)self->_emphasisRangesSet allObjects];
}

- (NSString)string
{
  v2 = (void *)[(NSString *)self->_string copy];

  return (NSString *)v2;
}

- (void)enumerateEmphasisRangesUsingBlock:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    emphasisRangesSet = self->_emphasisRangesSet;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __55__MPUEmphasizedText_enumerateEmphasisRangesUsingBlock___block_invoke;
    v7[3] = &unk_2647D1110;
    id v8 = v4;
    [(NSMutableSet *)emphasisRangesSet enumerateObjectsUsingBlock:v7];
  }
}

uint64_t __55__MPUEmphasizedText_enumerateEmphasisRangesUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v6 = [a2 rangeValue];
  uint64_t v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v4 + 16);

  return v7(v4, v6, v5, a3);
}

- (id)newAttributedStringWithRegularTextAttributes:(id)a3 emphasizedTextAttributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(MPUEmphasizedText *)self string];
  if (v8)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v8 attributes:0];
    objc_msgSend(v9, "addAttributes:range:", v6, 0, objc_msgSend(v9, "length"));
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __91__MPUEmphasizedText_newAttributedStringWithRegularTextAttributes_emphasizedTextAttributes___block_invoke;
    v14[3] = &unk_2647D1098;
    id v10 = v9;
    id v15 = v10;
    id v16 = v7;
    [(MPUEmphasizedText *)self enumerateEmphasisRangesUsingBlock:v14];
    uint64_t v11 = v16;
    id v12 = v10;
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

uint64_t __91__MPUEmphasizedText_newAttributedStringWithRegularTextAttributes_emphasizedTextAttributes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAttributes:range:", *(void *)(a1 + 40), a2, a3);
}

- (id)newAttributedStringWithTextAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(MPUEmphasizedText *)self string];
  if (v5) {
    id v6 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5 attributes:v4];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

+ (void)_enumerateEmphasisRangesInString:(id)a3 withEmphasisSubstring:(id)a4 options:(unint64_t)a5 usingBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = (void (**)(id, uint64_t, uint64_t, char *))a6;
  char v18 = 0;
  if ([v10 length])
  {
    unint64_t v12 = [v9 length];
    unint64_t v13 = 0;
    do
    {
      if (v12 <= v13) {
        break;
      }
      uint64_t v14 = objc_msgSend(v9, "rangeOfString:options:range:", v10, a5);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      uint64_t v16 = v14;
      uint64_t v17 = v15;
      v11[2](v11, v14, v15, &v18);
      unint64_t v13 = v16 + v17;
    }
    while (!v18);
  }
}

+ (void)_enumerateEmphasisRangesInString:(id)a3 withEmphasisDelimiter:(id)a4 usingBlock:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(id, void, unint64_t, char *))a5;
  if ((unint64_t)[v7 length] < 2) {
    goto LABEL_18;
  }
  char v22 = 0;
  uint64_t v10 = [v7 rangeOfString:v8];
  if (v10 >= 1)
  {
    unint64_t v11 = [v7 length];
    unint64_t v12 = v10 >= v11 ? v11 : v10;
    v9[2](v9, 0, v12, &v22);
    if (v22) {
      goto LABEL_18;
    }
  }
  if (v10 >= (unint64_t)([v7 length] - 2)) {
    goto LABEL_18;
  }
  id v21 = [v7 substringFromIndex:v10];
  unint64_t v13 = [v21 componentsSeparatedByString:v8];
  uint64_t v14 = [v13 count];
  if (!v14) {
    goto LABEL_17;
  }
  uint64_t v15 = v14;
  uint64_t v16 = 0;
  char v17 = 0;
  while (1)
  {
    char v18 = [v13 objectAtIndex:v16];
    uint64_t v19 = [v18 length];
    if (v19) {
      break;
    }
LABEL_14:

    if (v15 == ++v16) {
      goto LABEL_17;
    }
  }
  uint64_t v20 = v19;
  if ((v17 & 1) != 0 || (v9[2](v9, v10, v19, &v22), !v22))
  {
    v10 += v20;
    ++v17;
    goto LABEL_14;
  }

LABEL_17:
LABEL_18:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_string, 0);

  objc_storeStrong((id *)&self->_emphasisRangesSet, 0);
}

@end