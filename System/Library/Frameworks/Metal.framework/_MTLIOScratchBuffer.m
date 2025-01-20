@interface _MTLIOScratchBuffer
- (MTLBuffer)buffer;
- (id)init:(MTLIOScratchBufferPrivate *)a3;
- (void)dealloc;
@end

@implementation _MTLIOScratchBuffer

- (MTLBuffer)buffer
{
  return (MTLBuffer *)self->_priv->var1;
}

- (id)init:(MTLIOScratchBufferPrivate *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_MTLIOScratchBuffer;
  v4 = [(_MTLIOScratchBuffer *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_priv = a3;
    id v6 = a3->var1;
    id v7 = v5->_priv->var2;
  }
  return v5;
}

- (void)dealloc
{
  priv = self->_priv;
  id var1 = priv->var1;
  id var2 = priv->var2;
  objc_msgSend(var2, "returnPriv:");

  v6.receiver = self;
  v6.super_class = (Class)_MTLIOScratchBuffer;
  [(_MTLIOScratchBuffer *)&v6 dealloc];
}

@end