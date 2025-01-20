@interface AABCHistograms
- (AABCHistograms)init;
- (CBHistogramBuilder)E;
- (CBHistogramBuilder)L;
- (CBHistogramBuilder)LDevice;
- (CBHistogramBuilder)LDeviceOff;
- (CBHistogramBuilder)LLPM;
- (CBHistogramBuilder)LOff;
- (void)dealloc;
- (void)submit;
@end

@implementation AABCHistograms

- (CBHistogramBuilder)L
{
  return self->_L;
}

- (CBHistogramBuilder)E
{
  return self->_E;
}

- (AABCHistograms)init
{
  v12 = self;
  SEL v11 = a2;
  v10.receiver = self;
  v10.super_class = (Class)AABCHistograms;
  v12 = [(AABCHistograms *)&v10 init];
  if (v12)
  {
    context = (void *)MEMORY[0x1BA9ECAE0]();
    v2 = [[CBHistogramBuilder alloc] initWithEdges:&unk_1F14181B8];
    v12->_L = v2;
    v3 = [[CBHistogramBuilder alloc] initWithEdges:&unk_1F14181B8];
    v12->_LOff = v3;
    v4 = [[CBHistogramBuilder alloc] initWithEdges:&unk_1F14181B8];
    v12->_LDevice = v4;
    v5 = [[CBHistogramBuilder alloc] initWithEdges:&unk_1F14181B8];
    v12->_LDeviceOff = v5;
    v6 = [[CBHistogramBuilder alloc] initWithEdges:&unk_1F14181B8];
    v12->_LLPM = v6;
    v7 = [[CBHistogramBuilder alloc] initWithEdges:&unk_1F14181D0];
    v12->_E = v7;
  }
  return v12;
}

- (void)submit
{
  v5[5] = *MEMORY[0x1E4F143B8];
  context = (void *)MEMORY[0x1BA9ECAE0]();
  v4[0] = @"standard";
  v5[0] = self->_L;
  v4[1] = @"off";
  v5[1] = self->_LOff;
  v4[2] = @"display2";
  v5[2] = self->_LDevice;
  v4[3] = @"display2.off";
  v5[3] = self->_LDeviceOff;
  v4[4] = @"LPM";
  v5[4] = self->_LLPM;
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjects:forKeys:count:", v5, v4, 5), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_507);
  +[CBAnalytics illuminanceHistogram:self->_E];
  [(CBHistogramBuilder *)self->_E reset];
}

uint64_t __24__AABCHistograms_submit__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 reset];
}

- (void)dealloc
{
  v4 = self;
  SEL v3 = a2;

  v2.receiver = v4;
  v2.super_class = (Class)AABCHistograms;
  [(AABCHistograms *)&v2 dealloc];
}

- (CBHistogramBuilder)LOff
{
  return self->_LOff;
}

- (CBHistogramBuilder)LDevice
{
  return self->_LDevice;
}

- (CBHistogramBuilder)LDeviceOff
{
  return self->_LDeviceOff;
}

- (CBHistogramBuilder)LLPM
{
  return self->_LLPM;
}

@end