@interface BETextInteraction
- (BETextInteraction)init;
- (BETextInteractionDelegate)delegate;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIContextMenuInteractionDelegate)contextMenuInteractionDelegate;
- (UITextSelectionDisplayInteraction)textSelectionDisplayInteraction;
- (UIView)view;
- (id)beTextInput;
- (void)addShortcutForText:(id)a3 fromRect:(CGRect)a4;
- (void)didMoveToView:(id)a3;
- (void)dismissEditMenuForSelection;
- (void)editabilityChanged;
- (void)presentEditMenuForSelection;
- (void)refreshKeyboardUI;
- (void)selectionBoundaryAdjustedToPoint:(CGPoint)a3 touchPhase:(int64_t)a4 flags:(unint64_t)a5;
- (void)selectionChangedWithGestureAtPoint:(CGPoint)a3 gesture:(int64_t)a4 state:(int64_t)a5 flags:(unint64_t)a6;
- (void)selectionDidChange:(id)a3;
- (void)selectionWillChange:(id)a3;
- (void)setContextMenuInteractionDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)shareText:(id)a3 fromRect:(CGRect)a4;
- (void)showDictionaryForTextInContext:(id)a3 definingTextInRange:(_NSRange)a4 fromRect:(CGRect)a5;
- (void)showReplacementsForText:(id)a3;
- (void)translateText:(id)a3 fromRect:(CGRect)a4;
- (void)transliterateChineseForText:(id)a3;
- (void)willMoveToView:(id)a3;
@end

@implementation BETextInteraction

- (BETextInteraction)init
{
  v6.receiver = self;
  v6.super_class = (Class)BETextInteraction;
  v2 = [(BETextInteraction *)&v6 init];
  if (v2)
  {
    v3 = (UIAsyncTextInteraction *)objc_alloc_init(MEMORY[0x263F82488]);
    interaction = v2->_interaction;
    v2->_interaction = v3;

    [(UIAsyncTextInteraction *)v2->_interaction setDelegate:v2];
  }
  return v2;
}

- (void)didMoveToView:(id)a3
{
  p_view = &self->_view;
  id v5 = a3;
  objc_storeWeak((id *)p_view, v5);
  [v5 addInteraction:self->_interaction];
}

- (void)setContextMenuInteractionDelegate:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)willMoveToView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  [WeakRetained removeInteraction:self->_interaction];
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (id)beTextInput
{
  p_view = &self->_view;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  int v4 = [WeakRetained conformsToProtocol:&unk_26F8B0580];

  if (v4) {
    id v5 = objc_loadWeakRetained((id *)p_view);
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (void)addShortcutForText:(id)a3 fromRect:(CGRect)a4
{
}

- (void)shareText:(id)a3 fromRect:(CGRect)a4
{
}

- (void)showDictionaryForTextInContext:(id)a3 definingTextInRange:(_NSRange)a4 fromRect:(CGRect)a5
{
}

- (void)translateText:(id)a3 fromRect:(CGRect)a4
{
}

- (void)showReplacementsForText:(id)a3
{
}

- (void)transliterateChineseForText:(id)a3
{
}

- (void)presentEditMenuForSelection
{
}

- (void)dismissEditMenuForSelection
{
}

- (void)refreshKeyboardUI
{
}

- (void)editabilityChanged
{
}

- (void)selectionChangedWithGestureAtPoint:(CGPoint)a3 gesture:(int64_t)a4 state:(int64_t)a5 flags:(unint64_t)a6
{
  interaction = self->_interaction;
  if ((unint64_t)(a4 - 1) > 0xD) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = qword_24325B550[a4 - 1];
  }
  -[UIAsyncTextInteraction selectionChangedWithGestureAt:withGesture:withState:withFlags:](interaction, "selectionChangedWithGestureAt:withGesture:withState:withFlags:", v7, a5, a6 & 7, a3.x, a3.y);
}

- (void)selectionBoundaryAdjustedToPoint:(CGPoint)a3 touchPhase:(int64_t)a4 flags:(unint64_t)a5
{
  interaction = self->_interaction;
  if ((unint64_t)a4 >= 5) {
    a4 = 5;
  }
  -[UIAsyncTextInteraction selectionChangedWithTouchAt:withSelectionTouch:withFlags:](interaction, "selectionChangedWithTouchAt:withSelectionTouch:withFlags:", a4, a5 & 7, a3.x, a3.y);
}

- (UITextSelectionDisplayInteraction)textSelectionDisplayInteraction
{
  return (UITextSelectionDisplayInteraction *)[(UIAsyncTextInteraction *)self->_interaction textSelectionDisplayInteraction];
}

- (UIContextMenuInteractionDelegate)contextMenuInteractionDelegate
{
  return (UIContextMenuInteractionDelegate *)[(UIAsyncTextInteraction *)self->_interaction contextMenuInteractionDelegate];
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  return (UIContextMenuInteraction *)[(UIAsyncTextInteraction *)self->_interaction contextMenuInteraction];
}

- (void)selectionWillChange:(id)a3
{
  int v4 = [(BETextInteraction *)self delegate];
  [v4 systemWillChangeSelectionForInteraction:self];

  id v6 = [(BETextInteraction *)self beTextInput];
  id v5 = [v6 asyncInputDelegate];
  [v5 selectionWillChangeForTextInput:v6];
}

- (void)selectionDidChange:(id)a3
{
  id v6 = [(BETextInteraction *)self beTextInput];
  int v4 = [v6 asyncInputDelegate];
  [v4 selectionDidChangeForTextInput:v6];

  id v5 = [(BETextInteraction *)self delegate];
  [v5 systemDidChangeSelectionForInteraction:self];
}

- (BETextInteractionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BETextInteractionDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_view);

  objc_storeStrong((id *)&self->_interaction, 0);
}

@end