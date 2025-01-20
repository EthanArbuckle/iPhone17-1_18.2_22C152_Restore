@interface DOCTrashedItemsSource
- (NSString)displayName;
- (id)providerName;
- (void)setDisplayName:(id)a3;
- (void)setProviderName:(id)a3;
@end

@implementation DOCTrashedItemsSource

- (NSString)displayName
{
  return (NSString *)sub_100260394(self, (uint64_t)a2, (void (*)(void))sub_10026000C);
}

- (void)setDisplayName:(id)a3
{
}

- (void)setProviderName:(id)a3
{
}

- (void).cxx_destruct
{
}

- (id)providerName
{
  id v1 = a1;
  id v2 = [v1 displayName];
  sub_1004BEB10();

  NSString v3 = sub_1004BEAD0();
  swift_bridgeObjectRelease();
  return v3;
}

@end