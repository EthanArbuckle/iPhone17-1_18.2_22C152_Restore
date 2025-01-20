@interface ADBannerView
+ (CGSize)sizeFromBannerContentSizeIdentifier:(id)a3;
- (ADBannerView)initWithAdType:(int64_t)a3;
- (BOOL)isBannerLoaded;
- (BOOL)isBannerViewActionInProgress;
- (id)advertisingSection;
- (id)currentContentSizeIdentifier;
- (id)delegate;
- (id)requiredContentSizeIdentifiers;
- (int64_t)adType;
- (void)setAdvertisingSection:(id)a3;
- (void)setCurrentContentSizeIdentifier:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRequiredContentSizeIdentifiers:(id)a3;
@end

@implementation ADBannerView

+ (CGSize)sizeFromBannerContentSizeIdentifier:(id)a3
{
  double v3 = *MEMORY[0x263F001B0];
  double v4 = *(double *)(MEMORY[0x263F001B0] + 8);
  result.height = v4;
  result.width = v3;
  return result;
}

- (ADBannerView)initWithAdType:(int64_t)a3
{
  return 0;
}

- (int64_t)adType
{
  return self->_adType;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isBannerLoaded
{
  return self->_bannerLoaded;
}

- (BOOL)isBannerViewActionInProgress
{
  return self->_bannerViewActionInProgress;
}

- (id)advertisingSection
{
  return self->_advertisingSection;
}

- (void)setAdvertisingSection:(id)a3
{
}

- (id)requiredContentSizeIdentifiers
{
  return self->_requiredContentSizeIdentifiers;
}

- (void)setRequiredContentSizeIdentifiers:(id)a3
{
}

- (id)currentContentSizeIdentifier
{
  return self->_currentContentSizeIdentifier;
}

- (void)setCurrentContentSizeIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_currentContentSizeIdentifier, 0);
  objc_storeStrong(&self->_requiredContentSizeIdentifiers, 0);
  objc_storeStrong(&self->_advertisingSection, 0);

  objc_destroyWeak(&self->_delegate);
}

@end