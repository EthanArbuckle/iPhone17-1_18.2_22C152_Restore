@interface DOCPickerContext
- (_TtC33com_apple_DocumentManager_Service16DOCPickerContext)init;
- (_TtC33com_apple_DocumentManager_Service16DOCPickerContext)initWithItems:(id)a3;
- (_TtC33com_apple_DocumentManager_Service16DOCPickerContext)initWithURLs:(id)a3;
@end

@implementation DOCPickerContext

- (_TtC33com_apple_DocumentManager_Service16DOCPickerContext)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCPickerContext_utisToSave) = (Class)_swiftEmptyArrayStorage;

  result = (_TtC33com_apple_DocumentManager_Service16DOCPickerContext *)sub_1004CEE70();
  __break(1u);
  return result;
}

- (_TtC33com_apple_DocumentManager_Service16DOCPickerContext)initWithURLs:(id)a3
{
  sub_10003AE74(0, &qword_1006360E0);
  unint64_t v3 = sub_1004CD5C0();
  return (_TtC33com_apple_DocumentManager_Service16DOCPickerContext *)DOCPickerContext.init(with:)(v3);
}

- (_TtC33com_apple_DocumentManager_Service16DOCPickerContext)initWithItems:(id)a3
{
  sub_10003AE74(0, (unint64_t *)&qword_10062AFB0);
  v4 = (objc_class *)sub_1004CD5C0();
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCPickerContext_utisToSave) = (Class)_swiftEmptyArrayStorage;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCPickerContext_urlsToSave) = 0;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC33com_apple_DocumentManager_Service16DOCPickerContext_itemsToMove) = v4;
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