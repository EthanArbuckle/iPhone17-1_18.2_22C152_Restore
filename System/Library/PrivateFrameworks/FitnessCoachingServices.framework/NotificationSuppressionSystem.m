@interface NotificationSuppressionSystem
- (void)scheduler:(id)a3 performActivityWithName:(id)a4 completion:(id)a5;
@end

@implementation NotificationSuppressionSystem

- (void)scheduler:(id)a3 performActivityWithName:(id)a4 completion:(id)a5
{
  v6 = _Block_copy(a5);
  id v7 = a3;
  swift_retain();
  sub_1D3BD2998();
  _Block_release(v6);

  swift_release();
}

@end