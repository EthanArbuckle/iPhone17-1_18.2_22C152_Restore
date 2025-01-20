@interface BuddyAppleIDTableCell
- (BuddyAppleIDTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 columnCount:(unint64_t)a5;
- (UIStackView)rowStackView;
- (UIStackView)stackView;
- (id)addService:(id)a3 description:(id)a4;
- (unint64_t)columnCount;
- (void)setColumnCount:(unint64_t)a3;
- (void)setRowStackView:(id)a3;
- (void)setStackView:(id)a3;
@end

@implementation BuddyAppleIDTableCell

- (BuddyAppleIDTableCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4 columnCount:(unint64_t)a5
{
  id v41 = self;
  SEL v40 = a2;
  int64_t v39 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  unint64_t v37 = a5;
  id v6 = v41;
  id v41 = 0;
  v36.receiver = v6;
  v36.super_class = (Class)BuddyAppleIDTableCell;
  id v41 = [(BuddyAppleIDTableCell *)&v36 initWithStyle:v39 reuseIdentifier:location];
  objc_storeStrong(&v41, v41);
  if (v41)
  {
    [v41 setSelectionStyle:0];
    [v41 setColumnCount:v37];
    id v7 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    [v41 setStackView:v7];

    id v8 = [v41 stackView];
    [v8 setAxis:1];

    id v9 = [v41 stackView];
    [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v10 = [v41 stackView];
    [v10 setSpacing:20.0];

    id v11 = [v41 contentView];
    id v12 = [v41 stackView];
    [v11 addSubview:v12];

    id v35 = [v41 contentView];
    id v33 = [v35 topAnchor];
    id v34 = [v41 stackView];
    id v32 = [v34 topAnchor];
    id v31 = [v33 constraintEqualToAnchor:];
    v42[0] = v31;
    id v30 = [v41 contentView];
    id v28 = [v30 trailingAnchor];
    id v29 = [v41 stackView];
    id v27 = [v29 trailingAnchor];
    [v28 constraintEqualToAnchor:];
    v42[1] = v26;
    id v25 = [v41 contentView];
    id v13 = [v25 bottomAnchor];
    id v14 = [v41 stackView];
    id v15 = [v14 bottomAnchor];
    id v16 = [v13 constraintEqualToAnchor:v15];
    v42[2] = v16;
    id v17 = [v41 contentView];
    id v18 = [v17 leadingAnchor];
    id v19 = [v41 stackView];
    id v20 = [v19 leadingAnchor];
    id v21 = [v18 constraintEqualToAnchor:v20];
    v42[3] = v21;
    v22 = +[NSArray arrayWithObjects:v42 count:4];
    +[NSLayoutConstraint activateConstraints:v22];
  }
  v23 = (BuddyAppleIDTableCell *)v41;
  objc_storeStrong(&location, 0);
  objc_storeStrong(&v41, 0);
  return v23;
}

- (id)addService:(id)a3 description:(id)a4
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v20 = 0;
  objc_storeStrong(&v20, a4);
  v5 = [BuddyAppleIDServiceView alloc];
  id v19 = [(BuddyAppleIDServiceView *)v5 initWithImage:location[0] description:v20];
  [v19 setTranslatesAutoresizingMaskIntoConstraints:0];
  if ((id)[(BuddyAppleIDTableCell *)v22 columnCount] == (id)1)
  {
    id v6 = [(BuddyAppleIDTableCell *)v22 stackView];
    [(UIStackView *)v6 addArrangedSubview:v19];
  }
  else
  {
    id v7 = [(BuddyAppleIDTableCell *)v22 rowStackView];

    if (v7)
    {
      id v16 = [(BuddyAppleIDTableCell *)v22 rowStackView];
      [(UIStackView *)v16 addArrangedSubview:v19];

      [(BuddyAppleIDTableCell *)v22 setRowStackView:0];
    }
    else
    {
      id v8 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
      [(BuddyAppleIDTableCell *)v22 setRowStackView:v8];

      id v9 = [(BuddyAppleIDTableCell *)v22 rowStackView];
      [(UIStackView *)v9 setAxis:0];

      id v10 = [(BuddyAppleIDTableCell *)v22 rowStackView];
      [(UIStackView *)v10 setTranslatesAutoresizingMaskIntoConstraints:0];

      id v11 = [(BuddyAppleIDTableCell *)v22 rowStackView];
      [(UIStackView *)v11 setDistribution:1];

      id v12 = [(BuddyAppleIDTableCell *)v22 rowStackView];
      [(UIStackView *)v12 setSpacing:23.0];

      id v13 = [(BuddyAppleIDTableCell *)v22 stackView];
      id v14 = [(BuddyAppleIDTableCell *)v22 rowStackView];
      [(UIStackView *)v13 addArrangedSubview:v14];

      id v15 = [(BuddyAppleIDTableCell *)v22 rowStackView];
      [(UIStackView *)v15 addArrangedSubview:v19];
    }
  }
  id v17 = v19;
  objc_storeStrong(&v19, 0);
  objc_storeStrong(&v20, 0);
  objc_storeStrong(location, 0);
  return v17;
}

- (unint64_t)columnCount
{
  return self->_columnCount;
}

- (void)setColumnCount:(unint64_t)a3
{
  self->_columnCount = a3;
}

- (UIStackView)stackView
{
  return (UIStackView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setStackView:(id)a3
{
}

- (UIStackView)rowStackView
{
  return (UIStackView *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRowStackView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end