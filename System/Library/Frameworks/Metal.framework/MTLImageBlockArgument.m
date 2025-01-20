@interface MTLImageBlockArgument
- (BOOL)aliasImplicitImageBlock;
- (BOOL)isEqual:(id)a3;
- (MTLImageBlockArgument)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 isActive:(BOOL)a6 index:(unint64_t)a7 kind:(unint64_t)a8 dataSize:(unsigned int)a9 masterStructMembers:(id)a10 aliasImplicitImageBlock:(BOOL)a11 aliasImplicitImageBlockRenderTarget:(unsigned int)a12;
- (id)imageBlockMasterStructMembers;
- (unint64_t)aliasImplicitImageBlockRenderTarget;
- (unint64_t)imageBlockDataSize;
- (unint64_t)imageBlockKind;
- (void)dealloc;
- (void)setStructType:(id)a3;
@end

@implementation MTLImageBlockArgument

- (MTLImageBlockArgument)initWithName:(id)a3 type:(unint64_t)a4 access:(unint64_t)a5 isActive:(BOOL)a6 index:(unint64_t)a7 kind:(unint64_t)a8 dataSize:(unsigned int)a9 masterStructMembers:(id)a10 aliasImplicitImageBlock:(BOOL)a11 aliasImplicitImageBlockRenderTarget:(unsigned int)a12
{
  v15.receiver = self;
  v15.super_class = (Class)MTLImageBlockArgument;
  v13 = [(MTLBindingInternal *)&v15 initWithName:a3 type:a4 access:a5 index:a7 active:a6 arrayLength:1];
  v13->_kind = a8;
  v13->_dataSize = a9;
  v13->_masterStructMembers = (MTLStructTypeInternal *)a10;
  v13->_aliasImplicitImageBlock = a11;
  v13->_aliasImplicitImageBlockRenderTarget = a12;
  return v13;
}

- (void)setStructType:(id)a3
{
  self->super._typeInfo = (MTLType *)a3;
}

- (void)dealloc
{
  self->_masterStructMembers = 0;
  v3.receiver = self;
  v3.super_class = (Class)MTLImageBlockArgument;
  [(MTLBindingInternal *)&v3 dealloc];
}

- (unint64_t)imageBlockKind
{
  return self->_kind;
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

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && self->_kind == *((void *)a3 + 21)
      && self->_dataSize == *((_DWORD *)a3 + 44)
      && self->_aliasImplicitImageBlock == *((unsigned __int8 *)a3 + 192)
      && self->_aliasImplicitImageBlockRenderTarget == *((_DWORD *)a3 + 49))
    {
      masterStructMembers = self->_masterStructMembers;
      if (!((unint64_t)masterStructMembers | *((void *)a3 + 23))
        || (BOOL v6 = -[MTLStructTypeInternal isEqual:](masterStructMembers, "isEqual:")))
      {
        v8.receiver = self;
        v8.super_class = (Class)MTLImageBlockArgument;
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