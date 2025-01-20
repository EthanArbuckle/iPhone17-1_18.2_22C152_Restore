@interface CNComposeRecipientAtom
- (CNComposeRecipient)recipient;
- (CNComposeRecipientAtom)initWithFrame:(CGRect)a3 recipient:(id)a4;
- (CNComposeRecipientAtom)initWithFrame:(CGRect)a3 recipient:(id)a4 presentationOptions:(unint64_t)a5;
- (CNComposeRecipientAtomDelegate)delegate;
- (id)keyCommands;
- (id)menuConfigurationForChevronButton;
- (void)handleFirstTap;
- (void)handleTouchAndHold;
- (void)moveLeft:(id)a3;
- (void)moveRight:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRecipient:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation CNComposeRecipientAtom

- (CNComposeRecipientAtom)initWithFrame:(CGRect)a3 recipient:(id)a4
{
  return -[CNComposeRecipientAtom initWithFrame:recipient:presentationOptions:](self, "initWithFrame:recipient:presentationOptions:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (CNComposeRecipientAtom)initWithFrame:(CGRect)a3 recipient:(id)a4 presentationOptions:(unint64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)CNComposeRecipientAtom;
  v13 = -[CNAtomView initWithFrame:presentationOptions:separatorStyle:wrappingSupported:](&v17, sel_initWithFrame_presentationOptions_separatorStyle_wrappingSupported_, a5, 0, 0, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_recipient, a4);
    v15 = [v12 compositeName];
    [(CNAtomView *)v14 setTitle:v15];
  }
  return v14;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  *((unsigned char *)self + 584) = *((unsigned char *)self + 584) & 0xFE | [(CNAtomView *)self isSelected];
  *((unsigned char *)self + 584) &= ~2u;
  unsigned int v6 = [v5 modifierFlags];

  *((unsigned char *)self + 584) = *((unsigned char *)self + 584) & 0xFB | (v6 >> 15) & 4;
  if ((*((unsigned char *)self + 584) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = WeakRetained;
    if (((v6 >> 15) & 4) != 0) {
      [WeakRetained shiftSelectComposeRecipientAtom:self];
    }
    else {
      [WeakRetained selectComposeRecipientAtom:self];
    }
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if ((*((unsigned char *)self + 584) & 2) == 0 && (*((unsigned char *)self + 584) & 4) == 0)
  {
    v7 = [v10 anyObject];
    [v7 locationInView:self];
    id v8 = -[CNComposeRecipientAtom hitTest:withEvent:](self, "hitTest:withEvent:", v6);

    if (!v8)
    {
      *((unsigned char *)self + 584) |= 2u;
      if ((*((unsigned char *)self + 584) & 1) == 0)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained deselectComposeRecipientAtom:self];
      }
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  *((unsigned char *)self + 584) |= 2u;
  if ((*((unsigned char *)self + 584) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained deselectComposeRecipientAtom:self];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ((*((unsigned char *)self + 584) & 2) == 0)
  {
    if (*((unsigned char *)self + 584)) {
      [(CNComposeRecipientAtom *)self handleTouchAndHold];
    }
    else {
      [(CNComposeRecipientAtom *)self handleFirstTap];
    }
  }
}

- (void)handleTouchAndHold
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeRecipientAtomDisambiguate:self];
}

- (void)handleFirstTap
{
  v3 = [(CNComposeRecipientAtom *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained composeRecipientAtomStopDisambiguating];
  }
}

- (id)keyCommands
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F43A60] modifierFlags:0 action:sel_moveLeft_];
  v10[0] = v3;
  char v4 = [MEMORY[0x1E4F42AF8] keyCommandWithInput:*MEMORY[0x1E4F43A78] modifierFlags:0 action:sel_moveRight_];
  v10[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];

  v9.receiver = self;
  v9.super_class = (Class)CNComposeRecipientAtom;
  id v6 = [(CNComposeRecipientAtom *)&v9 keyCommands];
  id v7 = [v5 arrayByAddingObjectsFromArray:v6];

  return v7;
}

- (void)moveLeft:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeRecipientAtomSelectPrevious:self];
}

- (void)moveRight:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeRecipientAtomSelectNext:self];
}

- (id)menuConfigurationForChevronButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v4 = [WeakRetained menuConfigurationForAtomView:self];

  return v4;
}

- (CNComposeRecipientAtomDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CNComposeRecipientAtomDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (CNComposeRecipient)recipient
{
  return self->_recipient;
}

- (void)setRecipient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_traits, 0);

  objc_storeStrong((id *)&self->_recipient, 0);
}

@end