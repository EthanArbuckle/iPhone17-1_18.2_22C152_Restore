@interface DOCColumnViewCell
- (_TtC33com_apple_DocumentManager_Service17DOCColumnViewCell)initWithCoder:(id)a3;
- (_TtC33com_apple_DocumentManager_Service17DOCColumnViewCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation DOCColumnViewCell

- (_TtC33com_apple_DocumentManager_Service17DOCColumnViewCell)initWithFrame:(CGRect)a3
{
  return (_TtC33com_apple_DocumentManager_Service17DOCColumnViewCell *)sub_100044A24(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC33com_apple_DocumentManager_Service17DOCColumnViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  v4 = (_TtC33com_apple_DocumentManager_Service17DOCColumnViewCell *)sub_1000458B4((uint64_t)v3);

  return v4;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100044E58();
}

- (void)prepareForReuse
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(DOCColumnViewCell *)&v5 prepareForReuse];
  sub_1000450F4();
  id v3 = *(id *)&v2[OBJC_IVAR____TtC33com_apple_DocumentManager_Service17DOCColumnViewCell_navigationFocusGuide];
  sub_100027178((uint64_t *)&unk_10062BE70);
  Class isa = sub_1004CD5A0().super.isa;
  objc_msgSend(v3, "setPreferredFocusEnvironments:", isa, v5.receiver, v5.super_class);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service17DOCColumnViewCell_browserContainerController));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC33com_apple_DocumentManager_Service17DOCColumnViewCell_navigationFocusGuide));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC33com_apple_DocumentManager_Service17DOCColumnViewCell_separatorView);
}

@end