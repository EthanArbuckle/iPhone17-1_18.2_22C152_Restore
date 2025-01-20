@interface CNUIPRLikenessLoadingGroupPlaceholderProvider
- (CGImage)renderCircularImageForSize:(CGSize)a3 scale:(double)a4;
- (CGImage)renderRoundedRectImageForSize:(CGSize)a3 scale:(double)a4;
- (CNUIPRLikenessLoadingGroupPlaceholderProvider)initWithBackgroundStyle:(unint64_t)a3;
- (unint64_t)backgroundStyle;
@end

@implementation CNUIPRLikenessLoadingGroupPlaceholderProvider

- (CNUIPRLikenessLoadingGroupPlaceholderProvider)initWithBackgroundStyle:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CNUIPRLikenessLoadingGroupPlaceholderProvider;
  v4 = [(CNUIPRLikenessLoadingPlaceholderProvider *)&v8 init];
  v5 = v4;
  if (v4)
  {
    v4->_backgroundStyle = a3;
    v6 = v4;
  }

  return v5;
}

- (CGImage)renderCircularImageForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v7 = [(CNUIPRLikenessLoadingGroupPlaceholderProvider *)self backgroundStyle];
  return +[CNUISnowglobeUtilities circularPlaceholderImageForSize:backgroundStyle:scale:](CNUISnowglobeUtilities, "circularPlaceholderImageForSize:backgroundStyle:scale:", v7, width, height, a4);
}

- (unint64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (CGImage)renderRoundedRectImageForSize:(CGSize)a3 scale:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  unint64_t v7 = [(CNUIPRLikenessLoadingGroupPlaceholderProvider *)self backgroundStyle];
  return +[CNUISnowglobeUtilities roundedRectPlaceholderImageForSize:backgroundStyle:scale:](CNUISnowglobeUtilities, "roundedRectPlaceholderImageForSize:backgroundStyle:scale:", v7, width, height, a4);
}

@end