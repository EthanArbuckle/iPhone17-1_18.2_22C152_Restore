@interface IKColumnTemplate
- (IKColumnCollectionElement)columnCollection;
- (IKDocumentBannerElement)documentBanner;
@end

@implementation IKColumnTemplate

- (IKDocumentBannerElement)documentBanner
{
  return (IKDocumentBannerElement *)[(IKViewElement *)self childElementWithType:33];
}

- (IKColumnCollectionElement)columnCollection
{
  return (IKColumnCollectionElement *)[(IKViewElement *)self childElementWithType:22];
}

@end