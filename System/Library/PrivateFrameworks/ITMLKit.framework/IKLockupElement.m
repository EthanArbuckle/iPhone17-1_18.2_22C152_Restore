@interface IKLockupElement
- (BOOL)showTitlesOnFocus;
- (IKImageElement)fullscreenImage;
- (IKImageElement)image;
- (IKOrdinalElement)ordinal;
- (IKTextElement)descriptionText;
- (IKTextElement)subtitle;
- (IKTextElement)title;
- (IKViewElement)overlays;
@end

@implementation IKLockupElement

- (IKImageElement)image
{
  return (IKImageElement *)[(IKViewElement *)self childImageElementWithType:0];
}

- (IKImageElement)fullscreenImage
{
  return (IKImageElement *)[(IKViewElement *)self childImageElementWithType:1];
}

- (IKTextElement)title
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:1];
}

- (IKTextElement)subtitle
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:2];
}

- (IKTextElement)descriptionText
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:3];
}

- (IKOrdinalElement)ordinal
{
  return (IKOrdinalElement *)[(IKViewElement *)self childElementWithType:80];
}

- (BOOL)showTitlesOnFocus
{
  v2 = [(IKViewElement *)self style];
  v3 = [v2 labelsState];
  char v4 = [v3 isEqualToString:@"show-on-highlight"];

  return v4;
}

- (IKViewElement)overlays
{
  return (IKViewElement *)[(IKViewElement *)self childElementWithType:82];
}

@end