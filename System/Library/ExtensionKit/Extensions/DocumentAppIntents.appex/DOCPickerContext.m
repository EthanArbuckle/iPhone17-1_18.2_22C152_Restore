@interface DOCPickerContext
- (_TtC18DocumentAppIntents16DOCPickerContext)init;
- (_TtC18DocumentAppIntents16DOCPickerContext)initWithItems:(id)a3;
- (_TtC18DocumentAppIntents16DOCPickerContext)initWithURLs:(id)a3;
@end

@implementation DOCPickerContext

- (_TtC18DocumentAppIntents16DOCPickerContext)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18DocumentAppIntents16DOCPickerContext_utisToSave) = (Class)_swiftEmptyArrayStorage;

  result = (_TtC18DocumentAppIntents16DOCPickerContext *)sub_1004F6110();
  __break(1u);
  return result;
}

- (_TtC18DocumentAppIntents16DOCPickerContext)initWithURLs:(id)a3
{
  sub_100032070(0, (unint64_t *)&unk_10065F050);
  unint64_t v3 = sub_1004F47F0();
  return (_TtC18DocumentAppIntents16DOCPickerContext *)DOCPickerContext.init(with:)(v3);
}

- (_TtC18DocumentAppIntents16DOCPickerContext)initWithItems:(id)a3
{
  sub_100032070(0, (unint64_t *)&qword_100656790);
  v4 = (objc_class *)sub_1004F47F0();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18DocumentAppIntents16DOCPickerContext_utisToSave) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18DocumentAppIntents16DOCPickerContext_urlsToSave) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC18DocumentAppIntents16DOCPickerContext_itemsToMove) = v4;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for DOCPickerContext();
  return [(DOCPickerContext *)&v6 init];
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end