@interface NTKDolomitePicayuneViewConfiguration
- (NTKDolomiteColorPalette)palette;
- (unint64_t)numeral;
- (void)setNumeral:(unint64_t)a3;
- (void)setPalette:(id)a3;
@end

@implementation NTKDolomitePicayuneViewConfiguration

- (unint64_t)numeral
{
  return self->_numeral;
}

- (void)setNumeral:(unint64_t)a3
{
  self->_numeral = a3;
}

- (NTKDolomiteColorPalette)palette
{
  return self->_palette;
}

- (void)setPalette:(id)a3
{
}

- (void).cxx_destruct
{
}

@end