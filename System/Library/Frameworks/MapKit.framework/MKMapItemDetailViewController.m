@interface MKMapItemDetailViewController
- (MKMapItem)mapItem;
- (MKMapItemDetailViewController)initWithCoder:(id)a3;
- (MKMapItemDetailViewController)initWithMapItem:(id)a3;
- (MKMapItemDetailViewController)initWithMapItem:(id)a3 displaysMap:(BOOL)a4;
- (MKMapItemDetailViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MKMapItemDetailViewControllerDelegate)delegate;
- (void)encodeWithCoder:(id)a3;
- (void)loadView;
- (void)selectionAccessoryViewDidRequestDismissal:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMapItem:(id)a3;
@end

@implementation MKMapItemDetailViewController

- (MKMapItemDetailViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  return [(MKMapItemDetailViewController *)self initWithMapItem:0 displaysMap:1];
}

- (MKMapItemDetailViewController)initWithMapItem:(id)a3
{
  return [(MKMapItemDetailViewController *)self initWithMapItem:a3 displaysMap:1];
}

- (MKMapItemDetailViewController)initWithMapItem:(id)a3 displaysMap:(BOOL)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MKMapItemDetailViewController;
  v8 = [(MKMapItemDetailViewController *)&v11 initWithNibName:0 bundle:0];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_mapItem, a3);
    v9->_displaysMap = a4;
  }

  return v9;
}

- (MKMapItemDetailViewController)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MKMapItemDetailViewController;
  v5 = [(MKMapItemDetailViewController *)&v9 initWithCoder:v4];
  v6 = v5;
  if (v5)
  {
    mapItem = v5->_mapItem;
    v5->_mapItem = 0;

    if ([v4 containsValueForKey:@"MKDisplaysMap"]) {
      v6->_displaysMap = [v4 decodeBoolForKey:@"MKDisplaysMap"];
    }
    else {
      v6->_displaysMap = 1;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MKMapItemDetailViewController;
  id v4 = a3;
  [(MKMapItemDetailViewController *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeBool:forKey:", self->_displaysMap, @"MKDisplaysMap", v5.receiver, v5.super_class);
}

- (void)loadView
{
  v29[4] = *MEMORY[0x1E4F143B8];
  v3 = [_MKMapItemDetailView alloc];
  id v4 = -[_MKMapItemDetailView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MKMapItemDetailViewController *)self setView:v4];

  objc_super v5 = [(MKMapItemDetailViewController *)self view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v6 = [MEMORY[0x1E4F428B8] systemGroupedBackgroundColor];
  id v7 = [(MKMapItemDetailViewController *)self view];
  [v7 setBackgroundColor:v6];

  v8 = [[MKFullDeveloperPlaceCardSelectionAccessoryView alloc] initAsStandAloneHidingInlineMap:!self->_displaysMap];
  accessoryView = self->_accessoryView;
  self->_accessoryView = v8;

  [(MKFullDeveloperPlaceCardSelectionAccessoryView *)self->_accessoryView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(MKViewSwitchingSelectionAccessoryView *)self->_accessoryView setParentViewController:self];
  [(MKSelectionAccessoryView *)self->_accessoryView setDelegate:self];
  v10 = [(MKMapItemDetailViewController *)self view];
  [v10 addSubview:self->_accessoryView];

  v21 = (void *)MEMORY[0x1E4F28DC8];
  v27 = [(MKFullDeveloperPlaceCardSelectionAccessoryView *)self->_accessoryView topAnchor];
  v28 = [(MKMapItemDetailViewController *)self view];
  v26 = [v28 topAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v29[0] = v25;
  v23 = [(MKFullDeveloperPlaceCardSelectionAccessoryView *)self->_accessoryView leadingAnchor];
  v24 = [(MKMapItemDetailViewController *)self view];
  v22 = [v24 leadingAnchor];
  v20 = [v23 constraintEqualToAnchor:v22];
  v29[1] = v20;
  v19 = [(MKMapItemDetailViewController *)self view];
  objc_super v11 = [v19 trailingAnchor];
  v12 = [(MKFullDeveloperPlaceCardSelectionAccessoryView *)self->_accessoryView trailingAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v29[2] = v13;
  v14 = [(MKMapItemDetailViewController *)self view];
  v15 = [v14 bottomAnchor];
  v16 = [(MKFullDeveloperPlaceCardSelectionAccessoryView *)self->_accessoryView bottomAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v29[3] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:4];
  [v21 activateConstraints:v18];

  if (self->_mapItem) {
    -[MKViewSwitchingSelectionAccessoryView displayMapItem:](self->_accessoryView, "displayMapItem:");
  }
}

- (void)selectionAccessoryViewDidRequestDismissal:(id)a3
{
  id v4 = [(MKMapItemDetailViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v8 = [(MKMapItemDetailViewController *)self delegate];
    [v8 mapItemDetailViewControllerDidFinish:self];
  }
  else
  {
    v6 = [(MKMapItemDetailViewController *)self presentingViewController];

    if (v6)
    {
      [(MKMapItemDetailViewController *)self dismissViewControllerAnimated:1 completion:0];
    }
    else
    {
      id v7 = MKGetMKRemoteUILog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18BAEC000, v7, OS_LOG_TYPE_INFO, "MKMapItemDetailViewController close button not actionable", buf, 2u);
      }
    }
  }
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
}

- (MKMapItemDetailViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MKMapItemDetailViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mapItem, 0);

  objc_storeStrong((id *)&self->_accessoryView, 0);
}

@end