@interface SCATPointPickerViewController
- (Class)classForPointPickerView;
- (NSString)prompt;
- (SCATMenu)menu;
- (SCATPointPickerView)pointPickerView;
- (SCATPointPickerViewController)init;
- (SCATPointPickerViewController)initWithElementManager:(id)a3 menu:(id)a4;
- (int64_t)pickerType;
- (unsigned)currentDisplayID;
- (void)dealloc;
- (void)loadView;
- (void)menuWillAppear:(id)a3;
- (void)menuWillDisappear:(id)a3;
- (void)setCurrentDisplayID:(unsigned int)a3;
- (void)setMenu:(id)a3;
- (void)setPrompt:(id)a3;
- (void)willPresentWithDisplayContext:(id)a3 animated:(BOOL)a4;
@end

@implementation SCATPointPickerViewController

- (SCATPointPickerViewController)init
{
  _AXAssert();

  return [(SCATPointPickerViewController *)self initWithElementManager:0 menu:0];
}

- (SCATPointPickerViewController)initWithElementManager:(id)a3 menu:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SCATPointPickerViewController;
  v8 = [(SCATElementManagerViewController *)&v11 initWithElementManager:a3];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_menu, a4);
    [(SCATMenu *)v9->_menu registerMenuObserver:v9];
    v9->_currentDisplayID = 1;
  }

  return v9;
}

- (void)loadView
{
  id v3 = objc_alloc_init([(SCATPointPickerViewController *)self classForPointPickerView]);
  [v3 setAutoresizingMask:18];
  [(SCATPointPickerViewController *)self setView:v3];
}

- (void)dealloc
{
  [(SCATMenu *)self->_menu unregisterMenuObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)SCATPointPickerViewController;
  [(SCATPointPickerViewController *)&v3 dealloc];
}

- (void)willPresentWithDisplayContext:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(SCATPointPickerViewController *)self view];
  objc_msgSend(v15, "setFrame:", v8, v10, v12, v14);

  unsigned int v16 = [v6 _accessibilityDisplayId];
  if (v16 <= 1) {
    uint64_t v17 = 1;
  }
  else {
    uint64_t v17 = v16;
  }
  self->_currentDisplayID = v17;
  v18 = [(SCATPointPickerViewController *)self pointPicker];
  [v18 setCurrentDisplayID:v17];

  v19.receiver = self;
  v19.super_class = (Class)SCATPointPickerViewController;
  [(SCATElementManagerViewController *)&v19 willPresentWithDisplayContext:v6 animated:v4];
}

- (SCATPointPickerView)pointPickerView
{
  objc_super v3 = [(SCATPointPickerViewController *)self view];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0) {
    _AXAssert();
  }

  return (SCATPointPickerView *)[(SCATPointPickerViewController *)self view];
}

- (void)setPrompt:(id)a3
{
  id v4 = a3;
  id v5 = [(SCATPointPickerViewController *)self pointPickerView];
  [v5 setPrompt:v4];
}

- (NSString)prompt
{
  v2 = [(SCATPointPickerViewController *)self pointPickerView];
  objc_super v3 = [v2 prompt];

  return (NSString *)v3;
}

- (Class)classForPointPickerView
{
  return (Class)objc_opt_class();
}

- (void)menuWillAppear:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E4E68;
  v3[3] = &unk_1001AAA90;
  v3[4] = self;
  +[UIView animateWithDuration:v3 animations:0.15];
}

- (void)menuWillDisappear:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1000E4F30;
  v3[3] = &unk_1001AAA90;
  v3[4] = self;
  +[UIView animateWithDuration:v3 animations:0.15];
}

- (SCATMenu)menu
{
  return self->_menu;
}

- (void)setMenu:(id)a3
{
}

- (unsigned)currentDisplayID
{
  return self->_currentDisplayID;
}

- (void)setCurrentDisplayID:(unsigned int)a3
{
  self->_currentDisplayID = a3;
}

- (void).cxx_destruct
{
}

- (int64_t)pickerType
{
  return 0;
}

@end