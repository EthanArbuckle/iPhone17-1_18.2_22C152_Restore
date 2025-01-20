@interface JSAccountStore
- (_TtC14amsengagementd14JSAccountStore)init;
- (_TtC14amsengagementd9JSAccount)activeiCloud;
- (_TtC14amsengagementd9JSAccount)activeiTunes;
- (_TtC14amsengagementd9JSAccount)localAccount;
- (id)activeiTunesForMediaType:(int64_t)a3;
- (id)localAccountForMediaType:(int64_t)a3;
@end

@implementation JSAccountStore

- (id)localAccountForMediaType:(int64_t)a3
{
  v4 = self;
  id v5 = sub_10000955C(a3);

  return v5;
}

- (id)activeiTunesForMediaType:(int64_t)a3
{
  v4 = self;
  id v5 = sub_10000D1E0(a3);

  return v5;
}

- (_TtC14amsengagementd9JSAccount)activeiTunes
{
  v2 = self;
  id v3 = sub_10000DE44();

  return (_TtC14amsengagementd9JSAccount *)v3;
}

- (_TtC14amsengagementd9JSAccount)activeiCloud
{
  v2 = self;
  id v3 = sub_10000E8C0();

  return (_TtC14amsengagementd9JSAccount *)v3;
}

- (_TtC14amsengagementd9JSAccount)localAccount
{
  v2 = self;
  id v3 = sub_1000157B0();

  return (_TtC14amsengagementd9JSAccount *)v3;
}

- (_TtC14amsengagementd14JSAccountStore)init
{
}

- (void).cxx_destruct
{
}

@end