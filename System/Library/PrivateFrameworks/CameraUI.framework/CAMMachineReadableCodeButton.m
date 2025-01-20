@interface CAMMachineReadableCodeButton
- (BOOL)isDismissable;
- (CAMMachineReadableCodeButton)initWithFrame:(CGRect)a3;
- (CAMMachineReadableCodeButtonDelegate)delegate;
- (NSString)title;
- (UIImage)titleImage;
- (void)_didTapDismiss:(id)a3;
- (void)layoutSubviews;
- (void)setAttributedTitleWithTitle:(id)a3 image:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setDismissable:(BOOL)a3;
- (void)updateConfiguration;
@end

@implementation CAMMachineReadableCodeButton

- (CAMMachineReadableCodeButton)initWithFrame:(CGRect)a3
{
  v18[1] = *MEMORY[0x263EF8340];
  v17.receiver = self;
  v17.super_class = (Class)CAMMachineReadableCodeButton;
  v3 = -[CAMMachineReadableCodeButton initWithFrame:](&v17, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = [MEMORY[0x263F824F0] filledButtonConfiguration];
    [v4 setCornerStyle:4];
    v5 = [MEMORY[0x263F825C8] blackColor];
    [v4 setBaseForegroundColor:v5];

    v6 = [MEMORY[0x263F825C8] systemYellowColor];
    [v4 setBaseBackgroundColor:v6];

    [v4 setImagePlacement:8];
    [v4 setTitleLineBreakMode:4];
    objc_initWeak(&location, v3);
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __46__CAMMachineReadableCodeButton_initWithFrame___block_invoke;
    v14 = &unk_263FA1080;
    objc_copyWeak(&v15, &location);
    [v4 setImageColorTransformer:&v11];
    -[CAMMachineReadableCodeButton setConfiguration:](v3, "setConfiguration:", v4, v11, v12, v13, v14);
    v7 = [(CAMMachineReadableCodeButton *)v3 titleLabel];
    [v7 setTextAlignment:1];

    v18[0] = objc_opt_class();
    v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
    id v9 = (id)[(CAMMachineReadableCodeButton *)v3 registerForTraitChanges:v8 withTarget:v3 action:sel_setNeedsUpdateConfiguration];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  return v3;
}

id __46__CAMMachineReadableCodeButton_initWithFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isDismissable])
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v3 colorWithAlphaComponent:0.3];
  }
  v6 = v5;

  return v6;
}

- (void)layoutSubviews
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__CAMMachineReadableCodeButton_layoutSubviews__block_invoke;
  v4[3] = &unk_263FA0208;
  v4[4] = self;
  [MEMORY[0x263F82E00] performWithoutAnimation:v4];
  v3.receiver = self;
  v3.super_class = (Class)CAMMachineReadableCodeButton;
  [(CAMMachineReadableCodeButton *)&v3 layoutSubviews];
}

void __46__CAMMachineReadableCodeButton_layoutSubviews__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) imageView];
  [v1 intrinsicContentSize];
  CEKRectWithSize();
  objc_msgSend(v1, "frameForAlignmentRect:");
  CEKRectWithSize();
  objc_msgSend(v1, "setBounds:");
}

- (void)updateConfiguration
{
  objc_super v3 = [(CAMMachineReadableCodeButton *)self configuration];
  id v17 = [v3 updatedConfigurationForButton:self];

  uint64_t v4 = [(CAMMachineReadableCodeButton *)self effectiveUserInterfaceLayoutDirection];
  BOOL v5 = [(CAMMachineReadableCodeButton *)self isDismissable];
  v6 = @"chevron.right";
  if (v4 == 1) {
    v6 = @"chevron.left";
  }
  if (v5) {
    v6 = @"xmark";
  }
  v7 = v6;
  v8 = [(CAMMachineReadableCodeButton *)self traitCollection];
  id v9 = [v8 preferredContentSizeCategory];
  v10 = +[CAMFont cameraFontForContentSize:v9];

  uint64_t v11 = [MEMORY[0x263F82818] configurationWithFont:v10 scale:1];
  uint64_t v12 = [MEMORY[0x263F827E8] systemImageNamed:v7 withConfiguration:v11];

  [v17 setImage:v12];
  v13 = [(CAMMachineReadableCodeButton *)self currentAttributedTitle];
  v14 = (void *)[v13 mutableCopy];

  objc_msgSend(v14, "addAttribute:value:range:", *MEMORY[0x263F814F0], v10, 0, objc_msgSend(v14, "length"));
  [v17 setAttributedTitle:v14];
  BOOL v15 = [(CAMMachineReadableCodeButton *)self isDismissable];
  double v16 = 4.0;
  if (v15) {
    double v16 = 10.0;
  }
  [v17 setImagePadding:v16];
  [(CAMMachineReadableCodeButton *)self setConfiguration:v17];
}

- (void)setAttributedTitleWithTitle:(id)a3 image:(id)a4
{
  id v17 = (NSString *)a3;
  v6 = (UIImage *)a4;
  if (self->_title != v17)
  {
    char v7 = -[NSString isEqual:](v17, "isEqual:");
    p_titleImage = &self->_titleImage;
    titleImage = self->_titleImage;
    if (v7)
    {
      if (titleImage == v6) {
        goto LABEL_15;
      }
    }
    else
    {
      v10 = (NSString *)[(NSString *)v17 copy];
      title = self->_title;
      self->_title = v10;

      if (titleImage == v6) {
        goto LABEL_9;
      }
    }
LABEL_8:
    objc_storeStrong((id *)p_titleImage, a4);
LABEL_9:
    id v12 = objc_alloc_init(MEMORY[0x263F089B8]);
    if (v6)
    {
      v13 = [MEMORY[0x263F81678] textAttachmentWithImage:v6];
      v14 = [MEMORY[0x263F086A0] attributedStringWithAttachment:v13];
      [v12 appendAttributedString:v14];

      if (v17)
      {
        BOOL v15 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:@" "];
        [v12 appendAttributedString:v15];

LABEL_13:
        double v16 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v17];
        [v12 appendAttributedString:v16];
      }
    }
    else if (v17)
    {
      goto LABEL_13;
    }
    [(CAMMachineReadableCodeButton *)self setAttributedTitle:v12 forState:0];
    [(CAMMachineReadableCodeButton *)self setNeedsLayout];

    goto LABEL_15;
  }
  p_titleImage = &self->_titleImage;
  if (self->_titleImage != v6) {
    goto LABEL_8;
  }
LABEL_15:
}

- (void)setDismissable:(BOOL)a3
{
  if (self->_dismissable != a3)
  {
    BOOL v3 = a3;
    self->_dismissable = a3;
    id v8 = [(CAMMachineReadableCodeButton *)self imageView];
    [v8 setUserInteractionEnabled:v3];
    UIEdgeInsetsMakeWithEdges();
    objc_msgSend(v8, "setHitTestInsets:");
    if (v3)
    {
      BOOL v5 = [v8 gestureRecognizers];
      uint64_t v6 = [v5 count];

      if (!v6)
      {
        char v7 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__didTapDismiss_];
        [v8 addGestureRecognizer:v7];
      }
    }
    [(CAMMachineReadableCodeButton *)self setNeedsUpdateConfiguration];
  }
}

- (void)_didTapDismiss:(id)a3
{
  id v4 = [(CAMMachineReadableCodeButton *)self delegate];
  [v4 machineReadableCodeButtonDidTapDismiss:self];
}

- (BOOL)isDismissable
{
  return self->_dismissable;
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)titleImage
{
  return self->_titleImage;
}

- (CAMMachineReadableCodeButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMMachineReadableCodeButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_titleImage, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

@end