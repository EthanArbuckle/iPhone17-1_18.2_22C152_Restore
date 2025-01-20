@interface SNMovieRemix
+ (id)analyzeFileAtURL:(id)a3 environment:(id)a4 error:(id *)a5;
+ (id)analyzeFileAtURL:(id)a3 error:(id *)a4;
+ (id)runRequest:(id)a3 error:(id *)a4;
+ (void)runRequest:(id)a3 completionHandler:(id)a4;
+ (void)runRequest:(id)a3 environment:(id)a4 completionHandler:(id)a5;
- (SNMovieRemix)init;
@end

@implementation SNMovieRemix

+ (void)runRequest:(id)a3 completionHandler:(id)a4
{
  v5 = _Block_copy(a4);
  swift_getObjCClassMetadata();
  id v6 = a3;
  sub_1DC8E50AC((uint64_t)v6, v5);
  _Block_release(v5);
}

+ (void)runRequest:(id)a3 environment:(id)a4 completionHandler:(id)a5
{
  v7 = _Block_copy(a5);
  if (a4)
  {
    id v8 = a3;
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v10, 0, sizeof(v10));
    id v9 = a3;
  }
  sub_1DC8E5110((uint64_t)a3, (int)v10, v7);
  _Block_release(v7);

  sub_1DC88CC04((uint64_t)v10, &qword_1EAA9CAB0);
}

+ (id)runRequest:(id)a3 error:(id *)a4
{
  id v4 = a3;
  id v5 = sub_1DC8E5360((uint64_t)v4);

  return v5;
}

+ (id)analyzeFileAtURL:(id)a3 error:(id *)a4
{
  uint64_t v4 = sub_1DCB86A18();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DCB869B8();
  id v8 = (void *)sub_1DC8E5450((uint64_t)v7);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v8;
}

+ (id)analyzeFileAtURL:(id)a3 environment:(id)a4 error:(id *)a5
{
  uint64_t v6 = sub_1DCB86A18();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  id v9 = (char *)v13 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DCB869B8();
  if (a4)
  {
    swift_unknownObjectRetain();
    sub_1DCB88808();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v13, 0, sizeof(v13));
  }
  uint64_t v10 = (void *)sub_1DC8E561C();
  sub_1DC88CC04((uint64_t)v13, &qword_1EAA9CAB0);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);

  return v10;
}

- (SNMovieRemix)init
{
  return (SNMovieRemix *)SNMovieRemix.init()();
}

@end