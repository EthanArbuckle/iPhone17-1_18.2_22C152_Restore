@interface _CertInfoActionButton
- (_CertInfoActionButton)initWithTitle:(id)a3 isDestructive:(BOOL)a4;
- (void)setTitle:(id)a3 destructive:(BOOL)a4;
@end

@implementation _CertInfoActionButton

- (_CertInfoActionButton)initWithTitle:(id)a3 isDestructive:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_CertInfoActionButton;
  v7 = -[_CertInfoActionButton initWithFrame:](&v16, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  v8 = v7;
  if (v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53___CertInfoActionButton_initWithTitle_isDestructive___block_invoke;
    block[3] = &unk_26432C2D0;
    v9 = v7;
    v15 = v9;
    if (initWithTitle_isDestructive__onceToken != -1) {
      dispatch_once(&initWithTitle_isDestructive__onceToken, block);
    }
    v10 = [(_CertInfoActionButton *)v9 titleLabel];
    v11 = [MEMORY[0x263F1C658] boldSystemFontOfSize:14.0];
    [v10 setFont:v11];

    [v10 setTextAlignment:1];
    v12 = [MEMORY[0x263F1C550] colorWithRed:0.300000012 green:0.300000012 blue:0.300000012 alpha:1.0];
    [v10 setShadowColor:v12];

    objc_msgSend(v10, "setShadowOffset:", 0.0, -1.0);
    [v10 setClipsToBounds:0];
    -[_CertInfoActionButton setContentEdgeInsets:](v9, "setContentEdgeInsets:", 4.0, 17.0, 4.0, 17.0);
    [(_CertInfoActionButton *)v9 setTitle:v6 destructive:v4];
    [(_CertInfoActionButton *)v9 sizeToFit];
  }
  return v8;
}

- (void)setTitle:(id)a3 destructive:(BOOL)a4
{
  BOOL v4 = a4;
  [(_CertInfoActionButton *)self setTitle:a3 forState:0];
  id v6 = &_removeButtonImage;
  if (v4)
  {
    v7 = &_removeButtonPressedImage;
  }
  else
  {
    id v6 = &_installButtonImage;
    v7 = &_installButtonPressedImage;
  }
  [(_CertInfoActionButton *)self setBackgroundImage:*v6 forState:0];
  uint64_t v8 = *v7;
  [(_CertInfoActionButton *)self setBackgroundImage:v8 forState:1];
}

@end