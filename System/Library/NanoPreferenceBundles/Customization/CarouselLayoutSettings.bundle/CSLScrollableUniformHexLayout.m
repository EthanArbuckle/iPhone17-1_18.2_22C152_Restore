@interface CSLScrollableUniformHexLayout
- ($153C3A5BC4E016D58A1B9CA554FFC462)layoutAttributesForItemAtHex:(Hex)a3;
- (Hex)hexAtPoint:(CGPoint)a3;
@end

@implementation CSLScrollableUniformHexLayout

- ($153C3A5BC4E016D58A1B9CA554FFC462)layoutAttributesForItemAtHex:(Hex)a3
{
  v5 = v3;
  *(_OWORD *)v3->f32 = 0u;
  *(_OWORD *)v3[2].f32 = 0u;
  v9.receiver = self;
  v9.super_class = (Class)CSLScrollableUniformHexLayout;
  [(CSLUniformHexLayout *)&v9 layoutAttributesForItemAtHex:a3];
  [(CSLHexLayout *)self scrolledPointFromContentPoint:vcvtq_f64_f32(*v5)];
  *(float *)&v8.var0 = v8.var0;
  v5[1].i32[0] = (__int32)v5[1];
  v6.i32[0] = LODWORD(v8.var0);
  *(float *)&v8.var0 = v7;
  v6.i32[1] = LODWORD(v8.var0);
  float32x2_t *v5 = v6;
  return v8;
}

- (Hex)hexAtPoint:(CGPoint)a3
{
  -[CSLHexLayout contentPointFromScrolledPoint:](self, "contentPointFromScrolledPoint:", a3.x, a3.y);
  v5.receiver = self;
  v5.super_class = (Class)CSLScrollableUniformHexLayout;
  return (Hex)-[CSLUniformHexLayout hexAtPoint:](&v5, "hexAtPoint:");
}

@end