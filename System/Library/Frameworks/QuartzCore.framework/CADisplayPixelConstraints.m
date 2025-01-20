@interface CADisplayPixelConstraints
- (CADisplayPixelConstraints)initWithConstraints:(const AveragePixelConstraints *)a3;
- (NSString)debugDescription;
- (const)averagePixelTable;
- (const)nitsTable;
- (const)rgbWeights;
- (unint64_t)tableSize;
- (void)dealloc;
@end

@implementation CADisplayPixelConstraints

- (NSString)debugDescription
{
  if (!self->_n) {
    return (NSString *)objc_msgSend(NSString, "stringWithFormat:", @"<%@:%p; no constraints>",
  }
                         objc_opt_class(),
                         self);
  v3 = (void *)[MEMORY[0x1E4F28E78] stringWithFormat:@"<%@:%p; nits [", objc_opt_class(), self];
  if (self->_n == 1)
  {
    unint64_t v4 = 0;
  }
  else
  {
    uint64_t v6 = 0;
    unsigned int v7 = 1;
    do
    {
      [v3 appendFormat:@"%f, ", self->_nits[v6]];
      uint64_t v6 = v7;
      unint64_t v4 = self->_n - 1;
      BOOL v8 = v4 > v7++;
    }
    while (v8);
  }
  objc_msgSend(v3, "appendFormat:", @"%f] averagePixel [", self->_nits[v4]);
  if (self->_n == 1)
  {
    unint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = 0;
    unsigned int v11 = 1;
    do
    {
      [v3 appendFormat:@"%f, ", self->_apl[v10]];
      uint64_t v10 = v11;
      unint64_t v9 = self->_n - 1;
      BOOL v8 = v9 > v11++;
    }
    while (v8);
  }
  objc_msgSend(v3, "appendFormat:", @"%f]>", self->_apl[v9]);
  return (NSString *)v3;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  free(self->_nits);
  free(self->_apl);
  v3.receiver = self;
  v3.super_class = (Class)CADisplayPixelConstraints;
  [(CADisplayPixelConstraints *)&v3 dealloc];
}

- (const)rgbWeights
{
  return self->_weights;
}

- (unint64_t)tableSize
{
  return self->_n;
}

- (const)averagePixelTable
{
  return self->_apl;
}

- (const)nitsTable
{
  return self->_nits;
}

- (CADisplayPixelConstraints)initWithConstraints:(const AveragePixelConstraints *)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a3) {
    return 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)CADisplayPixelConstraints;
  uint64_t v4 = [(CADisplayPixelConstraints *)&v11 init];
  if (v4)
  {
    size_t v5 = 4 * a3->var3;
    uint64_t v6 = (float *)malloc_type_calloc(1uLL, v5, 0x954E9FB7uLL);
    v4->_nits = v6;
    memcpy(v6, a3->var0, v5);
    size_t v7 = 4 * a3->var3;
    BOOL v8 = (float *)malloc_type_calloc(1uLL, v7, 0x8878A351uLL);
    v4->_apl = v8;
    memcpy(v8, a3->var1, v7);
    v4->_n = a3->var3;
    uint64_t v9 = *(void *)a3->var2;
    v4->_weights[2] = a3->var2[2];
    *(void *)v4->_weights = v9;
  }
  return v4;
}

@end