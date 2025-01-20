@interface DOCColumnViewCell
- (_TtC18DocumentAppIntents17DOCColumnViewCell)initWithCoder:(id)a3;
- (_TtC18DocumentAppIntents17DOCColumnViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation DOCColumnViewCell

- (_TtC18DocumentAppIntents17DOCColumnViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC18DocumentAppIntents17DOCColumnViewCell *)sub_10012B824(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC18DocumentAppIntents17DOCColumnViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC18DocumentAppIntents17DOCColumnViewCell *)sub_10012C53C((uint64_t)v3);

  return v4;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_10012BC58();
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(DOCColumnViewCell *)&v5 prepareForReuse];
  sub_10012BEF4();
  id v3 = *(id *)&v2[OBJC_IVAR____TtC18DocumentAppIntents17DOCColumnViewCell_navigationFocusGuide];
  sub_1000305BC((uint64_t *)&unk_10065A7E0);
  Class isa = sub_1004F47D0().super.isa;
  objc_msgSend(v3, "setPreferredFocusEnvironments:", isa, v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents17DOCColumnViewCell_browserContainerController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC18DocumentAppIntents17DOCColumnViewCell_navigationFocusGuide));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC18DocumentAppIntents17DOCColumnViewCell_separatorView);
}

@end