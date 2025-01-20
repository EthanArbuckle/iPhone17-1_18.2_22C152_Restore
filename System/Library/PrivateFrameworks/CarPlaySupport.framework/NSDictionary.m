@interface NSDictionary
@end

@implementation NSDictionary

void __69__NSDictionary_CPSUtilities__cps_mutableDictionaryWithValuesForKeys___block_invoke(uint64_t a1, void *a2)
{
  location[1] = (id)a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  id v5 = (id)[*(id *)(a1 + 32) objectForKey:location[0]];

  if (v5)
  {
    v2 = *(void **)(a1 + 40);
    id v3 = (id)[*(id *)(a1 + 32) objectForKey:location[0]];
    objc_msgSend(v2, "setObject:forKey:");
  }
  objc_storeStrong(location, 0);
}

@end