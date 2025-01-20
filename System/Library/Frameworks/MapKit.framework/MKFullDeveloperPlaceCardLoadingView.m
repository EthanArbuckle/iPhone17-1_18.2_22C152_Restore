@interface MKFullDeveloperPlaceCardLoadingView
+ (CGSize)contentSize;
- (MKFullDeveloperPlaceCardLoadingView)init;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (int64_t)viewTypeForIndexPath:(id)a3;
- (void)setup;
@end

@implementation MKFullDeveloperPlaceCardLoadingView

+ (CGSize)contentSize
{
  double v2 = 320.0;
  double v3 = 442.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (MKFullDeveloperPlaceCardLoadingView)init
{
  v5.receiver = self;
  v5.super_class = (Class)MKFullDeveloperPlaceCardLoadingView;
  double v2 = -[MKFullDeveloperPlaceCardLoadingView initWithFrame:](&v5, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v3 = v2;
  if (v2) {
    [(MKFullDeveloperPlaceCardLoadingView *)v2 setup];
  }
  return v3;
}

- (void)setup
{
  v27[7] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F42E98]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  v6 = objc_msgSend(MEMORY[0x1E4F428B8], "_mapkit_colorNamed:", @"DeveloperPlaceCardFullBackgroundColor");
  [(UITableView *)self->_tableView setBackgroundColor:v6];

  [(UITableView *)self->_tableView setUserInteractionEnabled:0];
  [(UITableView *)self->_tableView setDelegate:self];
  [(UITableView *)self->_tableView setDataSource:self];
  [(UITableView *)self->_tableView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKFullDeveloperPlaceCardLoadingView *)self addSubview:self->_tableView];
  v19 = (void *)MEMORY[0x1E4F28DC8];
  v26 = [(UITableView *)self->_tableView topAnchor];
  v25 = [(MKFullDeveloperPlaceCardLoadingView *)self topAnchor];
  v24 = [v26 constraintEqualToAnchor:v25];
  v27[0] = v24;
  v23 = [(UITableView *)self->_tableView bottomAnchor];
  v22 = [(MKFullDeveloperPlaceCardLoadingView *)self bottomAnchor];
  v21 = [v23 constraintEqualToAnchor:v22];
  v27[1] = v21;
  v20 = [(UITableView *)self->_tableView leadingAnchor];
  v18 = [(MKFullDeveloperPlaceCardLoadingView *)self leadingAnchor];
  v17 = [v20 constraintEqualToAnchor:v18];
  v27[2] = v17;
  v7 = [(UITableView *)self->_tableView trailingAnchor];
  v8 = [(MKFullDeveloperPlaceCardLoadingView *)self trailingAnchor];
  v9 = [v7 constraintEqualToAnchor:v8];
  v27[3] = v9;
  v10 = [(UITableView *)self->_tableView heightAnchor];
  v11 = [v10 constraintGreaterThanOrEqualToConstant:442.0];
  v27[4] = v11;
  v12 = [(MKFullDeveloperPlaceCardLoadingView *)self widthAnchor];
  v13 = [v12 constraintGreaterThanOrEqualToConstant:320.0];
  v27[5] = v13;
  v14 = [(MKFullDeveloperPlaceCardLoadingView *)self heightAnchor];
  v15 = [v14 constraintGreaterThanOrEqualToConstant:442.0];
  v27[6] = v15;
  v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:7];
  [v19 activateConstraints:v16];
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  if (a4)
  {
    v6 = 0;
  }
  else
  {
    v6 = +[MKDeveloperPlaceCardLoadingViewDecorator decorateView:ofType:](MKDeveloperPlaceCardLoadingViewDecorator, "decorateView:ofType:", 0, 3, v4);
  }
  return v6;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double result = 76.0;
  if (a4) {
    return 12.0;
  }
  return result;
}

- (int64_t)viewTypeForIndexPath:(id)a3
{
  id v3 = a3;
  if ([v3 section])
  {
    BOOL v4 = [v3 section] == 1;

    return 2 * v4;
  }
  else
  {
    uint64_t v6 = [v3 row];

    return v6 == 3;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = objc_opt_new();
  int64_t v7 = [(MKFullDeveloperPlaceCardLoadingView *)self viewTypeForIndexPath:v5];
  v8 = [v6 contentView];
  v9 = [v6 contentView];
  v10 = +[MKDeveloperPlaceCardLoadingViewDecorator decorateView:v9 ofType:v7];
  [v8 addSubview:v10];

  uint64_t v11 = [v5 section];
  objc_msgSend(v6, "set_mapkit_forceSeparatorFrameToCGRectZero:", v11 == 0);
  objc_msgSend(v6, "setSeparatorInset:", 0.0, 48.0, 0.0, 0.0);
  v12 = objc_msgSend(MEMORY[0x1E4F428B8], "_mapkit_colorNamed:", @"DeveloperPlaceCardPlatterColor");
  v13 = [v6 contentView];
  [v13 setBackgroundColor:v12];

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4) {
    return 2 * (a4 == 1);
  }
  else {
    return 4;
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);

  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
}

@end