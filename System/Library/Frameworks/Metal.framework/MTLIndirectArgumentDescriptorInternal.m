@interface MTLIndirectArgumentDescriptorInternal
+ (id)indirectArgumentDescriptor;
- (BOOL)isEqual:(id)a3;
- (MTLIndirectArgumentDescriptorInternal)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)formattedDescription:(unint64_t)a3;
- (unint64_t)access;
- (unint64_t)arrayLength;
- (unint64_t)constantBlockAlignment;
- (unint64_t)dataType;
- (unint64_t)hash;
- (unint64_t)index;
- (unint64_t)textureType;
- (void)setAccess:(unint64_t)a3;
- (void)setArrayLength:(unint64_t)a3;
- (void)setConstantBlockAlignment:(unint64_t)a3;
- (void)setDataType:(unint64_t)a3;
- (void)setIndex:(unint64_t)a3;
- (void)setTextureType:(unint64_t)a3;
@end

@implementation MTLIndirectArgumentDescriptorInternal

- (void)setDataType:(unint64_t)a3
{
  validateMTLDataType(a3, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
  self->_private.dataType = a3;
}

- (void)setAccess:(unint64_t)a3
{
  validateMTLBindingAccess(a3, (uint64_t)a2, a3, v3, v4, v5, v6, v7);
  self->_private.access = a3;
}

+ (id)indirectArgumentDescriptor
{
  id v2 = objc_alloc_init((Class)objc_opt_class());

  return v2;
}

- (MTLIndirectArgumentDescriptorInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)MTLIndirectArgumentDescriptorInternal;
  result = [(MTLIndirectArgumentDescriptorInternal *)&v3 init];
  if (result)
  {
    *(_OWORD *)&result->_private.dataType = 0u;
    *(_OWORD *)&result->_private.arrayLength = 0u;
    *(_OWORD *)&result->_private.textureType = xmmword_1828F0740;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v6 = *(_OWORD *)&self->_private.arrayLength;
  long long v5 = *(_OWORD *)&self->_private.textureType;
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_private.dataType;
  *(_OWORD *)((char *)result + 24) = v6;
  *(_OWORD *)((char *)result + 40) = v5;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  Class = object_getClass(self);
  return Class == object_getClass(a3) && memcmp(&self->_private, (char *)a3 + 8, 0x30uLL) == 0;
}

- (unint64_t)hash
{
  uint64_t v2 = 0;
  unsigned int v3 = 1193062;
  do
  {
    unsigned int v3 = (1540483477
        * ((1540483477 * *(_DWORD *)((char *)&self->_private.dataType + v2)) ^ ((1540483477
                                                                                             * *(_DWORD *)((char *)&self->_private.dataType + v2)) >> 24))) ^ (1540483477 * v3);
    v2 += 4;
  }
  while (v2 != 48);
  return (1540483477 * (v3 ^ (v3 >> 13))) ^ ((1540483477 * (v3 ^ (v3 >> 13))) >> 15);
}

- (id)formattedDescription:(unint64_t)a3
{
  long long v5 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MTLIndirectArgumentDescriptorInternal;
  id v6 = [(MTLIndirectArgumentDescriptorInternal *)&v8 description];
  return (id)[v5 stringWithFormat:@"%@%@", v6, indirectArgumentFormattedDescription(a3, &self->_private)];
}

- (id)description
{
  return [(MTLIndirectArgumentDescriptorInternal *)self formattedDescription:0];
}

- (unint64_t)dataType
{
  return self->_private.dataType;
}

- (unint64_t)index
{
  return self->_private.index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_private.index = a3;
}

- (unint64_t)arrayLength
{
  return self->_private.arrayLength;
}

- (void)setArrayLength:(unint64_t)a3
{
  self->_private.arrayLength = a3;
}

- (unint64_t)access
{
  return self->_private.access;
}

- (unint64_t)textureType
{
  return self->_private.textureType;
}

- (void)setTextureType:(unint64_t)a3
{
  self->_private.textureType = a3;
}

- (unint64_t)constantBlockAlignment
{
  return self->_private.constantBlockAlignment;
}

- (void)setConstantBlockAlignment:(unint64_t)a3
{
  self->_private.constantBlockAlignment = a3;
}

@end