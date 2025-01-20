@interface MTLRasterizationRateMapDescriptorInternal
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)skipSampleValidationAndApplySampleAtTileGranularity;
- (BOOL)skipSampleValidationAndInterpolation;
- (MTLRasterizationRateMapDescriptorInternal)init;
- (MTLRasterizationRateMapDescriptorInternal)initWithScreenSize:(id *)a3;
- (const)layerPointer:(unint64_t *)a3;
- (float)minFactor;
- (id).cxx_construct;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)label;
- (id)layerAtIndex:(unint64_t)a3;
- (id)layers;
- (unint64_t)hash;
- (unint64_t)layerCount;
- (unint64_t)mutability;
- (void)dealloc;
- (void)setLabel:(id)a3;
- (void)setLayer:(id)a3 atIndex:(unint64_t)a4;
- (void)setMinFactor:(float)a3;
- (void)setMutability:(unint64_t)a3;
- (void)setScreenSize:(id *)a3;
- (void)setSkipSampleValidationAndApplySampleAtTileGranularity:(BOOL)a3;
- (void)setSkipSampleValidationAndInterpolation:(BOOL)a3;
@end

@implementation MTLRasterizationRateMapDescriptorInternal

- (MTLRasterizationRateMapDescriptorInternal)init
{
  v4.receiver = self;
  v4.super_class = (Class)MTLRasterizationRateMapDescriptorInternal;
  v2 = [(MTLRasterizationRateMapDescriptorInternal *)&v4 init];
  if (v2)
  {
    v2->_layerAccessor = [[MTLRasterizationRateLayerArrayInternal alloc] initWithParent:v2];
    v2->_mutability = 2;
    v2->_minFactor = 0.0;
  }
  return v2;
}

- (MTLRasterizationRateMapDescriptorInternal)initWithScreenSize:(id *)a3
{
  result = [(MTLRasterizationRateMapDescriptorInternal *)self init];
  if (result)
  {
    unint64_t var2 = a3->var2;
    *(_OWORD *)&result->_screenSize.width = *(_OWORD *)&a3->var0;
    result->_screenSize.depth = var2;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v4 = [+[MTLRasterizationRateMapDescriptor allocWithZone:a3] init];
  long long v5 = *(_OWORD *)&self->_screenSize.width;
  v4->_screenSize.depth = self->_screenSize.depth;
  *(_OWORD *)&v4->_screenSize.width = v5;
  v4->_label = (NSString *)[(NSString *)self->_label copy];
  p_layers = &self->_layers;
  unint64_t v7 = p_layers->var0 - p_layers->__begin_;
  uint64_t v11 = 0;
  std::vector<MTLRasterizationRateLayerDescriptor *>::resize((uint64_t)&v4->_layers, v7, &v11);
  begin = p_layers->__begin_;
  if (p_layers->var0 != p_layers->__begin_)
  {
    unint64_t v9 = 0;
    do
    {
      v4->_layers.__begin_[v9] = (__end_ *)[(__end_ *)begin[v9] copy];
      ++v9;
      begin = p_layers->__begin_;
    }
    while (v9 < p_layers->var0 - p_layers->__begin_);
  }
  return v4;
}

- (void)dealloc
{
  p_layers = &self->_layers;
  var0 = self->_layers.var0;
  if (var0 != self->_layers.__begin_)
  {
    unint64_t v5 = 0;
    var0 = self->_layers.__begin_;
    do
    {

      var0 = p_layers->__begin_;
    }
    while (v5 < p_layers->var0 - p_layers->__begin_);
  }
  p_layers->var0 = var0;

  v6.receiver = self;
  v6.super_class = (Class)MTLRasterizationRateMapDescriptorInternal;
  [(MTLRasterizationRateMapDescriptorInternal *)&v6 dealloc];
}

- (id)layerAtIndex:(unint64_t)a3
{
  begin = self->_layers.__begin_;
  if (a3 >= self->_layers.var0 - begin) {
    return 0;
  }
  else {
    return begin[a3];
  }
}

- (void)setLayer:(id)a3 atIndex:(unint64_t)a4
{
  id v7 = a3;
  p_layers = &self->_layers;
  begin = p_layers->__begin_;
  if (a4 >= p_layers->var0 - p_layers->__begin_)
  {
    if (!a3) {
      return;
    }
    uint64_t v11 = 0;
    std::vector<MTLRasterizationRateLayerDescriptor *>::resize((uint64_t)p_layers, a4 + 1, &v11);
    begin = p_layers->__begin_;
  }
  v10 = begin[a4];
  begin[a4] = (__end_ *)a3;
}

- (id)layers
{
  return self->_layerAccessor;
}

- (unint64_t)layerCount
{
  begin = self->_layers.__begin_;
  var0 = self->_layers.var0;
  unint64_t result = 0;
  uint64_t v5 = (char *)var0 - (char *)begin;
  if (v5)
  {
    unint64_t v6 = v5 >> 3;
    if (v6 <= 1) {
      unint64_t v6 = 1;
    }
    while (begin[result])
    {
      if (v6 == ++result) {
        return v6;
      }
    }
  }
  return result;
}

- (const)layerPointer:(unint64_t *)a3
{
  p_layers = &self->_layers;
  unint64_t result = (const void **)self->_layers.__begin_;
  uint64_t v5 = (char *)p_layers->var0 - (char *)result;
  if (v5)
  {
    unint64_t v6 = 0;
    unint64_t v7 = v5 >> 3;
    if (v7 <= 1) {
      unint64_t v7 = 1;
    }
    while (result[v6])
    {
      if (v7 == ++v6)
      {
        *a3 = v7;
        return result;
      }
    }
    *a3 = v6;
    if (!v6) {
      return 0;
    }
  }
  else
  {
    unint64_t result = 0;
    *a3 = 0;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v18) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_27;
    }
    label = self->_label;
    p_layers = &self->_layers;
    long long v30 = *(_OWORD *)&self->_screenSize.width;
    begin = self->_layers.__begin_;
    var0 = self->_layers.var0;
    unint64_t v9 = 0;
    uint64_t v10 = (char *)var0 - (char *)begin;
    if (v10)
    {
      unint64_t v11 = v10 >> 3;
      if (v11 <= 1) {
        unint64_t v11 = 1;
      }
      while (begin[v9])
      {
        if (v11 == ++v9)
        {
          unint64_t v9 = v11;
          break;
        }
      }
    }
    uint64_t v31 = [(NSString *)label hash];
    v12 = (void **)((char *)a3 + 40);
    long long v27 = *(_OWORD *)((char *)a3 + 8);
    uint64_t v14 = *((void *)a3 + 5);
    uint64_t v13 = *((void *)a3 + 6);
    uint64_t v15 = v13 - v14;
    if (v13 == v14)
    {
      unint64_t v16 = 0;
    }
    else
    {
      unint64_t v16 = 0;
      unint64_t v17 = v15 >> 3;
      if (v17 <= 1) {
        unint64_t v17 = 1;
      }
      while (*(void *)(v14 + 8 * v16))
      {
        if (v17 == ++v16)
        {
          unint64_t v16 = v17;
          break;
        }
      }
    }
    unint64_t v29 = v16;
    uint64_t v19 = objc_msgSend(*((id *)a3 + 4), "hash", (void)v27);
    BOOL v20 = (void)v30 == v28 && *((void *)&v30 + 1) == *((void *)&v27 + 1);
    BOOL v21 = v20 && v9 == v29;
    if (v21 && v31 == v19)
    {
      if (v9)
      {
        int v18 = [*(id *)p_layers->__begin_ isEqual:**v12];
        if (v18)
        {
          uint64_t v23 = 1;
          do
          {
            unint64_t v24 = v23;
            if (v9 == v23) {
              break;
            }
            char v25 = [(__end_ *)p_layers->__begin_[v23] isEqual:(*v12)[v23]];
            uint64_t v23 = v24 + 1;
          }
          while ((v25 & 1) != 0);
          LOBYTE(v18) = v24 >= v9;
        }
      }
      else
      {
        LOBYTE(v18) = 1;
      }
    }
    else
    {
LABEL_27:
      LOBYTE(v18) = 0;
    }
  }
  return v18;
}

- (unint64_t)hash
{
  label = self->_label;
  p_layers = &self->_layers;
  long long v13 = *(_OWORD *)&self->_screenSize.width;
  begin = self->_layers.__begin_;
  var0 = self->_layers.var0;
  uint64_t v7 = (char *)var0 - (char *)begin;
  if (var0 == begin)
  {
    unint64_t v8 = 0;
  }
  else
  {
    unint64_t v8 = 0;
    unint64_t v9 = v7 >> 3;
    if (v9 <= 1) {
      unint64_t v9 = 1;
    }
    while (begin[v8])
    {
      if (v9 == ++v8)
      {
        unint64_t v8 = v9;
        break;
      }
    }
  }
  unint64_t v14 = v8;
  uint64_t v15 = [(NSString *)label hash];
  unint64_t v10 = _MTLHashState((int *)&v13, 0x20uLL);
  if (v14)
  {
    for (unint64_t i = 0; i < v14; ++i)
      v10 ^= [(__end_ *)p_layers->__begin_[i] hash];
  }
  return v10;
}

- (id)description
{
  return [(MTLRasterizationRateMapDescriptorInternal *)self formattedDescription:0];
}

- (id)formattedDescription:(unint64_t)a3
{
  v17[12] = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a3 + 4;
  uint64_t v5 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v6 = v5;
  v17[0] = v5;
  v17[1] = @"label =";
  label = (__CFString *)self->_label;
  if (!label) {
    label = @"<none>";
  }
  v17[2] = label;
  v17[3] = v5;
  v17[4] = @"screenSize.width =";
  v17[5] = [NSNumber numberWithUnsignedInteger:self->_screenSize.width];
  v17[6] = v6;
  v17[7] = @"screenSize.height =";
  v17[8] = [NSNumber numberWithUnsignedInteger:self->_screenSize.height];
  v17[9] = v6;
  v17[10] = @"layerCount =";
  v17[11] = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[MTLRasterizationRateMapDescriptorInternal layerCount](self, "layerCount"));
  uint64_t v15 = (void *)[MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:12];
  unint64_t v8 = objc_opt_new();
  begin = self->_layers.__begin_;
  var0 = self->_layers.var0;
  if (var0 != begin)
  {
    unint64_t v11 = 0;
    do
    {
      v12 = begin[v11];
      if (v12)
      {
        [v8 addObject:v6];
        [v8 addObject:@" layers["];
        objc_msgSend(v8, "addObject:", objc_msgSend(NSNumber, "numberWithUnsignedInteger:", v11));
        [v8 addObject:@"] = "];
        objc_msgSend(v8, "addObject:", -[__end_ formattedDescription:](v12, "formattedDescription:", v4));
        begin = self->_layers.__begin_;
        var0 = self->_layers.var0;
      }
      ++v11;
    }
    while (v11 < var0 - begin);
  }
  v16.receiver = self;
  v16.super_class = (Class)MTLRasterizationRateMapDescriptorInternal;
  long long v13 = (void *)[NSString stringWithFormat:@"%@%@%@", -[MTLRasterizationRateMapDescriptorInternal description](&v16, sel_description), objc_msgSend(v15, "componentsJoinedByString:", @" ", objc_msgSend(v8, "componentsJoinedByString:", &stru_1ECAC84A8)];

  return v13;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)&self->var1;
  return self;
}

- (void)setScreenSize:(id *)a3
{
  unint64_t var2 = a3->var2;
  *(_OWORD *)&self->_screenSize.width = *(_OWORD *)&a3->var0;
  self->_screenSize.depth = var2;
}

- (BOOL)skipSampleValidationAndInterpolation
{
  return self->_skipSampleValidationAndInterpolation;
}

- (void)setSkipSampleValidationAndInterpolation:(BOOL)a3
{
  self->_skipSampleValidationAndInterpolation = a3;
}

- (BOOL)skipSampleValidationAndApplySampleAtTileGranularity
{
  return self->_skipSampleValidationAndApplySampleAtTileGranularity;
}

- (void)setSkipSampleValidationAndApplySampleAtTileGranularity:(BOOL)a3
{
  self->_skipSampleValidationAndApplySampleAtTileGranularity = a3;
}

- (unint64_t)mutability
{
  return self->_mutability;
}

- (void)setMutability:(unint64_t)a3
{
  self->_mutability = a3;
}

- (float)minFactor
{
  return self->_minFactor;
}

- (void)setMinFactor:(float)a3
{
  self->_minFactor = a3;
}

- (id)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
  p_layers = &self->_layers;
  begin = self->_layers.__begin_;
  if (begin)
  {
    p_layers->var0 = begin;
    operator delete(begin);
  }
}

- (id).cxx_construct
{
  *((void *)self + 6) = 0;
  *((void *)self + 7) = 0;
  *((void *)self + 5) = 0;
  return self;
}

@end