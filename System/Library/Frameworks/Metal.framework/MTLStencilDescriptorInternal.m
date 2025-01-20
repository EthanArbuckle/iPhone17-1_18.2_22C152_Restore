@interface MTLStencilDescriptorInternal
- (BOOL)isEqual:(id)a3;
- (MTLStencilDescriptorInternal)init;
- (const)stencilPrivate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)depthFailureOperation;
- (unint64_t)depthStencilPassOperation;
- (unint64_t)hash;
- (unint64_t)stencilCompareFunction;
- (unint64_t)stencilFailureOperation;
- (unsigned)readMask;
- (unsigned)writeMask;
- (void)setDepthFailureOperation:(unint64_t)a3;
- (void)setDepthStencilPassOperation:(unint64_t)a3;
- (void)setReadMask:(unsigned int)a3;
- (void)setStencilCompareFunction:(unint64_t)a3;
- (void)setStencilFailureOperation:(unint64_t)a3;
- (void)setWriteMask:(unsigned int)a3;
@end

@implementation MTLStencilDescriptorInternal

- (unint64_t)stencilFailureOperation
{
  return self->_private.stencilFailureOperation;
}

- (unint64_t)stencilCompareFunction
{
  return self->_private.stencilCompareFunction;
}

- (unint64_t)depthStencilPassOperation
{
  return self->_private.depthStencilPassOperation;
}

- (unint64_t)depthFailureOperation
{
  return self->_private.depthFailureOperation;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    uint64_t v5 = *(void *)&self->_private.readMask;
    long long v6 = *(_OWORD *)&self->_private.depthFailureOperation;
    *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_private.stencilCompareFunction;
    *(_OWORD *)((char *)result + 24) = v6;
    *((void *)result + 5) = v5;
  }
  return result;
}

- (MTLStencilDescriptorInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLStencilDescriptorInternal;
  id result = [(MTLStencilDescriptorInternal *)&v3 init];
  if (result)
  {
    result->_private.stencilCompareFunction = 7;
    result->_private.stencilFailureOperation = 0;
    result->_private.depthFailureOperation = 0;
    result->_private.depthStencilPassOperation = 0;
    *(void *)&result->_private.readMask = -1;
  }
  return result;
}

- (unsigned)writeMask
{
  return self->_private.writeMask;
}

- (unsigned)readMask
{
  return self->_private.readMask;
}

- (void)setStencilCompareFunction:(unint64_t)a3
{
  self->_private.stencilCompareFunction = a3;
}

- (void)setStencilFailureOperation:(unint64_t)a3
{
  self->_private.stencilFailureOperation = a3;
}

- (void)setDepthStencilPassOperation:(unint64_t)a3
{
  self->_private.depthStencilPassOperation = a3;
}

- (void)setWriteMask:(unsigned int)a3
{
  self->_private.writeMask = a3;
}

- (void)setReadMask:(unsigned int)a3
{
  self->_private.readMask = a3;
}

- (void)setDepthFailureOperation:(unint64_t)a3
{
  self->_private.depthFailureOperation = a3;
}

- (unint64_t)hash
{
  return (self->_private.stencilCompareFunction | (8 * self->_private.stencilFailureOperation) | (self->_private.depthFailureOperation << 6) | (self->_private.depthStencilPassOperation << 9)) ^ self->_private.writeMask ^ self->_private.readMask;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  return Class == object_getClass(a3)
      && self->_private.stencilCompareFunction == *((void *)a3 + 1)
      && self->_private.stencilFailureOperation == *((void *)a3 + 2)
      && self->_private.depthFailureOperation == *((void *)a3 + 3)
      && self->_private.depthStencilPassOperation == *((void *)a3 + 4)
      && self->_private.readMask == *((_DWORD *)a3 + 10)
      && self->_private.writeMask == *((_DWORD *)a3 + 11);
}

- (const)stencilPrivate
{
  return &self->_private;
}

- (id)formattedDescription:(unint64_t)a3
{
  v17[18] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  uint64_t v5 = NSString;
  v16.receiver = self;
  v16.super_class = (Class)MTLStencilDescriptorInternal;
  id v6 = [(MTLStencilDescriptorInternal *)&v16 description];
  v17[0] = v4;
  v17[1] = @"stencilCompareFunction        =";
  unint64_t stencilCompareFunction = self->_private.stencilCompareFunction;
  if (stencilCompareFunction > 7) {
    v8 = @"Unknown";
  }
  else {
    v8 = off_1E5222068[stencilCompareFunction];
  }
  v17[2] = v8;
  v17[3] = v4;
  v17[4] = @"stencilFailureOperation       =";
  unint64_t stencilFailureOperation = self->_private.stencilFailureOperation;
  if (stencilFailureOperation > 7) {
    v10 = @"Unknown";
  }
  else {
    v10 = off_1E5222028[stencilFailureOperation];
  }
  v17[5] = v10;
  v17[6] = v4;
  v17[7] = @"stencilPassDepthFailOperation =";
  unint64_t depthFailureOperation = self->_private.depthFailureOperation;
  if (depthFailureOperation > 7) {
    v12 = @"Unknown";
  }
  else {
    v12 = off_1E5222028[depthFailureOperation];
  }
  v17[8] = v12;
  v17[9] = v4;
  v17[10] = @"stencilPassDepthPassOperation =";
  unint64_t depthStencilPassOperation = self->_private.depthStencilPassOperation;
  if (depthStencilPassOperation > 7) {
    v14 = @"Unknown";
  }
  else {
    v14 = off_1E5222028[depthStencilPassOperation];
  }
  v17[11] = v14;
  v17[12] = v4;
  v17[13] = @"stencilReadMask               =";
  v17[14] = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", self->_private.readMask);
  v17[15] = v4;
  v17[16] = @"stencilWriteMask              =";
  v17[17] = objc_msgSend(NSString, "stringWithFormat:", @"0x%x", self->_private.writeMask);
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v17, 18), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLStencilDescriptorInternal *)self formattedDescription:0];
}

@end