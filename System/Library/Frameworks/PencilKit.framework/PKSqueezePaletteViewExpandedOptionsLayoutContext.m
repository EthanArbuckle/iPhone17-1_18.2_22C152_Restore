@interface PKSqueezePaletteViewExpandedOptionsLayoutContext
- (id)initMoreButtonAngle:(double)a3 previousLayout:;
@end

@implementation PKSqueezePaletteViewExpandedOptionsLayoutContext

- (id)initMoreButtonAngle:(double)a3 previousLayout:
{
  id v6 = a2;
  if (a1)
  {
    v9.receiver = a1;
    v9.super_class = (Class)PKSqueezePaletteViewExpandedOptionsLayoutContext;
    v7 = (id *)objc_msgSendSuper2(&v9, sel_init);
    a1 = v7;
    if (v7)
    {
      *((double *)v7 + 1) = a3;
      objc_storeStrong(v7 + 2, a2);
    }
  }

  return a1;
}

- (void).cxx_destruct
{
}

@end