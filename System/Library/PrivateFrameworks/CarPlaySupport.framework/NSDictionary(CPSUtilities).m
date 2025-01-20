@interface NSDictionary(CPSUtilities)
- (id)cps_mutableDictionaryWithValuesForKeys:()CPSUtilities;
@end

@implementation NSDictionary(CPSUtilities)

- (id)cps_mutableDictionaryWithValuesForKeys:()CPSUtilities
{
  id v10 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v8 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = location[0];
  id v6 = v10;
  id v7 = v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:");
  id v5 = v8;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v5;
}

@end