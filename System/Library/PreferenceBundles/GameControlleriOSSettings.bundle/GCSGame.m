@interface GCSGame
- (BOOL)customizable;
- (BOOL)profileExistsFor:(id)a3 with:(id)a4;
- (NSString)localizedName;
- (id)profileFor:(id)a3 with:(id)a4;
@end

@implementation GCSGame

- (id)profileFor:(id)a3 with:(id)a4
{
  id v6 = a3;
  v7 = a4;
  v8 = self;
  v9 = (void *)sub_446A0(v6, v7);

  return v9;
}

- (BOOL)profileExistsFor:(id)a3 with:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  BOOL v9 = sub_44CC0(v6, v7);

  return v9;
}

- (BOOL)customizable
{
  v2 = self;
  id v3 = [(GCSGame *)v2 bundleIdentifier];
  uint64_t v4 = sub_E7110();
  uint64_t v6 = v5;

  id v7 = [self defaultIdentifier];
  uint64_t v8 = sub_E7110();
  uint64_t v10 = v9;

  if (v4 == v8 && v6 == v10)
  {
    swift_bridgeObjectRelease_n();
    char v13 = 0;
  }
  else
  {
    char v12 = sub_E7620();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    char v13 = v12 ^ 1;
  }

  return v13 & 1;
}

- (NSString)localizedName
{
  v2 = self;
  sub_4587C();

  NSString v3 = sub_E70D0();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

@end