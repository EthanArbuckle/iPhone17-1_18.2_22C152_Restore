@interface WKNSKeyEventSimulatorUndoManager
- (BOOL)canRedo;
- (BOOL)canUndo;
- (void)redo;
- (void)undo;
@end

@implementation WKNSKeyEventSimulatorUndoManager

- (BOOL)canUndo
{
  return 1;
}

- (BOOL)canRedo
{
  return 1;
}

- (void)undo
{
  v2 = [(WKNSUndoManager *)self contentView];

  [(WKContentView *)v2 generateSyntheticEditingCommand:0];
}

- (void)redo
{
  v2 = [(WKNSUndoManager *)self contentView];

  [(WKContentView *)v2 generateSyntheticEditingCommand:1];
}

@end