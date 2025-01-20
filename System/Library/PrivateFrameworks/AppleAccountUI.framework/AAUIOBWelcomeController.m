@interface AAUIOBWelcomeController
- (AAUIOBWelcomeController)initWithViewModel:(id)a3;
- (AAUIOBWelcomeControllerDelegate)delegate;
- (OBTrayButton)primaryButton;
- (OBTrayButton)secondaryButton;
- (void)_addBulletedListItems:(id)a3;
- (void)_addContentViewWithViewModel:(id)a3;
- (void)_addHelpLinkButtonWithViewModel:(id)a3;
- (void)_addPrimaryButtonWithViewModel:(id)a3;
- (void)_addSecondaryButtonWithViewModel:(id)a3;
- (void)_addSecondaryViewWithViewModel:(id)a3;
- (void)_delegate_welcomeViewControllerDidCompleteWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_openHelpLink;
- (void)setDelegate:(id)a3;
- (void)setPrimaryButton:(id)a3;
- (void)setSecondaryButton:(id)a3;
@end

@implementation AAUIOBWelcomeController

- (AAUIOBWelcomeController)initWithViewModel:(id)a3
{
  id v4 = a3;
  v5 = [v4 title];
  v6 = [v4 detailText];
  v7 = [v4 image];
  v11.receiver = self;
  v11.super_class = (Class)AAUIOBWelcomeController;
  v8 = -[AAUIOBWelcomeController initWithTitle:detailText:icon:contentLayout:](&v11, sel_initWithTitle_detailText_icon_contentLayout_, v5, v6, v7, [v4 contentViewLayout]);

  if (v8)
  {
    if ([v4 conformsToProtocol:&unk_26BD94718]) {
      [(AAUIOBWelcomeController *)v8 _addBulletedListItems:v4];
    }
    [(AAUIOBWelcomeController *)v8 _addContentViewWithViewModel:v4];
    [(AAUIOBWelcomeController *)v8 _addSecondaryViewWithViewModel:v4];
    [(AAUIOBWelcomeController *)v8 _addPrimaryButtonWithViewModel:v4];
    [(AAUIOBWelcomeController *)v8 _addSecondaryButtonWithViewModel:v4];
    [(AAUIOBWelcomeController *)v8 _addHelpLinkButtonWithViewModel:v4];
    v9 = [v4 accessibilityIdentifier];
    [(AAUIOBWelcomeController *)v8 setAccessibilityIdentifier:v9];
  }
  [(AAUIOBWelcomeController *)v8 setModalInPresentation:1];

  return v8;
}

- (void)_addBulletedListItems:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = objc_msgSend(a3, "bullets", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v9 title];
        objc_super v11 = [v9 description];
        v12 = (void *)MEMORY[0x263F827E8];
        v13 = [v9 symbolName];
        v14 = [v12 systemImageNamed:v13];
        [(AAUIOBWelcomeController *)self addBulletedListItemWithTitle:v10 description:v11 image:v14];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
}

- (void)_addContentViewWithViewModel:(id)a3
{
  v26[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 contentView];

  if (v5)
  {
    uint64_t v6 = [v4 contentView];
    uint64_t v7 = [(AAUIOBWelcomeController *)self contentView];
    [v7 addSubview:v6];

    long long v18 = (void *)MEMORY[0x263F08938];
    v24 = [v6 leadingAnchor];
    v25 = [(AAUIOBWelcomeController *)self contentView];
    v23 = [v25 leadingAnchor];
    v22 = [v24 constraintEqualToAnchor:v23];
    v26[0] = v22;
    uint64_t v20 = [v6 trailingAnchor];
    v21 = [(AAUIOBWelcomeController *)self contentView];
    v19 = [v21 trailingAnchor];
    long long v17 = [v20 constraintEqualToAnchor:v19];
    v26[1] = v17;
    long long v16 = [v6 topAnchor];
    v8 = [(AAUIOBWelcomeController *)self contentView];
    v9 = [v8 topAnchor];
    v10 = [v16 constraintEqualToAnchor:v9 constant:20.0];
    v26[2] = v10;
    objc_super v11 = [v6 bottomAnchor];
    v12 = [(AAUIOBWelcomeController *)self contentView];
    v13 = [v12 bottomAnchor];
    v14 = [v11 constraintEqualToAnchor:v13];
    v26[3] = v14;
    long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:4];
    [v18 activateConstraints:v15];
  }
}

- (void)_addSecondaryViewWithViewModel:(id)a3
{
  v22[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = [v4 secondaryView];

  if (v5)
  {
    uint64_t v6 = [v4 secondaryView];
    uint64_t v7 = [(AAUIOBWelcomeController *)self secondaryContentView];
    [v7 addSubview:v6];

    long long v17 = (void *)MEMORY[0x263F08938];
    uint64_t v20 = [v6 leadingAnchor];
    v21 = [(AAUIOBWelcomeController *)self secondaryContentView];
    v19 = [v21 leadingAnchor];
    long long v18 = [v20 constraintEqualToAnchor:v19];
    v22[0] = v18;
    long long v16 = [v6 trailingAnchor];
    v8 = [(AAUIOBWelcomeController *)self secondaryContentView];
    v9 = [v8 trailingAnchor];
    v10 = [v16 constraintEqualToAnchor:v9];
    v22[1] = v10;
    objc_super v11 = [v6 topAnchor];
    v12 = [(AAUIOBWelcomeController *)self secondaryContentView];
    v13 = [v12 topAnchor];
    v14 = [v11 constraintEqualToAnchor:v13 constant:20.0];
    v22[2] = v14;
    long long v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v22 count:3];
    [v17 activateConstraints:v15];
  }
}

- (void)_addPrimaryButtonWithViewModel:(id)a3
{
  id v10 = a3;
  id v4 = [v10 primaryButton];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F5B898] boldButton];
    primaryButton = self->_primaryButton;
    self->_primaryButton = v5;

    uint64_t v7 = self->_primaryButton;
    v8 = [v10 primaryButton];
    [(OBTrayButton *)v7 setTitle:v8 forState:0];

    [(OBTrayButton *)self->_primaryButton addTarget:self action:sel__delegate_welcomeViewControllerDidCompleteWithSuccess_error_ forControlEvents:64];
    v9 = [(AAUIOBWelcomeController *)self buttonTray];
    [v9 addButton:self->_primaryButton];
  }
}

- (void)_addSecondaryButtonWithViewModel:(id)a3
{
  id v10 = a3;
  id v4 = [v10 secondaryButton];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F5B8D0] linkButton];
    secondaryButton = self->_secondaryButton;
    self->_secondaryButton = v5;

    uint64_t v7 = self->_secondaryButton;
    v8 = [v10 secondaryButton];
    [(OBTrayButton *)v7 setTitle:v8 forState:0];

    [(OBTrayButton *)self->_secondaryButton addTarget:self action:sel__delegate_welcomeViewControllerDidCompleteWithSuccess_error_ forControlEvents:64];
    v9 = [(AAUIOBWelcomeController *)self buttonTray];
    [v9 addButton:self->_secondaryButton];
  }
}

- (void)_addHelpLinkButtonWithViewModel:(id)a3
{
  id v10 = a3;
  id v4 = [v10 helpLinkTitle];

  if (v4)
  {
    uint64_t v5 = [v10 helpLinkURL];
    helpLinkURL = self->_helpLinkURL;
    self->_helpLinkURL = v5;

    uint64_t v7 = [MEMORY[0x263F5B8B8] accessoryButton];
    v8 = [v10 helpLinkTitle];
    [v7 setTitle:v8 forState:0];

    [v7 addTarget:self action:sel__openHelpLink forControlEvents:64];
    v9 = [(AAUIOBWelcomeController *)self headerView];
    [v9 addAccessoryButton:v7];
  }
}

- (void)_openHelpLink
{
  id v2 = [NSURL URLWithString:self->_helpLinkURL];
  [(id)*MEMORY[0x263F83300] openURL:v2 options:MEMORY[0x263EFFA78] completionHandler:0];
}

- (void)_delegate_welcomeViewControllerDidCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(AAUIOBWelcomeController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 welcomeViewController:self didCompleteWithSuccess:1 error:0];
  }
}

- (OBTrayButton)primaryButton
{
  return self->_primaryButton;
}

- (void)setPrimaryButton:(id)a3
{
}

- (OBTrayButton)secondaryButton
{
  return self->_secondaryButton;
}

- (void)setSecondaryButton:(id)a3
{
}

- (AAUIOBWelcomeControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUIOBWelcomeControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_secondaryButton, 0);
  objc_storeStrong((id *)&self->_primaryButton, 0);
  objc_storeStrong((id *)&self->_helpLinkURL, 0);
}

@end