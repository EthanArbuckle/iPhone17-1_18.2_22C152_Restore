@interface SFAbstractCommand(CRCommand)
- (id)referenceIdentifier;
- (id)userInfo;
- (void)setUserInfo:()CRCommand;
@end

@implementation SFAbstractCommand(CRCommand)

- (id)userInfo
{
  return objc_getAssociatedObject(a1, sel_userInfo);
}

- (void)setUserInfo:()CRCommand
{
}

- (id)referenceIdentifier
{
  if ([a1 type] == 1)
  {
    v2 = [a1 value];
    v3 = [v2 referentialCommand];
    v4 = [v3 referenceIdentifier];
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

@end