@interface AUGenericViewClumpBackground
- (UIColor)tintColor;
- (_TtC12CoreAudioKit28AUGenericViewClumpBackground)initWithCoder:(id)a3;
- (_TtC12CoreAudioKit28AUGenericViewClumpBackground)initWithFrame:(CGRect)a3;
- (void)setTintColor:(id)a3;
@end

@implementation AUGenericViewClumpBackground

- (_TtC12CoreAudioKit28AUGenericViewClumpBackground)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for AUGenericViewClumpBackground();
  v7 = -[AUGenericViewClumpBackground initWithFrame:](&v9, sel_initWithFrame_, x, y, width, height);
  sub_21E59D718();

  return v7;
}

- (_TtC12CoreAudioKit28AUGenericViewClumpBackground)initWithCoder:(id)a3
{
  result = (_TtC12CoreAudioKit28AUGenericViewClumpBackground *)sub_21E5B6A78();
  __break(1u);
  return result;
}

- (UIColor)tintColor
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for AUGenericViewClumpBackground();
  v2 = [(AUGenericViewClumpBackground *)&v4 tintColor];

  return v2;
}

- (void)setTintColor:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for AUGenericViewClumpBackground();
  id v4 = a3;
  id v5 = v6.receiver;
  [(AUGenericViewClumpBackground *)&v6 setTintColor:v4];
  sub_21E59DA00();
}

@end