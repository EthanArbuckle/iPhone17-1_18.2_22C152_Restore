@interface AMSAccountCachedServerData
- (void)intForKey:(unint64_t)a3 account:(ACAccount *)a4 logKey:(_TtC9appstored6LogKey *)a5 staleValueAcceptable:(BOOL)a6 completionHandler:(id)a7;
@end

@implementation AMSAccountCachedServerData

- (void)intForKey:(unint64_t)a3 account:(ACAccount *)a4 logKey:(_TtC9appstored6LogKey *)a5 staleValueAcceptable:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v13 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v13 - 8);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = _Block_copy(a7);
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = a3;
  *(void *)(v17 + 24) = a4;
  *(void *)(v17 + 32) = a5;
  *(unsigned char *)(v17 + 40) = a6;
  *(void *)(v17 + 48) = v16;
  *(void *)(v17 + 56) = self;
  uint64_t v18 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v15, 1, 1, v18);
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_1005A63C0;
  v19[5] = v17;
  v20 = (void *)swift_allocObject();
  v20[2] = 0;
  v20[3] = 0;
  v20[4] = &unk_1005A35A0;
  v20[5] = v19;
  v21 = a4;
  v22 = a5;
  v23 = self;
  sub_1000DFAB0((uint64_t)v15, (uint64_t)&unk_1005A4930, (uint64_t)v20);
  swift_release();
}

@end