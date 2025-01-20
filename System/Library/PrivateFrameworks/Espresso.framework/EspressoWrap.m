@interface EspressoWrap
@end

@implementation EspressoWrap

void __EspressoWrap__default_layer_parameters_block_invoke()
{
  Espresso::default_layer_parameters(&v1);
  (*(void (**)(char *__return_ptr))(*(void *)v1 + 304))(__s1);
  if (v2) {
    nitro::nitro_function::nitro_function(v2);
  }
  if (v4 < 0)
  {
    v0 = *(char **)__s1;
    EspressoWrap__default_layer_parameters::default_layer_parameters_str = (uint64_t)strdup(*(const char **)__s1);
    operator delete(v0);
  }
  else
  {
    EspressoWrap__default_layer_parameters::default_layer_parameters_str = (uint64_t)strdup(__s1);
  }
}

uint64_t __EspressoWrap__Layer__set_blob_by_name_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 32) + 48))(*(void *)(a1 + 32), a2, *(void *)(a1 + 48) + 16);
}

void __EspressoWrap__Layer__set_blob_by_name_raw_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  std::string::basic_string[abi:ne180100]<0>(__p, *(char **)(a1 + 40));
  (*(void (**)(uint64_t, uint64_t, void **, void, void, void))(*(void *)v4 + 168))(v4, a2, __p, *(void *)(a1 + 48), *(void *)(a1 + 56), 0);
  if (v6 < 0) {
    operator delete(__p[0]);
  }
}

uint64_t __EspressoWrap__Layer__readonly_blob_by_name_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(**(void **)(a1 + 40) + 40))(*(void *)(a1 + 40), a2, *(void *)(*(void *)(a1 + 32) + 8) + 48);
}

uint64_t __EspressoWrap__Layer__finalize_weights_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(void **)(a1 + 32) + 176))();
}

void __EspressoWrap__Net_copy_from_image_block_invoke(uint64_t a1, void **a2)
{
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = operator new(0x20uLL);
  v12 = v5 + 2;
  v13 = v5 + 2;
  long long v6 = *(_OWORD *)(a1 + 56);
  _OWORD *v5 = *(_OWORD *)(a1 + 40);
  v5[1] = v6;
  v11 = v5;
  uint64_t v7 = *(unsigned int *)(a1 + 160);
  std::string::basic_string[abi:ne180100]<0>(__p, *(char **)(a1 + 152));
  Espresso::fill_network_with_images_batch_safe_v2(a2, (uint64_t *)(v4 + 144), (const char ***)&v11, v7, v8, (__n128 *)(a1 + 72), (std::string::size_type)__p);
  if (v10 < 0) {
    operator delete(__p[0]);
  }
  if (v11)
  {
    v12 = v11;
    operator delete(v11);
  }
}

void __EspressoWrap__Net__forward_block_invoke(uint64_t a1, void *a2)
{
}

void __EspressoWrap__Net__forward_n_times_block_invoke(uint64_t a1, void *a2)
{
  if (*(int *)(a1 + 40) >= 1)
  {
    int v4 = 0;
    do
    {
      Espresso::net::__forward(*(void *)(*(void *)(a1 + 32) + 144), a2, *(unsigned int *)(a1 + 44), *(unsigned int *)(a1 + 48));
      ++v4;
    }
    while (v4 < *(_DWORD *)(a1 + 40));
  }
}

void __EspressoWrap__Net__forward_partial_block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __EspressoWrap__MemoryMap__delete_block_invoke(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, uint64_t, uint64_t))(***(void ***)(a1 + 32) + 48))(**(void **)(a1 + 32), a2, *(void *)(a1 + 32) + 16);
}

@end