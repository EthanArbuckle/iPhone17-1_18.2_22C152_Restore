@interface GKLoadingCell
- (UIActivityIndicatorView)activityIndicator;
- (UILabel)loading;
- (void)awakeFromNib;
- (void)setActivityIndicator:(id)a3;
- (void)setLoading:(id)a3;
@end

@implementation GKLoadingCell

- (void)awakeFromNib
{
  v6.receiver = self;
  v6.super_class = (Class)GKLoadingCell;
  [(GKLoadingCell *)&v6 awakeFromNib];
  v3 = GKGameCenterUIFrameworkBundle();
  v4 = GKGetLocalizedStringFromTableInBundle();
  v5 = [(GKLoadingCell *)self loading];
  [v5 setText:v4];
}

- (UIActivityIndicatorView)activityIndicator
{
  return self->_activityIndicator;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UILabel)loading
{
  return self->_loading;
}

- (void)setLoading:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loading, 0);

  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end