@interface DNDAssistantSetManual
- (void)performWithCompletion:(id)a3;
@end

@implementation DNDAssistantSetManual

- (void)performWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = dispatch_get_global_queue(25, 0);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_30E0;
  v7[3] = &unk_4120;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

@end