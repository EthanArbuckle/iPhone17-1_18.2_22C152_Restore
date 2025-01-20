@interface MPSGraphConvolution3DOpDescriptor
+ (MPSGraphConvolution3DOpDescriptor)descriptorWithStrideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY strideInZ:(NSUInteger)strideInZ dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY dilationRateInZ:(NSUInteger)dilationRateInZ groups:(NSUInteger)groups paddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom paddingFront:(NSUInteger)paddingFront paddingBack:(NSUInteger)paddingBack paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout;
+ (MPSGraphConvolution3DOpDescriptor)descriptorWithStrideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY strideInZ:(NSUInteger)strideInZ dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY dilationRateInZ:(NSUInteger)dilationRateInZ groups:(NSUInteger)groups paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout;
- (MPSGraphPaddingStyle)paddingStyle;
- (MPSGraphTensorNamedDataLayout)dataLayout;
- (MPSGraphTensorNamedDataLayout)weightsLayout;
- (NSUInteger)dilationRateInX;
- (NSUInteger)dilationRateInY;
- (NSUInteger)dilationRateInZ;
- (NSUInteger)groups;
- (NSUInteger)paddingBack;
- (NSUInteger)paddingBottom;
- (NSUInteger)paddingFront;
- (NSUInteger)paddingLeft;
- (NSUInteger)paddingRight;
- (NSUInteger)paddingTop;
- (NSUInteger)strideInX;
- (NSUInteger)strideInY;
- (NSUInteger)strideInZ;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setDataLayout:(MPSGraphTensorNamedDataLayout)dataLayout;
- (void)setDilationRateInX:(NSUInteger)dilationRateInX;
- (void)setDilationRateInY:(NSUInteger)dilationRateInY;
- (void)setDilationRateInZ:(NSUInteger)dilationRateInZ;
- (void)setExplicitPaddingWithPaddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom paddingFront:(NSUInteger)paddingFront paddingBack:(NSUInteger)paddingBack;
- (void)setGroups:(NSUInteger)groups;
- (void)setPaddingBack:(NSUInteger)paddingBack;
- (void)setPaddingBottom:(NSUInteger)paddingBottom;
- (void)setPaddingFront:(NSUInteger)paddingFront;
- (void)setPaddingLeft:(NSUInteger)paddingLeft;
- (void)setPaddingRight:(NSUInteger)paddingRight;
- (void)setPaddingStyle:(MPSGraphPaddingStyle)paddingStyle;
- (void)setPaddingTop:(NSUInteger)paddingTop;
- (void)setStrideInX:(NSUInteger)strideInX;
- (void)setStrideInY:(NSUInteger)strideInY;
- (void)setStrideInZ:(NSUInteger)strideInZ;
- (void)setWeightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout;
@end

@implementation MPSGraphConvolution3DOpDescriptor

+ (MPSGraphConvolution3DOpDescriptor)descriptorWithStrideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY strideInZ:(NSUInteger)strideInZ dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY dilationRateInZ:(NSUInteger)dilationRateInZ groups:(NSUInteger)groups paddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom paddingFront:(NSUInteger)paddingFront paddingBack:(NSUInteger)paddingBack paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout
{
  if (dataLayout - 7 >= 2 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  if (weightsLayout - 9 >= 2 && MTLReportFailureTypeEnabled()) {
    MTLReportFailure();
  }
  v24 = objc_alloc_init(MPSGraphConvolution3DOpDescriptor);
  [(MPSGraphConvolution3DOpDescriptor *)v24 setStrideInX:strideInX];
  [(MPSGraphConvolution3DOpDescriptor *)v24 setStrideInY:strideInY];
  [(MPSGraphConvolution3DOpDescriptor *)v24 setStrideInZ:strideInZ];
  [(MPSGraphConvolution3DOpDescriptor *)v24 setDilationRateInX:dilationRateInX];
  [(MPSGraphConvolution3DOpDescriptor *)v24 setDilationRateInY:dilationRateInY];
  [(MPSGraphConvolution3DOpDescriptor *)v24 setDilationRateInZ:dilationRateInZ];
  [(MPSGraphConvolution3DOpDescriptor *)v24 setGroups:groups];
  [(MPSGraphConvolution3DOpDescriptor *)v24 setPaddingLeft:paddingLeft];
  [(MPSGraphConvolution3DOpDescriptor *)v24 setPaddingRight:paddingRight];
  [(MPSGraphConvolution3DOpDescriptor *)v24 setPaddingTop:paddingTop];
  [(MPSGraphConvolution3DOpDescriptor *)v24 setPaddingBottom:paddingBottom];
  [(MPSGraphConvolution3DOpDescriptor *)v24 setPaddingFront:paddingFront];
  [(MPSGraphConvolution3DOpDescriptor *)v24 setPaddingBack:paddingBack];
  [(MPSGraphConvolution3DOpDescriptor *)v24 setPaddingStyle:paddingStyle];
  [(MPSGraphConvolution3DOpDescriptor *)v24 setDataLayout:dataLayout];
  [(MPSGraphConvolution3DOpDescriptor *)v24 setWeightsLayout:weightsLayout];

  return v24;
}

+ (MPSGraphConvolution3DOpDescriptor)descriptorWithStrideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY strideInZ:(NSUInteger)strideInZ dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY dilationRateInZ:(NSUInteger)dilationRateInZ groups:(NSUInteger)groups paddingStyle:(MPSGraphPaddingStyle)paddingStyle dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout weightsLayout:(MPSGraphTensorNamedDataLayout)weightsLayout
{
  return (MPSGraphConvolution3DOpDescriptor *)objc_msgSend(a1, "descriptorWithStrideInX:strideInY:strideInZ:dilationRateInX:dilationRateInY:dilationRateInZ:groups:paddingLeft:paddingRight:paddingTop:paddingBottom:paddingFront:paddingBack:paddingStyle:dataLayout:weightsLayout:", strideInX, strideInY, strideInZ, dilationRateInX, dilationRateInY, dilationRateInZ, groups, 0, 0, 0, 0, 0, 0, paddingStyle, dataLayout,
                                                weightsLayout);
}

- (void)setExplicitPaddingWithPaddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom paddingFront:(NSUInteger)paddingFront paddingBack:(NSUInteger)paddingBack
{
  [(MPSGraphConvolution3DOpDescriptor *)self setPaddingLeft:paddingLeft];
  [(MPSGraphConvolution3DOpDescriptor *)self setPaddingRight:paddingRight];
  [(MPSGraphConvolution3DOpDescriptor *)self setPaddingTop:paddingTop];
  [(MPSGraphConvolution3DOpDescriptor *)self setPaddingBottom:paddingBottom];
  [(MPSGraphConvolution3DOpDescriptor *)self setPaddingFront:paddingFront];
  [(MPSGraphConvolution3DOpDescriptor *)self setPaddingBack:paddingBack];

  [(MPSGraphConvolution3DOpDescriptor *)self setPaddingStyle:0];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MPSGraphConvolution3DOpDescriptor alloc];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setStrideInX:self->_strideInX];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setStrideInY:self->_strideInY];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setStrideInZ:self->_strideInZ];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setDilationRateInX:self->_dilationRateInX];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setDilationRateInY:self->_dilationRateInY];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setDilationRateInZ:self->_dilationRateInZ];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setGroups:self->_groups];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setPaddingLeft:self->_paddingLeft];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setPaddingRight:self->_paddingRight];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setPaddingTop:self->_paddingTop];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setPaddingBottom:self->_paddingBottom];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setPaddingFront:self->_paddingFront];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setPaddingBack:self->_paddingBack];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setPaddingStyle:self->_paddingStyle];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setDataLayout:self->_dataLayout];
  [(MPSGraphConvolution3DOpDescriptor *)v4 setWeightsLayout:self->_weightsLayout];
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

- (NSUInteger)strideInZ
{
  return self->_strideInZ;
}

- (void)setStrideInZ:(NSUInteger)strideInZ
{
  self->_strideInZ = strideInZ;
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

- (NSUInteger)dilationRateInZ
{
  return self->_dilationRateInZ;
}

- (void)setDilationRateInZ:(NSUInteger)dilationRateInZ
{
  self->_dilationRateInZ = dilationRateInZ;
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

- (NSUInteger)paddingFront
{
  return self->_paddingFront;
}

- (void)setPaddingFront:(NSUInteger)paddingFront
{
  self->_paddingFront = paddingFront;
}

- (NSUInteger)paddingBack
{
  return self->_paddingBack;
}

- (void)setPaddingBack:(NSUInteger)paddingBack
{
  self->_paddingBack = paddingBack;
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