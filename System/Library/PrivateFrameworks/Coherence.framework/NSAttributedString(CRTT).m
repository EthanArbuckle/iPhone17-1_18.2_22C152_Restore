@interface NSAttributedString(CRTT)
- (id)cr_attributedSubstringFromRange:()CRTT;
- (void)cr_enumerateClampedAttribute:()CRTT inRange:options:usingBlock:;
- (void)cr_enumerateUnclampedAttribute:()CRTT inRange:options:usingBlock:;
@end

@implementation NSAttributedString(CRTT)

- (id)cr_attributedSubstringFromRange:()CRTT
{
  v7 = [a1 string];
  uint64_t v8 = objc_msgSend(v7, "rangeOfComposedCharacterSequencesForRange:", a3, a4);
  v10 = objc_msgSend(a1, "attributedSubstringFromRange:", v8, v9);

  return v10;
}

- (void)cr_enumerateClampedAttribute:()CRTT inRange:options:usingBlock:
{
  id v12 = a7;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x4012000000;
  v17[3] = __Block_byref_object_copy__0;
  v17[4] = __Block_byref_object_dispose__0;
  v17[5] = &unk_1C44F329A;
  v17[6] = a4;
  v17[7] = a5;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __84__NSAttributedString_CRTT__cr_enumerateClampedAttribute_inRange_options_usingBlock___block_invoke;
  v14[3] = &unk_1E64C1A80;
  id v15 = v12;
  v16 = v17;
  id v13 = v12;
  objc_msgSend(a1, "enumerateAttribute:inRange:options:usingBlock:", a3, a4, a5, a6, v14);

  _Block_object_dispose(v17, 8);
}

- (void)cr_enumerateUnclampedAttribute:()CRTT inRange:options:usingBlock:
{
  id v12 = a3;
  id v13 = a7;
  if (a5)
  {
    char v24 = 0;
    uint64_t v14 = [a1 length];
    unint64_t v15 = a4 + ((a5 - 1) & (a6 << 62 >> 63));
    if ((a6 & 0x100000) != 0) {
      goto LABEL_4;
    }
LABEL_3:
    for (uint64_t i = objc_msgSend(a1, "attribute:atIndex:longestEffectiveRange:inRange:", v12, v15, &v22, 0, v14);
    {
      v17 = (void *)i;
      v13[2](v13, i, v22, v23, &v24);
      if (v24) {
        break;
      }
      if ((a6 & 2) != 0)
      {
        if (v22 <= a4) {
          break;
        }
        unint64_t v15 = v22 - 1;
      }
      else
      {
        uint64_t v18 = [a1 length];
        unint64_t v19 = v18 - v14 + v22 + v23;
        uint64_t v20 = a5 - v14 + v18;
        BOOL v21 = v18 == v14;
        if (v18 == v14)
        {
          unint64_t v15 = v23 + v22;
        }
        else
        {
          uint64_t v14 = v18;
          unint64_t v15 = v19;
        }
        if (!v21) {
          a5 = v20;
        }
        if (v15 >= a5 + a4) {
          break;
        }
      }

      if ((a6 & 0x100000) == 0) {
        goto LABEL_3;
      }
LABEL_4:
      [a1 attribute:v12 atIndex:v15 effectiveRange:&v22];
    }
  }
}

@end