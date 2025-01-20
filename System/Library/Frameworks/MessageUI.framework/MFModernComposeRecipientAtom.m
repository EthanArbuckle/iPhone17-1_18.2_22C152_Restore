@interface MFModernComposeRecipientAtom
- (MFComposeRecipient)recipient;
- (MFComposeRecipientAtomDelegate)delegate;
- (MFModernComposeRecipientAtom)initWithFrame:(CGRect)a3 recipient:(id)a4;
- (MFModernComposeRecipientAtom)initWithFrame:(CGRect)a3 recipient:(id)a4 presentationOptions:(unint64_t)a5;
- (id)keyCommands;
- (void)handleTouchAndHold;
- (void)moveLeft:(id)a3;
- (void)moveRight:(id)a3;
- (void)setDelegate:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation MFModernComposeRecipientAtom

- (MFModernComposeRecipientAtom)initWithFrame:(CGRect)a3 recipient:(id)a4
{
  return -[MFModernComposeRecipientAtom initWithFrame:recipient:presentationOptions:](self, "initWithFrame:recipient:presentationOptions:", a4, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (MFModernComposeRecipientAtom)initWithFrame:(CGRect)a3 recipient:(id)a4 presentationOptions:(unint64_t)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v12 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MFModernComposeRecipientAtom;
  v13 = -[MFModernAtomView initWithFrame:presentationOptions:separatorStyle:wrappingSupported:](&v17, sel_initWithFrame_presentationOptions_separatorStyle_wrappingSupported_, a5, 0, 0, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_recipient, a4);
    v15 = [v12 displayString];
    [(MFModernAtomView *)v14 setTitle:v15];
  }
  return v14;
}

- (MFComposeRecipient)recipient
{
  return self->_recipient;
}

- (void)setDelegate:(id)a3
{
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  *((unsigned char *)self + 560) &= ~2u;
  *((unsigned char *)self + 560) &= ~1u;
  if ([(MFModernAtomView *)self isSelected])
  {
    *((unsigned char *)self + 560) |= 1u;
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained selectComposeRecipientAtom:self];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v9 = a4;
  v6 = [a3 anyObject];
  [v6 locationInView:self];
  v7 = -[MFModernComposeRecipientAtom hitTest:withEvent:](self, "hitTest:withEvent:", v9);

  if (!v7)
  {
    *((unsigned char *)self + 560) |= 2u;
    if ((*((unsigned char *)self + 560) & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained deselectComposeRecipientAtom:self];
    }
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  *((unsigned char *)self + 560) |= 2u;
  if ((*((unsigned char *)self + 560) & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained deselectComposeRecipientAtom:self];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if ((*((unsigned char *)self + 560) & 1) != 0 && (*((unsigned char *)self + 560) & 2) == 0) {
    [(MFModernComposeRecipientAtom *)self handleTouchAndHold];
  }
}

- (void)handleTouchAndHold
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained composeRecipientAtomShowPersonCard:self];
}

- (id)keyCommands
{
  v14[2] = *MEMORY[0x1E4F143B8];
  v3 = (void *)keyCommands_keyCommands_1;
  if (!keyCommands_keyCommands_1)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v5 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B78] modifierFlags:0 action:sel_moveLeft_];
    v14[0] = v5;
    id v6 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:*MEMORY[0x1E4FB2B90] modifierFlags:0 action:sel_moveRight_];
    v14[1] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:2];
    v8 = (void *)[v4 initWithArray:v7];

    v13.receiver = self;
    v13.super_class = (Class)MFModernComposeRecipientAtom;
    id v9 = [(MFModernComposeRecipientAtom *)&v13 keyCommands];
    [v8 addObjectsFromArray:v9];

    uint64_t v10 = [v8 copy];
    v11 = (void *)keyCommands_keyCommands_1;
    keyCommands_keyCommands_1 = v10;

    v3 = (void *)keyCommands_keyCommands_1;
  }

  return v3;
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

- (MFComposeRecipientAtomDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFComposeRecipientAtomDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_traits, 0);

  objc_storeStrong((id *)&self->_recipient, 0);
}

@end