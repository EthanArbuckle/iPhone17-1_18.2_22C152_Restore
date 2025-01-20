@interface CPSHighlightForwardingButton
- (CPSHighlightable)highlightForwardingTarget;
- (void)setHighlightForwardingTarget:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation CPSHighlightForwardingButton

- (void)setHighlightForwardingTarget:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightForwardingTarget);

  if (WeakRetained != obj)
  {
    id v5 = objc_loadWeakRetained((id *)&self->_highlightForwardingTarget);
    [v5 setHighlighted:0];

    objc_storeWeak((id *)&self->_highlightForwardingTarget, obj);
    objc_msgSend(obj, "setHighlighted:", -[CPSHighlightForwardingButton isHighlighted](self, "isHighlighted"));
  }
}

- (void)setHighlighted:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CPSHighlightForwardingButton;
  [(CPSHighlightForwardingButton *)&v5 setHighlighted:a3];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightForwardingTarget);
  objc_msgSend(WeakRetained, "setHighlighted:", -[CPSHighlightForwardingButton isHighlighted](self, "isHighlighted"));
}

- (CPSHighlightable)highlightForwardingTarget
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_highlightForwardingTarget);

  return (CPSHighlightable *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end