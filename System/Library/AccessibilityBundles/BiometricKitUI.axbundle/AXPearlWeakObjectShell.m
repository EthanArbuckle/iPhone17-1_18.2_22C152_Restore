@interface AXPearlWeakObjectShell
- (id)weakObjectReference;
- (id)weakSpatialProfileReference;
- (void)setWeakObjectReference:(id)a3;
- (void)setWeakSpatialProfileReference:(id)a3;
@end

@implementation AXPearlWeakObjectShell

- (id)weakObjectReference
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakObjectReference);

  return WeakRetained;
}

- (void)setWeakObjectReference:(id)a3
{
}

- (id)weakSpatialProfileReference
{
  id WeakRetained = objc_loadWeakRetained(&self->_weakSpatialProfileReference);

  return WeakRetained;
}

- (void)setWeakSpatialProfileReference:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_weakSpatialProfileReference);

  objc_destroyWeak(&self->_weakObjectReference);
}

@end