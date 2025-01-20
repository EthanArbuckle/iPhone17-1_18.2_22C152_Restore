@interface SLMicroBlogMentionsViewController
+ (id)_blankSurrogateProfileImage;
- (SLMicroBlogMentionsDelegate)delegate;
- (SLMicroBlogMentionsViewController)initWithSheetDelegate:(id)a3;
- (id)mentions;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)chooseRow:(int64_t)a3;
- (void)completeWithSelectedMention:(id)a3;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setMentions:(id)a3;
- (void)setSearchString:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateMentions;
@end

@implementation SLMicroBlogMentionsViewController

- (SLMicroBlogMentionsViewController)initWithSheetDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SLMicroBlogMentionsViewController;
  v5 = [(SLMicroBlogMentionsViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_sheetDelegate, v4);
  }

  return v6;
}

- (void)completeWithSelectedMention:(id)a3
{
  id v4 = a3;
  id v5 = [(SLMicroBlogMentionsViewController *)self delegate];
  [v5 mentionsViewController:self finishedWithResult:v4];
}

- (id)mentions
{
  mentions = self->_mentions;
  if (!mentions)
  {
    id v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = self->_mentions;
    self->_mentions = v4;

    [(SLMicroBlogMentionsViewController *)self updateMentions];
    mentions = self->_mentions;
  }

  return mentions;
}

- (void)setMentions:(id)a3
{
  id v5 = (NSArray *)a3;
  _SLLog(v3, 7, @"SLMicroBlogMentionsViewController setMentions:");
  mentions = self->_mentions;
  self->_mentions = v5;
  v7 = v5;

  tableView = self->_tableView;
  v9 = [MEMORY[0x1E4F28D60] indexSetWithIndex:0];
  [(UITableView *)tableView reloadSections:v9 withRowAnimation:100];

  -[UITableView sizeThatFits:](self->_tableView, "sizeThatFits:", 0.0, 1100.0);
  double v11 = v10;
  [(NSArray *)self->_mentions count];

  _SLLog(v3, 7, @"SLMicroBlogMentionsViewController preferredContentSize => %g %g for _mentions.count %d");

  -[SLMicroBlogMentionsViewController setPreferredContentSize:](self, "setPreferredContentSize:", 320.0, v11);
}

- (void)updateMentions
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__SLMicroBlogMentionsViewController_updateMentions__block_invoke;
  v5[3] = &unk_1E6468198;
  v5[4] = self;
  uint64_t v3 = (void *)MEMORY[0x1C876A6A0](v5, a2);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sheetDelegate);
  [WeakRetained recordsMatchingPrefixString:self->_searchString completion:v3];
}

uint64_t __51__SLMicroBlogMentionsViewController_updateMentions__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  _SLLog(v2, 7, @"Got mentions match error %{public}@ and results %@");
  if (v4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__SLMicroBlogMentionsViewController_updateMentions__block_invoke_2;
    block[3] = &unk_1E6467C28;
    block[4] = *(void *)(a1 + 32);
    id v7 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  return 1;
}

uint64_t __51__SLMicroBlogMentionsViewController_updateMentions__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setMentions:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) willChangeValueForKey:@"contentSizeForViewInPopover"];
  uint64_t v2 = *(void **)(a1 + 32);

  return [v2 didChangeValueForKey:@"contentSizeForViewInPopover"];
}

- (void)setSearchString:(id)a3
{
  id v5 = a3;
  _SLLog(v3, 7, @"SLMicroBlogMentionsViewController setSearchString: %@");
  NSComparisonResult v6 = -[NSString compare:](self->_searchString, "compare:", v5, v5);
  id v7 = (NSString *)[v5 copy];

  searchString = self->_searchString;
  self->_searchString = v7;

  if (v6)
  {
    if ([(NSString *)self->_searchString length])
    {
      [(SLMicroBlogMentionsViewController *)self updateMentions];
    }
    else
    {
      [(SLMicroBlogMentionsViewController *)self setMentions:0];
    }
  }
}

- (void)loadView
{
  v13.receiver = self;
  v13.super_class = (Class)SLMicroBlogMentionsViewController;
  [(SLMicroBlogMentionsViewController *)&v13 loadView];
  id v3 = objc_alloc(MEMORY[0x1E4F42E98]);
  id v4 = [(SLMicroBlogMentionsViewController *)self view];
  [v4 frame];
  id v5 = (UITableView *)objc_msgSend(v3, "initWithFrame:");
  tableView = self->_tableView;
  self->_tableView = v5;

  [(UITableView *)self->_tableView setAutoresizingMask:18];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setOpaque:0];
  id v7 = [MEMORY[0x1E4F428B8] clearColor];
  [(UITableView *)self->_tableView setBackgroundColor:v7];

  objc_super v8 = [(UITableView *)self->_tableView backgroundView];
  [v8 setOpaque:0];

  v9 = [MEMORY[0x1E4F428B8] clearColor];
  double v10 = [(UITableView *)self->_tableView backgroundView];
  [v10 setBackgroundColor:v9];

  [(UITableView *)self->_tableView setRowHeight:*MEMORY[0x1E4F43D18]];
  double v11 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F43870]];
  [v11 lineHeight];
  [(UITableView *)self->_tableView setEstimatedRowHeight:v12 + v12];

  [(SLMicroBlogMentionsViewController *)self setView:self->_tableView];
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v5 = [(SLMicroBlogMentionsViewController *)self mentions];
  _SLLog(v4, 7, @"Mentions tableView:numberOfRowsInSection: with results %@");
  int64_t v6 = objc_msgSend(v5, "count", v5);

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  _SLLog(v4, 7, @"Mentions tableView:cellForRowAtIndexPath: %@");
  uint64_t v9 = objc_msgSend(v8, "indexAtPosition:", 1, v8);

  double v10 = [(SLMicroBlogMentionsViewController *)self mentions];
  double v11 = [v10 objectAtIndex:v9];

  _SLLog(v4, 7, @"Mentions tableView:cellForRowAtIndexPath: using userRecord %@");
  double v12 = NSString;
  objc_super v13 = objc_msgSend(v11, "screen_name", v11);
  v14 = [v12 stringWithFormat:@"@%@", v13];

  v15 = [v7 dequeueReusableCellWithIdentifier:@"MicroBlogMentionCell"];
  if (!v15) {
    v15 = (void *)[objc_alloc(MEMORY[0x1E4F42EA0]) initWithStyle:3 reuseIdentifier:@"MicroBlogMentionCell"];
  }
  [v15 setOpaque:0];
  v16 = [MEMORY[0x1E4F428B8] clearColor];
  [v15 setBackgroundColor:v16];

  v17 = [v15 textLabel];
  [v17 setText:v14];

  v18 = [v11 name];

  if (v18)
  {
    v19 = [v11 name];
    v20 = [v15 detailTextLabel];
    [v20 setText:v19];
  }
  v21 = [v11 profileImageCache];
  v22 = [v15 imageView];
  [v22 setImage:v21];

  v23 = [v15 imageView];
  v24 = [v23 image];

  if (!v24)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_sheetDelegate);
    char v26 = objc_opt_respondsToSelector();

    if (v26)
    {
      id v27 = objc_loadWeakRetained((id *)&self->_sheetDelegate);
      v28 = objc_msgSend(v11, "screen_name");
      v29 = [v27 cachedProfileImageDataForScreenName:v28];

      if (v29)
      {
        v30 = [MEMORY[0x1E4F42A80] imageWithData:v29];
        v31 = [v15 imageView];
        [v31 setImage:v30];
      }
    }
  }
  v32 = [v15 imageView];
  v33 = [v32 image];

  if (!v33)
  {
    v34 = +[SLMicroBlogMentionsViewController _blankSurrogateProfileImage];
    [v11 setProfileImageCache:v34];

    v35 = [v11 profileImageCache];
    v36 = [v15 imageView];
    [v36 setImage:v35];

    _SLLog(v4, 7, @"Mentions will fetch profile image for userRecord %@");
    id v37 = objc_loadWeakRetained((id *)&self->_sheetDelegate);
    v38 = objc_msgSend(v11, "screen_name", v11);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __69__SLMicroBlogMentionsViewController_tableView_cellForRowAtIndexPath___block_invoke;
    v40[3] = &unk_1E64681C0;
    id v41 = v11;
    v42 = self;
    id v43 = v7;
    [v37 fetchProfileImageDataForScreenName:v38 completion:v40];
  }

  return v15;
}

void __69__SLMicroBlogMentionsViewController_tableView_cellForRowAtIndexPath___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  _SLLog(v3, 7, @"Mentions did fetch profile image data %lx error %{public}@ for userRecord %@");
  if (v6 && !a3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__SLMicroBlogMentionsViewController_tableView_cellForRowAtIndexPath___block_invoke_2;
    block[3] = &unk_1E6467B38;
    int8x16_t v8 = *(int8x16_t *)(a1 + 32);
    id v7 = (id)v8.i64[0];
    int8x16_t v10 = vextq_s8(v8, v8, 8uLL);
    id v11 = v6;
    id v12 = *(id *)(a1 + 48);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __69__SLMicroBlogMentionsViewController_tableView_cellForRowAtIndexPath___block_invoke_2(uint64_t a1)
{
  id v11 = [*(id *)(a1 + 32) mentions];
  uint64_t v3 = [v11 indexOfObject:*(void *)(a1 + 40)];
  uint64_t v4 = v11;
  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v5 = [MEMORY[0x1E4F42A80] imageWithData:*(void *)(a1 + 48)];
    uint64_t v9 = *(void *)(a1 + 40);
    _SLLog(v1, 7, @"Mentions built image %@ for userRecord %@");
    if (v5)
    {
      objc_msgSend(*(id *)(a1 + 40), "setProfileImageCache:", v5, v5, v9);
      id v6 = (void *)MEMORY[0x1E4F1C978];
      id v7 = [MEMORY[0x1E4F28D58] indexPathForRow:v3 inSection:0];
      int8x16_t v8 = [v6 arrayWithObject:v7];

      uint64_t v10 = *(void *)(a1 + 40);
      _SLLog(v1, 7, @"Mentions refreshing row %@ for userRecord %@");
      objc_msgSend(*(id *)(a1 + 56), "reloadRowsAtIndexPaths:withRowAnimation:", v8, 100, v8, v10);
    }
    uint64_t v4 = v11;
  }
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v5 = a4;
  [v5 setOpaque:0];
  id v6 = [MEMORY[0x1E4F428B8] clearColor];
  [v5 setBackgroundColor:v6];
}

- (void)chooseRow:(int64_t)a3
{
  id v6 = [(NSArray *)self->_mentions objectAtIndex:a3];
  uint64_t v4 = objc_msgSend(v6, "screen_name");
  id v5 = [v4 stringByAppendingString:@" "];

  [(SLMicroBlogMentionsViewController *)self completeWithSelectedMention:v5];
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a4;
  _SLLog(v4, 7, @"SLMicroBlogMentionsViewController didSelectRowAtIndexPath: %@");
  uint64_t v7 = objc_msgSend(v6, "indexAtPosition:", 1, v6);

  [(SLMicroBlogMentionsViewController *)self chooseRow:v7];
}

+ (id)_blankSurrogateProfileImage
{
  uint64_t v2 = (void *)_blankSurrogateProfileImage___blankImage;
  if (!_blankSurrogateProfileImage___blankImage)
  {
    v8.width = 50.0;
    v8.height = 50.0;
    UIGraphicsBeginImageContext(v8);
    CurrentContext = UIGraphicsGetCurrentContext();
    UIGraphicsPushContext(CurrentContext);
    UIGraphicsPopContext();
    uint64_t v4 = UIGraphicsGetImageFromCurrentImageContext();
    id v5 = (void *)_blankSurrogateProfileImage___blankImage;
    _blankSurrogateProfileImage___blankImage = v4;

    UIGraphicsEndImageContext();
    uint64_t v2 = (void *)_blankSurrogateProfileImage___blankImage;
  }

  return v2;
}

- (SLMicroBlogMentionsDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SLMicroBlogMentionsDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_searchString, 0);
  objc_storeStrong((id *)&self->_mentions, 0);

  objc_destroyWeak((id *)&self->_sheetDelegate);
}

@end