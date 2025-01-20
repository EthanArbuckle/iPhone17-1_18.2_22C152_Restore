@interface CalendarLinkSpotlightEntityAnnotator
+ (void)associateEventEntityWithIdentifier:(id)a3 occurrenceDate:(id)a4 with:(id)a5;
- (CalendarLinkSpotlightEntityAnnotator)init;
@end

@implementation CalendarLinkSpotlightEntityAnnotator

+ (void)associateEventEntityWithIdentifier:(id)a3 occurrenceDate:(id)a4 with:(id)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_26AF65FA0);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2290422B0();
  uint64_t v12 = v11;
  if (a4)
  {
    sub_2290415D0();
    uint64_t v13 = sub_2290415E0();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 0, 1, v13);
  }
  else
  {
    uint64_t v14 = sub_2290415E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v9, 1, 1, v14);
  }
  id v15 = a5;
  sub_228FE142C(v10, v12, (uint64_t)v9, v15);

  swift_bridgeObjectRelease();
  sub_228FD4270((uint64_t)v9);
}

- (CalendarLinkSpotlightEntityAnnotator)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CalendarLinkSpotlightEntityAnnotator();
  return [(CalendarLinkSpotlightEntityAnnotator *)&v3 init];
}

@end