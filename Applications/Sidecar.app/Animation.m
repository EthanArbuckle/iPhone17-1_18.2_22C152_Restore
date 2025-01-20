@interface Animation
- (_TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation)init;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)animationEnded:(BOOL)a3;
- (void)dealloc;
@end

@implementation Animation

- (void)dealloc
{
  v2 = self;
  sub_100010C44();
}

- (void).cxx_destruct
{
}

- (double)transitionDuration:(id)a3
{
  return sub_100010D04();
}

- (void)animateTransition:(id)a3
{
}

- (void)animationEnded:(BOOL)a3
{
  v3 = self;
  sub_100010D5C();
}

- (_TtC7SidecarP33_B1827D7A219FDFB98F7225EB7121A0B79Animation)init
{
}

@end