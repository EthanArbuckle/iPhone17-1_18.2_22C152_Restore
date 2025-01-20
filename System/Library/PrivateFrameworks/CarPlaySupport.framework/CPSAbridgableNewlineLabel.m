@interface CPSAbridgableNewlineLabel
+ (id)sanitizedTextForText:(id)a3;
@end

@implementation CPSAbridgableNewlineLabel

+ (id)sanitizedTextForText:(id)a3
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v11 = (dispatch_once_t *)&sanitizedTextForText__onceToken_59;
  id v10 = 0;
  objc_storeStrong(&v10, &__block_literal_global_61);
  if (*v11 != -1) {
    dispatch_once(v11, v10);
  }
  objc_storeStrong(&v10, 0);
  id v4 = location[0];
  id v5 = (id)[MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  id v8 = (id)objc_msgSend(v4, "stringByTrimmingCharactersInSet:");

  id v6 = (id)[v8 componentsSeparatedByCharactersInSet:sanitizedTextForText____disallowedCharacterSet_58];
  id v7 = (id)[v6 componentsJoinedByString:&stru_26DEE39C0];

  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v7;
}

void __50__CPSAbridgableNewlineLabel_sanitizedTextForText___block_invoke(void *a1)
{
  v5[2] = a1;
  v5[1] = a1;
  v5[0] = (id)objc_opt_new();
  id v3 = v5[0];
  id v4 = (id)[MEMORY[0x263F08708] illegalCharacterSet];
  objc_msgSend(v3, "formUnionWithCharacterSet:");

  uint64_t v1 = [v5[0] copy];
  v2 = (void *)sanitizedTextForText____disallowedCharacterSet_58;
  sanitizedTextForText____disallowedCharacterSet_58 = v1;

  objc_storeStrong(v5, 0);
}

@end