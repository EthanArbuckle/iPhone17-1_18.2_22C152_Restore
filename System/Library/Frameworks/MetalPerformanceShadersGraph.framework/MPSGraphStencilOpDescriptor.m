@interface MPSGraphStencilOpDescriptor
+ (MPSGraphStencilOpDescriptor)descriptorWithExplicitPadding:(MPSShape *)explicitPadding;
+ (MPSGraphStencilOpDescriptor)descriptorWithOffsets:(MPSShape *)offsets explicitPadding:(MPSShape *)explicitPadding;
+ (MPSGraphStencilOpDescriptor)descriptorWithPaddingStyle:(MPSGraphPaddingStyle)paddingStyle;
+ (MPSGraphStencilOpDescriptor)descriptorWithReductionMode:(MPSGraphReductionMode)reductionMode offsets:(MPSShape *)offsets strides:(MPSShape *)strides dilationRates:(MPSShape *)dilationRates explicitPadding:(MPSShape *)explicitPadding boundaryMode:(MPSGraphPaddingMode)boundaryMode paddingStyle:(MPSGraphPaddingStyle)paddingStyle paddingConstant:(float)paddingConstant;
- (MPSGraphPaddingMode)boundaryMode;
- (MPSGraphPaddingStyle)paddingStyle;
- (MPSGraphReductionMode)reductionMode;
- (MPSShape)dilationRates;
- (MPSShape)explicitPadding;
- (MPSShape)offsets;
- (MPSShape)strides;
- (float)paddingConstant;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setBoundaryMode:(MPSGraphPaddingMode)boundaryMode;
- (void)setDilationRates:(MPSShape *)dilationRates;
- (void)setExplicitPadding:(MPSShape *)explicitPadding;
- (void)setOffsets:(MPSShape *)offsets;
- (void)setPaddingConstant:(float)paddingConstant;
- (void)setPaddingStyle:(MPSGraphPaddingStyle)paddingStyle;
- (void)setReductionMode:(MPSGraphReductionMode)reductionMode;
- (void)setStrides:(MPSShape *)strides;
@end

@implementation MPSGraphStencilOpDescriptor

+ (MPSGraphStencilOpDescriptor)descriptorWithReductionMode:(MPSGraphReductionMode)reductionMode offsets:(MPSShape *)offsets strides:(MPSShape *)strides dilationRates:(MPSShape *)dilationRates explicitPadding:(MPSShape *)explicitPadding boundaryMode:(MPSGraphPaddingMode)boundaryMode paddingStyle:(MPSGraphPaddingStyle)paddingStyle paddingConstant:(float)paddingConstant
{
  v16 = offsets;
  v17 = strides;
  v18 = dilationRates;
  v19 = explicitPadding;
  v20 = objc_alloc_init(MPSGraphStencilOpDescriptor);
  [(MPSGraphStencilOpDescriptor *)v20 setReductionMode:reductionMode];
  [(MPSGraphStencilOpDescriptor *)v20 setOffsets:v16];
  [(MPSGraphStencilOpDescriptor *)v20 setStrides:v17];
  [(MPSGraphStencilOpDescriptor *)v20 setDilationRates:v18];
  [(MPSGraphStencilOpDescriptor *)v20 setExplicitPadding:v19];
  [(MPSGraphStencilOpDescriptor *)v20 setBoundaryMode:boundaryMode];
  [(MPSGraphStencilOpDescriptor *)v20 setPaddingStyle:paddingStyle];
  *(float *)&double v21 = paddingConstant;
  [(MPSGraphStencilOpDescriptor *)v20 setPaddingConstant:v21];

  return v20;
}

+ (MPSGraphStencilOpDescriptor)descriptorWithOffsets:(MPSShape *)offsets explicitPadding:(MPSShape *)explicitPadding
{
  v4 = +[MPSGraphStencilOpDescriptor descriptorWithReductionMode:2 offsets:offsets strides:&unk_1EC9F1A18 dilationRates:&unk_1EC9F1A30 explicitPadding:explicitPadding boundaryMode:4 paddingStyle:0.0 paddingConstant:3];

  return (MPSGraphStencilOpDescriptor *)v4;
}

+ (MPSGraphStencilOpDescriptor)descriptorWithExplicitPadding:(MPSShape *)explicitPadding
{
  v3 = +[MPSGraphStencilOpDescriptor descriptorWithReductionMode:2 offsets:&unk_1EC9F1A48 strides:&unk_1EC9F1A60 dilationRates:&unk_1EC9F1A78 explicitPadding:explicitPadding boundaryMode:4 paddingStyle:0.0 paddingConstant:0];

  return (MPSGraphStencilOpDescriptor *)v3;
}

+ (MPSGraphStencilOpDescriptor)descriptorWithPaddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  return +[MPSGraphStencilOpDescriptor descriptorWithReductionMode:2 offsets:&unk_1EC9F1A90 strides:&unk_1EC9F1AA8 dilationRates:&unk_1EC9F1AC0 explicitPadding:&unk_1EC9F1AD8 boundaryMode:4 paddingStyle:0.0 paddingConstant:paddingStyle];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MPSGraphStencilOpDescriptor alloc];
  [(MPSGraphStencilOpDescriptor *)v4 setReductionMode:self->_reductionMode];
  [(MPSGraphStencilOpDescriptor *)v4 setOffsets:self->_offsets];
  [(MPSGraphStencilOpDescriptor *)v4 setStrides:self->_strides];
  [(MPSGraphStencilOpDescriptor *)v4 setDilationRates:self->_dilationRates];
  [(MPSGraphStencilOpDescriptor *)v4 setExplicitPadding:self->_explicitPadding];
  [(MPSGraphStencilOpDescriptor *)v4 setBoundaryMode:self->_boundaryMode];
  [(MPSGraphStencilOpDescriptor *)v4 setPaddingStyle:self->_paddingStyle];
  *(float *)&double v5 = self->_paddingConstant;
  [(MPSGraphStencilOpDescriptor *)v4 setPaddingConstant:v5];
  return v4;
}

- (MPSGraphReductionMode)reductionMode
{
  return self->_reductionMode;
}

- (void)setReductionMode:(MPSGraphReductionMode)reductionMode
{
  self->_reductionMode = reductionMode;
}

- (MPSShape)offsets
{
  return self->_offsets;
}

- (void)setOffsets:(MPSShape *)offsets
{
}

- (MPSShape)strides
{
  return self->_strides;
}

- (void)setStrides:(MPSShape *)strides
{
}

- (MPSShape)dilationRates
{
  return self->_dilationRates;
}

- (void)setDilationRates:(MPSShape *)dilationRates
{
}

- (MPSShape)explicitPadding
{
  return self->_explicitPadding;
}

- (void)setExplicitPadding:(MPSShape *)explicitPadding
{
}

- (MPSGraphPaddingMode)boundaryMode
{
  return self->_boundaryMode;
}

- (void)setBoundaryMode:(MPSGraphPaddingMode)boundaryMode
{
  self->_boundaryMode = boundaryMode;
}

- (MPSGraphPaddingStyle)paddingStyle
{
  return self->_paddingStyle;
}

- (void)setPaddingStyle:(MPSGraphPaddingStyle)paddingStyle
{
  self->_paddingStyle = paddingStyle;
}

- (float)paddingConstant
{
  return self->_paddingConstant;
}

- (void)setPaddingConstant:(float)paddingConstant
{
  self->_paddingConstant = paddingConstant;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_explicitPadding, 0);
  objc_storeStrong((id *)&self->_dilationRates, 0);
  objc_storeStrong((id *)&self->_strides, 0);

  objc_storeStrong((id *)&self->_offsets, 0);
}

@end