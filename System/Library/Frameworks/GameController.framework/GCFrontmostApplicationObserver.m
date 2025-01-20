@interface GCFrontmostApplicationObserver
- (GCFrontmostApplicationObserver)initWithDelegate:(id)a3;
- (GCFrontmostApplicationObserverDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation GCFrontmostApplicationObserver

- (GCFrontmostApplicationObserver)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = [(GCFrontmostApplicationObserver *)self init];
  v6 = v5;
  if (v5) {
    [(GCFrontmostApplicationObserver *)v5 setDelegate:v4];
  }

  return v6;
}

- (GCFrontmostApplicationObserverDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (GCFrontmostApplicationObserverDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end