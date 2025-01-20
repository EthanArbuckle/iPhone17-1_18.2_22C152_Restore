@interface __NSSKGraphE
- (void)dealloc;
@end

@implementation __NSSKGraphE

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  free(self->_edges);
  unint64_t numV = self->_numV;
  if (numV)
  {
    uint64_t v4 = 24 * numV - 8;
    do
    {
      v5 = *(void **)((char *)&self->_vertices->var0 + v4);
      if (v5) {
        free(v5);
      }
      v4 -= 24;
      --numV;
    }
    while (numV);
  }
  free(self->_vertices);
  v6.receiver = self;
  v6.super_class = (Class)__NSSKGraphE;
  [(__NSSKGraphE *)&v6 dealloc];
}

@end