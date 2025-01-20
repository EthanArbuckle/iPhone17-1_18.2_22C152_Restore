@interface DOCDocBrowserVC_UIActivityViewController
- (DOCServicePopoverTrackerProtocol)popoverTracker;
- (UIBarButtonItem)barButtonItem;
- (void)setBarButtonItem:(id)a3;
- (void)setPopoverTracker:(id)a3;
@end

@implementation DOCDocBrowserVC_UIActivityViewController

- (DOCServicePopoverTrackerProtocol)popoverTracker
{
  return (DOCServicePopoverTrackerProtocol *)objc_getProperty(self, a2, 1336, 1);
}

- (void)setPopoverTracker:(id)a3
{
}

- (UIBarButtonItem)barButtonItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barButtonItem);
  return (UIBarButtonItem *)WeakRetained;
}

- (void)setBarButtonItem:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_barButtonItem);
  objc_storeStrong((id *)&self->_popoverTracker, 0);
}

@end