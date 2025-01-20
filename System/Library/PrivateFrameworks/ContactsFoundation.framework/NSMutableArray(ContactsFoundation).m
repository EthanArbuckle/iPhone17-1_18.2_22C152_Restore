@interface NSMutableArray(ContactsFoundation)
- (uint64_t)_cn_addObject:()ContactsFoundation orPlaceholder:;
- (void)_cn_addNonNilObject:()ContactsFoundation;
- (void)_cn_addNonNilObjectIfNotPresent:()ContactsFoundation;
- (void)_cn_addObject:()ContactsFoundation count:;
- (void)_cn_insertNonNilObject:()ContactsFoundation atIndex:;
- (void)_cn_removeObjectsPassingTest:()ContactsFoundation;
- (void)_cn_reverseObjectsInRange:()ContactsFoundation;
- (void)_cn_rotateRange:()ContactsFoundation by:;
- (void)_cn_sortUsingAuxiliarySortOrder:()ContactsFoundation transform:;
@end

@implementation NSMutableArray(ContactsFoundation)

- (void)_cn_rotateRange:()ContactsFoundation by:
{
  if ((unint64_t)a4 >= 2)
  {
    uint64_t v6 = (a4 & ((a5 % a4) >> 63)) + a5 % a4;
    if (v6)
    {
      NSUInteger v9 = [a1 count];
      v20.location = 0;
      v20.length = v9;
      v23.location = a3;
      v23.length = a4;
      NSRange v10 = NSIntersectionRange(v20, v23);
      if (a3 != v10.location || a4 != v10.length)
      {
        v13 = NSString;
        v21.location = a3;
        v21.length = a4;
        v14 = NSStringFromRange(v21);
        v22.location = 0;
        v22.length = v9;
        v15 = NSStringFromRange(v22);
        uint64_t v16 = [v13 stringWithFormat:@"rotation range (%@) out of bounds (%@)", v14, v15];

        id v17 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A8] reason:v16 userInfo:0];
        objc_exception_throw(v17);
      }
      NSUInteger v11 = a3 + a4 - v6;
      objc_msgSend(a1, "subarrayWithRange:", v11, v6);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "removeObjectsInRange:", v11, v6);
      v12 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", a3, v6);
      [a1 insertObjects:v18 atIndexes:v12];
    }
  }
}

- (void)_cn_addObject:()ContactsFoundation count:
{
  id v6 = a3;
  v7 = [NSNumber numberWithUnsignedInteger:a4];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58__NSMutableArray_ContactsFoundation___cn_addObject_count___block_invoke;
  v9[3] = &unk_1E569F310;
  v9[4] = a1;
  id v10 = v6;
  id v8 = v6;
  objc_msgSend(v7, "_cn_times:", v9);
}

- (void)_cn_addNonNilObject:()ContactsFoundation
{
  if (a3) {
    return objc_msgSend(a1, "addObject:");
  }
  return a1;
}

- (void)_cn_addNonNilObjectIfNotPresent:()ContactsFoundation
{
  id v4 = a3;
  if ((objc_msgSend(a1, "containsObject:") & 1) == 0) {
    objc_msgSend(a1, "_cn_addNonNilObject:", v4);
  }
}

- (uint64_t)_cn_addObject:()ContactsFoundation orPlaceholder:
{
  if (!a3) {
    a3 = a4;
  }
  return [a1 addObject:a3];
}

- (void)_cn_insertNonNilObject:()ContactsFoundation atIndex:
{
  if (a3) {
    return objc_msgSend(a1, "insertObject:atIndex:");
  }
  return a1;
}

- (void)_cn_removeObjectsPassingTest:()ContactsFoundation
{
  id v4 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__NSMutableArray_ContactsFoundation___cn_removeObjectsPassingTest___block_invoke;
  v7[3] = &unk_1E569F6B8;
  id v8 = v4;
  id v5 = v4;
  id v6 = [a1 indexesOfObjectsPassingTest:v7];
  [a1 removeObjectsAtIndexes:v6];
}

- (void)_cn_reverseObjectsInRange:()ContactsFoundation
{
  if (a4 >= 2)
  {
    id v8 = objc_msgSend(a1, "subarrayWithRange:");
    objc_msgSend(v8, "_cn_reversed");
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "replaceObjectsInRange:withObjectsFromArray:", a3, a4, v9);
  }
}

- (void)_cn_sortUsingAuxiliarySortOrder:()ContactsFoundation transform:
{
  +[_CNSortsByPositionInAuxiliaryArray comparatorForSortingAccordingToAuxiliaryValues:transform:](_CNSortsByPositionInAuxiliaryArray, "comparatorForSortingAccordingToAuxiliaryValues:transform:");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [a1 sortUsingComparator:v2];
}

@end