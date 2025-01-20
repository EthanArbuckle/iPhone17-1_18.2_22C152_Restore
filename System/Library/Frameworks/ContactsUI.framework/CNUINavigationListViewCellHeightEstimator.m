@interface CNUINavigationListViewCellHeightEstimator
- (CNUINavigationListStyle)navigationListStyle;
- (CNUINavigationListViewCellHeightEstimator)initWithNavigationListStyle:(id)a3;
- (NSNumber)estimatedCellHeightNumber;
- (NSNumber)estimatedDetailCellHeightNumber;
- (double)estimatedCellHeight;
- (double)estimatedDetailCellHeight;
- (void)setEstimatedCellHeightNumber:(id)a3;
- (void)setEstimatedDetailCellHeightNumber:(id)a3;
- (void)setNavigationListStyle:(id)a3;
@end

@implementation CNUINavigationListViewCellHeightEstimator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedDetailCellHeightNumber, 0);
  objc_storeStrong((id *)&self->_estimatedCellHeightNumber, 0);

  objc_storeStrong((id *)&self->_navigationListStyle, 0);
}

- (void)setEstimatedDetailCellHeightNumber:(id)a3
{
}

- (NSNumber)estimatedDetailCellHeightNumber
{
  return self->_estimatedDetailCellHeightNumber;
}

- (void)setEstimatedCellHeightNumber:(id)a3
{
}

- (NSNumber)estimatedCellHeightNumber
{
  return self->_estimatedCellHeightNumber;
}

- (void)setNavigationListStyle:(id)a3
{
}

- (CNUINavigationListStyle)navigationListStyle
{
  return self->_navigationListStyle;
}

- (double)estimatedDetailCellHeight
{
  estimatedDetailCellHeightNumber = self->_estimatedDetailCellHeightNumber;
  if (!estimatedDetailCellHeightNumber)
  {
    v4 = objc_alloc_init(CNUINavigationListViewDetailCell);
    v5 = [(CNUINavigationListViewCellHeightEstimator *)self navigationListStyle];
    [(CNUINavigationListViewCell *)v4 setNavigationListStyle:v5];

    v6 = NSNumber;
    [(CNUINavigationListViewDetailCell *)v4 minimumContentHeight];
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_estimatedDetailCellHeightNumber;
    self->_estimatedDetailCellHeightNumber = v7;

    estimatedDetailCellHeightNumber = self->_estimatedDetailCellHeightNumber;
  }
  [(NSNumber *)estimatedDetailCellHeightNumber floatValue];
  return v9;
}

- (double)estimatedCellHeight
{
  estimatedCellHeightNumber = self->_estimatedCellHeightNumber;
  if (!estimatedCellHeightNumber)
  {
    v4 = objc_alloc_init(CNUINavigationListViewCell);
    v5 = [(CNUINavigationListViewCellHeightEstimator *)self navigationListStyle];
    [(CNUINavigationListViewCell *)v4 setNavigationListStyle:v5];

    v6 = NSNumber;
    [(CNUINavigationListViewCell *)v4 minimumContentHeight];
    objc_msgSend(v6, "numberWithDouble:");
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_estimatedCellHeightNumber;
    self->_estimatedCellHeightNumber = v7;

    estimatedCellHeightNumber = self->_estimatedCellHeightNumber;
  }
  [(NSNumber *)estimatedCellHeightNumber floatValue];
  return v9;
}

- (CNUINavigationListViewCellHeightEstimator)initWithNavigationListStyle:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CNUINavigationListViewCellHeightEstimator;
  v6 = [(CNUINavigationListViewCellHeightEstimator *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_navigationListStyle, a3);
    v8 = v7;
  }

  return v7;
}

@end