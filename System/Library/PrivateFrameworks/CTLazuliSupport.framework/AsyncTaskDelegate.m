@interface AsyncTaskDelegate
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
@end

@implementation AsyncTaskDelegate

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC15CTLazuliSupport17AsyncTaskDelegate_continuation;
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(qword_2696C5268);
  v4 = *(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8);
  v4(v2, v3);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v10 = self;
  id v11 = a5;
  sub_2496138A0(v9, a5);
}

@end