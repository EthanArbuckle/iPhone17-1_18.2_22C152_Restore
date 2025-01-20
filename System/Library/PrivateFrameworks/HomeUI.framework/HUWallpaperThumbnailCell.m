@interface HUWallpaperThumbnailCell
- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4;
- (CGSize)imageSize;
- (HUWallpaperThumbnailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (HUWallpaperThumbnailCellDelegate)delegate;
- (NSLayoutConstraint)imageHeightConstraint;
- (NSLayoutConstraint)imageWidthConstraint;
- (UIDropInteraction)dropInteraction;
- (UIImage)image;
- (UIImageView)imageThumbnailView;
- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4;
- (int64_t)contentMode;
- (void)dropInteraction:(id)a3 performDrop:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4;
- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4;
- (void)prepareForReuse;
- (void)setContentMode:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDropInteraction:(id)a3;
- (void)setImage:(id)a3;
- (void)setImageHeightConstraint:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setImageThumbnailView:(id)a3;
- (void)setImageWidthConstraint:(id)a3;
@end

@implementation HUWallpaperThumbnailCell

- (HUWallpaperThumbnailCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v52.receiver = self;
  v52.super_class = (Class)HUWallpaperThumbnailCell;
  v4 = [(HUWallpaperThumbnailCell *)&v52 initWithStyle:0 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    p_width = &v4->_imageSize.width;
    v4->_imageSize = (CGSize)vdupq_n_s64(0x4049000000000000uLL);
    v4->_contentMode = 2;
    id v7 = objc_alloc(MEMORY[0x1E4F42AA0]);
    uint64_t v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    imageThumbnailView = v5->_imageThumbnailView;
    v5->_imageThumbnailView = (UIImageView *)v8;

    [(UIImageView *)v5->_imageThumbnailView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v5->_imageThumbnailView setContentMode:v5->_contentMode];
    [(UIImageView *)v5->_imageThumbnailView setClipsToBounds:1];
    v10 = [(HUWallpaperThumbnailCell *)v5 contentView];
    [v10 addSubview:v5->_imageThumbnailView];

    v11 = [MEMORY[0x1E4F1CA48] array];
    v12 = [(UIImageView *)v5->_imageThumbnailView centerXAnchor];
    v13 = [(HUWallpaperThumbnailCell *)v5 contentView];
    v14 = [v13 layoutMarginsGuide];
    v15 = [v14 centerXAnchor];
    v16 = [v12 constraintEqualToAnchor:v15];
    [v11 addObject:v16];

    v17 = [(UIImageView *)v5->_imageThumbnailView leadingAnchor];
    v18 = [(HUWallpaperThumbnailCell *)v5 contentView];
    v19 = [v18 layoutMarginsGuide];
    v20 = [v19 leadingAnchor];
    v21 = [v17 constraintGreaterThanOrEqualToAnchor:v20];
    [v11 addObject:v21];

    v22 = [(UIImageView *)v5->_imageThumbnailView trailingAnchor];
    v23 = [(HUWallpaperThumbnailCell *)v5 contentView];
    v24 = [v23 layoutMarginsGuide];
    v25 = [v24 trailingAnchor];
    v26 = [v22 constraintLessThanOrEqualToAnchor:v25];
    [v11 addObject:v26];

    v27 = [(UIImageView *)v5->_imageThumbnailView heightAnchor];
    uint64_t v28 = [v27 constraintEqualToConstant:v5->_imageSize.height];
    imageHeightConstraint = v5->_imageHeightConstraint;
    v5->_imageHeightConstraint = (NSLayoutConstraint *)v28;

    LODWORD(v30) = 1144750080;
    [(NSLayoutConstraint *)v5->_imageHeightConstraint setPriority:v30];
    [v11 addObject:v5->_imageHeightConstraint];
    v31 = [(UIImageView *)v5->_imageThumbnailView widthAnchor];
    uint64_t v32 = [v31 constraintEqualToConstant:*p_width];
    imageWidthConstraint = v5->_imageWidthConstraint;
    v5->_imageWidthConstraint = (NSLayoutConstraint *)v32;

    [v11 addObject:v5->_imageWidthConstraint];
    v34 = [(UIImageView *)v5->_imageThumbnailView centerYAnchor];
    v35 = [(HUWallpaperThumbnailCell *)v5 contentView];
    v36 = [v35 layoutMarginsGuide];
    v37 = [v36 centerYAnchor];
    v38 = [v34 constraintEqualToAnchor:v37];
    [v11 addObject:v38];

    v39 = [(UIImageView *)v5->_imageThumbnailView topAnchor];
    v40 = [(HUWallpaperThumbnailCell *)v5 contentView];
    v41 = [v40 topAnchor];
    v42 = [v39 constraintGreaterThanOrEqualToAnchor:v41 constant:16.0];
    [v11 addObject:v42];

    v43 = [(UIImageView *)v5->_imageThumbnailView bottomAnchor];
    v44 = [(HUWallpaperThumbnailCell *)v5 contentView];
    v45 = [v44 bottomAnchor];
    v46 = [v43 constraintLessThanOrEqualToAnchor:v45 constant:16.0];
    [v11 addObject:v46];

    [MEMORY[0x1E4F28DC8] activateConstraints:v11];
    uint64_t v47 = [objc_alloc(MEMORY[0x1E4F429D0]) initWithDelegate:v5];
    dropInteraction = v5->_dropInteraction;
    v5->_dropInteraction = (UIDropInteraction *)v47;

    v49 = [(HUWallpaperThumbnailCell *)v5 contentView];
    v50 = [(HUWallpaperThumbnailCell *)v5 dropInteraction];
    [v49 addInteraction:v50];
  }
  return v5;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  id v4 = a4;
  char v5 = [v4 canLoadObjectsOfClass:objc_opt_class()];

  return v5;
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  id v4 = objc_msgSend(a4, "items", a3);
  BOOL v5 = (unint64_t)[v4 count] < 2;

  v6 = (void *)[objc_alloc(MEMORY[0x1E4F429D8]) initWithDropOperation:2 * v5];

  return v6;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  BOOL v5 = objc_msgSend(a4, "items", a3);
  v6 = [v5 firstObject];
  id v7 = [v6 itemProvider];
  uint64_t v8 = objc_opt_class();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__HUWallpaperThumbnailCell_dropInteraction_performDrop___block_invoke;
  v10[3] = &unk_1E63864A0;
  v10[4] = self;
  id v9 = (id)[v7 loadObjectOfClass:v8 completionHandler:v10];
}

void __56__HUWallpaperThumbnailCell_dropInteraction_performDrop___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) delegate];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __56__HUWallpaperThumbnailCell_dropInteraction_performDrop___block_invoke_2;
      v7[3] = &unk_1E63850E0;
      v7[4] = *(void *)(a1 + 32);
      id v8 = v3;
      dispatch_async(MEMORY[0x1E4F14428], v7);
    }
  }
}

void __56__HUWallpaperThumbnailCell_dropInteraction_performDrop___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 wallpaperThumbnailCell:*(void *)(a1 + 32) didReceiveDroppedImage:*(void *)(a1 + 40)];
}

- (void)dropInteraction:(id)a3 sessionDidEnter:(id)a4
{
  BOOL v5 = objc_msgSend(a4, "items", a3);
  uint64_t v6 = [v5 count];

  if (v6 == 1)
  {
    [(HUWallpaperThumbnailCell *)self setSelected:1 animated:1];
  }
}

- (void)dropInteraction:(id)a3 sessionDidEnd:(id)a4
{
}

- (void)dropInteraction:(id)a3 sessionDidExit:(id)a4
{
}

- (void)prepareForReuse
{
  v3.receiver = self;
  v3.super_class = (Class)HUWallpaperThumbnailCell;
  [(HUWallpaperThumbnailCell *)&v3 prepareForReuse];
  [(HUWallpaperThumbnailCell *)self setImage:0];
  -[HUWallpaperThumbnailCell setImageSize:](self, "setImageSize:", 50.0, 50.0);
}

- (void)setImageSize:(CGSize)a3
{
  double height = a3.height;
  p_imageSize = &self->_imageSize;
  self->_imageSize = a3;
  uint64_t v6 = [(HUWallpaperThumbnailCell *)self imageHeightConstraint];
  [v6 setConstant:height];

  double width = p_imageSize->width;
  id v8 = [(HUWallpaperThumbnailCell *)self imageWidthConstraint];
  [v8 setConstant:width];
}

- (UIImage)image
{
  id v2 = [(HUWallpaperThumbnailCell *)self imageThumbnailView];
  objc_super v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(HUWallpaperThumbnailCell *)self imageThumbnailView];
  [v5 setImage:v4];
}

- (void)setContentMode:(int64_t)a3
{
  self->_contentMode = a3;
  id v4 = [(HUWallpaperThumbnailCell *)self imageThumbnailView];
  [v4 setContentMode:a3];
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)contentMode
{
  return self->_contentMode;
}

- (HUWallpaperThumbnailCellDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUWallpaperThumbnailCellDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIImageView)imageThumbnailView
{
  return self->_imageThumbnailView;
}

- (void)setImageThumbnailView:(id)a3
{
}

- (NSLayoutConstraint)imageWidthConstraint
{
  return self->_imageWidthConstraint;
}

- (void)setImageWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)imageHeightConstraint
{
  return self->_imageHeightConstraint;
}

- (void)setImageHeightConstraint:(id)a3
{
}

- (UIDropInteraction)dropInteraction
{
  return self->_dropInteraction;
}

- (void)setDropInteraction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dropInteraction, 0);
  objc_storeStrong((id *)&self->_imageHeightConstraint, 0);
  objc_storeStrong((id *)&self->_imageWidthConstraint, 0);
  objc_storeStrong((id *)&self->_imageThumbnailView, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end