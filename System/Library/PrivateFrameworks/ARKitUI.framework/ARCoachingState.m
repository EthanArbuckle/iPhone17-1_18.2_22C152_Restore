@interface ARCoachingState
- (ARCoachingOverlayView)view;
- (ARCoachingState)initWithView:(id)a3;
- (BOOL)isViewActiveForState;
- (id)doAction:(int64_t)a3;
- (int64_t)requirements;
- (void)setView:(id)a3;
@end

@implementation ARCoachingState

- (ARCoachingState)initWithView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)ARCoachingState;
  v5 = [(ARCoachingState *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_view, v4);
  }

  return v6;
}

- (int64_t)requirements
{
  return 0;
}

- (BOOL)isViewActiveForState
{
  return 1;
}

- (id)doAction:(int64_t)a3
{
  return 0;
}

- (ARCoachingOverlayView)view
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_view);

  return (ARCoachingOverlayView *)WeakRetained;
}

- (void)setView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end