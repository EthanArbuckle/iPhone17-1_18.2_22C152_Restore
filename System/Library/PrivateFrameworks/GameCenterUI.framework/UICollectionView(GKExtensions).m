@interface UICollectionView(GKExtensions)
- (id)_gkVisibleCellForIndexPath:()GKExtensions;
@end

@implementation UICollectionView(GKExtensions)

- (id)_gkVisibleCellForIndexPath:()GKExtensions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v5 = objc_msgSend(a1, "visibleCells", 0);
  id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v9 _layoutAttributes];
        v11 = v10;
        if (v10)
        {
          v12 = [v10 indexPath];
          char v13 = [v12 isEqual:v4];

          if (v13)
          {
            id v6 = v9;

            goto LABEL_12;
          }
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return v6;
}

@end