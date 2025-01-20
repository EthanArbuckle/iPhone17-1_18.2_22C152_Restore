@interface NTKParmesanPicayuneViewConfiguration
- (UIColor)timeLabelColor;
- (int64_t)scale;
- (unint64_t)numerals;
- (unint64_t)typeface;
- (void)setNumerals:(unint64_t)a3;
- (void)setScale:(int64_t)a3;
- (void)setTimeLabelColor:(id)a3;
- (void)setTypeface:(unint64_t)a3;
@end

@implementation NTKParmesanPicayuneViewConfiguration

- (int64_t)scale
{
  return self->_scale;
}

- (void)setScale:(int64_t)a3
{
  self->_scale = a3;
}

- (unint64_t)typeface
{
  return self->_typeface;
}

- (void)setTypeface:(unint64_t)a3
{
  self->_typeface = a3;
}

- (unint64_t)numerals
{
  return self->_numerals;
}

- (void)setNumerals:(unint64_t)a3
{
  self->_numerals = a3;
}

- (UIColor)timeLabelColor
{
  return self->_timeLabelColor;
}

- (void)setTimeLabelColor:(id)a3
{
  self->_timeLabelColor = (UIColor *)a3;
}

@end