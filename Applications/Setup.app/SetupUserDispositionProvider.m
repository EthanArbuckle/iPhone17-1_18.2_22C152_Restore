@interface SetupUserDispositionProvider
- (_TtC5Setup28SetupUserDispositionProvider)init;
- (void)isNewUserWithDataTransferMethod:(unint64_t)a3 deviceClass:(NSString *)a4 serialNumber:(NSString *)a5 completionHandler:(id)a6;
@end

@implementation SetupUserDispositionProvider

- (void)isNewUserWithDataTransferMethod:(unint64_t)a3 deviceClass:(NSString *)a4 serialNumber:(NSString *)a5 completionHandler:(id)a6
{
  uint64_t v11 = sub_10000A84C(&qword_10031D770);
  __chkstk_darwin(v11 - 8);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  v15 = (void *)swift_allocObject();
  v15[2] = a3;
  v15[3] = a4;
  v15[4] = a5;
  v15[5] = v14;
  v15[6] = self;
  uint64_t v16 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = &unk_10031D908;
  v17[5] = v15;
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_10031E190;
  v18[5] = v17;
  v19 = a4;
  v20 = a5;
  v21 = self;
  sub_10003F8F8((uint64_t)v13, (uint64_t)&unk_10031D850, (uint64_t)v18);
  swift_release();
}

- (_TtC5Setup28SetupUserDispositionProvider)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SetupUserDispositionProvider();
  return [(SetupUserDispositionProvider *)&v3 init];
}

@end