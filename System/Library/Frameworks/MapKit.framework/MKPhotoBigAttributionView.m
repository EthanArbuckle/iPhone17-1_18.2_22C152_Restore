@interface MKPhotoBigAttributionView
+ (id)bigAttributionViewForMapItem:(id)a3 attributionType:(int64_t)a4 isFirstParty:(BOOL)a5 context:(int64_t)a6;
- (MKMapItem)mapItem;
- (MKPhotoBigAttributionView)initWithContext:(int64_t)a3;
- (UIActivityIndicatorView)spinner;
- (UIView)contentView;
- (int64_t)context;
- (int64_t)type;
- (void)beginAnimatingActivityIndicator;
- (void)endAnimatingActivityIndicatorWithError:(id)a3;
- (void)layoutSubviews;
- (void)setMapItem:(id)a3;
- (void)setType:(int64_t)a3;
- (void)updateBackgroundIfNeeded;
@end

@implementation MKPhotoBigAttributionView

+ (id)bigAttributionViewForMapItem:(id)a3 attributionType:(int64_t)a4 isFirstParty:(BOOL)a5 context:(int64_t)a6
{
  v8 = off_1E54B7060;
  if (!a5) {
    v8 = off_1E54B74D8;
  }
  v9 = (objc_class *)*v8;
  id v10 = a3;
  v11 = (void *)[[v9 alloc] initWithContext:a6];
  [v11 setMapItem:v10];

  [v11 setType:a4];

  return v11;
}

- (MKPhotoBigAttributionView)initWithContext:(int64_t)a3
{
  v59[2] = *MEMORY[0x1E4F143B8];
  v57.receiver = self;
  v57.super_class = (Class)MKPhotoBigAttributionView;
  double v4 = *MEMORY[0x1E4F1DB28];
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v7 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  v8 = -[MKPhotoBigAttributionView initWithFrame:](&v57, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], v5, v6, v7);
  v9 = v8;
  if (v8)
  {
    v8->_needsImageLoad = 1;
    v8->_context = a3;
    id v10 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42AA0]), "initWithFrame:", v4, v5, v6, v7);
    [(MKPhotoBigAttributionView *)v9 setClipsToBounds:1];
    [(UIImageView *)v10 setClipsToBounds:1];
    [(UIImageView *)v10 setContentMode:2];
    imageView = v9->_imageView;
    v9->_imageView = v10;
    v53 = v10;

    [(UIImageView *)v9->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKPhotoBigAttributionView *)v9 addSubview:v9->_imageView];
    contentView = v9->_contentView;
    v9->_contentView = 0;

    v13 = (void *)MEMORY[0x1E4F43020];
    v14 = [MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.5];
    v56 = [v13 effectCompositingColor:v14];

    v55 = [MEMORY[0x1E4F427D8] effectWithBlurRadius:14.0];
    v15 = (void *)MEMORY[0x1E4F43020];
    v59[0] = v56;
    v59[1] = v55;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v59 count:2];
    v54 = [v15 effectCombiningEffects:v16];

    v17 = (UIView *)[objc_alloc(MEMORY[0x1E4F43028]) initWithEffect:v54];
    uint64_t v18 = [(UIView *)v17 contentView];
    v19 = v9->_contentView;
    v9->_contentView = (UIView *)v18;

    backgroundView = v9->_backgroundView;
    v9->_backgroundView = v17;
    v50 = v17;

    [(UIView *)v9->_backgroundView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(MKPhotoBigAttributionView *)v9 addSubview:v9->_backgroundView];
    uint64_t v21 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42708]), "initWithFrame:", v4, v5, v6, v7);
    spinner = v9->_spinner;
    v9->_spinner = (UIActivityIndicatorView *)v21;

    [(UIActivityIndicatorView *)v9->_spinner setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIActivityIndicatorView *)v9->_spinner setHidesWhenStopped:1];
    v23 = [MEMORY[0x1E4F428B8] whiteColor];
    [(UIActivityIndicatorView *)v9->_spinner setColor:v23];

    v24 = [(MKPhotoBigAttributionView *)v9 contentView];
    [v24 addSubview:v9->_spinner];

    v40 = (void *)MEMORY[0x1E4F28DC8];
    v52 = [(UIImageView *)v9->_imageView leadingAnchor];
    v51 = [(MKPhotoBigAttributionView *)v9 leadingAnchor];
    v49 = [v52 constraintEqualToAnchor:v51];
    v58[0] = v49;
    v48 = [(UIImageView *)v9->_imageView trailingAnchor];
    v47 = [(MKPhotoBigAttributionView *)v9 trailingAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v58[1] = v46;
    v45 = [(UIImageView *)v9->_imageView topAnchor];
    v44 = [(MKPhotoBigAttributionView *)v9 topAnchor];
    v43 = [v45 constraintEqualToAnchor:v44];
    v58[2] = v43;
    v42 = [(UIImageView *)v9->_imageView bottomAnchor];
    v41 = [(MKPhotoBigAttributionView *)v9 bottomAnchor];
    v39 = [v42 constraintEqualToAnchor:v41];
    v58[3] = v39;
    v38 = [(UIView *)v9->_backgroundView leadingAnchor];
    v37 = [(MKPhotoBigAttributionView *)v9 leadingAnchor];
    v36 = [v38 constraintEqualToAnchor:v37];
    v58[4] = v36;
    v35 = [(UIView *)v9->_backgroundView trailingAnchor];
    v25 = [(MKPhotoBigAttributionView *)v9 trailingAnchor];
    v26 = [v35 constraintEqualToAnchor:v25];
    v58[5] = v26;
    v27 = [(UIView *)v9->_backgroundView topAnchor];
    v28 = [(MKPhotoBigAttributionView *)v9 topAnchor];
    v29 = [v27 constraintEqualToAnchor:v28];
    v58[6] = v29;
    v30 = [(UIView *)v9->_backgroundView bottomAnchor];
    v31 = [(MKPhotoBigAttributionView *)v9 bottomAnchor];
    v32 = [v30 constraintEqualToAnchor:v31];
    v58[7] = v32;
    v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:8];
    [v40 activateConstraints:v33];
  }
  return v9;
}

- (void)beginAnimatingActivityIndicator
{
  [(MKPhotoBigAttributionView *)self willStartAnimatingActivityIndicatorView];
  id v3 = [(MKPhotoBigAttributionView *)self spinner];
  [v3 startAnimating];
}

- (void)endAnimatingActivityIndicatorWithError:(id)a3
{
  double v4 = [(MKPhotoBigAttributionView *)self spinner];
  [v4 stopAnimating];

  [(MKPhotoBigAttributionView *)self didEndAnimatingActivityIndicatorView];
}

- (void)setMapItem:(id)a3
{
  double v5 = (MKMapItem *)a3;
  if (self->_mapItem != v5)
  {
    double v6 = v5;
    objc_storeStrong((id *)&self->_mapItem, a3);
    [(MKPhotoBigAttributionView *)self updateBackgroundIfNeeded];
    [(MKPhotoBigAttributionView *)self didUpdateMapItem];
    double v5 = v6;
  }
}

- (void)setType:(int64_t)a3
{
  if (self->_type != a3)
  {
    self->_type = a3;
    [(MKPhotoBigAttributionView *)self didUpdateAttributionViewType];
  }
}

- (void)updateBackgroundIfNeeded
{
  if (self->_needsImageLoad)
  {
    [(MKPhotoBigAttributionView *)self frame];
    if (v4 != *MEMORY[0x1E4F1DB30] || v3 != *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      self->_needsImageLoad = 0;
      double v6 = [MKMapItemPhoto alloc];
      double v7 = [(MKPhotoBigAttributionView *)self mapItem];
      v8 = [v7 _geoMapItem];
      v9 = [v8 _photos];
      id v10 = [v9 firstObject];
      v11 = [(MKMapItemPhoto *)v6 initWithGeoMapItemPhoto:v10];

      [(UIImageView *)self->_imageView frame];
      CGFloat Width = CGRectGetWidth(v16);
      v13 = -[MKMapItemPhoto urlForBestPhotoForSize:](v11, "urlForBestPhotoForSize:", Width, Width);
      if (v13)
      {
        v14 = +[MKAppImageManager sharedImageManager];
        v15[0] = MEMORY[0x1E4F143A8];
        v15[1] = 3221225472;
        v15[2] = __53__MKPhotoBigAttributionView_updateBackgroundIfNeeded__block_invoke;
        v15[3] = &unk_1E54B9820;
        v15[4] = self;
        [v14 loadAppImageAtURL:v13 completionHandler:v15];
      }
    }
  }
}

void __53__MKPhotoBigAttributionView_updateBackgroundIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = (void *)MEMORY[0x1E4F42FF0];
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(v5 + 408);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __53__MKPhotoBigAttributionView_updateBackgroundIfNeeded__block_invoke_2;
  v8[3] = &unk_1E54B8248;
  v8[4] = v5;
  id v9 = v3;
  id v7 = v3;
  [v4 transitionWithView:v6 duration:5242880 options:v8 animations:0 completion:0.200000003];
}

uint64_t __53__MKPhotoBigAttributionView_updateBackgroundIfNeeded__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 408) setImage:*(void *)(a1 + 40)];
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MKPhotoBigAttributionView;
  [(MKPhotoBigAttributionView *)&v3 layoutSubviews];
  [(MKPhotoBigAttributionView *)self updateBackgroundIfNeeded];
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (int64_t)context
{
  return self->_context;
}

- (int64_t)type
{
  return self->_type;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);

  objc_storeStrong((id *)&self->_imageView, 0);
}

@end