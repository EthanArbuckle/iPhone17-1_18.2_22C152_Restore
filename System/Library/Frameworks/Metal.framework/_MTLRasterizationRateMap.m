@interface _MTLRasterizationRateMap
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)parameterBufferSizeAndAlign;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalGranularity;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalSizeForLayer:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize;
- (MTLDevice)device;
- (NSString)description;
- (NSString)label;
- (_MTLRasterizationRateMap)init;
- (_MTLRasterizationRateMap)initWithDevice:(id)a3 descriptor:(id)a4;
- (float)minFactor;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)layerCount;
- (unint64_t)mutability;
- (void)dealloc;
@end

@implementation _MTLRasterizationRateMap

- (_MTLRasterizationRateMap)init
{
  return [(_MTLRasterizationRateMap *)self initWithDevice:0 descriptor:0];
}

- (_MTLRasterizationRateMap)initWithDevice:(id)a3 descriptor:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)_MTLRasterizationRateMap;
  v6 = [(_MTLRasterizationRateMap *)&v11 init];
  if (v6)
  {
    *((void *)v6 + 1) = a3;
    *((void *)v6 + 2) = (id)[a4 label];
    if (a4)
    {
      [a4 screenSize];
    }
    else
    {
      long long v9 = 0uLL;
      uint64_t v10 = 0;
    }
    *(_OWORD *)(v6 + 24) = v9;
    *((void *)v6 + 5) = v10;
    *((void *)v6 + 5) = [a4 layerCount];
    *((void *)v6 + 6) = [a4 mutability];
    [a4 minFactor];
    *((_DWORD *)v6 + 14) = v7;
  }
  return (_MTLRasterizationRateMap *)v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLRasterizationRateMap;
  [(_MTLRasterizationRateMap *)&v3 dealloc];
}

- (MTLDevice)device
{
  v2 = self->_device;

  return v2;
}

- (NSString)label
{
  return self->_label;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize
{
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var0;
  retstr->var2 = 0;
  return self;
}

- (unint64_t)mutability
{
  return self->_mutability;
}

- (float)minFactor
{
  return self->_minFactor;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalGranularity
{
  *(int64x2_t *)&retstr->var0 = vdupq_n_s64(0x20uLL);
  retstr->var2 = 0;
  return self;
}

- (unint64_t)layerCount
{
  return self->_dim.depth;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)parameterBufferSizeAndAlign
{
  unint64_t v2 = 0;
  unint64_t v3 = 1;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalSizeForLayer:(SEL)a3
{
  if (self) {
    return ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)[($F99D9A4FB75BC57F3386B8DC8EE08D7A *)self screenSize];
  }
  retstr->var0 = 0;
  retstr->var1 = 0;
  retstr->var2 = 0;
  return self;
}

- (NSString)description
{
  return (NSString *)[(_MTLRasterizationRateMap *)self formattedDescription:0];
}

- (id)formattedDescription:(unint64_t)a3
{
  v17[24] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v14 = 0;
  uint64_t v15 = 0;
  uint64_t v16 = 0;
  if (self) {
    [(_MTLRasterizationRateMap *)self physicalGranularity];
  }
  uint64_t v5 = [(_MTLRasterizationRateMap *)self parameterBufferSizeAndAlign];
  uint64_t v7 = v6;
  v8 = NSString;
  v13.receiver = self;
  v13.super_class = (Class)_MTLRasterizationRateMap;
  long long v9 = [(_MTLRasterizationRateMap *)&v13 description];
  v17[0] = v4;
  v17[1] = @"label =";
  label = (__CFString *)self->_label;
  unint64_t width = self->_dim.width;
  if (!label) {
    label = @"<none>";
  }
  v17[2] = label;
  v17[3] = v4;
  v17[4] = @"screenSize.width =";
  v17[5] = [NSNumber numberWithUnsignedInteger:width];
  v17[6] = v4;
  v17[7] = @"screenSize.height =";
  v17[8] = [NSNumber numberWithUnsignedInteger:self->_dim.height];
  v17[9] = v4;
  v17[10] = @"layerCount =";
  v17[11] = [NSNumber numberWithUnsignedInteger:self->_dim.depth];
  v17[12] = v4;
  v17[13] = @"physicalGranularity.width =";
  v17[14] = [NSNumber numberWithUnsignedInteger:v14];
  v17[15] = v4;
  v17[16] = @"physicalGranularity.height =";
  v17[17] = [NSNumber numberWithUnsignedInteger:v15];
  v17[18] = v4;
  v17[19] = @"parameterBuffer.size =";
  v17[20] = [NSNumber numberWithUnsignedInteger:v5];
  v17[21] = v4;
  v17[22] = @"parameterBuffer.align =";
  v17[23] = [NSNumber numberWithUnsignedInteger:v7];
  return (id)[v8 stringWithFormat:@"%@%@", v9, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 24), "componentsJoinedByString:", @" "];
}

@end