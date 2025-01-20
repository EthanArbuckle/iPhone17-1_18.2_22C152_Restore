@interface DOCColumnViewCell
- (_TtC11SaveToFiles17DOCColumnViewCell)initWithCoder:(id)a3;
- (_TtC11SaveToFiles17DOCColumnViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation DOCColumnViewCell

- (_TtC11SaveToFiles17DOCColumnViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC11SaveToFiles17DOCColumnViewCell *)sub_1001C7294(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC11SaveToFiles17DOCColumnViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC11SaveToFiles17DOCColumnViewCell *)sub_1001C7BD4((uint64_t)v3);

  return v4;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_1001C76C8();
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(DOCColumnViewCell *)&v5 prepareForReuse];
  sub_1001C7964();
  id v3 = *(id *)&v2[OBJC_IVAR____TtC11SaveToFiles17DOCColumnViewCell_navigationFocusGuide];
  sub_100026870(&qword_10062F1D0);
  Class isa = sub_1004D14F0().super.isa;
  objc_msgSend(v3, "setPreferredFocusEnvironments:", isa, v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles17DOCColumnViewCell_browserContainerController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11SaveToFiles17DOCColumnViewCell_navigationFocusGuide));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC11SaveToFiles17DOCColumnViewCell_separatorView);
}

@end