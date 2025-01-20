@interface AVTCombinedPickerViewController
- (AVTAvatarActionsProvider)actionsModel;
- (AVTAvatarInlineActionsController)actionsViewHandler;
- (AVTAvatarRecord)avatarRecord;
- (AVTAvatarRecordDataSource)recordDataSource;
- (AVTAvatarStore)avatarStore;
- (AVTCombinedPickerViewController)initWithSelectedRecord:(id)a3;
- (AVTCombinedPickerViewControllerDelegate)delegate;
- (AVTPoseSelectionViewController)poseController;
- (AVTSimpleAvatarPicker)avatarPicker;
- (AVTStickerConfiguration)stickerConfiguration;
- (AVTUIEnvironment)environment;
- (BOOL)avatarPicker:(id)a3 shouldPresentMemojiEditorForAvatarRecord:(id)a4;
- (BOOL)canBecomeFirstResponder;
- (NSObject)avatarStoreChangeObserver;
- (UIBarButtonItem)doneButton;
- (id)defaultAvatar;
- (id)keyCommands;
- (void)actionsController:(id)a3 didAddRecord:(id)a4;
- (void)actionsController:(id)a3 didDeleteRecord:(id)a4 withRecordUpdate:(id)a5 completionBlock:(id)a6;
- (void)actionsController:(id)a3 didDuplicateToRecord:(id)a4 completionBlock:(id)a5;
- (void)actionsController:(id)a3 didEditRecord:(id)a4;
- (void)actionsController:(id)a3 presentAlertController:(id)a4;
- (void)actionsControllerDidFinish:(id)a3;
- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4;
- (void)beginObservingAvatarStoreChanges;
- (void)dealloc;
- (void)didSelectAvatarRecord:(id)a3;
- (void)didTapCancel:(id)a3;
- (void)didTapDone:(id)a3;
- (void)dismissAvatarUIControllerAnimated:(BOOL)a3;
- (void)dismissEditorViewController:(id)a3 forActionsController:(id)a4 wasCreate:(BOOL)a5 didEdit:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8;
- (void)endObservingAvatarStoreChanges;
- (void)poseSelectionController:(id)a3 didSelectPoseWithConfiguration:(id)a4;
- (void)poseSelectionController:(id)a3 didSetMode:(unint64_t)a4 withConfiguration:(id)a5;
- (void)poseSelectionControllerDidCancel:(id)a3;
- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4;
- (void)presentEditorViewController:(id)a3 forActionsController:(id)a4 isCreate:(BOOL)a5;
- (void)presentUpdatedAvatarRecord:(id)a3 animated:(BOOL)a4;
- (void)presentUpdatedAvatarRecord:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentedAvatarRecord:(id)a3;
- (void)refreshPickerForStoreUpdate;
- (void)returnPressed:(id)a3;
- (void)setActionsModel:(id)a3;
- (void)setActionsViewHandler:(id)a3;
- (void)setAvatarPicker:(id)a3;
- (void)setAvatarRecord:(id)a3;
- (void)setAvatarStoreChangeObserver:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDoneButton:(id)a3;
- (void)setPoseController:(id)a3;
- (void)setRecordDataSource:(id)a3;
- (void)setStickerConfiguration:(id)a3;
- (void)updateActionModel;
- (void)viewDidLoad;
- (void)wrapAndPresentViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation AVTCombinedPickerViewController

- (AVTCombinedPickerViewController)initWithSelectedRecord:(id)a3
{
  id v5 = a3;
  v47.receiver = self;
  v47.super_class = (Class)AVTCombinedPickerViewController;
  v6 = [(AVTCombinedPickerViewController *)&v47 initWithNibName:0 bundle:0];
  if (v6)
  {
    uint64_t v7 = +[AVTUIEnvironment defaultEnvironment];
    environment = v6->_environment;
    v6->_environment = (AVTUIEnvironment *)v7;

    v9 = objc_alloc_init(AVTAvatarStore);
    avatarStore = v6->_avatarStore;
    v6->_avatarStore = v9;

    v11 = [AVTAvatarRecordDataSource alloc];
    v12 = v6->_avatarStore;
    v13 = [MEMORY[0x263F29718] requestForAllAvatars];
    uint64_t v14 = [(AVTAvatarRecordDataSource *)v11 initWithRecordStore:v12 fetchRequest:v13 environment:v6->_environment];
    recordDataSource = v6->_recordDataSource;
    v6->_recordDataSource = (AVTAvatarRecordDataSource *)v14;

    v16 = [[AVTAvatarPickerDataSource alloc] initWithRecordDataSource:v6->_recordDataSource environment:v6->_environment allowAddItem:0];
    uint64_t v17 = +[AVTStickerTaskScheduler schedulerWithRecordDataSource:v6->_recordDataSource];
    v18 = [_AVTAvatarRecordImageProvider alloc];
    v19 = [(AVTAvatarPickerDataSource *)v16 environment];
    v20 = [(_AVTAvatarRecordImageProvider *)v18 initWithEnvironment:v19 taskScheduler:0];

    id v21 = v5;
    v22 = [AVTViewSessionProvider alloc];
    v23 = [(AVTAvatarPickerDataSource *)v16 environment];
    +[AVTViewSessionProvider backingSizeForEnvironment:v23];
    double v25 = v24;
    double v27 = v26;
    v28 = +[AVTViewSessionProvider creatorForAVTView];
    v29 = [(AVTAvatarPickerDataSource *)v16 environment];
    v30 = -[AVTViewSessionProvider initWithAVTViewBackingSize:viewCreator:environment:](v22, "initWithAVTViewBackingSize:viewCreator:environment:", v28, v29, v25, v27);

    id v5 = v21;
    v31 = (void *)v17;
    v32 = [[AVTSimpleAvatarPicker alloc] initWithDataSource:v16 recordImageProvider:v20 avtViewSessionProvider:v30 taskScheduler:v17 allowEditing:1 interItemSpacing:2.0];
    avatarPicker = v6->_avatarPicker;
    v6->_avatarPicker = v32;

    [(AVTSimpleAvatarPicker *)v6->_avatarPicker setDoesDisplayEditIconWhenAvailable:0];
    v34 = [MEMORY[0x263F1C5C0] currentDevice];
    if ([v34 userInterfaceIdiom] == 1) {
      double v35 = 15.0;
    }
    else {
      double v35 = 45.0;
    }

    -[AVTSimpleAvatarPicker setContentInset:](v6->_avatarPicker, "setContentInset:", 15.0, 10.0, v35, 10.0);
    objc_storeStrong((id *)&v6->_avatarRecord, a3);
    v36 = [[AVTPoseSelectionViewController alloc] initWithSelectedRecord:v5];
    poseController = v6->_poseController;
    v6->_poseController = v36;

    [(AVTPoseSelectionViewController *)v6->_poseController setShouldNotifyDelegateOnSelection:1];
    [(AVTPoseSelectionViewController *)v6->_poseController setUsesSingleButtonCaptureReview:1];
    [(AVTPoseSelectionViewController *)v6->_poseController setDelegate:v6];
    v38 = [[AVTAvatarActionsProvider alloc] initWithAvatarRecord:v6->_avatarRecord dataSource:v6->_recordDataSource allowCreate:1];
    actionsModel = v6->_actionsModel;
    v6->_actionsModel = v38;

    v40 = [AVTAvatarInlineActionsController alloc];
    v41 = [(AVTAvatarPickerDataSource *)v16 recordDataSource];
    v42 = [(AVTAvatarPickerDataSource *)v16 environment];
    uint64_t v43 = [(AVTAvatarInlineActionsController *)v40 initWithDataSource:v41 avtViewProvider:v30 environment:v42];
    actionsViewHandler = v6->_actionsViewHandler;
    v6->_actionsViewHandler = (AVTAvatarInlineActionsController *)v43;

    [(AVTAvatarInlineActionsController *)v6->_actionsViewHandler setDelegate:v6];
    stickerConfiguration = v6->_stickerConfiguration;
    v6->_stickerConfiguration = 0;
  }
  return v6;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_avatarStoreChangeObserver];

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVTCombinedPickerViewController;
  [(AVTCombinedPickerViewController *)&v5 dealloc];
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidLoad
{
  v76[8] = *MEMORY[0x263EF8340];
  v75.receiver = self;
  v75.super_class = (Class)AVTCombinedPickerViewController;
  [(AVTCombinedPickerViewController *)&v75 viewDidLoad];
  v3 = [(AVTCombinedPickerViewController *)self navigationItem];
  [v3 _setBackgroundHidden:1];

  v4 = [(AVTCombinedPickerViewController *)self navigationController];
  objc_super v5 = [v4 navigationBar];
  char v6 = [v5 isTranslucent];

  if ((v6 & 1) == 0) {
    [(AVTCombinedPickerViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
  }
  uint64_t v7 = [(AVTCombinedPickerViewController *)self navigationItem];
  [v7 setLargeTitleDisplayMode:2];

  v8 = [(AVTPoseSelectionViewController *)self->_poseController view];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(AVTCombinedPickerViewController *)self addChildViewController:self->_poseController];
  v9 = [(AVTCombinedPickerViewController *)self view];
  v10 = [(AVTPoseSelectionViewController *)self->_poseController view];
  [v9 addSubview:v10];

  [(AVTPoseSelectionViewController *)self->_poseController didMoveToParentViewController:self];
  v11 = [(AVTSimpleAvatarPicker *)self->_avatarPicker view];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  [(AVTSimpleAvatarPicker *)self->_avatarPicker setAvatarPickerDelegate:self];
  [(AVTSimpleAvatarPicker *)self->_avatarPicker setPresenterDelegate:self];
  v12 = [MEMORY[0x263F1C550] systemBackgroundColor];
  v13 = [(AVTSimpleAvatarPicker *)self->_avatarPicker view];
  [v13 setBackgroundColor:v12];

  uint64_t v14 = [(AVTCombinedPickerViewController *)self view];
  v15 = [(AVTSimpleAvatarPicker *)self->_avatarPicker view];
  [v14 addSubview:v15];

  v16 = [MEMORY[0x263F157E8] layer];
  uint64_t v17 = [(AVTCombinedPickerViewController *)self view];
  [v17 frame];
  objc_msgSend(v16, "setFrame:", 0.0, 0.0);

  [v16 setBorderWidth:1.0];
  id v18 = [MEMORY[0x263F1C550] colorWithWhite:0.0 alpha:0.1];
  v19 = v16;
  v74 = v16;
  objc_msgSend(v16, "setBorderColor:", objc_msgSend(v18, "CGColor"));

  v20 = [(AVTSimpleAvatarPicker *)self->_avatarPicker view];
  id v21 = [v20 layer];
  [v21 addSublayer:v19];

  v22 = [MEMORY[0x263F1C5C0] currentDevice];
  if ([v22 userInterfaceIdiom] == 1) {
    double v23 = 80.0;
  }
  else {
    double v23 = 110.0;
  }

  v73 = [(AVTSimpleAvatarPicker *)self->_avatarPicker view];
  v71 = [v73 leadingAnchor];
  v72 = [(AVTCombinedPickerViewController *)self view];
  v70 = [v72 leadingAnchor];
  v69 = [v71 constraintEqualToAnchor:v70];
  v76[0] = v69;
  v68 = [(AVTSimpleAvatarPicker *)self->_avatarPicker view];
  v66 = [v68 trailingAnchor];
  v67 = [(AVTCombinedPickerViewController *)self view];
  v65 = [v67 trailingAnchor];
  v64 = [v66 constraintEqualToAnchor:v65];
  v76[1] = v64;
  v63 = [(AVTSimpleAvatarPicker *)self->_avatarPicker view];
  v61 = [v63 bottomAnchor];
  v62 = [(AVTCombinedPickerViewController *)self view];
  v60 = [v62 bottomAnchor];
  v59 = [v61 constraintEqualToAnchor:v60];
  v76[2] = v59;
  v58 = [(AVTSimpleAvatarPicker *)self->_avatarPicker view];
  v57 = [v58 heightAnchor];
  v56 = [v57 constraintEqualToConstant:v23];
  v76[3] = v56;
  v55 = [(AVTSimpleAvatarPicker *)self->_avatarPicker view];
  v53 = [v55 topAnchor];
  v54 = [(AVTPoseSelectionViewController *)self->_poseController view];
  v52 = [v54 bottomAnchor];
  v51 = [v53 constraintEqualToAnchor:v52];
  v76[4] = v51;
  v49 = [(AVTPoseSelectionViewController *)self->_poseController view];
  objc_super v47 = [v49 leadingAnchor];
  v48 = [(AVTCombinedPickerViewController *)self view];
  v46 = [v48 leadingAnchor];
  v45 = [v47 constraintEqualToAnchor:v46];
  v76[5] = v45;
  v44 = [(AVTPoseSelectionViewController *)self->_poseController view];
  double v24 = [v44 trailingAnchor];
  double v25 = [(AVTCombinedPickerViewController *)self view];
  double v26 = [v25 trailingAnchor];
  double v27 = [v24 constraintEqualToAnchor:v26];
  v76[6] = v27;
  v28 = [(AVTPoseSelectionViewController *)self->_poseController view];
  v29 = [v28 topAnchor];
  v30 = [(AVTCombinedPickerViewController *)self view];
  v31 = [v30 topAnchor];
  v32 = [v29 constraintEqualToAnchor:v31];
  v76[7] = v32;
  v50 = [MEMORY[0x263EFF8C0] arrayWithObjects:v76 count:8];

  [MEMORY[0x263F08938] activateConstraints:v50];
  v33 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:1 target:self action:sel_didTapCancel_];
  v34 = [(AVTCombinedPickerViewController *)self navigationItem];
  [v34 setLeftBarButtonItem:v33];

  id v35 = objc_alloc(MEMORY[0x263F1C468]);
  v36 = AVTAvatarUIBundle();
  v37 = [v36 localizedStringForKey:@"NEXT" value:&stru_26BF058D0 table:@"Localized"];
  v38 = (UIBarButtonItem *)[v35 initWithTitle:v37 style:2 target:self action:sel_didTapDone_];
  doneButton = self->_doneButton;
  self->_doneButton = v38;

  v40 = self->_doneButton;
  v41 = [(AVTCombinedPickerViewController *)self navigationItem];
  [v41 setRightBarButtonItem:v40];

  [(UIBarButtonItem *)self->_doneButton setEnabled:0];
  [(AVTSimpleAvatarPicker *)self->_avatarPicker reloadDataSource];
  avatarPicker = self->_avatarPicker;
  uint64_t v43 = [(AVTAvatarRecord *)self->_avatarRecord identifier];
  [(AVTSimpleAvatarPicker *)avatarPicker selectAvatarRecordWithIdentifier:v43 animated:0];

  [(AVTCombinedPickerViewController *)self updateActionModel];
  [(AVTCombinedPickerViewController *)self beginObservingAvatarStoreChanges];
}

- (id)defaultAvatar
{
  avatarStore = self->_avatarStore;
  v3 = [MEMORY[0x263F29718] requestForStorePrimaryAvatar];
  v4 = [(AVTAvatarStore *)avatarStore avatarsForFetchRequest:v3 error:0];
  objc_super v5 = [v4 firstObject];

  return v5;
}

- (void)beginObservingAvatarStoreChanges
{
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F29710];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __67__AVTCombinedPickerViewController_beginObservingAvatarStoreChanges__block_invoke;
  v7[3] = &unk_263FF0C50;
  objc_copyWeak(&v8, &location);
  objc_super v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v7];
  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __67__AVTCombinedPickerViewController_beginObservingAvatarStoreChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained refreshPickerForStoreUpdate];
}

- (void)refreshPickerForStoreUpdate
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __62__AVTCombinedPickerViewController_refreshPickerForStoreUpdate__block_invoke;
  v2[3] = &unk_263FF09D8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __62__AVTCombinedPickerViewController_refreshPickerForStoreUpdate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained avatarPicker];

  if (v1)
  {
    v2 = [WeakRetained avatarPicker];
    [v2 reloadDataSource];

    id v3 = [WeakRetained avatarPicker];
    uint64_t v4 = [v3 selectedAvatar];
    objc_super v5 = [WeakRetained avatarRecord];

    if (v4 != v5)
    {
      char v6 = [WeakRetained avatarPicker];
      uint64_t v7 = [WeakRetained avatarRecord];
      id v8 = [v7 identifier];
      [v6 selectAvatarRecordWithIdentifier:v8 animated:1];
    }
  }
}

- (void)endObservingAvatarStoreChanges
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_avatarStoreChangeObserver];

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;
}

- (id)keyCommands
{
  v2 = [MEMORY[0x263EFF980] array];
  id v3 = [MEMORY[0x263F1C708] keyCommandWithInput:*MEMORY[0x263F1D3D0] modifierFlags:0 action:sel_didTapCancel_];
  uint64_t v4 = [v3 _nonRepeatableKeyCommand];
  [v2 addObject:v4];

  objc_super v5 = (void *)MEMORY[0x263F1C708];
  char v6 = [NSString stringWithFormat:@"\r"];
  uint64_t v7 = [v5 keyCommandWithInput:v6 modifierFlags:0 action:sel_returnPressed_];

  id v8 = [v7 _nonRepeatableKeyCommand];
  [v2 addObject:v8];

  return v2;
}

- (void)returnPressed:(id)a3
{
  id v4 = a3;
  if ([(UIBarButtonItem *)self->_doneButton isEnabled]) {
    [(AVTCombinedPickerViewController *)self didTapDone:v4];
  }
}

- (void)didTapDone:(id)a3
{
  id v4 = [(AVTCombinedPickerViewController *)self delegate];
  [v4 combinedPickerViewController:self didSelectRecord:self->_avatarRecord withStickerConfiguration:self->_stickerConfiguration];
}

- (void)didTapCancel:(id)a3
{
  id v4 = [(AVTCombinedPickerViewController *)self delegate];
  [v4 combinedPickerViewControllerDidCancel:self];
}

- (void)didSelectAvatarRecord:(id)a3
{
  objc_super v5 = (AVTAvatarRecord *)a3;
  if (v5 && self->_avatarRecord != v5)
  {
    char v6 = v5;
    objc_storeStrong((id *)&self->_avatarRecord, a3);
    [(AVTPoseSelectionViewController *)self->_poseController setNewAvatarRecord:v6];
    [(AVTCombinedPickerViewController *)self updateActionModel];
  }
  MEMORY[0x270F9A790]();
}

- (void)updateActionModel
{
  id v3 = [[AVTAvatarActionsProvider alloc] initWithAvatarRecord:self->_avatarRecord dataSource:self->_recordDataSource allowCreate:0];
  actionsModel = self->_actionsModel;
  self->_actionsModel = v3;

  [(AVTAvatarInlineActionsController *)self->_actionsViewHandler updateWithActionsModel:self->_actionsModel];
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  if ([(AVTAvatarActionsProvider *)self->_actionsModel canPerformActionType:0])
  {
    objc_super v5 = [(AVTAvatarActionsProvider *)self->_actionsModel editAction];
    char v6 = [MEMORY[0x263F1C6B0] systemImageNamed:@"pencil"];
    [v5 setImage:v6];

    [v12 addObject:v5];
  }
  if ([(AVTAvatarActionsProvider *)self->_actionsModel canPerformActionType:1])
  {
    uint64_t v7 = [(AVTAvatarActionsProvider *)self->_actionsModel duplicateAction];
    id v8 = [MEMORY[0x263F1C6B0] systemImageNamed:@"doc.on.doc"];
    [v7 setImage:v8];

    [v12 addObject:v7];
  }
  if ([(AVTAvatarActionsProvider *)self->_actionsModel canPerformActionType:2])
  {
    v9 = [(AVTAvatarActionsProvider *)self->_actionsModel deleteAction];
    v10 = [MEMORY[0x263F1C6B0] systemImageNamed:@"trash"];
    [v9 setImage:v10];

    [v12 addObject:v9];
  }
  if ([v12 count])
  {
    v11 = [MEMORY[0x263F1C7A8] menuWithChildren:v12];
    [(AVTPoseSelectionViewController *)self->_poseController setHeaderMenu:v11];
  }
  else
  {
    [(AVTPoseSelectionViewController *)self->_poseController setHeaderMenu:0];
  }
}

- (void)presentUpdatedAvatarRecord:(id)a3 animated:(BOOL)a4
{
}

- (void)presentUpdatedAvatarRecord:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v8)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __82__AVTCombinedPickerViewController_presentUpdatedAvatarRecord_animated_completion___block_invoke;
    v10[3] = &unk_263FF2700;
    v10[4] = self;
    id v11 = v8;
    BOOL v13 = a4;
    id v12 = v9;
    dispatch_async(MEMORY[0x263EF83A0], v10);
  }
}

uint64_t __82__AVTCombinedPickerViewController_presentUpdatedAvatarRecord_animated_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) avatarPicker];
  id v3 = [v2 selectedAvatar];
  id v4 = *(void **)(a1 + 40);

  if (v3 != v4)
  {
    objc_super v5 = [*(id *)(a1 + 32) avatarPicker];
    char v6 = [*(id *)(a1 + 40) identifier];
    [v5 selectAvatarRecordWithIdentifier:v6 animated:*(unsigned __int8 *)(a1 + 56)];
  }
  [*(id *)(a1 + 32) didSelectAvatarRecord:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v8 = *(uint64_t (**)(void))(result + 16);
    return v8();
  }
  return result;
}

- (void)wrapAndPresentViewController:(id)a3 animated:(BOOL)a4
{
  +[AVTUIControllerPresentation presentationWithWrappingForController:](AVTUIControllerPresentation, "presentationWithWrappingForController:", a3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(AVTCombinedPickerViewController *)self presentAvatarUIController:v5 animated:1];
}

- (void)poseSelectionController:(id)a3 didSelectPoseWithConfiguration:(id)a4
{
  objc_storeStrong((id *)&self->_stickerConfiguration, a4);
  id v6 = a4;
  [(UIBarButtonItem *)self->_doneButton setEnabled:1];
}

- (void)poseSelectionControllerDidCancel:(id)a3
{
  id v4 = [(AVTCombinedPickerViewController *)self delegate];
  [v4 combinedPickerViewControllerDidCancel:self];
}

- (void)poseSelectionController:(id)a3 didSetMode:(unint64_t)a4 withConfiguration:(id)a5
{
  id v10 = a5;
  objc_storeStrong((id *)&self->_stickerConfiguration, a5);
  if (self->_stickerConfiguration) {
    BOOL v8 = a4 == 1;
  }
  else {
    BOOL v8 = 1;
  }
  uint64_t v9 = !v8;
  [(UIBarButtonItem *)self->_doneButton setEnabled:v9];
}

- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4
{
}

- (BOOL)avatarPicker:(id)a3 shouldPresentMemojiEditorForAvatarRecord:(id)a4
{
  return 1;
}

- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v10 = [a3 controller];
  id v6 = [v10 view];
  uint64_t v7 = [v6 traitCollection];
  uint64_t v8 = [v7 horizontalSizeClass];

  if (v8 == 2)
  {
    objc_msgSend(v10, "setPreferredContentSize:", 624.0, 746.0);
    [v10 setModalInPresentation:1];
    uint64_t v9 = 2;
  }
  else
  {
    uint64_t v9 = 0;
  }
  [v10 setModalPresentationStyle:v9];
  [(AVTCombinedPickerViewController *)self presentViewController:v10 animated:v4 completion:0];
}

- (void)dismissAvatarUIControllerAnimated:(BOOL)a3
{
}

- (void)presentedAvatarRecord:(id)a3
{
}

- (void)actionsController:(id)a3 didAddRecord:(id)a4
{
}

- (void)actionsController:(id)a3 didDeleteRecord:(id)a4 withRecordUpdate:(id)a5 completionBlock:(id)a6
{
  if (a5)
  {
    uint64_t v7 = objc_msgSend(a5, "avatarRecord", a3, a4);
    if (v7
      || ([(AVTCombinedPickerViewController *)self defaultAvatar],
          (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v8 = (id)v7;
      [(AVTCombinedPickerViewController *)self presentUpdatedAvatarRecord:v7 animated:1];
    }
  }
}

- (void)actionsController:(id)a3 didDuplicateToRecord:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  objc_initWeak(&location, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __90__AVTCombinedPickerViewController_actionsController_didDuplicateToRecord_completionBlock___block_invoke;
  v11[3] = &unk_263FF09D8;
  objc_copyWeak(&v12, &location);
  [(AVTCombinedPickerViewController *)self presentUpdatedAvatarRecord:v9 animated:1 completion:v11];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __90__AVTCombinedPickerViewController_actionsController_didDuplicateToRecord_completionBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained actionsModel];
  [v1 didTapEdit];
}

- (void)actionsController:(id)a3 didEditRecord:(id)a4
{
}

- (void)actionsController:(id)a3 presentAlertController:(id)a4
{
}

- (void)presentEditorViewController:(id)a3 forActionsController:(id)a4 isCreate:(BOOL)a5
{
}

- (void)dismissEditorViewController:(id)a3 forActionsController:(id)a4 wasCreate:(BOOL)a5 didEdit:(BOOL)a6 animated:(BOOL)a7 completion:(id)a8
{
}

- (void)actionsControllerDidFinish:(id)a3
{
}

- (AVTCombinedPickerViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTCombinedPickerViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTAvatarRecordDataSource)recordDataSource
{
  return self->_recordDataSource;
}

- (void)setRecordDataSource:(id)a3
{
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (NSObject)avatarStoreChangeObserver
{
  return self->_avatarStoreChangeObserver;
}

- (void)setAvatarStoreChangeObserver:(id)a3
{
}

- (AVTSimpleAvatarPicker)avatarPicker
{
  return self->_avatarPicker;
}

- (void)setAvatarPicker:(id)a3
{
}

- (AVTPoseSelectionViewController)poseController
{
  return self->_poseController;
}

- (void)setPoseController:(id)a3
{
}

- (AVTAvatarActionsProvider)actionsModel
{
  return self->_actionsModel;
}

- (void)setActionsModel:(id)a3
{
}

- (AVTAvatarInlineActionsController)actionsViewHandler
{
  return self->_actionsViewHandler;
}

- (void)setActionsViewHandler:(id)a3
{
}

- (AVTAvatarRecord)avatarRecord
{
  return self->_avatarRecord;
}

- (void)setAvatarRecord:(id)a3
{
}

- (AVTStickerConfiguration)stickerConfiguration
{
  return self->_stickerConfiguration;
}

- (void)setStickerConfiguration:(id)a3
{
}

- (UIBarButtonItem)doneButton
{
  return self->_doneButton;
}

- (void)setDoneButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_stickerConfiguration, 0);
  objc_storeStrong((id *)&self->_avatarRecord, 0);
  objc_storeStrong((id *)&self->_actionsViewHandler, 0);
  objc_storeStrong((id *)&self->_actionsModel, 0);
  objc_storeStrong((id *)&self->_poseController, 0);
  objc_storeStrong((id *)&self->_avatarPicker, 0);
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_storeStrong((id *)&self->_recordDataSource, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end