@interface MLCConvolutionDescriptor
+ (MLCConvolutionDescriptor)convolutionTransposeDescriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount groupCount:(NSUInteger)groupCount strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes;
+ (MLCConvolutionDescriptor)convolutionTransposeDescriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes;
+ (MLCConvolutionDescriptor)convolutionTransposeDescriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount;
+ (MLCConvolutionDescriptor)depthwiseConvolutionDescriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount channelMultiplier:(NSUInteger)channelMultiplier strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes;
+ (MLCConvolutionDescriptor)depthwiseConvolutionDescriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount channelMultiplier:(NSUInteger)channelMultiplier strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes;
+ (MLCConvolutionDescriptor)depthwiseConvolutionDescriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount channelMultiplier:(NSUInteger)channelMultiplier;
+ (MLCConvolutionDescriptor)descriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount groupCount:(NSUInteger)groupCount strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes;
+ (MLCConvolutionDescriptor)descriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes;
+ (MLCConvolutionDescriptor)descriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount;
+ (MLCConvolutionDescriptor)descriptorWithType:(MLCConvolutionType)convolutionType kernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount groupCount:(NSUInteger)groupCount strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes;
- (BOOL)isConvolutionTranspose;
- (BOOL)isEqual:(id)a3;
- (BOOL)usesDepthwiseConvolution;
- (MLCConvolutionDescriptor)init;
- (MLCConvolutionDescriptor)initWithType:(int)a3 kernelWidth:(unint64_t)a4 kernelHeight:(unint64_t)a5 inputFeatureChannelCount:(unint64_t)a6 outputFeatureChannelCount:(unint64_t)a7 groupCount:(unint64_t)a8 strideInX:(unint64_t)a9 strideInY:(unint64_t)a10 dilationRateInX:(unint64_t)a11 dilationRateInY:(unint64_t)a12 paddingPolicy:(int)a13 paddingSizeInX:(unint64_t)a14 paddingSizeInY:(unint64_t)a15;
- (MLCConvolutionType)convolutionType;
- (MLCPaddingPolicy)paddingPolicy;
- (NSUInteger)dilationRateInX;
- (NSUInteger)dilationRateInY;
- (NSUInteger)groupCount;
- (NSUInteger)inputFeatureChannelCount;
- (NSUInteger)kernelHeight;
- (NSUInteger)kernelWidth;
- (NSUInteger)outputFeatureChannelCount;
- (NSUInteger)paddingSizeInX;
- (NSUInteger)paddingSizeInY;
- (NSUInteger)strideInX;
- (NSUInteger)strideInY;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)setPaddingPolicy:(int)a3;
- (void)setPaddingSizeInX:(unint64_t)a3;
- (void)setPaddingSizeInY:(unint64_t)a3;
@end

@implementation MLCConvolutionDescriptor

- (MLCConvolutionDescriptor)init
{
  LODWORD(v3) = 0;
  return [(MLCConvolutionDescriptor *)self initWithType:0 kernelWidth:1 kernelHeight:1 inputFeatureChannelCount:1 outputFeatureChannelCount:1 groupCount:1 strideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 paddingPolicy:v3 paddingSizeInX:0 paddingSizeInY:0];
}

+ (MLCConvolutionDescriptor)descriptorWithType:(MLCConvolutionType)convolutionType kernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount groupCount:(NSUInteger)groupCount strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  v15 = paddingSizes;
  v16 = dilationRates;
  v17 = strides;
  v18 = kernelSizes;
  id v44 = objc_alloc((Class)a1);
  v19 = [(NSArray *)v18 objectAtIndexedSubscript:1];
  uint64_t v42 = [v19 unsignedIntegerValue];
  v20 = [(NSArray *)v18 objectAtIndexedSubscript:0];

  uint64_t v41 = [v20 unsignedIntegerValue];
  v21 = [(NSArray *)v17 objectAtIndexedSubscript:1];
  uint64_t v39 = [v21 unsignedIntegerValue];
  v22 = [(NSArray *)v17 objectAtIndexedSubscript:0];

  v43 = v22;
  uint64_t v23 = [v22 unsignedIntegerValue];
  v40 = [(NSArray *)v16 objectAtIndexedSubscript:1];
  uint64_t v24 = [v40 unsignedIntegerValue];
  v25 = [(NSArray *)v16 objectAtIndexedSubscript:0];

  uint64_t v26 = [v25 unsignedIntegerValue];
  uint64_t v27 = v26;
  if (v15)
  {
    [(NSArray *)v15 objectAtIndexedSubscript:1];
    v28 = v37 = v19;
    v29 = v21;
    uint64_t v30 = [v28 unsignedIntegerValue];
    [(NSArray *)v15 objectAtIndexedSubscript:0];
    v31 = v36 = v15;
    uint64_t v35 = v30;
    v21 = v29;
    LODWORD(v34) = paddingPolicy;
    v32 = objc_msgSend(v44, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", convolutionType, v42, v41, inputFeatureChannelCount, outputFeatureChannelCount, groupCount, v39, v23, v24, v27, v34, v35, objc_msgSend(v31, "unsignedIntegerValue"));

    v15 = v36;
    v19 = v37;
  }
  else
  {
    LODWORD(v34) = paddingPolicy;
    v32 = (void *)[v44 initWithType:convolutionType kernelWidth:v42 kernelHeight:v41 inputFeatureChannelCount:inputFeatureChannelCount outputFeatureChannelCount:outputFeatureChannelCount groupCount:groupCount strideInX:v39 strideInY:v23 dilationRateInX:v24 dilationRateInY:v26 paddingPolicy:v34 paddingSizeInX:0 paddingSizeInY:0];
  }

  return (MLCConvolutionDescriptor *)v32;
}

+ (MLCConvolutionDescriptor)descriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount
{
  LODWORD(v8) = 0;
  v6 = (void *)[objc_alloc((Class)a1) initWithType:0 kernelWidth:kernelWidth kernelHeight:kernelHeight inputFeatureChannelCount:inputFeatureChannelCount outputFeatureChannelCount:outputFeatureChannelCount groupCount:1 strideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 paddingPolicy:v8 paddingSizeInX:0 paddingSizeInY:0];

  return (MLCConvolutionDescriptor *)v6;
}

+ (MLCConvolutionDescriptor)descriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  v14 = paddingSizes;
  v15 = strides;
  v16 = kernelSizes;
  id v17 = objc_alloc((Class)a1);
  v18 = [(NSArray *)v16 objectAtIndexedSubscript:1];
  uint64_t v40 = [v18 unsignedIntegerValue];
  v19 = [(NSArray *)v16 objectAtIndexedSubscript:0];

  uint64_t v38 = [v19 unsignedIntegerValue];
  v20 = [(NSArray *)v15 objectAtIndexedSubscript:1];
  uint64_t v37 = [v20 unsignedIntegerValue];
  v21 = [(NSArray *)v15 objectAtIndexedSubscript:0];

  uint64_t v39 = v21;
  uint64_t v22 = [v21 unsignedIntegerValue];
  uint64_t v23 = v22;
  if (v14)
  {
    [(NSArray *)v14 objectAtIndexedSubscript:1];
    v25 = MLCPaddingPolicy v24 = paddingPolicy;
    uint64_t v35 = v17;
    uint64_t v26 = v20;
    uint64_t v27 = [v25 unsignedIntegerValue];
    [(NSArray *)v14 objectAtIndexedSubscript:0];
    v36 = v19;
    v28 = v14;
    uint64_t v30 = v29 = v18;
    uint64_t v34 = v27;
    v20 = v26;
    LODWORD(v33) = v24;
    v31 = objc_msgSend(v35, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 0, v40, v38, inputFeatureChannelCount, outputFeatureChannelCount, 1, v37, v23, 1, 1, v33, v34, objc_msgSend(v30, "unsignedIntegerValue"));

    v18 = v29;
    v14 = v28;
    v19 = v36;
  }
  else
  {
    LODWORD(v33) = paddingPolicy;
    v31 = (void *)[v17 initWithType:0 kernelWidth:v40 kernelHeight:v38 inputFeatureChannelCount:inputFeatureChannelCount outputFeatureChannelCount:outputFeatureChannelCount groupCount:1 strideInX:v37 strideInY:v22 dilationRateInX:1 dilationRateInY:1 paddingPolicy:v33 paddingSizeInX:0 paddingSizeInY:0];
  }

  return (MLCConvolutionDescriptor *)v31;
}

+ (MLCConvolutionDescriptor)descriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount groupCount:(NSUInteger)groupCount strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  id v17 = paddingSizes;
  v18 = dilationRates;
  v19 = strides;
  v20 = kernelSizes;
  id v43 = objc_alloc((Class)a1);
  v21 = [(NSArray *)v20 objectAtIndexedSubscript:1];
  uint64_t v41 = [v21 unsignedIntegerValue];
  uint64_t v22 = [(NSArray *)v20 objectAtIndexedSubscript:0];

  uint64_t v40 = [v22 unsignedIntegerValue];
  id v44 = [(NSArray *)v19 objectAtIndexedSubscript:1];
  uint64_t v38 = [v44 unsignedIntegerValue];
  uint64_t v23 = [(NSArray *)v19 objectAtIndexedSubscript:0];

  uint64_t v42 = v23;
  uint64_t v24 = [v23 unsignedIntegerValue];
  uint64_t v39 = [(NSArray *)v18 objectAtIndexedSubscript:1];
  uint64_t v25 = [v39 unsignedIntegerValue];
  uint64_t v26 = [(NSArray *)v18 objectAtIndexedSubscript:0];

  uint64_t v27 = [v26 unsignedIntegerValue];
  uint64_t v28 = v27;
  if (v17)
  {
    [(NSArray *)v17 objectAtIndexedSubscript:1];
    v29 = uint64_t v37 = v21;
    NSUInteger v35 = inputFeatureChannelCount;
    uint64_t v30 = [v29 unsignedIntegerValue];
    [(NSArray *)v17 objectAtIndexedSubscript:0];
    v31 = v36 = v17;
    LODWORD(v34) = paddingPolicy;
    v32 = objc_msgSend(v43, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 0, v41, v40, v35, outputFeatureChannelCount, groupCount, v38, v24, v25, v28, v34, v30, objc_msgSend(v31, "unsignedIntegerValue"));

    id v17 = v36;
    v21 = v37;
  }
  else
  {
    LODWORD(v34) = paddingPolicy;
    v32 = (void *)[v43 initWithType:0 kernelWidth:v41 kernelHeight:v40 inputFeatureChannelCount:inputFeatureChannelCount outputFeatureChannelCount:outputFeatureChannelCount groupCount:groupCount strideInX:v38 strideInY:v24 dilationRateInX:v25 dilationRateInY:v27 paddingPolicy:v34 paddingSizeInX:0 paddingSizeInY:0];
  }

  return (MLCConvolutionDescriptor *)v32;
}

+ (MLCConvolutionDescriptor)convolutionTransposeDescriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount
{
  LODWORD(v8) = 0;
  v6 = (void *)[objc_alloc((Class)a1) initWithType:1 kernelWidth:kernelWidth kernelHeight:kernelHeight inputFeatureChannelCount:inputFeatureChannelCount outputFeatureChannelCount:outputFeatureChannelCount groupCount:1 strideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 paddingPolicy:v8 paddingSizeInX:0 paddingSizeInY:0];

  return (MLCConvolutionDescriptor *)v6;
}

+ (MLCConvolutionDescriptor)convolutionTransposeDescriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  v14 = paddingSizes;
  v15 = strides;
  v16 = kernelSizes;
  id v17 = objc_alloc((Class)a1);
  v18 = [(NSArray *)v16 objectAtIndexedSubscript:1];
  uint64_t v40 = [v18 unsignedIntegerValue];
  v19 = [(NSArray *)v16 objectAtIndexedSubscript:0];

  uint64_t v38 = [v19 unsignedIntegerValue];
  v20 = [(NSArray *)v15 objectAtIndexedSubscript:1];
  uint64_t v37 = [v20 unsignedIntegerValue];
  v21 = [(NSArray *)v15 objectAtIndexedSubscript:0];

  uint64_t v39 = v21;
  uint64_t v22 = [v21 unsignedIntegerValue];
  uint64_t v23 = v22;
  if (v14)
  {
    [(NSArray *)v14 objectAtIndexedSubscript:1];
    v25 = MLCPaddingPolicy v24 = paddingPolicy;
    NSUInteger v35 = v17;
    uint64_t v26 = v20;
    uint64_t v27 = [v25 unsignedIntegerValue];
    [(NSArray *)v14 objectAtIndexedSubscript:0];
    v36 = v19;
    uint64_t v28 = v14;
    uint64_t v30 = v29 = v18;
    uint64_t v34 = v27;
    v20 = v26;
    LODWORD(v33) = v24;
    v31 = objc_msgSend(v35, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 1, v40, v38, inputFeatureChannelCount, outputFeatureChannelCount, 1, v37, v23, 1, 1, v33, v34, objc_msgSend(v30, "unsignedIntegerValue"));

    v18 = v29;
    v14 = v28;
    v19 = v36;
  }
  else
  {
    LODWORD(v33) = paddingPolicy;
    v31 = (void *)[v17 initWithType:1 kernelWidth:v40 kernelHeight:v38 inputFeatureChannelCount:inputFeatureChannelCount outputFeatureChannelCount:outputFeatureChannelCount groupCount:1 strideInX:v37 strideInY:v22 dilationRateInX:1 dilationRateInY:1 paddingPolicy:v33 paddingSizeInX:0 paddingSizeInY:0];
  }

  return (MLCConvolutionDescriptor *)v31;
}

+ (MLCConvolutionDescriptor)convolutionTransposeDescriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount outputFeatureChannelCount:(NSUInteger)outputFeatureChannelCount groupCount:(NSUInteger)groupCount strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  id v17 = paddingSizes;
  v18 = dilationRates;
  v19 = strides;
  v20 = kernelSizes;
  id v43 = objc_alloc((Class)a1);
  v21 = [(NSArray *)v20 objectAtIndexedSubscript:1];
  uint64_t v41 = [v21 unsignedIntegerValue];
  uint64_t v22 = [(NSArray *)v20 objectAtIndexedSubscript:0];

  uint64_t v40 = [v22 unsignedIntegerValue];
  id v44 = [(NSArray *)v19 objectAtIndexedSubscript:1];
  uint64_t v38 = [v44 unsignedIntegerValue];
  uint64_t v23 = [(NSArray *)v19 objectAtIndexedSubscript:0];

  uint64_t v42 = v23;
  uint64_t v24 = [v23 unsignedIntegerValue];
  uint64_t v39 = [(NSArray *)v18 objectAtIndexedSubscript:1];
  uint64_t v25 = [v39 unsignedIntegerValue];
  uint64_t v26 = [(NSArray *)v18 objectAtIndexedSubscript:0];

  uint64_t v27 = [v26 unsignedIntegerValue];
  uint64_t v28 = v27;
  if (v17)
  {
    [(NSArray *)v17 objectAtIndexedSubscript:1];
    v29 = uint64_t v37 = v21;
    NSUInteger v35 = inputFeatureChannelCount;
    uint64_t v30 = [v29 unsignedIntegerValue];
    [(NSArray *)v17 objectAtIndexedSubscript:0];
    v31 = v36 = v17;
    LODWORD(v34) = paddingPolicy;
    v32 = objc_msgSend(v43, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 1, v41, v40, v35, outputFeatureChannelCount, groupCount, v38, v24, v25, v28, v34, v30, objc_msgSend(v31, "unsignedIntegerValue"));

    id v17 = v36;
    v21 = v37;
  }
  else
  {
    LODWORD(v34) = paddingPolicy;
    v32 = (void *)[v43 initWithType:1 kernelWidth:v41 kernelHeight:v40 inputFeatureChannelCount:inputFeatureChannelCount outputFeatureChannelCount:outputFeatureChannelCount groupCount:groupCount strideInX:v38 strideInY:v24 dilationRateInX:v25 dilationRateInY:v27 paddingPolicy:v34 paddingSizeInX:0 paddingSizeInY:0];
  }

  return (MLCConvolutionDescriptor *)v32;
}

+ (MLCConvolutionDescriptor)depthwiseConvolutionDescriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount channelMultiplier:(NSUInteger)channelMultiplier
{
  LODWORD(v8) = 0;
  v6 = (void *)[objc_alloc((Class)a1) initWithType:2 kernelWidth:kernelWidth kernelHeight:kernelHeight inputFeatureChannelCount:inputFeatureChannelCount outputFeatureChannelCount:channelMultiplier * inputFeatureChannelCount groupCount:1 strideInX:1 strideInY:1 dilationRateInX:1 dilationRateInY:1 paddingPolicy:v8 paddingSizeInX:0 paddingSizeInY:0];

  return (MLCConvolutionDescriptor *)v6;
}

+ (MLCConvolutionDescriptor)depthwiseConvolutionDescriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount channelMultiplier:(NSUInteger)channelMultiplier strides:(NSArray *)strides paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  v14 = paddingSizes;
  v15 = strides;
  v16 = kernelSizes;
  id v17 = objc_alloc((Class)a1);
  v18 = [(NSArray *)v16 objectAtIndexedSubscript:1];
  uint64_t v44 = [v18 unsignedIntegerValue];
  v19 = [(NSArray *)v16 objectAtIndexedSubscript:0];

  uint64_t v43 = [v19 unsignedIntegerValue];
  NSUInteger v20 = channelMultiplier * inputFeatureChannelCount;
  v21 = [(NSArray *)v15 objectAtIndexedSubscript:1];
  uint64_t v42 = [v21 unsignedIntegerValue];
  uint64_t v22 = [(NSArray *)v15 objectAtIndexedSubscript:0];

  uint64_t v23 = [v22 unsignedIntegerValue];
  uint64_t v24 = v23;
  if (v14)
  {
    [(NSArray *)v14 objectAtIndexedSubscript:1];
    v25 = uint64_t v41 = v18;
    uint64_t v40 = v21;
    uint64_t v26 = v19;
    NSUInteger v27 = inputFeatureChannelCount;
    MLCPaddingPolicy v28 = paddingPolicy;
    uint64_t v29 = [v25 unsignedIntegerValue];
    [(NSArray *)v14 objectAtIndexedSubscript:0];
    uint64_t v39 = v22;
    NSUInteger v30 = v20;
    v32 = v31 = v17;
    uint64_t v33 = [v32 unsignedIntegerValue];
    LODWORD(v38) = v28;
    NSUInteger v34 = v27;
    v19 = v26;
    NSUInteger v35 = v30;
    uint64_t v22 = v39;
    v21 = v40;
    v36 = (void *)[v31 initWithType:2 kernelWidth:v44 kernelHeight:v43 inputFeatureChannelCount:v34 outputFeatureChannelCount:v35 groupCount:1 strideInX:v42 strideInY:v24 dilationRateInX:1 dilationRateInY:1 paddingPolicy:v38 paddingSizeInX:v29 paddingSizeInY:v33];

    v18 = v41;
  }
  else
  {
    LODWORD(v38) = paddingPolicy;
    v36 = (void *)[v17 initWithType:2 kernelWidth:v44 kernelHeight:v43 inputFeatureChannelCount:inputFeatureChannelCount outputFeatureChannelCount:v20 groupCount:1 strideInX:v42 strideInY:v23 dilationRateInX:1 dilationRateInY:1 paddingPolicy:v38 paddingSizeInX:0 paddingSizeInY:0];
  }

  return (MLCConvolutionDescriptor *)v36;
}

+ (MLCConvolutionDescriptor)depthwiseConvolutionDescriptorWithKernelSizes:(NSArray *)kernelSizes inputFeatureChannelCount:(NSUInteger)inputFeatureChannelCount channelMultiplier:(NSUInteger)channelMultiplier strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingPolicy:(MLCPaddingPolicy)paddingPolicy paddingSizes:(NSArray *)paddingSizes
{
  v15 = paddingSizes;
  v16 = dilationRates;
  id v17 = strides;
  v18 = kernelSizes;
  id v44 = objc_alloc((Class)a1);
  v19 = [(NSArray *)v18 objectAtIndexedSubscript:1];
  uint64_t v42 = [v19 unsignedIntegerValue];
  NSUInteger v20 = [(NSArray *)v18 objectAtIndexedSubscript:0];

  uint64_t v40 = [v20 unsignedIntegerValue];
  NSUInteger v46 = inputFeatureChannelCount;
  NSUInteger v41 = channelMultiplier * inputFeatureChannelCount;
  v21 = [(NSArray *)v17 objectAtIndexedSubscript:1];
  uint64_t v39 = [v21 unsignedIntegerValue];
  uint64_t v22 = [(NSArray *)v17 objectAtIndexedSubscript:0];

  uint64_t v43 = v22;
  uint64_t v23 = [v22 unsignedIntegerValue];
  uint64_t v24 = [(NSArray *)v16 objectAtIndexedSubscript:1];
  uint64_t v25 = [v24 unsignedIntegerValue];
  uint64_t v26 = [(NSArray *)v16 objectAtIndexedSubscript:0];

  uint64_t v27 = [v26 unsignedIntegerValue];
  uint64_t v28 = v27;
  if (v15)
  {
    [(NSArray *)v15 objectAtIndexedSubscript:1];
    v29 = uint64_t v38 = v19;
    uint64_t v30 = [v29 unsignedIntegerValue];
    [(NSArray *)v15 objectAtIndexedSubscript:0];
    uint64_t v37 = v24;
    v31 = v21;
    uint64_t v33 = v32 = v20;
    LODWORD(v36) = paddingPolicy;
    NSUInteger v34 = objc_msgSend(v44, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", 2, v42, v40, v46, v41, 1, v39, v23, v25, v28, v36, v30, objc_msgSend(v33, "unsignedIntegerValue"));

    NSUInteger v20 = v32;
    v21 = v31;
    uint64_t v24 = v37;

    v19 = v38;
  }
  else
  {
    LODWORD(v36) = paddingPolicy;
    NSUInteger v34 = (void *)[v44 initWithType:2 kernelWidth:v42 kernelHeight:v40 inputFeatureChannelCount:v46 outputFeatureChannelCount:v41 groupCount:1 strideInX:v39 strideInY:v23 dilationRateInX:v25 dilationRateInY:v27 paddingPolicy:v36 paddingSizeInX:0 paddingSizeInY:0];
  }

  return (MLCConvolutionDescriptor *)v34;
}

- (MLCConvolutionDescriptor)initWithType:(int)a3 kernelWidth:(unint64_t)a4 kernelHeight:(unint64_t)a5 inputFeatureChannelCount:(unint64_t)a6 outputFeatureChannelCount:(unint64_t)a7 groupCount:(unint64_t)a8 strideInX:(unint64_t)a9 strideInY:(unint64_t)a10 dilationRateInX:(unint64_t)a11 dilationRateInY:(unint64_t)a12 paddingPolicy:(int)a13 paddingSizeInX:(unint64_t)a14 paddingSizeInY:(unint64_t)a15
{
  v22.receiver = self;
  v22.super_class = (Class)MLCConvolutionDescriptor;
  result = [(MLCConvolutionDescriptor *)&v22 init];
  if (result)
  {
    result->_kernelWidth = a4;
    result->_kernelHeight = a5;
    result->_inputFeatureChannelCount = a6;
    result->_outputFeatureChannelCount = a7;
    result->_strideInX = a9;
    result->_strideInY = a10;
    result->_dilationRateInX = a11;
    result->_dilationRateInY = a12;
    result->_convolutionType = a3;
    result->_paddingPolicy = a13;
    result->_groupCount = a8;
    result->_paddingSizeInX = a14;
    result->_paddingSizeInY = a15;
  }
  return result;
}

- (BOOL)usesDepthwiseConvolution
{
  return [(MLCConvolutionDescriptor *)self convolutionType] == MLCConvolutionTypeDepthwise;
}

- (BOOL)isConvolutionTranspose
{
  return [(MLCConvolutionDescriptor *)self convolutionType] == MLCConvolutionTypeTransposed;
}

- (id)description
{
  v7 = NSString;
  uint64_t v3 = (objc_class *)objc_opt_class();
  v4 = NSStringFromClass(v3);
  v5 = [v7 stringWithFormat:@"%@: { kernelWidth=%lu : kernelHeight=%lu : inputFeatureChannelCount=%lu : outputFeatureChannelCount=%lu : groupCount = %lu : usesDepthWiseConvolution = %lu : strideInX=%lu : strideInY=%lu : dilationRateInX=%lu :  dilationRateInY=%lu : paddingPolicy=%d : paddingSizeInX=%lu : paddingSizeInY = %lu}", v4, -[MLCConvolutionDescriptor kernelWidth](self, "kernelWidth"), -[MLCConvolutionDescriptor kernelHeight](self, "kernelHeight"), -[MLCConvolutionDescriptor inputFeatureChannelCount](self, "inputFeatureChannelCount"), -[MLCConvolutionDescriptor outputFeatureChannelCount](self, "outputFeatureChannelCount"), -[MLCConvolutionDescriptor groupCount](self, "groupCount"), -[MLCConvolutionDescriptor usesDepthwiseConvolution](self, "usesDepthwiseConvolution"), -[MLCConvolutionDescriptor strideInX](self, "strideInX"), -[MLCConvolutionDescriptor strideInY](self, "strideInY"), -[MLCConvolutionDescriptor dilationRateInX](self, "dilationRateInX"), -[MLCConvolutionDescriptor dilationRateInY](self, "dilationRateInY"), -[MLCConvolutionDescriptor paddingPolicy](self, "paddingPolicy"), -[MLCConvolutionDescriptor paddingSizeInX](self, "paddingSizeInX"), -[MLCConvolutionDescriptor paddingSizeInY](self, "paddingSizeInY")];

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    uint64_t v6 = [v5 kernelWidth];
    if (v6 != [(MLCConvolutionDescriptor *)self kernelWidth]) {
      goto LABEL_15;
    }
    uint64_t v7 = [v5 kernelHeight];
    if (v7 != [(MLCConvolutionDescriptor *)self kernelHeight]) {
      goto LABEL_15;
    }
    uint64_t v8 = [v5 inputFeatureChannelCount];
    if (v8 != [(MLCConvolutionDescriptor *)self inputFeatureChannelCount]) {
      goto LABEL_15;
    }
    uint64_t v9 = [v5 outputFeatureChannelCount];
    if (v9 != [(MLCConvolutionDescriptor *)self outputFeatureChannelCount]) {
      goto LABEL_15;
    }
    uint64_t v10 = [v5 strideInX];
    if (v10 != [(MLCConvolutionDescriptor *)self strideInX]) {
      goto LABEL_15;
    }
    uint64_t v11 = [v5 strideInY];
    if (v11 != [(MLCConvolutionDescriptor *)self strideInY]) {
      goto LABEL_15;
    }
    uint64_t v12 = [v5 dilationRateInX];
    if (v12 == [(MLCConvolutionDescriptor *)self dilationRateInX]
      && (uint64_t v13 = [v5 dilationRateInY],
          v13 == [(MLCConvolutionDescriptor *)self dilationRateInY])
      && (uint64_t v14 = [v5 groupCount], v14 == -[MLCConvolutionDescriptor groupCount](self, "groupCount"))
      && (int v15 = [v5 paddingPolicy],
          v15 == [(MLCConvolutionDescriptor *)self paddingPolicy])
      && (uint64_t v16 = [v5 paddingSizeInX],
          v16 == [(MLCConvolutionDescriptor *)self paddingSizeInX])
      && (uint64_t v17 = [v5 paddingSizeInY],
          v17 == [(MLCConvolutionDescriptor *)self paddingSizeInY])
      && (int v18 = [v5 isConvolutionTranspose],
          v18 == [(MLCConvolutionDescriptor *)self isConvolutionTranspose]))
    {
      int v21 = [v5 usesDepthwiseConvolution];
      int v19 = v21 ^ [(MLCConvolutionDescriptor *)self usesDepthwiseConvolution] ^ 1;
    }
    else
    {
LABEL_15:
      LOBYTE(v19) = 0;
    }
  }
  else
  {
    LOBYTE(v19) = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  unint64_t v12 = 0;
  char v11 = [(MLCConvolutionDescriptor *)self kernelWidth];
  [(MLCConvolutionDescriptor *)self kernelHeight];
  [(MLCConvolutionDescriptor *)self inputFeatureChannelCount];
  [(MLCConvolutionDescriptor *)self outputFeatureChannelCount];
  [(MLCConvolutionDescriptor *)self strideInX];
  [(MLCConvolutionDescriptor *)self strideInY];
  [(MLCConvolutionDescriptor *)self dilationRateInX];
  [(MLCConvolutionDescriptor *)self dilationRateInY];
  [(MLCConvolutionDescriptor *)self groupCount];
  [(MLCConvolutionDescriptor *)self paddingPolicy];
  [(MLCConvolutionDescriptor *)self paddingSizeInX];
  [(MLCConvolutionDescriptor *)self paddingSizeInY];
  [(MLCConvolutionDescriptor *)self isConvolutionTranspose];
  [(MLCConvolutionDescriptor *)self usesDepthwiseConvolution];
  hashCombine_8(&v12, v3, v4, v5, v6, v7, v8, v9, v11);
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v16 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  MLCConvolutionType v15 = [(MLCConvolutionDescriptor *)self convolutionType];
  NSUInteger v14 = [(MLCConvolutionDescriptor *)self kernelWidth];
  NSUInteger v13 = [(MLCConvolutionDescriptor *)self kernelHeight];
  NSUInteger v4 = [(MLCConvolutionDescriptor *)self inputFeatureChannelCount];
  NSUInteger v5 = [(MLCConvolutionDescriptor *)self outputFeatureChannelCount];
  NSUInteger v6 = [(MLCConvolutionDescriptor *)self groupCount];
  NSUInteger v7 = [(MLCConvolutionDescriptor *)self strideInX];
  NSUInteger v8 = [(MLCConvolutionDescriptor *)self strideInY];
  NSUInteger v9 = [(MLCConvolutionDescriptor *)self dilationRateInX];
  NSUInteger v10 = [(MLCConvolutionDescriptor *)self dilationRateInY];
  LODWORD(v12) = [(MLCConvolutionDescriptor *)self paddingPolicy];
  return (id)objc_msgSend(v16, "initWithType:kernelWidth:kernelHeight:inputFeatureChannelCount:outputFeatureChannelCount:groupCount:strideInX:strideInY:dilationRateInX:dilationRateInY:paddingPolicy:paddingSizeInX:paddingSizeInY:", v15, v14, v13, v4, v5, v6, v7, v8, v9, v10, v12, -[MLCConvolutionDescriptor paddingSizeInX](self, "paddingSizeInX"), -[MLCConvolutionDescriptor paddingSizeInY](self, "paddingSizeInY"));
}

- (MLCConvolutionType)convolutionType
{
  return self->_convolutionType;
}

- (NSUInteger)kernelWidth
{
  return self->_kernelWidth;
}

- (NSUInteger)kernelHeight
{
  return self->_kernelHeight;
}

- (NSUInteger)inputFeatureChannelCount
{
  return self->_inputFeatureChannelCount;
}

- (NSUInteger)outputFeatureChannelCount
{
  return self->_outputFeatureChannelCount;
}

- (NSUInteger)strideInX
{
  return self->_strideInX;
}

- (NSUInteger)strideInY
{
  return self->_strideInY;
}

- (NSUInteger)dilationRateInX
{
  return self->_dilationRateInX;
}

- (NSUInteger)dilationRateInY
{
  return self->_dilationRateInY;
}

- (NSUInteger)groupCount
{
  return self->_groupCount;
}

- (MLCPaddingPolicy)paddingPolicy
{
  return self->_paddingPolicy;
}

- (void)setPaddingPolicy:(int)a3
{
  self->_paddingPolicy = a3;
}

- (NSUInteger)paddingSizeInX
{
  return self->_paddingSizeInX;
}

- (void)setPaddingSizeInX:(unint64_t)a3
{
  self->_paddingSizeInX = a3;
}

- (NSUInteger)paddingSizeInY
{
  return self->_paddingSizeInY;
}

- (void)setPaddingSizeInY:(unint64_t)a3
{
  self->_paddingSizeInY = a3;
}

@end