@interface SuggestionsSearchViewCell
- (_TtC11MobilePhone25SuggestionsSearchViewCell)initWithCoder:(id)a3;
- (_TtC11MobilePhone25SuggestionsSearchViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation SuggestionsSearchViewCell

- (_TtC11MobilePhone25SuggestionsSearchViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC11MobilePhone25SuggestionsSearchViewCell_suggestionImage) = 0;
    v8 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC11MobilePhone25SuggestionsSearchViewCell_suggestionText);
    void *v8 = 0;
    v8[1] = 0;
    a4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(Class *)((char *)&self->super.super.super.super.isa
             + OBJC_IVAR____TtC11MobilePhone25SuggestionsSearchViewCell_suggestionImage) = 0;
    v9 = (Class *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC11MobilePhone25SuggestionsSearchViewCell_suggestionText);
    void *v9 = 0;
    v9[1] = 0;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(SuggestionsSearchViewCell *)&v12 initWithStyle:a3 reuseIdentifier:a4];

  return v10;
}

- (_TtC11MobilePhone25SuggestionsSearchViewCell)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.isa
           + OBJC_IVAR____TtC11MobilePhone25SuggestionsSearchViewCell_suggestionImage) = 0;
  v6 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC11MobilePhone25SuggestionsSearchViewCell_suggestionText);
  void *v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(SuggestionsSearchViewCell *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobilePhone25SuggestionsSearchViewCell_suggestionImage));

  swift_bridgeObjectRelease();
}

@end