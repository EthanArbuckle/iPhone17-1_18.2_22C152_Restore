@interface NSAttributedString(CalendarUIKit)
+ (double)cal_maximumWidthForStrings:()CalendarUIKit attributes:;
- (id)cal_stringWithNormalizedSpacesForUnitTesting;
@end

@implementation NSAttributedString(CalendarUIKit)

+ (double)cal_maximumWidthForStrings:()CalendarUIKit attributes:
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        v12 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:*(void *)(*((void *)&v16 + 1) + 8 * i) attributes:v6];
        [v12 size];
        double v14 = ceil(v13);
        if (v14 > v10) {
          double v10 = v14;
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
  else
  {
    double v10 = 0.0;
  }

  return v10;
}

- (id)cal_stringWithNormalizedSpacesForUnitTesting
{
  id v2 = objc_alloc(MEMORY[0x1E4F28E48]);
  v3 = [a1 string];
  v4 = objc_msgSend(v3, "cal_stringWithNormalizedSpacesForUnitTesting");
  id v5 = (void *)[v2 initWithString:v4];

  uint64_t v6 = [v5 length];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__NSAttributedString_CalendarUIKit__cal_stringWithNormalizedSpacesForUnitTesting__block_invoke;
  v9[3] = &unk_1E636A800;
  id v7 = v5;
  id v10 = v7;
  objc_msgSend(a1, "enumerateAttributesInRange:options:usingBlock:", 0, v6, 0, v9);

  return v7;
}

@end