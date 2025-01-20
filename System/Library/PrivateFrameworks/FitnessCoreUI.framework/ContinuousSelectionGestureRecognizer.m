@interface ContinuousSelectionGestureRecognizer
- (_TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation ContinuousSelectionGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  id v6 = a4;
  v7 = self;
  sub_24EEA320C((uint64_t)v6);
  swift_release();
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
}

- (_TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  sub_24EEDD9B0();
  sub_24EEDD9A0();
  sub_24EEDD990();
  if ((swift_task_isCurrentExecutor() & 1) == 0) {
    swift_task_reportUnexpectedExecutor();
  }
  if (a3)
  {
    swift_unknownObjectRetain();
    sub_24EEDDB70();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
  }
  id v6 = (_TtC13FitnessCoreUI36ContinuousSelectionGestureRecognizer *)sub_24EEA2D44((uint64_t)v8, (uint64_t)a4);
  swift_release();
  return v6;
}

- (void).cxx_destruct
{
}

@end