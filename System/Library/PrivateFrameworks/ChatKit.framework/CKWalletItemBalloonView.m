@interface CKWalletItemBalloonView
- (BOOL)isIrisAsset;
- (LPWebLinkPresentationProperties)presentationProperties;
- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6;
- (void)prepareForDisplay;
- (void)prepareForReuse;
- (void)setIsIrisAsset:(BOOL)a3;
- (void)setPresentationProperties:(id)a3;
@end

@implementation CKWalletItemBalloonView

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  uint64_t v6 = a5;
  id v10 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    v9 = [v10 presentationPropertiesForWidth:v6 orientation:a4];
    [(CKWalletItemBalloonView *)self setPresentationProperties:v9];
  }
}

- (void)setPresentationProperties:(id)a3
{
  v5 = (LPWebLinkPresentationProperties *)a3;
  if (self->_presentationProperties != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_presentationProperties, a3);
    self->_pendingPropertyChange = 1;
    [(CKBalloonView *)self setNeedsPrepareForDisplay];
    v5 = v6;
  }
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)CKWalletItemBalloonView;
  [(CKLinkBalloonView *)&v4 prepareForReuse];
  presentationProperties = self->_presentationProperties;
  self->_presentationProperties = 0;

  self->_pendingPropertyChange = 0;
}

- (void)prepareForDisplay
{
  if (self->_pendingPropertyChange)
  {
    v3 = [(CKLinkBalloonView *)self linkView];
    [v3 removeFromSuperview];

    [(CKLinkBalloonView *)self setLinkView:0];
    self->_pendingPropertyChange = 0;
  }
  objc_super v4 = [(CKLinkBalloonView *)self linkView];

  if (!v4)
  {
    v5 = (void *)[objc_alloc(MEMORY[0x1E4F30A98]) initWithPresentationProperties:self->_presentationProperties URL:0];
    [(CKLinkBalloonView *)self setLinkView:v5];

    uint64_t v6 = [(CKBalloonView *)self tapGestureRecognizer];
    [v6 setCancelsTouchesInView:1];

    id location = 0;
    objc_initWeak(&location, self);
    v7 = [(CKLinkBalloonView *)self linkView];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__CKWalletItemBalloonView_prepareForDisplay__block_invoke;
    v10[3] = &unk_1E56215C8;
    objc_copyWeak(&v11, &location);
    [v7 _setAction:v10 withText:&stru_1EDE4CA38 buttonType:1];

    v8 = [(CKLinkBalloonView *)self linkView];
    [v8 setNeedsUpdateConstraints];

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  v9.receiver = self;
  v9.super_class = (Class)CKWalletItemBalloonView;
  [(CKLinkBalloonView *)&v9 prepareForDisplay];
}

void __44__CKWalletItemBalloonView_prepareForDisplay__block_invoke(uint64_t a1)
{
  id v2 = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [v2 tapGestureRecognizer];
  [v2 tapGestureRecognized:v1];
}

- (BOOL)isIrisAsset
{
  return self->_isIrisAsset;
}

- (void)setIsIrisAsset:(BOOL)a3
{
  self->_isIrisAsset = a3;
}

- (LPWebLinkPresentationProperties)presentationProperties
{
  return self->_presentationProperties;
}

- (void).cxx_destruct
{
}

@end