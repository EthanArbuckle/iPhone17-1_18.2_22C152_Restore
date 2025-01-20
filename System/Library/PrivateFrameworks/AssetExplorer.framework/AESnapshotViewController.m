@interface AESnapshotViewController
- (AESnapshotViewController)initWithViewController:(id)a3;
- (UIView)_snapshotView;
- (void)loadView;
@end

@implementation AESnapshotViewController

- (void).cxx_destruct
{
}

- (UIView)_snapshotView
{
  return self->__snapshotView;
}

- (void)loadView
{
  id v3 = [(AESnapshotViewController *)self _snapshotView];
  [(AESnapshotViewController *)self setView:v3];
}

- (AESnapshotViewController)initWithViewController:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AESnapshotViewController;
  v5 = [(AESnapshotViewController *)&v11 initWithNibName:0 bundle:0];
  if (v5)
  {
    v6 = [v4 view];
    uint64_t v7 = [v6 snapshotViewAfterScreenUpdates:0];
    snapshotView = v5->__snapshotView;
    v5->__snapshotView = (UIView *)v7;

    v9 = v5;
  }

  return v5;
}

@end