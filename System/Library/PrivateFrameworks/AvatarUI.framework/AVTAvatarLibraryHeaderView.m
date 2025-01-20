@interface AVTAvatarLibraryHeaderView
+ (id)reuseIdentifier;
- (AVTAvatarLibraryHeaderView)initWithFrame:(CGRect)a3;
- (UILabel)titleLabel;
@end

@implementation AVTAvatarLibraryHeaderView

- (AVTAvatarLibraryHeaderView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)AVTAvatarLibraryHeaderView;
  v3 = -[AVTAvatarLibraryHeaderView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(AVTAvatarLibraryHeaderView *)v3 bounds];
    CGFloat x = v16.origin.x;
    CGFloat y = v16.origin.y;
    CGFloat width = v16.size.width;
    CGFloat height = v16.size.height;
    CGFloat v9 = CGRectGetWidth(v16) + -20.0;
    v17.origin.CGFloat x = x;
    v17.origin.CGFloat y = y;
    v17.size.CGFloat width = width;
    v17.size.CGFloat height = height;
    uint64_t v10 = objc_msgSend(objc_alloc(MEMORY[0x263F1C768]), "initWithFrame:", 10.0, 0.0, v9, CGRectGetHeight(v17));
    titleLabel = v4->_titleLabel;
    v4->_titleLabel = (UILabel *)v10;

    [(UILabel *)v4->_titleLabel setAutoresizingMask:18];
    v12 = v4->_titleLabel;
    v13 = [MEMORY[0x263F1C658] systemFontOfSize:10.0];
    [(UILabel *)v12 setFont:v13];

    [(UILabel *)v4->_titleLabel setTextAlignment:1];
    [(AVTAvatarLibraryHeaderView *)v4 addSubview:v4->_titleLabel];
  }
  return v4;
}

+ (id)reuseIdentifier
{
  return @"libraryHeader";
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
}

@end