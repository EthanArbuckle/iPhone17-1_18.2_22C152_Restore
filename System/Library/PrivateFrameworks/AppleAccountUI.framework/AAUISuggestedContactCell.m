@interface AAUISuggestedContactCell
- (AAUISuggestedContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)updateWithContact:(id)a3 pictureStore:(id)a4;
@end

@implementation AAUISuggestedContactCell

- (AAUISuggestedContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)AAUISuggestedContactCell;
  v4 = [(AAUISuggestedContactCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];
  if (v4)
  {
    uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x263F82828]), "initWithFrame:", 0.0, 0.0, 24.0, 24.0);
    accessoryImageView = v4->_accessoryImageView;
    v4->_accessoryImageView = (UIImageView *)v5;

    v7 = [MEMORY[0x263F827E8] systemImageNamed:@"circle"];
    [(UIImageView *)v4->_accessoryImageView setImage:v7];

    v8 = [MEMORY[0x263F825C8] systemGray3Color];
    [(UIImageView *)v4->_accessoryImageView setTintColor:v8];

    [(UIImageView *)v4->_accessoryImageView setContentMode:1];
    [(AAUISuggestedContactCell *)v4 setAccessoryView:v4->_accessoryImageView];
    [(AAUISuggestedContactCell *)v4 setSelectionStyle:0];
    v9 = [(AAUISuggestedContactCell *)v4 imageView];
    [v9 setContentMode:4];

    v10 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
    [(AAUISuggestedContactCell *)v4 setBackgroundColor:v10];
  }
  return v4;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v7.receiver = self;
  v7.super_class = (Class)AAUISuggestedContactCell;
  -[AAUISuggestedContactCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v7, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, a3.width, a3.height);
  if (v6 < 58.0) {
    double v6 = 58.0;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)updateWithContact:(id)a3 pictureStore:(id)a4
{
  v29[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [MEMORY[0x263F82918] subtitleCellConfiguration];
  v8 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83570] weight:*MEMORY[0x263F81840]];
  id v9 = objc_alloc(MEMORY[0x263F086A0]);
  v10 = [v5 displayName];
  uint64_t v11 = *MEMORY[0x263F814F0];
  uint64_t v28 = *MEMORY[0x263F814F0];
  v29[0] = v8;
  objc_super v12 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
  v13 = (void *)[v9 initWithString:v10 attributes:v12];

  [v7 setAttributedText:v13];
  v14 = [v5 detailsText];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    v26[0] = *MEMORY[0x263F81500];
    v17 = [MEMORY[0x263F825C8] secondaryLabelColor];
    v26[1] = v11;
    v27[0] = v17;
    v27[1] = v16;
    v18 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];

    id v19 = objc_alloc(MEMORY[0x263F086A0]);
    v20 = [v5 detailsText];
    v21 = (void *)[v19 initWithString:v20 attributes:v18];

    [v7 setSecondaryAttributedText:v21];
  }
  v22 = objc_msgSend(v6, "profilePictureForLocalContact:", v5, self);
  v23 = objc_msgSend(v22, "imageByPreparingThumbnailOfSize:", 40.0, 40.0);
  [v7 setImage:v23];

  [v25 setContentConfiguration:v7];
}

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AAUISuggestedContactCell;
  [(AAUISuggestedContactCell *)&v10 setSelected:a3 animated:a4];
  if (v4)
  {
    id v6 = [MEMORY[0x263F827E8] systemImageNamed:@"checkmark.circle.fill"];
    p_accessoryImageView = &self->_accessoryImageView;
    [(UIImageView *)self->_accessoryImageView setImage:v6];

    [MEMORY[0x263F825C8] linkColor];
  }
  else
  {
    v8 = [MEMORY[0x263F827E8] systemImageNamed:@"circle"];
    p_accessoryImageView = &self->_accessoryImageView;
    [(UIImageView *)self->_accessoryImageView setImage:v8];

    [MEMORY[0x263F825C8] systemGray4Color];
  id v9 = };
  [(UIImageView *)*p_accessoryImageView setTintColor:v9];
}

- (void).cxx_destruct
{
}

@end