@interface TapOffGestureRecognizer
- (TapOffGestureRecognizer)init;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation TapOffGestureRecognizer

- (TapOffGestureRecognizer)init
{
  v6.receiver = self;
  v6.super_class = (Class)TapOffGestureRecognizer;
  v2 = [(TapOffGestureRecognizer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableSet set];
    touches = v2->_touches;
    v2->_touches = (NSMutableSet *)v3;
  }
  return v2;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[NSMutableSet unionSet:](self->_touches, "unionSet:", a3, a4);

  [(TapOffGestureRecognizer *)self setState:2];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[NSMutableSet minusSet:](self->_touches, "minusSet:", a3, a4);
  if (![(NSMutableSet *)self->_touches count])
  {
    [(TapOffGestureRecognizer *)self setState:3];
  }
}

- (void).cxx_destruct
{
}

@end