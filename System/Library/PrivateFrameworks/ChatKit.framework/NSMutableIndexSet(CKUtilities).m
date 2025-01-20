@interface NSMutableIndexSet(CKUtilities)
- (void)__ck_intersectIndexes:()CKUtilities;
@end

@implementation NSMutableIndexSet(CKUtilities)

- (void)__ck_intersectIndexes:()CKUtilities
{
  id v4 = a3;
  v5 = [MEMORY[0x1E4F28E60] indexSet];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __56__NSMutableIndexSet_CKUtilities____ck_intersectIndexes___block_invoke;
  v11 = &unk_1E56240E0;
  id v12 = v4;
  id v13 = v5;
  id v6 = v5;
  id v7 = v4;
  [a1 enumerateIndexesUsingBlock:&v8];
  objc_msgSend(a1, "removeIndexes:", v6, v8, v9, v10, v11);
}

@end