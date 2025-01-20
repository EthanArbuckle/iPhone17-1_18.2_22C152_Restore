@interface InteractionHandlingView.UIViewType.PanDelegate
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (_TtCCV6Charts23InteractionHandlingView10UIViewType11PanDelegate)init;
@end

@implementation InteractionHandlingView.UIViewType.PanDelegate

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 0;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  return 1;
}

- (_TtCCV6Charts23InteractionHandlingView10UIViewType11PanDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for InteractionHandlingView.UIViewType.PanDelegate();
  return [(InteractionHandlingView.UIViewType.PanDelegate *)&v3 init];
}

@end