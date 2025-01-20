@interface DOCPickerContext
- (_TtC17RecentsAppPopover16DOCPickerContext)init;
- (_TtC17RecentsAppPopover16DOCPickerContext)initWithItems:(id)a3;
- (_TtC17RecentsAppPopover16DOCPickerContext)initWithURLs:(id)a3;
@end

@implementation DOCPickerContext

- (_TtC17RecentsAppPopover16DOCPickerContext)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover16DOCPickerContext_utisToSave) = (Class)_swiftEmptyArrayStorage;

  result = (_TtC17RecentsAppPopover16DOCPickerContext *)sub_1004C0670();
  __break(1u);
  return result;
}

- (_TtC17RecentsAppPopover16DOCPickerContext)initWithURLs:(id)a3
{
  sub_1000338CC(0, &qword_100624680);
  unint64_t v3 = sub_1004BEDE0();
  return (_TtC17RecentsAppPopover16DOCPickerContext *)DOCPickerContext.init(with:)(v3);
}

- (_TtC17RecentsAppPopover16DOCPickerContext)initWithItems:(id)a3
{
  sub_1000338CC(0, (unint64_t *)&qword_100617240);
  v4 = (objc_class *)sub_1004BEDE0();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover16DOCPickerContext_utisToSave) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover16DOCPickerContext_urlsToSave) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC17RecentsAppPopover16DOCPickerContext_itemsToMove) = v4;
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