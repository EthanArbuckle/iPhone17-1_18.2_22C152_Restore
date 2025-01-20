@interface FBKDeviceDisplayCell
+ (id)reuseIdentifier;
- (NSString)itemIdentifier;
- (UIImageView)deviceIcon;
- (UILabel)nameLabel;
- (UILabel)typeLabel;
- (double)horizontalFrameInset;
- (double)spaceFromSuperViewToLabel;
- (void)awakeFromNib;
- (void)configureSelected:(BOOL)a3;
- (void)didTapConnectionButton:(id)a3;
- (void)layoutSubviews;
- (void)setDeviceIcon:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHorizontalFrameInset:(double)a3;
- (void)setItemIdentifier:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setTypeLabel:(id)a3;
- (void)updateNumberOfLines;
- (void)updateWithDevice:(id)a3;
@end

@implementation FBKDeviceDisplayCell

- (double)spaceFromSuperViewToLabel
{
  v2 = [(FBKDeviceDisplayCell *)self nameLabel];
  [v2 frame];
  double v4 = v3;

  return v4;
}

- (void)awakeFromNib
{
  v9.receiver = self;
  v9.super_class = (Class)FBKDeviceDisplayCell;
  [(FBKDeviceDisplayCell *)&v9 awakeFromNib];
  double v3 = [(FBKDeviceDisplayCell *)self nameLabel];
  [v3 setText:&stru_26DDF6A30];

  double v4 = [MEMORY[0x263F825C8] labelColor];
  v5 = [(FBKDeviceDisplayCell *)self nameLabel];
  [v5 setTextColor:v4];

  v6 = [(FBKDeviceDisplayCell *)self typeLabel];
  [v6 setText:&stru_26DDF6A30];

  v7 = [MEMORY[0x263F825C8] secondaryLabelColor];
  v8 = [(FBKDeviceDisplayCell *)self typeLabel];
  [v8 setTextColor:v7];

  [(FBKDeviceDisplayCell *)self setSelectionStyle:0];
  [(FBKDeviceDisplayCell *)self setHorizontalFrameInset:0.0];
}

+ (id)reuseIdentifier
{
  v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (void)setFrame:(CGRect)a3
{
  double horizontalFrameInset = self->_horizontalFrameInset;
  double v4 = a3.size.width + horizontalFrameInset * -2.0;
  BOOL v5 = horizontalFrameInset == 0.0;
  if (horizontalFrameInset == 0.0) {
    double horizontalFrameInset = -0.0;
  }
  double v6 = a3.origin.x + horizontalFrameInset;
  if (!v5) {
    a3.size.width = v4;
  }
  v7.receiver = self;
  v7.super_class = (Class)FBKDeviceDisplayCell;
  -[FBKDeviceDisplayCell setFrame:](&v7, sel_setFrame_, v6, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)didTapConnectionButton:(id)a3
{
}

- (void)updateWithDevice:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 displayName];
  double v6 = [(FBKDeviceDisplayCell *)self nameLabel];
  [v6 setText:v5];

  objc_super v7 = [v4 displayType];
  v8 = [(FBKDeviceDisplayCell *)self typeLabel];
  [v8 setText:v7];

  objc_super v9 = [MEMORY[0x263F82B60] mainScreen];
  [v9 scale];
  *(float *)&double v10 = v10;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __41__FBKDeviceDisplayCell_updateWithDevice___block_invoke;
  v11[3] = &unk_264874DD8;
  v11[4] = self;
  [v4 fetchIconImageDataForScale:v11 completionCompletion:v10];

  [(FBKDeviceDisplayCell *)self updateNumberOfLines];
}

uint64_t __41__FBKDeviceDisplayCell_updateWithDevice___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2)
  {
    uint64_t v2 = result;
    double v3 = [MEMORY[0x263F827E8] imageWithData:a2];
    id v4 = [*(id *)(v2 + 32) deviceIcon];
    [v4 setImage:v3];

    BOOL v5 = *(void **)(v2 + 32);
    return [v5 setNeedsDisplay];
  }
  return result;
}

- (void)configureSelected:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = 0;
  }
  [(FBKDeviceDisplayCell *)self setAccessoryType:v3];
}

- (void)updateNumberOfLines
{
  uint64_t v3 = [(FBKDeviceDisplayCell *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];
  BOOL IsAccessibilityCategory = UIContentSizeCategoryIsAccessibilityCategory(v4);

  double v6 = [(FBKDeviceDisplayCell *)self nameLabel];
  [v6 setNumberOfLines:!IsAccessibilityCategory];

  id v7 = [(FBKDeviceDisplayCell *)self typeLabel];
  [v7 setNumberOfLines:!IsAccessibilityCategory];
}

- (void)layoutSubviews
{
  [(FBKDeviceDisplayCell *)self updateNumberOfLines];
  v3.receiver = self;
  v3.super_class = (Class)FBKDeviceDisplayCell;
  [(FBKDeviceDisplayCell *)&v3 layoutSubviews];
}

- (NSString)itemIdentifier
{
  return self->itemIdentifier;
}

- (void)setItemIdentifier:(id)a3
{
}

- (double)horizontalFrameInset
{
  return self->_horizontalFrameInset;
}

- (void)setHorizontalFrameInset:(double)a3
{
  self->_double horizontalFrameInset = a3;
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)typeLabel
{
  return self->_typeLabel;
}

- (void)setTypeLabel:(id)a3
{
}

- (UIImageView)deviceIcon
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_deviceIcon);

  return (UIImageView *)WeakRetained;
}

- (void)setDeviceIcon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_deviceIcon);
  objc_storeStrong((id *)&self->_typeLabel, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->itemIdentifier, 0);
}

@end