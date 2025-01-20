@interface CPSBannerView
- (CPSBannerItem)bannerItem;
- (CPSBannerView)initWithBannerItem:(id)a3;
- (id)applicationIconImage;
- (void)setBannerItem:(id)a3;
- (void)updateBannerWithBannerItem:(id)a3;
@end

@implementation CPSBannerView

- (CPSBannerView)initWithBannerItem:(id)a3
{
  v8 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v8;
  v8 = 0;
  v6.receiver = v3;
  v6.super_class = (Class)CPSBannerView;
  v8 = [(CPSBannerView *)&v6 init];
  objc_storeStrong((id *)&v8, v8);
  if (v8) {
    objc_storeStrong((id *)&v8->_bannerItem, location[0]);
  }
  v5 = v8;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v8, 0);
  return v5;
}

- (void)updateBannerWithBannerItem:(id)a3
{
  v4 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  [(CPSBannerView *)v4 setBannerItem:location[0]];
  objc_storeStrong(location, 0);
}

- (id)applicationIconImage
{
  v3 = (void *)MEMORY[0x263F1C6B0];
  objc_super v6 = [(CPSBannerView *)self bannerItem];
  v5 = [(CPSBannerItem *)v6 bundleIdentifier];
  id v4 = (id)[(CPSBannerView *)self traitCollection];
  [v4 displayScale];
  id v7 = (id)objc_msgSend(v3, "_applicationIconImageForBundleIdentifier:format:scale:", v5, 9);

  return v7;
}

- (CPSBannerItem)bannerItem
{
  return self->_bannerItem;
}

- (void)setBannerItem:(id)a3
{
}

- (void).cxx_destruct
{
}

@end