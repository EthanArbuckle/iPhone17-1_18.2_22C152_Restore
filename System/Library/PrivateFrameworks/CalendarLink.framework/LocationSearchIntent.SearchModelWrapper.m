@interface LocationSearchIntent.SearchModelWrapper
- (BOOL)shouldIncludeConferenceRoom:(id)a3;
- (BOOL)shouldIssueAvailabilityRequestForSearchModel:(id)a3;
- (_TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper)init;
- (id)dateRangeForSearchModel:(id)a3;
- (id)eventIDForSearchModel:(id)a3;
- (id)sourceForSearchModel:(id)a3;
- (void)locationSearchModel:(id)a3 updatedSearchTypes:(unint64_t)a4;
@end

@implementation LocationSearchIntent.SearchModelWrapper

- (id)eventIDForSearchModel:(id)a3
{
  if (*(void *)&self->store[OBJC_IVAR____TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper_eventID])
  {
    sub_229041250();
    v3 = (void *)sub_2290422A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)sourceForSearchModel:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper_source));
}

- (BOOL)shouldIssueAvailabilityRequestForSearchModel:(id)a3
{
  return 0;
}

- (id)dateRangeForSearchModel:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                 + OBJC_IVAR____TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper_dateRange));
}

- (BOOL)shouldIncludeConferenceRoom:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_228FE35EC(v4);
  LOBYTE(self) = v6;

  return self & 1;
}

- (void)locationSearchModel:(id)a3 updatedSearchTypes:(unint64_t)a4
{
  id v5 = a3;
  char v6 = self;
  if ((objc_msgSend(v5, sel_resultsPending) & 1) == 0) {
    sub_228FE3760();
  }
}

- (_TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper)init
{
  result = (_TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper_store));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper_dateRange));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper_source));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper_searchModel));
  sub_228F878D8((uint64_t)self + OBJC_IVAR____TtCV12CalendarLink20LocationSearchIntent18SearchModelWrapper_continuation, &qword_2682B6CE0);
}

@end