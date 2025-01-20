@interface MKPlaceServiceHoursView
- (id)_standardLabel;
@end

@implementation MKPlaceServiceHoursView

- (id)_standardLabel
{
  v3 = [_MKUILabel alloc];
  v4 = -[_MKUILabel initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(_MKUILabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [MEMORY[0x1E4F428B8] grayColor];
  [(_MKUILabel *)v4 setTextColor:v5];

  v6 = +[MKFontManager sharedManager];
  v7 = [v6 bodyFont];
  [(_MKUILabel *)v4 setFont:v7];

  [(_MKUILabel *)v4 setNumberOfLines:4];
  [(MKPlaceServiceHoursView *)self addSubview:v4];

  return v4;
}

@end