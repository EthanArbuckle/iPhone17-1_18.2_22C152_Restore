@interface ATXWidgetStackSuggestion
- (ATXWidget)topWidget;
- (ATXWidgetStackSuggestion)init;
- (ATXWidgetStackSuggestion)initWithStackIdentifier:(id)a3 topWidget:(id)a4 suggestedWidgets:(id)a5;
- (NSSet)suggestedWidgets;
- (NSString)description;
- (NSString)stackIdentifier;
- (NSString)topWidgetIdentifier;
@end

@implementation ATXWidgetStackSuggestion

- (NSString)stackIdentifier
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (ATXWidget)topWidget
{
  return (ATXWidget *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                              + OBJC_IVAR___ATXWidgetStackSuggestion_topWidget));
}

- (NSSet)suggestedWidgets
{
  sub_24A787494(0, (unint64_t *)&qword_2697BA130);
  sub_24A791220();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_24A7B34A8();
  swift_bridgeObjectRelease();
  return (NSSet *)v2;
}

- (ATXWidgetStackSuggestion)initWithStackIdentifier:(id)a3 topWidget:(id)a4 suggestedWidgets:(id)a5
{
  uint64_t v7 = sub_24A7B3398();
  uint64_t v9 = v8;
  sub_24A787494(0, (unint64_t *)&qword_2697BA130);
  sub_24A791220();
  v10 = (objc_class *)sub_24A7B34C8();
  v11 = (uint64_t *)((char *)self + OBJC_IVAR___ATXWidgetStackSuggestion_stackIdentifier);
  uint64_t *v11 = v7;
  v11[1] = v9;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXWidgetStackSuggestion_topWidget) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___ATXWidgetStackSuggestion_suggestedWidgets) = v10;
  v14.receiver = self;
  v14.super_class = (Class)ATXWidgetStackSuggestion;
  id v12 = a4;
  return [(ATXWidgetStackSuggestion *)&v14 init];
}

- (NSString)description
{
  v2 = self;
  ATXWidgetStackSuggestion.description.getter();

  v3 = (void *)sub_24A7B3378();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (NSString)topWidgetIdentifier
{
  v2 = self;
  v3 = [(ATXWidgetStackSuggestion *)v2 topWidget];
  if (v3)
  {
    v4 = v3;
    v5 = [(ATXWidget *)v3 identifier];

    sub_24A7B3398();
    v6 = (void *)sub_24A7B3378();
    swift_bridgeObjectRelease();
  }
  else
  {

    v6 = 0;
  }
  return (NSString *)v6;
}

- (ATXWidgetStackSuggestion)init
{
  result = (ATXWidgetStackSuggestion *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end