@interface ADNormalsBuffer
- (id).cxx_construct;
@end

@implementation ADNormalsBuffer

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  return self;
}

- (void).cxx_destruct
{
  isa = self[1].super.isa;
  if (isa)
  {
    self[2].super.isa = isa;
    operator delete(isa);
  }
}

@end