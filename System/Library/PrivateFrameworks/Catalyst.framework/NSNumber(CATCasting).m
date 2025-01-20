@interface NSNumber(CATCasting)
+ (id)cat_numberWithObject:()CATCasting;
@end

@implementation NSNumber(CATCasting)

+ (id)cat_numberWithObject:()CATCasting
{
  id v3 = a3;
  if (cat_numberWithObject__onceToken[0] != -1) {
    dispatch_once(cat_numberWithObject__onceToken, &__block_literal_global_29);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    goto LABEL_10;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
    v6 = [v3 stringByTrimmingCharactersInSet:v5];

    uint64_t v10 = 0;
    uint64_t v11 = [v6 length];
    id v9 = 0;
    [(id)cat_numberWithObject__formatter getObjectValue:&v9 forString:v6 range:&v10 error:0];
    id v4 = v9;
    uint64_t v7 = v11;
    if (v7 == [v6 length])
    {

      goto LABEL_10;
    }
  }
  id v4 = 0;
LABEL_10:

  return v4;
}

@end