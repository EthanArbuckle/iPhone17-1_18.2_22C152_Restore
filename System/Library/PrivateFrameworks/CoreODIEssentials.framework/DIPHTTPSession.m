@interface DIPHTTPSession
- (NSString)description;
- (_TtC17CoreODIEssentials14DIPHTTPSession)init;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7;
- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4;
@end

@implementation DIPHTTPSession

- (NSString)description
{
  v2 = self;
  sub_214BC7B4C();

  v3 = (void *)sub_214D1A028();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)URLSession:(id)a3 task:(id)a4 willPerformHTTPRedirection:(id)a5 newRequest:(id)a6 completionHandler:(id)a7
{
  id v30 = a5;
  v31 = self;
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_26784D588);
  uint64_t v12 = MEMORY[0x270FA5388](v10 - 8, v11);
  v14 = (char *)&v28 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12, v15);
  v17 = (char *)&v28 - v16;
  uint64_t v18 = sub_214D19738();
  uint64_t v19 = *(void *)(v18 - 8);
  MEMORY[0x270FA5388](v18, v20);
  v22 = (char *)&v28 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = (void (**)(void *, void *))_Block_copy(a7);
  sub_214D196E8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v19 + 56))(v17, 1, 1, v18);
  sub_214BD05F0((uint64_t)v17, (uint64_t)v14);
  int v24 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v19 + 48))(v14, 1, v18);
  id v29 = a3;
  id v28 = a4;
  id v25 = v30;
  v26 = v31;
  v27 = 0;
  if (v24 != 1)
  {
    v27 = (void *)sub_214D196C8();
    (*(void (**)(char *, uint64_t))(v19 + 8))(v14, v18);
  }
  v23[2](v23, v27);

  sub_214B59CE0((uint64_t)v17, &qword_26784D588);
  _Block_release(v23);

  (*(void (**)(char *, uint64_t))(v19 + 8))(v22, v18);
}

- (void)URLSession:(id)a3 taskIsWaitingForConnectivity:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_214BCFD84(v7);
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_214BD01EC(a4);
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = self;
  sub_214BD0474(v10, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (_TtC17CoreODIEssentials14DIPHTTPSession)init
{
  result = (_TtC17CoreODIEssentials14DIPHTTPSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CoreODIEssentials14DIPHTTPSession__anonymousURLSession));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CoreODIEssentials14DIPHTTPSession_nsurlSessionConfiguration));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC17CoreODIEssentials14DIPHTTPSession_anonymousNSURLSessionConfiguration));
  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  swift_unknownObjectWeakDestroy();
}

@end