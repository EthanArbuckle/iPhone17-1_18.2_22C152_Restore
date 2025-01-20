@interface JSLogObject
- (_TtC16UtilityExtension11JSLogObject)init;
- (void)debug:(id)a3;
- (void)default:(id)a3;
- (void)error:(id)a3;
- (void)fault:(id)a3;
- (void)info:(id)a3;
@end

@implementation JSLogObject

- (void)debug:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001B30C((uint64_t)v4);
}

- (void)default:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001B38C((uint64_t)v4);
}

- (void)error:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001B40C((uint64_t)v4);
}

- (void)fault:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001B48C((uint64_t)v4);
}

- (void)info:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10001B50C((uint64_t)v4);
}

- (_TtC16UtilityExtension11JSLogObject)init
{
  return (_TtC16UtilityExtension11JSLogObject *)sub_10001B808();
}

@end