@interface MPSGraphConvolution2DOpDescriptor
+ (MPSGraphConvolution2DOpDescriptor)descriptorWithStrideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY groups:(NSUInteger)groups paddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout;
+ (MPSGraphConvolution2DOpDescriptor)descriptorWithStrideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY groups:(NSUInteger)groups paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout;
- (MPSGraphPaddingStyle)paddingStyle;
- (MPSGraphTensorNamedDataLayout)dataLayout;
- (MPSGraphTensorNamedDataLayout)weightsLayout;
- (NSUInteger)dilationRateInX;
- (NSUInteger)dilationRateInY;
- (NSUInteger)groups;
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
- (void)setGroups:(NSUInteger)groups;
- (void)setPaddingBottom:(NSUInteger)paddingBottom;
- (void)setPaddingLeft:(NSUInteger)paddingLeft;
- (void)setPaddingRight:(NSUInteger)paddingRight;
- (void)setPaddingStyle:(MPSGraphPaddingStyle)paddingStyle;
- (void)setPaddingTop:(NSUInteger)paddingTop;
- (void)setStrideInX:(NSUInteger)strideInX;
- (void)setStrideInY:(NSUInteger)strideInY;
- (void)setWeightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout;
@end

@implementation MPSGraphConvolution2DOpDescriptor

+ (MPSGraphConvolution2DOpDescriptor)descriptorWithStrideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY groups:(NSUInteger)groups paddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout
{
  if (dataLayout >= MPSGraphTensorNamedDataLayoutOIHW && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  if ((weightsLayout & 0xFFFFFFFFFFFFFFFELL) != 2 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  v20 = objc_alloc_init(MPSGraphConvolution2DOpDescriptor);
  [(MPSGraphConvolution2DOpDescriptor *)v20 setStrideInX:strideInX];
  [(MPSGraphConvolution2DOpDescriptor *)v20 setStrideInY:strideInY];
  [(MPSGraphConvolution2DOpDescriptor *)v20 setDilationRateInX:dilationRateInX];
  [(MPSGraphConvolution2DOpDescriptor *)v20 setDilationRateInY:dilationRateInY];
  [(MPSGraphConvolution2DOpDescriptor *)v20 setGroups:groups];
  [(MPSGraphConvolution2DOpDescriptor *)v20 setPaddingLeft:paddingLeft];
  [(MPSGraphConvolution2DOpDescriptor *)v20 setPaddingRight:paddingRight];
  [(MPSGraphConvolution2DOpDescriptor *)v20 setPaddingTop:paddingTop];
  [(MPSGraphConvolution2DOpDescriptor *)v20 setPaddingBottom:paddingBottom];
  [(MPSGraphConvolution2DOpDescriptor *)v20 setPaddingStyle:paddingStyle];
  [(MPSGraphConvolution2DOpDescriptor *)v20 setDataLayout:dataLayout];
  [(MPSGraphConvolution2DOpDescriptor *)v20 setWeightsLayout:weightsLayout];

  return v20;
}

+ (MPSGraphConvolution2DOpDescriptor)descriptorWithStrideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY groups:(NSUInteger)groups paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout
{
  return (MPSGraphConvolution2DOpDescriptor *)[a1 descriptorWithStrideInX:strideInX strideInY:strideInY dilationRateInX:dilationRateInX dilationRateInY:dilationRateInY groups:groups paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 paddingStyle:paddingStyle dataLayout:dataLayout weightsLayout:weightsLayout];
}

- (void)setExplicitPaddingWithPaddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom
{
  [(MPSGraphConvolution2DOpDescriptor *)self setPaddingLeft:paddingLeft];
  [(MPSGraphConvolution2DOpDescriptor *)self setPaddingRight:paddingRight];
  [(MPSGraphConvolution2DOpDescriptor *)self setPaddingTop:paddingTop];
  [(MPSGraphConvolution2DOpDescriptor *)self setPaddingBottom:paddingBottom];

  [(MPSGraphConvolution2DOpDescriptor *)self setPaddingStyle:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MPSGraphConvolution2DOpDescriptor alloc];
  [(MPSGraphConvolution2DOpDescriptor *)v4 setStrideInX:self->_strideInX];
  [(MPSGraphConvolution2DOpDescriptor *)v4 setStrideInY:self->_strideInY];
  [(MPSGraphConvolution2DOpDescriptor *)v4 setDilationRateInX:self->_dilationRateInX];
  [(MPSGraphConvolution2DOpDescriptor *)v4 setDilationRateInY:self->_dilationRateInY];
  [(MPSGraphConvolution2DOpDescriptor *)v4 setGroups:self->_groups];
  [(MPSGraphConvolution2DOpDescriptor *)v4 setPaddingLeft:self->_paddingLeft];
  [(MPSGraphConvolution2DOpDescriptor *)v4 setPaddingRight:self->_paddingRight];
  [(MPSGraphConvolution2DOpDescriptor *)v4 setPaddingTop:self->_paddingTop];
  [(MPSGraphConvolution2DOpDescriptor *)v4 setPaddingBottom:self->_paddingBottom];
  [(MPSGraphConvolution2DOpDescriptor *)v4 setPaddingStyle:self->_paddingStyle];
  [(MPSGraphConvolution2DOpDescriptor *)v4 setDataLayout:self->_dataLayout];
  [(MPSGraphConvolution2DOpDescriptor *)v4 setWeightsLayout:self->_weightsLayout];
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

- (NSUInteger)groups
{
  return self->_groups;
}

- (void)setGroups:(NSUInteger)groups
{
  self->_groups = groups;
}

@end