@interface DOCPickerContext
- (_TtC11SaveToFiles16DOCPickerContext)init;
- (_TtC11SaveToFiles16DOCPickerContext)initWithItems:(id)a3;
- (_TtC11SaveToFiles16DOCPickerContext)initWithURLs:(id)a3;
@end

@implementation DOCPickerContext

- (_TtC11SaveToFiles16DOCPickerContext)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SaveToFiles16DOCPickerContext_utisToSave) = (Class)_swiftEmptyArrayStorage;

  result = (_TtC11SaveToFiles16DOCPickerContext *)sub_1004D2DC0();
  __break(1u);
  return result;
}

- (_TtC11SaveToFiles16DOCPickerContext)initWithURLs:(id)a3
{
  sub_100036804(0, &qword_10062F5B8);
  unint64_t v3 = sub_1004D1510();
  return (_TtC11SaveToFiles16DOCPickerContext *)DOCPickerContext.init(with:)(v3);
}

- (_TtC11SaveToFiles16DOCPickerContext)initWithItems:(id)a3
{
  sub_100036804(0, (unint64_t *)&qword_10062D590);
  v4 = (objc_class *)sub_1004D1510();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SaveToFiles16DOCPickerContext_utisToSave) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SaveToFiles16DOCPickerContext_urlsToSave) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11SaveToFiles16DOCPickerContext_itemsToMove) = v4;
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