@interface IKMenuBarTemplate
- (IKMenuBarElement)menuBar;
@end

@implementation IKMenuBarTemplate

- (IKMenuBarElement)menuBar
{
  return (IKMenuBarElement *)[(IKViewElement *)self childElementWithType:70];
}

@end