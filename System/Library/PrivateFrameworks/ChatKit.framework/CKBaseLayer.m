@interface CKBaseLayer
- (CKLayerDelegate)ckLayerDelegate;
- (void)layerDidBecomeVisible:(BOOL)a3;
- (void)setCkLayerDelegate:(id)a3;
@end

@implementation CKBaseLayer

- (void)layerDidBecomeVisible:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CKBaseLayer;
  -[CKBaseLayer layerDidBecomeVisible:](&v6, sel_layerDidBecomeVisible_);
  v5 = [(CKBaseLayer *)self ckLayerDelegate];
  [v5 ckLayerDidBecomeVisible:v3];
}

- (CKLayerDelegate)ckLayerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_ckLayerDelegate);

  return (CKLayerDelegate *)WeakRetained;
}

- (void)setCkLayerDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end