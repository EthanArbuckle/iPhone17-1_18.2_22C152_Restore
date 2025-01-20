@interface MFCorecipientsIndicatorAtom
- (MFCorecipientsIndicatorAtom)init;
- (MFCorecipientsIndicatorAtom)initWithRecipients:(id)a3;
- (MFCorecipientsIndicatorAtomDelegate)delegate;
- (NSArray)recipients;
- (void)setDelegate:(id)a3;
- (void)setRecipients:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation MFCorecipientsIndicatorAtom

- (MFCorecipientsIndicatorAtom)init
{
  v3.receiver = self;
  v3.super_class = (Class)MFCorecipientsIndicatorAtom;
  return -[MFModernAtomView initWithFrame:presentationOptions:separatorStyle:wrappingSupported:](&v3, sel_initWithFrame_presentationOptions_separatorStyle_wrappingSupported_, 0, 2, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (MFCorecipientsIndicatorAtom)initWithRecipients:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MFCorecipientsIndicatorAtom;
  v5 = -[MFModernAtomView initWithFrame:presentationOptions:separatorStyle:wrappingSupported:](&v8, sel_initWithFrame_presentationOptions_separatorStyle_wrappingSupported_, 0, 2, 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  v6 = v5;
  if (v5) {
    [(MFCorecipientsIndicatorAtom *)v5 setRecipients:v4];
  }

  return v6;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  self->_touchesWereCancelled = 0;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v8 = a4;
  v6 = [a3 anyObject];
  [v6 locationInView:self];
  v7 = -[MFCorecipientsIndicatorAtom hitTest:withEvent:](self, "hitTest:withEvent:", v8);

  if (!v7) {
    self->_touchesWereCancelled = 1;
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  self->_touchesWereCancelled = 1;
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (!self->_touchesWereCancelled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v8 = [(MFCorecipientsIndicatorAtom *)self recipients];
    [WeakRetained didTapShowCorecipientsForIndicatorAtom:self recipients:v8];
  }
  [(MFModernAtomView *)self setSelected:0];
}

- (MFCorecipientsIndicatorAtomDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFCorecipientsIndicatorAtomDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (void)setRecipients:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recipients, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end