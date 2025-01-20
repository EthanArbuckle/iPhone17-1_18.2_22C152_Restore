@interface VOTImageExplorerViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4;
- (NSArray)data;
- (NSArray)features;
- (UIImage)image;
- (UITableView)tableView;
- (VOTImageExplorerImageView)imageView;
- (VOTImageExplorerViewControllerDelegate)delegate;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismissImageExplorer;
- (void)_handleDoneButtonTap:(id)a3;
- (void)launchImageExplorerFromHostApp:(id)a3 withImage:(id)a4 visionFeatures:(id)a5 data:(id)a6;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setData:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFeatures:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageView:(id)a3;
- (void)setTableView:(id)a3;
- (void)setupNavigationItems;
- (void)updateImageExplorerWithImage:(id)a3 features:(id)a4 data:(id)a5;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation VOTImageExplorerViewController

- (void)viewDidLoad
{
  v32.receiver = self;
  v32.super_class = (Class)VOTImageExplorerViewController;
  [(VOTImageExplorerViewController *)&v32 viewDidLoad];
  id v3 = objc_alloc((Class)UITableView);
  v4 = [(VOTImageExplorerViewController *)self view];
  [v4 bounds];
  id v5 = [v3 initWithFrame:1];
  [(VOTImageExplorerViewController *)self setTableView:v5];

  v6 = [(VOTImageExplorerViewController *)self tableView];
  [v6 setDataSource:self];

  v7 = [(VOTImageExplorerViewController *)self tableView];
  [v7 setDelegate:self];

  v8 = [(VOTImageExplorerViewController *)self tableView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [(VOTImageExplorerViewController *)self tableView];
  [v9 registerClass:objc_opt_class() forCellReuseIdentifier:@"ImageExplorerImageCell"];

  v10 = [(VOTImageExplorerViewController *)self view];
  v11 = [(VOTImageExplorerViewController *)self tableView];
  [v10 addSubview:v11];

  v12 = [(VOTImageExplorerViewController *)self tableView];
  v13 = [v12 leftAnchor];
  v14 = [(VOTImageExplorerViewController *)self view];
  v15 = [v14 leftAnchor];
  v16 = [v13 constraintEqualToAnchor:v15];
  [v16 setActive:1];

  v17 = [(VOTImageExplorerViewController *)self tableView];
  v18 = [v17 rightAnchor];
  v19 = [(VOTImageExplorerViewController *)self view];
  v20 = [v19 rightAnchor];
  v21 = [v18 constraintEqualToAnchor:v20];
  [v21 setActive:1];

  v22 = [(VOTImageExplorerViewController *)self tableView];
  v23 = [v22 topAnchor];
  v24 = [(VOTImageExplorerViewController *)self view];
  v25 = [v24 topAnchor];
  v26 = [v23 constraintEqualToAnchor:v25];
  [v26 setActive:1];

  v27 = [(VOTImageExplorerViewController *)self tableView];
  v28 = [v27 bottomAnchor];
  v29 = [(VOTImageExplorerViewController *)self view];
  v30 = [v29 bottomAnchor];
  v31 = [v28 constraintEqualToAnchor:v30];
  [v31 setActive:1];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VOTImageExplorerViewController;
  [(VOTImageExplorerViewController *)&v4 viewWillAppear:a3];
  [(VOTImageExplorerViewController *)self setupNavigationItems];
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)setupNavigationItems
{
  id v3 = sub_10000CFD0(@"VoiceOverImageExplorer.title");
  objc_super v4 = [(VOTImageExplorerViewController *)self navigationItem];
  [v4 setTitle:v3];

  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_handleDoneButtonTap:"];
  id v8 = v5;
  v6 = +[NSArray arrayWithObjects:&v8 count:1];
  v7 = [(VOTImageExplorerViewController *)self navigationItem];
  [v7 setRightBarButtonItems:v6];
}

- (void)_handleDoneButtonTap:(id)a3
{
}

- (void)_dismissImageExplorer
{
  id v3 = [(VOTImageExplorerViewController *)self delegate];
  [v3 imageExplorerViewControllerWillDisappear];

  id v4 = [(VOTImageExplorerViewController *)self presentingViewController];
  [v4 dismissViewControllerAnimated:0 completion:0];
}

- (void)launchImageExplorerFromHostApp:(id)a3 withImage:(id)a4 visionFeatures:(id)a5 data:(id)a6
{
  id v16 = a3;
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  if ([v16 length])
  {
    v13 = sub_10000CFD0(@"VoiceOverImageExplorer.title.with.hostname");
    v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v13, v16);
    v15 = [(VOTImageExplorerViewController *)self navigationItem];
    [v15 setTitle:v14];
  }
  else
  {
    v13 = sub_10000CFD0(@"VoiceOverImageExplorer.title");
    v14 = [(VOTImageExplorerViewController *)self navigationItem];
    [v14 setTitle:v13];
  }

  [(VOTImageExplorerViewController *)self updateImageExplorerWithImage:v12 features:v11 data:v10];
}

- (void)updateImageExplorerWithImage:(id)a3 features:(id)a4 data:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = VOTLogImageExplorer();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_1000135EC(self);
  }

  id v12 = VOTLogImageExplorer();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100013530(self);
  }

  if (v8)
  {
    [(VOTImageExplorerViewController *)self setImage:v8];
    if (v9) {
      goto LABEL_7;
    }
LABEL_12:
    v14 = VOTLogImageExplorer();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      sub_100013418();
    }

    if (v10) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
  v13 = VOTLogImageExplorer();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    sub_1000134A4();
  }

  if (!v9) {
    goto LABEL_12;
  }
LABEL_7:
  [(VOTImageExplorerViewController *)self setFeatures:v9];
  if (v10)
  {
LABEL_8:
    [(VOTImageExplorerViewController *)self setData:v10];
    goto LABEL_18;
  }
LABEL_15:
  v15 = VOTLogImageExplorer();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
    sub_10001338C();
  }

LABEL_18:
  id v16 = [(VOTImageExplorerViewController *)self tableView];
  [v16 reloadData];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    v7 = [(VOTImageExplorerViewController *)self data];
    id v8 = [v7 count];
    unint64_t v9 = a4 - 1;

    if ((unint64_t)v8 <= v9)
    {
      int64_t v13 = 0;
    }
    else
    {
      id v10 = [(VOTImageExplorerViewController *)self data];
      id v11 = [v10 objectAtIndex:v9];
      id v12 = [v11 values];
      int64_t v13 = (int64_t)[v12 count];
    }
  }
  else
  {
    int64_t v13 = 1;
  }

  return v13;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  id v3 = [(VOTImageExplorerViewController *)self data];
  id v4 = (char *)[v3 count] + 1;

  return (int64_t)v4;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6 = a3;
  if (a4)
  {
    v7 = [(VOTImageExplorerViewController *)self data];
    id v8 = [v7 count];
    unint64_t v9 = a4 - 1;

    if ((unint64_t)v8 <= v9)
    {
      id v12 = 0;
    }
    else
    {
      id v10 = [(VOTImageExplorerViewController *)self data];
      id v11 = [v10 objectAtIndex:v9];
      id v12 = [v11 key];
    }
  }
  else
  {
    id v12 = sub_10000CFD0(@"VoiceOverImageExplorer.image");
  }

  return v12;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  id v6 = [v5 section];
  v7 = [(VOTImageExplorerViewController *)self tableView];
  id v8 = v7;
  if (v6)
  {
    unint64_t v9 = [v7 dequeueReusableCellWithIdentifier:@"ImageExplorerDetailCell"];

    if (!v9) {
      unint64_t v9 = (VOTImageExplorerImageTableViewCell *)[objc_alloc((Class)UITableViewCell) initWithStyle:0 reuseIdentifier:@"ImageExplorerDetailCell"];
    }
    id v10 = [(VOTImageExplorerViewController *)self data];
    id v11 = (char *)[v10 count];
    id v12 = (char *)[v5 section] - 1;

    if (v11 > v12)
    {
      int64_t v13 = [(VOTImageExplorerViewController *)self data];
      v14 = objc_msgSend(v13, "objectAtIndex:", (char *)objc_msgSend(v5, "section") - 1);
      v15 = [v14 values];

      id v16 = [v15 count];
      if (v16 > [v5 row])
      {
        v17 = [v15 objectAtIndex:[v5 row]];
        v18 = [(VOTImageExplorerImageTableViewCell *)v9 textLabel];
        [v18 setText:v17];
      }
    }
    v19 = [(VOTImageExplorerImageTableViewCell *)v9 textLabel];
    [v19 setLineBreakMode:0];

    v20 = [(VOTImageExplorerImageTableViewCell *)v9 textLabel];
    [v20 setNumberOfLines:0];
  }
  else
  {
    unint64_t v9 = [v7 dequeueReusableCellWithIdentifier:@"ImageExplorerImageCell"];

    if (!v9) {
      unint64_t v9 = [[VOTImageExplorerImageTableViewCell alloc] initWithStyle:0 reuseIdentifier:@"ImageExplorerImageCell"];
    }
    v21 = [(VOTImageExplorerViewController *)self image];
    v22 = [(VOTImageExplorerImageTableViewCell *)v9 explorerImageView];
    [v22 setImage:v21];

    v20 = [(VOTImageExplorerImageTableViewCell *)v9 explorerImageView];
    v23 = [(VOTImageExplorerViewController *)self features];
    [v20 setVisionFeatures:v23];
  }

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  if (![a4 section])
  {
    uint64_t v9 = [(VOTImageExplorerViewController *)self image];
    if (v9)
    {
      id v10 = (void *)v9;
      id v11 = [(VOTImageExplorerViewController *)self image];
      [v11 size];
      if (v12 <= 0.0)
      {
      }
      else
      {
        int64_t v13 = [(VOTImageExplorerViewController *)self image];
        [v13 size];
        double v15 = v14;

        if (v15 > 0.0)
        {
          id v16 = [(VOTImageExplorerViewController *)self image];
          [v16 size];
          double v18 = v17;
          v19 = [(VOTImageExplorerViewController *)self image];
          [v19 size];
          double v21 = v18 / v20;

          [v6 frame];
          double v7 = v22 / v21;
          goto LABEL_3;
        }
      }
    }
  }
  double v7 = UITableViewAutomaticDimension;
LABEL_3:

  return v7;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return 100.0;
}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return 0;
}

- (VOTImageExplorerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (VOTImageExplorerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (VOTImageExplorerImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
}

- (NSArray)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSArray)features
{
  return self->_features;
}

- (void)setFeatures:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_features, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end