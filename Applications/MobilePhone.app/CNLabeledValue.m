@interface CNLabeledValue
- (NSString)localizedLabel;
@end

@implementation CNLabeledValue

- (NSString)localizedLabel
{
  v2 = [(CNLabeledValue *)self label];
  if (v2)
  {
    v3 = [(id)objc_opt_class() localizedStringForLabel:v2];
  }
  else
  {
    v3 = 0;
  }

  return (NSString *)v3;
}

@end