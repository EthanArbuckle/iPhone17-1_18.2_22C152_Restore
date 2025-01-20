@interface MTLVisibleFunctionTableDescriptorInternal
+ (id)allocWithZone:(_NSZone *)a3;
- (BOOL)forceResourceIndex;
- (BOOL)isEqual:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)functionCount;
- (unint64_t)hash;
- (unint64_t)resourceIndex;
- (void)setForceResourceIndex:(BOOL)a3;
- (void)setFunctionCount:(unint64_t)a3;
- (void)setResourceIndex:(unint64_t)a3;
@end

@implementation MTLVisibleFunctionTableDescriptorInternal

- (void)setFunctionCount:(unint64_t)a3
{
  self->_private.functionCount = a3;
}

- (unint64_t)functionCount
{
  return self->_private.functionCount;
}

- (unint64_t)resourceIndex
{
  return self->_private.resourceIndex;
}

+ (id)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return +[MTLVisibleFunctionTableDescriptorInternal allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___MTLVisibleFunctionTableDescriptorInternal;
    return objc_msgSendSuper2(&v6, sel_allocWithZone_, a3);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (result)
  {
    *((void *)result + 1) = self->_private.functionCount;
    *((unsigned char *)result + 16) = self->_private.forceResourceIndex;
    *((void *)result + 3) = self->_private.resourceIndex;
  }
  return result;
}

- (BOOL)forceResourceIndex
{
  return self->_private.forceResourceIndex;
}

- (void)setForceResourceIndex:(BOOL)a3
{
  self->_private.forceResourceIndex = a3;
}

- (void)setResourceIndex:(unint64_t)a3
{
  self->_private.resourceIndex = a3;
}

- (unint64_t)hash
{
  uint64_t v2 = -(uint64_t)self->_private.forceResourceIndex;
  v4[0] = self->_private.functionCount;
  v4[1] = v2;
  v4[2] = self->_private.resourceIndex;
  return _MTLHashState((int *)v4, 0x18uLL);
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  return Class == object_getClass(a3)
      && self->_private.functionCount == *((void *)a3 + 1)
      && self->_private.forceResourceIndex == *((unsigned __int8 *)a3 + 16)
      && self->_private.resourceIndex == *((void *)a3 + 3);
}

- (id)formattedDescription:(unint64_t)a3
{
  v11[9] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [@"\n" stringByPaddingToLength:a3 + 4 withString:@" " startingAtIndex:0];
  v5 = NSString;
  v10.receiver = self;
  v10.super_class = (Class)MTLVisibleFunctionTableDescriptorInternal;
  id v6 = [(MTLVisibleFunctionTableDescriptorInternal *)&v10 description];
  v11[0] = v4;
  v11[1] = @"functionCount =";
  p_private = &self->_private;
  v11[2] = [NSNumber numberWithUnsignedInteger:p_private->functionCount];
  v11[3] = v4;
  v8 = @"NO";
  if (p_private->forceResourceIndex) {
    v8 = @"YES";
  }
  v11[4] = @"forceResourceIndex =";
  v11[5] = v8;
  v11[6] = v4;
  v11[7] = @"resourceIndex =";
  v11[8] = [NSNumber numberWithUnsignedLongLong:p_private->resourceIndex];
  return (id)[v5 stringWithFormat:@"%@%@", v6, objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v11, 9), "componentsJoinedByString:", @" "];
}

- (id)description
{
  return [(MTLVisibleFunctionTableDescriptorInternal *)self formattedDescription:0];
}

@end