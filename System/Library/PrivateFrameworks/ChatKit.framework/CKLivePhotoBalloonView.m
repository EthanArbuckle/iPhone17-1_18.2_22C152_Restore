@interface CKLivePhotoBalloonView
- (BOOL)isIrisAsset;
- (BOOL)isMonoskiAsset;
- (CKLivePhotoBalloonView)initWithFrame:(CGRect)a3;
- (PHLivePhoto)livePhoto;
- (PHLivePhotoView)livePhotoView;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6;
- (void)layoutSubviews;
- (void)setIsIrisAsset:(BOOL)a3;
- (void)setIsMonoskiAsset:(BOOL)a3;
- (void)setLivePhoto:(id)a3;
- (void)setLivePhotoView:(id)a3;
@end

@implementation CKLivePhotoBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = a5;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CKLivePhotoBalloonView;
  [(CKImageBalloonView *)&v14 configureForMediaObject:v10 previewWidth:v7 orientation:v6 hasInvisibleInkEffect:a4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v11 = v10;
    v12 = [(CKLivePhotoBalloonView *)self livePhotoView];
    v13 = [v11 livePhoto];

    [v12 setLivePhoto:v13];
  }
}

- (CKLivePhotoBalloonView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CKLivePhotoBalloonView;
  v3 = -[CKImageBalloonView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (PHLivePhotoView *)objc_alloc_init((Class)MEMORY[0x192FBA860](@"PHLivePhotoView", @"PhotosUI"));
    livePhotoView = v3->_livePhotoView;
    v3->_livePhotoView = v4;

    BOOL v6 = v3->_livePhotoView;
    [(CKLivePhotoBalloonView *)v3 bounds];
    -[PHLivePhotoView setFrame:](v6, "setFrame:");
    [(CKLivePhotoBalloonView *)v3 addSubview:v3->_livePhotoView];
  }
  return v3;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CKLivePhotoBalloonView;
  [(CKImageBalloonView *)&v12 layoutSubviews];
  [(CKLivePhotoBalloonView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(CKLivePhotoBalloonView *)self livePhotoView];
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
}

- (void)setIsIrisAsset:(BOOL)a3
{
  self->_isIrisAsset = a3;
}

- (void)setIsMonoskiAsset:(BOOL)a3
{
  self->_isMonoskiAsset = a3;
}

- (BOOL)isIrisAsset
{
  return self->_isIrisAsset;
}

- (BOOL)isMonoskiAsset
{
  return self->_isMonoskiAsset;
}

- (PHLivePhotoView)livePhotoView
{
  return self->_livePhotoView;
}

- (void)setLivePhotoView:(id)a3
{
}

- (PHLivePhoto)livePhoto
{
  return self->_livePhoto;
}

- (void)setLivePhoto:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_livePhoto, 0);

  objc_storeStrong((id *)&self->_livePhotoView, 0);
}

@end