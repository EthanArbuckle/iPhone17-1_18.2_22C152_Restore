@interface CNMeCardSharingOnboardingAvatarCarouselItem
- (BOOL)shouldShowVariants;
- (CNMeCardSharingOnboardingAvatarCarouselItem)initWithImageInsetPercentage:(double)a3 imageProvider:(id)a4;
- (CNMeCardSharingOnboardingAvatarCarouselItem)initWithTitle:(id)a3;
- (NSString)title;
- (UIImage)cachedImage;
- (double)imageInsetPercentage;
- (id)imageProvider;
- (unint64_t)imageType;
- (void)setCachedImage:(id)a3;
- (void)setImageType:(unint64_t)a3;
- (void)setShouldShowVariants:(BOOL)a3;
@end

@implementation CNMeCardSharingOnboardingAvatarCarouselItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong(&self->_imageProvider, 0);

  objc_storeStrong((id *)&self->_cachedImage, 0);
}

- (void)setShouldShowVariants:(BOOL)a3
{
  self->_shouldShowVariants = a3;
}

- (BOOL)shouldShowVariants
{
  return self->_shouldShowVariants;
}

- (double)imageInsetPercentage
{
  return self->_imageInsetPercentage;
}

- (NSString)title
{
  return self->_title;
}

- (void)setImageType:(unint64_t)a3
{
  self->_imageType = a3;
}

- (unint64_t)imageType
{
  return self->_imageType;
}

- (id)imageProvider
{
  return self->_imageProvider;
}

- (void)setCachedImage:(id)a3
{
}

- (UIImage)cachedImage
{
  return self->_cachedImage;
}

- (CNMeCardSharingOnboardingAvatarCarouselItem)initWithTitle:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselItem;
  v5 = [(CNMeCardSharingOnboardingAvatarCarouselItem *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    title = v5->_title;
    v5->_title = (NSString *)v6;
  }
  return v5;
}

- (CNMeCardSharingOnboardingAvatarCarouselItem)initWithImageInsetPercentage:(double)a3 imageProvider:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNMeCardSharingOnboardingAvatarCarouselItem;
  v7 = [(CNMeCardSharingOnboardingAvatarCarouselItem *)&v13 init];
  v8 = v7;
  if (v7)
  {
    v7->_imageInsetPercentage = a3;
    uint64_t v9 = [v6 copy];
    id imageProvider = v8->_imageProvider;
    v8->_id imageProvider = (id)v9;

    v11 = v8;
  }

  return v8;
}

@end