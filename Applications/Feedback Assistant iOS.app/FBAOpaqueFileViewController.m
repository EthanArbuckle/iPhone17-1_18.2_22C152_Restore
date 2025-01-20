@interface FBAOpaqueFileViewController
+ (BOOL)shouldDisplayItem:(id)a3;
- (BOOL)showsItem;
- (DEDAttachmentItem)item;
- (UIImageView)icon;
- (UILabel)debugLabel;
- (UILabel)fileNameLabel;
- (UILabel)fileSizeLabel;
- (void)didTapView;
- (void)setDebugLabel:(id)a3;
- (void)setFileNameLabel:(id)a3;
- (void)setFileSizeLabel:(id)a3;
- (void)setIcon:(id)a3;
- (void)setItem:(id)a3;
- (void)viewDidLoad;
@end

@implementation FBAOpaqueFileViewController

- (void)viewDidLoad
{
  v23.receiver = self;
  v23.super_class = (Class)FBAOpaqueFileViewController;
  [(FBAOpaqueFileViewController *)&v23 viewDidLoad];
  v3 = [(FBAOpaqueFileViewController *)self navigationItem];
  [v3 setLargeTitleDisplayMode:2];

  v4 = [(FBAOpaqueFileViewController *)self item];

  if (v4)
  {
    v5 = [(FBAOpaqueFileViewController *)self item];
    v6 = [v5 displayName];
    v7 = [(FBAOpaqueFileViewController *)self fileNameLabel];
    [v7 setText:v6];

    v8 = [(FBAOpaqueFileViewController *)self fileNameLabel];
    [v8 setNumberOfLines:0];

    v9 = [(FBAOpaqueFileViewController *)self item];
    v10 = [v9 fileSize];
    id v11 = [v10 unsignedLongLongValue];

    v12 = +[NSByteCountFormatter stringFromByteCount:v11 countStyle:0];
    v13 = [(FBAOpaqueFileViewController *)self fileSizeLabel];
    [v13 setText:v12];

    if (FBKIsInternalInstall() && [(FBAOpaqueFileViewController *)self showsItem])
    {
      v14 = [(FBAOpaqueFileViewController *)self item];
      v15 = [v14 description];
      v16 = +[NSString stringWithFormat:@"(INTERNAL)\n\n%@", v15];
      v17 = [(FBAOpaqueFileViewController *)self debugLabel];
      [v17 setText:v16];

      id v18 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"didTapView"];
      v19 = [(FBAOpaqueFileViewController *)self view];
      [v19 addGestureRecognizer:v18];

      v20 = [(FBAOpaqueFileViewController *)self debugLabel];
      [v20 setAlpha:0.0];

      v21 = [(FBAOpaqueFileViewController *)self debugLabel];
      [v21 setHidden:0];
    }
  }
  else
  {
    v22 = [(FBAOpaqueFileViewController *)self fileNameLabel];
    [v22 setText:&stru_1000F6658];

    v12 = [(FBAOpaqueFileViewController *)self fileNameLabel];
    [v12 setText:&stru_1000F6658];
  }
}

+ (BOOL)shouldDisplayItem:(id)a3
{
  id v3 = a3;
  if ([v3 pointsToReachableDir])
  {
    BOOL v4 = 0;
  }
  else
  {
    v5 = [v3 attachedPath];
    if ([v3 isLocal]
      && [v5 checkResourceIsReachableAndReturnError:0]
      && +[FBKFileManager humansCanReadFile:v5])
    {
      v6 = [v3 fileSize];
      BOOL v4 = [v6 intValue] == 0;
    }
    else
    {
      BOOL v4 = 1;
    }
  }
  return v4;
}

- (BOOL)showsItem
{
  v2 = +[NSUserDefaults standardUserDefaults];
  unsigned __int8 v3 = [v2 BOOLForKey:FBKShowDEDItem];

  return v3;
}

- (void)didTapView
{
  unsigned __int8 v3 = [(FBAOpaqueFileViewController *)self debugLabel];
  [v3 alpha];
  BOOL v5 = v4 == 0.0;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100012EB4;
  v6[3] = &unk_1000F29E0;
  BOOL v7 = v5;
  v6[4] = self;
  +[UIView animateWithDuration:v6 animations:0.25];
}

- (DEDAttachmentItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
}

- (UILabel)debugLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_debugLabel);

  return (UILabel *)WeakRetained;
}

- (void)setDebugLabel:(id)a3
{
}

- (UILabel)fileNameLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fileNameLabel);

  return (UILabel *)WeakRetained;
}

- (void)setFileNameLabel:(id)a3
{
}

- (UILabel)fileSizeLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_fileSizeLabel);

  return (UILabel *)WeakRetained;
}

- (void)setFileSizeLabel:(id)a3
{
}

- (UIImageView)icon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_icon);

  return (UIImageView *)WeakRetained;
}

- (void)setIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_icon);
  objc_destroyWeak((id *)&self->_fileSizeLabel);
  objc_destroyWeak((id *)&self->_fileNameLabel);
  objc_destroyWeak((id *)&self->_debugLabel);

  objc_storeStrong((id *)&self->_item, 0);
}

@end