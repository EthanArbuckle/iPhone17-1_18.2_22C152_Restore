@interface QLListCell
+ (id)listCell;
- (NSString)folderName;
- (NSString)subtitleString;
- (QLItem)item;
- (UIImage)thumbnail;
- (id)_folderImage;
- (int64_t)fileDepthLevel;
- (unint64_t)row;
- (void)awakeFromNib;
- (void)prepareForReuse;
- (void)setFileDepthLevel:(int64_t)a3;
- (void)setFolderName:(id)a3;
- (void)setItem:(id)a3;
- (void)setRow:(unint64_t)a3;
- (void)setSubtitleString:(id)a3;
- (void)setThumbnail:(id)a3;
@end

@implementation QLListCell

+ (id)listCell
{
  v3 = QLFrameworkBundle();
  v4 = [v3 loadNibNamed:@"QLListCell" owner:a1 options:0];
  v5 = [v4 firstObject];

  return v5;
}

- (void)awakeFromNib
{
  v13.receiver = self;
  v13.super_class = (Class)QLListCell;
  [(QLListCell *)&v13 awakeFromNib];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  [WeakRetained setContentMode:4];

  v4 = [MEMORY[0x263F825C8] labelColor];
  id v5 = objc_loadWeakRetained((id *)&self->_title);
  [v5 setTextColor:v4];

  v6 = [MEMORY[0x263F825C8] secondaryLabelColor];
  id v7 = objc_loadWeakRetained((id *)&self->_subtitle);
  [v7 setTextColor:v6];

  id v8 = objc_loadWeakRetained((id *)&self->_title);
  [v8 setAdjustsFontSizeToFitWidth:1];

  id v9 = objc_loadWeakRetained((id *)&self->_title);
  [v9 setMinimumScaleFactor:0.7];

  id v10 = objc_loadWeakRetained((id *)&self->_subtitle);
  [v10 setAdjustsFontSizeToFitWidth:1];

  id v11 = objc_loadWeakRetained((id *)&self->_subtitle);
  [v11 setMinimumScaleFactor:0.7];

  id v12 = objc_loadWeakRetained((id *)&self->_leftConstraint);
  [v12 setConstant:15.0];

  [(QLListCell *)self setIndentationWidth:15.0];
}

- (void)prepareForReuse
{
  v9.receiver = self;
  v9.super_class = (Class)QLListCell;
  [(QLListCell *)&v9 prepareForReuse];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_subtitle);
  [WeakRetained setText:&stru_26C8FAD38];

  id v4 = objc_loadWeakRetained((id *)&self->_title);
  [v4 setText:&stru_26C8FAD38];

  id v5 = objc_loadWeakRetained((id *)&self->_thumbnailView);
  [v5 setImage:0];

  item = self->_item;
  self->_item = 0;

  folderName = self->_folderName;
  self->_folderName = 0;

  self->_fileDepthLevel = 0;
  id v8 = objc_loadWeakRetained((id *)&self->_leftConstraint);
  [v8 setConstant:15.0];
}

- (id)_folderImage
{
  if (_folderImage_onceToken != -1) {
    dispatch_once(&_folderImage_onceToken, &__block_literal_global_11);
  }
  v2 = (void *)_folderImage__folderImage;

  return v2;
}

void __26__QLListCell__folderImage__block_invoke()
{
  v0 = (void *)MEMORY[0x263F827E8];
  QLFrameworkBundle();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 imageNamed:@"folder" inBundle:v3 compatibleWithTraitCollection:0];
  v2 = (void *)_folderImage__folderImage;
  _folderImage__folderImage = v1;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
  id v5 = a3;
  id v7 = [v5 previewItemTitle];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_title);
  [WeakRetained setText:v7];
}

- (void)setSubtitleString:(id)a3
{
  id v4 = a3;
  id v5 = (NSString *)[v4 copy];
  subtitleString = self->_subtitleString;
  self->_subtitleString = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_subtitle);
  [WeakRetained setText:v4];
}

- (void)setThumbnail:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnail, a3);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_thumbnailView);
  [WeakRetained setImage:v5];
}

- (void)setFileDepthLevel:(int64_t)a3
{
  self->_fileDepthLevel = a3;
  double v4 = (double)a3;
  [(QLListCell *)self indentationWidth];
  double v6 = v4 * v5 + 15.0;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_leftConstraint);
  [WeakRetained setConstant:v6];

  [(QLListCell *)self setNeedsLayout];
}

- (void)setFolderName:(id)a3
{
  objc_storeStrong((id *)&self->_folderName, a3);
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_title);
  [WeakRetained setText:v5];

  id v7 = [(QLListCell *)self _folderImage];
  id v8 = objc_loadWeakRetained((id *)&self->_thumbnailView);
  [v8 setImage:v7];

  id v9 = objc_loadWeakRetained((id *)&self->_subtitle);
  [v9 setHidden:1];
}

- (QLItem)item
{
  return self->_item;
}

- (NSString)folderName
{
  return self->_folderName;
}

- (int64_t)fileDepthLevel
{
  return self->_fileDepthLevel;
}

- (NSString)subtitleString
{
  return self->_subtitleString;
}

- (UIImage)thumbnail
{
  return self->_thumbnail;
}

- (unint64_t)row
{
  return self->_row;
}

- (void)setRow:(unint64_t)a3
{
  self->_row = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnail, 0);
  objc_storeStrong((id *)&self->_subtitleString, 0);
  objc_storeStrong((id *)&self->_folderName, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_destroyWeak((id *)&self->_thumbnailView);
  objc_destroyWeak((id *)&self->_subtitle);
  objc_destroyWeak((id *)&self->_title);

  objc_destroyWeak((id *)&self->_leftConstraint);
}

@end