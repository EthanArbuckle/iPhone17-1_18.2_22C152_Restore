@interface UIAppIntentInteraction
- (UIView)view;
- (_TtC17_AppIntents_UIKit22UIAppIntentInteraction)init;
- (void)dealloc;
- (void)didMoveToView:(id)a3;
- (void)setView:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation UIAppIntentInteraction

- (UIView)view
{
  v2 = (void *)sub_22F3A1618();

  return (UIView *)v2;
}

- (void)didMoveToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22F3A273C();
}

- (void)willMoveToView:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_22F3A1E34();
}

- (void)setView:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_22F3A2108(a3);
}

- (void)dealloc
{
  v2 = self;
  UIAppIntentInteraction.__deallocating_deinit();
}

- (void).cxx_destruct
{
  sub_22F3BCDF8();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_4();
  v3();
  sub_22F3A36F0((uint64_t)self + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_suggestedIntent, &qword_2686BE530);
  sub_22F3A36F0((uint64_t)self + OBJC_IVAR____TtC17_AppIntents_UIKit22UIAppIntentInteraction_donateIdentifier, &qword_2686BE540);

  swift_unknownObjectWeakDestroy();
}

- (_TtC17_AppIntents_UIKit22UIAppIntentInteraction)init
{
}

@end