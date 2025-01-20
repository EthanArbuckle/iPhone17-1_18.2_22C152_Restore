@interface GDKnosisResultContext
- (BOOL)enumerateAnswersForEntityIdentifier:(id)a3 block:(id)a4 error:(id *)a5;
- (BOOL)enumerateAnswersUsingBlock:(id)a3 error:(id *)a4;
- (GDKnosisResultContext)init;
- (_TtC20IntelligencePlatform26_GDSwiftGraphObjectContext)context;
- (id)answers;
@end

@implementation GDKnosisResultContext

- (_TtC20IntelligencePlatform26_GDSwiftGraphObjectContext)context
{
  id v2 = GDKnosisResultContext.context.getter();

  return (_TtC20IntelligencePlatform26_GDSwiftGraphObjectContext *)v2;
}

- (id)answers
{
  id v2 = self;
  sub_1B2B71E04();

  sub_1B29C3CA0(0, &qword_1E9C38118);
  v3 = (void *)sub_1B2E82828();
  swift_bridgeObjectRelease();

  return v3;
}

- (BOOL)enumerateAnswersUsingBlock:(id)a3 error:(id *)a4
{
  v7 = _Block_copy(a3);
  v5 = self;
  sub_1B2B71F70((void (*)(id, char *))sub_1B2B72654);

  _Block_release(v7);
  return 1;
}

- (BOOL)enumerateAnswersForEntityIdentifier:(id)a3 block:(id)a4 error:(id *)a5
{
  v10 = _Block_copy(a4);
  id v7 = a3;
  v8 = self;
  sub_1B2B721A0(v7, (void (*)(id, char *))sub_1B2B725E8);

  _Block_release(v10);
  return 1;
}

- (GDKnosisResultContext)init
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.isa + OBJC_IVAR___GDKnosisResultContext_gdSwiftGraphObjectContext);
}

@end