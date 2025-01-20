@interface _MLCGPUConvolutionTransposePadding
+ (BOOL)supportsSecureCoding;
+ (id)convolutionTransposeZeroPaddingWithTopAmount:(unint64_t)a3 bottomAmount:(unint64_t)a4 leftAmount:(unint64_t)a5 rightAmount:(unint64_t)a6 outputPaddingX:(unint64_t)a7 outputPaddingY:(unint64_t)a8;
- (_MLCGPUConvolutionTransposePadding)initWithCoder:(id)a3;
- (_MLCGPUConvolutionTransposePadding)initWithTopAmount:(unint64_t)a3 bottomAmount:(unint64_t)a4 leftAmount:(unint64_t)a5 rightAmount:(unint64_t)a6 outputPaddingX:(unint64_t)a7 outputPaddingY:(unint64_t)a8;
- (id)destinationImageDescriptorForSourceImages:(id)a3 sourceStates:(id)a4 forKernel:(id)a5 suggestedDescriptor:(id)a6;
- (unint64_t)bottomAmount;
- (unint64_t)leftAmount;
- (unint64_t)outputPaddingX;
- (unint64_t)outputPaddingY;
- (unint64_t)paddingMethod;
- (unint64_t)rightAmount;
- (unint64_t)topAmount;
- (void)encodeWithCoder:(id)a3;
@end

@implementation _MLCGPUConvolutionTransposePadding

+ (id)convolutionTransposeZeroPaddingWithTopAmount:(unint64_t)a3 bottomAmount:(unint64_t)a4 leftAmount:(unint64_t)a5 rightAmount:(unint64_t)a6 outputPaddingX:(unint64_t)a7 outputPaddingY:(unint64_t)a8
{
  v8 = (void *)[objc_alloc((Class)a1) initWithTopAmount:a3 bottomAmount:a4 leftAmount:a5 rightAmount:a6 outputPaddingX:a7 outputPaddingY:a8];

  return v8;
}

- (_MLCGPUConvolutionTransposePadding)initWithTopAmount:(unint64_t)a3 bottomAmount:(unint64_t)a4 leftAmount:(unint64_t)a5 rightAmount:(unint64_t)a6 outputPaddingX:(unint64_t)a7 outputPaddingY:(unint64_t)a8
{
  v15.receiver = self;
  v15.super_class = (Class)_MLCGPUConvolutionTransposePadding;
  result = [(_MLCGPUConvolutionTransposePadding *)&v15 init];
  if (result)
  {
    result->_topAmount = a3;
    result->_bottomAmount = a4;
    result->_leftAmount = a5;
    result->_rightAmount = a6;
    result->_outputPaddingX = a7;
    result->_outputPaddingY = a8;
  }
  return result;
}

- (unint64_t)paddingMethod
{
  return 0x4000;
}

- (id)destinationImageDescriptorForSourceImages:(id)a3 sourceStates:(id)a4 forKernel:(id)a5 suggestedDescriptor:(id)a6
{
  id v9 = a5;
  id v10 = a6;
  id v11 = a3;
  uint64_t v12 = [v9 kernelWidth];
  uint64_t v13 = [v9 kernelHeight];
  uint64_t v14 = [v9 dilationRateX] * (v12 - 1);
  uint64_t v15 = v14 + 1;
  uint64_t v16 = [v9 dilationRateY] * (v13 - 1);
  uint64_t v17 = v16 + 1;
  memset(v28, 0, sizeof(v28));
  [v9 setOffset:v28];
  uint64_t v18 = v14 + 2;
  if (v14 + 1 >= 0) {
    uint64_t v18 = v14 + 1;
  }
  if (v17 >= 0) {
    uint64_t v19 = v16 + 1;
  }
  else {
    uint64_t v19 = v16 + 2;
  }
  unint64_t topAmount = self->_topAmount;
  [v9 setKernelOffsetX:(v14 & 1) - (v18 >> 1) + self->_leftAmount];
  [v9 setKernelOffsetY:(v16 & 1) - (v19 >> 1) + topAmount];
  v21 = [v11 objectAtIndexedSubscript:0];
  uint64_t v22 = [v21 width] - 1;
  unint64_t v23 = v15
      + v22 * [v9 strideInPixelsX]
      - (self->_leftAmount
       + self->_rightAmount)
      + self->_outputPaddingX;

  v24 = [v11 objectAtIndexedSubscript:0];

  uint64_t v25 = [v24 height] - 1;
  unint64_t v26 = v17
      + v25 * [v9 strideInPixelsY]
      - (self->_topAmount
       + self->_bottomAmount)
      + self->_outputPaddingY;

  [v10 setWidth:v23];
  [v10 setHeight:v26];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[_MLCGPUConvolutionTransposePadding topAmount](self, "topAmount"), @"topAmount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_MLCGPUConvolutionTransposePadding bottomAmount](self, "bottomAmount"), @"bottomAmount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_MLCGPUConvolutionTransposePadding leftAmount](self, "leftAmount"), @"leftAmount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_MLCGPUConvolutionTransposePadding rightAmount](self, "rightAmount"), @"rightAmount");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_MLCGPUConvolutionTransposePadding outputPaddingX](self, "outputPaddingX"), @"outputPaddingX");
  objc_msgSend(v4, "encodeInteger:forKey:", -[_MLCGPUConvolutionTransposePadding outputPaddingY](self, "outputPaddingY"), @"outputPaddingY");
}

- (_MLCGPUConvolutionTransposePadding)initWithCoder:(id)a3
{
  id v4 = a3;
  [v4 decodeFloatForKey:@"topAmount"];
  unint64_t v6 = (unint64_t)v5;
  [v4 decodeFloatForKey:@"bottomAmount"];
  unint64_t v8 = (unint64_t)v7;
  [v4 decodeFloatForKey:@"leftAmount"];
  unint64_t v10 = (unint64_t)v9;
  [v4 decodeFloatForKey:@"rightAmount"];
  unint64_t v12 = (unint64_t)v11;
  [v4 decodeFloatForKey:@"outputPaddingX"];
  unint64_t v14 = (unint64_t)v13;
  [v4 decodeFloatForKey:@"outputPaddingY"];
  float v16 = v15;

  return [(_MLCGPUConvolutionTransposePadding *)self initWithTopAmount:v6 bottomAmount:v8 leftAmount:v10 rightAmount:v12 outputPaddingX:v14 outputPaddingY:(unint64_t)v16];
}

- (unint64_t)topAmount
{
  return self->_topAmount;
}

- (unint64_t)bottomAmount
{
  return self->_bottomAmount;
}

- (unint64_t)leftAmount
{
  return self->_leftAmount;
}

- (unint64_t)rightAmount
{
  return self->_rightAmount;
}

- (unint64_t)outputPaddingX
{
  return self->_outputPaddingX;
}

- (unint64_t)outputPaddingY
{
  return self->_outputPaddingY;
}

@end