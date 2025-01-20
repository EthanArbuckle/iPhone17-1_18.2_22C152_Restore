@interface SCATElementManagerViewController
- (BOOL)isDisplayed;
- (SCATElementManager)elementManager;
- (SCATElementManagerViewController)initWithElementManager:(id)a3;
- (SCATStyleProvider)styleProvider;
- (id)viewsRequiringStateUpdate;
- (void)didDismiss:(BOOL)a3;
- (void)didPresentWithDisplayContext:(id)a3 animated:(BOOL)a4;
- (void)didUpdateWithDisplayContext:(id)a3 animated:(BOOL)a4;
- (void)dismiss:(BOOL)a3;
- (void)presentWithDisplayContext:(id)a3 animated:(BOOL)a4;
- (void)setElementManager:(id)a3;
- (void)updateCustomFocusingViewStateForViewsWithElement:(id)a3;
- (void)viewDidLoad;
- (void)willDismiss:(BOOL)a3;
- (void)willPresentWithDisplayContext:(id)a3 animated:(BOOL)a4;
@end

@implementation SCATElementManagerViewController

- (SCATElementManagerViewController)initWithElementManager:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SCATElementManagerViewController;
  v5 = [(SCATElementManagerViewController *)&v8 initWithNibName:0 bundle:0];
  v6 = v5;
  if (v5) {
    [(SCATElementManagerViewController *)v5 setElementManager:v4];
  }

  return v6;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)SCATElementManagerViewController;
  [(SCATElementManagerViewController *)&v3 viewDidLoad];
  [(SCATElementManagerViewController *)self updateCustomFocusingViewStateForViewsWithElement:0];
}

- (SCATStyleProvider)styleProvider
{
  return (SCATStyleProvider *)+[SCATStyleProvider sharedStyleProvider];
}

- (void)presentWithDisplayContext:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    [(SCATElementManagerViewController *)self willPresentWithDisplayContext:v6 animated:v4];
    v7 = [(SCATElementManagerViewController *)self view];
    objc_super v8 = v7;
    if (v4)
    {
      [v7 setAlpha:0.0];

      v9 = [(SCATElementManagerViewController *)self view];
      [v6 addSubview:v9];

      [(SCATElementManagerViewController *)self didAddSubviewToDisplayContext:v6];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000E81B8;
      v13[3] = &unk_1001AAA90;
      v13[4] = self;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000E8200;
      v10[3] = &unk_1001AC4A0;
      v10[4] = self;
      id v11 = v6;
      BOOL v12 = v4;
      +[UIView animateWithDuration:v13 animations:v10 completion:0.3];
    }
    else
    {
      [v6 addSubview:v7];

      [(SCATElementManagerViewController *)self didAddSubviewToDisplayContext:v6];
      [(SCATElementManagerViewController *)self didPresentWithDisplayContext:v6 animated:0];
    }
  }
}

- (void)dismiss:(BOOL)a3
{
  BOOL v3 = a3;
  -[SCATElementManagerViewController willDismiss:](self, "willDismiss:");
  if (v3)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000E8330;
    v8[3] = &unk_1001AAA90;
    v8[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_1000E8378;
    v6[3] = &unk_1001AC8C0;
    v6[4] = self;
    char v7 = 1;
    +[UIView animateWithDuration:v8 animations:v6 completion:0.3];
  }
  else
  {
    v5 = [(SCATElementManagerViewController *)self view];
    [v5 removeFromSuperview];

    [(SCATElementManagerViewController *)self didDismiss:0];
  }
}

- (void)willPresentWithDisplayContext:(id)a3 animated:(BOOL)a4
{
  id v4 = [(SCATElementManagerViewController *)self elementManager];
  [v4 visualProviderWillPresent];
}

- (void)didPresentWithDisplayContext:(id)a3 animated:(BOOL)a4
{
  id v4 = [(SCATElementManagerViewController *)self elementManager];
  [v4 visualProviderDidPresent];
}

- (void)didUpdateWithDisplayContext:(id)a3 animated:(BOOL)a4
{
  id v4 = [(SCATElementManagerViewController *)self elementManager];
  [v4 visualProviderDidUpdate];
}

- (void)willDismiss:(BOOL)a3
{
  id v3 = [(SCATElementManagerViewController *)self elementManager];
  [v3 visualProviderWillDismiss];
}

- (void)didDismiss:(BOOL)a3
{
  id v3 = [(SCATElementManagerViewController *)self elementManager];
  [v3 visualProviderDidDismiss];
}

- (id)viewsRequiringStateUpdate
{
  return 0;
}

- (void)updateCustomFocusingViewStateForViewsWithElement:(id)a3
{
  id v4 = a3;
  if ([v4 isGroup])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [v4 parentGroup];
  }
  id v6 = v5;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  char v7 = [(SCATElementManagerViewController *)self viewsRequiringStateUpdate];
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(id *)(*((void *)&v22 + 1) + 8 * i);
        if (v12 == v4)
        {
          uint64_t v15 = 1;
          goto LABEL_17;
        }
        if (([v6 containsObject:*(void *)(*((void *)&v22 + 1) + 8 * i)] & 1) == 0)
        {
          v13 = [v12 subviews];
          v14 = [v13 firstObject];
          if ([v6 containsObject:v14])
          {
          }
          else
          {
            +[AXSettings sharedInstance];
            uint64_t v16 = v10;
            v17 = v6;
            id v18 = v4;
            v20 = v19 = v7;
            unsigned __int8 v21 = [v20 assistiveTouchGroupElementsEnabled];

            char v7 = v19;
            id v4 = v18;
            id v6 = v17;
            uint64_t v10 = v16;

            if (v21)
            {
              uint64_t v15 = 0;
              goto LABEL_17;
            }
          }
        }
        uint64_t v15 = 2;
LABEL_17:
        [v12 updateFocusState:v15];
      }
      id v9 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v9);
  }
}

- (BOOL)isDisplayed
{
  v2 = [(SCATElementManagerViewController *)self view];
  id v3 = [v2 window];
  BOOL v4 = v3 != 0;

  return v4;
}

- (SCATElementManager)elementManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_elementManager);

  return (SCATElementManager *)WeakRetained;
}

- (void)setElementManager:(id)a3
{
}

- (void).cxx_destruct
{
}

@end