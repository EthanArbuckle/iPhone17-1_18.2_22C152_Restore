@interface MFMailComposeToField
- (BOOL)smimeButtonEnabled;
- (BOOL)smimeButtonVisible;
- (MFComposeSMIMELockButton)SMIMEButton;
- (MFMailComposeToFieldDelegate)toFieldDelegate;
- (id)_textContainerExclusionPathsWithAddButton:(BOOL)a3;
- (void)_setSMIMEButtonVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_tappedSMIMEButton:(id)a3;
- (void)dealloc;
- (void)layoutSubviews;
- (void)setExpanded:(BOOL)a3;
- (void)setSmimeButtonEnabled:(BOOL)a3;
- (void)setSmimeButtonVisible:(BOOL)a3;
- (void)setToFieldDelegate:(id)a3;
- (void)setWantsEncryption:(BOOL)a3 canEncrypt:(BOOL)a4 animated:(BOOL)a5;
@end

@implementation MFMailComposeToField

- (void)dealloc
{
  [(MFMailComposeToField *)self setToFieldDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)MFMailComposeToField;
  [(MFMailComposeRecipientTextView *)&v3 dealloc];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)MFMailComposeToField;
  [(CNComposeRecipientTextView *)&v10 layoutSubviews];
  if (self->_smimeButton)
  {
    BOOL v3 = [(CNComposeRecipientTextView *)self _useRightToLeftLayout];
    v4 = [(CNComposeRecipientTextView *)self addButton];
    [v4 center];
    double v6 = v5;
    if (v3) {
      *(double *)&unint64_t v7 = 40.0;
    }
    else {
      *(double *)&unint64_t v7 = -40.0;
    }
    double v8 = *(double *)&v7;

    v9 = [(CNComposeRecipientTextView *)self addButton];
    [v9 center];
    [(MFComposeSMIMELockButton *)self->_smimeButton setCenter:v6 + v8];

    [(MFComposeSMIMELockButton *)self->_smimeButton frame];
    CGRect v12 = CGRectIntegral(v11);
    -[MFComposeSMIMELockButton setFrame:](self->_smimeButton, "setFrame:", v12.origin.x, v12.origin.y, v12.size.width, v12.size.height);
  }
}

- (MFComposeSMIMELockButton)SMIMEButton
{
  smimeButton = self->_smimeButton;
  if (!smimeButton)
  {
    v4 = [MFComposeSMIMELockButton alloc];
    double v5 = [(CNComposeRecipientTextView *)self addButton];
    [v5 frame];
    double v6 = -[MFComposeSMIMELockButton initWithFrame:](v4, "initWithFrame:");
    unint64_t v7 = self->_smimeButton;
    self->_smimeButton = v6;

    [(MFComposeSMIMELockButton *)self->_smimeButton setAlpha:0.0];
    [(MFComposeSMIMELockButton *)self->_smimeButton setEnabled:[(MFMailComposeToField *)self smimeButtonEnabled]];
    [(MFComposeSMIMELockButton *)self->_smimeButton setWantsEncryption:self->_wantsEncryption canEncrypt:self->_canEncrypt animated:0];
    [(MFMailComposeToField *)self addSubview:self->_smimeButton];
    [(MFComposeSMIMELockButton *)self->_smimeButton addTarget:self action:sel__tappedSMIMEButton_ forControlEvents:64];
    smimeButton = self->_smimeButton;
  }

  return smimeButton;
}

- (void)_tappedSMIMEButton:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toFieldDelegate);
  [WeakRetained tappedSMIMEButton];
}

- (void)setExpanded:(BOOL)a3
{
  BOOL v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFMailComposeToField;
  -[CNComposeRecipientTextView setExpanded:](&v7, sel_setExpanded_);
  if (v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_toFieldDelegate);
    uint64_t v6 = [WeakRetained shouldShowSMIMEButton];
  }
  else
  {
    uint64_t v6 = 0;
  }
  [(MFMailComposeToField *)self _setSMIMEButtonVisible:v6 animated:[(MFMailComposeToField *)self smimeButtonVisible] ^ v4];
  if (v4) {
}
  }

- (void)setWantsEncryption:(BOOL)a3 canEncrypt:(BOOL)a4 animated:(BOOL)a5
{
  self->_wantsEncryption = a3;
  self->_canEncrypt = a4;
  -[MFComposeSMIMELockButton setWantsEncryption:canEncrypt:animated:](self->_smimeButton, "setWantsEncryption:canEncrypt:animated:");
}

- (void)setSmimeButtonEnabled:(BOOL)a3
{
  self->_smimeButtonEnabled = a3;
  -[MFComposeSMIMELockButton setEnabled:animated:](self->_smimeButton, "setEnabled:animated:");
}

- (void)_setSMIMEButtonVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(MFMailComposeToField *)self smimeButtonVisible] != a3)
  {
    [(MFMailComposeToField *)self setSmimeButtonVisible:v5];
    if (v5 || self->_smimeButton)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __56__MFMailComposeToField__setSMIMEButtonVisible_animated___block_invoke;
      aBlock[3] = &unk_1E5F79898;
      aBlock[4] = self;
      BOOL v20 = v5;
      objc_super v7 = _Block_copy(aBlock);
      double v8 = v7;
      if (v4)
      {
        v9 = [(MFMailComposeToField *)self SMIMEButton];
        objc_super v10 = v9;
        double v11 = 1.0;
        if (v5) {
          double v11 = 0.0;
        }
        [v9 setAlpha:v11];

        BOOL v12 = [(CNComposeRecipientTextView *)self _useRightToLeftLayout];
        if (v5)
        {
          double v13 = 2.0;
          if (v12) {
            double v13 = -2.0;
          }
          CGAffineTransformMakeTranslation(&v18, v13, 0.0);
        }
        else
        {
          long long v14 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
          *(_OWORD *)&v18.a = *MEMORY[0x1E4F1DAB8];
          *(_OWORD *)&v18.c = v14;
          *(_OWORD *)&v18.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
        }
        v15 = [(MFMailComposeToField *)self SMIMEButton];
        CGAffineTransform v17 = v18;
        [v15 setTransform:&v17];

        [MEMORY[0x1E4FB1EB0] animateWithDuration:v8 animations:0.25];
      }
      else
      {
        (*((void (**)(void *))v7 + 2))(v7);
      }
      v16 = [(MFMailComposeToField *)self SMIMEButton];
      [(MFMailComposeToField *)self bringSubviewToFront:v16];

      [(CNComposeRecipientTextView *)self _invalidateTextContainerExclusionPaths];
    }
  }
}

void __56__MFMailComposeToField__setSMIMEButtonVisible_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  BOOL v3 = [*(id *)(a1 + 32) SMIMEButton];
  [v3 setAlpha:v2];

  BOOL v4 = [*(id *)(a1 + 32) SMIMEButton];
  long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v6[0] = *MEMORY[0x1E4F1DAB8];
  v6[1] = v5;
  v6[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [v4 setTransform:v6];
}

- (id)_textContainerExclusionPathsWithAddButton:(BOOL)a3
{
  v23.receiver = self;
  v23.super_class = (Class)MFMailComposeToField;
  BOOL v4 = [(CNComposeRecipientTextView *)&v23 _textContainerExclusionPathsWithAddButton:a3];
  if ([(MFMailComposeToField *)self smimeButtonVisible])
  {
    long long v5 = (void *)[v4 mutableCopy];
    BOOL v6 = [(CNComposeRecipientTextView *)self _useRightToLeftLayout];
    smimeButton = self->_smimeButton;
    if (v6)
    {
      [(MFComposeSMIMELockButton *)smimeButton frame];
      double MaxX = CGRectGetMaxX(v25);
      double MinX = 0.0;
    }
    else
    {
      [(MFComposeSMIMELockButton *)smimeButton frame];
      double MinX = CGRectGetMinX(v26);
      [(MFMailComposeToField *)self frame];
      double MaxX = v10 - MinX;
    }
    [(MFComposeSMIMELockButton *)self->_smimeButton frame];
    double MaxY = CGRectGetMaxY(v27);
    BOOL v12 = [(CNComposeRecipientTextView *)self textView];
    -[MFMailComposeToField convertRect:toView:](self, "convertRect:toView:", v12, MinX, 0.0, MaxX, MaxY);
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    v21 = objc_msgSend(MEMORY[0x1E4FB14C0], "bezierPathWithRect:", v14, v16, v18, v20);
    [v5 addObject:v21];
  }
  else
  {
    long long v5 = v4;
  }

  return v5;
}

- (MFMailComposeToFieldDelegate)toFieldDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_toFieldDelegate);

  return (MFMailComposeToFieldDelegate *)WeakRetained;
}

- (void)setToFieldDelegate:(id)a3
{
}

- (BOOL)smimeButtonVisible
{
  return self->_smimeButtonVisible;
}

- (void)setSmimeButtonVisible:(BOOL)a3
{
  self->_smimeButtonVisible = a3;
}

- (BOOL)smimeButtonEnabled
{
  return self->_smimeButtonEnabled;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_toFieldDelegate);

  objc_storeStrong((id *)&self->_smimeButton, 0);
}

@end