@interface VAModelManagerAssertion
- (VAModelManagerAssertion)init;
- (void)acquireInPolicy:(NSString *)a3 inDescription:(NSString *)a4 completionHandler:(id)a5;
- (void)invalidateWithCompletionHandler:(id)a3;
@end

@implementation VAModelManagerAssertion

- (void)acquireInPolicy:(NSString *)a3 inDescription:(NSString *)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_5B5B4(&qword_648828);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_48EF00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_648900;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_648908;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  swift_retain();
  sub_5A95C((uint64_t)v11, (uint64_t)&unk_648910, (uint64_t)v16);
  swift_release();
}

- (void)invalidateWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_5B5B4(&qword_648828);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_48EF00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_6488C0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_6488D0;
  v12[5] = v11;
  swift_retain();
  sub_5A95C((uint64_t)v7, (uint64_t)&unk_6488E0, (uint64_t)v12);
  swift_release();
}

- (VAModelManagerAssertion)init
{
  swift_defaultActor_initialize();
  *(void *)&self[1].$defaultActor[8] = 0;
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for VAModelManagerAssertion();
  return [(VAModelManagerAssertion *)&v4 init];
}

@end