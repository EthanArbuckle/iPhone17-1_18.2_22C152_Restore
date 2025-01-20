@interface WKSelectMultiplePicker
- (WKSelectMultiplePicker)initWithView:(id)a3;
- (id).cxx_construct;
- (id)_indexPathForRow:(int64_t)a3;
- (id)controlView;
- (void)configurePresentation;
- (void)controlBeginEditing;
- (void)controlEndEditing;
- (void)controlUpdateEditing;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5;
@end

@implementation WKSelectMultiplePicker

- (WKSelectMultiplePicker)initWithView:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)WKSelectMultiplePicker;
  v4 = [(WKSelectMultiplePicker *)&v11 init];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_view, a3);
    v6 = [[WKSelectPickerTableViewController alloc] initWithView:objc_loadWeak((id *)&v5->_view)];
    m_ptr = v5->_tableViewController.m_ptr;
    v5->_tableViewController.m_ptr = v6;
    if (m_ptr) {
      CFRelease(m_ptr);
    }
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v5->_tableViewController.m_ptr];
    v9 = v5->_navigationController.m_ptr;
    v5->_navigationController.m_ptr = (void *)v8;
    if (v9) {
      CFRelease(v9);
    }
  }
  return v5;
}

- (void)configurePresentation
{
  v10[2] = *MEMORY[0x1E4F143B8];
  int IsSmallScreen = PAL::currentUserInterfaceIdiomIsSmallScreen((PAL *)self);
  m_ptr = self->_navigationController.m_ptr;
  if (IsSmallScreen)
  {
    v5 = (void *)[m_ptr navigationBar];
    objc_msgSend(v5, "setBarTintColor:", objc_msgSend(MEMORY[0x1E4F428B8], "systemGroupedBackgroundColor"));
    v6 = (void *)[self->_navigationController.m_ptr presentationController];
    [v6 setDelegate:self];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (v6)
    {
      if (isKindOfClass)
      {
        v10[0] = [MEMORY[0x1E4F42DE8] mediumDetent];
        v10[1] = [MEMORY[0x1E4F42DE8] largeDetent];
        objc_msgSend(v6, "setDetents:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v10, 2));
        [v6 setWidthFollowsPreferredContentSizeWhenEdgeAttached:1];
        [v6 setPrefersEdgeAttachedInCompactHeight:1];
      }
    }
  }
  else
  {
    [m_ptr setModalPresentationStyle:7];
    [self->_navigationController.m_ptr setNavigationBarHidden:1];
    objc_msgSend(self->_tableViewController.m_ptr, "setPreferredContentSize:", 320.0, 320.0);
    uint64_t v8 = (void *)[self->_navigationController.m_ptr popoverPresentationController];
    [v8 setDelegate:self];
    p_view = &self->_view;
    [v8 setSourceView:objc_loadWeak((id *)p_view)];
    [objc_loadWeak((id *)p_view) focusedElementInformation];
    WebCore::IntRect::operator CGRect();
    CGRect v13 = CGRectIntegral(v12);
    objc_msgSend(v8, "setSourceRect:", v13.origin.x, v13.origin.y, v13.size.width, v13.size.height);
  }
}

- (id)controlView
{
  return 0;
}

- (void)controlBeginEditing
{
  p_view = &self->_view;
  [objc_loadWeak((id *)&self->_view) startRelinquishingFirstResponderToFocusedElement];
  [(WKSelectMultiplePicker *)self configurePresentation];
  v4 = objc_msgSend(objc_loadWeak((id *)p_view), "_wk_viewControllerForFullScreenPresentation");
  m_ptr = self->_navigationController.m_ptr;

  [v4 presentViewController:m_ptr animated:1 completion:0];
}

- (void)controlUpdateEditing
{
  v2 = (void *)[self->_tableViewController.m_ptr tableView];

  [v2 reloadData];
}

- (void)controlEndEditing
{
  [objc_loadWeak((id *)&self->_view) stopRelinquishingFirstResponderToFocusedElement];
  m_ptr = self->_tableViewController.m_ptr;

  [m_ptr dismissViewControllerAnimated:0 completion:0];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->_view);

  [Weak accessoryDone];
}

- (id)_indexPathForRow:(int64_t)a3
{
  uint64_t v4 = [objc_loadWeak((id *)&self->_view) focusedSelectElementOptions];
  uint64_t v5 = *(unsigned int *)(v4 + 12);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = 16 * v5;
  v10 = (unsigned __int8 *)(*(void *)v4 + 8);
  while (1)
  {
    int v11 = *v10;
    v10 += 16;
    if (!v11) {
      break;
    }
    uint64_t v7 = 0;
    ++v6;
LABEL_7:
    v9 -= 16;
    if (!v9) {
      return 0;
    }
  }
  if (v8 != a3)
  {
    ++v7;
    ++v8;
    goto LABEL_7;
  }
  CGRect v13 = (void *)MEMORY[0x1E4F28D58];

  return (id)[v13 indexPathForRow:v7 inSection:v6];
}

- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5
{
  id v6 = -[WKSelectMultiplePicker _indexPathForRow:](self, "_indexPathForRow:", a3, a4, a5);
  if (v6)
  {
    id v7 = v6;
    objc_msgSend((id)objc_msgSend(self->_tableViewController.m_ptr, "tableView"), "selectRowAtIndexPath:animated:scrollPosition:", v6, 0, 2);
    m_ptr = self->_tableViewController.m_ptr;
    uint64_t v9 = [m_ptr tableView];
    [m_ptr tableView:v9 didSelectRowAtIndexPath:v7];
  }
}

- (void).cxx_destruct
{
  m_ptr = self->_tableViewController.m_ptr;
  self->_tableViewController.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
  uint64_t v4 = self->_navigationController.m_ptr;
  self->_navigationController.m_ptr = 0;
  if (v4) {
    CFRelease(v4);
  }

  objc_destroyWeak((id *)&self->_view);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end