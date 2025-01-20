@interface SessionDelegate
- (_TtC23FindMyServerInteractionP33_C6B3C350C31B0B220EF4B9CE0C9359C115SessionDelegate)init;
- (void)URLSession:(NSURLSession *)a3 didReceiveChallenge:(NSURLAuthenticationChallenge *)a4 completionHandler:(id)a5;
@end

@implementation SessionDelegate

- (void)URLSession:(NSURLSession *)a3 didReceiveChallenge:(NSURLAuthenticationChallenge *)a4 completionHandler:(id)a5
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_26B1C24A0);
  MEMORY[0x270FA5388]();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a5);
  v12 = (void *)swift_allocObject();
  v12[2] = a3;
  v12[3] = a4;
  v12[4] = v11;
  v12[5] = self;
  uint64_t v13 = sub_24E545F30();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v10, 1, 1, v13);
  v14 = (void *)swift_allocObject();
  v14[2] = 0;
  v14[3] = 0;
  v14[4] = &unk_2698F0360;
  v14[5] = v12;
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_2698F0370;
  v15[5] = v14;
  v16 = a3;
  v17 = a4;
  v18 = self;
  sub_24E542840((uint64_t)v10, (uint64_t)&unk_2698F0380, (uint64_t)v15);
  swift_release();
}

- (_TtC23FindMyServerInteractionP33_C6B3C350C31B0B220EF4B9CE0C9359C115SessionDelegate)init
{
  result = (_TtC23FindMyServerInteractionP33_C6B3C350C31B0B220EF4B9CE0C9359C115SessionDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end