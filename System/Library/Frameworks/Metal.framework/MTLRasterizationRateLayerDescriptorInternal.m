@interface MTLRasterizationRateLayerDescriptorInternal
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxSampleCount;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sampleCount;
- (BOOL)isEqual:(id)a3;
- (MTLRasterizationRateLayerDescriptorInternal)init;
- (MTLRasterizationRateLayerDescriptorInternal)initWithSampleCount:(id *)a3;
- (MTLRasterizationRateLayerDescriptorInternal)initWithSampleCount:(id *)a3 horizontal:(const float *)a4 vertical:(const float *)a5;
- (float)horizontalSampleStorage;
- (float)verticalSampleStorage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)horizontal;
- (id)vertical;
- (unint64_t)hash;
- (void)dealloc;
- (void)setSampleCount:(id *)a3;
@end

@implementation MTLRasterizationRateLayerDescriptorInternal

- (MTLRasterizationRateLayerDescriptorInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLRasterizationRateLayerDescriptorInternal;

  return 0;
}

- (MTLRasterizationRateLayerDescriptorInternal)initWithSampleCount:(id *)a3
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v11 = *a3;
  v10.receiver = self;
  v10.super_class = (Class)MTLRasterizationRateLayerDescriptorInternal;
  v4 = [(MTLRasterizationRateLayerDescriptor *)&v10 initWithSampleCount:&v11];
  if (v4)
  {
    if (!a3->var0) {
      goto LABEL_7;
    }
    unint64_t var1 = a3->var1;
    if (!var1) {
      goto LABEL_7;
    }
    v6 = malloc_type_calloc(var1 + a3->var0, 4uLL, 0x100004052888210uLL);
    *((void *)v4 + 1) = v6;
    if (!v6) {
      goto LABEL_7;
    }
    long long v7 = *(_OWORD *)&a3->var0;
    *((_OWORD *)v4 + 1) = *(_OWORD *)&a3->var0;
    *((void *)v4 + 4) = 0;
    *((void *)v4 + 7) = 0;
    *(_OWORD *)(v4 + 40) = v7;
    *((void *)v4 + 8) = -[MTLRasterizationRateSampleArrayInternal initWithData:numElements:]([MTLRasterizationRateSampleArrayInternal alloc], "initWithData:numElements:", [v4 horizontalSampleStorage], *((void *)v4 + 2));
    v8 = -[MTLRasterizationRateSampleArrayInternal initWithData:numElements:]([MTLRasterizationRateSampleArrayInternal alloc], "initWithData:numElements:", [v4 verticalSampleStorage], *((void *)v4 + 3));
    *((void *)v4 + 9) = v8;
    if (!*((void *)v4 + 8) || !v8)
    {
LABEL_7:
      [v4 dealloc];
      return 0;
    }
  }
  return (MTLRasterizationRateLayerDescriptorInternal *)v4;
}

- (MTLRasterizationRateLayerDescriptorInternal)initWithSampleCount:(id *)a3 horizontal:(const float *)a4 vertical:(const float *)a5
{
  $F99D9A4FB75BC57F3386B8DC8EE08D7A v10 = *a3;
  long long v7 = [(MTLRasterizationRateLayerDescriptorInternal *)self initWithSampleCount:&v10];
  v8 = v7;
  if (v7)
  {
    memcpy([(MTLRasterizationRateLayerDescriptorInternal *)v7 horizontalSampleStorage], a4, 4 * v7->_size.width);
    memcpy([(MTLRasterizationRateLayerDescriptorInternal *)v8 verticalSampleStorage], a5, 4 * v8->_size.height);
  }
  return v8;
}

- (void)dealloc
{
  free(self->_data);

  v3.receiver = self;
  v3.super_class = (Class)MTLRasterizationRateLayerDescriptorInternal;
  [(MTLRasterizationRateLayerDescriptorInternal *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[MTLRasterizationRateLayerDescriptor allocWithZone:a3];
  $E8CF8C4D35898297CF58D66FCEA3D064 size = self->_size;
  uint64_t v5 = [(MTLRasterizationRateLayerDescriptorInternal *)v4 initWithSampleCount:&size];
  v6 = (void *)v5;
  if (v5)
  {
    memcpy(*(void **)(v5 + 8), self->_data, 4 * (self->_size.height + self->_size.width));
    long long v8 = *(_OWORD *)&self->_currentSampleCount.width;
    unint64_t depth = self->_currentSampleCount.depth;
    [v6 setSampleCount:&v8];
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  objc_opt_class();
  BOOL result = (objc_opt_isKindOfClass() & 1) != 0
        && (unint64_t width = self->_size.width, width == *((void *)a3 + 2))
        && (unint64_t height = self->_size.height, height == *((void *)a3 + 3))
        && self->_currentSampleCount.width == *((void *)a3 + 5)
        && self->_currentSampleCount.height == *((void *)a3 + 6)
        && memcmp(self->_data, *((const void **)a3 + 1), 4 * (height + width)) == 0;
  return result;
}

- (unint64_t)hash
{
  unint64_t v2 = self->_currentSampleCount.width ^ self->_currentSampleCount.height;
  return v2 ^ _MTLHashState((int *)self->_data, 4 * (self->_size.height + self->_size.width));
}

- (id)description
{
  return [(MTLRasterizationRateLayerDescriptorInternal *)self formattedDescription:0];
}

- (id)formattedDescription:(unint64_t)a3
{
  v19[18] = *MEMORY[0x1E4F143B8];
  p_$E8CF8C4D35898297CF58D66FCEA3D064 size = &self->_size;
  v6 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:self->_size.width];
  long long v7 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:self->_size.height];
  data = self->_data;
  if (p_size->width)
  {
    uint64_t v10 = 0;
    unint64_t v11 = 0;
    do
    {
      *(float *)&double v8 = data[v11];
      objc_msgSend(v6, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v8), v11++);
      v10 += 4;
    }
    while (v11 < p_size->width);
    data = (float *)((char *)data + v10);
  }
  if (self->_size.height)
  {
    unint64_t v12 = 0;
    do
    {
      *(float *)&double v8 = data[v12];
      objc_msgSend(v7, "setObject:atIndexedSubscript:", objc_msgSend(NSNumber, "numberWithFloat:", v8), v12++);
    }
    while (v12 < self->_size.height);
  }
  uint64_t v13 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v14 = NSString;
  v18.receiver = self;
  v18.super_class = (Class)MTLRasterizationRateLayerDescriptorInternal;
  id v15 = [(MTLRasterizationRateLayerDescriptorInternal *)&v18 description];
  v19[0] = v13;
  v19[1] = @"sampleCount.width =";
  p_currentSampleCount = &self->_currentSampleCount;
  v19[2] = [NSNumber numberWithUnsignedInteger:p_currentSampleCount->width];
  v19[3] = v13;
  v19[4] = @"sampleCount.height =";
  v19[5] = [NSNumber numberWithUnsignedInteger:p_currentSampleCount->height];
  v19[6] = v13;
  v19[7] = @"maxSampleCount.width =";
  v19[8] = [NSNumber numberWithUnsignedInteger:p_size->width];
  v19[9] = v13;
  v19[10] = @"maxSampleCount.height =";
  v19[11] = [NSNumber numberWithUnsignedInteger:p_size->height];
  v19[12] = v13;
  v19[13] = @"horizontal =";
  v19[14] = [v6 componentsJoinedByString:@", "];
  v19[15] = v13;
  v19[16] = @"vertical =";
  v19[17] = [v7 componentsJoinedByString:@", "];
  return (id)[v14 stringWithFormat:@"%@%@", v15, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 18), "componentsJoinedByString:", @" "];
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)maxSampleCount
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)&self->var2;
  return self;
}

- (float)horizontalSampleStorage
{
  return self->_data;
}

- (float)verticalSampleStorage
{
  return &self->_data[self->_size.width];
}

- (id)horizontal
{
  return self->_horizontal;
}

- (id)vertical
{
  return self->_vertical;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sampleCount
{
  *($E8CF8C4D35898297CF58D66FCEA3D064 *)retstr = *($E8CF8C4D35898297CF58D66FCEA3D064 *)((char *)self + 40);
  return self;
}

- (void)setSampleCount:(id *)a3
{
  unint64_t var2 = a3->var2;
  *(_OWORD *)&self->_currentSampleCount.unint64_t width = *(_OWORD *)&a3->var0;
  self->_currentSampleCount.unint64_t depth = var2;
}

@end