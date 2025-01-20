@interface ClimatePassthroughButton
- (_TtC7Climate24ClimatePassthroughButton)init;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
@end

@implementation ClimatePassthroughButton

- (_TtC7Climate24ClimatePassthroughButton)init
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for ClimatePassthroughButton();
  v2 = [(ClimateButton *)&v4 init];
  [(ClimatePassthroughButton *)v2 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];
  return v2;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  return 0;
}

@end