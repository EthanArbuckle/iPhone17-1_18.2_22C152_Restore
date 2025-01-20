@interface SSUIPerUserMasterView
- (CGPoint)hotspotAdjustmentForCursorFrame:(CGRect)a3;
- (CGRect)savedCursorFrame;
- (NSMutableDictionary)assistModeViews;
- (SSUIPerUserMasterView)initWithFrame:(CGRect)a3;
- (void)animateAlphaToValue:(id)a3;
- (void)clearUserData;
- (void)hideAllPointers;
- (void)setAssistModeViews:(id)a3;
- (void)setCursorFrame:(CGRect)a3 animated:(BOOL)a4;
- (void)setSavedCursorFrame:(CGRect)a3;
- (void)setUserData:(id)a3;
- (void)showAllPointers;
@end

@implementation SSUIPerUserMasterView

- (SSUIPerUserMasterView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SSUIPerUserMasterView;
  v3 = -[SSUIPerUserMasterView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_opt_new();
    [(SSUIPerUserMasterView *)v3 setAssistModeViews:v4];
  }
  return v3;
}

- (CGPoint)hotspotAdjustmentForCursorFrame:(CGRect)a3
{
  double v3 = -48.0;
  double v4 = -32.0;
  result.y = v4;
  result.x = v3;
  return result;
}

- (void)setCursorFrame:(CGRect)a3 animated:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v12.origin.double x = x;
    v12.origin.double y = y;
    v12.size.double width = width;
    v12.size.double height = height;
    v9 = NSStringFromCGRect(v12);
    int v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setCursorFrame: %@", (uint8_t *)&v10, 0xCu);
  }
  -[SSUIPerUserMasterView setSavedCursorFrame:](self, "setSavedCursorFrame:", x, y, width, height);
}

- (void)setUserData:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"uniqueID"];
  objc_super v6 = [v4 objectForKeyedSubscript:@"displayName"];
  v7 = [v4 objectForKeyedSubscript:@"enabled"];

  unsigned int v8 = [v7 BOOLValue];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412802;
    v17 = v5;
    __int16 v18 = 1024;
    unsigned int v19 = v8;
    __int16 v20 = 2112;
    v21 = v6;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "setUserData: userID: %@, enabled: %d, displayName: %@", (uint8_t *)&v16, 0x1Cu);
  }
  if (v5)
  {
    v9 = [(SSUIPerUserMasterView *)self assistModeViews];
    int v10 = [v9 objectForKey:v5];

    if (v10) {
      goto LABEL_6;
    }
    v11 = [SSUIPerUserView alloc];
    [(SSUIPerUserMasterView *)self savedCursorFrame];
    double v13 = v12;
    [(SSUIPerUserMasterView *)self savedCursorFrame];
    int v10 = -[SSUIPerUserView initWithFrame:](v11, "initWithFrame:", 0.0, 0.0, v13);
    v14 = [(SSUIPerUserMasterView *)self assistModeViews];
    [v14 setObject:v10 forKey:v5];

    if (v10)
    {
LABEL_6:
      v15 = [(SSUIPerUserView *)v10 superview];

      if (v8)
      {
        if (!v15) {
          [(SSUIPerUserMasterView *)self addSubview:v10];
        }
      }
      else if (v15)
      {
        [(SSUIPerUserView *)v10 removeFromSuperview];
      }
      [(SSUIPerUserView *)v10 setDisplayName:v6];
      [(SSUIPerUserMasterView *)self savedCursorFrame];
      -[SSUIPerUserView setFrame:](v10, "setFrame:");
      [(SSUIPerUserView *)v10 frame];
      -[SSUIPerUserMasterView setNeedsDisplayInRect:](self, "setNeedsDisplayInRect:");
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_A744();
    }
  }
}

- (void)clearUserData
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "clearUserData", buf, 2u);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  double v3 = [(SSUIPerUserMasterView *)self assistModeViews];
  id v4 = [v3 allValues];

  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        int v10 = [v9 superview];

        if (v10) {
          [v9 removeFromSuperview];
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }

  v11 = [(SSUIPerUserMasterView *)self assistModeViews];
  [v11 removeAllObjects];
}

- (void)hideAllPointers
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_4814;
  v3[3] = &unk_103D8;
  v3[4] = self;
  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_4820;
  v2[3] = &unk_10400;
  v2[4] = self;
  +[UIView animateWithDuration:131074 delay:v3 usingSpringWithDamping:v2 initialSpringVelocity:1.0 options:0.0 animations:0.5 completion:0.0];
}

- (void)showAllPointers
{
  [(SSUIPerUserMasterView *)self setAlpha:0.0];
  [(SSUIPerUserMasterView *)self setHidden:0];
  id v3 = [&off_10A50 mutableCopy];
  [(SSUIPerUserMasterView *)self animateAlphaToValue:v3];
}

- (void)animateAlphaToValue:(id)a3
{
  id v4 = a3;
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  double v14 = 0.0;
  id v5 = [v4 lastObject];
  [v5 floatValue];
  double v7 = v6;

  double v14 = v7;
  [v4 removeLastObject];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_4A08;
  v12[3] = &unk_10428;
  v12[4] = self;
  v12[5] = v13;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_4A1C;
  v9[3] = &unk_10450;
  id v8 = v4;
  id v10 = v8;
  v11 = self;
  +[UIView animateWithDuration:131074 delay:v12 usingSpringWithDamping:v9 initialSpringVelocity:0.3 options:0.0 animations:0.1 completion:0.0];

  _Block_object_dispose(v13, 8);
}

- (NSMutableDictionary)assistModeViews
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAssistModeViews:(id)a3
{
}

- (CGRect)savedCursorFrame
{
  objc_copyStruct(v6, &self->_savedCursorFrame, 32, 1, 0);
  double v2 = *(double *)v6;
  double v3 = *(double *)&v6[1];
  double v4 = *(double *)&v6[2];
  double v5 = *(double *)&v6[3];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setSavedCursorFrame:(CGRect)a3
{
  CGRect v3 = a3;
  objc_copyStruct(&self->_savedCursorFrame, &v3, 32, 1, 0);
}

- (void).cxx_destruct
{
}

@end