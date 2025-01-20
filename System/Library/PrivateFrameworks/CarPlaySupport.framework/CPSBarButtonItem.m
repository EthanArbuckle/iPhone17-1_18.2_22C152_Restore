@interface CPSBarButtonItem
- (CPBarButton)barButton;
- (CPSBarButtonItem)initWithCPBarButton:(id)a3;
- (CPSBarButtonItem)initWithCPBarButton:(id)a3 type:(unint64_t)a4;
- (CPSButtonDelegate)delegate;
- (NSUUID)identifier;
- (void)didSelectButton:(id)a3 withInteractionModel:(unint64_t)a4;
- (void)setDelegate:(id)a3;
@end

@implementation CPSBarButtonItem

- (CPSBarButtonItem)initWithCPBarButton:(id)a3
{
  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v4 = 3;
  if ((isKindOfClass & 1) == 0) {
    uint64_t v4 = 0;
  }
  v5 = v9;
  v9 = 0;
  v9 = [(CPSBarButtonItem *)v5 initWithCPBarButton:location[0] type:v4];
  v7 = v9;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v7;
}

- (CPSBarButtonItem)initWithCPBarButton:(id)a3 type:(unint64_t)a4
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  unint64_t v15 = a4;
  v11 = v17;
  id v13 = (id)[location[0] title];
  id v12 = (id)[location[0] image];
  BOOL v4 = barButtonStyle(location[0]);
  v17 = 0;
  v14.receiver = v11;
  v14.super_class = (Class)CPSBarButtonItem;
  v17 = [(CPUIBarButtonItem *)&v14 initWithTitle:v13 image:v12 style:v4 type:a4];
  objc_storeStrong((id *)&v17, v17);

  if (v17)
  {
    v5 = (NSUUID *)(id)[location[0] identifier];
    identifier = v17->_identifier;
    v17->_identifier = v5;

    objc_storeStrong((id *)&v17->_barButton, location[0]);
    [(CPUIBarButtonItem *)v17 setCpui_delegate:v17];
    char v7 = [location[0] isEnabled];
    [(CPUIBarButtonItem *)v17 setEnabled:v7 & 1];
  }
  v9 = v17;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v17, 0);
  return v9;
}

- (void)didSelectButton:(id)a3 withInteractionModel:(unint64_t)a4
{
  v11 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v7 = +[CPSUtilities sharedInstance];
  [(CPSUtilities *)v7 setLastButtonPressInteractionModel:a4];

  v8 = [(CPSBarButtonItem *)v11 delegate];
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    v5 = [(CPSBarButtonItem *)v11 delegate];
    BOOL v4 = [(CPSBarButtonItem *)v11 barButton];
    -[CPSButtonDelegate didSelectButton:](v5, "didSelectButton:");
  }
  objc_storeStrong(location, 0);
}

- (NSUUID)identifier
{
  return self->_identifier;
}

- (CPBarButton)barButton
{
  return self->_barButton;
}

- (CPSButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CPSButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end