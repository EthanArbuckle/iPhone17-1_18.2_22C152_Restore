@interface SUISNavigationController
- (SUISSheetInteractionControllerDelegate)sheetInteractionDelegate;
- (void)_sheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5;
- (void)_sheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6;
- (void)_sheetInteractionDraggingDidEnd;
- (void)setSheetInteractionDelegate:(id)a3;
@end

@implementation SUISNavigationController

- (void)_sheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5
{
  +[SHSheetDraggingEvent eventForDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:](SHSheetDraggingEvent, "eventForDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:", a4, a3, a5.x, a5.y);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = [(SUISNavigationController *)self sheetInteractionDelegate];
  [v6 sheetInteractionController:self didReceiveDraggingEvent:v7];
}

- (void)_sheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6
{
  +[SHSheetDraggingEvent eventForDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:](SHSheetDraggingEvent, "eventForDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:", a5, a6, a3.x, a3.y, a4.x, a4.y);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [(SUISNavigationController *)self sheetInteractionDelegate];
  [v7 sheetInteractionController:self didReceiveDraggingEvent:v8];
}

- (void)_sheetInteractionDraggingDidEnd
{
  id v4 = +[SHSheetDraggingEvent eventForDraggingDidEnd];
  v3 = [(SUISNavigationController *)self sheetInteractionDelegate];
  [v3 sheetInteractionController:self didReceiveDraggingEvent:v4];
}

- (SUISSheetInteractionControllerDelegate)sheetInteractionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sheetInteractionDelegate);

  return (SUISSheetInteractionControllerDelegate *)WeakRetained;
}

- (void)setSheetInteractionDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end