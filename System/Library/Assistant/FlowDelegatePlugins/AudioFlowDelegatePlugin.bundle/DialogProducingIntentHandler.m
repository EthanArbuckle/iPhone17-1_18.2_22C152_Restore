@interface DialogProducingIntentHandler
- (NSString)description;
- (_TtC23AudioFlowDelegatePlugin28DialogProducingIntentHandler)init;
- (void)handlePlayMedia:(INPlayMediaIntent *)a3 completion:(id)a4;
@end

@implementation DialogProducingIntentHandler

- (void)handlePlayMedia:(INPlayMediaIntent *)a3 completion:(id)a4
{
  uint64_t v7 = sub_71D4(&qword_3104A8);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = sub_298C10();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_3104B8;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_3104C8;
  v14[5] = v13;
  v15 = a3;
  v16 = self;
  sub_E8AC4((uint64_t)v9, (uint64_t)&unk_3104D8, (uint64_t)v14);
  swift_release();
}

- (NSString)description
{
  NSString v2 = sub_2989B0();

  return (NSString *)v2;
}

- (_TtC23AudioFlowDelegatePlugin28DialogProducingIntentHandler)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DialogProducingIntentHandler();
  return [(DialogProducingIntentHandler *)&v3 init];
}

@end