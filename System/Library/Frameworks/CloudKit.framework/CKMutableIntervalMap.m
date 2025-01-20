@interface CKMutableIntervalMap
- (void)addIndexes:(id)a3 withObject:(id)a4;
@end

@implementation CKMutableIntervalMap

- (void)addIndexes:(id)a3 withObject:(id)a4
{
  id v6 = a4;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = sub_18B069F84;
  v15 = &unk_1E5462740;
  v16 = self;
  id v7 = v6;
  id v17 = v7;
  objc_msgSend_enumerateRangesUsingBlock_(a3, v8, (uint64_t)&v12, v9);
  objc_msgSend_setDirty_(self, v10, 1, v11, v12, v13, v14, v15, v16);
}

@end