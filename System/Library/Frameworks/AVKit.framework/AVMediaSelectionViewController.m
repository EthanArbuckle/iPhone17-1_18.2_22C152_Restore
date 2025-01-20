@interface AVMediaSelectionViewController
- (AVMediaSelectionViewController)initWithPlayerController:(id)a3 doneButtonTarget:(id)a4 doneButtonAction:(SEL)a5;
- (id)mediaSelectionTableViewController;
@end

@implementation AVMediaSelectionViewController

- (void).cxx_destruct
{
}

- (id)mediaSelectionTableViewController
{
  return self->_mediaSelectionTableViewController;
}

- (AVMediaSelectionViewController)initWithPlayerController:(id)a3 doneButtonTarget:(id)a4 doneButtonAction:(SEL)a5
{
  id v8 = a4;
  id v9 = a3;
  v10 = [[AVMediaSelectionTableViewController alloc] initWithStyle:1];
  [(AVMediaSelectionTableViewController *)v10 setPlayerController:v9];

  v19.receiver = self;
  v19.super_class = (Class)AVMediaSelectionViewController;
  v11 = [(AVMediaSelectionViewController *)&v19 initWithRootViewController:v10];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_mediaSelectionTableViewController, v10);
    v13 = [(AVMediaSelectionTableViewController *)v10 navigationItem];
    v14 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:v8 action:a5];
    [v13 setRightBarButtonItem:v14];

    [(AVMediaSelectionViewController *)v12 setModalPresentationStyle:7];
    [(AVMediaSelectionViewController *)v12 setModalPresentationCapturesStatusBarAppearance:1];
    v15 = [(AVMediaSelectionViewController *)v12 navigationBar];
    [v15 setBarStyle:1];

    v16 = [(AVMediaSelectionViewController *)v12 navigationBar];
    v17 = [MEMORY[0x1E4FB1618] whiteColor];
    [v16 setTintColor:v17];

    [(AVMediaSelectionViewController *)v12 setOverrideUserInterfaceStyle:2];
  }

  return v12;
}

@end