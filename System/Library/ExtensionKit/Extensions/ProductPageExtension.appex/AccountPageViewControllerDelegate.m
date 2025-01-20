@interface AccountPageViewControllerDelegate
- (_TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate)init;
- (void)accountPageViewControllerDidFinish:(id)a3;
@end

@implementation AccountPageViewControllerDelegate

- (_TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate)init
{
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate_selfReference) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AccountPageViewControllerDelegate();
  v2 = [(AccountPageViewControllerDelegate *)&v6 init];
  v3 = *(Class *)((char *)&v2->super.isa
                + OBJC_IVAR____TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate_selfReference);
  *(Class *)((char *)&v2->super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate_selfReference) = (Class)v2;
  v4 = v2;

  return v4;
}

- (void)accountPageViewControllerDidFinish:(id)a3
{
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = self;
  v9[4] = sub_10048ED8C;
  v9[5] = v5;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_1000A3B88;
  v9[3] = &unk_10089C328;
  objc_super v6 = _Block_copy(v9);
  v7 = self;
  id v8 = a3;
  swift_release();
  [v8 dismissViewControllerAnimated:1 completion:v6];
  _Block_release(v6);
}

- (void).cxx_destruct
{
  v2 = *(char **)((char *)&self->super.isa
                + OBJC_IVAR____TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate_selfReference);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate_selfReference) = 0;
  v3 = v2;
  if (v2)
  {
    while (1)
    {
      objc_super v6 = v3;
      if (!swift_isUniquelyReferenced()) {
        break;
      }
      v4 = *(char **)&v6[OBJC_IVAR____TtC20ProductPageExtensionP33_F5913BF55198538BC94C4AFB9B61CBF133AccountPageViewControllerDelegate_selfReference];
      uint64_t v5 = v4;

      v3 = v4;
      if (!v4) {
        goto LABEL_6;
      }
    }
    v3 = v6;
  }
LABEL_6:
}

@end