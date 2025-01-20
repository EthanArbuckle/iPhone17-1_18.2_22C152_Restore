@interface FKARootNonInteractiveViewController
- (FKATypeaheadNamesViewController)typeaheadNamesViewController;
- (void)setTypeaheadNamesViewController:(id)a3;
- (void)updateTypeaheadNamesForQueryString:(id)a3;
@end

@implementation FKARootNonInteractiveViewController

- (void)updateTypeaheadNamesForQueryString:(id)a3
{
  id v4 = a3;
  v5 = [(FKARootNonInteractiveViewController *)self typeaheadNamesViewController];

  if (v5)
  {
    if ([v4 length])
    {
      v6 = dispatch_get_global_queue(0, 0);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000E32C;
      block[3] = &unk_100024778;
      block[4] = self;
      id v8 = v4;
      dispatch_async(v6, block);
    }
    else
    {
      AXPerformBlockOnMainThread();
    }
  }
}

- (FKATypeaheadNamesViewController)typeaheadNamesViewController
{
  return self->_typeaheadNamesViewController;
}

- (void)setTypeaheadNamesViewController:(id)a3
{
}

- (void).cxx_destruct
{
}

@end