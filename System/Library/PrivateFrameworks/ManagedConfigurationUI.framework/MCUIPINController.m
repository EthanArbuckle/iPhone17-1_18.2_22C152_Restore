@interface MCUIPINController
- (DevicePINControllerDelegate)delegate;
- (MCUIPINController)init;
- (id)pinInstructionsPrompt;
- (unint64_t)style;
- (void)_updateStyle;
- (void)presentationControllerDidAttemptToDismiss:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setStyle:(unint64_t)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MCUIPINController

- (MCUIPINController)init
{
  v11.receiver = self;
  v11.super_class = (Class)MCUIPINController;
  v2 = [(DevicePINController *)&v11 init];
  v3 = v2;
  if (v2)
  {
    uint64_t v4 = (int)*MEMORY[0x1E4F92ED0];
    *(_DWORD *)((char *)&v2->super.super.super.super.super.super.isa + v4) = 3;
    v5 = [MEMORY[0x1E4F92E40] appearance];
    v6 = [MEMORY[0x1E4F428B8] labelColor];
    [v5 setTextColor:v6];

    v7 = objc_alloc_init(MCUIPINPane);
    [(MCUIPINPane *)v7 setAutoresizingMask:18];
    [(PSEditingPane *)v7 setDelegate:v3];
    v8 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    v9 = [NSNumber numberWithInt:*(unsigned int *)((char *)&v3->super.super.super.super.super.super.isa + v4)];
    [v8 setProperty:v9 forKey:@"mode"];

    [(DevicePINController *)v3 setSpecifier:v8];
    [(DevicePINController *)v3 setPane:v7];
  }
  return v3;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MCUIPINController;
  [(DevicePINController *)&v4 viewWillAppear:a3];
  [(MCUIPINController *)self _updateStyle];
  [(MCUIPINController *)self setModalInPresentation:[(MCUIPINController *)self style] != 1];
}

- (void)presentationControllerDidAttemptToDismiss:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained((id *)p_delegate);
    [v5 didCancelEnteringPIN];
  }
}

- (void)_updateStyle
{
  unint64_t v3 = [(MCUIPINController *)self style];
  objc_super v4 = [(PSDetailController *)self pane];
  [v4 setStyle:v3];

  unint64_t v5 = [(MCUIPINController *)self style];
  if (v5 == 1)
  {
    v10 = [(MCUIPINController *)self navigationItem];
    [v10 setHidesBackButton:0];

    if ([(DevicePINController *)self simplePIN])
    {
      objc_super v11 = [(MCUIPINController *)self navigationItem];
      [v11 setRightBarButtonItem:0];
    }
    v12 = (void *)MEMORY[0x1E4F42A80];
    v13 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    v23 = [v12 MCUIImageWithColor:v13];

    v14 = [(MCUIPINController *)self navigationController];
    v15 = [v14 navigationBar];
    [v15 setBackgroundImage:v23 forBarMetrics:0];

    v16 = [(MCUIPINController *)self navigationController];
    v17 = [v16 navigationBar];
    v18 = objc_opt_new();
    [v17 setShadowImage:v18];

    v19 = [(MCUIPINController *)self navigationController];
    v20 = [v19 navigationBar];
    [v20 setTranslucent:1];

    v21 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
    v22 = [(MCUIPINController *)self view];
    [v22 setBackgroundColor:v21];

    v7 = [(MCUIPINController *)self navigationItem];
    v8 = v7;
    v9 = &stru_1F40ADA78;
  }
  else
  {
    if (v5) {
      return;
    }
    v6 = [(MCUIPINController *)self navigationItem];
    [v6 setHidesBackButton:1];

    MCUILocalizedString(@"PIN_TITLE");
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v7 = [(MCUIPINController *)self navigationItem];
    v8 = v7;
    v9 = v23;
  }
  [v7 setTitle:v9];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  unint64_t v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    v6 = [MEMORY[0x1E4F92E70] emptyGroupSpecifier];
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 setProperty:v7 forKey:*MEMORY[0x1E4F93258]];

    v8 = [NSNumber numberWithInt:*(unsigned int *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x1E4F92ED0])];
    [v6 setProperty:v8 forKey:@"mode"];

    [(DevicePINController *)self setSpecifier:v6];
    unint64_t v5 = obj;
  }
}

- (id)pinInstructionsPrompt
{
  if (MCUIForPairedDevice()) {
    v2 = @"PIN_MESSAGE_BRIDGE";
  }
  else {
    v2 = @"PIN_MESSAGE";
  }
  return MCUILocalizedString(v2);
}

- (DevicePINControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DevicePINControllerDelegate *)WeakRetained;
}

- (unint64_t)style
{
  return self->_style;
}

- (void)setStyle:(unint64_t)a3
{
  self->_style = a3;
}

- (void).cxx_destruct
{
}

@end