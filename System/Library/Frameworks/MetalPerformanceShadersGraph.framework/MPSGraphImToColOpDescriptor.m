@interface MPSGraphImToColOpDescriptor
+ (MPSGraphImToColOpDescriptor)descriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight strideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout;
+ (MPSGraphImToColOpDescriptor)descriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight strideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY paddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout;
- (MPSGraphTensorNamedDataLayout)dataLayout;
- (NSUInteger)dilationRateInX;
- (NSUInteger)dilationRateInY;
- (NSUInteger)kernelHeight;
- (NSUInteger)kernelWidth;
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
- (void)setKernelHeight:(NSUInteger)kernelHeight;
- (void)setKernelWidth:(NSUInteger)kernelWidth;
- (void)setPaddingBottom:(NSUInteger)paddingBottom;
- (void)setPaddingLeft:(NSUInteger)paddingLeft;
- (void)setPaddingRight:(NSUInteger)paddingRight;
- (void)setPaddingTop:(NSUInteger)paddingTop;
- (void)setStrideInX:(NSUInteger)strideInX;
- (void)setStrideInY:(NSUInteger)strideInY;
@end

@implementation MPSGraphImToColOpDescriptor

+ (MPSGraphImToColOpDescriptor)descriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight strideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY paddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout
{
  v19 = objc_alloc_init(MPSGraphImToColOpDescriptor);
  [(MPSGraphImToColOpDescriptor *)v19 setKernelWidth:kernelWidth];
  [(MPSGraphImToColOpDescriptor *)v19 setKernelHeight:kernelHeight];
  [(MPSGraphImToColOpDescriptor *)v19 setStrideInX:strideInX];
  [(MPSGraphImToColOpDescriptor *)v19 setStrideInY:strideInY];
  [(MPSGraphImToColOpDescriptor *)v19 setDilationRateInX:dilationRateInX];
  [(MPSGraphImToColOpDescriptor *)v19 setDilationRateInY:dilationRateInY];
  [(MPSGraphImToColOpDescriptor *)v19 setPaddingLeft:paddingLeft];
  [(MPSGraphImToColOpDescriptor *)v19 setPaddingRight:paddingRight];
  [(MPSGraphImToColOpDescriptor *)v19 setPaddingTop:paddingTop];
  [(MPSGraphImToColOpDescriptor *)v19 setPaddingBottom:paddingBottom];
  [(MPSGraphImToColOpDescriptor *)v19 setDataLayout:dataLayout];

  return v19;
}

+ (MPSGraphImToColOpDescriptor)descriptorWithKernelWidth:(NSUInteger)kernelWidth kernelHeight:(NSUInteger)kernelHeight strideInX:(NSUInteger)strideInX strideInY:(NSUInteger)strideInY dilationRateInX:(NSUInteger)dilationRateInX dilationRateInY:(NSUInteger)dilationRateInY dataLayout:(MPSGraphTensorNamedDataLayout)dataLayout
{
  return (MPSGraphImToColOpDescriptor *)[a1 descriptorWithKernelWidth:kernelWidth kernelHeight:kernelHeight strideInX:strideInX strideInY:strideInY dilationRateInX:dilationRateInX dilationRateInY:dilationRateInY paddingLeft:0 paddingRight:0 paddingTop:0 paddingBottom:0 dataLayout:dataLayout];
}

- (void)setExplicitPaddingWithPaddingLeft:(NSUInteger)paddingLeft paddingRight:(NSUInteger)paddingRight paddingTop:(NSUInteger)paddingTop paddingBottom:(NSUInteger)paddingBottom
{
  [(MPSGraphImToColOpDescriptor *)self setPaddingLeft:paddingLeft];
  [(MPSGraphImToColOpDescriptor *)self setPaddingRight:paddingRight];
  [(MPSGraphImToColOpDescriptor *)self setPaddingTop:paddingTop];

  [(MPSGraphImToColOpDescriptor *)self setPaddingBottom:paddingBottom];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MPSGraphImToColOpDescriptor alloc];
  [(MPSGraphImToColOpDescriptor *)v4 setKernelWidth:self->_kernelWidth];
  [(MPSGraphImToColOpDescriptor *)v4 setKernelHeight:self->_kernelHeight];
  [(MPSGraphImToColOpDescriptor *)v4 setStrideInX:self->_strideInX];
  [(MPSGraphImToColOpDescriptor *)v4 setStrideInY:self->_strideInY];
  [(MPSGraphImToColOpDescriptor *)v4 setDilationRateInX:self->_dilationRateInX];
  [(MPSGraphImToColOpDescriptor *)v4 setDilationRateInY:self->_dilationRateInY];
  [(MPSGraphImToColOpDescriptor *)v4 setPaddingLeft:self->_paddingLeft];
  [(MPSGraphImToColOpDescriptor *)v4 setPaddingRight:self->_paddingRight];
  [(MPSGraphImToColOpDescriptor *)v4 setPaddingTop:self->_paddingTop];
  [(MPSGraphImToColOpDescriptor *)v4 setPaddingBottom:self->_paddingBottom];
  [(MPSGraphImToColOpDescriptor *)v4 setDataLayout:self->_dataLayout];
  return v4;
}

- (NSUInteger)kernelWidth
{
  return self->_kernelWidth;
}

- (void)setKernelWidth:(NSUInteger)kernelWidth
{
  self->_kernelWidth = kernelWidth;
}

- (NSUInteger)kernelHeight
{
  return self->_kernelHeight;
}

- (void)setKernelHeight:(NSUInteger)kernelHeight
{
  self->_kernelHeight = kernelHeight;
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

- (MPSGraphTensorNamedDataLayout)dataLayout
{
  return self->_dataLayout;
}

- (void)setDataLayout:(MPSGraphTensorNamedDataLayout)dataLayout
{
  self->_dataLayout = dataLayout;
}

@end