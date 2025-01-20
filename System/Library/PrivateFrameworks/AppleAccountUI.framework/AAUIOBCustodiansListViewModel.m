@interface AAUIOBCustodiansListViewModel
- (AAUIOBCustodiansListViewModel)initWithContacts:(id)a3;
- (BOOL)adoptTableViewScrollView;
- (UIImage)image;
- (UIView)secondaryView;
- (int64_t)contentViewLayout;
- (int64_t)tableViewStyle;
- (void)setAdoptTableViewScrollView:(BOOL)a3;
- (void)setContentViewLayout:(int64_t)a3;
- (void)setImage:(id)a3;
- (void)setSecondaryView:(id)a3;
- (void)setTableViewStyle:(int64_t)a3;
@end

@implementation AAUIOBCustodiansListViewModel

- (AAUIOBCustodiansListViewModel)initWithContacts:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)AAUIOBCustodiansListViewModel;
  result = [(AAOBCustodiansListViewModel *)&v4 initWithContacts:a3];
  if (result)
  {
    result->_contentViewLayout = 2;
    result->_adoptTableViewScrollView = 1;
    result->_tableViewStyle = 2;
  }
  return result;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (UIView)secondaryView
{
  return self->_secondaryView;
}

- (void)setSecondaryView:(id)a3
{
}

- (int64_t)contentViewLayout
{
  return self->_contentViewLayout;
}

- (void)setContentViewLayout:(int64_t)a3
{
  self->_contentViewLayout = a3;
}

- (BOOL)adoptTableViewScrollView
{
  return self->_adoptTableViewScrollView;
}

- (void)setAdoptTableViewScrollView:(BOOL)a3
{
  self->_adoptTableViewScrollView = a3;
}

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

- (void)setTableViewStyle:(int64_t)a3
{
  self->_tableViewStyle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryView, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end