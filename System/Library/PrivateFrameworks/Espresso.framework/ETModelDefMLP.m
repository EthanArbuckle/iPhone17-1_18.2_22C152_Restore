@interface ETModelDefMLP
- (int)hidden_size;
- (int)input_size;
- (int)output_size;
- (void)buildNetwork;
- (void)setHidden_size:(int)a3;
- (void)setInput_size:(int)a3;
- (void)setOutput_size:(int)a3;
@end

@implementation ETModelDefMLP

- (void)setOutput_size:(int)a3
{
  self->_output_size = a3;
}

- (int)output_size
{
  return self->_output_size;
}

- (void)setHidden_size:(int)a3
{
  self->_hidden_size = a3;
}

- (int)hidden_size
{
  return self->_hidden_size;
}

- (void)setInput_size:(int)a3
{
  self->_input_size = a3;
}

- (int)input_size
{
  return self->_input_size;
}

- (void)buildNetwork
{
  *(void *)&long long v91 = *MEMORY[0x1E4F143B8];
  LODWORD(v75) = 0;
  Espresso::create_context((int *)&v75, &v83);
  (*(void (**)(uint64_t))(*(void *)v83 + 96))(v83);
  v3 = v84;
  v74[0] = v83;
  v74[1] = (uint64_t)v84;
  if (v84) {
    atomic_fetch_add_explicit(&v84->__shared_owners_, 1uLL, memory_order_relaxed);
  }
  v73[0] = 0;
  v73[1] = 0;
  Espresso::sequential_builder::sequential_builder((uint64_t)&v75, v74, 0, v73);
  if (v3) {
    nitro::nitro_function::nitro_function(v3);
  }
  int v4 = [(ETModelDefMLP *)self hidden_size];
  __asm { FMOV            V8.2S, #1.0 }
  if (v4 < 1)
  {
    char v64 = 0;
    int v66 = -1;
    uint64_t v67 = _D8;
    uint64_t v72 = 0;
    *(void *)&v61[4] = _D8;
    uint64_t v68 = 0;
    uint64_t v62 = 0;
    uint64_t v65 = 0;
    *(_DWORD *)v61 = 0;
    int v63 = 0;
    uint64_t v69 = 0;
    uint64_t v71 = 0;
    uint64_t v70 = 0;
    DWORD1(v60) = [(ETModelDefMLP *)self input_size];
    LODWORD(v60) = [(ETModelDefMLP *)self output_size];
    *((void *)&v60 + 1) = 1;
    std::string::basic_string[abi:ne180100]<0>(v56, "inner_product");
    std::string::basic_string[abi:ne180100]<0>(__p, "ip2");
    std::string::basic_string[abi:ne180100]<0>(&v89, "data");
    v31 = 0;
    v32 = 0;
    v33 = 0;
    *(void *)&long long v87 = &v31;
    BYTE8(v87) = 0;
    v31 = (std::string *)operator new(0x18uLL);
    v32 = v31;
    v33 = v31 + 1;
    v32 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v33, &v89, &v91, v31);
    std::string::basic_string[abi:ne180100]<0>(&v87, "ip2");
    v28 = 0;
    v29 = 0;
    v30 = 0;
    v85 = &v28;
    char v86 = 0;
    v28 = (std::string *)operator new(0x18uLL);
    v29 = v28;
    v30 = v28 + 1;
    v29 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v30, &v87, &v89, v28);
    Espresso::sequential_builder::add<Espresso::inner_product_uniforms>(&v58, &v75, (uint64_t)v56, (uint64_t)__p, (uint64_t)&v60, (uint64_t)v31, (uint64_t)v32, (uint64_t *)&v28);
    v85 = &v28;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v85);
    if (v88 < 0) {
      operator delete((void *)v87);
    }
    *(void *)&long long v87 = &v31;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v87);
    if (v90 < 0) {
      operator delete((void *)v89);
    }
    if (v55 < 0) {
      operator delete(__p[0]);
    }
    if (v57 < 0) {
      operator delete(v56[0]);
    }
    uint64_t v21 = v58;
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)v58 + 424))(&v26, v58);
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v21 + 400))(v21, &v26);
    if (v27) {
      nitro::nitro_function::nitro_function(v27);
    }
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)v21 + 432))(&v24, v21);
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v21 + 392))(v21, &v24);
    v12 = v25;
    if (v25) {
      goto LABEL_31;
    }
  }
  else
  {
    char v64 = 0;
    int v66 = -1;
    uint64_t v67 = _D8;
    uint64_t v72 = 0;
    *(void *)&v61[4] = _D8;
    uint64_t v68 = 0;
    uint64_t v62 = 0;
    uint64_t v65 = 0;
    *(_DWORD *)v61 = 0;
    int v63 = 0;
    uint64_t v69 = 0;
    uint64_t v71 = 0;
    uint64_t v70 = 0;
    DWORD1(v60) = [(ETModelDefMLP *)self input_size];
    LODWORD(v60) = [(ETModelDefMLP *)self hidden_size];
    *((void *)&v60 + 1) = 0x100000001;
    std::string::basic_string[abi:ne180100]<0>(v56, "inner_product");
    std::string::basic_string[abi:ne180100]<0>(__p, "ip1");
    std::string::basic_string[abi:ne180100]<0>(&v89, "data");
    v51 = 0;
    v52 = 0;
    v53 = 0;
    *(void *)&long long v87 = &v51;
    BYTE8(v87) = 0;
    v51 = (std::string *)operator new(0x18uLL);
    v52 = v51;
    v53 = v51 + 1;
    v52 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v53, &v89, &v91, v51);
    std::string::basic_string[abi:ne180100]<0>(&v87, "ip1");
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v85 = &v48;
    char v86 = 0;
    v48 = (std::string *)operator new(0x18uLL);
    v49 = v48;
    v50 = v48 + 1;
    v49 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v50, &v87, &v89, v48);
    Espresso::sequential_builder::add<Espresso::inner_product_uniforms>(&v58, &v75, (uint64_t)v56, (uint64_t)__p, (uint64_t)&v60, (uint64_t)v51, (uint64_t)v52, (uint64_t *)&v48);
    v85 = &v48;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v85);
    if (v88 < 0) {
      operator delete((void *)v87);
    }
    *(void *)&long long v87 = &v51;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v87);
    if (v90 < 0) {
      operator delete((void *)v89);
    }
    if (v55 < 0) {
      operator delete(__p[0]);
    }
    if (v57 < 0) {
      operator delete(v56[0]);
    }
    uint64_t v10 = v58;
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)v58 + 424))(&v46, v58);
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v10 + 400))(v10, &v46);
    if (v47) {
      nitro::nitro_function::nitro_function(v47);
    }
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)v10 + 432))(&v44, v10);
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v10 + 392))(v10, &v44);
    if (v45) {
      nitro::nitro_function::nitro_function(v45);
    }
    if (v59) {
      nitro::nitro_function::nitro_function(v59);
    }
    char v64 = 0;
    int v66 = -1;
    uint64_t v67 = _D8;
    uint64_t v72 = 0;
    long long v60 = xmmword_192DCA240;
    *(void *)&v61[4] = _D8;
    uint64_t v68 = 0;
    uint64_t v62 = 0;
    uint64_t v65 = 0;
    *(_DWORD *)v61 = 0;
    int v63 = 0;
    uint64_t v69 = 0;
    uint64_t v71 = 0;
    uint64_t v70 = 0;
    DWORD1(v60) = [(ETModelDefMLP *)self hidden_size];
    LODWORD(v60) = [(ETModelDefMLP *)self output_size];
    *((void *)&v60 + 1) = 1;
    std::string::basic_string[abi:ne180100]<0>(v56, "inner_product");
    std::string::basic_string[abi:ne180100]<0>(__p, "ip2");
    std::string::basic_string[abi:ne180100]<0>(&v89, "ip1");
    v41 = 0;
    v42 = 0;
    v43 = 0;
    *(void *)&long long v87 = &v41;
    BYTE8(v87) = 0;
    v41 = (std::string *)operator new(0x18uLL);
    v42 = v41;
    v43 = v41 + 1;
    v42 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v43, &v89, &v91, v41);
    std::string::basic_string[abi:ne180100]<0>(&v87, "ip2");
    v38 = 0;
    v39 = 0;
    v40 = 0;
    v85 = &v38;
    char v86 = 0;
    v38 = (std::string *)operator new(0x18uLL);
    v39 = v38;
    v40 = v38 + 1;
    v39 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&v40, &v87, &v89, v38);
    Espresso::sequential_builder::add<Espresso::inner_product_uniforms>(&v58, &v75, (uint64_t)v56, (uint64_t)__p, (uint64_t)&v60, (uint64_t)v41, (uint64_t)v42, (uint64_t *)&v38);
    v85 = &v38;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v85);
    if (v88 < 0) {
      operator delete((void *)v87);
    }
    *(void *)&long long v87 = &v41;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v87);
    if (v90 < 0) {
      operator delete((void *)v89);
    }
    if (v55 < 0) {
      operator delete(__p[0]);
    }
    if (v57 < 0) {
      operator delete(v56[0]);
    }
    uint64_t v11 = v58;
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)v58 + 424))(&v36, v58);
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v11 + 400))(v11, &v36);
    if (v37) {
      nitro::nitro_function::nitro_function(v37);
    }
    (*(void (**)(uint64_t *__return_ptr, uint64_t))(*(void *)v11 + 432))(&v34, v11);
    (*(void (**)(uint64_t, uint64_t *))(*(void *)v11 + 392))(v11, &v34);
    v12 = v35;
    if (v35) {
LABEL_31:
    }
      nitro::nitro_function::nitro_function(v12);
  }
  if (v59) {
    nitro::nitro_function::nitro_function(v59);
  }
  *((void *)&v60 + 1) = 0;
  *(void *)v61 = 0;
  *(void *)&long long v60 = (char *)&v60 + 8;
  int v13 = [(ETModelDefMLP *)self input_size];
  std::string::basic_string[abi:ne180100]<0>(v56, "data");
  __p[0] = v56;
  v14 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v60, v56, (_OWORD **)__p);
  v16 = v14 + 6;
  v15 = (void *)*((void *)v14 + 12);
  *((void *)v14 + 7) = 0x100000001;
  *((_DWORD *)v14 + 16) = v13;
  *(void *)((char *)v14 + 68) = 0x100000001;
  *((_DWORD *)v14 + 19) = -1;
  *((void *)v14 + 10) = 0;
  *((void *)v14 + 11) = 0;
  if (v15)
  {
    *((void *)v14 + 13) = v15;
    operator delete(v15);
    void *v16 = 0;
    v16[1] = 0;
    v16[2] = 0;
  }
  void *v16 = 0;
  v16[1] = 0;
  v16[2] = 0;
  if (v57 < 0) {
    operator delete(v56[0]);
  }
  std::string::basic_string[abi:ne180100]<0>(v56, "label");
  __p[0] = v56;
  v17 = std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)&v60, v56, (_OWORD **)__p);
  *(void *)&long long v18 = 0x100000001;
  *((void *)&v18 + 1) = 0x100000001;
  v20 = v17 + 6;
  v19 = (void *)*((void *)v17 + 12);
  *(_OWORD *)((char *)v17 + 56) = v18;
  *((void *)v17 + 9) = 0xFFFFFFFF00000001;
  *((void *)v17 + 10) = 0;
  *((void *)v17 + 11) = 0;
  if (v19)
  {
    *((void *)v17 + 13) = v19;
    operator delete(v19);
    void *v20 = 0;
    v20[1] = 0;
    v20[2] = 0;
  }
  void *v20 = 0;
  v20[1] = 0;
  v20[2] = 0;
  if (v57 < 0) {
    operator delete(v56[0]);
  }
  Espresso::sequential_builder::build_from_shapes((uint64_t)&v75, (uint64_t)&v60, &v22);
  [(ETModelDef *)self transformForTraining:&v22];
  if (v23) {
    nitro::nitro_function::nitro_function(v23);
  }
  std::__tree<std::__value_type<std::string,Espresso::layer_shape>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::layer_shape>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::layer_shape>>>::destroy((uint64_t)&v60, *((char **)&v60 + 1));
  std::deque<std::pair<std::shared_ptr<Espresso::abstract_context>,Espresso::compute_path>>::~deque[abi:ne180100]((uint64_t)&v82);
  if (v81) {
    nitro::nitro_function::nitro_function(v81);
  }
  if (v80) {
    nitro::nitro_function::nitro_function(v80);
  }
  if (v79) {
    nitro::nitro_function::nitro_function(v79);
  }
  if (v78 < 0) {
    operator delete(v77[5]);
  }
  std::__tree<std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::__map_value_compare<Espresso::AOT::BackendIdentifier,std::__value_type<Espresso::AOT::BackendIdentifier,double>,std::less<Espresso::AOT::BackendIdentifier>,true>,std::allocator<std::__value_type<Espresso::AOT::BackendIdentifier,double>>>::destroy((uint64_t)v77, v77[1]);
  if (v76) {
    nitro::nitro_function::nitro_function(v76);
  }
  if (v84) {
    nitro::nitro_function::nitro_function(v84);
  }
}

@end