@interface MTLDepthStencilDescriptorInternal
- (BOOL)isDepthWriteEnabled;
- (BOOL)isEqual:(id)a3;
- (MTLDepthStencilDescriptorInternal)init;
- (const)depthStencilPrivate;
- (id)backFaceStencil;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (id)frontFaceStencil;
- (id)label;
- (unint64_t)depthCompareFunction;
- (unint64_t)hash;
- (void)dealloc;
- (void)setBackFaceStencil:(id)a3;
- (void)setDepthCompareFunction:(unint64_t)a3;
- (void)setDepthWriteEnabled:(BOOL)a3;
- (void)setFrontFaceStencil:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation MTLDepthStencilDescriptorInternal

- (void)setBackFaceStencil:(id)a3
{
  p_private = &self->_private;
  if (self->_private.backFaceStencil != a3)
  {
    if (a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        MTLReportFailure(1uLL, "-[MTLDepthStencilDescriptorInternal setBackFaceStencil:]", 441, @"backFaceStencil is not a MTLStencilDescriptor.", v5, v6, v7, v8, v10);
      }
    }
    uint64_t v9 = [a3 copy];

    p_private->backFaceStencil = (MTLStencilDescriptorInternal *)v9;
  }
}

- (void)setFrontFaceStencil:(id)a3
{
  if (self->_private.frontFaceStencil != a3)
  {
    if (a3)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        MTLReportFailure(1uLL, "-[MTLDepthStencilDescriptorInternal setFrontFaceStencil:]", 422, @"frontFaceStencil is not a MTLStencilDescriptor.", v5, v6, v7, v8, v10);
      }
    }
    uint64_t v9 = (MTLStencilDescriptorInternal *)[a3 copy];

    self->_private.frontFaceStencil = v9;
  }
}

- (id)frontFaceStencil
{
  id result = self->_private.frontFaceStencil;
  if (!result)
  {
    id result = objc_alloc_init(MTLStencilDescriptorInternal);
    self->_private.frontFaceStencil = (MTLStencilDescriptorInternal *)result;
  }
  return result;
}

- (id)backFaceStencil
{
  p_private = &self->_private;
  id result = self->_private.backFaceStencil;
  if (!result)
  {
    id result = objc_alloc_init(MTLStencilDescriptorInternal);
    p_private->backFaceStencil = (MTLStencilDescriptorInternal *)result;
  }
  return result;
}

- (unint64_t)depthCompareFunction
{
  return self->_private.depthCompareFunction;
}

- (id)label
{
  return self->_private.label;
}

- (BOOL)isDepthWriteEnabled
{
  return self->_private.depthWriteEnabled;
}

- (void)setDepthCompareFunction:(unint64_t)a3
{
  self->_private.depthCompareFunction = a3;
}

- (void)setDepthWriteEnabled:(BOOL)a3
{
  self->_private.depthWriteEnabled = a3;
}

- (MTLDepthStencilDescriptorInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLDepthStencilDescriptorInternal;
  id result = [(MTLDepthStencilDescriptorInternal *)&v3 init];
  if (result)
  {
    result->_private.depthCompareFunction = 7;
    result->_private.depthWriteEnabled = 0;
    result->_private.label = 0;
  }
  return result;
}

- (void)dealloc
{
  p_private = &self->_private;

  v4.receiver = self;
  v4.super_class = (Class)MTLDepthStencilDescriptorInternal;
  [(MTLDepthStencilDescriptorInternal *)&v4 dealloc];
}

- (unint64_t)hash
{
  p_private = &self->_private;
  unint64_t v3 = [(MTLStencilDescriptorInternal *)self->_private.backFaceStencil hash];
  unint64_t v4 = p_private->depthWriteEnabled | (2 * p_private->depthCompareFunction);
  v6[1] = v3;
  v6[2] = v4;
  v6[3] = [(NSString *)p_private->label hash];
  return _MTLHashState((int *)v6, 0x20uLL);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  uint64_t v16 = v8;
  uint64_t v17 = v7;
  uint64_t v18 = v6;
  uint64_t v19 = v5;
  uint64_t v20 = v4;
  uint64_t v21 = v3;
  Class = object_getClass(self);
  BOOL result = 0;
  if (Class == object_getClass(a3)
    && (!self->_private.frontFaceStencil && !*((void *)a3 + 1)
     || objc_msgSend(-[MTLDepthStencilDescriptorInternal frontFaceStencil](self, "frontFaceStencil", v8, v7, v6, v19, v20, v21, v9, v10), "isEqual:", objc_msgSend(a3, "frontFaceStencil")))&& (!self->_private.backFaceStencil && !*((void *)a3 + 2)|| objc_msgSend(-[MTLDepthStencilDescriptorInternal backFaceStencil](self, "backFaceStencil", v16,
                          v17,
                          v18,
                          v19,
                          v20,
                          v21),
                        "isEqual:",
                        [a3 backFaceStencil]))
    && self->_private.depthCompareFunction == *((void *)a3 + 3)
    && self->_private.depthWriteEnabled == *((unsigned __int8 *)a3 + 32))
  {
    label = self->_private.label;
    if (label == *((NSString **)a3 + 5) || (-[NSString isEqual:](label, "isEqual:") & 1) != 0) {
      return 1;
    }
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if (v5)
  {
    if (self->_private.frontFaceStencil) {
      *(void *)(v5 + 8) = [(MTLStencilDescriptorInternal *)self->_private.frontFaceStencil copyWithZone:a3];
    }
    backFaceStencil = self->_private.backFaceStencil;
    if (backFaceStencil) {
      *(void *)(v6 + 16) = [(MTLStencilDescriptorInternal *)backFaceStencil copyWithZone:a3];
    }
    *(void *)(v6 + 24) = self->_private.depthCompareFunction;
    *(unsigned char *)(v6 + 32) = self->_private.depthWriteEnabled;
    *(void *)(v6 + 40) = [(NSString *)self->_private.label copyWithZone:a3];
  }
  return (id)v6;
}

- (const)depthStencilPrivate
{
  return &self->_private;
}

- (id)formattedDescription:(unint64_t)a3
{
  v19[12] = *MEMORY[0x1E4F143B8];
  unint64_t v5 = a3 + 4;
  uint64_t v6 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v19[0] = [@"\n" stringByPaddingToLength:a3 + 8 withString:@" " startingAtIndex:0];
  v19[1] = @"stencilCompareFunction        = MTLCompareFunctionAlways";
  v19[2] = v19[0];
  v19[3] = @"stencilFailOperation          = MTLStencilOperationKeep";
  v19[4] = v19[0];
  v19[5] = @"stencilPassDepthFailOperation = MTLStencilOperationKeep";
  v19[6] = v19[0];
  v19[7] = @"stencilPassDepthPassOperation = MTLStencilOperationKeep";
  v19[8] = v19[0];
  v19[9] = @"stencilReadMask               = 0xffffffff";
  v19[10] = v19[0];
  v19[11] = @"stencilWriteMask              = 0xffffffff";
  uint64_t v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 12), "componentsJoinedByString:", @" ");
  uint64_t v8 = NSString;
  v17.receiver = self;
  v17.super_class = (Class)MTLDepthStencilDescriptorInternal;
  id v9 = [(MTLDepthStencilDescriptorInternal *)&v17 description];
  v18[0] = v6;
  v18[1] = @"label =";
  p_private = &self->_private;
  label = (__CFString *)p_private->label;
  if (!label) {
    label = @"<none>";
  }
  v18[2] = label;
  v18[3] = v6;
  v18[4] = @"depthCompareFunction =";
  unint64_t depthCompareFunction = p_private->depthCompareFunction;
  if (depthCompareFunction > 7) {
    v13 = @"Unknown";
  }
  else {
    v13 = off_1E5222068[depthCompareFunction];
  }
  v18[5] = v13;
  v18[6] = v6;
  v18[7] = @"depthWriteEnabled =";
  v18[8] = [NSNumber numberWithBool:p_private->depthWriteEnabled];
  v18[9] = v6;
  v18[10] = @"frontFace:";
  uint64_t v14 = v7;
  if (p_private->frontFaceStencil) {
    uint64_t v14 = [(MTLStencilDescriptorInternal *)p_private->frontFaceStencil formattedDescription:v5];
  }
  v18[11] = v14;
  v18[12] = v6;
  v18[13] = @"backFace:";
  backFaceStencil = p_private->backFaceStencil;
  if (backFaceStencil) {
    uint64_t v7 = [(MTLStencilDescriptorInternal *)backFaceStencil formattedDescription:v5];
  }
  v18[14] = v7;
  return (id)[v8 stringWithFormat:@"%@%@", v9, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v18, 15), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLDepthStencilDescriptorInternal *)self formattedDescription:0];
}

- (void)setLabel:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      goto LABEL_3;
    }
    v11 = @"label is not a NSString.";
    unint64_t v12 = 1;
    uint64_t v13 = 454;
  }
  else
  {
    v11 = @"label must not be nil.";
    unint64_t v12 = 0;
    uint64_t v13 = 451;
  }
  MTLReportFailure(v12, "-[MTLDepthStencilDescriptorInternal setLabel:]", v13, (uint64_t)v11, v3, v4, v5, v6, v14);
LABEL_3:
  p_private = &self->_private;
  label = p_private->label;
  if (label != a3)
  {

    p_private->label = (NSString *)[a3 copy];
  }
}

@end