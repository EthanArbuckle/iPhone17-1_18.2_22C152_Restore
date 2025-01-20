@interface HomePodVoiceSelectionOptionsView
- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4;
- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (HomePodVoiceSelectionOptionsView)init;
- (SUICVoiceSelectionEventHandling)voiceSelectionEventHandler;
- (SUICVoiceSelectionViewModelProviding)voiceSelectionViewModelProvider;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_diffableTableDataSource;
- (id)_tableCellForVoiceViewModel:(id)a3 indexPath:(id)a4;
- (void)_createAndApplySnapshotForViewModel:(id)a3;
- (void)_setupVoicesTableView;
- (void)setSemanticContentAttribute:(int64_t)a3;
- (void)setVoiceSelectionEventHandler:(id)a3;
- (void)setVoiceSelectionViewModelProvider:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)voiceSelectionViewModelDidChange;
@end

@implementation HomePodVoiceSelectionOptionsView

- (HomePodVoiceSelectionOptionsView)init
{
  v5.receiver = self;
  v5.super_class = (Class)HomePodVoiceSelectionOptionsView;
  v2 = [(HomePodVoiceSelectionOptionsView *)&v5 init];
  v3 = v2;
  if (v2) {
    [(HomePodVoiceSelectionOptionsView *)v2 _setupVoicesTableView];
  }
  return v3;
}

- (void)_setupVoicesTableView
{
  v3 = [objc_alloc((Class)UITableView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  voicesTableView = self->_voicesTableView;
  self->_voicesTableView = v3;

  objc_super v5 = [(HomePodVoiceSelectionOptionsView *)self _diffableTableDataSource];
  tableViewDataSource = self->_tableViewDataSource;
  self->_tableViewDataSource = v5;

  [(UITableViewDiffableDataSource *)self->_tableViewDataSource setDefaultRowAnimation:0];
  [(UITableView *)self->_voicesTableView setDelegate:self];
  [(UITableView *)self->_voicesTableView setDataSource:self->_tableViewDataSource];
  [(UITableView *)self->_voicesTableView setShowsHorizontalScrollIndicator:0];
  [(UITableView *)self->_voicesTableView setShowsVerticalScrollIndicator:0];
  v7 = +[UIColor systemBackgroundColor];
  [(UITableView *)self->_voicesTableView setBackgroundColor:v7];

  v8 = [(UITableView *)self->_voicesTableView layer];
  [v8 setCornerRadius:8.0];

  [(UITableView *)self->_voicesTableView registerClass:objc_opt_class() forCellReuseIdentifier:@"VoiceCell"];
  [(HomePodVoiceSelectionOptionsView *)self addSubview:self->_voicesTableView];
  [(UITableView *)self->_voicesTableView setTranslatesAutoresizingMaskIntoConstraints:0];
  v21 = [(UITableView *)self->_voicesTableView topAnchor];
  v20 = [(HomePodVoiceSelectionOptionsView *)self topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v22[0] = v19;
  v9 = [(UITableView *)self->_voicesTableView leftAnchor];
  v10 = [(HomePodVoiceSelectionOptionsView *)self leftAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v22[1] = v11;
  v12 = [(UITableView *)self->_voicesTableView rightAnchor];
  v13 = [(HomePodVoiceSelectionOptionsView *)self rightAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v22[2] = v14;
  v15 = [(UITableView *)self->_voicesTableView bottomAnchor];
  v16 = [(HomePodVoiceSelectionOptionsView *)self bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v22[3] = v17;
  v18 = +[NSArray arrayWithObjects:v22 count:4];
  +[NSLayoutConstraint activateConstraints:v18];
}

- (id)_diffableTableDataSource
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc((Class)UITableViewDiffableDataSource);
  voicesTableView = self->_voicesTableView;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100004C20;
  v7[3] = &unk_1000D9AA8;
  objc_copyWeak(&v8, &location);
  v7[4] = self;
  id v5 = [v3 initWithTableView:voicesTableView cellProvider:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (id)_tableCellForVoiceViewModel:(id)a3 indexPath:(id)a4
{
  voicesTableView = self->_voicesTableView;
  id v7 = a3;
  id v8 = [(UITableView *)voicesTableView dequeueReusableCellWithIdentifier:@"VoiceCell" forIndexPath:a4];
  v9 = (CGColor *)[v7 associatedCGColor];
  v10 = +[UIColor colorWithCGColor:v9];
  CGColorRelease(v9);
  v11 = +[UIListContentConfiguration cellConfiguration];
  v12 = [v7 localizedDisplayName];
  [v11 setText:v12];

  v13 = [v11 imageProperties];
  [v13 setTintColor:v10];

  [v8 setContentConfiguration:v11];
  v14 = +[UIColor secondarySystemBackgroundColor];
  [v8 setBackgroundColor:v14];

  LODWORD(v14) = [v7 isCurrentSiriVoice];
  if (v14) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 0;
  }
  [v8 setAccessoryType:v15];
  [v8 setSemanticContentAttribute:[self->_voicesTableView semanticContentAttribute]];

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v9 = [(HomePodVoiceSelectionOptionsView *)self voiceSelectionEventHandler];
  v6 = [(SUICVoiceSelectionViewModel *)self->_viewModel voices];
  id v7 = [v5 row];

  id v8 = [v6 objectAtIndexedSubscript:v7];
  [v9 voiceSelectionView:self receivedRequestToSelectVoice:v8];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 45.0;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 shouldDrawTopSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (void)voiceSelectionViewModelDidChange
{
  id v3 = [(HomePodVoiceSelectionOptionsView *)self voiceSelectionViewModelProvider];
  v4 = [v3 voiceSelectionViewModel];
  viewModel = self->_viewModel;
  self->_viewModel = v4;

  v6 = self->_viewModel;

  [(HomePodVoiceSelectionOptionsView *)self _createAndApplySnapshotForViewModel:v6];
}

- (void)_createAndApplySnapshotForViewModel:(id)a3
{
  v16 = self;
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSDiffableDataSourceSnapshot);
  CFStringRef v25 = @"Voice";
  id v5 = +[NSArray arrayWithObjects:&v25 count:1];
  [v4 appendSectionsWithIdentifiers:v5];

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  v17 = v3;
  v6 = [v3 voices];
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = [v11 localizedDisplayName:v16];
        v23 = v12;
        v13 = +[NSArray arrayWithObjects:&v23 count:1];
        [v4 appendItemsWithIdentifiers:v13 intoSectionWithIdentifier:@"Voice"];

        v14 = [v11 localizedDisplayName];
        v22 = v14;
        uint64_t v15 = +[NSArray arrayWithObjects:&v22 count:1];
        [v4 reloadItemsWithIdentifiers:v15];
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v8);
  }

  [(UITableViewDiffableDataSource *)v16->_tableViewDataSource applySnapshot:v4 animatingDifferences:1];
}

- (void)setSemanticContentAttribute:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HomePodVoiceSelectionOptionsView;
  -[HomePodVoiceSelectionOptionsView setSemanticContentAttribute:](&v5, "setSemanticContentAttribute:");
  [(UITableView *)self->_voicesTableView setSemanticContentAttribute:a3];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  id v4 = [(SUICVoiceSelectionViewModel *)self->_viewModel voices];
  double v5 = (float)((float)(unint64_t)[v4 count] * 45.0);

  double v6 = width;
  double v7 = v5;
  result.height = v7;
  result.CGFloat width = v6;
  return result;
}

- (SUICVoiceSelectionViewModelProviding)voiceSelectionViewModelProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceSelectionViewModelProvider);

  return (SUICVoiceSelectionViewModelProviding *)WeakRetained;
}

- (void)setVoiceSelectionViewModelProvider:(id)a3
{
}

- (SUICVoiceSelectionEventHandling)voiceSelectionEventHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceSelectionEventHandler);

  return (SUICVoiceSelectionEventHandling *)WeakRetained;
}

- (void)setVoiceSelectionEventHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_voiceSelectionEventHandler);
  objc_destroyWeak((id *)&self->_voiceSelectionViewModelProvider);
  objc_storeStrong((id *)&self->_tableViewDataSource, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);

  objc_storeStrong((id *)&self->_voicesTableView, 0);
}

@end