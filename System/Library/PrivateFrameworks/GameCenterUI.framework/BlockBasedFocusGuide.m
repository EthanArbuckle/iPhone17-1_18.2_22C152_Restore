@interface BlockBasedFocusGuide
- (BOOL)isEnabled;
- (_TtC12GameCenterUI20BlockBasedFocusGuide)init;
- (_TtC12GameCenterUI20BlockBasedFocusGuide)initWithCoder:(id)a3;
- (void)setEnabled:(BOOL)a3;
@end

@implementation BlockBasedFocusGuide

- (_TtC12GameCenterUI20BlockBasedFocusGuide)initWithCoder:(id)a3
{
}

- (BOOL)isEnabled
{
  v2 = self;
  unsigned __int8 v3 = sub_1AF3F5A4C();

  return v3 & 1;
}

- (void)setEnabled:(BOOL)a3
{
  v4 = self;
  sub_1AF3F5B20(a3);
}

- (_TtC12GameCenterUI20BlockBasedFocusGuide)init
{
}

- (void).cxx_destruct
{
}

@end