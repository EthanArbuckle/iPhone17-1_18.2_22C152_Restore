@interface MPSGraphPooling4DOpDescriptor
+ (MPSGraphPooling4DOpDescriptor)descriptorWithKernelSizes:(NSArray *)kernelSizes paddingStyle:(MPSGraphPaddingStyle)paddingStyle;
+ (MPSGraphPooling4DOpDescriptor)descriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingValues:(NSArray *)paddingValues paddingStyle:(MPSGraphPaddingStyle)paddingStyle;
- (BOOL)ceilMode;
- (BOOL)includeZeroPadToAverage;
- (MPSDataType)returnIndicesDataType;
- (MPSGraphPaddingStyle)paddingStyle;
- (MPSGraphPoolingReturnIndicesMode)returnIndicesMode;
- (NSArray)dilationRates;
- (NSArray)kernelSizes;
- (NSArray)paddingValues;
- (NSArray)strides;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setCeilMode:(BOOL)ceilMode;
- (void)setDilationRates:(NSArray *)dilationRates;
- (void)setIncludeZeroPadToAverage:(BOOL)includeZeroPadToAverage;
- (void)setKernelSizes:(NSArray *)kernelSizes;
- (void)setPaddingStyle:(MPSGraphPaddingStyle)paddingStyle;
- (void)setPaddingValues:(NSArray *)paddingValues;
- (void)setReturnIndicesDataType:(MPSDataType)returnIndicesDataType;
- (void)setReturnIndicesMode:(MPSGraphPoolingReturnIndicesMode)returnIndicesMode;
- (void)setStrides:(NSArray *)strides;
@end

@implementation MPSGraphPooling4DOpDescriptor

+ (MPSGraphPooling4DOpDescriptor)descriptorWithKernelSizes:(NSArray *)kernelSizes strides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingValues:(NSArray *)paddingValues paddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  v11 = kernelSizes;
  v12 = strides;
  v13 = dilationRates;
  v14 = paddingValues;
  v15 = objc_alloc_init(MPSGraphPooling4DOpDescriptor);
  [(NSArray *)v11 count];
  if ([(NSArray *)v11 count] != 4 && MTLReportFailureTypeEnabled())
  {
    uint64_t v25 = [(NSArray *)v11 count];
    MTLReportFailure();
  }
  [(NSArray *)v12 count];
  if ([(NSArray *)v12 count] != 4 && MTLReportFailureTypeEnabled())
  {
    uint64_t v26 = [(NSArray *)v12 count];
    MTLReportFailure();
  }
  [(NSArray *)v13 count];
  if ([(NSArray *)v13 count] != 4 && MTLReportFailureTypeEnabled())
  {
    uint64_t v27 = [(NSArray *)v13 count];
    MTLReportFailure();
  }
  [(NSArray *)v14 count];
  if ([(NSArray *)v14 count] != 8 && MTLReportFailureTypeEnabled())
  {
    v28 = [(NSArray *)v14 count];
    MTLReportFailure();
  }
  if ((paddingStyle > MPSGraphPaddingStyleONNX_SAME_LOWER || paddingStyle == MPSGraphPaddingStyleExplicitOffset)
    && MTLReportFailureTypeEnabled())
  {
    v28 = "MPSGraphPaddingStyleExplicit, MPSGraphPaddingStyleONNX_SAME_LOWER, MPSGraphPaddingStyleTF_SAME or MPSGraphPadd"
          "ingStyleTF_VALID for MPSGraphPooling Ops.";
    MTLReportFailure();
  }
  uint64_t v16 = [(NSArray *)v11 copy];
  v17 = v15->_kernelSizes;
  v15->_kernelSizes = (NSArray *)v16;

  uint64_t v18 = [(NSArray *)v12 copy];
  v19 = v15->_strides;
  v15->_strides = (NSArray *)v18;

  uint64_t v20 = [(NSArray *)v13 copy];
  v21 = v15->_dilationRates;
  v15->_dilationRates = (NSArray *)v20;

  uint64_t v22 = [(NSArray *)v14 copy];
  v23 = v15->_paddingValues;
  v15->_paddingValues = (NSArray *)v22;

  v15->_paddingStyle = paddingStyle;
  v15->_ceilMode = 0;
  v15->_includeZeroPadToAverage = 0;
  v15->_returnIndicesMode = 0;
  v15->_returnIndicesDataType = 536870944;

  return v15;
}

+ (MPSGraphPooling4DOpDescriptor)descriptorWithKernelSizes:(NSArray *)kernelSizes paddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  v4 = +[MPSGraphPooling4DOpDescriptor descriptorWithKernelSizes:kernelSizes strides:&unk_1EC9F1C70 dilationRates:&unk_1EC9F1C88 paddingValues:&unk_1EC9F1CA0 paddingStyle:paddingStyle];

  return (MPSGraphPooling4DOpDescriptor *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MPSGraphPooling4DOpDescriptor alloc];
  uint64_t v5 = [(NSArray *)self->_kernelSizes copy];
  kernelSizes = v4->_kernelSizes;
  v4->_kernelSizes = (NSArray *)v5;

  uint64_t v7 = [(NSArray *)self->_dilationRates copy];
  dilationRates = v4->_dilationRates;
  v4->_dilationRates = (NSArray *)v7;

  v4->_paddingStyle = self->_paddingStyle;
  uint64_t v9 = [(NSArray *)self->_paddingValues copy];
  paddingValues = v4->_paddingValues;
  v4->_paddingValues = (NSArray *)v9;

  uint64_t v11 = [(NSArray *)self->_strides copy];
  strides = v4->_strides;
  v4->_strides = (NSArray *)v11;

  v4->_ceilMode = self->_ceilMode;
  v4->_includeZeroPadToAverage = self->_includeZeroPadToAverage;
  v4->_returnIndicesMode = self->_returnIndicesMode;
  v4->_returnIndicesDataType = self->_returnIndicesDataType;
  return v4;
}

- (NSArray)kernelSizes
{
  return self->_kernelSizes;
}

- (void)setKernelSizes:(NSArray *)kernelSizes
{
}

- (NSArray)strides
{
  return self->_strides;
}

- (void)setStrides:(NSArray *)strides
{
}

- (NSArray)dilationRates
{
  return self->_dilationRates;
}

- (void)setDilationRates:(NSArray *)dilationRates
{
}

- (NSArray)paddingValues
{
  return self->_paddingValues;
}

- (void)setPaddingValues:(NSArray *)paddingValues
{
}

- (MPSGraphPaddingStyle)paddingStyle
{
  return self->_paddingStyle;
}

- (void)setPaddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  self->_paddingStyle = paddingStyle;
}

- (BOOL)ceilMode
{
  return self->_ceilMode;
}

- (void)setCeilMode:(BOOL)ceilMode
{
  self->_ceilMode = ceilMode;
}

- (BOOL)includeZeroPadToAverage
{
  return self->_includeZeroPadToAverage;
}

- (void)setIncludeZeroPadToAverage:(BOOL)includeZeroPadToAverage
{
  self->_includeZeroPadToAverage = includeZeroPadToAverage;
}

- (MPSGraphPoolingReturnIndicesMode)returnIndicesMode
{
  return self->_returnIndicesMode;
}

- (void)setReturnIndicesMode:(MPSGraphPoolingReturnIndicesMode)returnIndicesMode
{
  self->_returnIndicesMode = returnIndicesMode;
}

- (MPSDataType)returnIndicesDataType
{
  return self->_returnIndicesDataType;
}

- (void)setReturnIndicesDataType:(MPSDataType)returnIndicesDataType
{
  self->_returnIndicesDataType = returnIndicesDataType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paddingValues, 0);
  objc_storeStrong((id *)&self->_dilationRates, 0);
  objc_storeStrong((id *)&self->_strides, 0);

  objc_storeStrong((id *)&self->_kernelSizes, 0);
}

@end