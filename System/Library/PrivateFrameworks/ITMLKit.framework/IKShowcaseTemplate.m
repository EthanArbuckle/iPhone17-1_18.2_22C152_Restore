@interface IKShowcaseTemplate
- (IKBackgroundElement)background;
- (IKCarouselElement)carousel;
- (IKDocumentBannerElement)documentBanner;
- (NSArray)modes;
- (unint64_t)transition;
@end

@implementation IKShowcaseTemplate

- (NSArray)modes
{
  v2 = [(IKViewElement *)self attributes];
  v3 = [v2 objectForKeyedSubscript:@"mode"];

  v4 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  v5 = [v3 componentsSeparatedByCharactersInSet:v4];

  return (NSArray *)v5;
}

- (IKDocumentBannerElement)documentBanner
{
  return (IKDocumentBannerElement *)[(IKViewElement *)self childElementWithType:33];
}

- (IKCarouselElement)carousel
{
  return (IKCarouselElement *)[(IKViewElement *)self childElementWithType:15];
}

- (IKBackgroundElement)background
{
  return (IKBackgroundElement *)[(IKViewElement *)self childElementWithType:7];
}

- (unint64_t)transition
{
  v2 = [(IKViewElement *)self style];
  v3 = [v2 transition];
  unint64_t v4 = +[IKViewElementStyle transitionFromString:v3];

  return v4;
}

@end