@interface GKSignInVisibilityConfig
- (GKLimitedPresentationConfig)bannerConfig;
- (GKLimitedPresentationConfig)sheetConfig;
- (GKSignInVisibilityConfig)init;
- (void)setBannerConfig:(id)a3;
- (void)setSheetConfig:(id)a3;
@end

@implementation GKSignInVisibilityConfig

- (GKSignInVisibilityConfig)init
{
  v6.receiver = self;
  v6.super_class = (Class)GKSignInVisibilityConfig;
  v2 = [(GKSignInVisibilityConfig *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(GKLimitedPresentationConfig);
    [(GKSignInVisibilityConfig *)v2 setBannerConfig:v3];

    v4 = objc_alloc_init(GKLimitedPresentationConfig);
    [(GKSignInVisibilityConfig *)v2 setSheetConfig:v4];
  }
  return v2;
}

- (GKLimitedPresentationConfig)sheetConfig
{
  return self->_sheetConfig;
}

- (void)setSheetConfig:(id)a3
{
}

- (GKLimitedPresentationConfig)bannerConfig
{
  return self->_bannerConfig;
}

- (void)setBannerConfig:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerConfig, 0);

  objc_storeStrong((id *)&self->_sheetConfig, 0);
}

@end