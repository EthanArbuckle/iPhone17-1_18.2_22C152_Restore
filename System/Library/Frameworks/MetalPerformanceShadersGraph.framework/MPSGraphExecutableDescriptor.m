@interface MPSGraphExecutableDescriptor
- (MPSGraphCompilationDescriptor)compilationDescriptor;
- (MPSGraphExecutableDescriptor)init;
- (id)variableFetchHandler;
- (unint64_t)compilerOptions;
- (void)setCompilationDescriptor:(id)a3;
- (void)setCompilerOptions:(unint64_t)a3;
- (void)setVariableFetchHandler:(id)a3;
@end

@implementation MPSGraphExecutableDescriptor

- (MPSGraphExecutableDescriptor)init
{
  v6.receiver = self;
  v6.super_class = (Class)MPSGraphExecutableDescriptor;
  v2 = [(MPSGraphExecutableDescriptor *)&v6 init];
  uint64_t v3 = objc_opt_new();
  compilationDescriptor = v2->_compilationDescriptor;
  v2->_compilationDescriptor = (MPSGraphCompilationDescriptor *)v3;

  return v2;
}

- (void)setCompilerOptions:(unint64_t)a3
{
}

- (unint64_t)compilerOptions
{
  return [(MPSGraphCompilationDescriptor *)self->_compilationDescriptor compilerOptions];
}

- (id)variableFetchHandler
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setVariableFetchHandler:(id)a3
{
}

- (MPSGraphCompilationDescriptor)compilationDescriptor
{
  return (MPSGraphCompilationDescriptor *)objc_getProperty(self, a2, 16, 1);
}

- (void)setCompilationDescriptor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compilationDescriptor, 0);

  objc_storeStrong(&self->_variableFetchHandler, 0);
}

@end