@interface FLHiddenImageTableCell
- (void)layoutSubviews;
@end

@implementation FLHiddenImageTableCell

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)FLHiddenImageTableCell;
  [(PSTableCell *)&v4 layoutSubviews];
  v3 = [(FLHiddenImageTableCell *)self imageView];
  [v3 setHidden:1];
}

@end