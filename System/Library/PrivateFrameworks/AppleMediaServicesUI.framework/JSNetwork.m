@interface JSNetwork
- (BOOL)isConnected;
- (_TtC14amsengagementd9JSNetwork)init;
- (void)dealloc;
@end

@implementation JSNetwork

- (BOOL)isConnected
{
  v2 = self;
  char v3 = sub_10001653C();

  return v3 & 1;
}

- (_TtC14amsengagementd9JSNetwork)init
{
  return (_TtC14amsengagementd9JSNetwork *)sub_10000E464();
}

- (void)dealloc
{
  v2 = self;
  sub_1000F6D18();
}

- (void).cxx_destruct
{
}

@end