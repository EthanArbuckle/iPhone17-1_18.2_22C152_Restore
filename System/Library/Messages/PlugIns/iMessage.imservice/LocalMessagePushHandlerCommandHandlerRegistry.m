@interface LocalMessagePushHandlerCommandHandlerRegistry
- (BOOL)canAddCommand:(id)a3;
- (id)noopHandlerForCommand:(id)a3;
@end

@implementation LocalMessagePushHandlerCommandHandlerRegistry

- (BOOL)canAddCommand:(id)a3
{
  return 1;
}

- (id)noopHandlerForCommand:(id)a3
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_368CC;
  v6[3] = &unk_DE250;
  id v7 = a3;
  id v3 = v7;
  v4 = objc_retainBlock(v6);

  return v4;
}

@end