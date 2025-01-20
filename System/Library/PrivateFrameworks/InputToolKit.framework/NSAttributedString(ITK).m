@interface NSAttributedString(ITK)
- (id)itk_attributedStringByReplacingCharactersInSet:()ITK withString:;
- (id)itk_attributedStringByReplacingNewlineCharactersWithWhiteSpace;
- (uint64_t)itk_range;
- (void)itk_enumerateClampedAttribute:()ITK inRange:options:usingBlock:;
- (void)itk_enumerateUnclampedAttribute:()ITK inRange:options:usingBlock:;
@end

@implementation NSAttributedString(ITK)

- (uint64_t)itk_range
{
  return 0;
}

- (void)itk_enumerateClampedAttribute:()ITK inRange:options:usingBlock:
{
  id v12 = a3;
  id v13 = a7;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3010000000;
  v18[3] = &unk_252A76809;
  v18[4] = a4;
  v18[5] = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __84__NSAttributedString_ITK__itk_enumerateClampedAttribute_inRange_options_usingBlock___block_invoke;
  v15[3] = &unk_26538CF30;
  id v14 = v13;
  id v16 = v14;
  v17 = v18;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", v12, a4, a5, a6, v15);

  _Block_object_dispose(v18, 8);
}

- (void)itk_enumerateUnclampedAttribute:()ITK inRange:options:usingBlock:
{
  id v12 = a3;
  id v13 = a7;
  if (a5)
  {
    unint64_t v14 = a4 + ((a5 - 1) & (a6 << 62 >> 63));
    char v21 = 0;
    uint64_t v15 = [a1 length];
    while (1)
    {
      unint64_t v19 = 0;
      uint64_t v20 = 0;
      if ((a6 & 0x100000) != 0) {
        [a1 attribute:v12 atIndex:v14 effectiveRange:&v19];
      }
      else {
      id v16 = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", v12, v14, &v19, 0, v15);
      }
      v13[2](v13, v16, v19, v20, &v21);
      if (v21) {
        break;
      }
      if ((a6 & 2) != 0)
      {
        if (v19 <= a4) {
          break;
        }
        unint64_t v14 = v19 - 1;
      }
      else
      {
        uint64_t v17 = [a1 length];
        uint64_t v18 = a5 - v15 + v17;
        if (v17 == v15) {
          unint64_t v14 = v20 + v19;
        }
        else {
          unint64_t v14 = v17 - v15 + v19 + v20;
        }
        if (v17 != v15)
        {
          uint64_t v15 = v17;
          a5 = v18;
        }
        if (v14 >= a5 + a4) {
          break;
        }
      }
    }
  }
}

- (id)itk_attributedStringByReplacingNewlineCharactersWithWhiteSpace
{
  v2 = [MEMORY[0x263F08708] newlineCharacterSet];
  v3 = objc_msgSend(a1, "itk_attributedStringByReplacingCharactersInSet:withString:", v2, @" ");

  return v3;
}

- (id)itk_attributedStringByReplacingCharactersInSet:()ITK withString:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = a1;
  v9 = [v8 string];
  uint64_t v10 = [v9 rangeOfCharacterFromSet:v6];

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (void *)[v8 mutableCopy];
    id v12 = [v11 string];
    uint64_t v13 = [v12 rangeOfCharacterFromSet:v6];
    uint64_t v15 = v14;

    while (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v11, "replaceCharactersInRange:withString:", v13, v15, v7);
      id v16 = [v11 string];
      uint64_t v17 = [v16 length] - v13;

      uint64_t v18 = [v11 string];
      uint64_t v13 = objc_msgSend(v18, "rangeOfCharacterFromSet:options:range:", v6, 2, v13, v17);
      uint64_t v15 = v19;
    }
    if (v11)
    {
      uint64_t v20 = [v11 copy];

      id v8 = (id)v20;
    }
  }

  return v8;
}

@end