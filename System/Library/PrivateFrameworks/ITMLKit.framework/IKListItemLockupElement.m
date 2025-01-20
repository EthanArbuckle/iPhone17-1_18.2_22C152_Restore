@interface IKListItemLockupElement
- (IKActivityIndicatorElement)activityIndicator;
- (IKCheckMarkElement)checkMark;
- (IKOrdinalElement)ordinal;
- (IKProgressIndicatorElement)progressIndicator;
- (IKTextElement)decorationLabel;
- (IKTextElement)subtitle;
- (IKTextElement)title;
- (IKViewElement)relatedContent;
- (NSArray)decorationImages;
- (NSArray)images;
- (NSString)itemHeight;
@end

@implementation IKListItemLockupElement

- (NSString)itemHeight
{
  v2 = [(IKViewElement *)self style];
  v3 = [v2 itemHeight];

  return (NSString *)v3;
}

- (NSArray)images
{
  v2 = [(IKViewElement *)self childElementsWithType:49];
  v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_26];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  if ([v4 count]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

BOOL __33__IKListItemLockupElement_images__block_invoke(uint64_t a1, void *a2)
{
  return [a2 imageType] == 0;
}

- (IKTextElement)title
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:1];
}

- (IKTextElement)subtitle
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:2];
}

- (NSArray)decorationImages
{
  v2 = [(IKViewElement *)self childElementsWithType:49];
  v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_2_0];
  v4 = [v2 filteredArrayUsingPredicate:v3];

  if ([v4 count]) {
    v5 = v4;
  }
  else {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

BOOL __43__IKListItemLockupElement_decorationImages__block_invoke(uint64_t a1, void *a2)
{
  return [a2 imageType] == 2;
}

- (IKTextElement)decorationLabel
{
  return (IKTextElement *)[(IKViewElement *)self childTextElementWithStyle:4];
}

- (IKProgressIndicatorElement)progressIndicator
{
  return (IKProgressIndicatorElement *)[(IKViewElement *)self childElementWithType:95];
}

- (IKActivityIndicatorElement)activityIndicator
{
  return (IKActivityIndicatorElement *)[(IKViewElement *)self childElementWithType:4];
}

- (IKCheckMarkElement)checkMark
{
  return (IKCheckMarkElement *)[(IKViewElement *)self childElementWithType:19];
}

- (IKOrdinalElement)ordinal
{
  return (IKOrdinalElement *)[(IKViewElement *)self childElementWithType:80];
}

- (IKViewElement)relatedContent
{
  v2 = [(IKViewElement *)self childElementWithType:100];
  v3 = [v2 children];
  v4 = [v3 firstObject];

  return (IKViewElement *)v4;
}

@end