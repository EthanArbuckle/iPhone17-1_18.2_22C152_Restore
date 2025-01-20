@interface MPSGraphDepthwiseConvolution2DOpDescriptor
+ (MPSGraphDepthwiseConvolution2DOpDescriptor)descriptorWithDataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout;
+ (MPSGraphDepthwiseConvolution2DOpDescriptor)descriptorWithStrideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY paddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout;
- (MPSGraphPaddingStyle)paddingStyle;
- (MPSGraphTensorNamedDataLayout)dataLayout;
- (MPSGraphTensorNamedDataLayout)weightsLayout;
- (NSUInteger)dilationRateInX;
- (NSUInteger)dilationRateInY;
- (NSUInteger)paddingBottom;
- (NSUInteger)paddingLeft;
- (NSUInteger)paddingRight;
- (NSUInteger)paddingTop;
- (NSUInteger)strideInX;
- (NSUInteger)strideInY;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDataLayout:(MPSGraphTensorNamedDataLayout)dataLayout;
- (void)setDilationRateInX:(NSUInteger)dilationRateInX;
- (void)setDilationRateInY:(NSUInteger)dilationRateInY;
- (void)setExplicitPaddingWithPaddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom;
- (void)setPaddingBottom:(NSUInteger)paddingBottom;
- (void)setPaddingLeft:(NSUInteger)paddingLeft;
- (void)setPaddingRight:(NSUInteger)paddingRight;
- (void)setPaddingStyle:(MPSGraphPaddingStyle)paddingStyle;
- (void)setPaddingTop:(NSUInteger)paddingTop;
- (void)setStrideInX:(NSUInteger)strideInX;
- (void)setStrideInY:(NSUInteger)strideInY;
- (void)setWeightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout;
@end

@implementation MPSGraphDepthwiseConvolution2DOpDescriptor

+ (MPSGraphDepthwiseConvolution2DOpDescriptor)descriptorWithStrideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY paddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout
{
  v19 = objc_alloc_init(MPSGraphDepthwiseConvolution2DOpDescriptor);
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v19 setStrideInX:strideInX];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v19 setStrideInY:strideInY];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v19 setDilationRateInX:dilationRateInX];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v19 setDilationRateInY:dilationRateInY];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v19 setPaddingLeft:paddingLeft];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v19 setPaddingRight:paddingRight];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v19 setPaddingTop:paddingTop];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v19 setPaddingBottom:paddingBottom];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v19 setPaddingStyle:paddingStyle];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v19 setDataLayout:dataLayout];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v19 setWeightsLayout:weightsLayout];

  return v19;
}

+ (MPSGraphDepthwiseConvolution2DOpDescriptor)descriptorWithDataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout
{
  v6 = objc_alloc_init(MPSGraphDepthwiseConvolution2DOpDescriptor);
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v6 setStrideInX:1];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v6 setStrideInY:1];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v6 setDilationRateInX:1];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v6 setDilationRateInY:1];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v6 setPaddingLeft:0];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v6 setPaddingRight:0];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v6 setPaddingTop:0];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v6 setPaddingBottom:0];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v6 setPaddingStyle:0];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v6 setDataLayout:dataLayout];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v6 setWeightsLayout:weightsLayout];

  return v6;
}

- (void)setExplicitPaddingWithPaddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom
{
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self setPaddingLeft:paddingLeft];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self setPaddingRight:paddingRight];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self setPaddingTop:paddingTop];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self setPaddingBottom:paddingBottom];

  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)self setPaddingStyle:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MPSGraphDepthwiseConvolution2DOpDescriptor alloc];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v4 setStrideInX:self->_strideInX];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v4 setStrideInY:self->_strideInY];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v4 setDilationRateInX:self->_dilationRateInX];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v4 setDilationRateInY:self->_dilationRateInY];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v4 setPaddingLeft:self->_paddingLeft];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v4 setPaddingRight:self->_paddingRight];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v4 setPaddingTop:self->_paddingTop];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v4 setPaddingBottom:self->_paddingBottom];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v4 setPaddingStyle:self->_paddingStyle];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v4 setDataLayout:self->_dataLayout];
  [(MPSGraphDepthwiseConvolution2DOpDescriptor *)v4 setWeightsLayout:self->_weightsLayout];
  return v4;
}

- (NSUInteger)strideInX
{
  return self->_strideInX;
}

- (void)setStrideInX:(NSUInteger)strideInX
{
  self->_strideInX = strideInX;
}

- (NSUInteger)strideInY
{
  return self->_strideInY;
}

- (void)setStrideInY:(NSUInteger)strideInY
{
  self->_strideInY = strideInY;
}

- (NSUInteger)dilationRateInX
{
  return self->_dilationRateInX;
}

- (void)setDilationRateInX:(NSUInteger)dilationRateInX
{
  self->_dilationRateInX = dilationRateInX;
}

- (NSUInteger)dilationRateInY
{
  return self->_dilationRateInY;
}

- (void)setDilationRateInY:(NSUInteger)dilationRateInY
{
  self->_dilationRateInY = dilationRateInY;
}

- (NSUInteger)paddingLeft
{
  return self->_paddingLeft;
}

- (void)setPaddingLeft:(NSUInteger)paddingLeft
{
  self->_paddingLeft = paddingLeft;
}

- (NSUInteger)paddingRight
{
  return self->_paddingRight;
}

- (void)setPaddingRight:(NSUInteger)paddingRight
{
  self->_paddingRight = paddingRight;
}

- (NSUInteger)paddingTop
{
  return self->_paddingTop;
}

- (void)setPaddingTop:(NSUInteger)paddingTop
{
  self->_paddingTop = paddingTop;
}

- (NSUInteger)paddingBottom
{
  return self->_paddingBottom;
}

- (void)setPaddingBottom:(NSUInteger)paddingBottom
{
  self->_paddingBottom = paddingBottom;
}

- (MPSGraphPaddingStyle)paddingStyle
{
  return self->_paddingStyle;
}

- (void)setPaddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  self->_paddingStyle = paddingStyle;
}

- (MPSGraphTensorNamedDataLayout)dataLayout
{
  return self->_dataLayout;
}

- (void)setDataLayout:(MPSGraphTensorNamedDataLayout)dataLayout
{
  self->_dataLayout = dataLayout;
}

- (MPSGraphTensorNamedDataLayout)weightsLayout
{
  return self->_weightsLayout;
}

- (void)setWeightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout
{
  self->_weightsLayout = weightsLayout;
}

@end