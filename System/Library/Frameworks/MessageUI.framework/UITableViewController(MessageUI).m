@interface UITableViewController(MessageUI)
- (id)mf_updatePreferredContentSizeBasedOnTableView;
- (uint64_t)mf_supportsPopoverPresentation;
- (void)mf_updateTableViewBackgroundColorForPopover;
@end

@implementation UITableViewController(MessageUI)

- (id)mf_updatePreferredContentSizeBasedOnTableView
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, val);
  v2 = [val tableView];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__UITableViewController_MessageUI__mf_updatePreferredContentSizeBasedOnTableView__block_invoke;
  v6[3] = &unk_1E5F7D400;
  objc_copyWeak(&v8, &location);
  id v7 = v2;
  id v3 = v2;
  v4 = objc_msgSend(v3, "ef_observeKeyPath:options:autoCancelToken:usingBlock:", @"contentSize", 1, 1, v6);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v4;
}

- (uint64_t)mf_supportsPopoverPresentation
{
  v4 = [a1 view];
  v5 = [v4 window];
  if (!v5)
  {
    v6 = [a1 presentingViewController];
    id v7 = [v6 view];
    v5 = [v7 window];

    if (v5) {
      goto LABEL_4;
    }
    v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2 object:a1 file:@"UITableViewController+MessageUI.m" lineNumber:30 description:@"view must have a window"];
    v5 = 0;
  }

LABEL_4:
  id v8 = [v5 traitCollection];
  uint64_t v9 = objc_msgSend(v8, "mf_supportsPopoverPresentation");

  return v9;
}

- (void)mf_updateTableViewBackgroundColorForPopover
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(a1, "mf_supportsPopoverPresentation");
  if (v2)
  {
    id v3 = 0;
  }
  else
  {
    id v3 = [MEMORY[0x1E4FB1618] systemGroupedBackgroundColor];
  }
  v4 = [a1 tableView];
  [v4 setBackgroundColor:v3];

  if ((v2 & 1) == 0) {
  long long v12 = 0u;
  }
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = objc_msgSend(a1, "tableView", 0);
  v6 = [v5 visibleCells];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "mf_updateBackgroundColorForPopover:", v2);
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

@end