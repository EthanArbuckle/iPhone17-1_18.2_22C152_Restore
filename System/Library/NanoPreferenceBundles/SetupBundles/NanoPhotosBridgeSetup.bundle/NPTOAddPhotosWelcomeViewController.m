@interface NPTOAddPhotosWelcomeViewController
- (BPSSetupMiniFlowControllerDelegate)miniFlowDelegate;
- (NPTOAddPhotosWelcomeViewController)init;
- (id)alternateButtonTitle;
- (id)detailString;
- (id)imageResource;
- (id)imageResourceBundleIdentifier;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)alternateButtonPressed:(id)a3;
- (void)setMiniFlowDelegate:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
@end

@implementation NPTOAddPhotosWelcomeViewController

- (NPTOAddPhotosWelcomeViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)NPTOAddPhotosWelcomeViewController;
  v2 = [(NPTOAddPhotosWelcomeViewController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(NPTOAddPhotosWelcomeViewController *)v2 setStyle:74];
  }
  return v3;
}

- (id)titleString
{
  v2 = [(NPTOAddPhotosWelcomeViewController *)self delegate];
  v3 = [v2 setupFlowUserInfo];
  v4 = [v3 objectForKeyedSubscript:BPSPairingFlowFamilyMember];

  objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"WELCOME_TITLE" value:@"Share Photos to %1$@’s Watch" table:0];
  v7 = [v4 firstName];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);

  return v8;
}

- (id)detailString
{
  v2 = [(NPTOAddPhotosWelcomeViewController *)self delegate];
  v3 = [v2 setupFlowUserInfo];
  v4 = [v3 objectForKeyedSubscript:BPSPairingFlowFamilyMember];

  objc_super v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"WELCOME_MESSAGE" value:@"You can share a photo album with %1$@ that can be used to create a Photo watch face in the Photos app on Apple Watch." table:0];
  v7 = [v4 firstName];
  v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v7);

  return v8;
}

- (id)imageResource
{
  return @"Screen-Photos";
}

- (id)imageResourceBundleIdentifier
{
  return @"com.apple.NanoPhotosBridgeSetup";
}

- (id)suggestedButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"WELCOME_CHOOSE_ALBUM_BUTTON_TITLE" value:@"Choose Photo Album" table:0];

  return v3;
}

- (id)alternateButtonTitle
{
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:@"WELCOME_SET_UP_LATER_BUTTON_TITLE" value:@"Set Up Later" table:0];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
  id v4 = [(NPTOAddPhotosWelcomeViewController *)self miniFlowDelegate];
  [v4 miniFlowStepComplete:self nextControllerClass:objc_opt_class()];
}

- (void)alternateButtonPressed:(id)a3
{
  [(NPTOAddPhotosWelcomeViewController *)self markPaneAsSkipped];
  id v4 = [(NPTOAddPhotosWelcomeViewController *)self miniFlowDelegate];
  [v4 miniFlowStepComplete:self];
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
}

@end