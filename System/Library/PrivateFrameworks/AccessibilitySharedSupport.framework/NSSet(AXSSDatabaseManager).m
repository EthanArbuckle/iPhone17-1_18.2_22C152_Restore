@interface NSSet(AXSSDatabaseManager)
- (id)ax_makeObjectsRespondToSelector:()AXSSDatabaseManager;
@end

@implementation NSSet(AXSSDatabaseManager)

- (id)ax_makeObjectsRespondToSelector:()AXSSDatabaseManager
{
  v5 = [MEMORY[0x1E4F1CA80] set];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __62__NSSet_AXSSDatabaseManager__ax_makeObjectsRespondToSelector___block_invoke;
  v12 = &unk_1E606DD70;
  id v13 = v5;
  uint64_t v14 = a3;
  id v6 = v5;
  [a1 enumerateObjectsUsingBlock:&v9];
  v7 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithSet:", v6, v9, v10, v11, v12);

  return v7;
}

@end