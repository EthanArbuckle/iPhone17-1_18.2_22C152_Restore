@interface NSObject(EmojiCompare)
- (uint64_t)_emojiCompare:()EmojiCompare;
@end

@implementation NSObject(EmojiCompare)

- (uint64_t)_emojiCompare:()EmojiCompare
{
  id v13 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  [v13 frame];
  double v10 = v3;
  double v11 = v4;
  [location[0] frame];
  double v8 = v5;
  double v9 = v6;
  NSClassFromString(&cfstr_Uikeyboardemoj_13.isa);
  if (objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass())
  {
    if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) == 0)
    {
      double v15 = v10 - v8;
      if (fabs(v10 - v8) >= 1.0)
      {
        if (v10 - v8 >= 0.0) {
          uint64_t v14 = 1;
        }
        else {
          uint64_t v14 = -1;
        }
      }
      else if (v11 >= v9)
      {
        uint64_t v14 = 1;
      }
      else
      {
        uint64_t v14 = -1;
      }
    }
    else
    {
      uint64_t v14 = 1;
    }
  }
  else
  {
    uint64_t v14 = -1;
  }
  objc_storeStrong(location, 0);
  return v14;
}

@end