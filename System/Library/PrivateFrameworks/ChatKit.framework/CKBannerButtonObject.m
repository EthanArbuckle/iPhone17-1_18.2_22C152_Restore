@interface CKBannerButtonObject
- (CKBannerButtonObject)initWithTitle:(id)a3 handler:(id)a4;
- (CKBannerButtonObject)initWithTitle:(id)a3 handler:(id)a4 menuItems:(id)a5;
- (NSArray)menuItems;
- (NSString)title;
- (id)handler;
- (void)setHandler:(id)a3;
- (void)setMenuItems:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation CKBannerButtonObject

- (CKBannerButtonObject)initWithTitle:(id)a3 handler:(id)a4 menuItems:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)CKBannerButtonObject;
  v11 = [(CKBannerButtonObject *)&v14 init];
  v12 = v11;
  if (v11)
  {
    [(CKBannerButtonObject *)v11 setTitle:v8];
    [(CKBannerButtonObject *)v12 setHandler:v9];
    [(CKBannerButtonObject *)v12 setMenuItems:v10];
  }

  return v12;
}

- (CKBannerButtonObject)initWithTitle:(id)a3 handler:(id)a4
{
  return [(CKBannerButtonObject *)self initWithTitle:a3 handler:a4 menuItems:0];
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (NSArray)menuItems
{
  return self->_menuItems;
}

- (void)setMenuItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_menuItems, 0);
  objc_storeStrong(&self->_handler, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end