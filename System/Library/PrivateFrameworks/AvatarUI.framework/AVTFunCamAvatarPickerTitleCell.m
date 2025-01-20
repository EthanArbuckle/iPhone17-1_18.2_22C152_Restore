@interface AVTFunCamAvatarPickerTitleCell
+ (id)cellIdentifier;
- (AVTFunCamAvatarPickerTitleCell)initWithFrame:(CGRect)a3;
- (UILabel)titleLabel;
- (void)prepareForReuse;
- (void)updateWithTitle:(id)a3;
@end

@implementation AVTFunCamAvatarPickerTitleCell

+ (id)cellIdentifier
{
  return @"AVTFunCamAvatarPickerTitleCell";
}

- (AVTFunCamAvatarPickerTitleCell)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)AVTFunCamAvatarPickerTitleCell;
  v3 = -[AVTFunCamAvatarPickerTitleCell initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x263F1C768]);
    [(AVTFunCamAvatarPickerTitleCell *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    titleLabel = v3->_titleLabel;
    v3->_titleLabel = (UILabel *)v5;

    v7 = +[AVTUIFontRepository funCamItemTitleFont];
    [(UILabel *)v3->_titleLabel setFont:v7];

    v8 = [MEMORY[0x263F1C550] whiteColor];
    [(UILabel *)v3->_titleLabel setTextColor:v8];

    [(UILabel *)v3->_titleLabel setTextAlignment:1];
    [(UILabel *)v3->_titleLabel setAutoresizingMask:18];
    v9 = [(AVTFunCamAvatarPickerTitleCell *)v3 contentView];
    [v9 addSubview:v3->_titleLabel];
  }
  return v3;
}

- (void)updateWithTitle:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVTFunCamAvatarPickerTitleCell *)self titleLabel];
  [v5 setText:v4];

  [(AVTFunCamAvatarPickerTitleCell *)self setNeedsLayout];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)AVTFunCamAvatarPickerTitleCell;
  [(AVTFunCamAvatarPickerTitleCell *)&v4 prepareForReuse];
  v3 = [(AVTFunCamAvatarPickerTitleCell *)self titleLabel];
  [v3 setText:0];
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void).cxx_destruct
{
}

@end