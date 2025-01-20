@interface PKRoundedCollectionViewCell
- (void)layoutSubviews;
@end

@implementation PKRoundedCollectionViewCell

- (void)layoutSubviews
{
  v9.receiver = self;
  v9.super_class = (Class)PKRoundedCollectionViewCell;
  [(PKRoundedCollectionViewCell *)&v9 layoutSubviews];
  [(PKRoundedCollectionViewCell *)self bounds];
  double v4 = v3;
  [(PKRoundedCollectionViewCell *)self bounds];
  if (v4 >= v5) {
    double v6 = v5;
  }
  else {
    double v6 = v4;
  }
  double v7 = v6 * 0.5;
  v8 = [(PKRoundedCollectionViewCell *)self layer];
  [v8 setCornerRadius:v7];
}

@end