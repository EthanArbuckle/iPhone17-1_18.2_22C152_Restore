@interface CIDynamicGuidedFilter
+ (BOOL)allowPartialOutputRegion;
+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6;
+ (BOOL)synchronizeInputs;
+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5;
+ (int)formatForInputAtIndex:(int)a3;
+ (int)outputFormat;
@end

@implementation CIDynamicGuidedFilter

+ (BOOL)processWithInputs:(id)a3 arguments:(id)a4 output:(id)a5 error:(id *)a6
{
  id v9 = [a5 metalCommandBuffer];
  id v10 = [v9 device];
  id v11 = [a3 objectAtIndexedSubscript:0];
  id v12 = [a3 objectAtIndexedSubscript:1];
  [v11 region];
  unint64_t v14 = (unint64_t)v13;
  [v11 region];
  unint64_t v16 = (unint64_t)v15;
  objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"guidedFilterEpsilon"), "floatValue");
  LOBYTE(v21) = 1;
  id v17 = objc_msgSend(objc_alloc((Class)MPSImageSpatioTemporalGuidedFilter), "initWithDevice:filterDescriptor:", v10, +[MPSImageSpatioTemporalGuidedFilterDescriptor filterDescriptorWithWidth:height:arrayLength:kernelSpatialDiameter:kernelTemporalDiameter:epsilon:sourceChannels:guideChannels:preallocateIntermediates:](MPSImageSpatioTemporalGuidedFilterDescriptor, "filterDescriptorWithWidth:height:arrayLength:kernelSpatialDiameter:kernelTemporalDiameter:epsilon:sourceChannels:guideChannels:preallocateIntermediates:", v14, v16, 1, 3, 1, 1, 3, v21));
  id v18 = objc_alloc_init((Class)NSMutableArray);
  id v19 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v18, "addObject:", objc_msgSend(v11, "metalTexture"));
  objc_msgSend(v19, "addObject:", objc_msgSend(a5, "metalTexture"));
  objc_msgSend(v17, "encodeToCommandBuffer:sourceTextureArray:guidanceTexture:constraintsTextureArray:numberOfIterations:destinationTextureArray:", v9, v18, objc_msgSend(v12, "metalTexture"), 0, 1, v19);

  return 1;
}

+ (BOOL)synchronizeInputs
{
  return 1;
}

+ (int)outputFormat
{
  return kCIFormatRh;
}

+ (int)formatForInputAtIndex:(int)a3
{
  if (a3)
  {
    if (a3 != 1) {
      sub_4BEE8();
    }
    v3 = &kCIFormatBGRA8;
  }
  else
  {
    v3 = &kCIFormatRh;
  }
  return *v3;
}

+ (CGRect)roiForInput:(int)a3 arguments:(id)a4 outputRect:(CGRect)a5
{
  if (!objc_msgSend(a4, "objectForKeyedSubscript:", @"imageExtents", a5.origin.x, a5.origin.y, a5.size.width, a5.size.height))sub_4BF14(); {
  if ((unint64_t)objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"imageExtents"), "count") <= a3)
  }
    sub_4BF40();
  id v7 = objc_msgSend(objc_msgSend(a4, "objectForKeyedSubscript:", @"imageExtents"), "objectAtIndexedSubscript:", a3);

  [v7 CGRectValue];
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

+ (BOOL)allowPartialOutputRegion
{
  return 0;
}

@end