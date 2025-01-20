@interface _HKOutsideTapCallback
- (UIView)view;
- (_HKOutsideTapCallback)initWithView:(id)a3 outsideTapBlock:(id)a4;
- (id)outsideTapBlock;
@end

@implementation _HKOutsideTapCallback

- (_HKOutsideTapCallback)initWithView:(id)a3 outsideTapBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)_HKOutsideTapCallback;
  v8 = [(_HKOutsideTapCallback *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_view, v6);
    v10 = _Block_copy(v7);
    id outsideTapBlock = v9->_outsideTapBlock;
    v9->_id outsideTapBlock = v10;
  }
  return v9;
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);
  return (UIView *)WeakRetained;
}

- (id)outsideTapBlock
{
  return self->_outsideTapBlock;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_outsideTapBlock, 0);
  objc_destroyWeak((id *)&self->_view);
}

@end