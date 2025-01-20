@interface _LapLabel
- (_LapLabel)initWithFrame:(CGRect)a3;
- (unint64_t)lap;
- (void)setLap:(unint64_t)a3;
- (void)split;
@end

@implementation _LapLabel

- (_LapLabel)initWithFrame:(CGRect)a3
{
  v4.receiver = self;
  v4.super_class = (Class)_LapLabel;
  result = -[_LapLabel initWithFrame:](&v4, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (result) {
    result->_lap = -1;
  }
  return result;
}

- (void)split
{
  if (!self->_split)
  {
    self->_split = 1;
    v3 = +[NTKChronographFaceBundle localizedStringForKey:@"CHRONO_SPLIT" comment:@"SPLIT"];
    [(_LapLabel *)self setText:v3];

    [(_LapLabel *)self sizeToFit];
  }
}

- (void)setLap:(unint64_t)a3
{
  self->_split = 0;
  if (self->_lap == a3) {
    return;
  }
  v3 = (void *)a3;
  self->_lap = a3;
  if (a3 >= 0xA)
  {
    CFStringRef v5 = @"CHRONO_LAP_SHORT";
    CFStringRef v6 = @"L";
LABEL_6:
    v7 = +[NTKChronographFaceBundle localizedStringForKey:v5 comment:v6];
    v3 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v7, v3);

    goto LABEL_7;
  }
  if (a3)
  {
    CFStringRef v5 = @"CHRONO_LAP";
    CFStringRef v6 = @"LAP";
    goto LABEL_6;
  }
LABEL_7:
  [(_LapLabel *)self setText:v3];

  [(_LapLabel *)self sizeToFit];
}

- (unint64_t)lap
{
  return self->_lap;
}

@end