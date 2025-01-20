@interface RPBItem_Delegate
- (BOOL)respondsToSelector:(SEL)a3;
- (id).cxx_construct;
- (void)getRemoteProcessingBlockParameter:(float *)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 object:(id)a7 withError:(id *)a8;
- (void)getRemoteProcessingBlockParameterInfo:(id)a3 forScope:(unsigned int)a4 object:(id)a5 withError:(id *)a6;
- (void)getRemoteProcessingBlockProperty:(id *)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 object:(id)a7 withError:(id *)a8;
- (void)getRemoteProcessingBlockPropertyInfo:(id)a3 forScope:(unsigned int)a4 object:(id)a5 withError:(id *)a6;
- (void)setRemoteProcessingBlockParameter:(float)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 object:(id)a7 withError:(id *)a8;
- (void)setRemoteProcessingBlockProperty:(id)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 object:(id)a7 withError:(id *)a8;
@end

@implementation RPBItem_Delegate

- (BOOL)respondsToSelector:(SEL)a3
{
  if (sel_getRemoteProcessingBlockParameterInfo_forScope_object_withError_ == a3)
  {
    f = self->get_parameter_info_callback.__f_.__f_;
  }
  else if (sel_getRemoteProcessingBlockParameter_forID_scope_element_object_withError_ == a3)
  {
    f = self->get_parameter_callback.__f_.__f_;
  }
  else if (sel_setRemoteProcessingBlockParameter_forID_scope_element_object_withError_ == a3)
  {
    f = self->set_parameter_callback.__f_.__f_;
  }
  else if (sel_getRemoteProcessingBlockPropertyInfo_forScope_object_withError_ == a3)
  {
    f = self->get_property_info_callback.__f_.__f_;
  }
  else if (sel_getRemoteProcessingBlockProperty_forID_scope_element_object_withError_ == a3)
  {
    f = self->get_property_callback.__f_.__f_;
  }
  else
  {
    if (sel_setRemoteProcessingBlockProperty_forID_scope_element_object_withError_ != a3)
    {
      v5.receiver = self;
      v5.super_class = (Class)RPBItem_Delegate;
      return -[RPBItem_Delegate respondsToSelector:](&v5, sel_respondsToSelector_);
    }
    f = self->set_property_callback.__f_.__f_;
  }
  return f != 0;
}

- (void)getRemoteProcessingBlockParameterInfo:(id)a3 forScope:(unsigned int)a4 object:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a4 >= 8)
  {
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    v20 = std::bad_cast::bad_cast(exception);
  }
  std::function<vp::Expected<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error> ()(vp::rpb::Scope)>::operator()((uint64_t)&self->get_parameter_info_callback, a4);
  if (v21[32])
  {
    uint64_t v12 = caulk::expected<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::value((uint64_t)v21);
    v13 = *(id **)v12;
    v14 = *(unsigned int **)(v12 + 8);
    if (*(unsigned int **)v12 != v14)
    {
      do
      {
        v15 = [MEMORY[0x1E4F95DE8] createWithParameterID:*(unsigned int *)v13];
        id v16 = v13[1];
        [v15 setName:v16];

        id v17 = v13[2];
        [v15 setDescription:v17];

        [v15 setReadable:*((unsigned __int8 *)v13 + 24)];
        [v15 setWritable:*((unsigned __int8 *)v13 + 25)];
        v18 = (void *)[v15 copy];
        [v10 addObject:v18];

        v13 += 4;
      }
      while (v13 != (id *)v14);
    }
  }
  caulk::__expected_detail::base<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::base((uint64_t)v22, (uint64_t)v21);
  if (!v23 && a6 && v22[0]) {
    *a6 = vp::rpb::Object::objc_self(v22);
  }
  caulk::__expected_detail::base<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::base((uint64_t)v24, (uint64_t)v22);
  caulk::__expected_detail::base<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::~base((vp::objc::ID *)v24);
  caulk::__expected_detail::base<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::~base((vp::objc::ID *)v22);
  caulk::__expected_detail::base<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::~base((vp::objc::ID *)v21);
}

- (void)getRemoteProcessingBlockParameter:(float *)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 object:(id)a7 withError:(id *)a8
{
  id v14 = a7;
  if (a5 >= 8)
  {
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    v18 = std::bad_cast::bad_cast(exception);
  }
  std::function<vp::Expected<float,vp::rpb::Error> ()(unsigned int,vp::rpb::Scope,unsigned int)>::operator()((uint64_t)&self->get_parameter_callback, a4, a5, a6);
  if (v20)
  {
    v15 = (float *)caulk::expected<float,vp::rpb::Error>::value((uint64_t)&v19);
    if (a3) {
      *a3 = *v15;
    }
    char v16 = v20;
    LOBYTE(v21) = 0;
    char v22 = v20;
    if (v20)
    {
      LODWORD(v21) = v19;
LABEL_10:
      char v24 = v16;
LABEL_11:
      int v23 = (int)v21;
      goto LABEL_12;
    }
  }
  else
  {
    LOBYTE(v21) = 0;
    char v22 = 0;
  }
  vp::objc::ID::ID(&v21, &v19);
  if (v22)
  {
    char v16 = 1;
    goto LABEL_10;
  }
  if (a8 && v21)
  {
    *a8 = vp::rpb::Object::objc_self(&v21);
    LOBYTE(v23) = 0;
    char v24 = v22;
    if (v22) {
      goto LABEL_11;
    }
  }
  else
  {
    LOBYTE(v23) = 0;
    char v24 = 0;
  }
  vp::objc::ID::ID(&v23, &v21);
  if (!v24) {
    vp::objc::ID::~ID((vp::objc::ID *)&v23);
  }
LABEL_12:
  if (!v22) {
    vp::objc::ID::~ID((vp::objc::ID *)&v21);
  }
  if (!v20) {
    vp::objc::ID::~ID((vp::objc::ID *)&v19);
  }
}

- (void)setRemoteProcessingBlockParameter:(float)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 object:(id)a7 withError:(id *)a8
{
  id v14 = a7;
  if (a5 >= 8)
  {
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    char v16 = std::bad_cast::bad_cast(exception);
  }
  std::function<vp::Expected<void,vp::rpb::Error> ()(unsigned int,vp::rpb::Scope,unsigned int,float)>::operator()((uint64_t)&self->set_parameter_callback, a4, a5, a6, a3);
  id v17 = a8;
  vp::Expected<void,vp::rpb::Error>::on_error<vp::rpb::handle_error(NSError * {__autoreleasing}*)::{lambda(vp::rpb::Error const&)#1}>(&v18, &v17, v20);
  if (!v20[8]) {
    vp::objc::ID::~ID((vp::objc::ID *)v20);
  }
  if (!v19) {
    vp::objc::ID::~ID((vp::objc::ID *)&v18);
  }
}

- (void)getRemoteProcessingBlockPropertyInfo:(id)a3 forScope:(unsigned int)a4 object:(id)a5 withError:(id *)a6
{
  id v10 = a3;
  id v11 = a5;
  if (a4 >= 8)
  {
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    char v20 = std::bad_cast::bad_cast(exception);
  }
  std::function<vp::Expected<std::vector<vp::rpb::Property_Info,vp::Allocator<vp::rpb::Property_Info>>,vp::rpb::Error> ()(vp::rpb::Scope)>::operator()((uint64_t)&self->get_property_info_callback, a4);
  if (v21[32])
  {
    uint64_t v12 = caulk::expected<std::vector<vp::rpb::Property_Info,vp::Allocator<vp::rpb::Property_Info>>,vp::rpb::Error>::value((uint64_t)v21);
    v13 = *(id **)v12;
    id v14 = *(unsigned int **)(v12 + 8);
    if (*(unsigned int **)v12 != v14)
    {
      do
      {
        v15 = [MEMORY[0x1E4F95DF0] createWithPropertyID:*(unsigned int *)v13];
        id v16 = v13[1];
        [v15 setName:v16];

        id v17 = v13[2];
        [v15 setDescription:v17];

        [v15 setReadable:*((unsigned __int8 *)v13 + 24)];
        [v15 setWritable:*((unsigned __int8 *)v13 + 25)];
        id v18 = (void *)[v15 copy];
        [v10 addObject:v18];

        v13 += 4;
      }
      while (v13 != (id *)v14);
    }
  }
  caulk::__expected_detail::base<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::base((uint64_t)v22, (uint64_t)v21);
  if (!v23 && a6 && v22[0]) {
    *a6 = vp::rpb::Object::objc_self(v22);
  }
  caulk::__expected_detail::base<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error>::base((uint64_t)v24, (uint64_t)v22);
  caulk::__expected_detail::base<std::vector<vp::rpb::Property_Info,vp::Allocator<vp::rpb::Property_Info>>,vp::rpb::Error>::~base((vp::objc::ID *)v24);
  caulk::__expected_detail::base<std::vector<vp::rpb::Property_Info,vp::Allocator<vp::rpb::Property_Info>>,vp::rpb::Error>::~base((vp::objc::ID *)v22);
  caulk::__expected_detail::base<std::vector<vp::rpb::Property_Info,vp::Allocator<vp::rpb::Property_Info>>,vp::rpb::Error>::~base((vp::objc::ID *)v21);
}

- (void)getRemoteProcessingBlockProperty:(id *)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 object:(id)a7 withError:(id *)a8
{
  id v14 = a7;
  if (a5 >= 8)
  {
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    char v19 = std::bad_cast::bad_cast(exception);
  }
  std::function<vp::Expected<applesauce::CF::TypeRef,vp::rpb::Error> ()(unsigned int,vp::rpb::Scope,unsigned int)>::operator()((uint64_t)&self->get_property_callback, a4, a5, a6);
  if (v21)
  {
    v15 = (void **)caulk::expected<applesauce::CF::TypeRef,vp::rpb::Error>::value((uint64_t)&v20);
    id v16 = *v15;
    void *v15 = 0;
    if (a3)
    {
      *a3 = v16;
    }
    else if (v16)
    {
      CFRelease(v16);
    }
    char v17 = v21;
    LOBYTE(v22) = 0;
    char v23 = v21;
    if (v21)
    {
      char v22 = v20;
      char v20 = 0;
      goto LABEL_12;
    }
  }
  else
  {
    LOBYTE(v22) = 0;
    char v23 = 0;
  }
  vp::objc::ID::ID(&v22, &v20);
  if (!v23)
  {
    if (a8 && v22)
    {
      *a8 = vp::rpb::Object::objc_self((id *)&v22);
      LOBYTE(v24) = 0;
      char v25 = v23;
      if (v23) {
        goto LABEL_13;
      }
    }
    else
    {
      LOBYTE(v24) = 0;
      char v25 = 0;
    }
    vp::objc::ID::ID(&v24, &v22);
    goto LABEL_14;
  }
  char v17 = 1;
LABEL_12:
  char v25 = v17;
LABEL_13:
  char v24 = v22;
  char v22 = 0;
LABEL_14:
  caulk::__expected_detail::base<applesauce::CF::TypeRef,vp::rpb::Error>::~base(&v24);
  caulk::__expected_detail::base<applesauce::CF::TypeRef,vp::rpb::Error>::~base(&v22);
  caulk::__expected_detail::base<applesauce::CF::TypeRef,vp::rpb::Error>::~base(&v20);
}

- (void)setRemoteProcessingBlockProperty:(id)a3 forID:(unsigned int)a4 scope:(unsigned int)a5 element:(unsigned int)a6 object:(id)a7 withError:(id *)a8
{
  id v14 = a3;
  id v15 = a7;
  if (v14)
  {
    CFRetain(v14);
    id v23 = v14;
    if (a5 < 8)
    {
      CFRetain(v14);
      goto LABEL_5;
    }
LABEL_14:
    exception = (std::bad_cast *)__cxa_allocate_exception(8uLL);
    char v17 = std::bad_cast::bad_cast(exception);
  }
  id v23 = 0;
  if (a5 >= 8) {
    goto LABEL_14;
  }
LABEL_5:
  CFTypeRef cf = v14;
  std::function<vp::Expected<void,vp::rpb::Error> ()(unsigned int,vp::rpb::Scope,unsigned int,applesauce::CF::TypeRef)>::operator()((uint64_t)&self->set_property_callback, a4, a5, a6);
  id v18 = a8;
  vp::Expected<void,vp::rpb::Error>::on_error<vp::rpb::handle_error(NSError * {__autoreleasing}*)::{lambda(vp::rpb::Error const&)#1}>(&v20, &v18, v22);
  if (!v22[8]) {
    vp::objc::ID::~ID((vp::objc::ID *)v22);
  }
  if (!v21) {
    vp::objc::ID::~ID((vp::objc::ID *)&v20);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v14) {
    CFRelease(v14);
  }
}

- (void).cxx_destruct
{
  std::__function::__value_func<vp::Expected<void,vp::rpb::Error> ()(unsigned int,vp::rpb::Scope,unsigned int,applesauce::CF::TypeRef)>::~__value_func[abi:ne180100](self->set_property_callback.__f_.__buf_.__lx);
  std::__function::__value_func<vp::Expected<applesauce::CF::TypeRef,vp::rpb::Error> ()(unsigned int,vp::rpb::Scope,unsigned int)>::~__value_func[abi:ne180100](self->get_property_callback.__f_.__buf_.__lx);
  std::__function::__value_func<vp::Expected<std::vector<vp::rpb::Property_Info,vp::Allocator<vp::rpb::Property_Info>>,vp::rpb::Error> ()(vp::rpb::Scope)>::~__value_func[abi:ne180100](self->get_property_info_callback.__f_.__buf_.__lx);
  std::__function::__value_func<vp::Expected<void,vp::rpb::Error> ()(unsigned int,vp::rpb::Scope,unsigned int,float)>::~__value_func[abi:ne180100](self->set_parameter_callback.__f_.__buf_.__lx);
  std::__function::__value_func<vp::Expected<float,vp::rpb::Error> ()(unsigned int,vp::rpb::Scope,unsigned int)>::~__value_func[abi:ne180100](self->get_parameter_callback.__f_.__buf_.__lx);

  std::__function::__value_func<vp::Expected<std::vector<vp::rpb::Parameter_Info,vp::Allocator<vp::rpb::Parameter_Info>>,vp::rpb::Error> ()(vp::rpb::Scope)>::~__value_func[abi:ne180100](self->get_parameter_info_callback.__f_.__buf_.__lx);
}

- (id).cxx_construct
{
  *((void *)self + 4) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 12) = 0;
  *((void *)self + 16) = 0;
  *((void *)self + 20) = 0;
  *((void *)self + 24) = 0;
  return self;
}

@end