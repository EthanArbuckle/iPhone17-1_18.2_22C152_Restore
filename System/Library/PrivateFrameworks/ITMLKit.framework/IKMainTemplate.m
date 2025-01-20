@interface IKMainTemplate
- (IKBackgroundElement)background;
- (IKButtonElement)button;
- (IKDocumentBannerElement)banner;
- (IKMenuBarElement)menuBar;
@end

@implementation IKMainTemplate

- (IKMenuBarElement)menuBar
{
  return (IKMenuBarElement *)[(IKViewElement *)self childElementWithType:70];
}

- (IKBackgroundElement)background
{
  return (IKBackgroundElement *)[(IKViewElement *)self childElementWithType:7];
}

- (IKButtonElement)button
{
  return (IKButtonElement *)[(IKViewElement *)self childElementWithType:12];
}

- (IKDocumentBannerElement)banner
{
  return (IKDocumentBannerElement *)[(IKViewElement *)self childElementWithType:33];
}

@end