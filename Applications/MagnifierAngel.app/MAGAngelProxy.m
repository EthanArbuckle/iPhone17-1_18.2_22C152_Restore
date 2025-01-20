@interface MAGAngelProxy
- (_TtC14MagnifierAngel13MAGAngelProxy)init;
- (void)finishWithCompletionHandler:(id)a3;
- (void)startWithCompletionHandler:(id)a3;
@end

@implementation MAGAngelProxy

- (void)startWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10000B130(&qword_100044BE0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1000451B8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1000451C0;
  v12[5] = v11;
  v13 = self;
  sub_1000289D4((uint64_t)v7, (uint64_t)&unk_1000451C8, (uint64_t)v12);
  swift_release();
}

- (void)finishWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10000B130(&qword_100044BE0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100045178;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100045188;
  v12[5] = v11;
  v13 = self;
  sub_1000289D4((uint64_t)v7, (uint64_t)&unk_100045198, (uint64_t)v12);
  swift_release();
}

- (_TtC14MagnifierAngel13MAGAngelProxy)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MAGAngelProxy();
  return [(MAGAngelProxy *)&v3 init];
}

@end