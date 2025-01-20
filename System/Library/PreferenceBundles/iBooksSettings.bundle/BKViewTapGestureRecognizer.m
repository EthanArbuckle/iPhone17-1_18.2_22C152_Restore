@interface BKViewTapGestureRecognizer
- (BOOL)pressed;
- (void)setPressed:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation BKViewTapGestureRecognizer

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
}

- (void)setPressed:(BOOL)a3
{
  if (self->_pressed != a3)
  {
    self->_pressed = a3;
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_4524;
    v3[3] = &unk_186F0;
    v3[4] = self;
    BOOL v4 = a3;
    +[UIView animateWithDuration:v3 animations:0.2];
  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  v5 = [a3 anyObject];
  uint64_t v6 = [(BKViewTapGestureRecognizer *)self view];
  [v5 locationInView:v6];
  CGFloat v8 = v7;
  CGFloat v10 = v9;

  v11 = [(BKViewTapGestureRecognizer *)self view];
  [v11 bounds];
  v13.x = v8;
  v13.y = v10;
  LOBYTE(v6) = CGRectContainsPoint(v14, v13);

  if ((v6 & 1) == 0)
  {
    [(BKViewTapGestureRecognizer *)self setPressed:0];
    [(BKViewTapGestureRecognizer *)self setState:5];
    [(BKViewTapGestureRecognizer *)self setEnabled:0];
    [(BKViewTapGestureRecognizer *)self setEnabled:1];
  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if ([(BKViewTapGestureRecognizer *)self pressed])
  {
    [(BKViewTapGestureRecognizer *)self setPressed:0];
    [(BKViewTapGestureRecognizer *)self setState:3];
  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if ([(BKViewTapGestureRecognizer *)self pressed])
  {
    [(BKViewTapGestureRecognizer *)self setPressed:0];
    [(BKViewTapGestureRecognizer *)self setState:4];
  }
}

- (BOOL)pressed
{
  return self->_pressed;
}

@end