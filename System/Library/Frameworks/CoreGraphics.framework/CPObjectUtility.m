@interface CPObjectUtility
+ (float)complexityOfPage:(id)a3;
@end

@implementation CPObjectUtility

+ (float)complexityOfPage:(id)a3
{
  float v4 = 1.0;
  if (objc_msgSend((id)objc_msgSend(a3, "imagesOnPage"), "count") <= 0x3E8)
  {
    v5 = (void *)[a3 shapesOnPage];
    unsigned int v6 = [v5 count];
    unsigned int v7 = v6;
    if (v6 <= 0x3E8)
    {
      if (v6)
      {
        uint64_t v8 = 0;
        unsigned int v9 = 0;
        uint64_t v10 = v6 - 1;
        do
          v9 += objc_msgSend((id)objc_msgSend(v5, "objectAtIndex:", v8), "pathElementCount");
        while (v9 >> 4 <= 0x270 && v10 != v8++);
      }
      else
      {
        unsigned int v9 = 0;
      }
      unsigned int v12 = v9 + v7;
      if (v9 + v7 >= 0x2710) {
        unsigned int v12 = 10000;
      }
      return (float)v12 / 10000.0;
    }
  }
  return v4;
}

@end