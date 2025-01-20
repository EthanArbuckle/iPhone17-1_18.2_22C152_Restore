@interface SNMovieRemixSession
- (SNMovieRemixSession)init;
- (id)subscribeWithFinalResultHandler:(id)a3 completionHandler:(id)a4;
- (void)finishWithError:(id)a3;
- (void)yieldBuffer:(id)a3;
@end

@implementation SNMovieRemixSession

- (id)subscribeWithFinalResultHandler:(id)a3 completionHandler:(id)a4
{
  v6 = _Block_copy(a3);
  v7 = _Block_copy(a4);
  uint64_t v8 = swift_allocObject();
  *(void *)(v8 + 16) = v6;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v7;
  v10 = self;
  id v11 = sub_1DC8E49EC((uint64_t)sub_1DC89C750, v8, (uint64_t)sub_1DC8C1994, v9);

  swift_release();
  swift_release();

  return v11;
}

- (void)yieldBuffer:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1DC8E4D5C((uint64_t)v4);
}

- (void)finishWithError:(id)a3
{
  id v4 = self;
  id v5 = a3;
  sub_1DC8E4E64(a3);
}

- (SNMovieRemixSession)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

@end