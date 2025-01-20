@interface PKSqueezePaletteViewExpandedInkingToolLayoutContext
- (id)initWithDrawingTool:(void *)a3 toolAngle:(double)a4 previousLayout:;
@end

@implementation PKSqueezePaletteViewExpandedInkingToolLayoutContext

- (id)initWithDrawingTool:(void *)a3 toolAngle:(double)a4 previousLayout:
{
  id v8 = a2;
  id v9 = a3;
  if (a1)
  {
    v12.receiver = a1;
    v12.super_class = (Class)PKSqueezePaletteViewExpandedInkingToolLayoutContext;
    v10 = (id *)objc_msgSendSuper2(&v12, sel_init);
    a1 = v10;
    if (v10)
    {
      objc_storeStrong(v10 + 3, a2);
      *((double *)a1 + 1) = a4;
      objc_storeStrong(a1 + 2, a3);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_drawingTool, 0);

  objc_storeStrong((id *)&self->_previousLayout, 0);
}

@end