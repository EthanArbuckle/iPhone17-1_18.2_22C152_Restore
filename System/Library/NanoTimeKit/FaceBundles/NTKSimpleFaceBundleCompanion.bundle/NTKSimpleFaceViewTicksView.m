@interface NTKSimpleFaceViewTicksView
- (CALayer)large;
- (CALayer)largeTick;
- (CALayer)pillTick;
- (CALayer)pills;
- (CALayer)small;
- (CALayer)smallTick;
- (NSArray)outerDigits;
- (UILabel)digit_05;
- (UILabel)digit_25;
- (UILabel)digit_35;
- (UILabel)digit_55;
- (void)setDigit_05:(id)a3;
- (void)setDigit_25:(id)a3;
- (void)setDigit_35:(id)a3;
- (void)setDigit_55:(id)a3;
- (void)setLarge:(id)a3;
- (void)setLargeTick:(id)a3;
- (void)setOuterDigits:(id)a3;
- (void)setPillTick:(id)a3;
- (void)setPills:(id)a3;
- (void)setSmall:(id)a3;
- (void)setSmallTick:(id)a3;
@end

@implementation NTKSimpleFaceViewTicksView

- (CALayer)large
{
  return self->_large;
}

- (void)setLarge:(id)a3
{
}

- (CALayer)small
{
  return self->_small;
}

- (void)setSmall:(id)a3
{
}

- (CALayer)pills
{
  return self->_pills;
}

- (void)setPills:(id)a3
{
}

- (UILabel)digit_05
{
  return self->_digit_05;
}

- (void)setDigit_05:(id)a3
{
}

- (UILabel)digit_25
{
  return self->_digit_25;
}

- (void)setDigit_25:(id)a3
{
}

- (UILabel)digit_35
{
  return self->_digit_35;
}

- (void)setDigit_35:(id)a3
{
}

- (UILabel)digit_55
{
  return self->_digit_55;
}

- (void)setDigit_55:(id)a3
{
}

- (CALayer)largeTick
{
  return self->_largeTick;
}

- (void)setLargeTick:(id)a3
{
}

- (CALayer)smallTick
{
  return self->_smallTick;
}

- (void)setSmallTick:(id)a3
{
}

- (CALayer)pillTick
{
  return self->_pillTick;
}

- (void)setPillTick:(id)a3
{
}

- (NSArray)outerDigits
{
  return self->_outerDigits;
}

- (void)setOuterDigits:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outerDigits, 0);
  objc_storeStrong((id *)&self->_pillTick, 0);
  objc_storeStrong((id *)&self->_smallTick, 0);
  objc_storeStrong((id *)&self->_largeTick, 0);
  objc_storeStrong((id *)&self->_digit_55, 0);
  objc_storeStrong((id *)&self->_digit_35, 0);
  objc_storeStrong((id *)&self->_digit_25, 0);
  objc_storeStrong((id *)&self->_digit_05, 0);
  objc_storeStrong((id *)&self->_pills, 0);
  objc_storeStrong((id *)&self->_small, 0);

  objc_storeStrong((id *)&self->_large, 0);
}

@end