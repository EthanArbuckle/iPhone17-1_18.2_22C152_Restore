@interface AAUIProfilePhotoView
- (AAUIProfilePhotoView)initWithPhoto:(id)a3 target:(id)a4 action:(SEL)a5;
- (BOOL)isEditing;
- (UIImage)photo;
- (double)desiredHeightForWidth:(double)result;
- (void)layoutSubviews;
- (void)setEditing:(BOOL)a3;
- (void)setPhoto:(id)a3;
@end

@implementation AAUIProfilePhotoView

- (AAUIProfilePhotoView)initWithPhoto:(id)a3 target:(id)a4 action:(SEL)a5
{
  id v8 = a3;
  id v9 = a4;
  v22.receiver = self;
  v22.super_class = (Class)AAUIProfilePhotoView;
  v10 = -[AAUIProfilePhotoView initWithFrame:](&v22, sel_initWithFrame_, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  if (v10)
  {
    v11 = [MEMORY[0x263F825C8] clearColor];
    [(AAUIProfilePhotoView *)v10 setBackgroundColor:v11];

    uint64_t v12 = [objc_alloc(MEMORY[0x263F82828]) initWithImage:v8];
    photoView = v10->_photoView;
    v10->_photoView = (UIImageView *)v12;

    [(AAUIProfilePhotoView *)v10 addSubview:v10->_photoView];
    uint64_t v14 = [MEMORY[0x263F824E8] buttonWithType:1];
    editButton = v10->_editButton;
    v10->_editButton = (UIButton *)v14;

    v16 = v10->_editButton;
    v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"EDIT_PROFILE_PHOTO_BUTTON" value:&stru_26BD39CD8 table:@"Localizable"];
    [(UIButton *)v16 setTitle:v18 forState:0];

    [(UIButton *)v10->_editButton addTarget:v9 action:a5 forControlEvents:64];
    v19 = v10->_editButton;
    v20 = [MEMORY[0x263F825C8] systemBlueColor];
    [(UIButton *)v19 setTitleColor:v20 forState:0];

    if (v10->_isEditing) {
      [(AAUIProfilePhotoView *)v10 addSubview:v10->_editButton];
    }
  }

  return v10;
}

- (void)setEditing:(BOOL)a3
{
  if (self->_isEditing != a3)
  {
    self->_isEditing = a3;
    if (a3) {
      [(AAUIProfilePhotoView *)self addSubview:self->_editButton];
    }
    else {
      [(UIButton *)self->_editButton removeFromSuperview];
    }
    [(AAUIProfilePhotoView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)AAUIProfilePhotoView;
  [(AAUIProfilePhotoView *)&v12 layoutSubviews];
  [(UIImageView *)self->_photoView frame];
  [(AAUIProfilePhotoView *)self frame];
  double v4 = v3;
  [(AAUIProfilePhotoView *)self frame];
  double v6 = v5;
  -[UIImageView setFrame:](self->_photoView, "setFrame:", 0.0, 0.0, v4, v5);
  if (self->_isEditing)
  {
    [(UIButton *)self->_editButton sizeToFit];
    [(UIButton *)self->_editButton frame];
    double v8 = v7;
    double v10 = v9;
    [(AAUIProfilePhotoView *)self frame];
    -[UIButton setFrame:](self->_editButton, "setFrame:", ceil((v11 - v8) * 0.5), v6 + 0.0, v8, v10);
  }
}

- (double)desiredHeightForWidth:(double)result
{
  if (self->_isEditing) {
    return result + 30.0;
  }
  return result;
}

- (UIImage)photo
{
  return [(UIImageView *)self->_photoView image];
}

- (void)setPhoto:(id)a3
{
}

- (BOOL)isEditing
{
  return self->_isEditing;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_photoView, 0);
}

@end