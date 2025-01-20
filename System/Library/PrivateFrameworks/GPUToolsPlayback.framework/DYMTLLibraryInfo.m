@interface DYMTLLibraryInfo
- (DYMTLLibraryInfo)initWithType:(unint64_t)a3 code:(id)a4 compileOptions:(id)a5;
- (MTLCompileOptions)compileOptions;
- (id)code;
- (unint64_t)type;
@end

@implementation DYMTLLibraryInfo

- (DYMTLLibraryInfo)initWithType:(unint64_t)a3 code:(id)a4 compileOptions:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)DYMTLLibraryInfo;
  v11 = [(DYMTLLibraryInfo *)&v14 init];
  v12 = v11;
  if (v11)
  {
    v11->_type = a3;
    objc_storeStrong(&v11->_code, a4);
    objc_storeStrong((id *)&v12->_compileOptions, a5);
  }

  return v12;
}

- (unint64_t)type
{
  return self->_type;
}

- (id)code
{
  return self->_code;
}

- (MTLCompileOptions)compileOptions
{
  return self->_compileOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_compileOptions, 0);
  objc_storeStrong(&self->_code, 0);
}

@end