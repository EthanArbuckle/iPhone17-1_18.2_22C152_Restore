@interface UICollectionView
@end

@implementation UICollectionView

uint64_t __58__UICollectionView_MailUI__mui_indexPathsForPreparedItems__block_invoke()
{
  uint64_t result = objc_opt_respondsToSelector();
  mui_indexPathsForPreparedItems_shouldUseImprovedSPI = result & 1;
  return result;
}

uint64_t __58__UICollectionView_MailUI__mui_indexPathsForPreparedItems__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) indexPathForCell:a2];
}

void __125__UICollectionView_UICollectionView_MailUI__mui_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator_animated___block_invoke(uint64_t a1, void *a2, int a3, uint64_t a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v13 = *(void **)(a1 + 32);
        if (a3) {
          [v13 selectItemAtIndexPath:v12 animated:a4 scrollPosition:0];
        }
        else {
          [v13 deselectItemAtIndexPath:v12 animated:a4];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

uint64_t __125__UICollectionView_UICollectionView_MailUI__mui_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator_animated___block_invoke_2(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __125__UICollectionView_UICollectionView_MailUI__mui_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator_animated___block_invoke_3;
  v3[3] = &unk_1E6D11708;
  v3[4] = *(void *)(a1 + 32);
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v3];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __125__UICollectionView_UICollectionView_MailUI__mui_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) layoutIfNeeded];
}

uint64_t __125__UICollectionView_UICollectionView_MailUI__mui_interactiveDeselectAllSelectedIndexPathsUsingTransitionCoordinator_animated___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v4();
  }
  return result;
}

@end