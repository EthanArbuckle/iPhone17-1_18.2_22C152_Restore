@interface AVTSimpleAvatarPickerSwiftProvider
- (AVTAvatarPickerDelegate)avatarPickerDelegate;
- (AVTAvatarStore)avatarStore;
- (AVTPresenterDelegate)presenterDelegate;
- (AVTSimpleAvatarPicker)avatarPicker;
- (AVTSimpleAvatarPickerSwiftProvider)initWithDelegate:(id)a3 allowAddItem:(BOOL)a4 allowEditing:(BOOL)a5 interItemSpacing:(double)a6;
- (AVTSimpleAvatarPickerSwiftProvider)initWithDelegate:(id)a3 allowAddItem:(BOOL)a4 allowEditing:(BOOL)a5 interItemSpacing:(double)a6 shouldReverseNaturalLayout:(BOOL)a7;
- (AVTSimpleAvatarPickerSwiftProviderDelegate)delegate;
- (AVTUIEnvironment)environment;
- (AVTUILogger)logger;
- (NSObject)avatarStoreChangeObserver;
- (NSString)presentedIdentifier;
- (UIEdgeInsets)contentInset;
- (UIView)view;
- (id)avatarPickerView;
- (void)_notifyStoreChanged;
- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4;
- (void)beginObservingAvatarStoreChanges;
- (void)dealloc;
- (void)dismissAvatarUIControllerAnimated:(BOOL)a3;
- (void)endObservingAvatarStoreChanges;
- (void)presentActionsForSelectedAvatar;
- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4;
- (void)presentedAvatarRecord:(id)a3;
- (void)setAvatarPickerDelegate:(id)a3;
- (void)setAvatarStoreChangeObserver:(id)a3;
- (void)setContentInset:(UIEdgeInsets)a3;
- (void)setDelegate:(id)a3;
- (void)setPresentedIdentifier:(id)a3;
- (void)setPresenterDelegate:(id)a3;
- (void)updatePickerSelectionWithAnimation:(BOOL)a3;
- (void)updatePresentedRecordWithIdentifier:(id)a3 animated:(BOOL)a4;
- (void)updatePresentedRecordWithRecord:(id)a3 animated:(BOOL)a4;
@end

@implementation AVTSimpleAvatarPickerSwiftProvider

- (AVTSimpleAvatarPickerSwiftProvider)initWithDelegate:(id)a3 allowAddItem:(BOOL)a4 allowEditing:(BOOL)a5 interItemSpacing:(double)a6
{
  return [(AVTSimpleAvatarPickerSwiftProvider *)self initWithDelegate:a3 allowAddItem:a4 allowEditing:a5 interItemSpacing:0 shouldReverseNaturalLayout:a6];
}

- (AVTSimpleAvatarPickerSwiftProvider)initWithDelegate:(id)a3 allowAddItem:(BOOL)a4 allowEditing:(BOOL)a5 interItemSpacing:(double)a6 shouldReverseNaturalLayout:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  BOOL v10 = a4;
  id v12 = a3;
  v24.receiver = self;
  v24.super_class = (Class)AVTSimpleAvatarPickerSwiftProvider;
  v13 = [(AVTSimpleAvatarPickerSwiftProvider *)&v24 init];
  if (v13)
  {
    uint64_t v14 = +[AVTUIEnvironment defaultEnvironment];
    environment = v13->_environment;
    v13->_environment = (AVTUIEnvironment *)v14;

    uint64_t v16 = [(AVTUIEnvironment *)v13->_environment logger];
    logger = v13->_logger;
    v13->_logger = (AVTUILogger *)v16;

    objc_storeWeak((id *)&v13->_delegate, v12);
    v18 = objc_alloc_init(AVTAvatarStore);
    avatarStore = v13->_avatarStore;
    v13->_avatarStore = v18;

    v20 = [[AVTSimpleAvatarPicker alloc] initWithStore:v13->_avatarStore environment:v13->_environment allowAddItem:v10 interItemSpacing:v7 shouldReverseNaturalLayout:a6];
    avatarPicker = v13->_avatarPicker;
    v13->_avatarPicker = v20;

    [(AVTSimpleAvatarPicker *)v13->_avatarPicker setAvatarPickerDelegate:v13];
    [(AVTSimpleAvatarPicker *)v13->_avatarPicker setAllowEditing:v9];
    [(AVTSimpleAvatarPicker *)v13->_avatarPicker reloadDataSource];
    [(AVTSimpleAvatarPicker *)v13->_avatarPicker setPresenterDelegate:v13];
    presentedIdentifier = v13->_presentedIdentifier;
    v13->_presentedIdentifier = 0;

    [(AVTSimpleAvatarPickerSwiftProvider *)v13 beginObservingAvatarStoreChanges];
  }

  return v13;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_avatarStoreChangeObserver];

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;

  v5.receiver = self;
  v5.super_class = (Class)AVTSimpleAvatarPickerSwiftProvider;
  [(AVTSimpleAvatarPickerSwiftProvider *)&v5 dealloc];
}

- (id)avatarPickerView
{
  return [(AVTSimpleAvatarPicker *)self->_avatarPicker view];
}

- (UIEdgeInsets)contentInset
{
  [(AVTSimpleAvatarPicker *)self->_avatarPicker contentInset];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)setContentInset:(UIEdgeInsets)a3
{
}

- (void)presentActionsForSelectedAvatar
{
}

- (void)beginObservingAvatarStoreChanges
{
  objc_initWeak(&location, self);
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v4 = *MEMORY[0x263F29710];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __70__AVTSimpleAvatarPickerSwiftProvider_beginObservingAvatarStoreChanges__block_invoke;
  v7[3] = &unk_263FF0C50;
  objc_copyWeak(&v8, &location);
  double v5 = [v3 addObserverForName:v4 object:0 queue:0 usingBlock:v7];
  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = v5;

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __70__AVTSimpleAvatarPickerSwiftProvider_beginObservingAvatarStoreChanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _notifyStoreChanged];
}

- (void)endObservingAvatarStoreChanges
{
  double v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self->_avatarStoreChangeObserver];

  avatarStoreChangeObserver = self->_avatarStoreChangeObserver;
  self->_avatarStoreChangeObserver = 0;
}

- (void)_notifyStoreChanged
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __57__AVTSimpleAvatarPickerSwiftProvider__notifyStoreChanged__block_invoke;
  v2[3] = &unk_263FF09D8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __57__AVTSimpleAvatarPickerSwiftProvider__notifyStoreChanged__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained avatarPicker];

  if (v1)
  {
    double v2 = [WeakRetained avatarPicker];
    [v2 reloadDataSource];

    [WeakRetained updatePickerSelectionWithAnimation:1];
  }
}

- (void)updatePickerSelectionWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = [(AVTSimpleAvatarPickerSwiftProvider *)self avatarPicker];
  double v5 = [(AVTSimpleAvatarPickerSwiftProvider *)self presentedIdentifier];
  [v6 selectAvatarRecordWithIdentifier:v5 animated:v3];
}

- (void)updatePresentedRecordWithRecord:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (a3)
  {
    id v6 = [a3 identifier];
    id v7 = (id)[v6 copy];
  }
  else
  {
    id v7 = 0;
  }
  [(AVTSimpleAvatarPickerSwiftProvider *)self updatePresentedRecordWithIdentifier:v7 animated:v4];
}

- (void)updatePresentedRecordWithIdentifier:(id)a3 animated:(BOOL)a4
{
  if (self->_presentedIdentifier != a3)
  {
    BOOL v4 = a4;
    -[AVTSimpleAvatarPickerSwiftProvider setPresentedIdentifier:](self, "setPresentedIdentifier:");
    [(AVTSimpleAvatarPickerSwiftProvider *)self updatePickerSelectionWithAnimation:v4];
  }
}

- (void)avatarPicker:(id)a3 didSelectAvatarRecord:(id)a4
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    [(AVTSimpleAvatarPickerSwiftProvider *)self updatePresentedRecordWithRecord:v7 animated:1];
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 avatarPicker:self didSelectAvatarRecord:v7];
  }
}

- (void)dismissAvatarUIControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    [(AVTSimpleAvatarPickerSwiftProvider *)self updatePickerSelectionWithAnimation:0];
    id v7 = objc_loadWeakRetained((id *)p_delegate);
    [v7 dismissAvatarUIControllerWithIdentifier:self->_presentedIdentifier animated:v3];
  }
}

- (void)presentedAvatarRecord:(id)a3
{
}

- (void)presentAvatarUIController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v9 = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    id v8 = objc_loadWeakRetained((id *)p_delegate);
    [v8 presentAvatarUIController:v9 animated:v4];
  }
}

- (AVTAvatarPickerDelegate)avatarPickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->avatarPickerDelegate);
  return (AVTAvatarPickerDelegate *)WeakRetained;
}

- (void)setAvatarPickerDelegate:(id)a3
{
}

- (AVTPresenterDelegate)presenterDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->presenterDelegate);
  return (AVTPresenterDelegate *)WeakRetained;
}

- (void)setPresenterDelegate:(id)a3
{
}

- (UIView)view
{
  return self->view;
}

- (AVTSimpleAvatarPickerSwiftProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTSimpleAvatarPickerSwiftProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTAvatarStore)avatarStore
{
  return self->_avatarStore;
}

- (AVTUIEnvironment)environment
{
  return self->_environment;
}

- (AVTUILogger)logger
{
  return self->_logger;
}

- (AVTSimpleAvatarPicker)avatarPicker
{
  return self->_avatarPicker;
}

- (NSObject)avatarStoreChangeObserver
{
  return self->_avatarStoreChangeObserver;
}

- (void)setAvatarStoreChangeObserver:(id)a3
{
}

- (NSString)presentedIdentifier
{
  return self->_presentedIdentifier;
}

- (void)setPresentedIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentedIdentifier, 0);
  objc_storeStrong((id *)&self->_avatarStoreChangeObserver, 0);
  objc_storeStrong((id *)&self->_avatarPicker, 0);
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_environment, 0);
  objc_storeStrong((id *)&self->_avatarStore, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->view, 0);
  objc_destroyWeak((id *)&self->presenterDelegate);
  objc_destroyWeak((id *)&self->avatarPickerDelegate);
}

@end