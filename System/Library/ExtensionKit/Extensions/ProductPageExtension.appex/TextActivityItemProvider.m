@interface TextActivityItemProvider
- (_TtC20ProductPageExtension24TextActivityItemProvider)initWithPlaceholderItem:(id)a3;
- (id)activityViewController:(id)a3 itemForActivityType:(id)a4;
- (id)item;
@end

@implementation TextActivityItemProvider

- (id)activityViewController:(id)a3 itemForActivityType:(id)a4
{
  if (a4)
  {
    id v7 = a3;
    v8 = self;
    id v9 = a4;
    if (sub_100694FBC())
    {

      v10 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    id v11 = a3;
    v12 = self;
  }
  uint64_t v14 = *(uint64_t *)((char *)&self->super.super.super.isa
                   + OBJC_IVAR____TtC20ProductPageExtension24TextActivityItemProvider_text);
  uint64_t v13 = *(void *)&self->text[OBJC_IVAR____TtC20ProductPageExtension24TextActivityItemProvider_text];
  v21[3] = &type metadata for String;
  v21[0] = v14;
  v21[1] = v13;
  swift_bridgeObjectRetain();

  v15 = sub_10000FA3C(v21, (uint64_t)&type metadata for String);
  uint64_t v16 = *(&type metadata for String - 1);
  __n128 v17 = __chkstk_darwin(v15);
  v19 = (char *)v21 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, __n128))(v16 + 16))(v19, v17);
  v10 = (void *)sub_10077D210();
  (*(void (**)(char *, void *))(v16 + 8))(v19, &type metadata for String);
  _s20ProductPageExtension22AutoAdjustingPlaceableVwxx_0((uint64_t)v21);
LABEL_6:

  return v10;
}

- (id)item
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_10077D270();

  return v2;
}

- (_TtC20ProductPageExtension24TextActivityItemProvider)initWithPlaceholderItem:(id)a3
{
  swift_unknownObjectRetain();
  sub_10077CDF0();
  swift_unknownObjectRelease();
  result = (_TtC20ProductPageExtension24TextActivityItemProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end