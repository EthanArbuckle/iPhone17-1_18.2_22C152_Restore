@interface GEOStorefrontPresentationInfo
- (GEOStorefrontPresentationInfo)init;
- (GEOStorefrontPresentationInfo)initWithStorefrontPresentation:(id)a3;
- (GEOStorefrontView)closeUpView;
- (GEOStorefrontView)standOffView;
- (NSURL)overlayImageURL;
@end

@implementation GEOStorefrontPresentationInfo

- (GEOStorefrontPresentationInfo)init
{
  result = (GEOStorefrontPresentationInfo *)[MEMORY[0x1E4F1CA00] raise:@"GEOMethodNotAvailableException" format:@"This method is unavailable."];
  __break(1u);
  return result;
}

- (GEOStorefrontPresentationInfo)initWithStorefrontPresentation:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (!v4) {
    goto LABEL_10;
  }
  if (([v4 hasCloseUpView] & 1) == 0) {
    goto LABEL_10;
  }
  v20.receiver = self;
  v20.super_class = (Class)GEOStorefrontPresentationInfo;
  self = [(GEOStorefrontPresentationInfo *)&v20 init];
  if (!self) {
    goto LABEL_10;
  }
  v6 = [GEOStorefrontView alloc];
  v7 = [v5 closeUpView];
  v8 = [(GEOStorefrontView *)v6 initWithStorefrontView:v7];
  closeUpView = self->_closeUpView;
  self->_closeUpView = v8;

  if (!self->_closeUpView) {
    goto LABEL_10;
  }
  if ([v5 hasStandOffView])
  {
    v10 = [GEOStorefrontView alloc];
    v11 = [v5 standOffView];
    v12 = [(GEOStorefrontView *)v10 initWithStorefrontView:v11];
    standOffView = self->_standOffView;
    self->_standOffView = v12;

    if (!self->_standOffView) {
      goto LABEL_10;
    }
  }
  if (![v5 hasOverlayImageUrl]) {
    goto LABEL_9;
  }
  v14 = (void *)MEMORY[0x1E4F1CB10];
  v15 = [v5 overlayImageUrl];
  v16 = [v14 URLWithString:v15];
  overlayImageURL = self->_overlayImageURL;
  self->_overlayImageURL = v16;

  if (self->_overlayImageURL)
  {
LABEL_9:
    self = self;
    v18 = self;
  }
  else
  {
LABEL_10:
    v18 = 0;
  }

  return v18;
}

- (GEOStorefrontView)closeUpView
{
  return self->_closeUpView;
}

- (GEOStorefrontView)standOffView
{
  return self->_standOffView;
}

- (NSURL)overlayImageURL
{
  return self->_overlayImageURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overlayImageURL, 0);
  objc_storeStrong((id *)&self->_standOffView, 0);

  objc_storeStrong((id *)&self->_closeUpView, 0);
}

@end