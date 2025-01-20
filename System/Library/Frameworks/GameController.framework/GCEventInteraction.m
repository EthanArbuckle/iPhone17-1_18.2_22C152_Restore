@interface GCEventInteraction
- (GCEventInteraction)init;
- (UIView)view;
- (unint64_t)handledEventTypes;
- (void)didMoveToView:(id)a3;
- (void)setHandledEventTypes:(unint64_t)a3;
@end

@implementation GCEventInteraction

- (GCEventInteraction)init
{
  v3.receiver = self;
  v3.super_class = (Class)GCEventInteraction;
  return [(GCEventInteraction *)&v3 init];
}

- (void)setHandledEventTypes:(unint64_t)a3
{
  self->_handledEventTypes = a3;
}

- (void)didMoveToView:(id)a3
{
}

- (UIView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (UIView *)WeakRetained;
}

- (unint64_t)handledEventTypes
{
  return self->_handledEventTypes;
}

- (void).cxx_destruct
{
}

@end