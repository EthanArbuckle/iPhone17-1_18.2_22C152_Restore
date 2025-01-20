@interface MFPhotoPickerCell
+ (NSString)reusableIdentifier;
- (MFPhotoPickerCell)initWithFrame:(CGRect)a3;
- (MFRoundProgressView)progressView;
- (NSString)representedAssetIdentifier;
- (UIImage)thumbnailImage;
- (UIImageView)imageView;
- (UIImageView)mediaTypeBadgeView;
- (UIImageView)selectedBadgeView;
- (int64_t)mediaType;
- (void)prepareForReuse;
- (void)resetProgress;
- (void)setImageView:(id)a3;
- (void)setMediaType:(int64_t)a3;
- (void)setMediaTypeBadgeView:(id)a3;
- (void)setProgress:(double)a3;
- (void)setProgressView:(id)a3;
- (void)setRepresentedAssetIdentifier:(id)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectedBadgeView:(id)a3;
- (void)setThumbnailImage:(id)a3;
@end

@implementation MFPhotoPickerCell

+ (NSString)reusableIdentifier
{
  return (NSString *)@"PhotoPickerCellIdentifier";
}

- (MFPhotoPickerCell)initWithFrame:(CGRect)a3
{
  v54[8] = *MEMORY[0x1E4F143B8];
  v53.receiver = self;
  v53.super_class = (Class)MFPhotoPickerCell;
  v3 = -[MFPhotoPickerCell initWithFrame:](&v53, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    [(MFPhotoPickerCell *)v3 bounds];
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:");
    imageView = v3->_imageView;
    v3->_imageView = (UIImageView *)v5;

    [(UIImageView *)v3->_imageView setContentMode:2];
    [(UIImageView *)v3->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v3->_imageView setClipsToBounds:1];
    id v7 = objc_alloc(MEMORY[0x1E4FB1838]);
    double v8 = *MEMORY[0x1E4F1DB28];
    double v9 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    uint64_t v12 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], v9, v10, v11);
    mediaTypeBadgeView = v3->_mediaTypeBadgeView;
    v3->_mediaTypeBadgeView = (UIImageView *)v12;

    [(UIImageView *)v3->_mediaTypeBadgeView setContentMode:1];
    [(UIImageView *)v3->_mediaTypeBadgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    v14 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIImageView *)v3->_mediaTypeBadgeView setTintColor:v14];

    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4FB1838]), "initWithFrame:", v8, v9, v10, v11);
    selectedBadgeView = v3->_selectedBadgeView;
    v3->_selectedBadgeView = (UIImageView *)v15;

    id v17 = objc_alloc(MEMORY[0x1E4FB1818]);
    v18 = [MEMORY[0x1E4FB1618] mailInteractiveColor];
    v19 = [MEMORY[0x1E4FB1618] whiteColor];
    v20 = (void *)[v17 _initWithFilledSystemImageNamed:@"checkmark.circle" fillColor:v18 symbolColor:v19];
    [(UIImageView *)v3->_selectedBadgeView setImage:v20];

    [(UIImageView *)v3->_selectedBadgeView setContentMode:1];
    [(UIImageView *)v3->_selectedBadgeView setTranslatesAutoresizingMaskIntoConstraints:0];
    v21 = [(MFPhotoPickerCell *)v3 contentView];
    [v21 addSubview:v3->_imageView];

    v22 = [(MFPhotoPickerCell *)v3 contentView];
    [v22 addSubview:v3->_mediaTypeBadgeView];

    v23 = [(MFPhotoPickerCell *)v3 contentView];
    [v23 addSubview:v3->_selectedBadgeView];

    v24 = v3->_imageView;
    v25 = [(MFPhotoPickerCell *)v3 contentView];
    [(UIImageView *)v24 mf_pinToView:v25 usingLayoutMargins:0];

    v26 = (void *)MEMORY[0x1E4F28DC8];
    v50 = [(UIImageView *)v3->_mediaTypeBadgeView widthAnchor];
    v49 = [v50 constraintEqualToConstant:24.0];
    v54[0] = v49;
    v48 = [(UIImageView *)v3->_mediaTypeBadgeView heightAnchor];
    v47 = [v48 constraintEqualToConstant:24.0];
    v54[1] = v47;
    v52 = [(UIImageView *)v3->_mediaTypeBadgeView leadingAnchor];
    v46 = [(MFPhotoPickerCell *)v3 contentView];
    v45 = [v46 leadingAnchor];
    v44 = objc_msgSend(v52, "constraintEqualToAnchor:constant:", 2.0);
    v54[2] = v44;
    v43 = [(MFPhotoPickerCell *)v3 contentView];
    v51 = [v43 bottomAnchor];
    v42 = [(UIImageView *)v3->_mediaTypeBadgeView bottomAnchor];
    v41 = objc_msgSend(v51, "constraintEqualToAnchor:constant:", 2.0);
    v54[3] = v41;
    v40 = [(UIImageView *)v3->_selectedBadgeView widthAnchor];
    v39 = [v40 constraintEqualToConstant:24.0];
    v54[4] = v39;
    v38 = [(UIImageView *)v3->_selectedBadgeView heightAnchor];
    v37 = [v38 constraintEqualToConstant:24.0];
    v54[5] = v37;
    v36 = [(MFPhotoPickerCell *)v3 contentView];
    v27 = [v36 trailingAnchor];
    v28 = [(UIImageView *)v3->_selectedBadgeView trailingAnchor];
    v29 = [v27 constraintEqualToAnchor:v28 constant:2.0];
    v54[6] = v29;
    v30 = [(MFPhotoPickerCell *)v3 contentView];
    v31 = [v30 bottomAnchor];
    v32 = [(UIImageView *)v3->_selectedBadgeView bottomAnchor];
    v33 = [v31 constraintEqualToAnchor:v32 constant:2.0];
    v54[7] = v33;
    v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:8];
    [v26 activateConstraints:v34];
  }
  return v3;
}

- (void)setProgress:(double)a3
{
  id v4 = [(MFPhotoPickerCell *)self progressView];
  [v4 setProgress:a3];
  [v4 setHidden:a3 >= 1.0];
}

- (void)resetProgress
{
  v3 = [(MFPhotoPickerCell *)self progressView];
  [v3 removeFromSuperview];

  [(MFPhotoPickerCell *)self setProgressView:0];
}

- (MFRoundProgressView)progressView
{
  p_progressView = &self->_progressView;
  id v4 = self->_progressView;
  if (!v4)
  {
    [(MFPhotoPickerCell *)self frame];
    id v4 = -[MFRoundProgressView initWithFrame:]([MFRoundProgressView alloc], "initWithFrame:", v6 * 0.5 + -12.5, v5 * 0.5 + -12.5, 25.0, 25.0);
    id v7 = [(MFPhotoPickerCell *)self contentView];
    [v7 addSubview:v4];

    objc_storeStrong((id *)p_progressView, v4);
  }

  return v4;
}

- (void)setThumbnailImage:(id)a3
{
  double v5 = (UIImage *)a3;
  if (self->_thumbnailImage != v5)
  {
    id v7 = v5;
    objc_storeStrong((id *)&self->_thumbnailImage, a3);
    double v6 = [(MFPhotoPickerCell *)self imageView];
    [v6 setImage:v7];

    double v5 = v7;
  }
}

- (void)setMediaType:(int64_t)a3
{
  self->_mediaType = a3;
  if (a3 == 1)
  {
    id v5 = [MEMORY[0x1E4FB1818] systemImageNamed:@"video.fill"];
    id v4 = [(MFPhotoPickerCell *)self mediaTypeBadgeView];
    [v4 setImage:v5];
  }
}

- (void)setSelected:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFPhotoPickerCell;
  -[MFPhotoPickerCell setSelected:](&v7, sel_setSelected_);
  BOOL v5 = !v3;
  double v6 = [(MFPhotoPickerCell *)self selectedBadgeView];
  [v6 setHidden:v5];
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)MFPhotoPickerCell;
  [(MFPhotoPickerCell *)&v5 prepareForReuse];
  BOOL v3 = [(MFPhotoPickerCell *)self imageView];
  [v3 setImage:0];

  id v4 = [(MFPhotoPickerCell *)self mediaTypeBadgeView];
  [v4 setImage:0];

  [(MFPhotoPickerCell *)self setSelected:0];
  [(MFPhotoPickerCell *)self resetProgress];
}

- (NSString)representedAssetIdentifier
{
  return self->_representedAssetIdentifier;
}

- (void)setRepresentedAssetIdentifier:(id)a3
{
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (int64_t)mediaType
{
  return self->_mediaType;
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (UIImageView)mediaTypeBadgeView
{
  return self->_mediaTypeBadgeView;
}

- (void)setMediaTypeBadgeView:(id)a3
{
}

- (UIImageView)selectedBadgeView
{
  return self->_selectedBadgeView;
}

- (void)setSelectedBadgeView:(id)a3
{
}

- (void)setProgressView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_selectedBadgeView, 0);
  objc_storeStrong((id *)&self->_mediaTypeBadgeView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);

  objc_storeStrong((id *)&self->_representedAssetIdentifier, 0);
}

@end