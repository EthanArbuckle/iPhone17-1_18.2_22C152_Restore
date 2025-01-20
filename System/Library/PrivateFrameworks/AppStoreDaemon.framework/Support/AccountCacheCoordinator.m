@interface AccountCacheCoordinator
- (_TtC9appstored23AccountCacheCoordinator)init;
- (void)oneAccountDSID:(ACAccount *)a3 logKey:(_TtC9appstored6LogKey *)a4 completionHandler:(id)a5;
@end

@implementation AccountCacheCoordinator

- (void)oneAccountDSID:(ACAccount *)a3 logKey:(_TtC9appstored6LogKey *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v20 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_1005A63B0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_1005A35A0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_1000DFAB0((uint64_t)v11, (uint64_t)&unk_1005A4930, (uint64_t)v16);
  swift_release();
}

- (_TtC9appstored23AccountCacheCoordinator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AccountCacheCoordinator();
  return [(AccountCacheCoordinator *)&v3 init];
}

@end