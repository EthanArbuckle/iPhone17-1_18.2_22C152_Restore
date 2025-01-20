@interface NTKFoghornPicayuneViewConfiguration
- (CGAffineTransform)transform;
- (UIColor)minutesColor;
- (UIColor)secondsColor;
- (unint64_t)layoutStyle;
- (void)setLayoutStyle:(unint64_t)a3;
- (void)setMinutesColor:(id)a3;
- (void)setSecondsColor:(id)a3;
- (void)setTransform:(CGAffineTransform *)a3;
@end

@implementation NTKFoghornPicayuneViewConfiguration

- (unint64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (void)setLayoutStyle:(unint64_t)a3
{
  self->_layoutStyle = a3;
}

- (UIColor)minutesColor
{
  return self->_minutesColor;
}

- (void)setMinutesColor:(id)a3
{
}

- (UIColor)secondsColor
{
  return self->_secondsColor;
}

- (void)setSecondsColor:(id)a3
{
}

- (CGAffineTransform)transform
{
  long long v3 = *(_OWORD *)&self[1].b;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self->ty;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[1].d;
  return self;
}

- (void)setTransform:(CGAffineTransform *)a3
{
  long long v4 = *(_OWORD *)&a3->c;
  long long v3 = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_transform.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&self->_transform.c = v4;
  *(_OWORD *)&self->_transform.tx = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondsColor, 0);

  objc_storeStrong((id *)&self->_minutesColor, 0);
}

@end