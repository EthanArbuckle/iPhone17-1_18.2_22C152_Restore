@interface TapbackPlatterContentView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TtC7ChatKit25TapbackPlatterContentView)initWithFrame:(CGRect)a3;
@end

@implementation TapbackPlatterContentView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  if (a3)
  {
    uint64_t v4 = sub_18F7B97E0();
    v6 = v5;
  }
  else
  {
    uint64_t v4 = 0;
    v6 = 0;
  }
  v7 = self;
  char v8 = sub_18F6E8CBC(v4, v6);

  swift_bridgeObjectRelease();
  return v8 & 1;
}

- (_TtC7ChatKit25TapbackPlatterContentView)initWithFrame:(CGRect)a3
{
  return (_TtC7ChatKit25TapbackPlatterContentView *)sub_18F6E8E68(self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, type metadata accessor for TapbackPlatterContentView);
}

@end