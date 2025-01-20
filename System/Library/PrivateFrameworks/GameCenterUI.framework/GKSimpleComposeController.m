@interface GKSimpleComposeController
- (GKComposeHeaderWithStaticRecipients)toField;
- (NSArray)players;
- (NSString)defaultMessage;
- (id)doneHandler;
- (void)donePressed;
- (void)loadView;
- (void)pushOntoNavigationController:(id)a3 withDoneHandler:(id)a4;
- (void)setDefaultMessage:(id)a3;
- (void)setDoneHandler:(id)a3;
- (void)setPlayers:(id)a3;
- (void)setToField:(id)a3;
- (void)setupSendButton;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation GKSimpleComposeController

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)GKSimpleComposeController;
  [(GKBaseComposeController *)&v3 loadView];
  [(GKSimpleComposeController *)self setupSendButton];
}

- (void)setupSendButton
{
  id v7 = [(GKSimpleComposeController *)self navigationItem];
  id v3 = objc_alloc(MEMORY[0x1E4FB14A8]);
  v4 = GKGameCenterUIFrameworkBundle();
  v5 = GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)[v3 initWithTitle:v5 style:2 target:self action:sel_donePressed];

  [v7 setRightBarButtonItem:v6];
}

- (void)setPlayers:(id)a3
{
  v5 = (NSArray *)a3;
  p_players = &self->_players;
  if (self->_players != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_players, a3);
    v5 = v7;
  }

  MEMORY[0x1F41817F8](p_players, v5);
}

- (void)pushOntoNavigationController:(id)a3 withDoneHandler:(id)a4
{
  id v6 = a3;
  [(GKSimpleComposeController *)self setDoneHandler:a4];
  [v6 pushViewController:self animated:1];
}

- (void)donePressed
{
  v5 = [(GKSimpleComposeController *)self doneHandler];
  if (v5)
  {
    id v3 = [(GKBaseComposeController *)self messageField];
    v4 = [v3 text];
    v5[2](v5, v4, 0);

    [(GKSimpleComposeController *)self setDoneHandler:0];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(NSArray *)self->_players _gkMapWithBlock:&__block_literal_global_5];
  [(GKComposeHeaderWithStaticRecipients *)self->_toField setRecipientNameStrings:v5];

  v10.receiver = self;
  v10.super_class = (Class)GKSimpleComposeController;
  [(GKBaseComposeController *)&v10 viewWillAppear:v3];
  id v6 = [MEMORY[0x1E4F63760] localPlayer];
  LODWORD(v5) = [v6 isUnderage];

  id v7 = [(GKBaseComposeController *)self messageField];
  v8 = v7;
  if (v5)
  {
    [v7 setEditable:0];

    [(GKBaseComposeController *)self setMessageFieldText:@" "];
    v9 = [(GKBaseComposeController *)self messageField];
    [v9 setPlaceholderText:0];
  }
  else
  {
    [v7 setEditable:1];

    v9 = [(GKSimpleComposeController *)self defaultMessage];
    [(GKBaseComposeController *)self setMessageFieldText:v9];
  }
}

uint64_t __44__GKSimpleComposeController_viewWillAppear___block_invoke(uint64_t a1, void *a2)
{
  return [a2 displayNameWithOptions:0];
}

- (GKComposeHeaderWithStaticRecipients)toField
{
  return self->_toField;
}

- (void)setToField:(id)a3
{
}

- (NSString)defaultMessage
{
  return self->_defaultMessage;
}

- (void)setDefaultMessage:(id)a3
{
}

- (NSArray)players
{
  return self->_players;
}

- (id)doneHandler
{
  return self->_doneHandler;
}

- (void)setDoneHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_doneHandler, 0);
  objc_storeStrong((id *)&self->_players, 0);
  objc_storeStrong((id *)&self->_defaultMessage, 0);

  objc_storeStrong((id *)&self->_toField, 0);
}

@end