@interface UICollectionView(MailUI)
- (BOOL)mui_isIndexPathVisible:()MailUI;
- (double)mui_safeVisibleBounds;
- (id)mui_indexPathsForPreparedItems;
- (id)mui_sortedIndexPathsForVisibleItems;
- (uint64_t)mui_scrollToItemAtIndexPath:()MailUI atScrollPosition:animated:;
- (uint64_t)mui_selectItemAtIndexPath:()MailUI animated:scrollPosition:;
@end

@implementation UICollectionView(MailUI)

- (BOOL)mui_isIndexPathVisible:()MailUI
{
  id v4 = a3;
  v5 = [a1 indexPathsForVisibleItems];
  int v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = [a1 layoutAttributesForItemAtIndexPath:v4];
    objc_msgSend(a1, "mui_safeVisibleBounds");
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    [v7 frame];
    v23.origin.x = v16;
    v23.origin.y = v17;
    v23.size.width = v18;
    v23.size.height = v19;
    v22.origin.x = v9;
    v22.origin.y = v11;
    v22.size.width = v13;
    v22.size.height = v15;
    BOOL v20 = CGRectContainsRect(v22, v23);
  }
  else
  {
    BOOL v20 = 0;
  }

  return v20;
}

- (id)mui_sortedIndexPathsForVisibleItems
{
  v1 = [a1 indexPathsForVisibleItems];
  v2 = [v1 sortedArrayUsingSelector:sel_compare_];

  return v2;
}

- (id)mui_indexPathsForPreparedItems
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__UICollectionView_MailUI__mui_indexPathsForPreparedItems__block_invoke;
  block[3] = &unk_1E6D11708;
  block[4] = a1;
  if (mui_indexPathsForPreparedItems_onceToken != -1) {
    dispatch_once(&mui_indexPathsForPreparedItems_onceToken, block);
  }
  if (mui_indexPathsForPreparedItems_shouldUseImprovedSPI)
  {
    v2 = [a1 _indexPathsForPreparedItems];
  }
  else
  {
    v3 = [a1 preparedCells];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __58__UICollectionView_MailUI__mui_indexPathsForPreparedItems__block_invoke_2;
    v5[3] = &unk_1E6D12CB8;
    v5[4] = a1;
    v2 = objc_msgSend(v3, "ef_compactMap:", v5);
  }
  return v2;
}

- (uint64_t)mui_selectItemAtIndexPath:()MailUI animated:scrollPosition:
{
  return [a1 selectItemAtIndexPath:a3 animated:a4 scrollPosition:a5 == 1];
}

- (uint64_t)mui_scrollToItemAtIndexPath:()MailUI atScrollPosition:animated:
{
  return objc_msgSend(a1, "scrollToItemAtIndexPath:atScrollPosition:animated:", a3, a4 == 1);
}

- (double)mui_safeVisibleBounds
{
  [a1 visibleBounds];
  double v3 = v2;
  [a1 safeAreaInsets];
  return v3 + v4;
}

@end