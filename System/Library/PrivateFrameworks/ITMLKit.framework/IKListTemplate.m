@interface IKListTemplate
- (IKBackgroundElement)background;
- (IKDocumentBannerElement)documentBanner;
- (IKListElement)list;
@end

@implementation IKListTemplate

- (IKBackgroundElement)background
{
  return (IKBackgroundElement *)[(IKViewElement *)self childElementWithType:7];
}

- (IKDocumentBannerElement)documentBanner
{
  return (IKDocumentBannerElement *)[(IKViewElement *)self childElementWithType:33];
}

- (IKListElement)list
{
  return (IKListElement *)[(IKViewElement *)self childElementWithType:62];
}

@end