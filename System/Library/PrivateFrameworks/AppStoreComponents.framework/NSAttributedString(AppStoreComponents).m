@interface NSAttributedString(AppStoreComponents)
+ (id)asc_attributedStringWithLockupHeading:()AppStoreComponents compatibleWithTraitCollection:;
+ (id)asc_attributedStringWithLockupTextContainingSymbols:()AppStoreComponents compatibleWithTraitCollection:;
@end

@implementation NSAttributedString(AppStoreComponents)

+ (id)asc_attributedStringWithLockupHeading:()AppStoreComponents compatibleWithTraitCollection:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v5;
  v8 = v7;
  if (v7 && [v7 length])
  {
    v9 = [v8 componentsSeparatedByString:@":::"];
    uint64_t v10 = [v9 count];
    if (v10 == 2)
    {
      id v13 = [v9 objectAtIndexedSubscript:0];
      id v12 = [v9 objectAtIndexedSubscript:1];
    }
    else
    {
      uint64_t v11 = v10 - 1;
      if (v10 == 1)
      {
        id v12 = [v9 objectAtIndexedSubscript:0];
        id v13 = 0;
      }
      else
      {
        id v13 = [v9 objectAtIndexedSubscript:0];
        v14 = objc_msgSend(v9, "subarrayWithRange:", 1, v11);
        id v12 = [v14 componentsJoinedByString:@":::"];
      }
    }
  }
  else
  {
    id v13 = 0;
    id v12 = 0;
  }

  id v15 = v13;
  id v16 = v12;
  if (v16)
  {
    v17 = ASCLockupImageStringForName(v15, v6);
    if (v17)
    {
      id v18 = objc_alloc_init(MEMORY[0x1E4F28E48]);
      [v18 appendAttributedString:v17];
      objc_msgSend(v18, "addAttribute:value:range:", @"ASCLockupHeadingImageName", v15, 0, objc_msgSend(v17, "length"));
      v19 = [v18 mutableString];
      v21 = ASCLocalizedString(@"LOCKUP_HEADING_JOINER", v20);
      [v19 appendString:v21];

      v22 = [v18 mutableString];
      [v22 appendString:v16];

      v23 = (void *)[v18 copy];
    }
    else
    {
      v23 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v16];
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

+ (id)asc_attributedStringWithLockupTextContainingSymbols:()AppStoreComponents compatibleWithTraitCollection:
{
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    id v16 = 0;
    goto LABEL_13;
  }
  id v7 = [v5 componentsSeparatedByString:@":::"];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E48]);
  if (![v7 count])
  {
LABEL_9:
    id v16 = (void *)[v8 copy];
    goto LABEL_12;
  }
  uint64_t v9 = 0;
  while (1)
  {
    uint64_t v10 = [v7 objectAtIndexedSubscript:v9];
    uint64_t v11 = v10;
    if (v9) {
      break;
    }
    id v12 = [v8 mutableString];
    [v12 appendString:v11];
LABEL_8:

    if (++v9 >= (unint64_t)[v7 count]) {
      goto LABEL_9;
    }
  }
  id v12 = v10;
  uint64_t v13 = ASCLockupImageStringForName(v12, v6);
  if (v13)
  {
    v14 = (void *)v13;
    id v15 = objc_msgSend(NSString, "stringWithFormat:", @"ASCLockupTextImageName %ld ", v9);
    [v8 appendAttributedString:v14];
    objc_msgSend(v8, "addAttribute:value:range:", v15, v12, 0, objc_msgSend(v14, "length"));

    goto LABEL_8;
  }
  id v16 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v5];

LABEL_12:
LABEL_13:

  return v16;
}

@end