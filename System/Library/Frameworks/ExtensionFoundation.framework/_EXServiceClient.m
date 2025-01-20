@interface _EXServiceClient
+ (_EXServiceClient)sharedInstance;
- (BOOL)photoServiceAuthorizationStatusForExtensionUUID:(id)a3 error:(id *)a4;
- (_EXServiceClient)init;
- (void)dealloc;
@end

@implementation _EXServiceClient

+ (_EXServiceClient)sharedInstance
{
  if (qword_1E92FC760 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E92FF700;

  return (_EXServiceClient *)v2;
}

- (_EXServiceClient)init
{
  return (_EXServiceClient *)sub_191F8DB30();
}

- (BOOL)photoServiceAuthorizationStatusForExtensionUUID:(id)a3 error:(id *)a4
{
  uint64_t v5 = sub_191FB9C68();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x1F4188790](v5);
  v8 = (char *)&v11 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_191FB9C28();
  v9 = self;
  sub_191F90674();
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);

  return 1;
}

- (void)dealloc
{
  v2 = self;
  sub_191F90D3C();
}

- (void).cxx_destruct
{
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____EXServiceClient_notifyQueue);
}

@end