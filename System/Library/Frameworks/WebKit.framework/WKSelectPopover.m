@interface WKSelectPopover
- (UITableViewController)tableViewController;
- (WKSelectPopover)initWithView:(id)a3 hasGroups:(BOOL)a4;
- (id).cxx_construct;
- (id)controlView;
- (void)controlBeginEditing;
- (void)controlEndEditing;
- (void)controlUpdateEditing;
- (void)dealloc;
- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5;
@end

@implementation WKSelectPopover

- (WKSelectPopover)initWithView:(id)a3 hasGroups:(BOOL)a4
{
  BOOL v4 = a4;
  v20.receiver = self;
  v20.super_class = (Class)WKSelectPopover;
  v6 = -[WKFormRotatingAccessoryPopover initWithView:](&v20, sel_initWithView_);
  if (v6)
  {
    v7 = [[WKSelectTableViewController alloc] initWithView:a3 hasGroups:v4];
    m_ptr = v6->_tableViewController.m_ptr;
    v6->_tableViewController.m_ptr = v7;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      v7 = (WKSelectTableViewController *)v6->_tableViewController.m_ptr;
    }
    [(WKSelectTableViewController *)v7 setPopover:v6];
    v9 = v6->_tableViewController.m_ptr;
    if (v9) {
      CFRetain(v6->_tableViewController.m_ptr);
    }
    uint64_t v10 = *(void *)([a3 focusedElementInformation] + 240);
    if (v10 && *(_DWORD *)(v10 + 4))
    {
      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v6->_tableViewController.m_ptr];
      if (v9) {
        CFRelease(v9);
      }
      char v12 = 0;
      v9 = (void *)v11;
    }
    else
    {
      char v12 = 1;
    }
    objc_msgSend((id)objc_msgSend(v6->_tableViewController.m_ptr, "tableView"), "sizeThatFits:", 320.0, 1.79769313e308);
    double v14 = v13;
    double v16 = v15;
    v17 = v9;
    if ((v12 & 1) == 0) {
      v17 = (void *)[v9 topViewController];
    }
    objc_msgSend(v17, "setPreferredContentSize:", v14, v16);
    v18 = (const void *)[objc_alloc(MEMORY[0x1E4F42CC8]) initWithContentViewController:v9];
    [(WKRotatingPopover *)v6 setPopoverController:v18];
    if (v18) {
      CFRelease(v18);
    }
    if (v9) {
      CFRelease(v9);
    }
  }
  return v6;
}

- (void)dealloc
{
  [self->_tableViewController.m_ptr setPopover:0];
  objc_msgSend((id)objc_msgSend(self->_tableViewController.m_ptr, "tableView"), "setDataSource:", 0);
  objc_msgSend((id)objc_msgSend(self->_tableViewController.m_ptr, "tableView"), "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)WKSelectPopover;
  [(WKRotatingPopover *)&v3 dealloc];
}

- (id)controlView
{
  return 0;
}

- (void)controlBeginEditing
{
}

- (void)controlUpdateEditing
{
  v2 = (void *)[self->_tableViewController.m_ptr tableView];

  [v2 reloadData];
}

- (void)controlEndEditing
{
  uint64_t v3 = [self->_tableViewController.m_ptr shouldDismissWithAnimation];

  [(WKRotatingPopover *)self dismissPopoverAnimated:v3];
}

- (UITableViewController)tableViewController
{
  return (UITableViewController *)self->_tableViewController.m_ptr;
}

- (void).cxx_destruct
{
  m_ptr = self->_tableViewController.m_ptr;
  self->_tableViewController.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  return self;
}

- (void)selectRow:(int64_t)a3 inComponent:(int64_t)a4 extendingSelection:(BOOL)a5
{
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForRow:inSection:", a3, a4, a5);
  objc_msgSend((id)objc_msgSend(self->_tableViewController.m_ptr, "tableView"), "selectRowAtIndexPath:animated:scrollPosition:", v6, 0, 2);
  m_ptr = self->_tableViewController.m_ptr;
  uint64_t v8 = [m_ptr tableView];

  [m_ptr tableView:v8 didSelectRowAtIndexPath:v6];
}

@end