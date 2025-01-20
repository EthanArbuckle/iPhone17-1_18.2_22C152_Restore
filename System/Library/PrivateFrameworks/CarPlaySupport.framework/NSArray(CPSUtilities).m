@interface NSArray(CPSUtilities)
- (id)cps_filter:()CPSUtilities;
- (id)cps_map:()CPSUtilities;
@end

@implementation NSArray(CPSUtilities)

- (id)cps_map:()CPSUtilities
{
  id v10 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v8 = (id)objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  id v4 = v10;
  id v7 = location[0];
  id v6 = v8;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:");
  id v5 = v8;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(&v7, 0);
  objc_storeStrong(&v8, 0);
  objc_storeStrong(location, 0);

  return v5;
}

- (id)cps_filter:()CPSUtilities
{
  id v14 = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  id v4 = v14;
  v6[1] = (id)MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  v9 = __36__NSArray_CPSUtilities__cps_filter___block_invoke;
  id v10 = &unk_2648A54B0;
  id v11 = location[0];
  id v12 = (id)objc_msgSend(v4, "indexesOfObjectsPassingTest:");
  v6[0] = (id)[v14 objectsAtIndexes:v12];
  id v5 = v6[0];
  objc_storeStrong(v6, 0);
  objc_storeStrong(&v12, 0);
  objc_storeStrong(&v11, 0);
  objc_storeStrong(location, 0);

  return v5;
}

@end