@interface PHEmergencyHandsetDialerView
- (PHEmergencyHandsetDialerView)initWithFrame:(CGRect)a3;
- (PHTextCycleLabel)emergencyTitleLabel;
- (id)deleteButtonXImageView;
- (id)newCallButton;
- (id)newDeleteButton;
- (id)newLCDView;
- (id)numberPadButtonsForCharacters:(id)a3;
- (int64_t)numberOfLinesInEmergencyTitleLabel;
@end

@implementation PHEmergencyHandsetDialerView

- (PHEmergencyHandsetDialerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PHEmergencyHandsetDialerView;
  v3 = -[PHHandsetDialerView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = +[UIColor whiteColor];
    [(PHEmergencyHandsetDialerView *)v3 setBackgroundColor:v4];
  }
  return v3;
}

- (PHTextCycleLabel)emergencyTitleLabel
{
  v2 = [(PHAbstractDialerView *)self lcdView];
  v3 = [v2 emergencyTitleLabel];

  return (PHTextCycleLabel *)v3;
}

- (id)newLCDView
{
  v3 = [PHEmergencyHandsetDialerLCDView alloc];
  [(PHEmergencyHandsetDialerView *)self bounds];
  v4 = -[PHEmergencyHandsetDialerLCDView initWithFrame:forDialerType:](v3, "initWithFrame:forDialerType:", 0, 0.0, 0.0);
  [(PHEmergencyHandsetDialerLCDView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  v5 = [(PHHandsetDialerLCDView *)v4 addContactButton];
  [(PHAbstractDialerView *)self setAddContactButton:v5];

  return v4;
}

- (id)deleteButtonXImageView
{
  v5.receiver = self;
  v5.super_class = (Class)PHEmergencyHandsetDialerView;
  v2 = [(PHHandsetDialerView *)&v5 deleteButtonXImageView];
  v3 = +[UIColor blackColor];
  [v2 setTintColor:v3];

  return v2;
}

- (id)newDeleteButton
{
  v5.receiver = self;
  v5.super_class = (Class)PHEmergencyHandsetDialerView;
  id v2 = [(PHHandsetDialerView *)&v5 newDeleteButton];
  v3 = +[UIColor blackColor];
  [v2 setTintColor:v3];

  return v2;
}

- (id)newCallButton
{
  id v3 = sub_10010C7DC();
  if (v3 && [v3 shouldUseRTT])
  {
    v4 = sub_1000834DC();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Using RTT for emergency call button", v10, 2u);
    }

    uint64_t v5 = 2;
  }
  else
  {
    uint64_t v5 = 1;
  }
  objc_super v6 = [PHBottomBarButtonConfiguration alloc];
  [(PHHandsetDialerView *)self callButtonDiameter];
  v7 = -[PHBottomBarButtonConfiguration initWithAction:diameter:callState:](v6, "initWithAction:diameter:callState:", v5, 2);
  v8 = [[PHBottomBarButton alloc] initWithConfiguration:v7];
  [(PHBottomBarButton *)v8 setTitle:0 forState:0];
  [(PHBottomBarButton *)v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  return v8;
}

- (id)numberPadButtonsForCharacters:(id)a3
{
  id v4 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100036594;
  v9[3] = &unk_1002CE010;
  v9[4] = self;
  id v5 = [objc_alloc((Class)NSMutableArray) initWithCapacity:[v4 count]];
  id v10 = v5;
  [v4 enumerateObjectsUsingBlock:v9];

  objc_super v6 = v10;
  id v7 = v5;

  return v7;
}

- (int64_t)numberOfLinesInEmergencyTitleLabel
{
  id v3 = [(PHAbstractDialerView *)self lcdView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    return -1;
  }
  id v5 = [(PHAbstractDialerView *)self lcdView];
  id v6 = [v5 numberOfLinesInEmergencyTitleLabel];

  return (int64_t)v6;
}

@end