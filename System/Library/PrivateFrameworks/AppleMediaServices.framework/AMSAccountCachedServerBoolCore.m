@interface AMSAccountCachedServerBoolCore
- (AMSAccountCachedServerBoolCore)init;
- (BOOL)isStale;
- (NSDate)expiration;
- (NSNumber)value;
- (NSString)description;
- (id)token;
- (void)setToken:(id)a3;
@end

@implementation AMSAccountCachedServerBoolCore

- (NSDate)expiration
{
  return (NSDate *)sub_18D748EA0((uint64_t)self, (uint64_t)a2, (void (*)(void))AccountCachedServerData.AccountBoolObject.expiration.getter);
}

- (BOOL)isStale
{
  v2 = self;
  char v3 = AccountCachedServerData.AccountBoolObject.isStale.getter();

  return v3 & 1;
}

- (NSNumber)value
{
  v2 = self;
  char v3 = (void *)AccountCachedServerData.AccountBoolObject.value.getter();

  return (NSNumber *)v3;
}

- (id)token
{
  v2 = (void *)AccountCachedServerData.AccountBoolObject.token.getter();
  return v2;
}

- (void)setToken:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  AccountCachedServerData.AccountBoolObject.token.setter((uint64_t)a3);
}

- (NSString)description
{
  return (NSString *)sub_18D748CD8(self, (uint64_t)a2, (void (*)(void))AccountCachedServerData.AccountBoolObject.description.getter);
}

- (AMSAccountCachedServerBoolCore)init
{
}

- (void).cxx_destruct
{
}

@end