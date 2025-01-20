@interface InsetLabel
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel)initWithCoder:(id)a3;
- (_TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel)initWithFrame:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation InsetLabel

- (void)drawTextInRect:(CGRect)a3
{
  double v4 = UIEdgeInsetsInsetRect(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, *(double *)((char *)&self->super.super.super.super.isa+ OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets), *(double *)((char *)&self->super.super.super._responderFlags+ OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets));
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for InsetLabel();
  v11 = self;
  -[InsetLabel drawTextInRect:](&v12, sel_drawTextInRect_, v4, v6, v8, v10);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3 = *(double *)((char *)&self->super.super.super._responderFlags
                 + OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets)
     + *(double *)((char *)&self->super.super._constraintsExceptingSubviewAutoresizingConstraints
                 + OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets);
  CGFloat v4 = a3.width - v3;
  double v5 = *(double *)((char *)&self->super.super.super.super.isa
                 + OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets)
     + *(double *)((char *)&self->super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets);
  CGFloat v6 = a3.height - v5;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for InsetLabel();
  -[InsetLabel sizeThatFits:](&v11, sel_sizeThatFits_, v4, v6);
  double v8 = v3 + v7;
  double v10 = v5 + v9;
  result.height = v10;
  result.width = v8;
  return result;
}

- (CGSize)intrinsicContentSize
{
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for InsetLabel();
  v2 = (char *)v11.receiver;
  [(InsetLabel *)&v11 intrinsicContentSize];
  double v4 = v3;
  double v5 = *(double *)&v2[OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets];
  double v6 = *(double *)&v2[OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets + 16];
  double v8 = v7
     + *(double *)&v2[OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets + 8]
     + *(double *)&v2[OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets + 24];

  double v9 = v4 + v5 + v6;
  double v10 = v8;
  result.height = v9;
  result.width = v10;
  return result;
}

- (_TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  double v7 = (_OWORD *)((char *)self + OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets);
  *double v7 = xmmword_2180D1FF0;
  v7[1] = xmmword_2180D1FF0;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for InsetLabel();
  return -[InsetLabel initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
}

- (_TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel)initWithCoder:(id)a3
{
  double v4 = (_OWORD *)((char *)self + OBJC_IVAR____TtC14CloudSharingUIP33_4A02DC1A08FD7B0E3BB88ACABE05D63D10InsetLabel_insets);
  *double v4 = xmmword_2180D1FF0;
  v4[1] = xmmword_2180D1FF0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for InsetLabel();
  return [(InsetLabel *)&v6 initWithCoder:a3];
}

@end