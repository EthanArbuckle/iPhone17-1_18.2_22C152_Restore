@interface GAXEventStealerView
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)shouldStealAllEvents;
- (GAXEventStealerView)initWithCoder:(id)a3;
- (GAXEventStealerView)initWithFrame:(CGRect)a3;
- (GAXEventStealerViewDelegate)eventStealerViewDelegate;
- (void)_commonInit;
- (void)setEventStealerViewDelegate:(id)a3;
- (void)setShouldStealAllEvents:(BOOL)a3;
@end

@implementation GAXEventStealerView

- (void)_commonInit
{
}

- (GAXEventStealerView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GAXEventStealerView;
  v3 = -[GAXEventStealerView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(GAXEventStealerView *)v3 _commonInit];
  }
  return v4;
}

- (GAXEventStealerView)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)GAXEventStealerView;
  v3 = [(GAXEventStealerView *)&v6 initWithCoder:a3];
  v4 = v3;
  if (v3) {
    [(GAXEventStealerView *)v3 _commonInit];
  }
  return v4;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if ([(GAXEventStealerView *)self shouldStealAllEvents]
    || (v11.receiver = self,
        v11.super_class = (Class)GAXEventStealerView,
        -[GAXEventStealerView pointInside:withEvent:](&v11, "pointInside:withEvent:", v7, x, y)))
  {
    unsigned __int8 v8 = 1;
  }
  else
  {
    v9 = [(GAXEventStealerView *)self eventStealerViewDelegate];
    if (objc_opt_respondsToSelector()) {
      unsigned __int8 v8 = objc_msgSend(v9, "eventStealerView:shouldStealEventAtPoint:", self, x, y);
    }
    else {
      unsigned __int8 v8 = 0;
    }
  }
  return v8;
}

- (BOOL)shouldStealAllEvents
{
  return self->_shouldStealAllEvents;
}

- (void)setShouldStealAllEvents:(BOOL)a3
{
  self->_shouldStealAllEvents = a3;
}

- (GAXEventStealerViewDelegate)eventStealerViewDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_eventStealerViewDelegate);

  return (GAXEventStealerViewDelegate *)WeakRetained;
}

- (void)setEventStealerViewDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end