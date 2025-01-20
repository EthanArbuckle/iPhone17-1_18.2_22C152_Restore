@interface MPSGraphDepthwiseConvolution3DOpDescriptor
+ (MPSGraphDepthwiseConvolution3DOpDescriptor)descriptorWithPaddingStyle:(MPSGraphPaddingStyle)paddingStyle;
+ (MPSGraphDepthwiseConvolution3DOpDescriptor)descriptorWithStrides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingValues:(NSArray *)paddingValues paddingStyle:(MPSGraphPaddingStyle)paddingStyle;
- (MPSGraphPaddingStyle)paddingStyle;
- (NSArray)dilationRates;
- (NSArray)paddingValues;
- (NSArray)strides;
- (NSInteger)channelDimensionIndex;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setChannelDimensionIndex:(NSInteger)channelDimensionIndex;
- (void)setDilationRates:(NSArray *)dilationRates;
- (void)setPaddingStyle:(MPSGraphPaddingStyle)paddingStyle;
- (void)setPaddingValues:(NSArray *)paddingValues;
- (void)setStrides:(NSArray *)strides;
@end

@implementation MPSGraphDepthwiseConvolution3DOpDescriptor

+ (MPSGraphDepthwiseConvolution3DOpDescriptor)descriptorWithStrides:(NSArray *)strides dilationRates:(NSArray *)dilationRates paddingValues:(NSArray *)paddingValues paddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  v9 = strides;
  v10 = dilationRates;
  v11 = paddingValues;
  v12 = objc_alloc_init(MPSGraphDepthwiseConvolution3DOpDescriptor);
  [(NSArray *)v9 count];
  if ([(NSArray *)v9 count] != 3 && MTLReportFailureTypeEnabled())
  {
    uint64_t v17 = [(NSArray *)v9 count];
    MTLReportFailure();
  }
  [(NSArray *)v10 count];
  if ([(NSArray *)v10 count] != 3 && MTLReportFailureTypeEnabled())
  {
    uint64_t v18 = [(NSArray *)v10 count];
    MTLReportFailure();
  }
  [(NSArray *)v11 count];
  if ([(NSArray *)v11 count] != 6 && MTLReportFailureTypeEnabled())
  {
    v19 = [(NSArray *)v11 count];
    MTLReportFailure();
  }
  if ((paddingStyle > MPSGraphPaddingStyleONNX_SAME_LOWER || paddingStyle == MPSGraphPaddingStyleExplicitOffset)
    && MTLReportFailureTypeEnabled())
  {
    v19 = "MPSGraphPaddingStyleExplicit, MPSGraphPaddingStyleONNX_SAME_LOWER, MPSGraphPaddingStyleTF_SAME or MPSGraphPadd"
          "ingStyleTF_VALID for MPSGraphDepthwiseConvolution.";
    MTLReportFailure();
  }
  v13 = (void *)[(NSArray *)v9 copy];
  [(MPSGraphDepthwiseConvolution3DOpDescriptor *)v12 setStrides:v13];

  v14 = (void *)[(NSArray *)v10 copy];
  [(MPSGraphDepthwiseConvolution3DOpDescriptor *)v12 setDilationRates:v14];

  v15 = (void *)[(NSArray *)v11 copy];
  [(MPSGraphDepthwiseConvolution3DOpDescriptor *)v12 setPaddingValues:v15];

  [(MPSGraphDepthwiseConvolution3DOpDescriptor *)v12 setPaddingStyle:paddingStyle];
  [(MPSGraphDepthwiseConvolution3DOpDescriptor *)v12 setChannelDimensionIndex:-4];

  return v12;
}

+ (MPSGraphDepthwiseConvolution3DOpDescriptor)descriptorWithPaddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  return +[MPSGraphDepthwiseConvolution3DOpDescriptor descriptorWithStrides:&unk_1EC9F1718 dilationRates:&unk_1EC9F1730 paddingValues:&unk_1EC9F1748 paddingStyle:paddingStyle];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MPSGraphDepthwiseConvolution3DOpDescriptor alloc];
  uint64_t v5 = [(NSArray *)self->_dilationRates copy];
  dilationRates = v4->_dilationRates;
  v4->_dilationRates = (NSArray *)v5;

  v4->_paddingStyle = self->_paddingStyle;
  uint64_t v7 = [(NSArray *)self->_paddingValues copy];
  paddingValues = v4->_paddingValues;
  v4->_paddingValues = (NSArray *)v7;

  uint64_t v9 = [(NSArray *)self->_strides copy];
  strides = v4->_strides;
  v4->_strides = (NSArray *)v9;

  v4->_channelDimensionIndex = self->_channelDimensionIndex;
  return v4;
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

- (NSInteger)channelDimensionIndex
{
  return self->_channelDimensionIndex;
}

- (void)setChannelDimensionIndex:(NSInteger)channelDimensionIndex
{
  self->_channelDimensionIndex = channelDimensionIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paddingValues, 0);
  objc_storeStrong((id *)&self->_dilationRates, 0);

  objc_storeStrong((id *)&self->_strides, 0);
}

@end