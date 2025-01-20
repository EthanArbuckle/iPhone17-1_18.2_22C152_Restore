@interface _SFFindOnPageInputBar
- (CGSize)intrinsicContentSize;
- (_SFFindOnPageInputBar)initWithFrame:(CGRect)a3;
- (float)contentCompressionResistancePriorityForAxis:(int64_t)a3;
- (float)contentHuggingPriorityForAxis:(int64_t)a3;
@end

@implementation _SFFindOnPageInputBar

- (_SFFindOnPageInputBar)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_SFFindOnPageInputBar;
  v3 = -[_SFFindOnPageInputBar initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    [(_SFFindOnPageInputBar *)v3 setSearchBarStyle:2];
    [(_SFFindOnPageInputBar *)v4 setAutocorrectionType:1];
    [(_SFFindOnPageInputBar *)v4 setAutocapitalizationType:0];
    [(_SFFindOnPageInputBar *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    v5 = [(_SFFindOnPageInputBar *)v4 searchField];
    [v5 setDisablePrediction:1];

    v6 = v4;
  }

  return v4;
}

- (float)contentHuggingPriorityForAxis:(int64_t)a3
{
  return 1000.0;
}

- (float)contentCompressionResistancePriorityForAxis:(int64_t)a3
{
  if (a3 || (_SFDeviceIsPad() & 1) == 0) {
    return 250.0;
  }
  else {
    return 750.0;
  }
}

- (CGSize)intrinsicContentSize
{
  int IsPad = _SFDeviceIsPad();
  double v3 = 9999.0;
  if (IsPad) {
    double v3 = 660.0;
  }
  double v4 = 44.0;
  result.height = v4;
  result.width = v3;
  return result;
}

@end