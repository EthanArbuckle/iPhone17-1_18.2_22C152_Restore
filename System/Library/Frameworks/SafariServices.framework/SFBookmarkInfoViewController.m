@interface SFBookmarkInfoViewController
@end

@implementation SFBookmarkInfoViewController

void __62___SFBookmarkInfoViewController__returnWasPressedInTextField___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) navigationController];
  v2 = [v5 topViewController];
  v3 = *(void **)(a1 + 32);

  if (v2 == v3) {
    id v4 = (id)[v5 popViewControllerAnimated:1];
  }
}

uint64_t __67___SFBookmarkInfoViewController__setFolderPickerExpanded_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updatePreferredContentSize];
}

uint64_t __57___SFBookmarkInfoViewController__reloadFolderInfoForced___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  uint64_t v5 = *(void *)(a1 + 32);
  int v6 = *(_DWORD *)(v5 + 1088);
  if (!v6) {
    goto LABEL_4;
  }
  v7 = [v3 syntheticFolder];
  v8 = [v7 bookmarkList];
  int v9 = [v8 folderID];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v6 == v9)
  {
    *(_DWORD *)(v5 + 1088) = 0;
    uint64_t v10 = [v4 syntheticFolder];
    uint64_t v11 = *(void *)(a1 + 32);
    v12 = *(void **)(v11 + 1080);
    *(void *)(v11 + 1080) = v10;
    uint64_t v13 = 1;
  }
  else
  {
LABEL_4:
    v14 = *(void **)(v5 + 1080);
    v12 = [v4 syntheticFolder];
    uint64_t v13 = [v14 isEqual:v12];
  }

  return v13;
}

BOOL __57___SFBookmarkInfoViewController__reloadFolderInfoForced___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 bookmark];
  id v4 = v3;
  if (v3 && *(void *)(*(void *)(a1 + 32) + 1072))
  {
    int v5 = [v3 identifier];
    BOOL v6 = v5 == [*(id *)(*(void *)(a1 + 32) + 1072) identifier];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end