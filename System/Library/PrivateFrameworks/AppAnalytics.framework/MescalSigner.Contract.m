@interface MescalSigner.Contract
- (_TtCC12AppAnalytics12MescalSignerP33_50212C62307B91282DB5DA35D73009738Contract)init;
@end

@implementation MescalSigner.Contract

- (_TtCC12AppAnalytics12MescalSignerP33_50212C62307B91282DB5DA35D73009738Contract)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR____TtCC12AppAnalytics12MescalSignerP33_50212C62307B91282DB5DA35D73009738Contract_bag;
  v5 = self;
  v6 = (void *)sub_1A916AF60();
  v7 = (void *)sub_1A916AF60();
  v8 = (objc_class *)objc_msgSend(self, sel_bagForProfile_profileVersion_, v6, v7);

  *(Class *)((char *)&self->super.isa + v4) = v8;
  v10.receiver = v5;
  v10.super_class = ObjectType;
  return [(MescalSigner.Contract *)&v10 init];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCC12AppAnalytics12MescalSignerP33_50212C62307B91282DB5DA35D73009738Contract_bag));
}

@end