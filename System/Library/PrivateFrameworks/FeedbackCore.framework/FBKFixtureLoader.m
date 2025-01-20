@interface FBKFixtureLoader
- (_TtC12FeedbackCore16FBKFixtureLoader)init;
- (id)initForBundle:(id)a3;
- (void)dataForURL:(id)a3 success:(id)a4 error:(id)a5;
- (void)dataForURL:(id)a3 successWithResponse:(id)a4 error:(id)a5;
- (void)dataForURLRequest:(id)a3 success:(id)a4 error:(id)a5;
- (void)dataForURLRequest:(id)a3 successWithResponse:(id)a4 error:(id)a5;
- (void)deleteAtURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7;
- (void)deleteResourceAtURL:(id)a3 success:(id)a4 error:(id)a5;
- (void)didLogInWithLoginUserInfo:(id)a3 completion:(id)a4;
- (void)didLogOutWithCompletion:(id)a3;
- (void)jsonForURL:(id)a3 success:(id)a4 error:(id)a5;
- (void)jsonForURLRequest:(id)a3 success:(id)a4 error:(id)a5;
- (void)postToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7;
- (void)putToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7;
@end

@implementation FBKFixtureLoader

- (id)initForBundle:(id)a3
{
  id v3 = a3;
  id v4 = sub_22A4379B8(v3);

  return v4;
}

- (void)didLogOutWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  v5 = (void (*)(void *))v4[2];
  v6 = self;
  v5(v4);
  _Block_release(v4);
}

- (void)didLogInWithLoginUserInfo:(id)a3 completion:(id)a4
{
  v6 = _Block_copy(a4);
  v7 = (void (*)(void *))v6[2];
  id v8 = a3;
  v9 = self;
  v7(v6);
  _Block_release(v6);
}

- (void)dataForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
}

- (void)dataForURLRequest:(id)a3 successWithResponse:(id)a4 error:(id)a5
{
}

- (void)jsonForURLRequest:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_2683766E0);
  MEMORY[0x270FA5388](v8 - 8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v11 = sub_22A4B2238();
  uint64_t v12 = *(void *)(v11 - 8);
  MEMORY[0x270FA5388](v11);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = _Block_copy(a4);
  v16 = _Block_copy(a5);
  sub_22A4B2218();
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  uint64_t v18 = swift_allocObject();
  *(void *)(v18 + 16) = v16;
  v19 = self;
  sub_22A4B2228();
  uint64_t v20 = sub_22A4B24C8();
  uint64_t v21 = *(void *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v10, 1, v20) == 1)
  {
    __break(1u);
  }
  else
  {
    sub_22A435214((uint64_t)v10, (uint64_t)sub_22A438744, v17, (uint64_t)sub_22A438548, v18);
    (*(void (**)(char *, uint64_t))(v21 + 8))(v10, v20);

    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

- (void)dataForURL:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v8 = sub_22A4B24C8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a4);
  uint64_t v13 = _Block_copy(a5);
  sub_22A4B2488();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  v16 = self;
  sub_22A436190((uint64_t)v11, (uint64_t)sub_22A438544, v14, (uint64_t)sub_22A438548, v15);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)dataForURL:(id)a3 successWithResponse:(id)a4 error:(id)a5
{
  uint64_t v8 = sub_22A4B24C8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a4);
  uint64_t v13 = _Block_copy(a5);
  sub_22A4B2488();
  uint64_t v14 = self;
  _Block_release(v13);
  _Block_release(v12);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)jsonForURL:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v8 = sub_22A4B24C8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a4);
  uint64_t v13 = _Block_copy(a5);
  sub_22A4B2488();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  v16 = self;
  sub_22A435214((uint64_t)v11, (uint64_t)sub_22A43854C, v14, (uint64_t)sub_22A438548, v15);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)postToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  uint64_t v10 = sub_22A4B24C8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = _Block_copy(a7);
  sub_22A4B2488();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  uint64_t v18 = self;
  sub_22A436190((uint64_t)v13, (uint64_t)sub_22A438544, v16, (uint64_t)sub_22A438548, v17);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)putToURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  uint64_t v10 = sub_22A4B24C8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = _Block_copy(a7);
  sub_22A4B2488();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  uint64_t v18 = self;
  sub_22A436190((uint64_t)v13, (uint64_t)sub_22A438544, v16, (uint64_t)sub_22A438548, v17);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)deleteResourceAtURL:(id)a3 success:(id)a4 error:(id)a5
{
  uint64_t v8 = sub_22A4B24C8();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a4);
  uint64_t v13 = _Block_copy(a5);
  sub_22A4B2488();
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v12;
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v13;
  uint64_t v16 = self;
  sub_22A436190((uint64_t)v11, (uint64_t)sub_22A438544, v14, (uint64_t)sub_22A438548, v15);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)deleteAtURL:(id)a3 parameters:(id)a4 encoding:(unint64_t)a5 success:(id)a6 error:(id)a7
{
  uint64_t v10 = sub_22A4B24C8();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  uint64_t v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a6);
  uint64_t v15 = _Block_copy(a7);
  sub_22A4B2488();
  uint64_t v16 = swift_allocObject();
  *(void *)(v16 + 16) = v14;
  uint64_t v17 = swift_allocObject();
  *(void *)(v17 + 16) = v15;
  uint64_t v18 = self;
  sub_22A436190((uint64_t)v13, (uint64_t)sub_22A438544, v16, (uint64_t)sub_22A438548, v17);

  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (_TtC12FeedbackCore16FBKFixtureLoader)init
{
  result = (_TtC12FeedbackCore16FBKFixtureLoader *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC12FeedbackCore16FBKFixtureLoader_logger;
  uint64_t v4 = sub_22A4B27C8();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);

  v5(v3, v4);
}

@end