@interface CDPLocalSecretEntryPane
- (double)desiredMinPinHeight;
- (void)setTitle:(id)a3;
@end

@implementation CDPLocalSecretEntryPane

- (void)setTitle:(id)a3
{
  v4 = (void *)MEMORY[0x263F343B8];
  id v5 = a3;
  v6 = [v4 builderForKey:@"LOCAL_SECRET_ENTRY_TITLE"];
  v7 = [MEMORY[0x263F343A8] sharedInstance];
  v8 = [v7 deviceClass];
  v9 = [v6 addDeviceClass:v8];
  v10 = [v9 addSecretType:1];
  id v13 = [v10 localizedString];

  v11 = [(CDPPaneHeaderView *)self->super._headerView textLabel];
  [v11 setText:v13];

  v12 = [(CDPPaneHeaderView *)self->super._headerView detailTextLabel];
  [v12 setText:v5];

  [(CDPPaneHeaderView *)self->super._headerView makeAllTheTextFits];
  [(CDPPaneHeaderView *)self->super._headerView sizeToFit];
}

- (double)desiredMinPinHeight
{
  return 132.0;
}

@end