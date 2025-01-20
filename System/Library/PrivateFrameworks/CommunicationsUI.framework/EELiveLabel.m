@interface EELiveLabel
- (CGSize)intrinsicContentSize;
- (_TtC16CommunicationsUI11EELiveLabel)init;
- (_TtC16CommunicationsUI11EELiveLabel)initWithCoder:(id)a3;
- (_TtC16CommunicationsUI11EELiveLabel)initWithFrame:(CGRect)a3;
- (void)drawTextInRect:(CGRect)a3;
@end

@implementation EELiveLabel

- (_TtC16CommunicationsUI11EELiveLabel)init
{
  return (_TtC16CommunicationsUI11EELiveLabel *)EELiveLabel.init()();
}

- (void)drawTextInRect:(CGRect)a3
{
  double v4 = UIEdgeInsetsInsetRect(a3.origin.x);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for EELiveLabel();
  v11 = self;
  -[EELiveLabel drawTextInRect:](&v12, sel_drawTextInRect_, v4, v6, v8, v10);
}

- (CGSize)intrinsicContentSize
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for EELiveLabel();
  [(EELiveLabel *)&v6 intrinsicContentSize];
  double v3 = v2 + 10.0;
  double v5 = v4 + 2.0;
  result.height = v5;
  result.width = v3;
  return result;
}

- (_TtC16CommunicationsUI11EELiveLabel)initWithCoder:(id)a3
{
  CGSize result = (_TtC16CommunicationsUI11EELiveLabel *)sub_24A669A68();
  __break(1u);
  return result;
}

- (_TtC16CommunicationsUI11EELiveLabel)initWithFrame:(CGRect)a3
{
}

@end