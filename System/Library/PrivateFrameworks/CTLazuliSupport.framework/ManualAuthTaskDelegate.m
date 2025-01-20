@interface ManualAuthTaskDelegate
- (_TtC15CTLazuliSupport22ManualAuthTaskDelegate)init;
- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 didReceiveChallenge:(NSURLAuthenticationChallenge *)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didCreateTask:(id)a4;
@end

@implementation ManualAuthTaskDelegate

- (void)URLSession:(id)a3 didCreateTask:(id)a4
{
  id v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15CTLazuliSupport22ManualAuthTaskDelegate_task);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15CTLazuliSupport22ManualAuthTaskDelegate_task) = (Class)a4;
  id v4 = a4;
}

- (void)URLSession:(NSURLSession *)a3 task:(NSURLSessionTask *)a4 didReceiveChallenge:(NSURLAuthenticationChallenge *)a5 completionHandler:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_2696C4ED8);
  MEMORY[0x270FA5388](v11 - 8, v12);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a6);
  v16 = (void *)swift_allocObject();
  v16[2] = a3;
  v16[3] = a4;
  v16[4] = a5;
  v16[5] = v15;
  v16[6] = self;
  uint64_t v17 = sub_24962C340();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v14, 1, 1, v17);
  v18 = (void *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = &unk_2696C51C8;
  v18[5] = v16;
  v19 = (void *)swift_allocObject();
  v19[2] = 0;
  v19[3] = 0;
  v19[4] = &unk_2696C4EF0;
  v19[5] = v18;
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = self;
  sub_2496111D0((uint64_t)v14, (uint64_t)&unk_2696C4EF8, (uint64_t)v19);
  swift_release();
}

- (_TtC15CTLazuliSupport22ManualAuthTaskDelegate)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15CTLazuliSupport22ManualAuthTaskDelegate_task) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15CTLazuliSupport22ManualAuthTaskDelegate_failureResponse) = 0;
  v5.receiver = self;
  v5.super_class = ObjectType;
  return [(ManualAuthTaskDelegate *)&v5 init];
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15CTLazuliSupport22ManualAuthTaskDelegate_failureResponse);
}

@end