@interface HKSPMultilinePSTableCell
- (HKSPMultilinePSTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
@end

@implementation HKSPMultilinePSTableCell

- (HKSPMultilinePSTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)HKSPMultilinePSTableCell;
  v4 = [(HKSPMultilinePSTableCell *)&v8 initWithStyle:a3 reuseIdentifier:a4];
  v5 = v4;
  if (v4)
  {
    v6 = [(HKSPMultilinePSTableCell *)v4 titleLabel];
    [v6 setNumberOfLines:0];
  }
  return v5;
}

@end