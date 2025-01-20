@interface PHASETriangleSet
- (PHASETriangleSet)init;
- (PHASETriangleSet)initWithTriangleData:(id)a3 color:;
- (__n128)color;
- (__n128)pointAtIndex:(int)a3 vertexIndex:(int)a4;
- (id).cxx_construct;
- (int64_t)size;
@end

@implementation PHASETriangleSet

- (PHASETriangleSet)init
{
  v3.receiver = self;
  v3.super_class = (Class)PHASETriangleSet;
  return [(PHASETriangleSet *)&v3 init];
}

- (PHASETriangleSet)initWithTriangleData:(id)a3 color:
{
  long long v16 = v3;
  id v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PHASETriangleSet;
  v6 = [(PHASETriangleSet *)&v17 init];
  unint64_t v7 = [v5 length];
  unint64_t v8 = v7 / 0x24;
  v9 = v6 + 8;
  _ZNSt3__16vectorIDv3_fNS_9allocatorIS1_EEE6resizeEm((uint64_t)(v6 + 8), 3 * (v7 / 0x24));
  id v10 = v5;
  uint64_t v11 = [v10 bytes];
  if (v7 >= 0x24)
  {
    uint64_t v13 = 0;
    if (v8 <= 1) {
      unint64_t v14 = 1;
    }
    else {
      unint64_t v14 = v7 / 0x24;
    }
    do
    {
      *(void *)&long long v12 = *(void *)v11;
      DWORD2(v12) = *(_DWORD *)(v11 + 8);
      *(_OWORD *)(*v9 + v13) = v12;
      *(void *)&long long v12 = *(void *)(v11 + 12);
      DWORD2(v12) = *(_DWORD *)(v11 + 20);
      *(_OWORD *)(*v9 + v13 + 16) = v12;
      *(void *)&long long v12 = *(void *)(v11 + 24);
      DWORD2(v12) = *(_DWORD *)(v11 + 32);
      *(_OWORD *)(*v9 + v13 + 32) = v12;
      v13 += 48;
      v11 += 36;
      --v14;
    }
    while (v14);
  }
  *((void *)v6 + 4) = v8;
  *((_OWORD *)v6 + 3) = v16;

  return (PHASETriangleSet *)v6;
}

- (__n128)pointAtIndex:(int)a3 vertexIndex:(int)a4
{
  return *(__n128 *)(*(void *)(a1 + 8) + 16 * (3 * a3 + a4));
}

- (int64_t)size
{
  return self->_size;
}

- (__n128)color
{
  return a1[3];
}

- (void).cxx_destruct
{
  long long v3 = *(void **)self->_anon_8;
  if (v3)
  {
    *(void *)&self->_anon_8[8] = v3;
    operator delete(v3);
  }
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

@end