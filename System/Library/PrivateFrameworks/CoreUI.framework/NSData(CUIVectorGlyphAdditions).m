@interface NSData(CUIVectorGlyphAdditions)
- (uint64_t)isEqualToClipStrokeData:()CUIVectorGlyphAdditions withAccuracy:;
@end

@implementation NSData(CUIVectorGlyphAdditions)

- (uint64_t)isEqualToClipStrokeData:()CUIVectorGlyphAdditions withAccuracy:
{
  id v7 = [a4 length];
  if (v7 == [a1 length])
  {
    if (![a1 length]) {
      return 1;
    }
    unint64_t v8 = 0;
    while (1)
    {
      uint64_t v21 = 0;
      uint64_t v22 = 0;
      uint64_t v20 = 0;
      objc_msgSend(a1, "getBytes:range:", (char *)&v22 + 4, v8, 4, 0);
      objc_msgSend(a4, "getBytes:range:", (char *)&v20 + 4, v8, 4);
      if (HIDWORD(v22) != HIDWORD(v20)) {
        break;
      }
      unint64_t v9 = v8 + 4;
      objc_msgSend(a1, "getBytes:range:", &v22, v9, 4);
      objc_msgSend(a4, "getBytes:range:", &v20, v9, 4);
      LODWORD(v10) = v22;
      if (*(float *)&v22 != *(float *)&v20) {
        break;
      }
      unint64_t v11 = v9 + 4;
      objc_msgSend(a1, "getBytes:range:", (char *)&v21 + 4, v11, 4, v10);
      objc_msgSend(a4, "getBytes:range:", &v19, v11, 4);
      *(float *)&double v12 = v19;
      if (v19 < (float)(*((float *)&v21 + 1) - a2) || v19 > (float)(*((float *)&v21 + 1) + a2)) {
        break;
      }
      unint64_t v14 = v11 + 4;
      objc_msgSend(a1, "getBytes:range:", &v21, v14, 4, v12);
      objc_msgSend(a4, "getBytes:range:", &v18, v14, 4);
      *(float *)&double v15 = v18;
      if (v18 < (float)(*(float *)&v21 - a2) || v18 > (float)(*(float *)&v21 + a2)) {
        break;
      }
      unint64_t v8 = v14 + 4;
      if (v8 >= (unint64_t)objc_msgSend(a1, "length", v15)) {
        return 1;
      }
    }
  }
  return 0;
}

@end