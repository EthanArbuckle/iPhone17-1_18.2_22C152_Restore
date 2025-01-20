@interface IKGalleryTemplate
- (IKBackgroundElement)background;
- (IKDocumentBannerElement)documentBanner;
- (IKGridElement)grid;
@end

@implementation IKGalleryTemplate

- (IKBackgroundElement)background
{
  return (IKBackgroundElement *)[(IKViewElement *)self childElementWithType:7];
}

- (IKDocumentBannerElement)documentBanner
{
  return (IKDocumentBannerElement *)[(IKViewElement *)self childElementWithType:33];
}

- (IKGridElement)grid
{
  return (IKGridElement *)[(IKViewElement *)self childElementWithType:45];
}

@end