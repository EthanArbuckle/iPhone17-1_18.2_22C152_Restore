@interface PKSqueezePaletteViewExpandedLassoToolLayoutContext
- (id)initWithDrawingTool:(void *)a3 toolAngle:(void *)a4 barButtonItems:(double)a5 previousLayout:;
@end

@implementation PKSqueezePaletteViewExpandedLassoToolLayoutContext

- (id)initWithDrawingTool:(void *)a3 toolAngle:(void *)a4 barButtonItems:(double)a5 previousLayout:
{
  id v10 = a2;
  id v11 = a3;
  id v12 = a4;
  if (a1)
  {
    v17.receiver = a1;
    v17.super_class = (Class)PKSqueezePaletteViewExpandedLassoToolLayoutContext;
    v13 = (id *)objc_msgSendSuper2(&v17, sel_init);
    a1 = v13;
    if (v13)
    {
      objc_storeStrong(v13 + 1, a2);
      *((double *)a1 + 2) = a5;
      uint64_t v14 = [v11 copy];
      id v15 = a1[3];
      a1[3] = (id)v14;

      objc_storeStrong(a1 + 4, a4);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previousLayout, 0);
  objc_storeStrong((id *)&self->_barButtonItems, 0);

  objc_storeStrong((id *)&self->_drawingTool, 0);
}

@end