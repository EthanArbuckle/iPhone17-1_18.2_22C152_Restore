@interface CDPUICustodianOSSelectionViewModel
- (NSArray)escapeOffers;
- (NSArray)options;
- (NSString)message;
- (NSString)title;
- (UIImage)icon;
- (id)copyWithZone:(_NSZone *)a3;
- (int64_t)tableViewStyle;
- (void)setEscapeOffers:(id)a3;
- (void)setIcon:(id)a3;
- (void)setMessage:(id)a3;
- (void)setOptions:(id)a3;
- (void)setTableViewStyle:(int64_t)a3;
- (void)setTitle:(id)a3;
@end

@implementation CDPUICustodianOSSelectionViewModel

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[CDPUICustodianOSSelectionViewModel allocWithZone:a3] init];
  uint64_t v5 = [(NSString *)self->_title copy];
  title = v4->_title;
  v4->_title = (NSString *)v5;

  uint64_t v7 = [(NSString *)self->_message copy];
  message = v4->_message;
  v4->_message = (NSString *)v7;

  uint64_t v9 = [(UIImage *)self->_icon copy];
  icon = v4->_icon;
  v4->_icon = (UIImage *)v9;

  v4->_tableViewStyle = self->_tableViewStyle;
  uint64_t v11 = [(NSArray *)self->_escapeOffers copy];
  escapeOffers = v4->_escapeOffers;
  v4->_escapeOffers = (NSArray *)v11;

  uint64_t v13 = [(NSArray *)self->_options copy];
  options = v4->_options;
  v4->_options = (NSArray *)v13;

  return v4;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
}

- (UIImage)icon
{
  return self->_icon;
}

- (void)setIcon:(id)a3
{
}

- (int64_t)tableViewStyle
{
  return self->_tableViewStyle;
}

- (void)setTableViewStyle:(int64_t)a3
{
  self->_tableViewStyle = a3;
}

- (NSArray)escapeOffers
{
  return self->_escapeOffers;
}

- (void)setEscapeOffers:(id)a3
{
}

- (NSArray)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_escapeOffers, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end