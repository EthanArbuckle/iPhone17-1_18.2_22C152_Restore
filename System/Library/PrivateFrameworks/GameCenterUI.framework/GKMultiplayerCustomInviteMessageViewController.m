@interface GKMultiplayerCustomInviteMessageViewController
- (GKMultiplayerCustomInviteMessageViewControllerDelegate)delegate;
- (NSLayoutConstraint)titleBarHeightConstraint;
- (NSString)message;
- (UIButton)doneButton;
- (UITextView)messageTextField;
- (UIVisualEffectView)backgroundEffectView;
- (void)donePressed:(id)a3;
- (void)setBackgroundEffectView:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setMessage:(id)a3;
- (void)setMessageTextField:(id)a3;
- (void)setTitleBarHeightConstraint:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKMultiplayerCustomInviteMessageViewController

- (void)viewDidLoad
{
  v33.receiver = self;
  v33.super_class = (Class)GKMultiplayerCustomInviteMessageViewController;
  [(GKMultiplayerCustomInviteMessageViewController *)&v33 viewDidLoad];
  v3 = GKGameCenterUIFrameworkBundle();
  v4 = GKGetLocalizedStringFromTableInBundle();
  [(GKMultiplayerCustomInviteMessageViewController *)self setTitle:v4];

  v5 = [(GKMultiplayerCustomInviteMessageViewController *)self doneButton];
  v6 = GKGameCenterUIFrameworkBundle();
  v7 = GKGetLocalizedStringFromTableInBundle();
  [v5 setTitle:v7 forState:0];

  v8 = [(GKMultiplayerCustomInviteMessageViewController *)self delegate];
  v9 = [v8 existingMessageForInviteViewController:self];

  if (v9)
  {
    v10 = [(GKMultiplayerCustomInviteMessageViewController *)self messageTextField];
    [v10 setText:v9];
  }
  else
  {
    id v11 = objc_alloc(MEMORY[0x1E4F28B18]);
    v10 = GKGameCenterUIFrameworkBundle();
    v12 = GKGetLocalizedStringFromTableInBundle();
    v13 = (void *)[v11 initWithString:v12];
    v14 = [(GKMultiplayerCustomInviteMessageViewController *)self messageTextField];
    [v14 setAttributedPlaceholder:v13];
  }
  v15 = [(GKMultiplayerCustomInviteMessageViewController *)self navigationController];
  [v15 setNavigationBarHidden:1];

  v16 = [(GKMultiplayerCustomInviteMessageViewController *)self backgroundEffectView];

  if (!v16)
  {
    id v17 = objc_alloc_init(MEMORY[0x1E4FB1F00]);
    [(GKMultiplayerCustomInviteMessageViewController *)self setBackgroundEffectView:v17];

    v18 = [MEMORY[0x1E4FB1EF8] _gkGameLayerBackgroundVisualEffect];
    v19 = [(GKMultiplayerCustomInviteMessageViewController *)self backgroundEffectView];
    [v19 setBackgroundEffects:v18];

    v20 = [(GKMultiplayerCustomInviteMessageViewController *)self view];
    [v20 bounds];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    v29 = [(GKMultiplayerCustomInviteMessageViewController *)self backgroundEffectView];
    objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

    v30 = [(GKMultiplayerCustomInviteMessageViewController *)self backgroundEffectView];
    [v30 setAutoresizingMask:18];
  }
  v31 = [(GKMultiplayerCustomInviteMessageViewController *)self view];
  v32 = [(GKMultiplayerCustomInviteMessageViewController *)self backgroundEffectView];
  [v31 insertSubview:v32 atIndex:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)GKMultiplayerCustomInviteMessageViewController;
  [(GKMultiplayerCustomInviteMessageViewController *)&v5 viewWillAppear:a3];
  v4 = [(GKMultiplayerCustomInviteMessageViewController *)self messageTextField];
  [v4 becomeFirstResponder];
}

- (void)donePressed:(id)a3
{
  v4 = [(GKMultiplayerCustomInviteMessageViewController *)self messageTextField];
  [v4 resignFirstResponder];

  objc_super v5 = [(GKMultiplayerCustomInviteMessageViewController *)self messageTextField];
  v6 = [v5 text];
  if ([v6 length])
  {
    v7 = [(GKMultiplayerCustomInviteMessageViewController *)self messageTextField];
    id v9 = [v7 text];
  }
  else
  {
    id v9 = 0;
  }

  v8 = [(GKMultiplayerCustomInviteMessageViewController *)self delegate];
  [v8 customInviteViewController:self didFinishWithMessage:v9];
}

- (GKMultiplayerCustomInviteMessageViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GKMultiplayerCustomInviteMessageViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (UIButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (UITextView)messageTextField
{
  return self->_messageTextField;
}

- (void)setMessageTextField:(id)a3
{
}

- (UIVisualEffectView)backgroundEffectView
{
  return self->_backgroundEffectView;
}

- (void)setBackgroundEffectView:(id)a3
{
}

- (NSLayoutConstraint)titleBarHeightConstraint
{
  return self->_titleBarHeightConstraint;
}

- (void)setTitleBarHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleBarHeightConstraint, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_messageTextField, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end