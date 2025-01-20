@interface ACUILoadingCell
- (ACUILoadingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (UIActivityIndicatorView)spinner;
- (void)didMoveToWindow;
- (void)setSpinner:(id)a3;
@end

@implementation ACUILoadingCell

- (ACUILoadingCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  v15 = self;
  SEL v14 = a2;
  int64_t v13 = a3;
  id location = 0;
  objc_storeStrong(&location, a4);
  v4 = v15;
  v15 = 0;
  v11.receiver = v4;
  v11.super_class = (Class)ACUILoadingCell;
  v15 = [(ACUILoadingCell *)&v11 initWithStyle:v13 reuseIdentifier:location];
  objc_storeStrong((id *)&v15, v15);
  if (v15)
  {
    id v10 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    objc_storeWeak((id *)&v15->_spinner, v10);
    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v8 = [(NSBundle *)v9 localizedStringForKey:@"LOADING" value:&stru_187E8 table:@"Localizable"];
    id v7 = [(ACUILoadingCell *)v15 textLabel];
    [v7 setText:v8];

    [(ACUILoadingCell *)v15 setAccessoryView:v10];
    objc_storeStrong(&v10, 0);
  }
  v6 = v15;
  objc_storeStrong(&location, 0);
  objc_storeStrong((id *)&v15, 0);
  return v6;
}

- (void)didMoveToWindow
{
  id v7 = self;
  SEL v6 = a2;
  v5.receiver = self;
  v5.super_class = (Class)ACUILoadingCell;
  [(ACUILoadingCell *)&v5 didMoveToWindow];
  id v4 = [(ACUILoadingCell *)v7 window];

  if (v4)
  {
    v3 = [(ACUILoadingCell *)v7 spinner];
    [(UIActivityIndicatorView *)v3 startAnimating];
  }
  else
  {
    v2 = [(ACUILoadingCell *)v7 spinner];
    [(UIActivityIndicatorView *)v2 stopAnimating];
  }
}

- (UIActivityIndicatorView)spinner
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_spinner);

  return (UIActivityIndicatorView *)WeakRetained;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
}

@end