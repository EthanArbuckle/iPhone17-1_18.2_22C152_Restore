@interface NSDictionary(DESExtensions)
- (id)_fides_objectByReplacingValue:()DESExtensions withValue:;
@end

@implementation NSDictionary(DESExtensions)

- (id)_fides_objectByReplacingValue:()DESExtensions withValue:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __71__NSDictionary_DESExtensions___fides_objectByReplacingValue_withValue___block_invoke;
  v15[3] = &unk_1E63C1A20;
  id v9 = v8;
  id v16 = v9;
  id v17 = v6;
  id v18 = v7;
  id v10 = v7;
  id v11 = v6;
  [a1 enumerateKeysAndObjectsUsingBlock:v15];
  v12 = v18;
  id v13 = v9;

  return v13;
}

@end