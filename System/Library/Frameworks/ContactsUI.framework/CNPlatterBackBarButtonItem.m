@interface CNPlatterBackBarButtonItem
- (CNPlatterBackBarButtonItem)initWithTarget:(id)a3 action:(SEL)a4 isRTL:(BOOL)a5;
- (id)backButtonPlatterImageForRTL:(BOOL)a3;
- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5;
@end

@implementation CNPlatterBackBarButtonItem

- (void)setBackgroundImage:(id)a3 forState:(unint64_t)a4 barMetrics:(int64_t)a5
{
  id v8 = a3;
  v9 = [(CNPlatterBackBarButtonItem *)self backgroundImageForState:a4 barMetrics:a5];
  if (!v9)
  {
    v10.receiver = self;
    v10.super_class = (Class)CNPlatterBackBarButtonItem;
    [(CNPlatterBackBarButtonItem *)&v10 setBackgroundImage:v8 forState:a4 barMetrics:a5];
  }
}

- (id)backButtonPlatterImageForRTL:(BOOL)a3
{
  if (a3) {
    v3 = @"back-button-platter-rtl";
  }
  else {
    v3 = @"back-button-platter-ltr";
  }
  v4 = objc_msgSend(MEMORY[0x1E4FB1818], "cnui_imageNamed:", v3);

  return v4;
}

- (CNPlatterBackBarButtonItem)initWithTarget:(id)a3 action:(SEL)a4 isRTL:(BOOL)a5
{
  BOOL v5 = a5;
  v11.receiver = self;
  v11.super_class = (Class)CNPlatterBackBarButtonItem;
  v6 = [(CNPlatterBackBarButtonItem *)&v11 initWithTitle:@" " style:0 target:a3 action:a4];
  v7 = v6;
  if (v6)
  {
    id v8 = [(CNPlatterBackBarButtonItem *)v6 backButtonPlatterImageForRTL:v5];
    [(CNPlatterBackBarButtonItem *)v7 setBackgroundImage:v8 forState:0 barMetrics:0];

    v9 = v7;
  }

  return v7;
}

@end