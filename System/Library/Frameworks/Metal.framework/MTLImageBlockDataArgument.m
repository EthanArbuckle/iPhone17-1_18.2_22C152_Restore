@interface MTLImageBlockDataArgument
- (BOOL)aliasImplicitImageBlock;
- (BOOL)isEqual:(id)a3;
- (MTLImageBlockDataArgument)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 isActive:(BOOL)a6 index:(unint64_t)a7 dataSize:(unsigned int)a8 masterStructMembers:(id)a9 aliasImplicitImageBlock:(BOOL)a10 aliasImplicitImageBlockRenderTarget:(unsigned int)a11;
- (id)imageBlockMasterStructMembers;
- (unint64_t)aliasImplicitImageBlockRenderTarget;
- (unint64_t)imageBlockDataSize;
- (void)dealloc;
- (void)setStructType:(id)a3;
@end

@implementation MTLImageBlockDataArgument

- (MTLImageBlockDataArgument)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 isActive:(BOOL)a6 index:(unint64_t)a7 dataSize:(unsigned int)a8 masterStructMembers:(id)a9 aliasImplicitImageBlock:(BOOL)a10 aliasImplicitImageBlockRenderTarget:(unsigned int)a11
{
  v14.receiver = self;
  v14.super_class = (Class)MTLImageBlockDataArgument;
  v12 = [(MTLBindingInternal *)&v14 initWithName:a3 type:a4 access:a5 index:a7 active:a6 arrayLength:1];
  v12->_dataSize = a8;
  v12->_aliasImplicitImageBlock = a10;
  v12->_aliasImplicitImageBlockRenderTarget = a11;
  v12->_masterStructMembers = (MTLStructTypeInternal *)a9;
  return v12;
}

- (void)dealloc
{
  self->_masterStructMembers = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLImageBlockDataArgument;
  [(MTLBindingInternal *)&v3 dealloc];
}

- (unint64_t)imageBlockDataSize
{
  return self->_dataSize;
}

- (id)imageBlockMasterStructMembers
{
  return self->_masterStructMembers;
}

- (BOOL)aliasImplicitImageBlock
{
  return self->_aliasImplicitImageBlock;
}

- (unint64_t)aliasImplicitImageBlockRenderTarget
{
  return self->_aliasImplicitImageBlockRenderTarget;
}

- (void)setStructType:(id)a3
{
  self->super._typeInfo = (MTLType *)a3;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && self->_dataSize == *((_DWORD *)a3 + 42)
      && self->_aliasImplicitImageBlock == *((unsigned __int8 *)a3 + 184)
      && self->_aliasImplicitImageBlockRenderTarget == *((_DWORD *)a3 + 47))
    {
      masterStructMembers = self->_masterStructMembers;
      if (!((unint64_t)masterStructMembers | *((void *)a3 + 22))
        || (BOOL v6 = -[MTLStructTypeInternal isEqual:](masterStructMembers, "isEqual:")))
      {
        v8.receiver = self;
        v8.super_class = (Class)MTLImageBlockDataArgument;
        LOBYTE(v6) = [(MTLBindingInternal *)&v8 isEqual:a3];
      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }
  return v6;
}

@end