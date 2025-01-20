@interface CommunicationControl
- (BOOL)isEnabled;
- (CGSize)intrinsicContentSize;
- (UIColor)tintColor;
- (UILabel)label;
- (_TtC13SharedWithYou20CommunicationControl)initWithCoder:(id)a3;
- (_TtC13SharedWithYou20CommunicationControl)initWithFrame:(CGRect)a3;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (void)setEnabled:(BOOL)a3;
- (void)setTintColor:(id)a3;
- (void)tintColorDidChange;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation CommunicationControl

- (CGSize)intrinsicContentSize
{
  v2 = self;
  sub_18FB46114();
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (UILabel)label
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                            + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label));
}

- (BOOL)isEnabled
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(CommunicationControl *)&v3 isEnabled];
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v9.receiver = self;
  v9.super_class = ObjectType;
  double v6 = self;
  char v7 = [(CommunicationControl *)&v9 isEnabled];
  v8.receiver = v6;
  v8.super_class = ObjectType;
  [(CommunicationControl *)&v8 setEnabled:v3];
  sub_18FB4647C(v7);
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  v2 = [(CommunicationControl *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(CommunicationControl *)&v6 setTintColor:v4];
  sub_18FB46928();
}

- (_TtC13SharedWithYou20CommunicationControl)initWithCoder:(id)a3
{
  return 0;
}

- (void)tintColorDidChange
{
  v2 = self;
  sub_18FB47900();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  objc_super v6 = self;
  sub_18FB47A8C(a3);
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  objc_super v6 = self;
  id v7 = sub_18FB48104();

  return v7;
}

- (_TtC13SharedWithYou20CommunicationControl)initWithFrame:(CGRect)a3
{
  CGSize result = (_TtC13SharedWithYou20CommunicationControl *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_touchUpInsideActionIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_label));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC13SharedWithYou20CommunicationControl_menu);
}

@end