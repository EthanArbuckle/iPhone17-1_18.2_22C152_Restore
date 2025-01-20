@interface ATLocationRetriever
- (_TtC15ArchetypeEngine19ATLocationRetriever)init;
- (void)locationManager:(id)a3 didFailWithError:(id)a4;
- (void)locationManager:(id)a3 didUpdateLocations:(id)a4;
@end

@implementation ATLocationRetriever

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  id v5 = a3;
  v6 = self;
  sub_2486ABCC8();
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_248696A74(v8);
}

- (_TtC15ArchetypeEngine19ATLocationRetriever)init
{
  result = (_TtC15ArchetypeEngine19ATLocationRetriever *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC15ArchetypeEngine19ATLocationRetriever_semaphore);
}

@end