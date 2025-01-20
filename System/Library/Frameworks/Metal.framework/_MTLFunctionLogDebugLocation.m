@interface _MTLFunctionLogDebugLocation
- (NSString)description;
- (NSString)functionName;
- (NSURL)URL;
- (_MTLFunctionLogDebugLocation)initWithDebugLocation:(id)a3;
- (unint64_t)column;
- (unint64_t)line;
- (void)dealloc;
@end

@implementation _MTLFunctionLogDebugLocation

- (_MTLFunctionLogDebugLocation)initWithDebugLocation:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_MTLFunctionLogDebugLocation;
  v4 = [(_MTLFunctionLogDebugLocation *)&v8 init];
  v5 = (MTLDebugLocation *)a3;
  v4->_debugLocation = v5;
  uint64_t v6 = [(MTLDebugSubProgram *)[(MTLDebugLocation *)v5 scope] filename];
  if (v6) {
    v4->_URL = (NSURL *)[objc_alloc(MEMORY[0x1E4F1CB10]) initFileURLWithPath:v6];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)_MTLFunctionLogDebugLocation;
  [(_MTLFunctionLogDebugLocation *)&v3 dealloc];
}

- (NSString)functionName
{
  v2 = [(MTLDebugLocation *)self->_debugLocation scope];

  return [(MTLDebugSubProgram *)v2 name];
}

- (unint64_t)line
{
  return [(MTLDebugLocation *)self->_debugLocation line];
}

- (unint64_t)column
{
  return [(MTLDebugLocation *)self->_debugLocation column];
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"%@() - %@:%u:%u", -[MTLDebugSubProgram name](-[MTLDebugLocation scope](self->_debugLocation, "scope"), "name"), -[NSURL path](self->_URL, "path"), -[MTLDebugLocation line](self->_debugLocation, "line"), -[MTLDebugLocation column](self->_debugLocation, "column")];
}

- (NSURL)URL
{
  return self->_URL;
}

@end