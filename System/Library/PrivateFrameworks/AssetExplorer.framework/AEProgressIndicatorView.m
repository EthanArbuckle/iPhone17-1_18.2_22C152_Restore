@interface AEProgressIndicatorView
- (AEProgressIndicatorView)initWithFrame:(CGRect)a3 progress:(id)a4;
- (NSProgress)_progress;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation AEProgressIndicatorView

- (void).cxx_destruct
{
}

- (NSProgress)_progress
{
  return self->__progress;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a4;
  v11 = v10;
  if ((void *)AEProgressIndicatorViewObserverContext == a6)
  {
    [v10 fractionCompleted];
    -[PLRoundProgressView setProgress:](self, "setProgress:");
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)AEProgressIndicatorView;
    [(AEProgressIndicatorView *)&v12 observeValueForKeyPath:a3 ofObject:v10 change:a5 context:a6];
  }
}

- (void)dealloc
{
  v3 = [(AEProgressIndicatorView *)self _progress];
  [v3 removeObserver:self forKeyPath:@"fractionCompleted" context:AEProgressIndicatorViewObserverContext];

  v4.receiver = self;
  v4.super_class = (Class)AEProgressIndicatorView;
  [(PLRoundProgressView *)&v4 dealloc];
}

- (AEProgressIndicatorView)initWithFrame:(CGRect)a3 progress:(id)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AEProgressIndicatorView;
  v11 = -[PLRoundProgressView initWithFrame:style:](&v14, sel_initWithFrame_style_, 0, x, y, width, height);
  objc_super v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->__progress, a4);
    [(NSProgress *)v12->__progress addObserver:v12 forKeyPath:@"fractionCompleted" options:4 context:AEProgressIndicatorViewObserverContext];
  }

  return v12;
}

@end