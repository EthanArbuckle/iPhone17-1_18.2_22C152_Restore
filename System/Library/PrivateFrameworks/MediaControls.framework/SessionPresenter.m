@interface SessionPresenter
- (void)dataSource:(id)a3 didUpdateBackdropImage:(id)a4 forKey:(id)a5;
@end

@implementation SessionPresenter

- (void)dataSource:(id)a3 didUpdateBackdropImage:(id)a4 forKey:(id)a5
{
  sub_1AE947618();
  id v7 = a3;
  id v8 = a4;
  swift_retain();
  sub_1AE9313D4((uint64_t)a4);

  swift_release();
  sub_1AE923F38((uint64_t)v9);
}

@end