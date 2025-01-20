@interface PKSqueezePaletteViewExpandedUndoRedoLayoutContext
- (id)initWithSliderButton:(void *)a3 sliderButtonLongPressGestureRecognizer:(void *)a4 previousLayout:;
@end

@implementation PKSqueezePaletteViewExpandedUndoRedoLayoutContext

- (id)initWithSliderButton:(void *)a3 sliderButtonLongPressGestureRecognizer:(void *)a4 previousLayout:
{
  id v8 = a2;
  id v9 = a3;
  id v10 = a4;
  if (a1)
  {
    v13.receiver = a1;
    v13.super_class = (Class)PKSqueezePaletteViewExpandedUndoRedoLayoutContext;
    v11 = (id *)objc_msgSendSuper2(&v13, sel_init);
    a1 = v11;
    if (v11)
    {
      objc_storeStrong(v11 + 1, a2);
      objc_storeStrong(a1 + 2, a3);
      objc_storeStrong(a1 + 3, a4);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousLayout, 0);
  objc_storeStrong((id *)&self->_sliderButtonLongPressGestureRecognizer, 0);

  objc_storeStrong((id *)&self->_sliderButton, 0);
}

@end