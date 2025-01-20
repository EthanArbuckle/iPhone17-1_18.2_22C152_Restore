@interface MFConfirmationButton
+ (MFConfirmationButton)confirmationButtonWithMessage:(id)a3 confirmationLabel:(id)a4 handler:(id)a5;
- (BOOL)_isInConfirmableState;
- (BOOL)hasPresentedConfirmation;
- (NSString)confirmationLabel;
- (NSString)confirmationMessage;
- (UIImage)confirmationIcon;
- (id)_confirmationMenu;
- (id)handlerBlock;
- (unint64_t)confirmationSelectionMode;
- (unint64_t)confirmationType;
- (void)_didConfirm;
- (void)_updateButtonAction;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)reset;
- (void)setConfirmationIcon:(id)a3;
- (void)setConfirmationLabel:(id)a3;
- (void)setConfirmationMessage:(id)a3;
- (void)setConfirmationSelectionMode:(unint64_t)a3;
- (void)setConfirmationType:(unint64_t)a3;
- (void)setHandlerBlock:(id)a3;
- (void)setHasPresentedConfirmation:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
@end

@implementation MFConfirmationButton

+ (MFConfirmationButton)confirmationButtonWithMessage:(id)a3 confirmationLabel:(id)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 buttonWithType:0];
  [v11 setConfirmationType:0];
  [v11 setConfirmationSelectionMode:0];
  [v11 setConfirmationMessage:v8];
  [v11 setConfirmationLabel:v9];
  [v11 setHandlerBlock:v10];
  v12 = [v11 _confirmationMenu];
  [v11 setMenu:v12];

  return (MFConfirmationButton *)v11;
}

- (void)setConfirmationType:(unint64_t)a3
{
  self->_confirmationType = a3;
  [(MFConfirmationButton *)self _updateButtonAction];
}

- (void)setConfirmationSelectionMode:(unint64_t)a3
{
  self->_confirmationSelectionMode = a3;
  [(MFConfirmationButton *)self _updateButtonAction];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MFConfirmationButton;
  [(MFDimmableButton *)&v4 setSelected:a3];
  [(MFConfirmationButton *)self _updateButtonAction];
}

- (void)setConfirmationIcon:(id)a3
{
  objc_storeStrong((id *)&self->_confirmationIcon, a3);
  id v4 = [(MFConfirmationButton *)self _confirmationMenu];
  -[MFConfirmationButton setMenu:](self, "setMenu:");
}

- (void)_updateButtonAction
{
  BOOL v3 = [(MFConfirmationButton *)self _isInConfirmableState];
  [(MFConfirmationButton *)self setContextMenuInteractionEnabled:v3];
  [(MFConfirmationButton *)self setShowsMenuAsPrimaryAction:v3];
  if (v3)
  {
    [(MFConfirmationButton *)self removeTarget:self action:sel__didConfirm forControlEvents:64];
  }
  else
  {
    [(MFConfirmationButton *)self addTarget:self action:sel__didConfirm forControlEvents:64];
  }
}

- (BOOL)_isInConfirmableState
{
  if ([(MFConfirmationButton *)self confirmationType] == 1
    && [(MFConfirmationButton *)self hasPresentedConfirmation])
  {
    return 0;
  }
  unint64_t v4 = [(MFConfirmationButton *)self confirmationSelectionMode];
  if (v4 == 2)
  {
    return [(MFConfirmationButton *)self isSelected];
  }
  else if (v4 == 1)
  {
    return [(MFConfirmationButton *)self isSelected] ^ 1;
  }
  else
  {
    return 1;
  }
}

- (void)reset
{
  [(MFConfirmationButton *)self setSelected:0];
  [(MFConfirmationButton *)self setHasPresentedConfirmation:0];

  [(MFConfirmationButton *)self _updateButtonAction];
}

- (id)_confirmationMenu
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  BOOL v3 = (void *)MEMORY[0x1E4FB13F0];
  unint64_t v4 = [(MFConfirmationButton *)self confirmationLabel];
  v5 = [(MFConfirmationButton *)self confirmationIcon];
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  v14 = __41__MFConfirmationButton__confirmationMenu__block_invoke;
  v15 = &unk_1E5F7A198;
  objc_copyWeak(&v16, &location);
  v6 = [v3 actionWithTitle:v4 image:v5 identifier:0 handler:&v12];

  v7 = (void *)MEMORY[0x1E4FB1970];
  id v8 = [(MFConfirmationButton *)self confirmationMessage];
  v18[0] = v6;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  id v10 = [v7 menuWithTitle:v8 children:v9];

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v10;
}

void __41__MFConfirmationButton__confirmationMenu__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _didConfirm];
}

- (void)_didConfirm
{
  if ([(MFConfirmationButton *)self confirmationSelectionMode]) {
    [(MFConfirmationButton *)self setSelected:[(MFConfirmationButton *)self isSelected] ^ 1];
  }
  BOOL v3 = [(MFConfirmationButton *)self handlerBlock];

  if (v3)
  {
    unint64_t v4 = [(MFConfirmationButton *)self handlerBlock];
    v4[2]();
  }
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __80__MFConfirmationButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
  v12[3] = &unk_1E5F7A698;
  objc_copyWeak(&v13, &location);
  [v10 addCompletion:v12];
  v11.receiver = self;
  v11.super_class = (Class)MFConfirmationButton;
  [(MFConfirmationButton *)&v11 contextMenuInteraction:v8 willEndForConfiguration:v9 animator:v10];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __80__MFConfirmationButton_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setHasPresentedConfirmation:1];
}

- (unint64_t)confirmationType
{
  return self->_confirmationType;
}

- (unint64_t)confirmationSelectionMode
{
  return self->_confirmationSelectionMode;
}

- (NSString)confirmationMessage
{
  return self->_confirmationMessage;
}

- (void)setConfirmationMessage:(id)a3
{
}

- (NSString)confirmationLabel
{
  return self->_confirmationLabel;
}

- (void)setConfirmationLabel:(id)a3
{
}

- (UIImage)confirmationIcon
{
  return self->_confirmationIcon;
}

- (id)handlerBlock
{
  return self->_handlerBlock;
}

- (void)setHandlerBlock:(id)a3
{
}

- (BOOL)hasPresentedConfirmation
{
  return self->_hasPresentedConfirmation;
}

- (void)setHasPresentedConfirmation:(BOOL)a3
{
  self->_hasPresentedConfirmation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handlerBlock, 0);
  objc_storeStrong((id *)&self->_confirmationIcon, 0);
  objc_storeStrong((id *)&self->_confirmationLabel, 0);

  objc_storeStrong((id *)&self->_confirmationMessage, 0);
}

@end