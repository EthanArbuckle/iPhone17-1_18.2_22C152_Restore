@interface AMSAccountCachedServerStringCore
- (AMSAccountCachedServerStringCore)init;
- (BOOL)isStale;
- (NSDate)expiration;
- (NSString)description;
- (NSString)value;
- (id)token;
- (void)setToken:(id)a3;
@end

@implementation AMSAccountCachedServerStringCore

- (void).cxx_destruct
{
}

- (id)token
{
  v2 = (void *)AccountCachedServerData.AccountStringObject.token.getter();
  return v2;
}

- (NSDate)expiration
{
  return (NSDate *)sub_18D748EA0((uint64_t)self, (uint64_t)a2, (void (*)(void))AccountCachedServerData.AccountStringObject.expiration.getter);
}

- (BOOL)isStale
{
  v2 = self;
  char v3 = AccountCachedServerData.AccountStringObject.isStale.getter();

  return v3 & 1;
}

- (NSString)value
{
  AccountCachedServerData.AccountStringObject.value.getter();
  if (v2)
  {
    char v3 = (void *)sub_18DD4DE80();
    swift_bridgeObjectRelease();
  }
  else
  {
    char v3 = 0;
  }
  return (NSString *)v3;
}

- (void)setToken:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  AccountCachedServerData.AccountStringObject.token.setter((uint64_t)a3);
}

- (NSString)description
{
  return (NSString *)sub_18D748CD8(self, (uint64_t)a2, (void (*)(void))AccountCachedServerData.AccountStringObject.description.getter);
}

- (AMSAccountCachedServerStringCore)init
{
}

@end