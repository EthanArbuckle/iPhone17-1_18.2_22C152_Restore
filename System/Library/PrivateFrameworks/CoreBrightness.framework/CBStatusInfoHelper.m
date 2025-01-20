@interface CBStatusInfoHelper
+ (id)copyStatusInfoFor:(id)a3;
@end

@implementation CBStatusInfoHelper

+ (id)copyStatusInfoFor:(id)a3
{
  id v15 = a1;
  SEL v14 = a2;
  id v13 = a3;
  id v12 = 0;
  if ([a3 conformsToProtocol:&unk_1F141A920])
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v11 = (id)[v13 copyIdentifiers];
    uint64_t v4 = MEMORY[0x1E4F143A8];
    int v5 = -1073741824;
    int v6 = 0;
    v7 = __40__CBStatusInfoHelper_copyStatusInfoFor___block_invoke;
    v8 = &unk_1E62198C0;
    id v9 = v13;
    id v10 = v12;
    objc_msgSend(v11, "enumerateObjectsUsingBlock:");
  }
  return v12;
}

void __40__CBStatusInfoHelper_copyStatusInfoFor___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = (id)[*(id *)(a1 + 32) copyPropertyInternalForKey:a2];
    if (v3)
    {
      [*(id *)(a1 + 40) setObject:v3 forKey:a2];
    }
  }
}

@end