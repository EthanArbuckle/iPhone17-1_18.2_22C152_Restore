@interface FKATypeaheadViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)requiresNativeFocus;
- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5;
- (FKATypeaheadPresenter)typeaheadPresenter;
- (FKATypeaheadViewControllerDelegate)delegate;
- (NSString)cachedTypeaheadString;
- (NSString)queryString;
- (NSTimer)clearCachedTypeaheadStringTimer;
- (unint64_t)state;
- (void)dealloc;
- (void)loadView;
- (void)sendDidChangeQueryString:(id)a3;
- (void)setCachedTypeaheadString:(id)a3;
- (void)setClearCachedTypeaheadStringTimer:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTypeaheadPresenter:(id)a3;
- (void)startTypeaheadStringClearCacheTimer;
- (void)toggleTypeaheadState;
@end

@implementation FKATypeaheadViewController

- (void)loadView
{
  v3 = objc_opt_new();
  [(FKATypeaheadViewController *)self setView:v3];

  v4 = [FKATypeaheadPresenter alloc];
  id v6 = [(FKATypeaheadViewController *)self view];
  v5 = [(FKATypeaheadPresenter *)v4 initWithContainingView:v6];
  [(FKATypeaheadViewController *)self setTypeaheadPresenter:v5];
}

- (BOOL)requiresNativeFocus
{
  return [(FKATypeaheadViewController *)self state] != 0;
}

- (void)toggleTypeaheadState
{
  unint64_t v3 = [(FKATypeaheadViewController *)self state];
  if (v3)
  {
    if (v3 != 1) {
      return;
    }
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v4 = 1;
  }

  [(FKATypeaheadViewController *)self setState:v4];
}

- (void)setState:(unint64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    if (a3)
    {
      if (a3 == 1)
      {
        uint64_t v4 = [(FKATypeaheadViewController *)self clearCachedTypeaheadStringTimer];
        [v4 invalidate];

        [(FKATypeaheadViewController *)self setClearCachedTypeaheadStringTimer:0];
        v5 = [(FKATypeaheadViewController *)self delegate];
        [v5 typeaheadViewControllerWillAppear:self];

        id v6 = [(FKATypeaheadViewController *)self typeaheadPresenter];
        [v6 setAlignedEdge:15];

        v7 = [(FKATypeaheadViewController *)self typeaheadPresenter];
        [v7 presentTypeaheadView];

        v8 = [(FKATypeaheadViewController *)self typeaheadPresenter];
        v9 = [v8 typeaheadView];
        v10 = [v9 typeaheadTextField];
        [v10 becomeFirstResponder];

        v11 = [(FKATypeaheadViewController *)self typeaheadPresenter];
        v12 = [v11 typeaheadView];
        v13 = [v12 typeaheadTextField];
        [v13 setDelegate:self];

        v14 = [(FKATypeaheadViewController *)self cachedTypeaheadString];
        id v15 = [v14 length];

        if (v15)
        {
          v16 = [(FKATypeaheadViewController *)self cachedTypeaheadString];
          v17 = [(FKATypeaheadViewController *)self typeaheadPresenter];
          v18 = [v17 typeaheadView];
          v19 = [v18 typeaheadTextField];
          [v19 setText:v16];

          v24[0] = _NSConcreteStackBlock;
          v24[1] = 3221225472;
          v24[2] = sub_10000B790;
          v24[3] = &unk_100024778;
          v24[4] = self;
          id v25 = v16;
          id v20 = v16;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, v24);
        }
      }
    }
    else
    {
      v21 = [(FKATypeaheadViewController *)self queryString];
      [(FKATypeaheadViewController *)self setCachedTypeaheadString:v21];

      v22 = [(FKATypeaheadViewController *)self typeaheadPresenter];
      [v22 dismissFloatingView];

      v23 = [(FKATypeaheadViewController *)self delegate];
      [v23 typeaheadViewControllerWillDismiss:self];

      [(FKATypeaheadViewController *)self startTypeaheadStringClearCacheTimer];
    }
  }
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v9 = a5;
  id v10 = a3;
  unsigned int v11 = [v9 isEqualToString:@"\n"];
  if (v11)
  {
    [v10 setText:0];

    v12 = [(FKATypeaheadViewController *)self delegate];
    [v12 typeaheadViewControllerDidTypeReturn:self];
  }
  else
  {
    v13 = [v10 text];

    v12 = objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", location, length, v9);

    [(FKATypeaheadViewController *)self sendDidChangeQueryString:v12];
  }

  return v11 ^ 1;
}

- (void)sendDidChangeQueryString:(id)a3
{
  id v4 = a3;
  id v5 = [(FKATypeaheadViewController *)self delegate];
  [v5 typeaheadViewController:self didChangeQueryString:v4];
}

- (NSString)queryString
{
  v2 = [(FKATypeaheadViewController *)self typeaheadPresenter];
  unint64_t v3 = [v2 typeaheadView];
  id v4 = [v3 typeaheadTextField];
  id v5 = [v4 text];

  return (NSString *)v5;
}

- (void)startTypeaheadStringClearCacheTimer
{
  unint64_t v3 = [(FKATypeaheadViewController *)self clearCachedTypeaheadStringTimer];
  if (v3)
  {
  }
  else
  {
    id v4 = [(FKATypeaheadViewController *)self cachedTypeaheadString];
    id v5 = [v4 length];

    if (v5)
    {
      objc_initWeak(&location, self);
      v7 = _NSConcreteStackBlock;
      uint64_t v8 = 3221225472;
      id v9 = sub_10000BAE4;
      id v10 = &unk_100024930;
      objc_copyWeak(&v11, &location);
      id v6 = +[NSTimer scheduledTimerWithTimeInterval:0 repeats:&v7 block:30.0];
      -[FKATypeaheadViewController setClearCachedTypeaheadStringTimer:](self, "setClearCachedTypeaheadStringTimer:", v6, v7, v8, v9, v10);

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

- (void)dealloc
{
  unint64_t v3 = [(FKATypeaheadViewController *)self clearCachedTypeaheadStringTimer];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)FKATypeaheadViewController;
  [(FKATypeaheadViewController *)&v4 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)state
{
  return self->_state;
}

- (FKATypeaheadViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FKATypeaheadViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (FKATypeaheadPresenter)typeaheadPresenter
{
  return self->_typeaheadPresenter;
}

- (void)setTypeaheadPresenter:(id)a3
{
}

- (NSString)cachedTypeaheadString
{
  return self->_cachedTypeaheadString;
}

- (void)setCachedTypeaheadString:(id)a3
{
}

- (NSTimer)clearCachedTypeaheadStringTimer
{
  return self->_clearCachedTypeaheadStringTimer;
}

- (void)setClearCachedTypeaheadStringTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clearCachedTypeaheadStringTimer, 0);
  objc_storeStrong((id *)&self->_cachedTypeaheadString, 0);
  objc_storeStrong((id *)&self->_typeaheadPresenter, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end