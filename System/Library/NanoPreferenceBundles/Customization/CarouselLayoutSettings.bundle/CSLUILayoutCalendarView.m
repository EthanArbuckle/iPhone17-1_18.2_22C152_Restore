@interface CSLUILayoutCalendarView
- (CSLUILayoutCalendarView)init;
- (void)calendarIconSource:(id)a3 updatedIcon:(id)a4 circularIcon:(id)a5;
- (void)dealloc;
@end

@implementation CSLUILayoutCalendarView

- (CSLUILayoutCalendarView)init
{
  v3 = +[CSLUICalendarIconSource sharedInstance];
  v4 = [v3 calendarIcon];

  [v4 size];
  double v6 = v5;
  v12.receiver = self;
  v12.super_class = (Class)CSLUILayoutCalendarView;
  v7 = -[CSLUILayoutCalendarView initWithFrame:](&v12, "initWithFrame:", 0.0, 0.0, v6, v6);
  if (v7)
  {
    id v8 = objc_msgSend(objc_alloc((Class)UIImageView), "initWithFrame:", 0.0, 0.0, v6, v6);
    v9 = +[CSLUILayoutIconView circleMaskImage:v4];
    [v8 setImage:v9];

    objc_storeWeak((id *)&v7->_imageView, v8);
    [(CSLUILayoutCalendarView *)v7 addSubview:v8];
    v10 = +[CSLUICalendarIconSource sharedInstance];
    [v10 addObserver:v7];
  }
  return v7;
}

- (void)dealloc
{
  v3 = +[CSLUICalendarIconSource sharedInstance];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)CSLUILayoutCalendarView;
  [(CSLUILayoutCalendarView *)&v4 dealloc];
}

- (void)calendarIconSource:(id)a3 updatedIcon:(id)a4 circularIcon:(id)a5
{
  id v7 = +[CSLUILayoutIconView circleMaskImage:a4];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_imageView);
  [WeakRetained setImage:v7];
}

- (void).cxx_destruct
{
}

@end