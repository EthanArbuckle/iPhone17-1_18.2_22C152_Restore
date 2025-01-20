@interface FamilySuggestionsTapToRadar
- (FamilySuggestionsTapToRadar)init;
- (FamilySuggestionsTapToRadar)initWithSuggestions:(id)a3 screenshot:(id)a4;
- (void)open;
@end

@implementation FamilySuggestionsTapToRadar

- (FamilySuggestionsTapToRadar)initWithSuggestions:(id)a3 screenshot:(id)a4
{
  sub_218A50F00(0, &qword_267BEC598);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FamilySuggestionsTapToRadar_suggestions) = (Class)sub_218CAF018();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___FamilySuggestionsTapToRadar_screenshot) = (Class)a4;
  v8.receiver = self;
  v8.super_class = (Class)FamilySuggestionsTapToRadar;
  id v6 = a4;
  return [(FamilySuggestionsTapToRadar *)&v8 init];
}

- (void)open
{
  v2 = self;
  sub_218B4CCEC();
}

- (FamilySuggestionsTapToRadar)init
{
  result = (FamilySuggestionsTapToRadar *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___FamilySuggestionsTapToRadar_screenshot);
}

@end