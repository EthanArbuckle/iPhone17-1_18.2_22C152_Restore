@interface AEGenericViewTile
- (AEGenericViewTile)initWithView:(id)a3;
- (UIView)view;
- (void)setView:(id)a3;
@end

@implementation AEGenericViewTile

- (void).cxx_destruct
{
}

- (void)setView:(id)a3
{
}

- (UIView)view
{
  return self->_view;
}

- (AEGenericViewTile)initWithView:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AEGenericViewTile;
  v6 = [(AEGenericViewTile *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_view, a3);
  }

  return v7;
}

@end