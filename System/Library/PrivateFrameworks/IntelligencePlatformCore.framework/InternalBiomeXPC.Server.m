@interface InternalBiomeXPC.Server
- (_TtCC24IntelligencePlatformCore16InternalBiomeXPC6Server)init;
- (void)viewClearAllDataWithViewQuery:(GDViewQuery *)a3 completion:(id)a4;
- (void)viewDumpStateWithCompletion:(id)a3;
- (void)viewRunUpdateWithViewQuery:(GDViewQuery *)a3 forceRebuild:(BOOL)a4 priorityOverride:(NSNumber *)a5 completion:(id)a6;
- (void)viewSetEnabledWithName:(NSString *)a3 enabled:(BOOL)a4 completion:(id)a5;
- (void)viewStopWithCompletion:(id)a3;
- (void)viewValidateWithCompletion:(id)a3;
- (void)viewValidateWithViewQuery:(GDViewQuery *)a3 applyFixes:(BOOL)a4 verbose:(int64_t)a5 completion:(id)a6;
@end

@implementation InternalBiomeXPC.Server

- (void)viewStopWithCompletion:(id)a3
{
}

- (void)viewRunUpdateWithViewQuery:(GDViewQuery *)a3 forceRebuild:(BOOL)a4 priorityOverride:(NSNumber *)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a3;
  *(unsigned char *)(v11 + 24) = a4;
  *(void *)(v11 + 32) = a5;
  *(void *)(v11 + 40) = v10;
  *(void *)(v11 + 48) = self;
  v12 = a3;
  v13 = a5;
  v14 = self;
  sub_1C77690E4((uint64_t)&unk_1EA472AF0, v11);
}

- (void)viewClearAllDataWithViewQuery:(GDViewQuery *)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_1C77690E4((uint64_t)&unk_1EA472AE0, (uint64_t)v7);
}

- (void)viewValidateWithViewQuery:(GDViewQuery *)a3 applyFixes:(BOOL)a4 verbose:(int64_t)a5 completion:(id)a6
{
  v10 = _Block_copy(a6);
  uint64_t v11 = swift_allocObject();
  *(void *)(v11 + 16) = a3;
  *(unsigned char *)(v11 + 24) = a4;
  *(void *)(v11 + 32) = a5;
  *(void *)(v11 + 40) = v10;
  *(void *)(v11 + 48) = self;
  v12 = a3;
  v13 = self;
  sub_1C77690E4((uint64_t)&unk_1EA472AD0, v11);
}

- (void)viewDumpStateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  *(void *)(swift_allocObject() + 16) = v4;
  v5 = self;
  InternalBiomeXPC.Server.viewDumpState(completion:)((void (*)(uint64_t, void))sub_1C70F36EC);

  swift_release();
}

- (void)viewValidateWithCompletion:(id)a3
{
}

- (void)viewSetEnabledWithName:(NSString *)a3 enabled:(BOOL)a4 completion:(id)a5
{
  v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = a3;
  *(unsigned char *)(v9 + 24) = a4;
  *(void *)(v9 + 32) = v8;
  *(void *)(v9 + 40) = self;
  v10 = a3;
  uint64_t v11 = self;
  sub_1C77690E4((uint64_t)&unk_1EA472AB0, v9);
}

- (_TtCC24IntelligencePlatformCore16InternalBiomeXPC6Server)init
{
  return (_TtCC24IntelligencePlatformCore16InternalBiomeXPC6Server *)InternalBiomeXPC.Server.init()();
}

@end