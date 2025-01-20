@interface PHASEShapeElement
+ (PHASEShapeElement)new;
- (PHASEMaterial)material;
- (PHASEShapeElement)init;
- (PHASEShapeElement)initWithOwner:(id)a3;
- (PHASEShapeElement)initWithOwner:(id)a3 material:(id)a4;
- (void)setMaterial:(PHASEMaterial *)material;
@end

@implementation PHASEShapeElement

- (PHASEShapeElement)init
{
  return 0;
}

+ (PHASEShapeElement)new
{
  return 0;
}

- (PHASEShapeElement)initWithOwner:(id)a3
{
  return [(PHASEShapeElement *)self initWithOwner:a3 material:0];
}

- (PHASEShapeElement)initWithOwner:(id)a3 material:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PHASEShapeElement;
  v8 = [(PHASEShapeElement *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_owner, v6);
    objc_storeStrong((id *)&v9->_material, a4);
  }

  return v9;
}

- (void)setMaterial:(PHASEMaterial *)material
{
  objc_storeStrong((id *)&self->_material, material);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_owner);
  [WeakRetained updateMaterialForElement:self];
}

- (PHASEMaterial)material
{
  return self->_material;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_material, 0);

  objc_destroyWeak((id *)&self->_owner);
}

@end