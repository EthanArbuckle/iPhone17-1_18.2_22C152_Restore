@interface MTLFunctionStitchingFunctionNodeSPI
- (BOOL)isEarlyReturn;
- (BOOL)isEqual:(id)a3;
- (MTLFunctionStitchingFunctionNodeSPI)initWithName:(id)a3 arguments:(id)a4 controlDependencies:(id)a5 isEarlyReturn:(BOOL)a6;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)setIsEarlyReturn:(BOOL)a3;
@end

@implementation MTLFunctionStitchingFunctionNodeSPI

- (MTLFunctionStitchingFunctionNodeSPI)initWithName:(id)a3 arguments:(id)a4 controlDependencies:(id)a5 isEarlyReturn:(BOOL)a6
{
  v8.receiver = self;
  v8.super_class = (Class)MTLFunctionStitchingFunctionNodeSPI;
  result = [(MTLFunctionStitchingFunctionNode *)&v8 initWithName:a3 arguments:a4 controlDependencies:a5];
  result->_isEarlyReturn = a6;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MTLFunctionStitchingFunctionNodeSPI;
  id v4 = [(MTLFunctionStitchingFunctionNode *)&v6 copyWithZone:a3];
  [v4 setIsEarlyReturn:self->_isEarlyReturn];
  return v4;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    uint64_t v12 = v3;
    uint64_t v13 = v4;
    Class = object_getClass(self);
    if (Class == object_getClass(a3))
    {
      v11.receiver = self;
      v11.super_class = (Class)MTLFunctionStitchingFunctionNodeSPI;
      unsigned int v8 = [(MTLFunctionStitchingFunctionNode *)&v11 isEqual:a3];
      if (v8)
      {
        BOOL v9 = [(MTLFunctionStitchingFunctionNodeSPI *)self isEarlyReturn];
        LOBYTE(v8) = v9 ^ [a3 isEarlyReturn] ^ 1;
      }
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }
  return v8;
}

- (unint64_t)hash
{
  bzero(v7, 0x10uLL);
  v6.receiver = self;
  v6.super_class = (Class)MTLFunctionStitchingFunctionNodeSPI;
  id v3 = [(MTLFunctionStitchingFunctionNode *)&v6 hash];
  BOOL isEarlyReturn = self->_isEarlyReturn;
  v7[0] = v3;
  v7[1] = isEarlyReturn;
  return _MTLHashState((int *)v7, 0x10uLL);
}

- (BOOL)isEarlyReturn
{
  return self->_isEarlyReturn;
}

- (void)setIsEarlyReturn:(BOOL)a3
{
  self->_BOOL isEarlyReturn = a3;
}

@end