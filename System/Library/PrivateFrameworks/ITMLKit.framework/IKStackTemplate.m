@interface IKStackTemplate
- (IKBackgroundElement)background;
- (IKCollectionListElement)collectionList;
- (IKDocumentBannerElement)documentBanner;
@end

@implementation IKStackTemplate

- (IKBackgroundElement)background
{
  return (IKBackgroundElement *)[(IKViewElement *)self childElementWithType:7];
}

- (IKDocumentBannerElement)documentBanner
{
  return (IKDocumentBannerElement *)[(IKViewElement *)self childElementWithType:33];
}

- (IKCollectionListElement)collectionList
{
  return (IKCollectionListElement *)[(IKViewElement *)self childElementWithType:20];
}

@end