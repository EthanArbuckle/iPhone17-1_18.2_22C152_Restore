@interface UICollectionView(CKUtilities)
- (BOOL)__ck_isScrolledToBottomHidingIndexPath:()CKUtilities;
- (double)__ck_bottomOffsetHidingIndexPath:()CKUtilities skippingLayoutUpdate:;
- (double)__ck_contentSize;
- (double)__ck_offsetForTopOfCellAtIndexPath:()CKUtilities hidingCellAtIndexPath:;
- (id)__ck_indexPathForInputView;
- (id)__ck_indexPathForLastItem;
- (id)__ck_indexPathForRepliesList;
- (uint64_t)__ck_bottomOffsetHidingIndexPath:()CKUtilities;
- (void)__ck_reloadDataKeepingSelection;
@end

@implementation UICollectionView(CKUtilities)

- (id)__ck_indexPathForLastItem
{
  uint64_t v1 = [a1 numberOfItemsInSection:0];
  v2 = +[CKUIBehavior sharedBehaviors];
  int v3 = [v2 showsReplyButtonsInTranscript];

  uint64_t v4 = -5;
  if (!v3) {
    uint64_t v4 = -1;
  }
  if (v4 + v1 < 0)
  {
    v5 = 0;
  }
  else
  {
    v5 = [MEMORY[0x1E4F28D58] indexPathForItem:v4 + v1 inSection:0];
  }

  return v5;
}

- (id)__ck_indexPathForInputView
{
  uint64_t v1 = [a1 numberOfItemsInSection:0];
  v2 = 0;
  if (v1 >= 3)
  {
    v2 = [MEMORY[0x1E4F28D58] indexPathForItem:v1 - 3 inSection:0];
  }

  return v2;
}

- (id)__ck_indexPathForRepliesList
{
  uint64_t v1 = [a1 numberOfItemsInSection:0];
  v2 = 0;
  if (v1 >= 2)
  {
    v2 = [MEMORY[0x1E4F28D58] indexPathForItem:v1 - 2 inSection:0];
  }

  return v2;
}

- (double)__ck_contentSize
{
  uint64_t v1 = [a1 collectionViewLayout];
  [v1 collectionViewContentSize];
  double v3 = v2;

  return v3;
}

- (BOOL)__ck_isScrolledToBottomHidingIndexPath:()CKUtilities
{
  objc_msgSend(a1, "__ck_bottomOffsetHidingIndexPath:");
  double v3 = v2;
  [a1 contentOffset];
  return v4 >= v3 + -0.00000011920929;
}

- (uint64_t)__ck_bottomOffsetHidingIndexPath:()CKUtilities
{
  return objc_msgSend(a1, "__ck_bottomOffsetHidingIndexPath:skippingLayoutUpdate:", a3, 0);
}

- (double)__ck_bottomOffsetHidingIndexPath:()CKUtilities skippingLayoutUpdate:
{
  id v6 = a3;
  v13.receiver = a1;
  v13.super_class = (Class)UICollectionView_0;
  objc_msgSendSuper2(&v13, sel___ck_bottomOffset);
  double v8 = v7;
  if (v6)
  {
    if ((a4 & 1) == 0)
    {
      [a1 setNeedsLayout];
      [a1 layoutIfNeeded];
    }
    v9 = [a1 collectionViewLayout];
    v10 = [v9 layoutAttributesForItemAtIndexPath:v6];
    [v10 frame];

    [a1 contentInset];
    [a1 bounds];
    v11 = +[CKUIBehavior sharedBehaviors];
    [v11 bottomTranscriptSpace];

    if (CKMainScreenScale_once_18 != -1) {
      dispatch_once(&CKMainScreenScale_once_18, &__block_literal_global_1905);
    }
  }
  objc_msgSend(a1, "__ck_scrollToTopContentOffset");

  return v8;
}

- (double)__ck_offsetForTopOfCellAtIndexPath:()CKUtilities hidingCellAtIndexPath:
{
  id v6 = a3;
  id v7 = a4;
  [a1 contentOffset];
  double v9 = v8;
  v10 = [a1 collectionViewLayout];
  v11 = [v10 layoutAttributesForItemAtIndexPath:v6];
  v12 = v11;
  if (v11)
  {
    [v11 frame];
    [a1 contentInset];
  }
  else
  {
    objc_super v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[UICollectionView(CKUtilities) __ck_offsetForTopOfCellAtIndexPath:hidingCellAtIndexPath:]((uint64_t)v6, v13);
    }
  }
  objc_msgSend(a1, "__ck_scrollToTopContentOffset");
  if (v7)
  {
    v14 = [v10 layoutAttributesForItemAtIndexPath:v7];
    v15 = v14;
    if (v14)
    {
      [v14 frame];
      [a1 bounds];
      if (CKMainScreenScale_once_18 != -1) {
        dispatch_once(&CKMainScreenScale_once_18, &__block_literal_global_1905);
      }
    }
    else
    {
      v16 = IMLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[UICollectionView(CKUtilities) __ck_offsetForTopOfCellAtIndexPath:hidingCellAtIndexPath:]((uint64_t)v7, v16);
      }
    }
  }

  return v9;
}

- (void)__ck_reloadDataKeepingSelection
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  double v2 = [a1 indexPathsForSelectedItems];
  [a1 reloadData];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(a1, "selectItemAtIndexPath:animated:scrollPosition:", *(void *)(*((void *)&v8 + 1) + 8 * v7++), 0, 0, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)__ck_offsetForTopOfCellAtIndexPath:()CKUtilities hidingCellAtIndexPath:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Could not hide index path %@, did not find layout attributes.", (uint8_t *)&v2, 0xCu);
}

- (void)__ck_offsetForTopOfCellAtIndexPath:()CKUtilities hidingCellAtIndexPath:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Could not scroll to index path %@, did not find layout attributes.", (uint8_t *)&v2, 0xCu);
}

@end