@interface CSMagSafeAccessoryStatusObserver
- (CSMagSafeAccessoryStatusDelegate)delegate;
- (CSMagSafeAccessoryStatusObserver)initWithCoverSheetContext:(id)a3;
- (void)dealloc;
- (void)notifiedWithAccessoryAnimationStatusChanged;
- (void)notifiedWithAccessoryAttached;
- (void)notifiedWithAccessoryDetached;
- (void)setDelegate:(id)a3;
@end

@implementation CSMagSafeAccessoryStatusObserver

- (CSMagSafeAccessoryStatusObserver)initWithCoverSheetContext:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)CSMagSafeAccessoryStatusObserver;
  v5 = [(CSMagSafeAccessoryStatusObserver *)&v26 init];
  if (v5)
  {
    uint64_t v6 = [v4 accessoryStatusProvider];
    statusProvider = v5->_statusProvider;
    v5->_statusProvider = (CSMagSafeAccessoryStatusProviding *)v6;

    objc_initWeak(&location, v5);
    v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v9 = [v4 accessoryAttachedNotificationName];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __62__CSMagSafeAccessoryStatusObserver_initWithCoverSheetContext___block_invoke;
    v23[3] = &unk_1E6AD9E20;
    objc_copyWeak(&v24, &location);
    uint64_t v10 = [v8 addObserverForName:v9 object:0 queue:0 usingBlock:v23];
    attachmentNotificationToken = v5->_attachmentNotificationToken;
    v5->_attachmentNotificationToken = v10;

    v12 = [v4 accessoryDetachedNotificationName];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __62__CSMagSafeAccessoryStatusObserver_initWithCoverSheetContext___block_invoke_2;
    v21[3] = &unk_1E6AD9E20;
    objc_copyWeak(&v22, &location);
    uint64_t v13 = [v8 addObserverForName:v12 object:0 queue:0 usingBlock:v21];
    detachmentNotificationToken = v5->_detachmentNotificationToken;
    v5->_detachmentNotificationToken = v13;

    v15 = [v4 accessoryAnimationStatusChangedNotificationName];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __62__CSMagSafeAccessoryStatusObserver_initWithCoverSheetContext___block_invoke_3;
    v19[3] = &unk_1E6AD9E20;
    objc_copyWeak(&v20, &location);
    uint64_t v16 = [v8 addObserverForName:v15 object:0 queue:0 usingBlock:v19];
    animationStatusNotificationToken = v5->_animationStatusNotificationToken;
    v5->_animationStatusNotificationToken = v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);

    objc_destroyWeak(&location);
  }

  return v5;
}

void __62__CSMagSafeAccessoryStatusObserver_initWithCoverSheetContext___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifiedWithAccessoryAttached];
}

void __62__CSMagSafeAccessoryStatusObserver_initWithCoverSheetContext___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifiedWithAccessoryDetached];
}

void __62__CSMagSafeAccessoryStatusObserver_initWithCoverSheetContext___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained notifiedWithAccessoryAnimationStatusChanged];
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self->_attachmentNotificationToken];

  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self->_detachmentNotificationToken];

  v5.receiver = self;
  v5.super_class = (Class)CSMagSafeAccessoryStatusObserver;
  [(CSMagSafeAccessoryStatusObserver *)&v5 dealloc];
}

- (void)notifiedWithAccessoryAttached
{
  id v4 = [(CSMagSafeAccessoryStatusObserver *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v3 = [(CSMagSafeAccessoryStatusProviding *)self->_statusProvider lastAttachedAccessory];
    [v4 accessoryAttached:v3];
  }
}

- (void)notifiedWithAccessoryDetached
{
  id v4 = [(CSMagSafeAccessoryStatusObserver *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v3 = [(CSMagSafeAccessoryStatusProviding *)self->_statusProvider lastDetachedAccessory];
    [v4 accessoryDetached:v3];
  }
}

- (void)notifiedWithAccessoryAnimationStatusChanged
{
  id v3 = [(CSMagSafeAccessoryStatusObserver *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v3, "accessoryAnimationStatusChanged:", -[CSMagSafeAccessoryStatusProviding isAccessoryAnimationAllowed](self->_statusProvider, "isAccessoryAnimationAllowed"));
  }
}

- (CSMagSafeAccessoryStatusDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSMagSafeAccessoryStatusDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_animationStatusNotificationToken, 0);
  objc_storeStrong((id *)&self->_detachmentNotificationToken, 0);

  objc_storeStrong((id *)&self->_attachmentNotificationToken, 0);
}

@end