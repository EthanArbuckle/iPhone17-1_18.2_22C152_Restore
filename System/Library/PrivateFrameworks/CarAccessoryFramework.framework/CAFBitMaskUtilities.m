@interface CAFBitMaskUtilities
+ (BOOL)bitmask:(unint64_t)a3 hasOption:(unint64_t)a4;
+ (id)description:(unint64_t)a3;
+ (id)description:(unint64_t)a3 optionCount:(unsigned __int8)a4;
+ (int64_t)compareBitmask1:(unint64_t)a3 bitmask2:(unint64_t)a4 optionsSort:(id)a5;
+ (unint64_t)bitmask:(unint64_t)a3 setOption:(unint64_t)a4 on:(BOOL)a5;
@end

@implementation CAFBitMaskUtilities

+ (BOOL)bitmask:(unint64_t)a3 hasOption:(unint64_t)a4
{
  return (a4 & a3) != 0;
}

+ (unint64_t)bitmask:(unint64_t)a3 setOption:(unint64_t)a4 on:(BOOL)a5
{
  if (a5) {
    return a4 | a3;
  }
  else {
    return a3 & ~a4;
  }
}

+ (id)description:(unint64_t)a3
{
  return +[CAFBitMaskUtilities description:a3 optionCount:64];
}

+ (id)description:(unint64_t)a3 optionCount:(unsigned __int8)a4
{
  v6 = objc_opt_new();
  unint64_t v7 = 1;
  do
  {
    objc_msgSend(v6, "appendFormat:", @"%d", (v7 & a3) != 0);
    v7 *= 2;
  }
  while (v7 <= 1 << (a4 - 1));
  return v6;
}

+ (int64_t)compareBitmask1:(unint64_t)a3 bitmask2:(unint64_t)a4 optionsSort:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = a5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v14 = objc_msgSend(a1, "bitmask:hasOption:", a3, objc_msgSend(v13, "unsignedLongLongValue", (void)v17));
        if (v14 != objc_msgSend(a1, "bitmask:hasOption:", a4, objc_msgSend(v13, "unsignedLongLongValue")))
        {
          if (v14) {
            int64_t v15 = -1;
          }
          else {
            int64_t v15 = 1;
          }
          goto LABEL_13;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  int64_t v15 = 0;
LABEL_13:

  return v15;
}

@end