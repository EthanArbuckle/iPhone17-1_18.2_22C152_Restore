@interface ADDisplayScaleContextCollector
- (ADDisplayScaleContextCollector)initWithDelegate:(id)a3;
- (ADDisplayScaleContextCollectorDelegate)delegate;
- (double)displayScale;
- (void)dealloc;
- (void)setDelegate:(id)a3;
@end

@implementation ADDisplayScaleContextCollector

- (void).cxx_destruct
{
}

- (ADDisplayScaleContextCollectorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ADDisplayScaleContextCollectorDelegate *)WeakRetained;
}

- (double)displayScale
{
  _AFMainScreenScale(self, a2);
  return result;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_delegate, obj);
    v6 = obj;
  }
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)ADDisplayScaleContextCollector;
  [(ADDisplayScaleContextCollector *)&v2 dealloc];
}

- (ADDisplayScaleContextCollector)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ADDisplayScaleContextCollector;
  v5 = [(ADDisplayScaleContextCollector *)&v8 init];
  v6 = v5;
  if (v5) {
    [(ADDisplayScaleContextCollector *)v5 setDelegate:v4];
  }

  return v6;
}

@end