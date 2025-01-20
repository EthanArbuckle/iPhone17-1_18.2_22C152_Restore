@interface _ASCABLEQRCodeBadgePlatterView
- (_ASCABLEQRCodeBadgePlatterView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
@end

@implementation _ASCABLEQRCodeBadgePlatterView

- (_ASCABLEQRCodeBadgePlatterView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_ASCABLEQRCodeBadgePlatterView;
  v3 = -[_ASCABLEQRCodeBadgePlatterView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_ASCABLEQRCodeBadgePlatterView *)v3 setOpaque:0];
    v5 = v4;
  }

  return v4;
}

- (void)drawRect:(CGRect)a3
{
  [(_ASCABLEQRCodeBadgePlatterView *)self bounds];
  CGRect v16 = CGRectInset(v15, 1.0, 1.0);
  double x = v16.origin.x;
  double y = v16.origin.y;
  double width = v16.size.width;
  double height = v16.size.height;
  [(_ASCABLEQRCodeBadgePlatterView *)self bounds];
  double v8 = round(CGRectGetWidth(v17) * 0.24);
  v9 = (void *)MEMORY[0x263F824C0];
  [(_ASCABLEQRCodeBadgePlatterView *)self bounds];
  objc_msgSend(v9, "bezierPathWithRoundedRect:cornerRadius:");
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(MEMORY[0x263F824C0], "bezierPathWithRoundedRect:cornerRadius:", x, y, width, height, v8);
  [(_ASCABLEQRCodeBadgePlatterView *)self bounds];
  [v13 setLineWidth:round(CGRectGetWidth(v18) * 0.085)];
  [v13 addClip];
  v11 = qrCodeContentsColor();
  [v11 setFill];

  [v10 fill];
  v12 = [MEMORY[0x263F825C8] whiteColor];
  [v12 setStroke];

  [v13 stroke];
}

@end