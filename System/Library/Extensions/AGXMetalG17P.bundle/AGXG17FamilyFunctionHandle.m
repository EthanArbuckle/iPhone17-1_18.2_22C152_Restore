@interface AGXG17FamilyFunctionHandle
- (AGXG17FamilyFunctionHandle)initWithFunctionType:(unint64_t)a3 name:(id)a4 device:(id)a5 handle:(unint64_t)a6 dylib:(id)a7;
- (id).cxx_construct;
- (void)dealloc;
@end

@implementation AGXG17FamilyFunctionHandle

- (id).cxx_construct
{
  *((_OWORD *)self + 2) = xmmword_242EA80A0;
  return self;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)AGXG17FamilyFunctionHandle;
  [(_MTLFunctionHandle *)&v2 dealloc];
}

- (AGXG17FamilyFunctionHandle)initWithFunctionType:(unint64_t)a3 name:(id)a4 device:(id)a5 handle:(unint64_t)a6 dylib:(id)a7
{
  v11.receiver = self;
  v11.super_class = (Class)AGXG17FamilyFunctionHandle;
  result = [(_MTLFunctionHandle *)&v11 initWithFunctionType:a3 name:a4 device:a5];
  if (result)
  {
    result->_impl.function_type = a3;
    result->_impl.value = a6;
    result->_binary_dylib = (AGXG17FamilyDynamicLibrary *)a7;
  }
  return result;
}

@end