@interface BuddyTableViewCell
- (void)layoutSubviews;
- (void)resizeCellLabelAndFieldIfOverlap;
@end

@implementation BuddyTableViewCell

- (void)resizeCellLabelAndFieldIfOverlap
{
  if ([(BuddyTableViewCell *)self style] == (id)1000)
  {
    id v2 = [(BuddyTableViewCell *)self editableTextField];
    [v2 frame];
    *(void *)&v18[8] = v3;
    *(void *)v18 = v4;
    *(void *)&v18[24] = v5;
    *(void *)&v18[16] = v6;

    if (!CGRectIsEmpty(*(CGRect *)v18))
    {
      id v7 = [(BuddyTableViewCell *)self textLabel];
      [v7 frame];
      CGFloat r2_8 = v8;
      CGFloat r2 = v9;
      CGFloat r2_24 = v10;
      double r2_16 = v11;

      v21.size.height = r2_24;
      v21.size.width = r2_16 + 10.0;
      v21.origin.y = r2_8;
      v21.origin.x = r2;
      CGRect v20 = CGRectIntersection(*(CGRect *)v18, v21);
      double rect_16 = v20.size.width;
      if (!CGRectIsNull(v20))
      {
        id v12 = [(BuddyTableViewCell *)self editableTextField];
        [v12 setFrame:*(double *)v18 + rect_16, *(double *)&v18[8], *(double *)&v18[16] - rect_16, *(double *)&v18[24], *(double *)v18 + rect_16, *(void *)&v18[8], *(double *)&v18[16] - rect_16, *(void *)&v18[24]];
      }
    }
  }
}

- (void)layoutSubviews
{
  uint64_t v4 = self;
  SEL v3 = a2;
  v2.receiver = self;
  v2.super_class = (Class)BuddyTableViewCell;
  [(BuddyTableViewCell *)&v2 layoutSubviews];
  [(BuddyTableViewCell *)v4 resizeCellLabelAndFieldIfOverlap];
}

@end