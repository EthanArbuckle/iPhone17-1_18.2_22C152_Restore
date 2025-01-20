@interface WKTextInteractionWrapper
- (UIContextMenuInteraction)contextMenuInteraction;
- (UIWKTextInteractionAssistant)textInteractionAssistant;
- (WKTextInteractionWrapper)initWithView:(id)a3;
- (id).cxx_construct;
- (void)activateSelection;
- (void)deactivateSelection;
- (void)dealloc;
- (void)didEndScrollingOrZooming;
- (void)didEndScrollingOverflow;
- (void)lookup:(id)a3 withRange:(_NSRange)a4 fromRect:(CGRect)a5;
- (void)scheduleChineseTransliterationForText:(id)a3;
- (void)scheduleReplacementsForText:(id)a3;
- (void)selectAll:(id)a3;
- (void)selectWord;
- (void)selectionChanged;
- (void)selectionChangedWithGestureAt:(CGPoint)a3 withGesture:(int64_t)a4 withState:(int64_t)a5 withFlags:(unint64_t)a6;
- (void)selectionChangedWithTouchAt:(CGPoint)a3 withSelectionTouch:(int64_t)a4 withFlags:(unint64_t)a5;
- (void)setExternalContextMenuInteractionDelegate:(id)a3;
- (void)setGestureRecognizers;
- (void)showEditMenuTimerFired;
- (void)showShareSheetFor:(id)a3 fromRect:(CGRect)a4;
- (void)showTextServiceFor:(id)a3 fromRect:(CGRect)a4;
- (void)stopShowEditMenuTimer;
- (void)translate:(id)a3 fromRect:(CGRect)a4;
- (void)willStartScrollingOrZooming;
- (void)willStartScrollingOverflow;
@end

@implementation WKTextInteractionWrapper

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 4) = 0;
  return self;
}

- (void)setExternalContextMenuInteractionDelegate:(id)a3
{
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "setExternalContextMenuInteractionDelegate:");
  m_ptr = self->_asyncTextInteraction.m_ptr;

  [m_ptr setContextMenuInteractionDelegate:a3];
}

- (WKTextInteractionWrapper)initWithView:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WKTextInteractionWrapper;
  v4 = [(WKTextInteractionWrapper *)&v11 init];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_view, a3);
    if ([a3 shouldUseAsyncInteractions])
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F18BD8]);
      m_ptr = v5->_asyncTextInteraction.m_ptr;
      v5->_asyncTextInteraction.m_ptr = v6;
      if (m_ptr)
      {
        CFRelease(m_ptr);
        id v6 = v5->_asyncTextInteraction.m_ptr;
      }
      [v6 setDelegate:a3];
      [a3 addInteraction:v5->_asyncTextInteraction.m_ptr];
    }
    else
    {
      uint64_t v8 = [objc_alloc(MEMORY[0x1E4F43040]) initWithView:a3];
      v9 = v5->_textInteractionAssistant.m_ptr;
      v5->_textInteractionAssistant.m_ptr = (void *)v8;
      if (v9) {
        CFRelease(v9);
      }
    }
  }
  return v5;
}

- (void)dealloc
{
  [(WKTextInteractionWrapper *)self stopShowEditMenuTimer];
  if (self->_asyncTextInteraction.m_ptr) {
    [objc_loadWeak((id *)&self->_view) removeInteraction:self->_asyncTextInteraction.m_ptr];
  }
  v3.receiver = self;
  v3.super_class = (Class)WKTextInteractionWrapper;
  [(WKTextInteractionWrapper *)&v3 dealloc];
}

- (UIWKTextInteractionAssistant)textInteractionAssistant
{
  return (UIWKTextInteractionAssistant *)self->_textInteractionAssistant.m_ptr;
}

- (void)activateSelection
{
  [self->_textInteractionAssistant.m_ptr activateSelection];
  objc_super v3 = (void *)[self->_asyncTextInteraction.m_ptr textSelectionDisplayInteraction];

  [v3 setActivated:1];
}

- (void)deactivateSelection
{
  [self->_textInteractionAssistant.m_ptr deactivateSelection];
  objc_msgSend((id)objc_msgSend(self->_asyncTextInteraction.m_ptr, "textSelectionDisplayInteraction"), "setActivated:", 0);
  self->_showEditMenuAfterNextSelectionChange = 0;

  [(WKTextInteractionWrapper *)self stopShowEditMenuTimer];
}

- (void)selectionChanged
{
  [self->_textInteractionAssistant.m_ptr selectionChanged];
  [self->_asyncTextInteraction.m_ptr refreshKeyboardUI];
  [(WKTextInteractionWrapper *)self stopShowEditMenuTimer];
  BOOL showEditMenuAfterNextSelectionChange = self->_showEditMenuAfterNextSelectionChange;
  self->_BOOL showEditMenuAfterNextSelectionChange = 0;
  if (showEditMenuAfterNextSelectionChange)
  {
    v4 = (void *)[MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel_showEditMenuTimerFired selector:0 userInfo:0 repeats:0.2];
    v5 = v4;
    if (v4) {
      CFRetain(v4);
    }
    m_ptr = self->_showEditMenuTimer.m_ptr;
    self->_showEditMenuTimer.m_ptr = v5;
    if (m_ptr)
    {
      CFRelease(m_ptr);
    }
  }
}

- (void)setGestureRecognizers
{
  [self->_textInteractionAssistant.m_ptr setGestureRecognizers];
  m_ptr = self->_asyncTextInteraction.m_ptr;

  [m_ptr editabilityChanged];
}

- (void)willStartScrollingOverflow
{
  [self->_textInteractionAssistant.m_ptr willStartScrollingOverflow];
  self->_shouldRestoreEditMenuAfterOverflowScrolling = [objc_loadWeak((id *)&self->_view) isPresentingEditMenu];
  [self->_asyncTextInteraction.m_ptr dismissEditMenuForSelection];
  objc_super v3 = (void *)[self->_asyncTextInteraction.m_ptr textSelectionDisplayInteraction];

  [v3 setActivated:0];
}

- (void)didEndScrollingOverflow
{
  [self->_textInteractionAssistant.m_ptr didEndScrollingOverflow];
  BOOL shouldRestoreEditMenuAfterOverflowScrolling = self->_shouldRestoreEditMenuAfterOverflowScrolling;
  self->_BOOL shouldRestoreEditMenuAfterOverflowScrolling = 0;
  if (shouldRestoreEditMenuAfterOverflowScrolling) {
    [self->_asyncTextInteraction.m_ptr presentEditMenuForSelection];
  }
  v4 = (void *)[self->_asyncTextInteraction.m_ptr textSelectionDisplayInteraction];

  [v4 setActivated:1];
}

- (void)willStartScrollingOrZooming
{
  [self->_textInteractionAssistant.m_ptr willStartScrollingOrZooming];
  self->_BOOL shouldRestoreEditMenuAfterOverflowScrolling = [objc_loadWeak((id *)&self->_view) isPresentingEditMenu];
  m_ptr = self->_asyncTextInteraction.m_ptr;

  [m_ptr dismissEditMenuForSelection];
}

- (void)didEndScrollingOrZooming
{
  [self->_textInteractionAssistant.m_ptr didEndScrollingOrZooming];
  BOOL shouldRestoreEditMenuAfterOverflowScrolling = self->_shouldRestoreEditMenuAfterOverflowScrolling;
  self->_BOOL shouldRestoreEditMenuAfterOverflowScrolling = 0;
  if (shouldRestoreEditMenuAfterOverflowScrolling)
  {
    m_ptr = self->_asyncTextInteraction.m_ptr;
    [m_ptr presentEditMenuForSelection];
  }
}

- (void)selectionChangedWithGestureAt:(CGPoint)a3 withGesture:(int64_t)a4 withState:(int64_t)a5 withFlags:(unint64_t)a6
{
  double y = a3.y;
  double x = a3.x;
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "selectionChangedWithGestureAt:withGesture:withState:withFlags:");
  m_ptr = self->_asyncTextInteraction.m_ptr;

  objc_msgSend(m_ptr, "selectionChangedWithGestureAtPoint:gesture:state:flags:", a4, a5, a6, x, y);
}

- (void)selectionChangedWithTouchAt:(CGPoint)a3 withSelectionTouch:(int64_t)a4 withFlags:(unint64_t)a5
{
  double y = a3.y;
  double x = a3.x;
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "selectionChangedWithTouchAt:withSelectionTouch:withFlags:");
  m_ptr = self->_asyncTextInteraction.m_ptr;

  objc_msgSend(m_ptr, "selectionBoundaryAdjustedToPoint:touchPhase:flags:", a4, a5, x, y);
}

- (void)lookup:(id)a3 withRange:(_NSRange)a4 fromRect:(CGRect)a5
{
  double height = a5.size.height;
  double width = a5.size.width;
  double y = a5.origin.y;
  double x = a5.origin.x;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "lookup:withRange:fromRect:");
  m_ptr = self->_asyncTextInteraction.m_ptr;

  objc_msgSend(m_ptr, "showDictionaryForTextInContext:definingTextInRange:fromRect:", a3, location, length, x, y, width, height);
}

- (void)showShareSheetFor:(id)a3 fromRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "showShareSheetFor:fromRect:");
  m_ptr = self->_asyncTextInteraction.m_ptr;

  objc_msgSend(m_ptr, "shareText:fromRect:", a3, x, y, width, height);
}

- (void)showTextServiceFor:(id)a3 fromRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "showTextServiceFor:fromRect:");
  m_ptr = self->_asyncTextInteraction.m_ptr;

  objc_msgSend(m_ptr, "addShortcutForText:fromRect:", a3, x, y, width, height);
}

- (void)scheduleReplacementsForText:(id)a3
{
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "scheduleReplacementsForText:");
  m_ptr = self->_asyncTextInteraction.m_ptr;

  [m_ptr showReplacementsForText:a3];
}

- (void)scheduleChineseTransliterationForText:(id)a3
{
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "scheduleChineseTransliterationForText:");
  m_ptr = self->_asyncTextInteraction.m_ptr;

  [m_ptr transliterateChineseForText:a3];
}

- (void)translate:(id)a3 fromRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  objc_msgSend(self->_textInteractionAssistant.m_ptr, "translate:fromRect:");
  m_ptr = self->_asyncTextInteraction.m_ptr;

  objc_msgSend(m_ptr, "translateText:fromRect:", a3, x, y, width, height);
}

- (void)selectWord
{
  self->_BOOL showEditMenuAfterNextSelectionChange = 1;
}

- (void)selectAll:(id)a3
{
  self->_BOOL showEditMenuAfterNextSelectionChange = 1;
}

- (void)showEditMenuTimerFired
{
  [(WKTextInteractionWrapper *)self stopShowEditMenuTimer];
  m_ptr = self->_asyncTextInteraction.m_ptr;

  [m_ptr presentEditMenuForSelection];
}

- (void)stopShowEditMenuTimer
{
  m_ptr = self->_showEditMenuTimer.m_ptr;
  self->_showEditMenuTimer.m_ptr = 0;
  [m_ptr invalidate];
  if (m_ptr)
  {
    CFRelease(m_ptr);
  }
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  m_ptr = self->_asyncTextInteraction.m_ptr;
  if (!m_ptr) {
    m_ptr = self->_textInteractionAssistant.m_ptr;
  }
  return (UIContextMenuInteraction *)[m_ptr contextMenuInteraction];
}

- (void).cxx_destruct
{
  m_ptr = self->_showEditMenuTimer.m_ptr;
  self->_showEditMenuTimer.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  v4 = self->_asyncTextInteraction.m_ptr;
  self->_asyncTextInteraction.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }
  v5 = self->_textInteractionAssistant.m_ptr;
  self->_textInteractionAssistant.m_ptr = 0;
  if (v5) {
    CFRelease(v5);
  }

  objc_destroyWeak((id *)&self->_view);
}

@end