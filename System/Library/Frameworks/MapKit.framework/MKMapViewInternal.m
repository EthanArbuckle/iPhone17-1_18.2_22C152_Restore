@interface MKMapViewInternal
- (void)startEffects;
@end

@implementation MKMapViewInternal

- (void)startEffects
{
  p_view = &self->view;
  WeakRetained = objc_loadWeakRetained((id *)&self->view);
  uint64_t v4 = WeakRetained[67];

  if (!v4)
  {
    id v5 = objc_loadWeakRetained((id *)p_view);
    [v5 _updateShouldDisplayEffects];
  }
}

- (void).cxx_destruct
{
}

@end