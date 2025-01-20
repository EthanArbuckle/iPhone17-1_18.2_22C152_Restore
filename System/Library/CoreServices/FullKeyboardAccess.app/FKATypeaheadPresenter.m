@interface FKATypeaheadPresenter
- (FKATypeaheadPresenter)initWithContainingView:(id)a3;
- (FKATypeaheadView)typeaheadView;
- (void)dismissFloatingView;
- (void)presentTypeaheadView;
- (void)setTypeaheadView:(id)a3;
@end

@implementation FKATypeaheadPresenter

- (FKATypeaheadPresenter)initWithContainingView:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)FKATypeaheadPresenter;
  return [(FKATypeaheadPresenter *)&v4 initWithContainingView:a3 alignedToEdge:4 withinSafeArea:0];
}

- (void)presentTypeaheadView
{
  v3 = [(FKATypeaheadPresenter *)self typeaheadView];

  if (!v3)
  {
    objc_super v4 = objc_alloc_init(FKATypeaheadView);
    [(FKATypeaheadPresenter *)self setTypeaheadView:v4];
  }
  id v5 = [(FKATypeaheadPresenter *)self typeaheadView];
  [(FKATypeaheadPresenter *)self presentFloatingView:v5 withDuration:0.0];
}

- (void)dismissFloatingView
{
  v3.receiver = self;
  v3.super_class = (Class)FKATypeaheadPresenter;
  [(FKATypeaheadPresenter *)&v3 dismissFloatingView];
  [(FKATypeaheadPresenter *)self setTypeaheadView:0];
}

- (FKATypeaheadView)typeaheadView
{
  return self->_typeaheadView;
}

- (void)setTypeaheadView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end