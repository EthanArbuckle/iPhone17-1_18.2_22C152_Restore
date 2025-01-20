@interface PHDeclineCallServiceFactory
- (PHDeclineCallServiceFactory)init;
- (id)makeWithCallCenter:(id)a3;
@end

@implementation PHDeclineCallServiceFactory

- (id)makeWithCallCenter:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_1001BB7C8(v4);

  return v6;
}

- (PHDeclineCallServiceFactory)init
{
  return (PHDeclineCallServiceFactory *)sub_1001BB868();
}

@end