@interface DelaunayTriangle
- (double)first;
- (double)second;
- (double)third;
- (float)area;
- (id)initFirst:(DelaunayTriangle *)self second:(SEL)a2 third:;
@end

@implementation DelaunayTriangle

- (id)initFirst:(DelaunayTriangle *)self second:(SEL)a2 third:
{
  uint64_t v10 = v2;
  uint64_t v11 = v4;
  uint64_t v9 = v3;
  v12.receiver = self;
  v12.super_class = (Class)DelaunayTriangle;
  v5 = [(DelaunayTriangle *)&v12 init];
  v6 = v5;
  if (v5)
  {
    *(void *)&v5->_first[4] = v10;
    *(void *)&v5->_second[4] = v9;
    *(void *)&v5->_third[4] = v11;
    v5->_area = fabsf(vmlas_n_f32(vmlas_n_f32((float)(*((float *)&v11 + 1) - *((float *)&v10 + 1)) * *(float *)&v9, *((float *)&v9 + 1) - *((float *)&v11 + 1), *(float *)&v10), *((float *)&v10 + 1) - *((float *)&v9 + 1), *(float *)&v11))* 0.5;
    v7 = v5;
  }

  return v6;
}

- (double)first
{
  return *(double *)(a1 + 16);
}

- (double)second
{
  return *(double *)(a1 + 24);
}

- (double)third
{
  return *(double *)(a1 + 32);
}

- (float)area
{
  return self->_area;
}

@end