@interface _MKMapViewSuspendedEffectsToken
- (_MKMapViewSuspendedEffectsToken)initWithOwner:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation _MKMapViewSuspendedEffectsToken

- (_MKMapViewSuspendedEffectsToken)initWithOwner:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_MKMapViewSuspendedEffectsToken;
  v5 = [(_MKMapViewSuspendedEffectsToken *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_owner, v4);
  }

  return v6;
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
    [WeakRetained _startEffects];

    self->_invalidated = 1;
  }
}

- (void)dealloc
{
  [(_MKMapViewSuspendedEffectsToken *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)_MKMapViewSuspendedEffectsToken;
  [(_MKMapViewSuspendedEffectsToken *)&v3 dealloc];
}

- (void).cxx_destruct
{
}

@end