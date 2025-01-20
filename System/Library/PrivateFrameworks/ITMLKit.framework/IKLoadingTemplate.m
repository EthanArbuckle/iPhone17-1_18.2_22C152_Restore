@interface IKLoadingTemplate
- (IKViewElement)activityElement;
@end

@implementation IKLoadingTemplate

- (IKViewElement)activityElement
{
  return (IKViewElement *)[(IKViewElement *)self childElementWithType:4];
}

@end