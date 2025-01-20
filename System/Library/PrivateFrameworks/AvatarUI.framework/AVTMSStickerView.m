@interface AVTMSStickerView
- (AVTMSStickerView)initWithFrame:(CGRect)a3;
- (AVTMSStickerViewDelegate)delegate;
- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate;
- (BOOL)allowsPeel;
- (void)_prepareForReuse;
- (void)handleLongPress:(id)a3;
- (void)handleTap:(id)a3;
- (void)setAllowsPeel:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDisclosureValidationDelegate:(id)a3;
@end

@implementation AVTMSStickerView

- (AVTMSStickerView)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AVTMSStickerView;
  result = -[MSStickerView initWithFrame:](&v4, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_allowsPeel = 1;
  }
  return result;
}

- (void)handleTap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVTMSStickerView *)self disclosureValidationDelegate];
  if (!v5) {
    goto LABEL_9;
  }
  v6 = (void *)v5;
  v7 = [(AVTMSStickerView *)self disclosureValidationDelegate];
  v8 = [(MSStickerView *)self sticker];
  int v9 = [v7 shouldAllowUserActionOnSticker:v8];

  if (v9)
  {
LABEL_9:
    if ([v4 state] == 3)
    {
      v12.receiver = self;
      v12.super_class = (Class)AVTMSStickerView;
      [(MSStickerView *)&v12 handleTap:v4];
      v10 = [(AVTMSStickerView *)self delegate];

      if (v10)
      {
        v11 = [(AVTMSStickerView *)self delegate];
        [v11 stickerViewWasTapped:self];
      }
    }
  }
}

- (void)handleLongPress:(id)a3
{
  id v4 = a3;
  if ([(AVTMSStickerView *)self allowsPeel])
  {
    uint64_t v5 = [(AVTMSStickerView *)self disclosureValidationDelegate];
    if (!v5) {
      goto LABEL_4;
    }
    v6 = (void *)v5;
    v7 = [(AVTMSStickerView *)self disclosureValidationDelegate];
    v8 = [(MSStickerView *)self sticker];
    int v9 = [v7 shouldAllowUserActionOnSticker:v8];

    if (v9)
    {
LABEL_4:
      v14.receiver = self;
      v14.super_class = (Class)AVTMSStickerView;
      [(MSStickerView *)&v14 handleLongPress:v4];
      uint64_t v10 = [(AVTMSStickerView *)self delegate];
      if (v10)
      {
        v11 = (void *)v10;
        uint64_t v12 = [v4 state];

        if (v12 == 1)
        {
          v13 = [(AVTMSStickerView *)self delegate];
          [v13 stickerViewDidBeginPeel:self];
        }
      }
    }
  }
}

- (void)_prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)AVTMSStickerView;
  [(MSStickerView *)&v3 _prepareForReuse];
  [(MSStickerView *)self setImageData:0];
}

- (BOOL)allowsPeel
{
  return self->_allowsPeel;
}

- (void)setAllowsPeel:(BOOL)a3
{
  self->_allowsPeel = a3;
}

- (AVTMSStickerViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AVTMSStickerViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AVTStickerDisclosureValidationDelegate)disclosureValidationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_disclosureValidationDelegate);
  return (AVTStickerDisclosureValidationDelegate *)WeakRetained;
}

- (void)setDisclosureValidationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_disclosureValidationDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

@end