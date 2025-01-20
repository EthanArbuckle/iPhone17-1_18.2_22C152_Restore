@interface MTLDebugSubProgram
- (NSString)filename;
- (NSString)name;
- (unsigned)line;
- (void)releaseInternal;
@end

@implementation MTLDebugSubProgram

- (NSString)filename
{
  return (NSString *)[(MTLDebugInstrumentationData *)self->_data stringForID:self->_debugSubProgram->var0];
}

- (NSString)name
{
  return (NSString *)[(MTLDebugInstrumentationData *)self->_data stringForID:self->_debugSubProgram->var1];
}

- (unsigned)line
{
  return self->_debugSubProgram->var2;
}

- (void)releaseInternal
{
  v2.receiver = self;
  v2.super_class = (Class)MTLDebugSubProgram;
  [(MTLDebugSubProgram *)&v2 release];
}

@end