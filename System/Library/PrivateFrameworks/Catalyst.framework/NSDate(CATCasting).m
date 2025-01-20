@interface NSDate(CATCasting)
+ (id)cat_dateWithObject:()CATCasting;
@end

@implementation NSDate(CATCasting)

+ (id)cat_dateWithObject:()CATCasting
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
LABEL_5:
    v5 = v4;
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v3, "integerValue"));
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_13;
  }
  v5 = objc_msgSend(MEMORY[0x263EFF910], "cat_dateWithInternetTimeString:", v3);
  if (v5) {
    goto LABEL_6;
  }
  v7 = objc_msgSend(NSNumber, "cat_numberWithObject:", v3);
  if (v7)
  {
    v8 = v7;
    v5 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v7, "integerValue"));
  }
  else
  {
LABEL_13:
    v5 = 0;
  }
LABEL_6:

  return v5;
}

@end