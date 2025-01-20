@interface HUBannerItem
- (BOOL)forceShowBanner;
- (HMHome)home;
- (HUBannerItem)init;
- (HUBannerItem)initWithHome:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setForceShowBanner:(BOOL)a3;
@end

@implementation HUBannerItem

- (HUBannerItem)initWithHome:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HUBannerItem;
  v6 = [(HUBannerItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_home, a3);
  }

  return v7;
}

- (HMHome)home
{
  return self->_home;
}

- (BOOL)forceShowBanner
{
  return self->_forceShowBanner;
}

- (HUBannerItem)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  id v5 = NSStringFromSelector(sel_initWithHome_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUBannerItem.m", 26, @"%s is unavailable; use %@ instead",
    "-[HUBannerItem init]",
    v5);

  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc((Class)objc_opt_class());
  id v5 = [(HUBannerItem *)self home];
  v6 = (void *)[v4 initWithHome:v5];

  return v6;
}

- (void)setForceShowBanner:(BOOL)a3
{
  self->_forceShowBanner = a3;
}

- (void).cxx_destruct
{
}

@end