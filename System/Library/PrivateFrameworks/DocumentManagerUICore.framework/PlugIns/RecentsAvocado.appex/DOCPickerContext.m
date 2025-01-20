@interface DOCPickerContext
- (_TtC14RecentsAvocado16DOCPickerContext)init;
- (_TtC14RecentsAvocado16DOCPickerContext)initWithItems:(id)a3;
- (_TtC14RecentsAvocado16DOCPickerContext)initWithURLs:(id)a3;
@end

@implementation DOCPickerContext

- (_TtC14RecentsAvocado16DOCPickerContext)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14RecentsAvocado16DOCPickerContext_utisToSave) = (Class)_swiftEmptyArrayStorage;

  result = (_TtC14RecentsAvocado16DOCPickerContext *)sub_1004CF6B0();
  __break(1u);
  return result;
}

- (_TtC14RecentsAvocado16DOCPickerContext)initWithURLs:(id)a3
{
  sub_1000333C8(0, (unint64_t *)&unk_10062F740);
  unint64_t v3 = sub_1004CDE30();
  return (_TtC14RecentsAvocado16DOCPickerContext *)DOCPickerContext.init(with:)(v3);
}

- (_TtC14RecentsAvocado16DOCPickerContext)initWithItems:(id)a3
{
  sub_1000333C8(0, (unint64_t *)&qword_100627EE0);
  v4 = (objc_class *)sub_1004CDE30();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14RecentsAvocado16DOCPickerContext_utisToSave) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14RecentsAvocado16DOCPickerContext_urlsToSave) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC14RecentsAvocado16DOCPickerContext_itemsToMove) = v4;
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