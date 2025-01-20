@interface NSURL(DataDetectorsSupport)
+ (id)dd_URLWithPotentiallyInvalidURLString:()DataDetectorsSupport;
@end

@implementation NSURL(DataDetectorsSupport)

+ (id)dd_URLWithPotentiallyInvalidURLString:()DataDetectorsSupport
{
  id v4 = a3;
  v5 = [a1 URLWithString:v4];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
    goto LABEL_15;
  }
  uint64_t v8 = [v4 rangeOfString:@"://"];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = [v4 rangeOfString:@":"];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
      v12 = [v4 stringByAddingPercentEncodingWithAllowedCharacters:v11];
    }
    else
    {
      unint64_t v21 = v10;
      v11 = [v4 substringToIndex:v10];
      ++v21;
      unint64_t v22 = [v4 length];
      v12 = [v4 substringFromIndex:v21];
      if (v21 < v22)
      {
        v23 = [MEMORY[0x1E4F28B88] URLPathAllowedCharacterSet];
        uint64_t v24 = [v12 stringByAddingPercentEncodingWithAllowedCharacters:v23];

        v25 = [NSString stringWithFormat:@"%@:%@", v11, v24];
        id v7 = [a1 URLWithString:v25];

        v12 = (void *)v24;
LABEL_12:

LABEL_13:
        goto LABEL_15;
      }
    }
    id v7 = [a1 URLWithString:v12];
    goto LABEL_12;
  }
  uint64_t v13 = v8 + v9;
  if (v8 + v9 < (unint64_t)[v4 length])
  {
    uint64_t v14 = objc_msgSend(v4, "rangeOfString:options:range:", @"/", 0, v13, objc_msgSend(v4, "length") - v13);
    uint64_t v16 = v14 + v15;
    id v7 = 0;
    if (v14 + v15 >= (unint64_t)[v4 length]) {
      goto LABEL_15;
    }
    v11 = [v4 substringToIndex:v16];
    v17 = [v4 substringFromIndex:v16];
    v18 = [MEMORY[0x1E4F28B88] URLFragmentAllowedCharacterSet];
    v19 = [v17 stringByAddingPercentEncodingWithAllowedCharacters:v18];

    v20 = [NSString stringWithFormat:@"%@%@", v11, v19];
    id v7 = [a1 URLWithString:v20];

    goto LABEL_13;
  }
  id v7 = 0;
LABEL_15:

  return v7;
}

@end