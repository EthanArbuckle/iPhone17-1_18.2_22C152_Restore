@interface CSBackgroundComponent
- (CSBackgroundComponent)init;
- (double)transitionProgress;
- (id)copyWithZone:(_NSZone *)a3;
- (id)style:(id)a3;
- (void)setStyle:(id)a3;
- (void)setTransitionProgress:(double)a3;
@end

@implementation CSBackgroundComponent

- (CSBackgroundComponent)init
{
  v5.receiver = self;
  v5.super_class = (Class)CSBackgroundComponent;
  v2 = [(CSComponent *)&v5 init];
  v3 = v2;
  if (v2) {
    [(CSComponent *)v2 setType:19];
  }
  return v3;
}

- (id)style:(id)a3
{
  return self;
}

- (void)setStyle:(id)a3
{
  id v6 = a3;
  id v4 = [(CSComponent *)self value];

  objc_super v5 = v6;
  if (v4 != v6)
  {
    [(CSComponent *)self setValue:v6];
    objc_super v5 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSBackgroundComponent;
  id v4 = [(CSComponent *)&v6 copyWithZone:a3];
  [(CSBackgroundComponent *)self transitionProgress];
  objc_msgSend(v4, "setTransitionProgress:");
  return v4;
}

- (double)transitionProgress
{
  return self->_transitionProgress;
}

- (void)setTransitionProgress:(double)a3
{
  self->_transitionProgress = a3;
}

@end