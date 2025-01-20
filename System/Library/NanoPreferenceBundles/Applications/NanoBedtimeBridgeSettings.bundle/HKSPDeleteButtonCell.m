@interface HKSPDeleteButtonCell
- (HKSPDeleteButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5;
- (void)layoutSubviews;
@end

@implementation HKSPDeleteButtonCell

- (HKSPDeleteButtonCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 specifier:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)HKSPDeleteButtonCell;
  return [(HKSPDeleteButtonCell *)&v6 initWithStyle:0 reuseIdentifier:a4 specifier:a5];
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)HKSPDeleteButtonCell;
  [(HKSPDeleteButtonCell *)&v8 layoutSubviews];
  v3 = [(HKSPDeleteButtonCell *)self textLabel];
  [v3 setTextAlignment:4];

  v4 = +[UIColor systemRedColor];
  v5 = [(HKSPDeleteButtonCell *)self titleLabel];
  [v5 setTextColor:v4];

  objc_super v6 = +[UIColor systemRedColor];
  v7 = [(HKSPDeleteButtonCell *)self titleLabel];
  [v7 setHighlightedTextColor:v6];
}

@end