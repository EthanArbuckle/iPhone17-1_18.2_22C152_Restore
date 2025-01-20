@interface IMChipAction
+ (id)actionWithType:(int64_t)a3 dictionary:(id)a4;
- (IMChipAction)init;
- (IMChipAction)initWithDictionary:(id)a3;
- (IMChipAction)initWithSuggestion:(id)a3 type:(int64_t)a4 action:(id)a5;
- (IMChipActionProtocol)action;
- (IMChipSuggestion)suggestion;
- (id)dictionaryRepresentation;
- (id)suggestedActionBody;
- (int64_t)type;
@end

@implementation IMChipAction

- (IMChipSuggestion)suggestion
{
  return (IMChipSuggestion *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR___IMChipAction_suggestion));
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR___IMChipAction_type);
}

- (IMChipActionProtocol)action
{
  v2 = (void *)swift_unknownObjectRetain();

  return (IMChipActionProtocol *)v2;
}

- (IMChipAction)initWithSuggestion:(id)a3 type:(int64_t)a4 action:(id)a5
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMChipAction_suggestion) = (Class)a3;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMChipAction_type) = (Class)a4;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___IMChipAction_action) = (Class)a5;
  v7.receiver = self;
  v7.super_class = (Class)IMChipAction;
  id v5 = a3;
  swift_unknownObjectRetain();
  return [(IMChipAction *)&v7 init];
}

- (IMChipAction)initWithDictionary:(id)a3
{
  uint64_t v3 = sub_1A09F3D08();
  return (IMChipAction *)IMChipAction.init(dictionary:)(v3);
}

- (id)dictionaryRepresentation
{
  v2 = self;
  sub_1A089B498();

  uint64_t v3 = (void *)sub_1A09F3CE8();
  swift_bridgeObjectRelease();

  return v3;
}

+ (id)actionWithType:(int64_t)a3 dictionary:(id)a4
{
  if (a4) {
    id v5 = (void *)sub_1A09F3D08();
  }
  else {
    id v5 = 0;
  }
  id v6 = sub_1A089BAA8(a3, v5);
  swift_bridgeObjectRelease();

  return v6;
}

- (id)suggestedActionBody
{
  v2 = self;
  id v3 = sub_1A089B76C();

  return v3;
}

- (IMChipAction)init
{
  result = (IMChipAction *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
}

@end