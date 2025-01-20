@interface ImsNetworkPath
- (ImsNetworkPath)initWithInterface:()basic_string<char delegate:()std:(std::allocator<char>> *)a3 :char_traits<char>;
- (basic_string<char,)ifaceName;
- (id).cxx_construct;
- (void)dealloc;
- (void)evaluateInterface;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation ImsNetworkPath

- (basic_string<char,)ifaceName
{
  if (result[1].__r_.__value_.var0.var0.__data_[7] < 0)
  {
    std::string::__init_copy_ctor_external((std::string *)retstr, *(const std::string::value_type **)&result->__r_.var0, result->var0);
  }
  else
  {
    *(_OWORD *)retstr->__r_.__value_.var0.var0.__data_ = *(_OWORD *)&result->__r_.var0;
    *((void *)&retstr->__r_.__value_.var0.var1 + 2) = result[1].__r_.__value_.var0.var1.__data_;
  }
  return result;
}

- (ImsNetworkPath)initWithInterface:()basic_string<char delegate:()std:(std::allocator<char>> *)a3 :char_traits<char>
{
  v4 = v3;
  v10.receiver = self;
  v10.super_class = (Class)ImsNetworkPath;
  v6 = [(ImsNetworkPath *)&v10 init];
  v7 = v6;
  if (v6)
  {
    pathEvaluator = v6->_pathEvaluator;
    v6->_pathEvaluator = 0;

    std::string::operator=((std::string *)&v7->_ifaceName, (const std::string *)a3);
    v7->_delegate = v4;
    LOBYTE(v7->_ifaceName.__r_.var0) = 0;
  }
  return v7;
}

- (void)evaluateInterface
{
  if (!self->_pathEvaluator)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F38C10]);
    id v4 = objc_alloc(MEMORY[0x1E4F38BF8]);
    p_ifaceName = &self->_ifaceName;
    if (*((char *)&self->_ifaceName.__r_.__value_.var0.var1 + 23) < 0) {
      p_ifaceName = (basic_string<char, std::char_traits<char>, std::allocator<char>> *)p_ifaceName->__r_.__value_.var0.var1.__data_;
    }
    v6 = [NSString stringWithUTF8String:p_ifaceName];
    v7 = (void *)[v4 initWithInterfaceName:v6];
    [v3 setRequiredInterface:v7];

    v8 = (NWPathEvaluator *)[objc_alloc(MEMORY[0x1E4F38C20]) initWithEndpoint:0 parameters:v3];
    pathEvaluator = self->_pathEvaluator;
    self->_pathEvaluator = v8;
  }
  std::string::basic_string[abi:ne180100]<0>(v16, "net");
  std::string::basic_string[abi:ne180100]<0>(__p, "");
  uint64_t v10 = ims::debug((uint64_t)v16, (uint64_t)__p);
  std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(*(void **)(v10 + 8), (uint64_t)"Adding observer for path on interface ", 38);
  *(unsigned char *)(v10 + 17) = 0;
  (*(void (**)(uint64_t, basic_string<char, std::char_traits<char>, std::allocator<char>> *))(*(void *)v10 + 32))(v10, &self->_ifaceName);
  (*(void (**)(uint64_t, void *(*)(void *)))(*(void *)v10 + 64))(v10, std::endl[abi:ne180100]<char,std::char_traits<char>>);
  *(unsigned char *)(v10 + 17) = 0;
  if (v15 < 0) {
    operator delete(__p[0]);
  }
  if (v17 < 0) {
    operator delete(v16[0]);
  }
  v11 = [(NWPathEvaluator *)self->_pathEvaluator path];
  uint64_t v12 = [v11 status];

  if (v12 == 1)
  {
    delegate = self->_delegate;
    if (delegate) {
      (*(void (**)(ImsNetworkPathDelegate *))delegate->var0)(delegate);
    }
  }
  else
  {
    LOBYTE(self->_ifaceName.__r_.var0) = 1;
    [(NWPathEvaluator *)self->_pathEvaluator addObserver:self forKeyPath:@"path" options:5 context:0];
  }
}

- (void)dealloc
{
  self->_delegate = 0;
  pathEvaluator = self->_pathEvaluator;
  if (pathEvaluator && LOBYTE(self->_ifaceName.__r_.var0))
  {
    [(NWPathEvaluator *)pathEvaluator removeObserver:self forKeyPath:@"path"];
    LOBYTE(self->_ifaceName.__r_.var0) = 0;
    pathEvaluator = self->_pathEvaluator;
  }
  self->_pathEvaluator = 0;

  v4.receiver = self;
  v4.super_class = (Class)ImsNetworkPath;
  [(ImsNetworkPath *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v14 = a3;
  id v9 = a4;
  id v10 = a5;
  pathEvaluator = self->_pathEvaluator;
  if (pathEvaluator)
  {
    if (self->_delegate)
    {
      uint64_t v12 = [(NWPathEvaluator *)pathEvaluator path];
      uint64_t v13 = [v12 status];

      if (v13 == 1) {
        ((void (*)(ImsNetworkPathDelegate *))*self->_delegate->var0)(self->_delegate);
      }
    }
  }
}

- (void).cxx_destruct
{
  if (*((char *)&self->_ifaceName.__r_.__value_.var0.var1 + 23) < 0) {
    operator delete(self->_ifaceName.__r_.__value_.var0.var1.__data_);
  }
  objc_storeStrong((id *)&self->_pathEvaluator, 0);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 24) = 0uLL;
  *((void *)self + 5) = 0;
  return self;
}

@end