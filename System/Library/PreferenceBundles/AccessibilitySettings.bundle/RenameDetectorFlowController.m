@interface RenameDetectorFlowController
- (NameDetectorController)renameDetectorController;
- (OBBoldTrayButton)doneButton;
- (PSSpecifier)editingSpec;
- (RenameDetectorDelegate)renameDetectorDelegate;
- (RenameDetectorFlowController)initWithDetectorSpecifier:(id)a3;
- (void)_cancelRenameFlow;
- (void)_finishRenaming;
- (void)_setUpDoneButton;
- (void)setDoneButton:(id)a3;
- (void)setEditingSpec:(id)a3;
- (void)setRenameDetectorController:(id)a3;
- (void)setRenameDetectorDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation RenameDetectorFlowController

- (RenameDetectorFlowController)initWithDetectorSpecifier:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RenameDetectorFlowController;
  v6 = [(RenameDetectorFlowController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_editingSpec, a3);
  }

  return v7;
}

- (void)viewDidLoad
{
  v17.receiver = self;
  v17.super_class = (Class)RenameDetectorFlowController;
  [(RenameDetectorFlowController *)&v17 viewDidLoad];
  v3 = [NameDetectorController alloc];
  v4 = settingsLocString(@"RENAME_SOUND_TITLE", @"SoundDetection");
  id v5 = settingsLocString(@"NAME_SOUND_SUBTITLE", @"SoundDetection");
  v6 = [(NameDetectorController *)v3 initWithTitle:v4 detailText:v5 icon:0];
  renameDetectorController = self->_renameDetectorController;
  self->_renameDetectorController = v6;

  v8 = [(RenameDetectorFlowController *)self renameDetectorController];
  [v8 setDelegate:self];

  [(RenameDetectorFlowController *)self _setUpDoneButton];
  objc_super v9 = [(RenameDetectorFlowController *)self editingSpec];
  v10 = [v9 name];
  v11 = [(RenameDetectorFlowController *)self renameDetectorController];
  v12 = [v11 detectorNameTextField];
  [v12 setText:v10];

  id v13 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:self action:"_cancelRenameFlow"];
  v14 = [(RenameDetectorFlowController *)self renameDetectorController];
  v15 = [v14 navigationItem];
  [v15 setLeftBarButtonItem:v13];

  v16 = [(RenameDetectorFlowController *)self renameDetectorController];
  [(RenameDetectorFlowController *)self pushViewController:v16 animated:1];
}

- (void)_setUpDoneButton
{
  v3 = +[OBBoldTrayButton boldButton];
  doneButton = self->_doneButton;
  self->_doneButton = v3;

  id v5 = [(RenameDetectorFlowController *)self doneButton];
  v6 = settingsLocString(@"DONE_BUTTON", @"SoundDetection");
  [v5 setTitle:v6 forState:0];

  v7 = [(RenameDetectorFlowController *)self doneButton];
  [v7 addTarget:self action:"_finishRenaming" forControlEvents:64];

  id v10 = [(RenameDetectorFlowController *)self renameDetectorController];
  v8 = [v10 buttonTray];
  objc_super v9 = [(RenameDetectorFlowController *)self doneButton];
  [v8 addButton:v9];
}

- (void)_finishRenaming
{
  v3 = [(RenameDetectorFlowController *)self renameDetectorController];
  v4 = [v3 detectorNameTextField];
  id v7 = [v4 text];

  id v5 = [(RenameDetectorFlowController *)self renameDetectorDelegate];
  v6 = [(RenameDetectorFlowController *)self editingSpec];
  [v5 renameDetector:v6 to:v7];

  [(RenameDetectorFlowController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)_cancelRenameFlow
{
}

- (RenameDetectorDelegate)renameDetectorDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_renameDetectorDelegate);

  return (RenameDetectorDelegate *)WeakRetained;
}

- (void)setRenameDetectorDelegate:(id)a3
{
}

- (NameDetectorController)renameDetectorController
{
  return self->_renameDetectorController;
}

- (void)setRenameDetectorController:(id)a3
{
}

- (OBBoldTrayButton)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (PSSpecifier)editingSpec
{
  return self->_editingSpec;
}

- (void)setEditingSpec:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editingSpec, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_renameDetectorController, 0);

  objc_destroyWeak((id *)&self->_renameDetectorDelegate);
}

@end