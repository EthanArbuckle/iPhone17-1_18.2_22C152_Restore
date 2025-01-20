@interface NPTOSelectPhotoAlbumViewController
- (BPSBuddyControllerDelegate)delegate;
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (id)_albumsSectionTitle;
- (id)_device;
- (id)_noneAlbumName;
- (id)_title;
- (void)_handleDoneAction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation NPTOSelectPhotoAlbumViewController

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)NPTOSelectPhotoAlbumViewController;
  [(NPTOBridgeAlbumChooser *)&v9 viewWillAppear:a3];
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"_handleDoneAction:"];
  v5 = [(NPTOSelectPhotoAlbumViewController *)self navigationItem];
  [v5 setRightBarButtonItem:v4];

  v6 = [(NPTOSelectPhotoAlbumViewController *)self navigationItem];
  v7 = +[NSBundle bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"BACK" value:@"Back" table:0];
  [v6 setBackButtonTitle:v8];
}

- (id)_device
{
  v2 = [(NPTOSelectPhotoAlbumViewController *)self delegate];
  v3 = [v2 activePairingDevice];

  return v3;
}

- (id)_title
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"SELECT_ALBUM_TITLE" value:@"Select Photo Album" table:0];

  return v3;
}

- (id)_noneAlbumName
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"ALBUM_NONE" value:@"None" table:0];

  return v3;
}

- (id)_albumsSectionTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"ALBUM_ALBUMS_SECTION_TITLE" value:@"Albums" table:0];

  return v3;
}

- (void)_handleDoneAction:(id)a3
{
  id v4 = [(NPTOSelectPhotoAlbumViewController *)self miniFlowDelegate];
  [v4 miniFlowStepComplete:self];
}

- (BPSBuddyControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (BPSBuddyControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->miniFlowDelegate);

  return (BPSSetupMiniFlowControllerDelegate *)WeakRetained;
}

- (void)setMiniFlowDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->miniFlowDelegate);

  objc_destroyWeak((id *)&self->delegate);
}

@end