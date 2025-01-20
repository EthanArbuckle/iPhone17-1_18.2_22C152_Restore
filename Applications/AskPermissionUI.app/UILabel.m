@interface UILabel
- (double)heightForWidth:(double)a3;
@end

@implementation UILabel

- (double)heightForWidth:(double)a3
{
  NSAttributedStringKey v11 = NSFontAttributeName;
  v5 = [(UILabel *)self font];
  v12 = v5;
  v6 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  v7 = [(UILabel *)self text];
  [v7 boundingRectWithSize:3 options:v6 attributes:0 context:1.79769313e308];
  double v9 = v8;

  return v9;
}

@end