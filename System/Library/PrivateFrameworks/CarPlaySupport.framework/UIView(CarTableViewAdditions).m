@interface UIView(CarTableViewAdditions)
- (id)_CPS_recursiveSubviewsWithClass:()CarTableViewAdditions;
@end

@implementation UIView(CarTableViewAdditions)

- (id)_CPS_recursiveSubviewsWithClass:()CarTableViewAdditions
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v18 = a1;
  uint64_t v17 = a2;
  uint64_t v16 = a3;
  id v15 = (id)[MEMORY[0x263EFF980] array];
  memset(__b, 0, sizeof(__b));
  id obj = (id)[v18 subviews];
  uint64_t v12 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
  if (v12)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v12;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v14 = *(id *)(__b[1] + 8 * v9);
      id v5 = v15;
      id v6 = (id)objc_msgSend(v14, "_CPS_recursiveSubviewsWithClass:", v16);
      objc_msgSend(v5, "addObjectsFromArray:");

      if (objc_opt_isKindOfClass()) {
        [v15 addObject:v14];
      }
      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v19 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }

  id v4 = (id)[v15 copy];
  objc_storeStrong(&v15, 0);

  return v4;
}

@end