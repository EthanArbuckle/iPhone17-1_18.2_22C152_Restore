@interface _MTLPipelineCache
- (BOOL)disableRunTimeCompilation;
- (BOOL)writable;
- (MTLCompilerCache)cache;
- (_MTLPipelineCache)initWithFilePath:(id)a3 readOnly:(BOOL)a4 deviceInfo:(const MTLTargetDeviceArch *)a5;
- (void)dealloc;
- (void)setDisableRunTimeCompilation:(BOOL)a3;
- (void)write;
@end

@implementation _MTLPipelineCache

- (void)dealloc
{
  compilerCache = self->_compilerCache;
  if (compilerCache)
  {
    (*((void (**)(MTLCompilerCache *, SEL))compilerCache->var0 + 1))(compilerCache, a2);
    self->_compilerCache = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)_MTLPipelineCache;
  [(_MTLPipelineCache *)&v4 dealloc];
}

- (BOOL)writable
{
  return self->_writable;
}

- (BOOL)disableRunTimeCompilation
{
  return self->_disableRunTimeCompilation;
}

- (MTLCompilerCache)cache
{
  return self->_compilerCache;
}

- (_MTLPipelineCache)initWithFilePath:(id)a3 readOnly:(BOOL)a4 deviceInfo:(const MTLTargetDeviceArch *)a5
{
  v9.receiver = self;
  v9.super_class = (Class)_MTLPipelineCache;
  v7 = [(_MTLPipelineCache *)&v9 init];
  v7->_compilerCache = 0;
  v7->_writable = !a4;
  v7->_disableRunTimeCompilation = 0;
  if (a3)
  {
    [a3 UTF8String];
    MTLCompilerCache::createPipelineDataCache();
  }
  return v7;
}

- (void)write
{
}

- (void)setDisableRunTimeCompilation:(BOOL)a3
{
  self->_disableRunTimeCompilation = a3;
}

@end