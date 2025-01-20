@interface VOTBrailleGesturePattern
- (VOTBrailleGestureHalfPattern)leftDots;
- (VOTBrailleGestureHalfPattern)rightDots;
- (VOTBrailleGesturePattern)initWithLeftDots:(id)a3 rightDots:(id)a4;
- (id)description;
- (void)setLeftDots:(id)a3;
- (void)setRightDots:(id)a3;
@end

@implementation VOTBrailleGesturePattern

- (VOTBrailleGesturePattern)initWithLeftDots:(id)a3 rightDots:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VOTBrailleGesturePattern;
  v8 = [(VOTBrailleGesturePattern *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(VOTBrailleGesturePattern *)v8 setLeftDots:v6];
    [(VOTBrailleGesturePattern *)v9 setRightDots:v7];
  }

  return v9;
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)VOTBrailleGesturePattern;
  v3 = [(VOTBrailleGesturePattern *)&v8 description];
  v4 = [(VOTBrailleGesturePattern *)self leftDots];
  v5 = [(VOTBrailleGesturePattern *)self rightDots];
  id v6 = [v3 stringByAppendingFormat:@" - left: %@, right: %@", v4, v5];

  return v6;
}

- (VOTBrailleGestureHalfPattern)leftDots
{
  return self->_leftDots;
}

- (void)setLeftDots:(id)a3
{
}

- (VOTBrailleGestureHalfPattern)rightDots
{
  return self->_rightDots;
}

- (void)setRightDots:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightDots, 0);

  objc_storeStrong((id *)&self->_leftDots, 0);
}

@end