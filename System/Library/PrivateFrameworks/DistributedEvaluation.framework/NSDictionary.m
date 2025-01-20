@interface NSDictionary
@end

@implementation NSDictionary

void __71__NSDictionary_DESExtensions___fides_objectByReplacingValue_withValue___block_invoke(void *a1, void *a2, void *a3)
{
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  id v7 = a2;
  objc_msgSend(a3, "_fides_objectByReplacingValue:withValue:", v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v4 setValue:v8 forKey:v7];
}

@end