@interface FAAddPhotoView
- (FAAddPhotoView)initWithTarget:(id)a3 action:(SEL)a4;
- (void)drawRect:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation FAAddPhotoView

- (FAAddPhotoView)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)FAAddPhotoView;
  v7 = -[FAAddPhotoView initWithFrame:](&v19, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v7)
  {
    uint64_t v8 = [MEMORY[0x263F824E8] buttonWithType:1];
    addPhotoButton = v7->_addPhotoButton;
    v7->_addPhotoButton = (UIButton *)v8;

    v10 = v7->_addPhotoButton;
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"FAMILY_SETUP_ADD_PROFILE_PICTURE_BUTTON" value:&stru_26CA2C800 table:@"Localizable"];
    [(UIButton *)v10 setTitle:v12 forState:0];

    v13 = v7->_addPhotoButton;
    v14 = [MEMORY[0x263F825C8] systemBlueColor];
    [(UIButton *)v13 setTintColor:v14];

    v15 = [(UIButton *)v7->_addPhotoButton titleLabel];
    [v15 setNumberOfLines:0];

    v16 = [(UIButton *)v7->_addPhotoButton titleLabel];
    [v16 setTextAlignment:1];

    [(UIButton *)v7->_addPhotoButton addTarget:v6 action:a4 forControlEvents:64];
    [(FAAddPhotoView *)v7 addSubview:v7->_addPhotoButton];
    v17 = [MEMORY[0x263F825C8] clearColor];
    [(FAAddPhotoView *)v7 setBackgroundColor:v17];
  }
  return v7;
}

- (void)drawRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v8.receiver = self;
  v8.super_class = (Class)FAAddPhotoView;
  -[FAAddPhotoView drawRect:](&v8, sel_drawRect_, a3.origin.x, a3.origin.y);
  CurrentContext = UIGraphicsGetCurrentContext();
  id v6 = [MEMORY[0x263F825C8] clearColor];
  CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)[v6 CGColor]);

  id v7 = [MEMORY[0x263F825C8] systemBlueColor];
  CGContextSetStrokeColorWithColor(CurrentContext, (CGColorRef)[v7 CGColor]);

  v9.origin.x = 1.0;
  v9.origin.y = 1.0;
  v9.size.double width = width + -2.0;
  v9.size.double height = height + -2.0;
  CGContextStrokeEllipseInRect(CurrentContext, v9);
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)FAAddPhotoView;
  [(FAAddPhotoView *)&v10 layoutSubviews];
  [(UIButton *)self->_addPhotoButton sizeToFit];
  [(UIButton *)self->_addPhotoButton frame];
  double v4 = v3;
  double v6 = v5;
  [(FAAddPhotoView *)self frame];
  double v8 = (v7 - v6) * 0.5;
  [(FAAddPhotoView *)self frame];
  -[UIButton setFrame:](self->_addPhotoButton, "setFrame:", (v9 - v4) * 0.5, v8, v4, v6);
}

- (void).cxx_destruct
{
}

@end