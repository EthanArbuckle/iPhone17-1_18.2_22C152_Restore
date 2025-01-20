@interface PHCarPlayGenericDialerViewController
- (AVExternalDevice)carPlayExternalDevice;
- (BOOL)handlingKeypadPress;
- (BOOL)limitedSoftPhoneKeypad;
- (DialerController)dialerController;
- (PHCarPlayNoContentBannerView)noContentBannerView;
- (int64_t)currentHighlightedControlIndex;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setCarPlayExternalDevice:(id)a3;
- (void)setCurrentHighlightedControlIndex:(int64_t)a3;
- (void)setDialerController:(id)a3;
- (void)setHandlingKeypadPress:(BOOL)a3;
- (void)setLimitedSoftPhoneKeypad:(BOOL)a3;
- (void)setNoContentBannerView:(id)a3;
@end

@implementation PHCarPlayGenericDialerViewController

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 mutableCopy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v13 type] == (id)4)
        {
          [v8 removeObject:v13];
          v14 = [(PHCarPlayGenericDialerViewController *)self dialerController];
          v15 = [v14 dialerView];
          v16 = [v15 phonePadView];
          [v16 performTapActionDownForHighlightedKey];
        }
        if ([v13 type] == (id)2 || objc_msgSend(v13, "type") == (id)3)
        {
          [v8 removeObject:v13];
          v17 = [(PHCarPlayGenericDialerViewController *)self view];
          v18 = [v17 window];
          v19 = +[NSSet setWithObject:v13];
          [v18 pressesBegan:v19 withEvent:v7];
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  v21.receiver = self;
  v21.super_class = (Class)PHCarPlayGenericDialerViewController;
  [(PHCarPlayGenericDialerViewController *)&v21 pressesBegan:v8 withEvent:v7];
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 mutableCopy];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v6;
  id v9 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v23;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v23 != v11) {
          objc_enumerationMutation(obj);
        }
        v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v13 type] == (id)4)
        {
          [v8 removeObject:v13];
          v14 = [(PHCarPlayGenericDialerViewController *)self dialerController];
          v15 = [v14 dialerView];
          v16 = [v15 phonePadView];
          [v16 performTapActionEndForHighlightedKey];

          [(PHCarPlayGenericDialerViewController *)self setHandlingKeypadPress:0];
        }
        if ([v13 type] == (id)2 || objc_msgSend(v13, "type") == (id)3)
        {
          [v8 removeObject:v13];
          v17 = [(PHCarPlayGenericDialerViewController *)self view];
          v18 = [v17 window];
          v19 = +[NSSet setWithObject:v13];
          [v18 pressesEnded:v19 withEvent:v7];
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v10);
  }

  v21.receiver = self;
  v21.super_class = (Class)PHCarPlayGenericDialerViewController;
  [(PHCarPlayGenericDialerViewController *)&v21 pressesEnded:v8 withEvent:v7];
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 mutableCopy];
  if ([(PHCarPlayGenericDialerViewController *)self handlingKeypadPress])
  {
    id v9 = [(PHCarPlayGenericDialerViewController *)self dialerController];
    id v10 = [v9 dialerView];
    uint64_t v11 = [v10 phonePadView];
    [v11 performTapActionCancelForHighlightedKey];

    [(PHCarPlayGenericDialerViewController *)self setHandlingKeypadPress:0];
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v6;
  id v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v15 = *(void *)v23;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v23 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v17 type] == (id)2 || objc_msgSend(v17, "type") == (id)3)
        {
          [v8 removeObject:v17];
          v18 = [(PHCarPlayGenericDialerViewController *)self view];
          v19 = [v18 window];
          v20 = +[NSSet setWithObject:v17];
          [v19 pressesCancelled:v20 withEvent:v7];
        }
      }
      id v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v14);
  }

  v21.receiver = self;
  v21.super_class = (Class)PHCarPlayGenericDialerViewController;
  [(PHCarPlayGenericDialerViewController *)&v21 pressesCancelled:v8 withEvent:v7];
}

- (DialerController)dialerController
{
  return (DialerController *)objc_getProperty(self, a2, 17, 1);
}

- (void)setDialerController:(id)a3
{
}

- (int64_t)currentHighlightedControlIndex
{
  return *(int64_t *)((char *)&self->_dialerController + 1);
}

- (void)setCurrentHighlightedControlIndex:(int64_t)a3
{
  *(DialerController **)((char *)&self->_dialerController + 1) = (DialerController *)a3;
}

- (PHCarPlayNoContentBannerView)noContentBannerView
{
  return (PHCarPlayNoContentBannerView *)objc_getProperty(self, a2, 33, 1);
}

- (void)setNoContentBannerView:(id)a3
{
}

- (AVExternalDevice)carPlayExternalDevice
{
  return (AVExternalDevice *)objc_getProperty(self, a2, 41, 1);
}

- (void)setCarPlayExternalDevice:(id)a3
{
}

- (BOOL)limitedSoftPhoneKeypad
{
  return *(&self->super._respondsToEventsWhileInCall + 1);
}

- (void)setLimitedSoftPhoneKeypad:(BOOL)a3
{
  *(&self->super._respondsToEventsWhileInCall + 1) = a3;
}

- (BOOL)handlingKeypadPress
{
  return *(&self->super._respondsToEventsWhileInCall + 2);
}

- (void)setHandlingKeypadPress:(BOOL)a3
{
  *(&self->super._respondsToEventsWhileInCall + 2) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_noContentBannerView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_currentHighlightedControlIndex + 1), 0);

  objc_storeStrong((id *)&self->_handlingKeypadPress, 0);
}

@end