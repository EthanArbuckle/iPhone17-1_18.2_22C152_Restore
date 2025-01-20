@interface QLVideoScrubberView
- (BOOL)isUserInteractingWithScrubber;
- (BOOL)touchGestureIsActive;
- (PHVideoScrubberView)photosScrubber;
- (UIScrollView)scrollView;
- (void)_updateUserInteractingWithScrubberIfNeeded;
- (void)didBeginTouchingVideoScrubberView:(id)a3;
- (void)didEndTouchingVideoScrubberView:(id)a3;
- (void)layoutSubviews;
- (void)setTouchGestureIsActive:(BOOL)a3;
- (void)setUserInteractingWithScrubber:(BOOL)a3;
@end

@implementation QLVideoScrubberView

- (void)layoutSubviews
{
  v21[4] = *MEMORY[0x263EF8340];
  if (!self->_photosScrubber)
  {
    gotLoadHelper_x8__OBJC_CLASS___PHVideoScrubberView(v2);
    id v5 = objc_alloc(*(Class *)(v4 + 936));
    [(QLVideoScrubberView *)self bounds];
    v6 = (PHVideoScrubberView *)objc_msgSend(v5, "initWithFrame:");
    photosScrubber = self->_photosScrubber;
    self->_photosScrubber = v6;

    [(PHVideoScrubberView *)self->_photosScrubber setInteractionDelegate:self];
    [(QLVideoScrubberView *)self addSubview:self->_photosScrubber];
    [(PHVideoScrubberView *)self->_photosScrubber setTranslatesAutoresizingMaskIntoConstraints:0];
    v20 = [(QLVideoScrubberView *)self leftAnchor];
    v19 = [(PHVideoScrubberView *)self->_photosScrubber leftAnchor];
    v18 = [v20 constraintEqualToAnchor:v19];
    v21[0] = v18;
    v17 = [(QLVideoScrubberView *)self rightAnchor];
    v8 = [(PHVideoScrubberView *)self->_photosScrubber rightAnchor];
    v9 = [v17 constraintEqualToAnchor:v8];
    v21[1] = v9;
    v10 = [(QLVideoScrubberView *)self topAnchor];
    v11 = [(PHVideoScrubberView *)self->_photosScrubber topAnchor];
    v12 = [v10 constraintEqualToAnchor:v11];
    v21[2] = v12;
    v13 = [(QLVideoScrubberView *)self bottomAnchor];
    v14 = [(PHVideoScrubberView *)self->_photosScrubber bottomAnchor];
    v15 = [v13 constraintEqualToAnchor:v14];
    v21[3] = v15;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
    [(QLVideoScrubberView *)self addConstraints:v16];
  }
}

- (PHVideoScrubberView)photosScrubber
{
  photosScrubber = self->_photosScrubber;
  if (!photosScrubber)
  {
    [(QLVideoScrubberView *)self layoutSubviews];
    photosScrubber = self->_photosScrubber;
  }

  return photosScrubber;
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)[(PHVideoScrubberView *)self->_photosScrubber scrollView];
}

- (void)didEndTouchingVideoScrubberView:(id)a3
{
  self->_touchGestureIsActive = 0;
  [(QLVideoScrubberView *)self _updateUserInteractingWithScrubberIfNeeded];
}

- (void)didBeginTouchingVideoScrubberView:(id)a3
{
  self->_touchGestureIsActive = 1;
  [(QLVideoScrubberView *)self _updateUserInteractingWithScrubberIfNeeded];
}

- (void)_updateUserInteractingWithScrubberIfNeeded
{
  if (self->_touchGestureIsActive)
  {
    [(QLVideoScrubberView *)self setUserInteractingWithScrubber:1];
  }
  else
  {
    id v4 = [(QLVideoScrubberView *)self scrollView];
    if ([v4 isDragging])
    {
      [(QLVideoScrubberView *)self setUserInteractingWithScrubber:1];
    }
    else
    {
      v3 = [(QLVideoScrubberView *)self scrollView];
      -[QLVideoScrubberView setUserInteractingWithScrubber:](self, "setUserInteractingWithScrubber:", [v3 isDecelerating]);
    }
  }
}

- (BOOL)isUserInteractingWithScrubber
{
  return self->_userInteractingWithScrubber;
}

- (void)setUserInteractingWithScrubber:(BOOL)a3
{
  self->_userInteractingWithScrubber = a3;
}

- (BOOL)touchGestureIsActive
{
  return self->_touchGestureIsActive;
}

- (void)setTouchGestureIsActive:(BOOL)a3
{
  self->_touchGestureIsActive = a3;
}

- (void).cxx_destruct
{
}

@end