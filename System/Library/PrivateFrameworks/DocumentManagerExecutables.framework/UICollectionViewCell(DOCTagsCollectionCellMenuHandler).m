@interface UICollectionViewCell(DOCTagsCollectionCellMenuHandler)
- (uint64_t)doc_tagsCollectionCellMenuTarget;
@end

@implementation UICollectionViewCell(DOCTagsCollectionCellMenuHandler)

- (uint64_t)doc_tagsCollectionCellMenuTarget
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(a2);
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v4 handleFailureInMethod:a2, a1, @"DOCTagsCollectionCellMenuTarget.m", 16, @"The method %@ in %@ must be overridden.", v5, v7 object file lineNumber description];

  return 0;
}

@end