@interface SpinnerTableCell
- (SpinnerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation SpinnerTableCell

- (SpinnerTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  id v14 = self;
  SEL v13 = a2;
  int64_t v12 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  id v4 = v14;
  id v14 = 0;
  v10.receiver = v4;
  v10.super_class = (Class)SpinnerTableCell;
  id v14 = [(SpinnerTableCell *)&v10 initWithStyle:v12 reuseIdentifier:location];
  objc_storeStrong(&v14, v14);
  if (v14)
  {
    id v5 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    v6 = (void *)*((void *)v14 + 1);
    *((void *)v14 + 1) = v5;

    [*((id *)v14 + 1) startAnimating];
    id v7 = [v14 contentView];
    [v7 addSubview:*((void *)v14 + 1)];
  }
  v8 = (SpinnerTableCell *)v14;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v14, 0);
  return v8;
}

- (void)layoutSubviews
{
  v19 = self;
  SEL v18 = a2;
  v17.receiver = self;
  v17.super_class = (Class)SpinnerTableCell;
  [(SpinnerTableCell *)&v17 layoutSubviews];
  id v2 = [(SpinnerTableCell *)v19 contentView];
  [v2 bounds];
  uint64_t v14 = v3;
  uint64_t v13 = v4;
  double v16 = v5;
  double v15 = v6;

  [(UIActivityIndicatorView *)v19->_spinner frame];
  float v8 = (v15 - v7) / 2.0;
  double v12 = floorf(v8);
  float v10 = (v16 - v9) / 2.0;
  double v11 = floorf(v10);
  -[UIActivityIndicatorView setFrame:](v19->_spinner, "setFrame:", v12, v11, v7, v9, *(void *)&v12, *(void *)&v11, *(void *)&v7, *(void *)&v9);
}

- (void).cxx_destruct
{
}

@end