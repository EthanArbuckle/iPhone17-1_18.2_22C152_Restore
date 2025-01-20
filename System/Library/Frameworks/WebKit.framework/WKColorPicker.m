@interface WKColorPicker
- (WKColorPicker)initWithView:(id)a3;
- (id).cxx_construct;
- (id)controlView;
- (id)focusedElementSuggestedColors;
- (void)colorPickerViewControllerDidFinish:(id)a3;
- (void)colorPickerViewControllerDidSelectColor:(id)a3;
- (void)configurePresentation;
- (void)controlBeginEditing;
- (void)controlEndEditing;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)selectColor:(id)a3;
- (void)updateColorPickerState;
@end

@implementation WKColorPicker

- (WKColorPicker)initWithView:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)WKColorPicker;
  v4 = [(WKColorPicker *)&v9 init];
  v5 = v4;
  if (v4)
  {
    objc_storeWeak((id *)&v4->_view, a3);
    id v6 = objc_alloc_init(MEMORY[0x1E4F428C8]);
    m_ptr = v5->_colorPickerViewController.m_ptr;
    v5->_colorPickerViewController.m_ptr = v6;
    if (m_ptr)
    {
      CFRelease(m_ptr);
      id v6 = v5->_colorPickerViewController.m_ptr;
    }
    [v6 setDelegate:v5];
    [v5->_colorPickerViewController.m_ptr setSupportsAlpha:0];
  }
  return v5;
}

- (void)selectColor:(id)a3
{
  [self->_colorPickerViewController.m_ptr setSelectedColor:a3];
  m_ptr = self->_colorPickerViewController.m_ptr;

  [(WKColorPicker *)self colorPickerViewControllerDidSelectColor:m_ptr];
}

- (id)focusedElementSuggestedColors
{
  uint64_t v2 = [objc_loadWeak((id *)&self->_view) focusedElementInformation];
  if (!*(_DWORD *)(v2 + 356)) {
    return 0;
  }
  uint64_t v3 = v2;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:*(unsigned int *)(v2 + 356)];
  uint64_t v6 = *(unsigned int *)(v3 + 356);
  if (v6)
  {
    v7 = *(WebCore **)(v3 + 344);
    uint64_t v8 = 8 * v6;
    do
    {
      WebCore::cocoaColor((uint64_t *)&cf, v7, v4);
      if (cf)
      {
        objc_msgSend(v5, "addObject:");
        CFTypeRef v9 = cf;
        CFTypeRef cf = 0;
        if (v9) {
          CFRelease(v9);
        }
      }
      v7 = (WebCore *)((char *)v7 + 8);
      v8 -= 8;
    }
    while (v8);
  }
  return (id)(id)CFMakeCollectable(v5);
}

- (void)updateColorPickerState
{
  m_ptr = self->_colorPickerViewController.m_ptr;
  uint64_t v4 = [objc_loadWeak((id *)&self->_view) focusedElementInformation];
  WebCore::cocoaColor((uint64_t *)&cf, (WebCore *)(v4 + 336), v5);
  [m_ptr setSelectedColor:cf];
  CFTypeRef v6 = cf;
  CFTypeRef cf = 0;
  if (v6) {
    CFRelease(v6);
  }
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(self->_colorPickerViewController.m_ptr, "_setSuggestedColors:", -[WKColorPicker focusedElementSuggestedColors](self, "focusedElementSuggestedColors"));
  }
}

- (void)configurePresentation
{
  uint64_t v2 = self;
  [self->_colorPickerViewController.m_ptr setModalPresentationStyle:7];
  uint64_t v3 = (void *)[v2->_colorPickerViewController.m_ptr popoverPresentationController];
  [v3 setDelegate:v2];
  uint64_t v2 = (WKColorPicker *)((char *)v2 + 8);
  [v3 setSourceView:objc_loadWeak((id *)&v2->super.isa)];
  [objc_loadWeak((id *)&v2->super.isa) focusedElementInformation];
  WebCore::IntRect::operator CGRect();
  CGRect v6 = CGRectIntegral(v5);

  objc_msgSend(v3, "setSourceRect:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

- (id)controlView
{
  return 0;
}

- (void)controlBeginEditing
{
  p_view = &self->_view;
  [objc_loadWeak((id *)&self->_view) startRelinquishingFirstResponderToFocusedElement];
  [(WKColorPicker *)self updateColorPickerState];
  [(WKColorPicker *)self configurePresentation];
  uint64_t v4 = objc_msgSend(objc_loadWeak((id *)p_view), "_wk_viewControllerForFullScreenPresentation");
  m_ptr = self->_colorPickerViewController.m_ptr;

  [v4 presentViewController:m_ptr animated:1 completion:0];
}

- (void)controlEndEditing
{
  [objc_loadWeak((id *)&self->_view) stopRelinquishingFirstResponderToFocusedElement];
  m_ptr = self->_colorPickerViewController.m_ptr;

  [m_ptr dismissViewControllerAnimated:0 completion:0];
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->_view);

  [Weak accessoryDone];
}

- (void)colorPickerViewControllerDidSelectColor:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->_view);
  uint64_t v5 = [a3 selectedColor];

  [Weak updateFocusedElementValueAsColor:v5];
}

- (void)colorPickerViewControllerDidFinish:(id)a3
{
  id Weak = objc_loadWeak((id *)&self->_view);

  [Weak accessoryDone];
}

- (void).cxx_destruct
{
  m_ptr = self->_colorPickerViewController.m_ptr;
  self->_colorPickerViewController.m_ptr = 0;
  if (m_ptr) {
    CFRelease(m_ptr);
  }

  objc_destroyWeak((id *)&self->_view);
}

- (id).cxx_construct
{
  *((void *)self + 2) = 0;
  return self;
}

@end