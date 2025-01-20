@interface _MKUIViewControllerClickableRootView
- (void)setTarget:(id)a3 action:(SEL)a4;
@end

@implementation _MKUIViewControllerClickableRootView

- (void)setTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v7 = v6;
  gestureRecognizer = self->_gestureRecognizer;
  if (v6 && a4)
  {
    id v12 = v6;
    if (!gestureRecognizer)
    {
      v9 = (UITapGestureRecognizer *)objc_alloc_init(MEMORY[0x1E4F42EC8]);
      v10 = self->_gestureRecognizer;
      self->_gestureRecognizer = v9;

      [(_MKUIViewControllerClickableRootView *)self addGestureRecognizer:self->_gestureRecognizer];
      v7 = v12;
      gestureRecognizer = self->_gestureRecognizer;
    }
    [(UITapGestureRecognizer *)gestureRecognizer addTarget:v7 action:a4];
  }
  else
  {
    if (!gestureRecognizer) {
      goto LABEL_9;
    }
    id v12 = v6;
    -[_MKUIViewControllerClickableRootView removeGestureRecognizer:](self, "removeGestureRecognizer:");
    v11 = self->_gestureRecognizer;
    self->_gestureRecognizer = 0;
  }
  v7 = v12;
LABEL_9:
}

- (void).cxx_destruct
{
}

@end