@interface GeoLookupResultActionButtonLayoutBuilder
- (_TtC6Tamale40GeoLookupResultActionButtonLayoutBuilder)init;
@end

@implementation GeoLookupResultActionButtonLayoutBuilder

- (_TtC6Tamale40GeoLookupResultActionButtonLayoutBuilder)init
{
  uint64_t v3 = sub_10000F214((uint64_t *)&unk_100522B30);
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR____TtC6Tamale40GeoLookupResultActionButtonLayoutBuilder__actionBarItems;
  v14 = _swiftEmptyArrayStorage;
  v8 = self;
  sub_10000F214(&qword_100522A60);
  Published.init(initialValue:)();
  (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v7, v6, v3);
  uint64_t v9 = OBJC_IVAR____TtC6Tamale40GeoLookupResultActionButtonLayoutBuilder_helper;
  *(Class *)((char *)&v8->super.isa + v9) = (Class)[self sharedHelper];

  v10 = (objc_class *)type metadata accessor for GeoLookupResultActionButtonLayoutBuilder(0);
  v13.receiver = v8;
  v13.super_class = v10;
  return [(GeoLookupResultActionButtonLayoutBuilder *)&v13 init];
}

- (void).cxx_destruct
{
  uint64_t v3 = (char *)self + OBJC_IVAR____TtC6Tamale40GeoLookupResultActionButtonLayoutBuilder__actionBarItems;
  uint64_t v4 = sub_10000F214((uint64_t *)&unk_100522B30);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  uint64_t v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC6Tamale40GeoLookupResultActionButtonLayoutBuilder_helper);
}

@end