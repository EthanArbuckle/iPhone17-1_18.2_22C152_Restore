@interface DBCalendarLeafIconDataSource
- (id)badgeNumberOrStringForIcon:(id)a3;
- (id)icon:(id)a3 defaultImageWithInfo:(SBIconImageInfo *)a4;
- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4;
- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4;
@end

@implementation DBCalendarLeafIconDataSource

- (id)badgeNumberOrStringForIcon:(id)a3
{
  return 0;
}

- (id)icon:(id)a3 unmaskedImageWithInfo:(SBIconImageInfo *)a4
{
  double v7 = v6;
  double v8 = v5;
  double v9 = v4;
  uint64_t v10 = [(DBLeafIconDataSource *)self drawsBorder];
  return DBUnmaskedCalendarIconImageWithInfoAndBorder(v10, v9, v8, v7);
}

- (id)icon:(id)a3 defaultImageWithInfo:(SBIconImageInfo *)a4
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  double v11 = v4;
  uint64_t v12 = [(DBLeafIconDataSource *)self drawsBorder];
  return DBCalendarIconImageWithInfoAndBorder(v12, v11, v10, v9, v8);
}

- (id)icon:(id)a3 imageWithInfo:(SBIconImageInfo *)a4
{
  double v8 = v7;
  double v9 = v6;
  double v10 = v5;
  double v11 = v4;
  uint64_t v12 = [(DBLeafIconDataSource *)self drawsBorder];
  return DBCalendarIconImageWithInfoAndBorder(v12, v11, v10, v9, v8);
}

@end