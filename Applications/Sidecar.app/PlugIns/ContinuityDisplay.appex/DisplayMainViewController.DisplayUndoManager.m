@interface DisplayMainViewController.DisplayUndoManager
- (BOOL)canRedo;
- (BOOL)canUndo;
- (_TtCC17ContinuityDisplay25DisplayMainViewController18DisplayUndoManager)init;
- (void)redo;
- (void)undo;
@end

@implementation DisplayMainViewController.DisplayUndoManager

- (void)undo
{
  v2 = self;
  sub_10003ADCC((__n128)xmmword_1000644F0);
}

- (void)redo
{
  v2 = self;
  sub_10003ADCC((__n128)xmmword_100064BE0);
}

- (BOOL)canUndo
{
  return 1;
}

- (BOOL)canRedo
{
  return 1;
}

- (_TtCC17ContinuityDisplay25DisplayMainViewController18DisplayUndoManager)init
{
  return (_TtCC17ContinuityDisplay25DisplayMainViewController18DisplayUndoManager *)sub_10003AEA8();
}

- (void).cxx_destruct
{
}

@end