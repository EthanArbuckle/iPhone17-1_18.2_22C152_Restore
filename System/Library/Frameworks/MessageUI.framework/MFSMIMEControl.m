@interface MFSMIMEControl
- (BOOL)canPresentMenu;
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (MFSMIMEControlDelegate)delegate;
- (id)_goToSettingsAction;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)menuWithOptions:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation MFSMIMEControl

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v4 = (void *)MEMORY[0x1E4FB1678];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __72__MFSMIMEControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v7[3] = &unk_1E5F7CFF8;
  objc_copyWeak(&v8, &location);
  v5 = [v4 configurationWithIdentifier:0 previewProvider:0 actionProvider:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

id __72__MFSMIMEControl_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained delegate];
  uint64_t v3 = [v2 smimeStatusOptionsForControl:WeakRetained];

  v4 = [WeakRetained menuWithOptions:v3];

  return v4;
}

- (id)menuWithOptions:(unint64_t)a3
{
  if (a3 == 1)
  {
    uint64_t v3 = 0;
    goto LABEL_25;
  }
  char v4 = a3;
  v6 = [MEMORY[0x1E4F1CA48] array];
  v7 = [(MFSMIMEControl *)self delegate];
  id v8 = (void *)MEMORY[0x1E4FB13F0];
  if ((v4 & 2) != 0)
  {
    v15 = _EFLocalizedString();
    v16 = [MEMORY[0x1E4FB1818] systemImageNamed:@"lock.slash.fill"];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __34__MFSMIMEControl_menuWithOptions___block_invoke;
    v28[3] = &unk_1E5F7A3E0;
    id v17 = v7;
    v29[0] = v17;
    v29[1] = self;
    v12 = [v8 actionWithTitle:v15 image:v16 identifier:0 handler:v28];

    [v6 addObject:v12];
    v13 = (id *)v29;
    if ((v4 & 4) != 0)
    {
      if ((v4 & 0x10) == 0 || (v4 & 0x20) != 0)
      {
        uint64_t v24 = _EFLocalizedString();
      }
      else
      {
        uint64_t v24 = EFLocalizedStringWithValue();
      }
      v18 = (void *)v24;
      v19 = [(MFSMIMEControl *)self _goToSettingsAction];
      [v6 addObject:v19];
      goto LABEL_23;
    }
    if ((v4 & 0x10) == 0)
    {
      uint64_t v14 = _EFLocalizedString();
      goto LABEL_9;
    }
    if ((v4 & 0x20) != 0)
    {
      v18 = _EFLocalizedString();
      v19 = [(MFSMIMEControl *)self _goToSettingsAction];
      [v6 addObject:v19];
      goto LABEL_23;
    }
    v19 = [v17 sendingAddressForControl:self];
    v23 = NSString;
    v21 = _EFLocalizedString();
    uint64_t v22 = objc_msgSend(v23, "stringWithFormat:", v21, v19);
    goto LABEL_16;
  }
  v9 = _EFLocalizedString();
  v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"lock.fill"];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __34__MFSMIMEControl_menuWithOptions___block_invoke_2;
  v26[3] = &unk_1E5F7A3E0;
  id v11 = v7;
  v27[0] = v11;
  v27[1] = self;
  v12 = [v8 actionWithTitle:v9 image:v10 identifier:0 handler:v26];

  [v6 addObject:v12];
  v13 = (id *)v27;
  if ((v4 & 0x10) != 0)
  {
    if ((v4 & 0x20) != 0)
    {
      v18 = _EFLocalizedString();
      v19 = [(MFSMIMEControl *)self _goToSettingsAction];
      [v6 addObject:v19];
      goto LABEL_23;
    }
    v19 = [v11 sendingAddressForControl:self];
    v20 = NSString;
    v21 = _EFLocalizedString();
    uint64_t v22 = objc_msgSend(v20, "stringWithFormat:", v21, v19);
LABEL_16:
    v18 = (void *)v22;

LABEL_23:
    goto LABEL_24;
  }
  uint64_t v14 = _EFLocalizedString();
LABEL_9:
  v18 = (void *)v14;
LABEL_24:

  uint64_t v3 = [MEMORY[0x1E4FB1970] menuWithTitle:v18 children:v6];

LABEL_25:

  return v3;
}

uint64_t __34__MFSMIMEControl_menuWithOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) toggleEncryptionForControl:*(void *)(a1 + 40)];
}

uint64_t __34__MFSMIMEControl_menuWithOptions___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) toggleEncryptionForControl:*(void *)(a1 + 40)];
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  [(MFSMIMEControl *)self bounds];
  CGFloat x = v11.origin.x;
  CGFloat y = v11.origin.y;
  CGFloat width = v11.size.width;
  CGFloat height = v11.size.height;
  CGFloat MidX = CGRectGetMidX(v11);
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double MaxY = CGRectGetMaxY(v12);
  double v9 = MidX;
  result.CGFloat y = MaxY;
  result.CGFloat x = v9;
  return result;
}

- (id)_goToSettingsAction
{
  uint64_t v3 = (void *)MEMORY[0x1E4FB13F0];
  char v4 = _EFLocalizedString();
  v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"gearshape"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__MFSMIMEControl__goToSettingsAction__block_invoke;
  v8[3] = &unk_1E5F7B2B8;
  v8[4] = self;
  v6 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:v8];

  return v6;
}

void __37__MFSMIMEControl__goToSettingsAction__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 goToSettingsForControl:*(void *)(a1 + 32)];
}

- (MFSMIMEControlDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFSMIMEControlDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)canPresentMenu
{
  return self->_canPresentMenu;
}

- (void).cxx_destruct
{
}

@end