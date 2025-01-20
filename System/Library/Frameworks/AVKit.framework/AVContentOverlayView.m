@interface AVContentOverlayView
- (AVContentOverlayViewDelegate)delegate;
- (void)_didRemoveSubview:(id)a3;
- (void)didAddSubview:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation AVContentOverlayView

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (AVContentOverlayViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVContentOverlayViewDelegate *)WeakRetained;
}

- (void)_didRemoveSubview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVContentOverlayView;
  [(AVContentOverlayView *)&v5 _didRemoveSubview:a3];
  v4 = [(AVContentOverlayView *)self delegate];
  [v4 contentOverlayViewDidAddOrRemoveSubview:self];
}

- (void)didAddSubview:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)AVContentOverlayView;
  [(AVContentOverlayView *)&v5 didAddSubview:a3];
  v4 = [(AVContentOverlayView *)self delegate];
  [v4 contentOverlayViewDidAddOrRemoveSubview:self];
}

@end