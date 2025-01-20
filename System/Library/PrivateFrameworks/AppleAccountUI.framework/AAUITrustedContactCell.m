@interface AAUITrustedContactCell
- (AAUITrustedContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (void)updateWithContact:(id)a3 pictureStore:(id)a4;
@end

@implementation AAUITrustedContactCell

- (AAUITrustedContactCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)AAUITrustedContactCell;
  v4 = [(AAUITrustedContactCell *)&v9 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    [(AAUITrustedContactCell *)v4 setSelectionStyle:0];
    v6 = [(AAUITrustedContactCell *)v5 imageView];
    [v6 setContentMode:4];

    v7 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
    [(AAUITrustedContactCell *)v5 setBackgroundColor:v7];
  }
  return v5;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  v7.receiver = self;
  v7.super_class = (Class)AAUITrustedContactCell;
  -[AAUITrustedContactCell systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:](&v7, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, a3.width, a3.height);
  if (v6 < 58.0) {
    double v6 = 58.0;
  }
  result.height = v6;
  result.width = v5;
  return result;
}

- (void)updateWithContact:(id)a3 pictureStore:(id)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  objc_super v7 = [MEMORY[0x263F82918] subtitleCellConfiguration];
  v8 = [MEMORY[0x263F81708] _preferredFontForTextStyle:*MEMORY[0x263F83570] weight:*MEMORY[0x263F81840]];
  id v9 = objc_alloc(MEMORY[0x263F086A0]);
  v10 = [v5 displayName];
  uint64_t v11 = *MEMORY[0x263F814F0];
  uint64_t v30 = *MEMORY[0x263F814F0];
  v31[0] = v8;
  v12 = [NSDictionary dictionaryWithObjects:v31 forKeys:&v30 count:1];
  v13 = (void *)[v9 initWithString:v10 attributes:v12];

  [v7 setAttributedText:v13];
  v14 = [v5 detailsText];
  uint64_t v15 = [v14 length];

  if (v15)
  {
    v16 = [v5 detailsText];
  }
  else
  {
    v17 = [v5 displayName];
    v18 = [v5 handle];
    char v19 = [v17 isEqualToString:v18];

    if (v19)
    {
      v16 = 0;
    }
    else
    {
      v16 = [v5 handle];
    }
  }
  if (objc_msgSend(v16, "length", self))
  {
    v20 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835B8]];
    v28[0] = *MEMORY[0x263F81500];
    v21 = [MEMORY[0x263F825C8] secondaryLabelColor];
    v28[1] = v11;
    v29[0] = v21;
    v29[1] = v20;
    v22 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:2];

    v23 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v16 attributes:v22];
    [v7 setSecondaryAttributedText:v23];
  }
  v24 = [v6 profilePictureForLocalContact:v5];
  v25 = objc_msgSend(v24, "imageByPreparingThumbnailOfSize:", 40.0, 40.0);
  [v7 setImage:v25];

  [v27 setContentConfiguration:v7];
}

@end