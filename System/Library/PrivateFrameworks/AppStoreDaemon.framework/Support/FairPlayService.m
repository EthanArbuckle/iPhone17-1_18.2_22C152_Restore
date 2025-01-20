@interface FairPlayService
+ (NSString)entitlement;
+ (_TtC9appstored15FairPlayService)defaultService;
- (_TtC9appstored15FairPlayService)init;
- (void)generateKeybagRequestForDSID:(unint64_t)a3 completionHandler:(id)a4;
- (void)generateSubscriptionRequestForDSID:(unint64_t)a3 completionHandler:(id)a4;
- (void)importKeybag:(NSData *)a3 completionHandler:(id)a4;
- (void)importSubscriptionKeybag:(NSData *)a3 completionHandler:(id)a4;
@end

@implementation FairPlayService

+ (_TtC9appstored15FairPlayService)defaultService
{
  if (qword_1005A2F90 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1005B1440;
  return (_TtC9appstored15FairPlayService *)v2;
}

+ (NSString)entitlement
{
  NSString v2 = String._bridgeToObjectiveC()();
  return (NSString *)v2;
}

- (void)generateKeybagRequestForDSID:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1005A3600;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1005A3608;
  v14[5] = v13;
  v15 = self;
  sub_1000DFAB0((uint64_t)v9, (uint64_t)&unk_1005A3610, (uint64_t)v14);
  swift_release();
}

- (void)generateSubscriptionRequestForDSID:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1005A35E0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1005A35E8;
  v14[5] = v13;
  v15 = self;
  sub_1000DFAB0((uint64_t)v9, (uint64_t)&unk_1005A35F0, (uint64_t)v14);
  swift_release();
}

- (void)importKeybag:(NSData *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1005A35C0;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1005A35C8;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_1000DFAB0((uint64_t)v9, (uint64_t)&unk_1005A35D0, (uint64_t)v14);
  swift_release();
}

- (void)importSubscriptionKeybag:(NSData *)a3 completionHandler:(id)a4
{
  uint64_t v7 = sub_10001644C(&qword_1005A4640);
  __chkstk_darwin(v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = _Block_copy(a4);
  v11 = (void *)swift_allocObject();
  v11[2] = a3;
  v11[3] = v10;
  v11[4] = self;
  uint64_t v12 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1005A3598;
  v13[5] = v11;
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_1005A35A0;
  v14[5] = v13;
  v15 = a3;
  uint64_t v16 = self;
  sub_1000DFAB0((uint64_t)v9, (uint64_t)&unk_1005A4930, (uint64_t)v14);
  swift_release();
}

- (_TtC9appstored15FairPlayService)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FairPlayService();
  return [(FairPlayService *)&v3 init];
}

@end