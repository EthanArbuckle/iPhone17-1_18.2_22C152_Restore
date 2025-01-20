@interface ADLKTTexturesDescriptor
- ($9F5C386A951B3C504AD39AFD20B040BC)opticalFlowConfig;
- (ADImageDescriptor)inputDescriptor;
- (ADImageDescriptor)shiftmapDescriptor;
- (CGSize)inputSizeForLayout:(unint64_t)a3;
- (NSArray)derivitivesDescriptors;
- (NSArray)featuresDescriptors;
- (NSArray)pyramidsDescriptors;
- (id).cxx_construct;
- (id)initForSupportedSizes:(id)a3 config:(id *)a4;
- (unint64_t)scales;
@end

@implementation ADLKTTexturesDescriptor

- (id).cxx_construct
{
  *((void *)self + 8) = 0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shiftmapDescriptor, 0);
  objc_storeStrong((id *)&self->_derivitivesDescriptors, 0);
  objc_storeStrong((id *)&self->_featuresDescriptors, 0);
  objc_storeStrong((id *)&self->_pyramidsDescriptors, 0);
  objc_storeStrong((id *)&self->_inputDescriptor, 0);
}

- ($9F5C386A951B3C504AD39AFD20B040BC)opticalFlowConfig
{
  nwarpings = self->_opticalFlowConfig.nwarpings;
  retstr->var0 = self->_opticalFlowConfig.scales;
  result = nwarpings;
  retstr->var1 = result;
  *(_OWORD *)&retstr->var2 = *(_OWORD *)&self->_opticalFlowConfig.useNonLocalRegularization;
  *(void *)&retstr->var6 = *(void *)&self->_opticalFlowConfig.nlreg_sigma_c;
  return result;
}

- (ADImageDescriptor)shiftmapDescriptor
{
  return self->_shiftmapDescriptor;
}

- (NSArray)derivitivesDescriptors
{
  return self->_derivitivesDescriptors;
}

- (NSArray)featuresDescriptors
{
  return self->_featuresDescriptors;
}

- (NSArray)pyramidsDescriptors
{
  return self->_pyramidsDescriptors;
}

- (ADImageDescriptor)inputDescriptor
{
  return self->_inputDescriptor;
}

- (unint64_t)scales
{
  return self->_scales;
}

- (CGSize)inputSizeForLayout:(unint64_t)a3
{
  [(ADImageDescriptor *)self->_inputDescriptor sizeForLayout:a3];
  result.height = v4;
  result.width = v3;
  return result;
}

- (id)initForSupportedSizes:(id)a3 config:(id *)a4
{
  id v6 = a3;
  v41.receiver = self;
  v41.super_class = (Class)ADLKTTexturesDescriptor;
  v7 = [(ADLKTTexturesDescriptor *)&v41 init];
  v8 = v7;
  if (v7)
  {
    id var1 = a4->var1;
    v7->_scales = a4->var0;
    v7->_opticalFlowConfig.scales = a4->var0;
    objc_storeStrong((id *)&v7->_opticalFlowConfig.nwarpings, var1);
    long long v10 = *(_OWORD *)&a4->var2;
    *(void *)&v8->_opticalFlowConfig.nlreg_sigma_c = *(void *)&a4->var6;
    *(_OWORD *)&v8->_opticalFlowConfig.useNonLocalRegularization = v10;
    uint64_t v11 = [MEMORY[0x263F26C70] descriptorForSupportedSizes:v6 pixelFormat:1111970369];
    inputDescriptor = v8->_inputDescriptor;
    v8->_inputDescriptor = (ADImageDescriptor *)v11;

    uint64_t v13 = [MEMORY[0x263F26C70] descriptorForSupportedSizes:v6 pixelFormat:843264104];
    shiftmapDescriptor = v8->_shiftmapDescriptor;
    v8->_shiftmapDescriptor = (ADImageDescriptor *)v13;

    v40 = [MEMORY[0x263EFF980] arrayWithCapacity:v8->_scales];
    v38 = a4;
    v39 = [MEMORY[0x263EFF980] arrayWithCapacity:v8->_scales];
    v15 = [MEMORY[0x263EFF980] arrayWithCapacity:v8->_scales];
    id v37 = v6;
    v16 = (void *)[v6 mutableCopy];
    if (v8->_scales)
    {
      uint64_t v17 = 0;
      unsigned int v18 = 0;
      do
      {
        v19 = [MEMORY[0x263F26C70] descriptorForSupportedSizes:v16 pixelFormat:1380401729];
        [(NSArray *)v15 setObject:v19 atIndexedSubscript:v17];

        v20 = [MEMORY[0x263F26C70] descriptorForSupportedSizes:v16 pixelFormat:843264104];
        [(NSArray *)v40 setObject:v20 atIndexedSubscript:v17];

        v21 = [MEMORY[0x263F26C70] descriptorForSupportedSizes:v16 pixelFormat:1380411457];
        [(NSArray *)v39 setObject:v21 atIndexedSubscript:v17];

        for (unsigned int i = 0; [v16 count] > (unint64_t)i; ++i)
        {
          v23 = [v16 objectAtIndexedSubscript:i];
          [v23 size];
          +[ADLKTOpticalFlow getNextPyramidLevelSize:](ADLKTOpticalFlow, "getNextPyramidLevelSize:");
          double v25 = v24;
          double v27 = v26;

          v28 = (void *)MEMORY[0x263F26C78];
          v29 = [v16 objectAtIndexedSubscript:i];
          v30 = objc_msgSend(v28, "createWithSize:andLayout:", objc_msgSend(v29, "layout"), v25, v27);
          [v16 setObject:v30 atIndexedSubscript:i];
        }
        uint64_t v17 = ++v18;
      }
      while (v8->_scales > v18);
    }
    featuresDescriptors = v8->_featuresDescriptors;
    v8->_featuresDescriptors = v40;
    v32 = v40;

    derivitivesDescriptors = v8->_derivitivesDescriptors;
    v8->_derivitivesDescriptors = v39;
    v34 = v39;

    pyramidsDescriptors = v8->_pyramidsDescriptors;
    v8->_pyramidsDescriptors = v15;

    id v6 = v37;
    a4 = v38;
  }

  return v8;
}

@end