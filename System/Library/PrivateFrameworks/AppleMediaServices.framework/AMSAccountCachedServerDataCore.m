@interface AMSAccountCachedServerDataCore
+ (AMSAccountCachedServerDataCore)sharedInstance;
- (AMSAccountCachedServerDataCore)init;
- (id)BOOLForKey:(int64_t)a3 accountID:(id)a4 updateBlock:(id)a5;
- (id)accountFlagsForAccountID:(id)a3;
- (id)cancelUpdateBlockFor:(id)a3;
- (id)intForKey:(int64_t)a3 accountID:(id)a4 updateBlock:(id)a5;
- (id)stringForKey:(int64_t)a3 accountID:(id)a4 updateBlock:(id)a5;
- (void)accountAuthSyncForAccountID:(AMSAccountIdentity *)a3 completionHandler:(id)a4;
- (void)dealloc;
- (void)setAccountFlags:(NSDictionary *)a3 forAccountID:(AMSAccountIdentity *)a4 completionHandler:(id)a5;
- (void)setAutoPlayTo:(BOOL)a3 forAccountID:(AMSAccountIdentity *)a4 completionHandler:(id)a5;
- (void)setPersonalizationTo:(BOOL)a3 forAccountID:(AMSAccountIdentity *)a4 completionHandler:(id)a5;
@end

@implementation AMSAccountCachedServerDataCore

- (id)stringForKey:(int64_t)a3 accountID:(id)a4 updateBlock:(id)a5
{
  return sub_18D72D8A0(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1EDC89158, (uint64_t)sub_18D74E474, (uint64_t (*)(uint64_t, id, uint64_t, uint64_t))AccountCachedServerData.string(forKey:accountID:updateBlock:));
}

+ (AMSAccountCachedServerDataCore)sharedInstance
{
  id v2 = static AccountCachedServerData.shared.getter();
  return (AMSAccountCachedServerDataCore *)v2;
}

- (id)cancelUpdateBlockFor:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  id v6 = AccountCachedServerData.cancelUpdateBlock(for:)((uint64_t)a3);
  swift_unknownObjectRelease();

  return v6;
}

- (void)dealloc
{
  id v2 = self;
  AccountCachedServerData.__deallocating_deinit();
}

- (void).cxx_destruct
{
}

- (AMSAccountCachedServerDataCore)init
{
}

- (id)BOOLForKey:(int64_t)a3 accountID:(id)a4 updateBlock:(id)a5
{
  return sub_18D72D8A0(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1EDC891A8, (uint64_t)sub_18D74DF14, (uint64_t (*)(uint64_t, id, uint64_t, uint64_t))AccountCachedServerData.BOOL(forKey:accountID:updateBlock:));
}

- (id)intForKey:(int64_t)a3 accountID:(id)a4 updateBlock:(id)a5
{
  return sub_18D72D8A0(self, (int)a2, a3, a4, a5, (uint64_t)&unk_1EDC89180, (uint64_t)sub_18D74E474, (uint64_t (*)(uint64_t, id, uint64_t, uint64_t))AccountCachedServerData.int(forKey:accountID:updateBlock:));
}

- (void)accountAuthSyncForAccountID:(AMSAccountIdentity *)a3 completionHandler:(id)a4
{
  id v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_18D677FD0((uint64_t)&unk_1E91B9FD8, (uint64_t)v7);
}

- (id)accountFlagsForAccountID:(id)a3
{
  id v4 = a3;
  v5 = self;
  AccountCachedServerData.accountFlags(forAccountID:)(v4);

  type metadata accessor for AMSAccountFlag(0);
  sub_18D74C6FC();
  sub_18D74C73C();
  id v6 = (void *)sub_18DD4DD80();
  swift_bridgeObjectRelease();
  return v6;
}

- (void)setAutoPlayTo:(BOOL)a3 forAccountID:(AMSAccountIdentity *)a4 completionHandler:(id)a5
{
}

- (void)setPersonalizationTo:(BOOL)a3 forAccountID:(AMSAccountIdentity *)a4 completionHandler:(id)a5
{
}

- (void)setAccountFlags:(NSDictionary *)a3 forAccountID:(AMSAccountIdentity *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;
  sub_18D677FD0((uint64_t)&unk_1E91B9FA8, (uint64_t)v9);
}

@end