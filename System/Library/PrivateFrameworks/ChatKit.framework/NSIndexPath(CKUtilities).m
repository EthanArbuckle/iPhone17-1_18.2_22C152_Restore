@interface NSIndexPath(CKUtilities)
- (id)__ck_indexPathShiftedForInsertedIndexes:()CKUtilities deletedIndexes:;
@end

@implementation NSIndexPath(CKUtilities)

- (id)__ck_indexPathShiftedForInsertedIndexes:()CKUtilities deletedIndexes:
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v15 = a1;
  v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 arrayWithObjects:&v15 count:1];
  v10 = objc_msgSend(v9, "__ck_indexSetForIndexPathItemsInSection:", objc_msgSend(a1, "section", v15, v16));

  v11 = objc_msgSend(v10, "__ck_indexSetShiftedForInsertedIndexes:removedIndexes:", v8, v7);

  v12 = objc_msgSend(v11, "__ck_indexPathItemsInSection:", 0);
  v13 = [v12 lastObject];

  return v13;
}

@end