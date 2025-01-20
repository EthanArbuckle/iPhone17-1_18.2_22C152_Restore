@interface CNUIStringUtilities
+ (BOOL)stringContainsEmoji:(id)a3;
+ (BOOL)stringIsSingleEmoji:(id)a3;
+ (int64_t)composedCharacterCountForString:(id)a3;
+ (int64_t)composedCharacterCountForString:(id)a3 containsEmoji:(BOOL *)a4;
@end

@implementation CNUIStringUtilities

+ (BOOL)stringIsSingleEmoji:(id)a3
{
  return CEMStringIsSingleEmoji() != 0;
}

+ (BOOL)stringContainsEmoji:(id)a3
{
  return CEMStringContainsEmoji() != 0;
}

+ (int64_t)composedCharacterCountForString:(id)a3 containsEmoji:(BOOL *)a4
{
  id v5 = a3;
  if (![v5 length])
  {
    int64_t v8 = 0;
    char v7 = 0;
    if (!a4) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  unint64_t v6 = 0;
  char v7 = 0;
  int64_t v8 = 0;
  do
  {
    uint64_t v9 = [v5 rangeOfComposedCharacterSequenceAtIndex:v6];
    uint64_t v11 = v10;
    if (a4)
    {
      v12 = objc_msgSend(v5, "substringWithRange:", v9, v10);
      v7 |= CEMStringContainsEmoji() != 0;
    }
    v6 += v11;
    ++v8;
  }
  while (v6 < [v5 length]);
  if (a4) {
LABEL_7:
  }
    *a4 = v7 & 1;
LABEL_8:

  return v8;
}

+ (int64_t)composedCharacterCountForString:(id)a3
{
  return [a1 composedCharacterCountForString:a3 containsEmoji:0];
}

@end