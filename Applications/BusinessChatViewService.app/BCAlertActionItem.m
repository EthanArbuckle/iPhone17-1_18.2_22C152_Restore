@interface BCAlertActionItem
- (BCAlertActionItem)initWithTitle:(id)a3 subTitle:(id)a4 iconName:(id)a5 actionType:(unint64_t)a6 handler:(id)a7;
- (NSString)iconName;
- (NSString)subTitle;
- (NSString)title;
- (UIImage)icon;
- (id)handler;
- (unint64_t)actionType;
- (void)setActionType:(unint64_t)a3;
- (void)setHandler:(id)a3;
- (void)setIcon:(id)a3;
- (void)setIconName:(id)a3;
- (void)setSubTitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation BCAlertActionItem

- (BCAlertActionItem)initWithTitle:(id)a3 subTitle:(id)a4 iconName:(id)a5 actionType:(unint64_t)a6 handler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)BCAlertActionItem;
  v17 = [(BCAlertActionItem *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_title, a3);
    objc_storeStrong((id *)&v18->_subTitle, a4);
    objc_storeStrong((id *)&v18->_iconName, a5);
    v18->_actionType = a6;
    id v19 = objc_retainBlock(v16);
    id handler = v18->_handler;
    v18->_id handler = v19;
  }
  return v18;
}

- (UIImage)icon
{
  if (!self->_icon)
  {
    v3 = [(BCAlertActionItem *)self iconName];
    id v4 = [v3 length];

    if (v4)
    {
      unint64_t v5 = [(BCAlertActionItem *)self actionType];
      v6 = [(BCAlertActionItem *)self iconName];
      v7 = +[UIImage imageNamed:v6];
      v8 = v7;
      if (v5 == 2)
      {

        v7 = [(UIImage *)v8 imageWithRenderingMode:2];
      }
      else
      {
        v8 = v6;
      }
      icon = self->_icon;
      self->_icon = v7;
    }
  }
  v10 = self->_icon;

  return v10;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subTitle
{
  return self->_subTitle;
}

- (void)setSubTitle:(id)a3
{
}

- (unint64_t)actionType
{
  return self->_actionType;
}

- (void)setActionType:(unint64_t)a3
{
  self->_actionType = a3;
}

- (id)handler
{
  return self->_handler;
}

- (void)setHandler:(id)a3
{
}

- (void)setIcon:(id)a3
{
}

- (NSString)iconName
{
  return self->_iconName;
}

- (void)setIconName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iconName, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_subTitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end