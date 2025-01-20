@interface AGXG17FamilyRasterizationRateMap
- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)parameterBufferSizeAndAlign;
- ($94F468A8D4C62B317260615823C2B210)physicalCoordinate:(id)a3 forLayer:(unint64_t)a4;
- ($94F468A8D4C62B317260615823C2B210)screenCoordinate:(id)a3 forLayer:(unint64_t)a4;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalGranularity;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalSizeForLayer:(SEL)a3;
- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize;
- (AGXG17FamilyRasterizationRateMap)initWithDevice:(id)a3 descriptor:(id)a4;
- (MTLDevice)device;
- (const)getImpl;
- (unint64_t)layerCount;
- (void)copyParameterDataToBuffer:(id)a3 atOffset:(unint64_t)a4;
- (void)dealloc;
- (void)resetUsingDescriptor:(id)a3;
@end

@implementation AGXG17FamilyRasterizationRateMap

- ($94F468A8D4C62B317260615823C2B210)screenCoordinate:(id)a3 forLayer:(unint64_t)a4
{
  impl = self->_impl;
  unint64_t v5 = impl[4];
  LODWORD(v6) = v5 - 1;
  if (v5 <= a4) {
    uint64_t v6 = v6;
  }
  else {
    uint64_t v6 = a4;
  }
  uint64_t v7 = (uint64_t)&impl[1026 * v6 + 5];
  if (a3.var0 >= 0.0)
  {
    unsigned int v9 = impl[v6 + 6166];
    unsigned int v10 = (float)(a3.var0 * 0.03125);
    if (v9 <= v10) {
      uint64_t v8 = v9 - 1;
    }
    else {
      uint64_t v8 = v10;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  v11 = (float *)(v7 + 8 * v8);
  float v12 = *v11;
  float v13 = v11[1];
  if (a3.var1 >= 0.0)
  {
    unsigned int v15 = impl[6168];
    unsigned int v16 = (float)(a3.var1 * 0.03125);
    if (v15 <= v16) {
      uint64_t v14 = v15 - 1;
    }
    else {
      uint64_t v14 = v16;
    }
  }
  else
  {
    uint64_t v14 = 0;
  }
  float v17 = v12 * (float)(a3.var0 - v13);
  float v18 = *(float *)&impl[2 * v14 + 4109] * (float)(a3.var1 - *(float *)&impl[2 * v14 + 4110]);
  result.var1 = v18;
  result.var0 = v17;
  return result;
}

- ($94F468A8D4C62B317260615823C2B210)physicalCoordinate:(id)a3 forLayer:(unint64_t)a4
{
  AGX::WarpFunction<AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::getWarpedCoordinate();
  result.var1 = v5;
  result.var0 = v4;
  return result;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalSizeForLayer:(SEL)a3
{
  unint64_t var2 = self[2].var2;
  unint64_t v5 = *(unsigned int *)(var2 + 4 * a4 + 24644);
  unint64_t v6 = *(unsigned int *)(var2 + 24652);
  retstr->var0 = v5;
  retstr->var1 = v6;
  retstr->unint64_t var2 = 1;
  return self;
}

- (void)copyParameterDataToBuffer:(id)a3 atOffset:(unint64_t)a4
{
  unint64_t v5 = (void *)([a3 contents] + a4);
  unint64_t v6 = (char *)self->_impl + 20;

  memcpy(v5, v6, 0x6030uLL);
}

- (void)resetUsingDescriptor:(id)a3
{
  uint64_t v12 = 0;
  uint64_t v5 = [a3 layerPointer:&v12];
  uint64_t v8 = 0;
  uint64_t v10 = 0;
  if (a3) {
    objc_msgSend(a3, "screenSize", 0, 0, 0);
  }
  int v6 = objc_msgSend(a3, "skipSampleValidationAndApplySampleAtTileGranularity", v8, v10);
  int v7 = [a3 skipSampleValidationAndInterpolation];
  AGX::WarpFunction<AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::initFactors((_DWORD *)self->_impl, v5, v12, v9, v11, v7, v6);
}

- (AGXG17FamilyRasterizationRateMap)initWithDevice:(id)a3 descriptor:(id)a4
{
  v29.receiver = self;
  v29.super_class = (Class)AGXG17FamilyRasterizationRateMap;
  int v6 = -[_MTLRasterizationRateMap initWithDevice:descriptor:](&v29, sel_initWithDevice_descriptor_);
  if (v6)
  {
    uint64_t v28 = 0;
    uint64_t v7 = [a4 layerPointer:&v28];
    if (a4) {
      [a4 screenSize];
    }
    int v8 = objc_msgSend(a4, "skipSampleValidationAndApplySampleAtTileGranularity", 0, 0, 0);
    int v9 = [a4 skipSampleValidationAndInterpolation];
    uint64_t v10 = [a4 mutability];
    [a4 minFactor];
    float v12 = v11;
    float v13 = (char *)malloc_type_calloc(0x6120uLL, 1uLL, 0xD66272D0uLL);
    v6->_impl = v13;
    if (!v13) {
      goto LABEL_13;
    }
    uint64_t v14 = v13;
    bzero(v13 + 8, 0x6118uLL);
    *uint64_t v14 = &unk_26F853F20;
    impl = (char *)v6->_impl;
    int v16 = v28;
    impl[24744] = v10 == 1;
    *((void *)impl + 1) = a3;
    uint64_t v17 = v10 == 1 ? 49456 : 24832;
    AGX::Heap<true>::allocateImpl(&v30, *((void *)a3 + 101) + 5688, v17, (void *)impl + 3086);
    long long v18 = v31[0];
    *(_OWORD *)(impl + 24696) = v30;
    *(_OWORD *)(impl + 24712) = v18;
    *(_OWORD *)(impl + 24721) = *(_OWORD *)((char *)v31 + 9);
    if (*((void *)impl + 3090))
    {
      uint64_t v19 = *((void *)impl + 3088);
      uint64_t v20 = *((void *)impl + 3087);
      unint64_t v21 = (v19 + 255) & 0xFFFFFFFFFFFFFF00;
      unint64_t v22 = (v20 + 0x10000000FFLL) & 0xFFFFFFFFFFFFFF00;
      *((void *)impl + 3094) = v21;
      *((void *)impl + 3101) = v22;
      *((void *)impl + 3095) = v21 + 0x2000;
      *((void *)impl + 3096) = v21 + 12288;
      int64x2_t v23 = vdupq_n_s64(v22);
      *((int64x2_t *)impl + 1551) = vaddq_s64(v23, (int64x2_t)xmmword_242EA8830);
      *((void *)impl + 3098) = v21 + 0x4000;
      *((void *)impl + 3097) = v21 + 18432;
      *((int64x2_t *)impl + 1552) = vaddq_s64(v23, (int64x2_t)xmmword_242EA8840);
      *((void *)impl + 3099) = v21 + 22528;
      *((void *)impl + 3106) = v22 + 22528;
      if (impl[24744])
      {
        *((void *)impl + 3100) = v19 + 24832;
        *((void *)impl + 3107) = v20 + 0x1000006100;
        float v24 = 0.01;
        if (v12 != 0.0) {
          float v24 = v12;
        }
        *((_DWORD *)impl + 4) = v16;
        *((_DWORD *)impl + 6164) = v26;
        *((_DWORD *)impl + 6165) = v27;
        *((_DWORD *)impl + 6169) = (v26 + 31) >> 5;
        *((_DWORD *)impl + 6170) = (v27 + 31) >> 5;
        impl[24684] = (int)fmin(ceil(2.0 / v24), 255.0);
      }
      else
      {
        AGX::WarpFunction<AGX::HAL200::Classes,AGX::HAL200::ObjClasses>::initFactors(impl, v7, v16, v26, v27, v9, v8);
      }
    }
    else
    {
LABEL_13:

      return 0;
    }
  }
  return v6;
}

- ($7DEDF3842AEFB7F1E6DF5AF62E424A02)parameterBufferSizeAndAlign
{
  unint64_t v2 = 24624;
  unint64_t v3 = 4;
  result.var1 = v3;
  result.var0 = v2;
  return result;
}

- (unint64_t)layerCount
{
  return *((unsigned int *)self->_impl + 4);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)physicalGranularity
{
  *(int64x2_t *)&retstr->var0 = vdupq_n_s64(0x20uLL);
  retstr->unint64_t var2 = 1;
  return self;
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)screenSize
{
  uint64_t v3 = *(void *)(self[2].var2 + 24656);
  *(void *)&long long v4 = v3;
  *((void *)&v4 + 1) = HIDWORD(v3);
  *(_OWORD *)&retstr->var0 = v4;
  retstr->unint64_t var2 = 1;
  return self;
}

- (MTLDevice)device
{
  return (MTLDevice *)*((void *)self->_impl + 1);
}

- (const)getImpl
{
  return self->_impl;
}

- (void)dealloc
{
  impl = (void (***)(void *, SEL))self->_impl;
  if (impl)
  {
    (**impl)(impl, a2);
    free(self->_impl);
    self->_impl = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)AGXG17FamilyRasterizationRateMap;
  [(_MTLRasterizationRateMap *)&v4 dealloc];
}

@end