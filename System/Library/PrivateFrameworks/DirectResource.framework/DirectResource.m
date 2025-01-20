re::DirectFence *re::DirectFence::DirectFence(re::DirectFence *this, char *a2)
{
  uint64_t v4;

  ArcSharedObject::ArcSharedObject(this, 0);
  *(void *)v4 = &unk_26FF34938;
  *(_DWORD *)(v4 + 16) = 0;
  *(unsigned char *)(v4 + 20) = 1;
  *(void *)(v4 + 24) = 0;
  std::string::basic_string[abi:nn180100]<0>((void *)(v4 + 32), a2);
  *((void *)this + 7) = 0;
  *((void *)this + 8) = 0;
  *((void *)this + 9) = 0;
  return this;
}

ArcSharedObject *re::DirectFence::DirectFence(ArcSharedObject *a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  ArcSharedObject::ArcSharedObject(a1, 0);
  *(void *)uint64_t v4 = &unk_26FF34938;
  *(_DWORD *)(v4 + 16) = 1;
  *(unsigned char *)(v4 + 20) = 1;
  *(_OWORD *)(v4 + 32) = 0u;
  uint64_t v5 = v4 + 32;
  *(void *)(v4 + 24) = a2;
  *(_OWORD *)(v4 + 48) = 0u;
  *(_OWORD *)(v4 + 64) = 0u;
  id v6 = objc_msgSend(a2, sel_label);
  if (v6)
  {
    v7 = (char *)objc_msgSend(v6, sel_UTF8String);
  }
  else
  {
    snprintf(__str, 0x80uLL, "CommandBuffer %p", a2);
    v7 = __str;
  }
  MEMORY[0x253313070](v5, v7);
  return a1;
}

void re::DirectFence::~DirectFence(re::DirectFence *this)
{
  *(void *)this = &unk_26FF34938;
  if (*((unsigned char *)this + 20)) {
    re::DirectFence::~DirectFence();
  }
  v2 = (void **)((char *)this + 56);
  std::vector<std::function<void ()(re::DirectFence *)>>::__destroy_vector::operator()[abi:nn180100](&v2);
  if (*((char *)this + 55) < 0) {
    operator delete(*((void **)this + 4));
  }
  ArcSharedObject::~ArcSharedObject(this);
}

{
  uint64_t vars8;

  re::DirectFence::~DirectFence(this);

  JUMPOUT(0x2533130A0);
}

uint64_t re::DirectFence::invalidate(uint64_t this)
{
  if (!*(unsigned char *)(this + 20)) {
    re::DirectFence::invalidate();
  }
  uint64_t v1 = this;
  *(unsigned char *)(this + 20) = 0;
  uint64_t v2 = *(void *)(this + 56);
  uint64_t v3 = *(void *)(this + 64);
  while (v2 != v3)
  {
    this = std::function<void ()(re::DirectFence *)>::operator()(v2, v1);
    v2 += 32;
  }
  return this;
}

uint64_t std::function<void ()(re::DirectFence *)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v5);
  }
  uint64_t v4 = std::__throw_bad_function_call[abi:nn180100]();
  return re::DirectFence::addInvalidateHandler(v4);
}

uint64_t re::DirectFence::addInvalidateHandler(uint64_t a1, uint64_t a2)
{
  unint64_t v6 = *(void *)(a1 + 72);
  uint64_t v4 = a1 + 72;
  unint64_t v5 = v6;
  unint64_t v7 = *(void *)(v4 - 8);
  if (v7 >= v6)
  {
    uint64_t v10 = (uint64_t *)(v4 - 16);
    uint64_t v11 = *(void *)(v4 - 16);
    uint64_t v12 = (uint64_t)(v7 - v11) >> 5;
    if ((unint64_t)(v12 + 1) >> 59) {
      abort();
    }
    uint64_t v13 = v5 - v11;
    uint64_t v14 = v13 >> 4;
    if (v13 >> 4 <= (unint64_t)(v12 + 1)) {
      uint64_t v14 = v12 + 1;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v15 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v15 = v14;
    }
    uint64_t v21 = v4;
    if (v15) {
      v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>(v4, v15);
    }
    else {
      v16 = 0;
    }
    v17 = v16;
    v18 = &v16[32 * v12];
    v20 = &v16[32 * v15];
    std::__function::__value_func<void ()(re::DirectFence *)>::__value_func[abi:nn180100]((uint64_t)v18, a2);
    v19 = v18 + 32;
    std::vector<std::function<void ()(re::DirectFence *)>>::__swap_out_circular_buffer(v10, &v17);
    unint64_t v9 = *(void *)(a1 + 64);
    uint64_t result = std::__split_buffer<std::function<void ()(re::DirectFence *)>>::~__split_buffer((uint64_t)&v17);
  }
  else
  {
    uint64_t result = std::__function::__value_func<void ()(re::DirectFence *)>::__value_func[abi:nn180100](*(void *)(v4 - 8), a2);
    unint64_t v9 = v7 + 32;
  }
  *(void *)(a1 + 64) = v9;
  return result;
}

void re::DirectFence::description(re::DirectFence *this@<X0>, std::string *a2@<X8>)
{
  std::string::basic_string[abi:nn180100]<0>(&v11, "Fence: ");
  unint64_t v6 = (const std::string::value_type *)*((void *)this + 4);
  unint64_t v5 = (char *)this + 32;
  uint64_t v4 = v6;
  int v7 = v5[23];
  if (v7 >= 0) {
    v8 = v5;
  }
  else {
    v8 = v4;
  }
  if (v7 >= 0) {
    std::string::size_type v9 = v5[23];
  }
  else {
    std::string::size_type v9 = *((void *)v5 + 1);
  }
  uint64_t v10 = std::string::append(&v11, v8, v9);
  *a2 = *v10;
  v10->__r_.__value_.__r.__words[0] = 0;
  v10->__r_.__value_.__l.__size_ = 0;
  v10->__r_.__value_.__r.__words[2] = 0;
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0) {
    operator delete(v11.__r_.__value_.__l.__data_);
  }
}

void *std::string::basic_string[abi:nn180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    abort();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    unint64_t v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    unint64_t v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

void std::vector<std::function<void ()(re::DirectFence *)>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    size_t v4 = v1[1];
    size_t v5 = v2;
    if (v4 != v2)
    {
      do
        size_t v4 = std::__function::__value_func<void ()(re::DirectFence *)>::~__value_func[abi:nn180100](v4 - 4);
      while (v4 != v2);
      size_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void *std::__function::__value_func<void ()(re::DirectFence *)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t std::__throw_bad_function_call[abi:nn180100]()
{
  std::__libcpp_verbose_abort("bad_function_call was thrown in -fno-exceptions mode");
  return std::__function::__value_func<void ()(re::DirectFence *)>::__value_func[abi:nn180100](v0, v1);
}

uint64_t std::__function::__value_func<void ()(re::DirectFence *)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = v3;
      *(void *)(a2 + 24) = 0;
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

uint64_t std::vector<std::function<void ()(re::DirectFence *)>>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  uint64_t v5 = *a1;
  uint64_t v4 = a1[1];
  uint64_t result = a2[1];
  while (v4 != v5)
  {
    v4 -= 32;
    uint64_t result = std::__function::__value_func<void ()(re::DirectFence *)>::__value_func[abi:nn180100](result - 32, v4);
  }
  a2[1] = result;
  uint64_t v7 = *a1;
  *a1 = result;
  a2[1] = v7;
  uint64_t v8 = a1[1];
  a1[1] = a2[2];
  a2[2] = v8;
  uint64_t v9 = a1[2];
  a1[2] = a2[3];
  a2[3] = v9;
  *a2 = a2[1];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(32 * a2);
}

uint64_t std::__split_buffer<std::function<void ()(re::DirectFence *)>>::~__split_buffer(uint64_t a1)
{
  uint64_t v3 = *(void *)(a1 + 8);
  for (uint64_t i = *(void *)(a1 + 16); i != v3; uint64_t i = *(void *)(a1 + 16))
  {
    *(void *)(a1 + 16) = i - 32;
    std::__function::__value_func<void ()(re::DirectFence *)>::~__value_func[abi:nn180100]((void *)(i - 32));
  }
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

BOOL re::MeshValidation::validateIndices_neon(uint16x8_t *this, unint64_t a2, unsigned int a3)
{
  if (a2 >= 8)
  {
    uint16x8_t v3 = (uint16x8_t)vdupq_n_s16(a3);
    unint64_t v4 = a2 >> 3;
    v5.i64[0] = -1;
    v5.i64[1] = -1;
    unint64_t v6 = this;
    do
    {
      uint16x8_t v7 = (uint16x8_t)vorrq_s8((int8x16_t)vcgtq_u16(v3, *v6), (int8x16_t)vceqq_s16(*(int16x8_t *)v6, v5));
      v7.i16[0] = vminvq_u16(v7);
      if (!v7.i32[0]) {
        return 0;
      }
      ++v6;
    }
    while (--v4);
  }
  unint64_t v8 = a2 & 0xFFFFFFFFFFFFFFF8;
  if ((a2 & 0xFFFFFFFFFFFFFFF8) >= a2) {
    return 1;
  }
  unsigned int v9 = this->u16[v8];
  if (v9 >= a3 && v9 != 0xFFFF) {
    return 0;
  }
  std::string v11 = (const unsigned __int16 *)(v8 + 1);
  do
  {
    unint64_t v12 = (unint64_t)v11;
    if ((const unsigned __int16 *)a2 == v11) {
      break;
    }
    unsigned int v13 = this->u16[(void)v11];
    std::string v11 = (const unsigned __int16 *)((char *)v11 + 1);
  }
  while (v13 < a3 || v13 == 0xFFFF);
  return v12 >= a2;
}

BOOL re::MeshValidation::validateIndices_neon(uint32x4_t *this, unint64_t a2, unsigned int a3)
{
  if (a2 >= 4)
  {
    uint32x4_t v3 = (uint32x4_t)vdupq_n_s32(a3);
    unint64_t v4 = a2 >> 2;
    v5.i64[0] = -1;
    v5.i64[1] = -1;
    unint64_t v6 = this;
    while (vminvq_u32((uint32x4_t)vorrq_s8((int8x16_t)vcgtq_u32(v3, *v6), (int8x16_t)vceqq_s32(*(int32x4_t *)v6, v5))))
    {
      ++v6;
      if (!--v4) {
        goto LABEL_5;
      }
    }
    return 0;
  }
LABEL_5:
  unint64_t v7 = a2 & 0xFFFFFFFFFFFFFFFCLL;
  if ((a2 & 0xFFFFFFFFFFFFFFFCLL) >= a2) {
    return 1;
  }
  unsigned int v8 = this->u32[v7];
  if (v8 >= a3 && v8 != -1) {
    return 0;
  }
  uint64_t v10 = (const unsigned int *)(v7 + 1);
  do
  {
    unint64_t v11 = (unint64_t)v10;
    if ((const unsigned int *)a2 == v10) {
      break;
    }
    unsigned int v12 = this->u32[(void)v10];
    uint64_t v10 = (const unsigned int *)((char *)v10 + 1);
  }
  while (v12 < a3 || v12 == -1);
  return v11 >= a2;
}

BOOL re::MeshValidation::validateIndices(uint64_t a1, uint32x4_t *this, unint64_t a3, unsigned __int16 a4)
{
  if (a1 == 1) {
    return re::MeshValidation::validateIndices_neon(this, a3 >> 2, a4);
  }
  if (a1) {
    return 0;
  }
  return re::MeshValidation::validateIndices_neon((uint16x8_t *)this, a3 >> 1, a4);
}

uint64_t re::directResourceLog(re *this)
{
  unint64_t v1 = 0x26982D000uLL;
  {
    unint64_t v1 = 0x26982D000;
    if (v3)
    {
      re::directResourceLog(void)::log = (uint64_t)os_log_create("com.apple.re", "DirectResource");
      unint64_t v1 = 0x26982D000;
    }
  }
  return *(void *)(v1 + 312);
}

uint64_t re::DirectMaterialParameters::create@<X0>(unint64_t *a1@<X0>, uint64_t *a2@<X8>)
{
  if (*a1 > 0x10 || (*a1 == (uint64_t)(a1[2] - a1[1]) >> 3 ? (BOOL v4 = a1[4] > 0x10) : (BOOL v4 = 1), v4))
  {
    uint64_t result = 0;
  }
  else
  {
    int32x4_t v5 = operator new(0x88uLL);
    uint64_t result = re::DirectMaterialParameters::DirectMaterialParameters((uint64_t)v5, a1);
  }
  *a2 = result;
  return result;
}

uint64_t re::DirectMaterialParameters::DirectMaterialParameters(uint64_t a1, unint64_t *a2)
{
  BOOL v4 = re::DirectResource::DirectResource((re::DirectResource *)a1);
  *(void *)BOOL v4 = &unk_26FF34970;
  *((void *)v4 + 6) = *a2;
  std::vector<unsigned long>::vector((void *)v4 + 7, (uint64_t)(a2 + 1));
  *(void *)(a1 + 80) = a2[4];
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  std::vector<re::SharedPtr<re::DirectBuffer>>::resize(a1 + 88, *a2);
  std::vector<re::SharedPtr<re::DirectBuffer>>::resize(a1 + 112, a2[4]);
  return a1;
}

void std::vector<re::SharedPtr<re::DirectBuffer>>::resize(uint64_t a1, unint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 8);
  unint64_t v4 = (v3 - *(void *)a1) >> 3;
  if (a2 <= v4)
  {
    if (a2 < v4)
    {
      uint64_t v6 = *(void *)a1 + 8 * a2;
      if (v3 != v6)
      {
        uint64_t v7 = *(void *)(a1 + 8);
        do
        {
          uint64_t v9 = *(void *)(v7 - 8);
          v7 -= 8;
          uint64_t v8 = v9;
          if (v9)
          {

            *(void *)(v3 - 8) = 0;
          }
          uint64_t v3 = v7;
        }
        while (v7 != v6);
      }
      *(void *)(a1 + 8) = v6;
    }
  }
  else
  {
    unint64_t v5 = a2 - v4;
    std::vector<re::SharedPtr<re::DirectBuffer>>::__append((char **)a1, v5);
  }
}

void re::DirectMaterialParameters::~DirectMaterialParameters(re::DirectMaterialParameters *this)
{
  uint64_t v3 = (void **)((char *)this + 112);
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  uint64_t v3 = (void **)((char *)this + 88);
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  uint64_t v2 = (void *)*((void *)this + 7);
  if (v2)
  {
    *((void *)this + 8) = v2;
    operator delete(v2);
  }
  re::DirectResource::~DirectResource(this);
}

{
  uint64_t vars8;

  re::DirectMaterialParameters::~DirectMaterialParameters(this);

  JUMPOUT(0x2533130A0);
}

uint64_t re::DirectMaterialParameters::forEachSlot(uint64_t result, uint64_t a2)
{
  uint64_t v3 = (void *)result;
  if (*(void *)(result + 96) != *(void *)(result + 88))
  {
    unint64_t v4 = 0;
    do
      uint64_t result = std::function<void ()(re::DirectResourceSlot)>::operator()(a2, 4, v4++);
    while (v4 < (uint64_t)(v3[12] - v3[11]) >> 3);
  }
  if (v3[15] != v3[14])
  {
    unint64_t v5 = 0;
    do
      uint64_t result = std::function<void ()(re::DirectResourceSlot)>::operator()(a2, 5, v5++);
    while (v5 < (uint64_t)(v3[15] - v3[14]) >> 3);
  }
  return result;
}

uint64_t std::function<void ()(re::DirectResourceSlot)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  v5[0] = a2;
  v5[1] = a3;
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3) {
    return (*(uint64_t (**)(uint64_t, void *))(*(void *)v3 + 48))(v3, v5);
  }
  std::__throw_bad_function_call[abi:nn180100]();
  return re::DirectMaterialParameters::setPayload();
}

uint64_t re::DirectMaterialParameters::setPayload()
{
  return 0;
}

uint64_t re::DirectMaterialParameters::payload()
{
  return 0;
}

uint64_t re::DirectMaterialParameters::type(re::DirectMaterialParameters *this)
{
  return 4;
}

uint64_t re::DirectMaterialParameters::attachToDevice()
{
  return 1;
}

uint64_t re::DirectMaterialParameters::isAttachedToDevice(re::DirectMaterialParameters *this)
{
  return 1;
}

void *std::vector<unsigned long>::vector(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  unint64_t v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  int64_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    std::vector<unsigned long>::__vallocate[abi:nn180100](a1, v5 >> 3);
    uint64_t v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *std::vector<unsigned long>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >> 61) {
    abort();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[8 * v4];
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a2);
}

void std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<re::SharedPtr<re::DirectBuffer>>::__clear[abi:nn180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<re::SharedPtr<re::DirectBuffer>>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  uint64_t v3 = a1[1];
  if (v3 != *a1)
  {
    uint64_t v4 = a1[1];
    do
    {
      uint64_t v6 = *(void *)(v4 - 8);
      v4 -= 8;
      uint64_t v5 = v6;
      if (v6)
      {

        *(void *)(v3 - 8) = 0;
      }
      uint64_t v3 = v4;
    }
    while (v4 != v2);
  }
  a1[1] = v2;
}

void std::vector<re::SharedPtr<re::DirectBuffer>>::__append(char **a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(char **)(v4 - 8);
  if (a2 <= (v6 - v7) >> 3)
  {
    if (a2)
    {
      bzero(*(void **)(v4 - 8), 8 * a2);
      v7 += 8 * a2;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = *a1;
    uint64_t v9 = v7 - *a1;
    unint64_t v10 = a2 + (v9 >> 3);
    if (v10 >> 61) {
      abort();
    }
    uint64_t v11 = v9 >> 3;
    uint64_t v12 = v5 - v8;
    if (v12 >> 2 > v10) {
      unint64_t v10 = v12 >> 2;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v10;
    }
    uint64_t v24 = v4;
    if (v13)
    {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v4, v13);
      uint64_t v8 = *a1;
      uint64_t v7 = a1[1];
    }
    else
    {
      uint64_t v14 = 0;
    }
    unint64_t v15 = &v14[8 * v11];
    v16 = &v14[8 * v13];
    v23 = v16;
    bzero(v15, 8 * a2);
    v17 = &v15[8 * a2];
    *((void *)&v22 + 1) = v17;
    if (v7 != v8)
    {
      do
      {
        uint64_t v18 = *((void *)v7 - 1);
        v7 -= 8;
        *((void *)v15 - 1) = v18;
        v15 -= 8;
        *(void *)uint64_t v7 = 0;
      }
      while (v7 != v8);
      v17 = (char *)*((void *)&v22 + 1);
      v16 = v23;
    }
    long long v19 = *(_OWORD *)a1;
    *a1 = v15;
    a1[1] = v17;
    long long v22 = v19;
    v20 = a1[2];
    a1[2] = v16;
    v23 = v20;
    uint64_t v21 = v19;
    std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)&v21);
  }
}

uint64_t std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::__destruct_at_end[abi:nn180100](uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 16);
  while (v2 != a2)
  {
    uint64_t v6 = *--v2;
    uint64_t v5 = v6;
    *(void *)(a1 + 16) = v2;
    if (v6)
    {

      *uint64_t v2 = 0;
      uint64_t v2 = *(void **)(a1 + 16);
    }
  }
}

void re::SharedPtr<re::DirectBuffer>::reset(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  if (*a1 != a2)
  {
    if (a2)
    {
      id v5 = (id)(a2 + 8);
      uint64_t v2 = *a1;
    }
    if (v2) {

    }
    *a1 = a2;
  }
}

void re::XPCObject::~XPCObject(void **this)
{
  uint64_t v2 = *this;
  if (v2)
  {
    xpc_release(v2);
    *this = 0;
  }
}

void re::XPCObject::setValue(xpc_object_t *this, xpc_object_t object)
{
  if (object) {
    xpc_retain(object);
  }
  if (*this) {
    xpc_release(*this);
  }
  *this = object;
}

void **re::XPCObject::operator=(void **a1, void **a2)
{
  uint64_t v4 = *a1;
  if (v4) {
    xpc_release(v4);
  }
  *a1 = *a2;
  *a2 = 0;
  return a1;
}

void *re::DirectResourceEvent::DirectResourceEvent(void *this)
{
  *this = 0;
  return this;
}

xpc_object_t *re::DirectResourceEvent::operator=(xpc_object_t *a1, xpc_object_t *a2)
{
  return a1;
}

xpc_object_t *re::DirectResourceEvent::operator=(xpc_object_t *a1, id a2)
{
  xpc_object_t v4 = *a1;
  if (v4)
  {
    xpc_release(v4);
    *a1 = 0;
  }
  if (a2)
  {
    id v5 = objc_msgSend(a2, sel_newSharedEventHandle);
    objc_msgSend(v5, sel_eventPort);
    uint64_t v6 = xpc_mach_send_create();
    if (*a1) {
      xpc_release(*a1);
    }
    *a1 = (xpc_object_t)v6;
    if (v5) {
  }
    }
  return a1;
}

id re::DirectResourceEvent::makeEvent@<X0>(void *a1@<X1>, void *a2@<X8>)
{
  uint64_t right = xpc_mach_send_get_right();
  if ((objc_msgSend(a1, sel_respondsToSelector_, sel_newSharedEventWithMachPort_) & 1) != 0
    || (id result = objc_msgSend(a1, sel_methodSignatureForSelector_, sel_newSharedEventWithMachPort_)) != 0)
  {
    id result = objc_msgSend(a1, sel_newSharedEventWithMachPort_, right);
  }
  *a2 = result;
  return result;
}

void re::toString(re *this@<X0>, char *a2@<X8>)
{
}

uint64_t re::lengthInBytes(uint64_t a1)
{
  if (a1) {
    return 4 * (a1 == 1);
  }
  else {
    return 2;
  }
}

unint64_t re::lengthInBytes(uint64_t a1, void *a2, unint64_t a3)
{
  if (a2[4])
  {
    unsigned __int8 v3 = 0;
    unint64_t v4 = 0;
    unint64_t v5 = a2[2];
    if (!is_mul_ok(v5, a3)) {
      return v4 | v3;
    }
    unint64_t v6 = v5 * a3;
    uint64_t v7 = *(void *)(a1 + 24);
    uint64_t v8 = a2[1];
    uint64_t v9 = v7 + v8;
    BOOL v10 = __CFADD__(v7, v8);
    unint64_t v11 = MTLAttributeFormatSize(*(MTLAttributeFormat *)(a1 + 8));
    if (v11 <= v6) {
      unint64_t v12 = v6;
    }
    else {
      unint64_t v12 = v11;
    }
    BOOL v13 = __CFADD__(v12, v9);
    uint64_t v14 = v12 + v9;
    BOOL v15 = v13;
    if (v10)
    {
LABEL_13:
      unsigned __int8 v3 = 0;
      unint64_t v4 = 0;
      return v4 | v3;
    }
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 24);
    uint64_t v17 = a2[1];
    uint64_t v18 = v16 + v17;
    BOOL v19 = __CFADD__(v16, v17);
    uint64_t v20 = MTLAttributeFormatSize(*(MTLAttributeFormat *)(a1 + 8));
    uint64_t v14 = v20 + v18;
    BOOL v15 = __CFADD__(v20, v18);
    if (v19) {
      goto LABEL_13;
    }
  }
  unsigned __int8 v3 = 0;
  unint64_t v4 = 0;
  if (!v15)
  {
    unint64_t v4 = v14 & 0xFFFFFFFFFFFFFF00;
    unsigned __int8 v3 = v14;
  }
  return v4 | v3;
}

const char *re::toString(unsigned int a1)
{
  if (a1 > 4) {
    return "???";
  }
  else {
    return off_2652F6B10[a1];
  }
}

const char *re::toString(int a1)
{
  if ((a1 + 1) > 7) {
    return "???";
  }
  else {
    return off_2652F6B38[a1 + 1];
  }
}

void re::DirectBuffer::create(void *a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*a2 && re::DirectBufferValidation::isWellFormed(a1))
  {
    unint64_t v6 = (char *)operator new(0x58uLL);
    uint64_t v7 = re::DirectResource::DirectResource((re::DirectResource *)v6);
    *(void *)uint64_t v7 = &unk_26FF349E0;
    *((_OWORD *)v7 + 3) = *(_OWORD *)a1;
    *((void *)v7 + 9) = 0;
    *((void *)v7 + 10) = 0;
    *((void *)v7 + 8) = 0;
    if (re::DirectBuffer::allocateStorage((uint64_t)v7, (uint64_t)a2))
    {
      *a3 = v6;
    }
    else
    {
      *a3 = 0;
    }
  }
  else
  {
    *a3 = 0;
  }
}

BOOL re::DirectBuffer::allocateStorage(uint64_t a1, uint64_t a2)
{
  if (*(unsigned char *)(a2 + 8)) {
    uint64_t v3 = 11;
  }
  else {
    uint64_t v3 = 3;
  }
  re::DirectMemoryResource::create(*(re::MemoryMappedRegion **)(a1 + 48), (re::DirectMemoryResource *)v3, *(void **)a2, &v7);
  uint64_t v4 = *(void *)(a1 + 72);
  uint64_t v5 = v7;
  *(void *)(a1 + 72) = v7;
  uint64_t v7 = v4;
  if (v4)
  {

    uint64_t v5 = *(void *)(a1 + 72);
  }
  if (v5) {
    *(void *)(a1 + 64) = *(void *)(a1 + 48);
  }
  return v5 != 0;
}

__n128 re::DirectBuffer::DirectBuffer(re::DirectResource *a1, __n128 *a2)
{
  uint64_t v3 = re::DirectResource::DirectResource(a1);
  *(void *)uint64_t v3 = &unk_26FF349E0;
  __n128 result = *a2;
  *((__n128 *)v3 + 3) = *a2;
  *((void *)v3 + 9) = 0;
  *((void *)v3 + 10) = 0;
  *((void *)v3 + 8) = 0;
  return result;
}

void re::DirectBuffer::~DirectBuffer(re::DirectBuffer *this)
{
  uint64_t v2 = (void *)*((void *)this + 10);
  if (v2)
  {

    *((void *)this + 10) = 0;
  }
  uint64_t v3 = *((void *)this + 9);
  if (v3)
  {

    *((void *)this + 9) = 0;
  }

  re::DirectResource::~DirectResource(this);
}

{
  uint64_t vars8;

  re::DirectBuffer::~DirectBuffer(this);

  JUMPOUT(0x2533130A0);
}

uint64_t re::DirectBuffer::attachToDevice(uint64_t a1, void *a2)
{
  uint64_t v4 = re::DirectMemoryResource::bindToResource(*(void *)(a1 + 72), 3, 3);
  if (v4 && !*(void *)re::DirectMemoryResource::runtimeResource(*(re::DirectMemoryResource **)(a1 + 72)))
  {
    uint64_t v5 = *(void *)(a1 + 72);
    re::DirectMemoryResource::makeBuffer(a2, v5, &v8);
    id v6 = v8;
    id v8 = 0;
    id v9 = v6;
    re::DirectMemoryResource::setRuntimeResource(v5, &v9);
    if (v9)
    {

      id v9 = 0;
    }
    if (v8) {
  }
    }
  return v4;
}

re::DirectMemoryResource *re::DirectBuffer::isAttachedToDevice(re::DirectBuffer *this)
{
  __n128 result = (re::DirectMemoryResource *)*((void *)this + 9);
  if (result) {
    return (re::DirectMemoryResource *)(*(void *)re::DirectMemoryResource::runtimeResource(result) != 0);
  }
  return result;
}

uint64_t re::DirectBuffer::payload(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result = 0;
  if (a2 == 3 && !a3) {
    return *(void *)(a1 + 72);
  }
  return result;
}

uint64_t re::DirectBuffer::setPayload(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  BOOL v5 = a2 == 3 && a3 == 0;
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v10 = *(void *)(a1 + 40);
    if (v10) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v10 + 40))(v10, a1, a2, a3);
    }
    uint64_t v11 = *(void *)(a1 + 72);
    *(void *)(a1 + 72) = *a4;
    *a4 = v11;
    uint64_t v12 = *(void *)(a1 + 40);
    if (v12) {
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)v12 + 48))(v12, a1, a2, a3);
    }
  }
  return v6;
}

uint64_t re::DirectBuffer::forEachSlot(uint64_t a1, uint64_t a2)
{
  return std::function<void ()(re::DirectResourceSlot)>::operator()(a2, 3, 0);
}

BOOL re::DirectBuffer::isValidBytesUsed(re::DirectBuffer *this, unint64_t a2)
{
  return re::DirectBufferValidation::isValidBytesUsed(a2, (unint64_t *)this + 6);
}

BOOL re::DirectBuffer::setBytesUsed(re::DirectBuffer *this, unint64_t a2)
{
  if (*((void *)this + 8) != a2)
  {
    BOOL result = re::DirectBufferValidation::isValidBytesUsed(a2, (unint64_t *)this + 6);
    if (!result) {
      return result;
    }
    *((void *)this + 8) = a2;
    re::DirectResource::didChange((uint64_t)this, 0, 0, 0);
  }
  return 1;
}

uint64_t re::DirectBuffer::read(uint64_t a1, uint64_t a2)
{
  id v4 = re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(a1 + 72));
  uint64_t v5 = *(void *)(*(void *)(a1 + 72) + 40);
  uint64_t v6 = *(uint64_t (**)(uint64_t, id, uint64_t))(a2 + 16);

  return v6(a2, v4, v5);
}

uint64_t re::DirectBuffer::update(uint64_t a1, uint64_t a2)
{
  re::DirectResource::willChange(a1, 3, 0, 0, 0);
  id v4 = re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(a1 + 72));
  (*(void (**)(uint64_t, id, void))(a2 + 16))(a2, v4, *(void *)(*(void *)(a1 + 72) + 40));

  return re::DirectResource::didChange(a1, 3, 0, 0);
}

uint64_t re::DirectBuffer::replace(uint64_t a1, uint64_t a2)
{
  re::DirectResource::willChange(a1, 3, 0, 1, 0);
  id v4 = re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(a1 + 72));
  (*(void (**)(uint64_t, id, void))(a2 + 16))(a2, v4, *(void *)(*(void *)(a1 + 72) + 40));

  return re::DirectResource::didChange(a1, 3, 0, 0);
}

id re::DirectBuffer::read@<X0>(uint64_t a1@<X0>, void *a2@<X8>)
{
  id result = *(id *)(a1 + 80);
  *a2 = result;
  return result;
}

id re::DirectBuffer::replace@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  re::DirectResource::willChange(a1, 3, 0, 1, a2);
  id result = *(id *)(a1 + 80);
  *a3 = result;
  return result;
}

uint64_t re::DirectBuffer::type(re::DirectBuffer *this)
{
  return 3;
}

BOOL re::xpc_get_value(void *a1, uint64_t *a2)
{
  id v3 = a1;
  uint64_t v4 = MEMORY[0x253313620]();
  uint64_t v5 = MEMORY[0x263EF87A0];
  if (v4 == MEMORY[0x263EF87A0]) {
    *a2 = xpc_uint64_get_value(v3);
  }

  return v4 == v5;
}

BOOL re::xpc_get_value(void *a1, unsigned __int8 *a2)
{
  id v3 = a1;
  uint64_t v4 = MEMORY[0x253313620]();
  uint64_t v5 = MEMORY[0x263EF87A8];
  if (v4 == MEMORY[0x263EF87A8])
  {
    bytes = xpc_uuid_get_bytes(v3);
    uuid_copy(a2, bytes);
  }

  return v4 == v5;
}

{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  id v3 = a1;
  uint64_t v4 = xpc_dictionary_get_value(v3, "partCount");
  if (re::xpc_get_value<unsigned long>(v4, (uint64_t)a2))
  {
    uint64_t v5 = xpc_dictionary_get_value(v3, "parts");
    if (re::xpc_get_value<re::DirectResourceId>(v5, a2 + 16))
    {
      uint64_t v6 = xpc_dictionary_get_value(v3, "indices");
      if (re::xpc_get_value<re::DirectResourceId>(v6, a2 + 33))
      {
        uint64_t v7 = xpc_dictionary_get_array(v3, "vertices");
        id v8 = re::xpc_array_get_values<std::optional<re::DirectResourceId>,4ul>(v7, a2 + 50);
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

{
  id v3;
  const unsigned __int8 *uuid;
  void *v5;
  void *v6;
  BOOL value;

  id v3 = a1;
  uuid = xpc_dictionary_get_uuid(v3, "identifier");
  if (uuid)
  {
    uuid_copy(a2, uuid);
    uint64_t v5 = xpc_dictionary_get_dictionary(v3, "description");
    if (re::xpc_get_value(v5, (uint64_t)(a2 + 16)))
    {
      uint64_t v6 = xpc_dictionary_get_dictionary(v3, "contents");
      value = re::xpc_get_value(v6, a2 + 96);
    }
    else
    {
      value = 0;
    }
  }
  else
  {
    value = 0;
  }

  return value;
}

{
  id v3;
  const unsigned __int8 *uuid;
  void *v5;
  BOOL value;

  id v3 = a1;
  uuid = xpc_dictionary_get_uuid(v3, "identifier");
  if (uuid)
  {
    uuid_copy(a2, uuid);
    uint64_t v5 = xpc_dictionary_get_dictionary(v3, "contents");
    value = re::xpc_get_value(v5, a2 + 16);
  }
  else
  {
    value = 0;
  }

  return value;
}

{
  id v3;
  const unsigned __int8 *uuid;
  void *v5;
  const unsigned __int8 *v6;
  BOOL v7;

  id v3 = a1;
  uuid = xpc_dictionary_get_uuid(v3, "identifier");
  if (uuid)
  {
    uuid_copy(a2, uuid);
    uint64_t v5 = xpc_dictionary_get_dictionary(v3, "description");
    re::xpc_get_value(v5, (uint64_t)(a2 + 16));
    uint64_t v6 = xpc_dictionary_get_uuid(v3, "contents");
    uint64_t v7 = v6 != 0;
    if (v6) {
      uuid_copy(a2 + 88, v6);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

{
  id v3;
  const unsigned __int8 *uuid;
  void *v5;
  BOOL value;

  id v3 = a1;
  uuid = xpc_dictionary_get_uuid(v3, "identifier");
  if (uuid)
  {
    uuid_copy(a2, uuid);
    uint64_t v5 = xpc_dictionary_get_dictionary(v3, "contents");
    value = re::xpc_get_value(v5, (uint64_t)(a2 + 16));
  }
  else
  {
    value = 0;
  }

  return value;
}

id re::xpc_dictionary_create(uint64_t a1, uint64_t a2)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (a2)
  {
    uint64_t v5 = a1 + 16 * a2;
    do
    {
      uint64_t v6 = *(const char **)a1;
      uint64_t v7 = *(void **)(a1 + 8);
      a1 += 16;
      xpc_dictionary_set_value(empty, v6, v7);
    }
    while (a1 != v5);
  }

  return empty;
}

id re::xpc_object_create(uint64_t *a1)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "semantic", *(int *)a1);
  xpc_dictionary_set_uint64(empty, "format", a1[1]);
  xpc_dictionary_set_uint64(empty, "layoutIndex", a1[2]);
  xpc_dictionary_set_uint64(empty, "offset", a1[3]);

  return empty;
}

{
  xpc_object_t empty;
  uint64_t vars8;

  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "bufferIndex", *a1);
  xpc_dictionary_set_uint64(empty, "bufferOffset", a1[1]);
  xpc_dictionary_set_uint64(empty, "bufferStride", a1[2]);
  xpc_dictionary_set_uint64(empty, "stepRate", a1[3]);
  xpc_dictionary_set_uint64(empty, "stepFunction", a1[4]);

  return empty;
}

{
  xpc_object_t empty;
  uint64_t vars8;

  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "capacity", *a1);
  xpc_dictionary_set_uint64(empty, "sizeMultiple", a1[1]);

  return empty;
}

uint64_t re::xpc_get_value(void *a1, uint64_t a2)
{
  id v3 = a1;
  *(_DWORD *)a2 = xpc_dictionary_get_uint64(v3, "semantic");
  *(void *)(a2 + 8) = xpc_dictionary_get_uint64(v3, "format");
  *(void *)(a2 + 16) = xpc_dictionary_get_uint64(v3, "layoutIndex");
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "offset");

  *(void *)(a2 + 24) = uint64;
  return 1;
}

{
  id v3;
  int uint64;

  id v3 = a1;
  *(void *)a2 = xpc_dictionary_get_uint64(v3, "width");
  *(void *)(a2 + 8) = xpc_dictionary_get_uint64(v3, "height");
  *(void *)(a2 + 16) = xpc_dictionary_get_uint64(v3, "depth");
  *(void *)(a2 + 24) = xpc_dictionary_get_uint64(v3, "mipmapLevelCount");
  *(void *)(a2 + 32) = xpc_dictionary_get_uint64(v3, "arrayLength");
  *(void *)(a2 + 40) = xpc_dictionary_get_uint64(v3, "pixelFormat");
  *(void *)(a2 + 48) = xpc_dictionary_get_uint64(v3, "textureType");
  *(void *)(a2 + 56) = xpc_dictionary_get_uint64(v3, "textureUsage");
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "swizzle");

  *(_DWORD *)(a2 + 64) = uint64;
  return 1;
}

uint64_t re::xpc_get_value(void *a1, uint64_t *a2)
{
  id v3 = a1;
  *a2 = xpc_dictionary_get_uint64(v3, "bufferIndex");
  a2[1] = xpc_dictionary_get_uint64(v3, "bufferOffset");
  a2[2] = xpc_dictionary_get_uint64(v3, "bufferStride");
  a2[3] = xpc_dictionary_get_uint64(v3, "stepRate");
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "stepFunction");

  a2[4] = uint64;
  return 1;
}

{
  id v3;
  uint64_t uint64;

  id v3 = a1;
  *a2 = xpc_dictionary_get_uint64(v3, "capacity");
  uint64_t uint64 = xpc_dictionary_get_uint64(v3, "sizeMultiple");

  a2[1] = uint64;
  return 1;
}

{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  uint64_t v16;

  id v3 = a1;
  re::make::shared::object<re::DirectResourceCommands>(&v16);
  uint64_t v4 = *a2;
  *a2 = v16;
  uint64_t v16 = v4;
  if (v4) {

  }
  *(void *)(*a2 + 16) = xpc_dictionary_get_uint64(v3, "identifier");
  uint64_t v16 = xpc_dictionary_get_value(v3, "userPayload");
  re::XPCObject::operator=((void **)(*a2 + 24), (void **)&v16);
  re::XPCObject::~XPCObject((void **)&v16);
  uint64_t v5 = xpc_dictionary_get_value(v3, "event");
  uint64_t v6 = v5;
  if (v5 && !re::xpc_get_value(v5, (void **)(*a2 + 32))) {
    goto LABEL_16;
  }

  uint64_t v7 = xpc_dictionary_get_dictionary(v3, "meshes");
  uint64_t v6 = v7;
  if (v7)
  {
    if (!re::xpc_get_value<re::CreateDirectMesh,re::UpdateDirectMesh>(v7, *a2 + 40)) {
      goto LABEL_16;
    }
  }

  id v8 = xpc_dictionary_get_dictionary(v3, "textures");
  uint64_t v6 = v8;
  if (v8)
  {
    if (!re::xpc_get_value<re::CreateDirectTexture,re::UpdateDirectTexture>(v8, (void **)(*a2 + 112))) {
      goto LABEL_16;
    }
  }

  id v9 = xpc_dictionary_get_dictionary(v3, "buffers");
  uint64_t v6 = v9;
  if (v9 && !re::xpc_get_value<re::CreateDirectBuffer,re::UpdateDirectBuffer>(v9, (void **)(*a2 + 184)))
  {
LABEL_16:
    LOBYTE(v14) = 0;
  }
  else
  {

    uint64_t v10 = xpc_dictionary_get_dictionary(v3, "payloads");
    uint64_t v6 = v10;
    if (v10)
    {
      uint64_t v11 = xpc_dictionary_get_array(v10, "create");
      uint64_t v12 = v11;
      if (v11 && !re::xpc_array_get_values<re::CreateDirectPayload>(v11, (char **)(*a2 + 256)))
      {
        LOBYTE(v14) = 0;
      }
      else
      {

        BOOL v13 = xpc_dictionary_get_array(v6, "destroy");
        uint64_t v12 = v13;
        if (v13) {
          uint64_t v14 = re::xpc_array_get_values<re::DestroyResource>(v13, (void **)(*a2 + 280)) << 31 >> 31;
        }
        else {
          LOBYTE(v14) = 1;
        }
      }
    }
    else
    {
      LOBYTE(v14) = 1;
    }
  }

  return v14 & 1;
}

BOOL re::xpc_get_value(void *a1, uint64_t a2)
{
  id v3 = a1;
  *(void *)a2 = xpc_dictionary_get_uint64(v3, "indexCapacity");
  *(void *)(a2 + 8) = xpc_dictionary_get_uint64(v3, "indexType");
  *(void *)(a2 + 16) = xpc_dictionary_get_uint64(v3, "vertexBufferCount");
  *(void *)(a2 + 24) = xpc_dictionary_get_uint64(v3, "vertexCapacity");
  uint64_t v4 = xpc_dictionary_get_array(v3, "vertexAttributes");
  uint64_t v5 = v4;
  if (v4) {
    BOOL v6 = !re::xpc_array_get_values<re::DirectMeshVertexAttribute>(v4, (void **)(a2 + 32));
  }
  else {
    BOOL v6 = 1;
  }

  uint64_t v7 = xpc_dictionary_get_array(v3, "vertexLayouts");
  id v8 = v7;
  BOOL v9 = 0;
  if (v7 && !v6) {
    BOOL v9 = re::xpc_array_get_values<re::DirectMeshVertexLayout>(v7, (void **)(a2 + 56));
  }

  return v9;
}

{
  id v3;
  const unsigned __int8 *uuid;
  void *v5;
  BOOL value;

  id v3 = a1;
  uuid = xpc_dictionary_get_uuid(v3, "identifier");
  if (uuid)
  {
    uuid_copy((unsigned __int8 *)a2, uuid);
    uint64_t v5 = xpc_dictionary_get_dictionary(v3, "contents");
    value = re::xpc_get_value(v5, (re::DirectMemoryResource **)(a2 + 16));
  }
  else
  {
    value = 0;
  }

  return value;
}

{
  id v3;
  void *v4;
  void *v5;
  BOOL v6;

  id v3 = a1;
  uint64_t v4 = xpc_dictionary_get_value(v3, "bytesUsed");
  if (re::xpc_get_value<unsigned long>(v4, a2))
  {
    uint64_t v5 = xpc_dictionary_get_value(v3, "contents");
    BOOL v6 = re::xpc_get_value<re::DirectResourceId>(v5, (unsigned __int8 *)(a2 + 16));
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

{
  id v3;
  const unsigned __int8 *uuid;
  void *v5;
  void *v6;
  BOOL value;

  id v3 = a1;
  uuid = xpc_dictionary_get_uuid(v3, "identifier");
  if (uuid)
  {
    uuid_copy((unsigned __int8 *)a2, uuid);
    uint64_t v5 = xpc_dictionary_get_dictionary(v3, "description");
    re::xpc_get_value(v5, (uint64_t *)(a2 + 16));
    BOOL v6 = xpc_dictionary_get_dictionary(v3, "contents");
    value = re::xpc_get_value(v6, a2 + 32);
  }
  else
  {
    value = 0;
  }

  return value;
}

BOOL re::xpc_array_get_values<re::DirectMeshVertexAttribute>(void *a1, void **a2)
{
  id v3 = a1;
  size_t count = xpc_array_get_count(v3);
  std::vector<re::DirectMeshVertexAttribute>::reserve(a2, count);
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_25DirectMeshVertexAttributeEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  BOOL v5 = xpc_array_apply(v3, applier);

  return v5;
}

BOOL re::xpc_array_get_values<re::DirectMeshVertexLayout>(void *a1, void **a2)
{
  id v3 = a1;
  size_t count = xpc_array_get_count(v3);
  std::vector<re::DirectMeshVertexLayout>::reserve(a2, count);
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_22DirectMeshVertexLayoutEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  BOOL v5 = xpc_array_apply(v3, applier);

  return v5;
}

id re::xpc_object_create(uint64_t a1)
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "indexCapacity", *(void *)a1);
  xpc_dictionary_set_uint64(empty, "indexType", *(void *)(a1 + 8));
  xpc_dictionary_set_uint64(empty, "vertexBufferCount", *(void *)(a1 + 16));
  xpc_dictionary_set_uint64(empty, "vertexCapacity", *(void *)(a1 + 24));
  id v3 = re::xpc_array_create_with<re::DirectMeshVertexAttribute>((uint64_t **)(a1 + 32));
  xpc_dictionary_set_value(empty, "vertexAttributes", v3);

  uint64_t v4 = re::xpc_array_create_with<re::DirectMeshVertexLayout>((uint64_t **)(a1 + 56));
  xpc_dictionary_set_value(empty, "vertexLayouts", v4);

  return empty;
}

{
  xpc_object_t empty;
  uint64_t vars8;

  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "width", *(void *)a1);
  xpc_dictionary_set_uint64(empty, "height", *(void *)(a1 + 8));
  xpc_dictionary_set_uint64(empty, "depth", *(void *)(a1 + 16));
  xpc_dictionary_set_uint64(empty, "mipmapLevelCount", *(void *)(a1 + 24));
  xpc_dictionary_set_uint64(empty, "arrayLength", *(void *)(a1 + 32));
  xpc_dictionary_set_uint64(empty, "pixelFormat", *(void *)(a1 + 40));
  xpc_dictionary_set_uint64(empty, "textureType", *(void *)(a1 + 48));
  xpc_dictionary_set_uint64(empty, "textureUsage", *(void *)(a1 + 56));
  xpc_dictionary_set_uint64(empty, "swizzle", *(unsigned int *)(a1 + 64));

  return empty;
}

{
  xpc_object_t v2;
  const re::DirectMemoryResource *v3;
  void *v4;
  void *v5;
  void v7[5];
  uint64_t vars8;

  v7[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = xpc_uuid_create((const unsigned __int8 *)a1);
  v7[0] = "identifier";
  v7[1] = v2;
  uint64_t v4 = re::xpc_object_create(*(re **)(a1 + 16), v3);
  v7[2] = "contents";
  v7[3] = v4;
  BOOL v5 = re::xpc_dictionary_create((uint64_t)v7, 2);

  return v5;
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void v8[9];
  uint64_t vars8;

  v8[8] = *MEMORY[0x263EF8340];
  uint64_t v2 = re::xpc_object_create<unsigned long>(a1);
  v8[0] = "partCount";
  v8[1] = v2;
  id v3 = re::xpc_object_create<re::DirectResourceId>(a1 + 16);
  v8[2] = "parts";
  v8[3] = v3;
  uint64_t v4 = re::xpc_object_create<re::DirectResourceId>(a1 + 33);
  v8[4] = "indices";
  v8[5] = v4;
  BOOL v5 = re::xpc_array_create_with<std::optional<re::DirectResourceId>,4ul>(a1 + 50);
  v8[6] = "vertices";
  v8[7] = v5;
  BOOL v6 = re::xpc_dictionary_create((uint64_t)v8, 4);

  return v6;
}

{
  void *v2;
  void *v3;
  void *v4;
  void v6[5];
  uint64_t vars8;

  v6[4] = *MEMORY[0x263EF8340];
  uint64_t v2 = re::xpc_object_create<unsigned long>(a1);
  v6[0] = "bytesUsed";
  v6[1] = v2;
  id v3 = re::xpc_object_create<re::DirectResourceId>(a1 + 16);
  v6[2] = "contents";
  v6[3] = v3;
  uint64_t v4 = re::xpc_dictionary_create((uint64_t)v6, 2);

  return v4;
}

{
  xpc_object_t v2;
  void *v3;
  void *v4;
  void *v5;
  void v7[7];
  uint64_t vars8;

  v7[6] = *MEMORY[0x263EF8340];
  uint64_t v2 = xpc_uuid_create((const unsigned __int8 *)a1);
  v7[0] = "identifier";
  v7[1] = v2;
  id v3 = re::xpc_object_create((uint64_t *)(a1 + 16));
  v7[2] = "description";
  v7[3] = v3;
  uint64_t v4 = re::xpc_object_create(a1 + 32);
  v7[4] = "contents";
  v7[5] = v4;
  BOOL v5 = re::xpc_dictionary_create((uint64_t)v7, 3);

  return v5;
}

id re::xpc_array_create_with<re::DirectMeshVertexAttribute>(uint64_t **a1)
{
  unint64_t v1 = a1[1];
  v4[0] = *a1;
  v4[1] = v1;
  uint64_t v2 = re::xpc_array_create_with<re::DirectMeshVertexAttribute>(v4);

  return v2;
}

{
  xpc_object_t empty;
  uint64_t *v3;
  uint64_t *v4;
  void *v5;
  xpc_object_t v6;
  uint64_t vars8;

  xpc_object_t empty = xpc_array_create_empty();
  id v3 = *a1;
  uint64_t v4 = a1[1];
  while (v3 != v4)
  {
    BOOL v5 = re::xpc_object_create(v3);
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      BOOL v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);
    }
    v3 += 4;
  }

  return empty;
}

id re::xpc_array_create_with<re::DirectMeshVertexLayout>(uint64_t **a1)
{
  unint64_t v1 = a1[1];
  v4[0] = *a1;
  v4[1] = v1;
  uint64_t v2 = re::xpc_array_create_with<re::DirectMeshVertexLayout>(v4);

  return v2;
}

{
  xpc_object_t empty;
  uint64_t *v3;
  uint64_t *v4;
  void *v5;
  xpc_object_t v6;
  uint64_t vars8;

  xpc_object_t empty = xpc_array_create_empty();
  id v3 = *a1;
  uint64_t v4 = a1[1];
  while (v3 != v4)
  {
    BOOL v5 = re::xpc_object_create(v3);
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      BOOL v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);
    }
    v3 += 5;
  }

  return empty;
}

id re::XPCObject::retain@<X0>(void *a1@<X0>, void *a2@<X8>)
{
  id result = a1;
  *a2 = result;
  return result;
}

void re::DirectResourceEvent::setValue(void **a1, void *a2)
{
  id v3 = a2;
  re::XPCObject::operator=(a1, &v3);
  re::XPCObject::~XPCObject(&v3);
}

id re::DirectResourceEvent::value(id *this)
{
  return *this;
}

BOOL re::xpc_get_value(void *a1, void **a2)
{
  id v3 = a1;
  uint64_t v4 = MEMORY[0x253313620]();
  uint64_t v5 = MEMORY[0x263EF8748];
  if (v4 == MEMORY[0x263EF8748]) {
    re::DirectResourceEvent::setValue(a2, v3);
  }

  return v4 == v5;
}

id re::xpc_object_create(re *this, const re::DirectMemoryResource *a2)
{
  v10[2] = *MEMORY[0x263EF8340];
  xpc_object_t v3 = xpc_uuid_create((const unsigned __int8 *)this + 16);
  v10[0] = "identifier";
  v10[1] = v3;
  uint64_t v4 = re::xpc_dictionary_create((uint64_t)v10, 1);

  int v5 = *((_DWORD *)this + 8);
  if ((v5 - 1) < 4)
  {
    BOOL v6 = (const void *)re::DirectMemoryResource::bytes(this);
    xpc_dictionary_set_data(v4, "data", v6, *((void *)this + 5));
    goto LABEL_8;
  }
  if (v5 == 6)
  {
    xpc_object_t XPCObject = IOSurfaceCreateXPCObject(*((IOSurfaceRef *)this + 7));
    id v8 = "iosurface";
  }
  else
  {
    if (v5 != 7) {
      goto LABEL_8;
    }
    xpc_object_t XPCObject = xpc_shmem_create(*(void **)(*((void *)this + 8) + 16), *(void *)(*((void *)this + 8) + 24));
    id v8 = "shmem";
  }
  xpc_dictionary_set_value(v4, v8, XPCObject);

LABEL_8:

  return v4;
}

BOOL re::xpc_get_value(void *a1, re::DirectMemoryResource **a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v3 = a1;
  if (MEMORY[0x253313620]() != MEMORY[0x263EF8758])
  {
    memset(dst, 0, sizeof(dst));
    uuid = xpc_dictionary_get_uuid(v3, "identifier");
    if (!uuid)
    {
      BOOL v9 = 0;
      goto LABEL_20;
    }
    uuid_copy(dst, uuid);
    int v5 = (re::DirectMemoryResource *)operator new(0x68uLL);
    BOOL v6 = re::DirectMemoryResource::DirectMemoryResource(v5, (const unsigned __int8 (*)[16])dst);
    uint64_t v7 = *a2;
    *a2 = v6;
    if (v7) {

    }
    size_t length = 0;
    data = xpc_dictionary_get_data(v3, "data", &length);
    if (data)
    {
      BOOL v9 = re::DirectMemoryResource::copyFromPrivateMemory(*a2, data, (re::MemoryMappedRegion *)length, 0);
      goto LABEL_20;
    }
    uint64_t v10 = xpc_dictionary_get_value(v3, "iosurface");
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = IOSurfaceLookupFromXPCObject(v10);
      if (v12)
      {
        BOOL v13 = v12;
        BOOL v9 = re::DirectMemoryResource::assignIOSurface(*a2, v12);
        CFRelease(v13);
LABEL_19:

        goto LABEL_20;
      }
    }
    else
    {
      uint64_t v14 = xpc_dictionary_get_value(v3, "shmem");
      uint64_t v11 = v14;
      if (v14)
      {
        region = 0;
        size_t v15 = xpc_shmem_map(v14, &region);
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *a2;
          uint64_t v18 = (re::MemoryMappedRegion *)operator new(0x20uLL);
          re::MemoryMappedRegion::MemoryMappedRegion(v18, region, v16);
          uint64_t v21 = v19;
          BOOL v9 = re::DirectMemoryResource::assignSharedMemory((uint64_t)v17, &v21);
          if (v21)
          {

            uint64_t v21 = 0;
          }
          goto LABEL_19;
        }
      }
    }
    BOOL v9 = 0;
    goto LABEL_19;
  }
  if (*a2)
  {

    *a2 = 0;
  }
  BOOL v9 = 1;
LABEL_20:

  return v9;
}

BOOL re::xpc_get_value<unsigned long>(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (!v3 || MEMORY[0x253313620](v3) == MEMORY[0x263EF8758])
  {
    *(unsigned char *)a2 = 0;
    *(unsigned char *)(a2 + 8) = 0;
    BOOL value = 1;
  }
  else
  {
    *(void *)a2 = 0;
    *(unsigned char *)(a2 + 8) = 1;
    BOOL value = re::xpc_get_value(v4, (uint64_t *)a2);
  }

  return value;
}

BOOL re::xpc_get_value<re::DirectResourceId>(void *a1, unsigned __int8 *a2)
{
  id v3 = a1;
  uint64_t v4 = v3;
  if (!v3 || MEMORY[0x253313620](v3) == MEMORY[0x263EF8758])
  {
    *a2 = 0;
    a2[16] = 0;
    BOOL value = 1;
  }
  else
  {
    if (a2[16]) {
      a2[16] = 0;
    }
    uuid_copy(a2, UUID_NULL);
    a2[16] = 1;
    BOOL value = re::xpc_get_value(v4, a2);
  }

  return value;
}

BOOL re::xpc_array_get_values<std::optional<re::DirectResourceId>,4ul>(void *a1, unsigned __int8 *a2)
{
  id v3 = a1;
  size_t count = xpc_array_get_count(v3);
  if (count >= 4) {
    unint64_t v5 = 4;
  }
  else {
    unint64_t v5 = count;
  }
  if (v5)
  {
    size_t v6 = 0;
    uint64_t v7 = a2;
    do
    {
      id v8 = xpc_array_get_value(v3, v6);
      BOOL v9 = re::xpc_get_value<re::DirectResourceId>(v8, v7);

      if (!v9)
      {
        BOOL v10 = 0;
        goto LABEL_15;
      }
      ++v6;
      v7 += 17;
    }
    while (v5 != v6);
    if (v5 <= 3) {
      goto LABEL_10;
    }
    BOOL v10 = 1;
  }
  else
  {
LABEL_10:
    unint64_t v11 = v5 - 3;
    uint64_t v12 = &a2[17 * v5];
    do
    {
      unint64_t v13 = v11;
      xpc_object_t v14 = xpc_null_create();
      BOOL v10 = re::xpc_get_value<re::DirectResourceId>(v14, v12);

      if (!v10) {
        break;
      }
      unint64_t v11 = v13 + 1;
      v12 += 17;
    }
    while (v13);
  }
LABEL_15:

  return v10;
}

id re::xpc_object_create<unsigned long>(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 8)) {
    xpc_object_t v1 = xpc_uint64_create(*(void *)a1);
  }
  else {
    xpc_object_t v1 = 0;
  }

  return v1;
}

id re::xpc_object_create<re::DirectResourceId>(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 16)) {
    xpc_object_t v1 = xpc_uuid_create((const unsigned __int8 *)a1);
  }
  else {
    xpc_object_t v1 = 0;
  }

  return v1;
}

id re::xpc_array_create_with<std::optional<re::DirectResourceId>,4ul>(uint64_t a1)
{
  v3[0] = a1;
  v3[1] = a1 + 68;
  xpc_object_t v1 = re::xpc_array_create_with<std::optional<re::DirectResourceId> const>(v3);

  return v1;
}

id re::xpc_object_create(const unsigned __int8 *a1)
{
  v7[6] = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_uuid_create(a1);
  v7[0] = "identifier";
  v7[1] = v2;
  id v3 = re::xpc_object_create((uint64_t)(a1 + 16));
  v7[2] = "description";
  v7[3] = v3;
  uint64_t v4 = re::xpc_object_create((uint64_t)(a1 + 96));
  v7[4] = "contents";
  v7[5] = v4;
  unint64_t v5 = re::xpc_dictionary_create((uint64_t)v7, 3);

  return v5;
}

{
  xpc_object_t v2;
  void *v3;
  void *v4;
  void v6[5];
  uint64_t vars8;

  v6[4] = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_uuid_create(a1);
  v6[0] = "identifier";
  v6[1] = v2;
  id v3 = re::xpc_object_create((uint64_t)(a1 + 16));
  v6[2] = "contents";
  v6[3] = v3;
  uint64_t v4 = re::xpc_dictionary_create((uint64_t)v6, 2);

  return v4;
}

{
  xpc_object_t v2;
  void *v3;
  xpc_object_t v4;
  void *v5;
  void v7[7];
  uint64_t vars8;

  v7[6] = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_uuid_create(a1);
  v7[0] = "identifier";
  v7[1] = v2;
  id v3 = re::xpc_object_create((uint64_t)(a1 + 16));
  v7[2] = "description";
  v7[3] = v3;
  uint64_t v4 = xpc_uuid_create(a1 + 88);
  v7[4] = "contents";
  v7[5] = v4;
  unint64_t v5 = re::xpc_dictionary_create((uint64_t)v7, 3);

  return v5;
}

{
  xpc_object_t v2;
  xpc_object_t v3;
  void *v4;
  void v6[5];
  uint64_t vars8;

  v6[4] = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_uuid_create(a1);
  v6[0] = "identifier";
  v6[1] = v2;
  id v3 = xpc_uuid_create(a1 + 16);
  v6[2] = "contents";
  v6[3] = v3;
  uint64_t v4 = re::xpc_dictionary_create((uint64_t)v6, 2);

  return v4;
}

{
  xpc_object_t v2;
  void *v3;
  void *v4;
  void v6[5];
  uint64_t vars8;

  v6[4] = *MEMORY[0x263EF8340];
  xpc_object_t v2 = xpc_uuid_create(a1);
  v6[0] = "identifier";
  v6[1] = v2;
  id v3 = re::xpc_object_create((uint64_t)(a1 + 16));
  v6[2] = "contents";
  v6[3] = v3;
  uint64_t v4 = re::xpc_dictionary_create((uint64_t)v6, 2);

  return v4;
}

uint64_t re::xpc_get_value(void *a1, unsigned __int8 *a2)
{
  id v3 = a1;
  uuid = xpc_dictionary_get_uuid(v3, "identifier");
  if (uuid && (uuid_copy(a2, uuid), (unint64_t v5 = xpc_dictionary_get_uuid(v3, "contents")) != 0))
  {
    uuid_copy(a2 + 16, v5);
    uint64_t v6 = 1;
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t re::xpc_get_value<re::CreateDirectMesh,re::UpdateDirectMesh>(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = xpc_dictionary_get_array(v3, "create");
  unint64_t v5 = v4;
  if (v4 && !re::xpc_array_get_values<re::CreateDirectMesh>(v4, (uint64_t *)a2)) {
    goto LABEL_8;
  }

  uint64_t v6 = xpc_dictionary_get_array(v3, "update");
  unint64_t v5 = v6;
  if (v6)
  {
    if (!re::xpc_array_get_values<re::UpdateDirectMesh>(v6, (void **)(a2 + 24))) {
      goto LABEL_8;
    }
  }

  uint64_t v7 = xpc_dictionary_get_array(v3, "destroy");
  unint64_t v5 = v7;
  if (v7 && !re::xpc_array_get_values<re::DestroyResource>(v7, (void **)(a2 + 48))) {
LABEL_8:
  }
    uint64_t v8 = 0;
  else {
    uint64_t v8 = 1;
  }

  return v8;
}

uint64_t re::xpc_get_value<re::CreateDirectTexture,re::UpdateDirectTexture>(void *a1, void **a2)
{
  id v3 = a1;
  uint64_t v4 = xpc_dictionary_get_array(v3, "create");
  unint64_t v5 = v4;
  if (v4 && !re::xpc_array_get_values<re::CreateDirectTexture>(v4, a2)) {
    goto LABEL_8;
  }

  uint64_t v6 = xpc_dictionary_get_array(v3, "update");
  unint64_t v5 = v6;
  if (v6)
  {
    if (!re::xpc_array_get_values<re::UpdateDirectTexture>(v6, a2 + 3)) {
      goto LABEL_8;
    }
  }

  uint64_t v7 = xpc_dictionary_get_array(v3, "destroy");
  unint64_t v5 = v7;
  if (v7 && !re::xpc_array_get_values<re::DestroyResource>(v7, a2 + 6)) {
LABEL_8:
  }
    uint64_t v8 = 0;
  else {
    uint64_t v8 = 1;
  }

  return v8;
}

uint64_t re::xpc_get_value<re::CreateDirectBuffer,re::UpdateDirectBuffer>(void *a1, void **a2)
{
  id v3 = a1;
  uint64_t v4 = xpc_dictionary_get_array(v3, "create");
  unint64_t v5 = v4;
  if (v4 && !re::xpc_array_get_values<re::CreateDirectBuffer>(v4, a2)) {
    goto LABEL_8;
  }

  uint64_t v6 = xpc_dictionary_get_array(v3, "update");
  unint64_t v5 = v6;
  if (v6)
  {
    if (!re::xpc_array_get_values<re::UpdateDirectBuffer>(v6, a2 + 3)) {
      goto LABEL_8;
    }
  }

  uint64_t v7 = xpc_dictionary_get_array(v3, "destroy");
  unint64_t v5 = v7;
  if (v7 && !re::xpc_array_get_values<re::DestroyResource>(v7, a2 + 6)) {
LABEL_8:
  }
    uint64_t v8 = 0;
  else {
    uint64_t v8 = 1;
  }

  return v8;
}

BOOL re::xpc_array_get_values<re::CreateDirectPayload>(void *a1, char **a2)
{
  id v3 = a1;
  size_t count = xpc_array_get_count(v3);
  std::vector<re::CreateDirectPayload>::reserve(a2, count);
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_19CreateDirectPayloadEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  BOOL v5 = xpc_array_apply(v3, applier);

  return v5;
}

BOOL re::xpc_array_get_values<re::DestroyResource>(void *a1, void **a2)
{
  id v3 = a1;
  size_t count = xpc_array_get_count(v3);
  std::vector<re::DestroyResource>::reserve(a2, count);
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_15DestroyResourceEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  BOOL v5 = xpc_array_apply(v3, applier);

  return v5;
}

id re::xpc_object_create(re *this, const re::DirectResourceCommands *a2)
{
  v13[4] = *MEMORY[0x263EF8340];
  xpc_object_t empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_uint64(empty, "identifier", *((void *)this + 2));
  uint64_t v4 = (void *)*((void *)this + 3);
  if (v4) {
    xpc_dictionary_set_value(empty, "userPayload", v4);
  }
  if (*((void *)this + 4))
  {
    BOOL v5 = re::DirectResourceEvent::value((id *)this + 4);
    xpc_dictionary_set_value(empty, "event", v5);
  }
  if (*((void *)this + 5) != *((void *)this + 6)
    || *((void *)this + 8) != *((void *)this + 9)
    || *((void *)this + 11) != *((void *)this + 12))
  {
    uint64_t v6 = re::xpc_object_create<re::CreateDirectMesh,re::UpdateDirectMesh>((const unsigned __int8 **)this + 5);
    xpc_dictionary_set_value(empty, "meshes", v6);
  }
  if (*((void *)this + 14) != *((void *)this + 15)
    || *((void *)this + 17) != *((void *)this + 18)
    || *((void *)this + 20) != *((void *)this + 21))
  {
    uint64_t v7 = re::xpc_object_create<re::CreateDirectTexture,re::UpdateDirectTexture>((const unsigned __int8 **)this + 14);
    xpc_dictionary_set_value(empty, "textures", v7);
  }
  if (*((void *)this + 23) != *((void *)this + 24)
    || *((void *)this + 26) != *((void *)this + 27)
    || *((void *)this + 29) != *((void *)this + 30))
  {
    uint64_t v8 = re::xpc_object_create<re::CreateDirectBuffer,re::UpdateDirectBuffer>((uint64_t)this + 184);
    xpc_dictionary_set_value(empty, "buffers", v8);
  }
  if (*((void *)this + 32) != *((void *)this + 33) || *((void *)this + 35) != *((void *)this + 36))
  {
    BOOL v9 = re::xpc_array_create_unless_empty<re::CreateDirectPayload>((uint64_t *)this + 32);
    v13[0] = "create";
    v13[1] = v9;
    BOOL v10 = re::xpc_array_create_unless_empty<re::DestroyResource>((const unsigned __int8 **)this + 35);
    v13[2] = "destroy";
    v13[3] = v10;
    unint64_t v11 = re::xpc_dictionary_create((uint64_t)v13, 2);
    xpc_dictionary_set_value(empty, "payloads", v11);
  }

  return empty;
}

id re::xpc_object_create<re::CreateDirectMesh,re::UpdateDirectMesh>(const unsigned __int8 **a1)
{
  v7[6] = *MEMORY[0x263EF8340];
  xpc_object_t v2 = re::xpc_array_create_unless_empty<re::CreateDirectMesh>(a1);
  v7[0] = "create";
  v7[1] = v2;
  id v3 = re::xpc_array_create_unless_empty<re::UpdateDirectMesh>(a1 + 3);
  v7[2] = "update";
  v7[3] = v3;
  uint64_t v4 = re::xpc_array_create_unless_empty<re::DestroyResource>(a1 + 6);
  v7[4] = "destroy";
  v7[5] = v4;
  BOOL v5 = re::xpc_dictionary_create((uint64_t)v7, 3);

  return v5;
}

id re::xpc_object_create<re::CreateDirectTexture,re::UpdateDirectTexture>(const unsigned __int8 **a1)
{
  v7[6] = *MEMORY[0x263EF8340];
  xpc_object_t v2 = re::xpc_array_create_unless_empty<re::CreateDirectTexture>(a1);
  v7[0] = "create";
  v7[1] = v2;
  id v3 = re::xpc_array_create_unless_empty<re::UpdateDirectTexture>(a1 + 3);
  v7[2] = "update";
  v7[3] = v3;
  uint64_t v4 = re::xpc_array_create_unless_empty<re::DestroyResource>(a1 + 6);
  v7[4] = "destroy";
  v7[5] = v4;
  BOOL v5 = re::xpc_dictionary_create((uint64_t)v7, 3);

  return v5;
}

id re::xpc_object_create<re::CreateDirectBuffer,re::UpdateDirectBuffer>(uint64_t a1)
{
  v7[6] = *MEMORY[0x263EF8340];
  xpc_object_t v2 = re::xpc_array_create_unless_empty<re::CreateDirectBuffer>((uint64_t *)a1);
  v7[0] = "create";
  v7[1] = v2;
  id v3 = re::xpc_array_create_unless_empty<re::UpdateDirectBuffer>((const unsigned __int8 **)(a1 + 24));
  v7[2] = "update";
  v7[3] = v3;
  uint64_t v4 = re::xpc_array_create_unless_empty<re::DestroyResource>((const unsigned __int8 **)(a1 + 48));
  v7[4] = "destroy";
  v7[5] = v4;
  BOOL v5 = re::xpc_dictionary_create((uint64_t)v7, 3);

  return v5;
}

id re::xpc_array_create_unless_empty<re::CreateDirectPayload>(uint64_t *a1)
{
  uint64_t v1 = a1[1];
  if (*a1 == v1)
  {
    xpc_object_t v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    xpc_object_t v2 = re::xpc_array_create_with<re::CreateDirectPayload>(v4);
  }

  return v2;
}

id re::xpc_array_create_unless_empty<re::DestroyResource>(const unsigned __int8 **a1)
{
  uint64_t v1 = a1[1];
  if (*a1 == v1)
  {
    xpc_object_t v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    xpc_object_t v2 = re::xpc_array_create_with<re::DestroyResource>(v4);
  }

  return v2;
}

void std::vector<re::DirectMeshVertexAttribute>::reserve(void **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 5)
  {
    if (a2 >> 59) {
      abort();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>(v3, a2);
    uint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFE0];
    BOOL v9 = &v6[32 * v8];
    unint64_t v11 = (char *)*a1;
    BOOL v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v13;
        v12 -= 32;
        v10 -= 32;
      }
      while (v10 != v11);
      BOOL v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

uint64_t ___ZN2re20xpc_array_get_valuesINS_25DirectMeshVertexAttributeEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 8);
  unint64_t v7 = *(void *)(v5 + 16);
  if ((unint64_t)v6 >= v7)
  {
    BOOL v9 = *(void **)v5;
    uint64_t v10 = ((uint64_t)v6 - *(void *)v5) >> 5;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 59) {
      abort();
    }
    uint64_t v12 = v7 - (void)v9;
    if (v12 >> 4 > v11) {
      unint64_t v11 = v12 >> 4;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v13 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      xpc_object_t v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>(v5 + 16, v13);
      BOOL v9 = *(void **)v5;
      uint64_t v6 = *(void **)(v5 + 8);
    }
    else
    {
      xpc_object_t v14 = 0;
    }
    size_t v15 = &v14[32 * v10];
    *(_DWORD *)size_t v15 = -1;
    *((void *)v15 + 2) = 0;
    *((void *)v15 + 3) = 0;
    uint64_t v16 = &v14[32 * v13];
    uint64_t v8 = v15 + 32;
    *((void *)v15 + 1) = 0;
    if (v6 != v9)
    {
      do
      {
        long long v17 = *((_OWORD *)v6 - 1);
        *((_OWORD *)v15 - 2) = *((_OWORD *)v6 - 2);
        *((_OWORD *)v15 - 1) = v17;
        v15 -= 32;
        v6 -= 4;
      }
      while (v6 != v9);
      BOOL v9 = *(void **)v5;
    }
    *(void *)uint64_t v5 = v15;
    *(void *)(v5 + 8) = v8;
    *(void *)(v5 + 16) = v16;
    if (v9) {
      operator delete(v9);
    }
  }
  else
  {
    *(_DWORD *)uint64_t v6 = -1;
    uint64_t v8 = (char *)(v6 + 4);
    v6[2] = 0;
    v6[3] = 0;
    v6[1] = 0;
  }
  *(void *)(v5 + 8) = v8;
  re::xpc_get_value(v4, *(void *)(*(void *)(a1 + 32) + 8) - 32);

  return 1;
}

void std::vector<re::DirectMeshVertexLayout>::reserve(void **a1, unint64_t a2)
{
  id v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xCCCCCCCCCCCCCCCDLL * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x666666666666667) {
      abort();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 40;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DirectMeshVertexLayout>>(v3, a2);
    unint64_t v7 = &v6[40 * v5];
    BOOL v9 = &v6[40 * v8];
    unint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 40);
        long long v14 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v14;
        *(_OWORD *)(v12 - 40) = v13;
        v12 -= 40;
        v10 -= 40;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

uint64_t ___ZN2re20xpc_array_get_valuesINS_22DirectMeshVertexLayoutEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void **)(v5 + 8);
  unint64_t v7 = *(void *)(v5 + 16);
  if ((unint64_t)v6 >= v7)
  {
    BOOL v9 = *(void **)v5;
    unint64_t v10 = 0xCCCCCCCCCCCCCCCDLL * (((uint64_t)v6 - *(void *)v5) >> 3);
    unint64_t v11 = v10 + 1;
    if (v10 + 1 > 0x666666666666666) {
      abort();
    }
    unint64_t v12 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(v7 - (void)v9) >> 3);
    if (2 * v12 > v11) {
      unint64_t v11 = 2 * v12;
    }
    if (v12 >= 0x333333333333333) {
      unint64_t v13 = 0x666666666666666;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13)
    {
      long long v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DirectMeshVertexLayout>>(v5 + 16, v13);
      BOOL v9 = *(void **)v5;
      uint64_t v6 = *(void **)(v5 + 8);
    }
    else
    {
      long long v14 = 0;
    }
    size_t v15 = &v14[40 * v10];
    uint64_t v16 = &v14[40 * v13];
    *(void *)size_t v15 = 0;
    *((void *)v15 + 1) = 0;
    *((void *)v15 + 2) = 0;
    *(int64x2_t *)(v15 + 24) = vdupq_n_s64(1uLL);
    uint64_t v8 = v15 + 40;
    if (v6 != v9)
    {
      do
      {
        long long v17 = *(_OWORD *)(v6 - 5);
        long long v18 = *(_OWORD *)(v6 - 3);
        *((void *)v15 - 1) = *(v6 - 1);
        *(_OWORD *)(v15 - 24) = v18;
        *(_OWORD *)(v15 - 40) = v17;
        v15 -= 40;
        v6 -= 5;
      }
      while (v6 != v9);
      BOOL v9 = *(void **)v5;
    }
    *(void *)uint64_t v5 = v15;
    *(void *)(v5 + 8) = v8;
    *(void *)(v5 + 16) = v16;
    if (v9) {
      operator delete(v9);
    }
  }
  else
  {
    *uint64_t v6 = 0;
    v6[1] = 0;
    v6[2] = 0;
    *(int64x2_t *)(v6 + 3) = vdupq_n_s64(1uLL);
    uint64_t v8 = (char *)(v6 + 5);
  }
  *(void *)(v5 + 8) = v8;
  re::xpc_get_value(v4, (uint64_t *)(*(void *)(*(void *)(a1 + 32) + 8) - 40));

  return 1;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::DirectMeshVertexLayout>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(40 * a2);
}

id re::xpc_array_create_with<std::optional<re::DirectResourceId> const>(uint64_t *a1)
{
  xpc_object_t empty = xpc_array_create_empty();
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  while (v3 != v4)
  {
    uint64_t v5 = re::xpc_object_create<re::DirectResourceId>(v3);
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);
    }
    v3 += 17;
  }

  return empty;
}

double re::make::shared::object<re::DirectResourceCommands>@<D0>(void *a1@<X8>)
{
  xpc_object_t v2 = operator new(0x130uLL);
  *xpc_object_t v2 = 0u;
  v2[1] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  v2[5] = 0u;
  v2[6] = 0u;
  v2[7] = 0u;
  v2[8] = 0u;
  v2[9] = 0u;
  v2[10] = 0u;
  v2[11] = 0u;
  v2[12] = 0u;
  v2[13] = 0u;
  v2[14] = 0u;
  v2[15] = 0u;
  v2[16] = 0u;
  v2[17] = 0u;
  v2[18] = 0u;
  v2[2] = 0u;
  ArcSharedObject::ArcSharedObject((ArcSharedObject *)v2, 0);
  *uint64_t v3 = &unk_26FF34A50;
  uint64_t v3[2] = 0;
  v3[3] = 0;
  re::DirectResourceEvent::DirectResourceEvent((void *)v2 + 4);
  *((void *)v2 + 37) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)v2 + 248) = 0u;
  *(_OWORD *)((char *)v2 + 232) = 0u;
  *(_OWORD *)((char *)v2 + 216) = 0u;
  *(_OWORD *)((char *)v2 + 200) = 0u;
  *(_OWORD *)((char *)v2 + 184) = 0u;
  *(_OWORD *)((char *)v2 + 168) = 0u;
  *(_OWORD *)((char *)v2 + 152) = 0u;
  *(_OWORD *)((char *)v2 + 136) = 0u;
  *(_OWORD *)((char *)v2 + 120) = 0u;
  *(_OWORD *)((char *)v2 + 104) = 0u;
  *(_OWORD *)((char *)v2 + 88) = 0u;
  *(_OWORD *)((char *)v2 + 72) = 0u;
  *(_OWORD *)((char *)v2 + 56) = 0u;
  *(_OWORD *)((char *)v2 + 40) = 0u;
  *(_OWORD *)((char *)v2 + 264) = 0u;
  *(_OWORD *)((char *)v2 + 280) = 0u;
  *a1 = v2;
  return result;
}

void re::DirectResourceCommands::~DirectResourceCommands(re::DirectResourceCommands *this)
{
  re::DirectResourceCommands::~DirectResourceCommands(this);

  JUMPOUT(0x2533130A0);
}

{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void **v11;

  *(void *)this = &unk_26FF34A50;
  xpc_object_t v2 = (void *)*((void *)this + 35);
  if (v2)
  {
    *((void *)this + 36) = v2;
    operator delete(v2);
  }
  unint64_t v11 = (void **)((char *)this + 256);
  std::vector<re::CreateDirectPayload>::__destroy_vector::operator()[abi:nn180100](&v11);
  uint64_t v3 = (void *)*((void *)this + 29);
  if (v3)
  {
    *((void *)this + 30) = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)*((void *)this + 26);
  if (v4)
  {
    *((void *)this + 27) = v4;
    operator delete(v4);
  }
  uint64_t v5 = (void *)*((void *)this + 23);
  if (v5)
  {
    *((void *)this + 24) = v5;
    operator delete(v5);
  }
  xpc_object_t v6 = (void *)*((void *)this + 20);
  if (v6)
  {
    *((void *)this + 21) = v6;
    operator delete(v6);
  }
  unint64_t v7 = (void *)*((void *)this + 17);
  if (v7)
  {
    *((void *)this + 18) = v7;
    operator delete(v7);
  }
  uint64_t v8 = (void *)*((void *)this + 14);
  if (v8)
  {
    *((void *)this + 15) = v8;
    operator delete(v8);
  }
  BOOL v9 = (void *)*((void *)this + 11);
  if (v9)
  {
    *((void *)this + 12) = v9;
    operator delete(v9);
  }
  unint64_t v10 = (void *)*((void *)this + 8);
  if (v10)
  {
    *((void *)this + 9) = v10;
    operator delete(v10);
  }
  unint64_t v11 = (void **)((char *)this + 40);
  std::vector<re::CreateDirectMesh>::__destroy_vector::operator()[abi:nn180100](&v11);
  re::XPCObject::~XPCObject((void **)this + 4);
  re::XPCObject::~XPCObject((void **)this + 3);
  ArcSharedObject::~ArcSharedObject(this);
}

void std::vector<re::CreateDirectPayload>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  xpc_object_t v2 = *a1;
  if (*v2)
  {
    std::vector<re::CreateDirectPayload>::__clear[abi:nn180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<re::CreateDirectPayload>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 24)
  {
    uint64_t v4 = *(void *)(i - 8);
    if (v4)
    {

      *(void *)(i - 8) = 0;
    }
  }
  a1[1] = v2;
}

void std::vector<re::CreateDirectMesh>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v1 = *a1;
  uint64_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    uint64_t v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 27;
        std::allocator<re::CreateDirectMesh>::destroy[abi:nn180100]((uint64_t)(v1 + 2), v4);
      }
      while (v4 != v2);
      uint64_t v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<re::CreateDirectMesh>::destroy[abi:nn180100](uint64_t a1, void *a2)
{
  uint64_t v3 = (void *)a2[9];
  if (v3)
  {
    a2[10] = v3;
    operator delete(v3);
  }
  uint64_t v4 = (void *)a2[6];
  if (v4)
  {
    a2[7] = v4;
    operator delete(v4);
  }
}

BOOL re::xpc_array_get_values<re::CreateDirectMesh>(void *a1, uint64_t *a2)
{
  id v3 = a1;
  size_t count = xpc_array_get_count(v3);
  std::vector<re::CreateDirectMesh>::reserve(a2, count);
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_16CreateDirectMeshEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  BOOL v5 = xpc_array_apply(v3, applier);

  return v5;
}

BOOL re::xpc_array_get_values<re::UpdateDirectMesh>(void *a1, void **a2)
{
  id v3 = a1;
  size_t count = xpc_array_get_count(v3);
  std::vector<re::UpdateDirectMesh>::reserve(a2, count);
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_16UpdateDirectMeshEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  BOOL v5 = xpc_array_apply(v3, applier);

  return v5;
}

void **std::vector<re::CreateDirectMesh>::reserve(uint64_t *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  double result = (void **)(a1 + 2);
  if (0x84BDA12F684BDA13 * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0x12F684BDA12F685) {
      abort();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectMesh>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    v7[2] = (char *)v7[0] + v5;
    v7[3] = (char *)v7[0] + 216 * v6;
    std::vector<re::CreateDirectMesh>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<re::CreateDirectMesh>::~__split_buffer(v7);
  }
  return result;
}

BOOL ___ZN2re20xpc_array_get_valuesINS_16CreateDirectMeshEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v30[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *(uint64_t **)(a1 + 32);
  uuid_copy((unsigned __int8 *)&v20, UUID_NULL);
  long long v21 = xmmword_24CD45800;
  *(void *)long long v22 = 1;
  __p[32] = 0;
  LOBYTE(v24) = 0;
  LOWORD(v25) = 0;
  BYTE1(v26) = 0;
  memset(&v22[8], 0, 32);
  memset(__p, 0, 25);
  uint64_t v6 = 146;
  do
  {
    unint64_t v7 = (char *)&v20 + v6;
    char *v7 = 0;
    v7[16] = 0;
    v6 += 17;
  }
  while (v7 + 17 != (char *)v30 + 6);
  unint64_t v8 = v5[1];
  if (v8 >= v5[2])
  {
    uint64_t Direct = std::vector<re::CreateDirectMesh>::__push_back_slow_path<re::CreateDirectMesh>(v5, (uint64_t)&v20);
    long long v17 = *(void **)__p;
    v5[1] = Direct;
    if (v17)
    {
      *(void *)&__p[8] = v17;
      operator delete(v17);
    }
  }
  else
  {
    *(_OWORD *)unint64_t v8 = v20;
    long long v9 = *(_OWORD *)v22;
    *(_OWORD *)(v8 + 16) = v21;
    *(_OWORD *)(v8 + 32) = v9;
    *(void *)(v8 + 56) = 0;
    *(void *)(v8 + 64) = 0;
    *(void *)(v8 + 48) = 0;
    *(_OWORD *)(v8 + 48) = *(_OWORD *)&v22[16];
    *(void *)(v8 + 64) = *(void *)&v22[32];
    *(void *)(v8 + 72) = 0;
    memset(&v22[16], 0, 24);
    *(void *)(v8 + 80) = 0;
    *(void *)(v8 + 88) = 0;
    *(_OWORD *)(v8 + 72) = *(_OWORD *)__p;
    *(void *)(v8 + 88) = *(void *)&__p[16];
    memset(__p, 0, 24);
    long long v10 = *(_OWORD *)&__p[24];
    long long v11 = v24;
    long long v12 = v26;
    *(_OWORD *)(v8 + 128) = v25;
    *(_OWORD *)(v8 + 144) = v12;
    *(_OWORD *)(v8 + 96) = v10;
    *(_OWORD *)(v8 + 112) = v11;
    long long v13 = v27;
    long long v14 = v28;
    long long v15 = v29;
    *(void *)(v8 + 208) = v30[0];
    *(_OWORD *)(v8 + 176) = v14;
    *(_OWORD *)(v8 + 192) = v15;
    *(_OWORD *)(v8 + 160) = v13;
    v5[1] = v8 + 216;
  }
  if (*(void *)&v22[16])
  {
    *(void *)&v22[24] = *(void *)&v22[16];
    operator delete(*(void **)&v22[16]);
  }
  BOOL value = re::xpc_get_value(v4, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) - 216));

  return value;
}

void std::vector<re::CreateDirectMesh>::__swap_out_circular_buffer(uint64_t *a1, void *a2)
{
  std::__uninitialized_allocator_move_if_noexcept[abi:nn180100]<std::allocator<re::CreateDirectMesh>,std::reverse_iterator<re::CreateDirectMesh*>,std::reverse_iterator<re::CreateDirectMesh*>,std::reverse_iterator<re::CreateDirectMesh*>>((uint64_t)(a1 + 2), a1[1], a1[1], *a1, *a1, a2[1], a2[1]);
  a2[1] = v4;
  uint64_t v5 = *a1;
  *a1 = v4;
  a2[1] = v5;
  uint64_t v6 = a1[1];
  a1[1] = a2[2];
  a2[2] = v6;
  uint64_t v7 = a1[2];
  a1[2] = a2[3];
  a2[3] = v7;
  *a2 = a2[1];
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectMesh>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x12F684BDA12F685) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(216 * a2);
}

__n128 std::__uninitialized_allocator_move_if_noexcept[abi:nn180100]<std::allocator<re::CreateDirectMesh>,std::reverse_iterator<re::CreateDirectMesh*>,std::reverse_iterator<re::CreateDirectMesh*>,std::reverse_iterator<re::CreateDirectMesh*>>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a3 != a5)
  {
    uint64_t v7 = 0;
    do
    {
      uint64_t v8 = a7 + v7;
      uint64_t v9 = a3 + v7;
      *(_OWORD *)(v8 - 216) = *(_OWORD *)(a3 + v7 - 216);
      long long v10 = *(_OWORD *)(a3 + v7 - 200);
      *(_OWORD *)(v8 - 184) = *(_OWORD *)(a3 + v7 - 184);
      *(void *)(v8 - 160) = 0;
      *(void *)(v8 - 152) = 0;
      *(void *)(v8 - 168) = 0;
      *(_OWORD *)(v8 - 200) = v10;
      *(_OWORD *)(v8 - 168) = *(_OWORD *)(a3 + v7 - 168);
      *(void *)(v8 - 152) = *(void *)(a3 + v7 - 152);
      *(void *)(v9 - 168) = 0;
      *(void *)(v9 - 160) = 0;
      *(void *)(v9 - 152) = 0;
      *(void *)(v8 - 144) = 0;
      *(void *)(v8 - 136) = 0;
      *(void *)(v8 - 128) = 0;
      *(_OWORD *)(v8 - 144) = *(_OWORD *)(a3 + v7 - 144);
      *(void *)(v8 - 128) = *(void *)(a3 + v7 - 128);
      *(void *)(v9 - 136) = 0;
      *(void *)(v9 - 128) = 0;
      *(void *)(v9 - 144) = 0;
      long long v11 = *(_OWORD *)(a3 + v7 - 40);
      long long v12 = *(_OWORD *)(a3 + v7 - 24);
      uint64_t v13 = *(void *)(a3 + v7 - 8);
      *(_OWORD *)(v8 - 56) = *(_OWORD *)(a3 + v7 - 56);
      *(void *)(v8 - 8) = v13;
      *(_OWORD *)(v8 - 24) = v12;
      *(_OWORD *)(v8 - 40) = v11;
      __n128 result = *(__n128 *)(a3 + v7 - 120);
      long long v15 = *(_OWORD *)(a3 + v7 - 104);
      long long v16 = *(_OWORD *)(a3 + v7 - 88);
      *(_OWORD *)(v8 - 72) = *(_OWORD *)(a3 + v7 - 72);
      *(_OWORD *)(v8 - 88) = v16;
      *(_OWORD *)(v8 - 104) = v15;
      *(__n128 *)(v8 - 120) = result;
      v7 -= 216;
    }
    while (a3 + v7 != a5);
  }
  return result;
}

void **std::__split_buffer<re::CreateDirectMesh>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<re::CreateDirectMesh>::clear[abi:nn180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 216;
    std::allocator<re::CreateDirectMesh>::destroy[abi:nn180100](v4, (void *)(i - 216));
  }
}

uint64_t std::vector<re::CreateDirectMesh>::__push_back_slow_path<re::CreateDirectMesh>(uint64_t *a1, uint64_t a2)
{
  uint64_t v2 = *a1;
  unint64_t v3 = 0x84BDA12F684BDA13 * ((a1[1] - *a1) >> 3);
  unint64_t v4 = v3 + 1;
  if (v3 + 1 > 0x12F684BDA12F684) {
    abort();
  }
  uint64_t v8 = a1[2];
  uint64_t v7 = a1 + 2;
  unint64_t v9 = 0x84BDA12F684BDA13 * ((v8 - v2) >> 3);
  if (2 * v9 > v4) {
    unint64_t v4 = 2 * v9;
  }
  if (v9 >= 0x97B425ED097B42) {
    unint64_t v10 = 0x12F684BDA12F684;
  }
  else {
    unint64_t v10 = v4;
  }
  v22[4] = v7;
  if (v10) {
    uint64_t Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectMesh>>((uint64_t)v7, v10);
  }
  else {
    uint64_t Direct = 0;
  }
  long long v12 = &Direct[216 * v3];
  v22[0] = Direct;
  v22[1] = v12;
  v22[3] = &Direct[216 * v10];
  *(_OWORD *)long long v12 = *(_OWORD *)a2;
  long long v13 = *(_OWORD *)(a2 + 32);
  *((_OWORD *)v12 + 1) = *(_OWORD *)(a2 + 16);
  *((_OWORD *)v12 + 2) = v13;
  *((void *)v12 + 7) = 0;
  *((void *)v12 + 8) = 0;
  *((void *)v12 + 6) = 0;
  *((_OWORD *)v12 + 3) = *(_OWORD *)(a2 + 48);
  *((void *)v12 + 8) = *(void *)(a2 + 64);
  *(void *)(a2 + 48) = 0;
  *(void *)(a2 + 56) = 0;
  *(void *)(a2 + 64) = 0;
  *((void *)v12 + 9) = 0;
  *((void *)v12 + 10) = 0;
  *((void *)v12 + 11) = 0;
  *(_OWORD *)(v12 + 72) = *(_OWORD *)(a2 + 72);
  *((void *)v12 + 11) = *(void *)(a2 + 88);
  *(void *)(a2 + 80) = 0;
  *(void *)(a2 + 88) = 0;
  *(void *)(a2 + 72) = 0;
  long long v15 = *(_OWORD *)(a2 + 176);
  long long v14 = *(_OWORD *)(a2 + 192);
  long long v16 = *(_OWORD *)(a2 + 160);
  *((void *)v12 + 26) = *(void *)(a2 + 208);
  *((_OWORD *)v12 + 11) = v15;
  *((_OWORD *)v12 + 12) = v14;
  *((_OWORD *)v12 + 10) = v16;
  long long v17 = *(_OWORD *)(a2 + 96);
  long long v18 = *(_OWORD *)(a2 + 112);
  long long v19 = *(_OWORD *)(a2 + 144);
  *((_OWORD *)v12 + 8) = *(_OWORD *)(a2 + 128);
  *((_OWORD *)v12 + 9) = v19;
  *((_OWORD *)v12 + 6) = v17;
  *((_OWORD *)v12 + 7) = v18;
  v22[2] = v12 + 216;
  std::vector<re::CreateDirectMesh>::__swap_out_circular_buffer(a1, v22);
  uint64_t v20 = a1[1];
  std::__split_buffer<re::CreateDirectMesh>::~__split_buffer(v22);
  return v20;
}

void std::vector<re::UpdateDirectMesh>::reserve(void **a1, unint64_t a2)
{
  unint64_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0xF0F0F0F0F0F0F0F1 * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x1E1E1E1E1E1E1E2) {
      abort();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 136;
    updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectMesh>>(v3, a2);
    uint64_t v7 = &updated[136 * v5];
    unint64_t v9 = &updated[136 * v8];
    long long v11 = (char *)*a1;
    unint64_t v10 = (char *)a1[1];
    long long v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *(_OWORD *)(v12 - 136) = *(_OWORD *)(v10 - 136);
        long long v13 = *(_OWORD *)(v10 - 120);
        long long v14 = *(_OWORD *)(v10 - 104);
        long long v15 = *(_OWORD *)(v10 - 88);
        *(_OWORD *)(v12 - 72) = *(_OWORD *)(v10 - 72);
        *(_OWORD *)(v12 - 88) = v15;
        *(_OWORD *)(v12 - 104) = v14;
        *(_OWORD *)(v12 - 120) = v13;
        long long v16 = *(_OWORD *)(v10 - 56);
        long long v17 = *(_OWORD *)(v10 - 40);
        long long v18 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v18;
        *(_OWORD *)(v12 - 40) = v17;
        *(_OWORD *)(v12 - 56) = v16;
        v12 -= 136;
        v10 -= 136;
      }
      while (v10 != v11);
      unint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

BOOL ___ZN2re20xpc_array_get_valuesINS_16UpdateDirectMeshEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v48[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *(void ***)(a1 + 32);
  uuid_copy((unsigned __int8 *)&v40, UUID_NULL);
  LOBYTE(v41) = 0;
  BYTE8(v41) = 0;
  LOBYTE(v42) = 0;
  LOWORD(v43) = 0;
  uint64_t v6 = 66;
  BYTE1(v44) = 0;
  do
  {
    uint64_t v7 = (char *)&v40 + v6;
    char *v7 = 0;
    v7[16] = 0;
    v6 += 17;
  }
  while (v7 + 17 != (char *)v48 + 6);
  uint64_t v8 = (char *)v5[2];
  unint64_t v9 = (char *)v5[1];
  if (v9 >= v8)
  {
    unint64_t v17 = 0xF0F0F0F0F0F0F0F1 * ((v9 - (unsigned char *)*v5) >> 3);
    unint64_t v18 = v17 + 1;
    if (v17 + 1 > 0x1E1E1E1E1E1E1E1) {
      abort();
    }
    unint64_t v19 = 0xF0F0F0F0F0F0F0F1 * ((v8 - (unsigned char *)*v5) >> 3);
    if (2 * v19 > v18) {
      unint64_t v18 = 2 * v19;
    }
    if (v19 >= 0xF0F0F0F0F0F0F0) {
      unint64_t v20 = 0x1E1E1E1E1E1E1E1;
    }
    else {
      unint64_t v20 = v18;
    }
    if (v20) {
      updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectMesh>>((uint64_t)(v5 + 2), v20);
    }
    else {
      updated = 0;
    }
    long long v22 = &updated[136 * v17];
    v23 = &updated[136 * v20];
    *(_OWORD *)long long v22 = v40;
    long long v24 = v41;
    long long v25 = v42;
    long long v26 = v44;
    *((_OWORD *)v22 + 3) = v43;
    *((_OWORD *)v22 + 4) = v26;
    *((_OWORD *)v22 + 1) = v24;
    *((_OWORD *)v22 + 2) = v25;
    long long v27 = v45;
    long long v28 = v46;
    long long v29 = v47;
    *((void *)v22 + 16) = v48[0];
    *((_OWORD *)v22 + 6) = v28;
    *((_OWORD *)v22 + 7) = v29;
    *((_OWORD *)v22 + 5) = v27;
    long long v16 = v22 + 136;
    v31 = (char *)*v5;
    v30 = (char *)v5[1];
    if (v30 != *v5)
    {
      do
      {
        *(_OWORD *)(v22 - 136) = *(_OWORD *)(v30 - 136);
        long long v32 = *(_OWORD *)(v30 - 120);
        long long v33 = *(_OWORD *)(v30 - 104);
        long long v34 = *(_OWORD *)(v30 - 88);
        *(_OWORD *)(v22 - 72) = *(_OWORD *)(v30 - 72);
        *(_OWORD *)(v22 - 88) = v34;
        *(_OWORD *)(v22 - 104) = v33;
        *(_OWORD *)(v22 - 120) = v32;
        long long v35 = *(_OWORD *)(v30 - 56);
        long long v36 = *(_OWORD *)(v30 - 40);
        long long v37 = *(_OWORD *)(v30 - 24);
        *((void *)v22 - 1) = *((void *)v30 - 1);
        *(_OWORD *)(v22 - 24) = v37;
        *(_OWORD *)(v22 - 40) = v36;
        *(_OWORD *)(v22 - 56) = v35;
        v22 -= 136;
        v30 -= 136;
      }
      while (v30 != v31);
      v30 = (char *)*v5;
    }
    *uint64_t v5 = v22;
    v5[1] = v16;
    void v5[2] = v23;
    if (v30) {
      operator delete(v30);
    }
  }
  else
  {
    *(_OWORD *)unint64_t v9 = v40;
    long long v10 = v41;
    long long v11 = v42;
    long long v12 = v44;
    *((_OWORD *)v9 + 3) = v43;
    *((_OWORD *)v9 + 4) = v12;
    *((_OWORD *)v9 + 1) = v10;
    *((_OWORD *)v9 + 2) = v11;
    long long v13 = v45;
    long long v14 = v46;
    long long v15 = v47;
    *((void *)v9 + 16) = v48[0];
    *((_OWORD *)v9 + 6) = v14;
    *((_OWORD *)v9 + 7) = v15;
    *((_OWORD *)v9 + 5) = v13;
    long long v16 = v9 + 136;
  }
  v5[1] = v16;
  BOOL value = re::xpc_get_value(v4, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) - 136));

  return value;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectMesh>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x1E1E1E1E1E1E1E2) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(136 * a2);
}

BOOL re::xpc_array_get_values<re::CreateDirectTexture>(void *a1, void **a2)
{
  id v3 = a1;
  size_t count = xpc_array_get_count(v3);
  std::vector<re::CreateDirectTexture>::reserve(a2, count);
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_19CreateDirectTextureEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  BOOL v5 = xpc_array_apply(v3, applier);

  return v5;
}

BOOL re::xpc_array_get_values<re::UpdateDirectTexture>(void *a1, void **a2)
{
  id v3 = a1;
  size_t count = xpc_array_get_count(v3);
  std::vector<re::DirectMeshVertexAttribute>::reserve(a2, count);
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_19UpdateDirectTextureEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  BOOL v5 = xpc_array_apply(v3, applier);

  return v5;
}

void std::vector<re::CreateDirectTexture>::reserve(void **a1, unint64_t a2)
{
  id v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0x4EC4EC4EC4EC4EC5 * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x276276276276277) {
      abort();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 104;
    uint64_t Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectTexture>>(v3, a2);
    uint64_t v7 = &Direct[104 * v5];
    unint64_t v9 = &Direct[104 * v8];
    long long v11 = (char *)*a1;
    long long v10 = (char *)a1[1];
    long long v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 104);
        long long v14 = *(_OWORD *)(v10 - 88);
        *(_OWORD *)(v12 - 72) = *(_OWORD *)(v10 - 72);
        *(_OWORD *)(v12 - 88) = v14;
        *(_OWORD *)(v12 - 104) = v13;
        long long v15 = *(_OWORD *)(v10 - 56);
        long long v16 = *(_OWORD *)(v10 - 40);
        long long v17 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v17;
        *(_OWORD *)(v12 - 40) = v16;
        *(_OWORD *)(v12 - 56) = v15;
        v12 -= 104;
        v10 -= 104;
      }
      while (v10 != v11);
      long long v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

BOOL ___ZN2re20xpc_array_get_valuesINS_19CreateDirectTextureEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *(void ***)(a1 + 32);
  uuid_copy((unsigned __int8 *)&v35, UUID_NULL);
  int64x2_t v36 = vdupq_n_s64(1uLL);
  int64x2_t v37 = v36;
  long long v38 = xmmword_24CD45810;
  long long v39 = xmmword_24CD45820;
  v40.i32[0] = 84148994;
  uuid_copy(&v40.u8[8], UUID_NULL);
  uint64_t v6 = (int64x2_t *)v5[1];
  uint64_t v7 = (int64x2_t *)v5[2];
  if (v6 >= v7)
  {
    uint64_t v14 = 0x4EC4EC4EC4EC4EC5 * (((char *)v6 - (unsigned char *)*v5) >> 3);
    unint64_t v15 = v14 + 1;
    if ((unint64_t)(v14 + 1) > 0x276276276276276) {
      abort();
    }
    unint64_t v16 = 0x4EC4EC4EC4EC4EC5 * (((char *)v7 - (unsigned char *)*v5) >> 3);
    if (2 * v16 > v15) {
      unint64_t v15 = 2 * v16;
    }
    if (v16 >= 0x13B13B13B13B13BLL) {
      unint64_t v17 = 0x276276276276276;
    }
    else {
      unint64_t v17 = v15;
    }
    if (v17) {
      uint64_t Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectTexture>>((uint64_t)(v5 + 2), v17);
    }
    else {
      uint64_t Direct = 0;
    }
    unint64_t v19 = (int64x2_t *)&Direct[104 * v14];
    unint64_t v20 = &Direct[104 * v17];
    int64x2_t v21 = v35;
    int64x2_t v22 = v37;
    v19[1] = v36;
    v19[2] = v22;
    int64x2_t *v19 = v21;
    long long v23 = v38;
    long long v24 = v39;
    int64x2_t v25 = v40;
    v19[6].i64[0] = v41;
    v19[4] = (int64x2_t)v24;
    v19[5] = v25;
    v19[3] = (int64x2_t)v23;
    long long v13 = &v19[6].i8[8];
    long long v27 = (char *)*v5;
    long long v26 = (char *)v5[1];
    if (v26 != *v5)
    {
      do
      {
        int64x2_t v28 = *(int64x2_t *)(v26 - 104);
        int64x2_t v29 = *(int64x2_t *)(v26 - 88);
        *(int64x2_t *)((char *)v19 - 72) = *(int64x2_t *)(v26 - 72);
        *(int64x2_t *)((char *)v19 - 88) = v29;
        *(int64x2_t *)((char *)v19 - 104) = v28;
        int64x2_t v30 = *(int64x2_t *)(v26 - 56);
        int64x2_t v31 = *(int64x2_t *)(v26 - 40);
        int64x2_t v32 = *(int64x2_t *)(v26 - 24);
        v19[-1].i64[1] = *((void *)v26 - 1);
        *(int64x2_t *)((char *)v19 - 24) = v32;
        *(int64x2_t *)((char *)v19 - 40) = v31;
        *(int64x2_t *)((char *)v19 - 56) = v30;
        unint64_t v19 = (int64x2_t *)((char *)v19 - 104);
        v26 -= 104;
      }
      while (v26 != v27);
      long long v26 = (char *)*v5;
    }
    *uint64_t v5 = v19;
    v5[1] = v13;
    void v5[2] = v20;
    if (v26) {
      operator delete(v26);
    }
  }
  else
  {
    int64x2_t v8 = v35;
    int64x2_t v9 = v37;
    v6[1] = v36;
    v6[2] = v9;
    *uint64_t v6 = v8;
    long long v10 = v38;
    long long v11 = v39;
    int64x2_t v12 = v40;
    v6[6].i64[0] = v41;
    v6[4] = (int64x2_t)v11;
    v6[5] = v12;
    v6[3] = (int64x2_t)v10;
    long long v13 = &v6[6].i8[8];
  }
  v5[1] = v13;
  BOOL value = re::xpc_get_value(v4, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) - 104));

  return value;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectTexture>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x276276276276277) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(104 * a2);
}

uint64_t ___ZN2re20xpc_array_get_valuesINS_19UpdateDirectTextureEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *(void ***)(a1 + 32);
  uuid_copy(dst, UUID_NULL);
  uuid_copy((unsigned __int8 *)&v24, UUID_NULL);
  uint64_t v6 = v5[1];
  unint64_t v7 = (unint64_t)v5[2];
  if ((unint64_t)v6 >= v7)
  {
    uint64_t v10 = ((char *)v6 - (unsigned char *)*v5) >> 5;
    unint64_t v11 = v10 + 1;
    if ((unint64_t)(v10 + 1) >> 59) {
      abort();
    }
    uint64_t v12 = v7 - (void)*v5;
    if (v12 >> 4 > v11) {
      unint64_t v11 = v12 >> 4;
    }
    if ((unint64_t)v12 >= 0x7FFFFFFFFFFFFFE0) {
      unint64_t v13 = 0x7FFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v11;
    }
    if (v13) {
      uint64_t v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>((uint64_t)(v5 + 2), v13);
    }
    else {
      uint64_t v14 = 0;
    }
    unint64_t v15 = &v14[32 * v10];
    unint64_t v16 = &v14[32 * v13];
    long long v17 = v24;
    *(_OWORD *)unint64_t v15 = *(_OWORD *)dst;
    *((_OWORD *)v15 + 1) = v17;
    int64x2_t v9 = v15 + 32;
    unint64_t v19 = (char *)*v5;
    unint64_t v18 = (char *)v5[1];
    if (v18 != *v5)
    {
      do
      {
        long long v20 = *((_OWORD *)v18 - 1);
        *((_OWORD *)v15 - 2) = *((_OWORD *)v18 - 2);
        *((_OWORD *)v15 - 1) = v20;
        v15 -= 32;
        v18 -= 32;
      }
      while (v18 != v19);
      unint64_t v18 = (char *)*v5;
    }
    *uint64_t v5 = v15;
    v5[1] = v9;
    void v5[2] = v16;
    if (v18) {
      operator delete(v18);
    }
  }
  else
  {
    long long v8 = v24;
    *uint64_t v6 = *(_OWORD *)dst;
    v6[1] = v8;
    int64x2_t v9 = v6 + 2;
  }
  v5[1] = v9;
  uint64_t value = re::xpc_get_value(v4, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) - 32));

  return value;
}

BOOL re::xpc_array_get_values<re::CreateDirectBuffer>(void *a1, void **a2)
{
  id v3 = a1;
  size_t count = xpc_array_get_count(v3);
  std::vector<re::CreateDirectBuffer>::reserve(a2, count);
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_18CreateDirectBufferEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  BOOL v5 = xpc_array_apply(v3, applier);

  return v5;
}

BOOL re::xpc_array_get_values<re::UpdateDirectBuffer>(void *a1, void **a2)
{
  id v3 = a1;
  size_t count = xpc_array_get_count(v3);
  std::vector<re::UpdateDirectBuffer>::reserve(a2, count);
  applier[0] = MEMORY[0x263EF8330];
  applier[1] = 3221225472;
  applier[2] = ___ZN2re20xpc_array_get_valuesINS_18UpdateDirectBufferEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke;
  applier[3] = &__block_descriptor_40_e36_B24__0Q8__NSObject_OS_xpc_object__16l;
  applier[4] = a2;
  BOOL v5 = xpc_array_apply(v3, applier);

  return v5;
}

void std::vector<re::CreateDirectBuffer>::reserve(void **a1, unint64_t a2)
{
  id v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0x8E38E38E38E38E39 * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x38E38E38E38E38FLL) {
      abort();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 72;
    uint64_t Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectBuffer>>(v3, a2);
    unint64_t v7 = &Direct[72 * v5];
    int64x2_t v9 = &Direct[72 * v8];
    unint64_t v11 = (char *)*a1;
    uint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *(_OWORD *)(v12 - 72) = *(_OWORD *)(v10 - 72);
        long long v13 = *(_OWORD *)(v10 - 56);
        long long v14 = *(_OWORD *)(v10 - 40);
        long long v15 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v15;
        *(_OWORD *)(v12 - 40) = v14;
        *(_OWORD *)(v12 - 56) = v13;
        v12 -= 72;
        v10 -= 72;
      }
      while (v10 != v11);
      uint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

BOOL ___ZN2re20xpc_array_get_valuesINS_18CreateDirectBufferEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *(void ***)(a1 + 32);
  uuid_copy((unsigned __int8 *)&v29, UUID_NULL);
  long long v30 = xmmword_24CD45830;
  LOBYTE(v31) = 0;
  BYTE8(v31) = 0;
  LOBYTE(v32) = 0;
  LOBYTE(v33) = 0;
  uint64_t v6 = (char *)v5[1];
  unint64_t v7 = (char *)v5[2];
  if (v6 >= v7)
  {
    unint64_t v12 = 0x8E38E38E38E38E39 * ((v6 - (unsigned char *)*v5) >> 3);
    unint64_t v13 = v12 + 1;
    if (v12 + 1 > 0x38E38E38E38E38ELL) {
      abort();
    }
    unint64_t v14 = 0x8E38E38E38E38E39 * ((v7 - (unsigned char *)*v5) >> 3);
    if (2 * v14 > v13) {
      unint64_t v13 = 2 * v14;
    }
    if (v14 >= 0x1C71C71C71C71C7) {
      unint64_t v15 = 0x38E38E38E38E38ELL;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15) {
      uint64_t Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectBuffer>>((uint64_t)(v5 + 2), v15);
    }
    else {
      uint64_t Direct = 0;
    }
    long long v17 = &Direct[72 * v12];
    unint64_t v18 = &Direct[72 * v15];
    *(_OWORD *)long long v17 = v29;
    long long v19 = v30;
    long long v20 = v31;
    long long v21 = v32;
    *((void *)v17 + 8) = v33;
    *((_OWORD *)v17 + 2) = v20;
    *((_OWORD *)v17 + 3) = v21;
    *((_OWORD *)v17 + 1) = v19;
    unint64_t v11 = v17 + 72;
    long long v23 = (char *)*v5;
    int64x2_t v22 = (char *)v5[1];
    if (v22 != *v5)
    {
      do
      {
        *(_OWORD *)(v17 - 72) = *(_OWORD *)(v22 - 72);
        long long v24 = *(_OWORD *)(v22 - 56);
        long long v25 = *(_OWORD *)(v22 - 40);
        long long v26 = *(_OWORD *)(v22 - 24);
        *((void *)v17 - 1) = *((void *)v22 - 1);
        *(_OWORD *)(v17 - 24) = v26;
        *(_OWORD *)(v17 - 40) = v25;
        *(_OWORD *)(v17 - 56) = v24;
        v17 -= 72;
        v22 -= 72;
      }
      while (v22 != v23);
      int64x2_t v22 = (char *)*v5;
    }
    *uint64_t v5 = v17;
    v5[1] = v11;
    void v5[2] = v18;
    if (v22) {
      operator delete(v22);
    }
  }
  else
  {
    *(_OWORD *)uint64_t v6 = v29;
    long long v8 = v30;
    long long v9 = v31;
    long long v10 = v32;
    *((void *)v6 + 8) = v33;
    *((_OWORD *)v6 + 2) = v9;
    *((_OWORD *)v6 + 3) = v10;
    *((_OWORD *)v6 + 1) = v8;
    unint64_t v11 = v6 + 72;
  }
  v5[1] = v11;
  BOOL value = re::xpc_get_value(v4, *(void *)(*(void *)(a1 + 32) + 8) - 72);

  return value;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectBuffer>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x38E38E38E38E38FLL) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(72 * a2);
}

void std::vector<re::UpdateDirectBuffer>::reserve(void **a1, unint64_t a2)
{
  id v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (0x6DB6DB6DB6DB6DB7 * ((v4 - (unsigned char *)*a1) >> 3) < a2)
  {
    if (a2 >= 0x492492492492493) {
      abort();
    }
    uint64_t v5 = ((unsigned char *)a1[1] - (unsigned char *)*a1) / 56;
    updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>(v3, a2);
    unint64_t v7 = &updated[56 * v5];
    long long v9 = &updated[56 * v8];
    unint64_t v11 = (char *)*a1;
    long long v10 = (char *)a1[1];
    unint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        long long v13 = *(_OWORD *)(v10 - 56);
        long long v14 = *(_OWORD *)(v10 - 40);
        long long v15 = *(_OWORD *)(v10 - 24);
        *((void *)v12 - 1) = *((void *)v10 - 1);
        *(_OWORD *)(v12 - 24) = v15;
        *(_OWORD *)(v12 - 40) = v14;
        *(_OWORD *)(v12 - 56) = v13;
        v12 -= 56;
        v10 -= 56;
      }
      while (v10 != v11);
      long long v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

BOOL ___ZN2re20xpc_array_get_valuesINS_18UpdateDirectBufferEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *(void ***)(a1 + 32);
  uuid_copy((unsigned __int8 *)&v29, UUID_NULL);
  LOBYTE(v30) = 0;
  BYTE8(v30) = 0;
  LOBYTE(v31) = 0;
  LOBYTE(v32) = 0;
  uint64_t v6 = (char *)v5[1];
  unint64_t v7 = (char *)v5[2];
  if (v6 >= v7)
  {
    uint64_t v12 = 0x6DB6DB6DB6DB6DB7 * ((v6 - (unsigned char *)*v5) >> 3);
    unint64_t v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) > 0x492492492492492) {
      abort();
    }
    unint64_t v14 = 0x6DB6DB6DB6DB6DB7 * ((v7 - (unsigned char *)*v5) >> 3);
    if (2 * v14 > v13) {
      unint64_t v13 = 2 * v14;
    }
    if (v14 >= 0x249249249249249) {
      unint64_t v15 = 0x492492492492492;
    }
    else {
      unint64_t v15 = v13;
    }
    if (v15) {
      updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>((uint64_t)(v5 + 2), v15);
    }
    else {
      updated = 0;
    }
    long long v17 = &updated[56 * v12];
    unint64_t v18 = &updated[56 * v15];
    long long v19 = v29;
    long long v20 = v30;
    long long v21 = v31;
    *((void *)v17 + 6) = v32;
    *((_OWORD *)v17 + 1) = v20;
    *((_OWORD *)v17 + 2) = v21;
    *(_OWORD *)long long v17 = v19;
    unint64_t v11 = v17 + 56;
    long long v23 = (char *)*v5;
    int64x2_t v22 = (char *)v5[1];
    if (v22 != *v5)
    {
      do
      {
        long long v24 = *(_OWORD *)(v22 - 56);
        long long v25 = *(_OWORD *)(v22 - 40);
        long long v26 = *(_OWORD *)(v22 - 24);
        *((void *)v17 - 1) = *((void *)v22 - 1);
        *(_OWORD *)(v17 - 24) = v26;
        *(_OWORD *)(v17 - 40) = v25;
        *(_OWORD *)(v17 - 56) = v24;
        v17 -= 56;
        v22 -= 56;
      }
      while (v22 != v23);
      int64x2_t v22 = (char *)*v5;
    }
    *uint64_t v5 = v17;
    v5[1] = v11;
    void v5[2] = v18;
    if (v22) {
      operator delete(v22);
    }
  }
  else
  {
    long long v8 = v29;
    long long v9 = v30;
    long long v10 = v31;
    *((void *)v6 + 6) = v32;
    *((_OWORD *)v6 + 1) = v9;
    *((_OWORD *)v6 + 2) = v10;
    *(_OWORD *)uint64_t v6 = v8;
    unint64_t v11 = v6 + 56;
  }
  v5[1] = v11;
  BOOL value = re::xpc_get_value(v4, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) - 56));

  return value;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(56 * a2);
}

uint64_t std::vector<re::CreateDirectPayload>::reserve(char **a1, unint64_t a2)
{
  id v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (0xAAAAAAAAAAAAAAABLL * ((v4 - *a1) >> 3) < a2)
  {
    if (a2 >= 0xAAAAAAAAAAAAAABLL) {
      abort();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v16 = result;
    uint64_t Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectPayload>>(result, a2);
    long long v9 = *a1;
    unint64_t v8 = (unint64_t)a1[1];
    if ((char *)v8 == *a1)
    {
      int64x2_t v11 = vdupq_n_s64(v8);
      long long v10 = &Direct[v5];
    }
    else
    {
      long long v10 = &Direct[v5];
      do
      {
        *(_OWORD *)(v10 - 24) = *(_OWORD *)(v8 - 24);
        *((void *)v10 - 1) = *(void *)(v8 - 8);
        v10 -= 24;
        *(void *)(v8 - 8) = 0;
        v8 -= 24;
      }
      while ((char *)v8 != v9);
      int64x2_t v11 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &Direct[v5];
    int64x2_t v14 = v11;
    uint64_t v12 = a1[2];
    a1[2] = &Direct[24 * v7];
    unint64_t v15 = v12;
    uint64_t v13 = v11.i64[0];
    return std::__split_buffer<re::CreateDirectPayload>::~__split_buffer((uint64_t)&v13);
  }
  return result;
}

BOOL ___ZN2re20xpc_array_get_valuesINS_19CreateDirectPayloadEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = *(char ***)(a1 + 32);
  uuid_copy(dst, UUID_NULL);
  uint64_t v26 = 0;
  unint64_t v6 = (unint64_t)v5[1];
  unint64_t v7 = (unint64_t)v5[2];
  if (v6 >= v7)
  {
    unint64_t v8 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - (void)*v5) >> 3);
    unint64_t v9 = v8 + 1;
    if (v8 + 1 > 0xAAAAAAAAAAAAAAALL) {
      abort();
    }
    unint64_t v10 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - (void)*v5) >> 3);
    if (2 * v10 > v9) {
      unint64_t v9 = 2 * v10;
    }
    if (v10 >= 0x555555555555555) {
      unint64_t v11 = 0xAAAAAAAAAAAAAAALL;
    }
    else {
      unint64_t v11 = v9;
    }
    v24[4] = v5 + 2;
    uint64_t Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectPayload>>((uint64_t)(v5 + 2), v11);
    int64x2_t v14 = &Direct[24 * v8];
    *(_OWORD *)int64x2_t v14 = *(_OWORD *)dst;
    *((void *)v14 + 2) = v26;
    uint64_t v26 = 0;
    uint64_t v16 = *v5;
    unint64_t v15 = v5[1];
    if (v15 == *v5)
    {
      unint64_t v18 = v5[1];
      long long v17 = &Direct[24 * v8];
    }
    else
    {
      long long v17 = &Direct[24 * v8];
      do
      {
        *(_OWORD *)(v17 - 24) = *(_OWORD *)(v15 - 24);
        *((void *)v17 - 1) = *((void *)v15 - 1);
        v17 -= 24;
        *((void *)v15 - 1) = 0;
        v15 -= 24;
      }
      while (v15 != v16);
      unint64_t v18 = *v5;
      unint64_t v15 = v5[1];
    }
    long long v19 = v14 + 24;
    *uint64_t v5 = v17;
    v24[0] = v18;
    v24[1] = v18;
    v5[1] = v14 + 24;
    v24[2] = v15;
    long long v20 = v5[2];
    void v5[2] = &Direct[24 * v13];
    v24[3] = v20;
    std::__split_buffer<re::CreateDirectPayload>::~__split_buffer((uint64_t)v24);
    uint64_t v21 = v26;
    v5[1] = v19;
    if (v21) {
  }
    }
  else
  {
    *(_OWORD *)unint64_t v6 = *(_OWORD *)dst;
    *(void *)(v6 + 16) = v26;
    v5[1] = (char *)(v6 + 24);
  }
  BOOL value = re::xpc_get_value(v4, *(void *)(*(void *)(a1 + 32) + 8) - 24);

  return value;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectPayload>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0xAAAAAAAAAAAAAABLL) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(24 * a2);
}

uint64_t std::__split_buffer<re::CreateDirectPayload>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<re::CreateDirectPayload>::__destruct_at_end[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    *(void *)(a1 + 16) = v2 - 24;
    uint64_t v5 = *(void *)(v2 - 8);
    if (v5)
    {

      *(void *)(v2 - 8) = 0;
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 24;
    }
  }
}

void std::vector<re::DestroyResource>::reserve(void **a1, unint64_t a2)
{
  id v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 4)
  {
    if (a2 >> 60) {
      abort();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    unint64_t v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>(v3, a2);
    unint64_t v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF0];
    unint64_t v9 = &v6[16 * v8];
    unint64_t v11 = (char *)*a1;
    unint64_t v10 = (char *)a1[1];
    uint64_t v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        *((_OWORD *)v12 - 1) = *((_OWORD *)v10 - 1);
        v12 -= 16;
        v10 -= 16;
      }
      while (v10 != v11);
      unint64_t v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
    {
      operator delete(v10);
    }
  }
}

BOOL ___ZN2re20xpc_array_get_valuesINS_15DestroyResourceEEEbPU24objcproto13OS_xpc_object8NSObjectRNSt3__16vectorIT_NS5_9allocatorIS7_EEEE_block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int64_t v5 = *(void ***)(a1 + 32);
  uuid_copy(dst, UUID_NULL);
  unint64_t v6 = v5[1];
  unint64_t v7 = (unint64_t)v5[2];
  if ((unint64_t)v6 >= v7)
  {
    uint64_t v9 = ((char *)v6 - (unsigned char *)*v5) >> 4;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 60) {
      abort();
    }
    uint64_t v11 = v7 - (void)*v5;
    if (v11 >> 3 > v10) {
      unint64_t v10 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12) {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>((uint64_t)(v5 + 2), v12);
    }
    else {
      uint64_t v13 = 0;
    }
    int64x2_t v14 = &v13[16 * v9];
    unint64_t v15 = &v13[16 * v12];
    *(_OWORD *)int64x2_t v14 = *(_OWORD *)dst;
    uint64_t v8 = v14 + 16;
    long long v17 = (char *)*v5;
    uint64_t v16 = (char *)v5[1];
    if (v16 != *v5)
    {
      do
      {
        *((_OWORD *)v14 - 1) = *((_OWORD *)v16 - 1);
        v14 -= 16;
        v16 -= 16;
      }
      while (v16 != v17);
      uint64_t v16 = (char *)*v5;
    }
    *int64_t v5 = v14;
    v5[1] = v8;
    void v5[2] = v15;
    if (v16) {
      operator delete(v16);
    }
  }
  else
  {
    *unint64_t v6 = *(_OWORD *)dst;
    uint64_t v8 = v6 + 1;
  }
  v5[1] = v8;
  BOOL value = re::xpc_get_value(v4, (unsigned __int8 *)(*(void *)(*(void *)(a1 + 32) + 8) - 16));

  return value;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(16 * a2);
}

id re::xpc_array_create_unless_empty<re::CreateDirectMesh>(const unsigned __int8 **a1)
{
  uint64_t v1 = a1[1];
  if (*a1 == v1)
  {
    uint64_t v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    uint64_t v2 = re::xpc_array_create_with<re::CreateDirectMesh>(v4);
  }

  return v2;
}

id re::xpc_array_create_unless_empty<re::UpdateDirectMesh>(const unsigned __int8 **a1)
{
  uint64_t v1 = a1[1];
  if (*a1 == v1)
  {
    uint64_t v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    uint64_t v2 = re::xpc_array_create_with<re::UpdateDirectMesh>(v4);
  }

  return v2;
}

id re::xpc_array_create_with<re::CreateDirectMesh>(const unsigned __int8 **a1)
{
  xpc_object_t empty = xpc_array_create_empty();
  uint64_t v3 = *a1;
  id v4 = a1[1];
  while (v3 != v4)
  {
    int64_t v5 = re::xpc_object_create(v3);
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);
    }
    v3 += 216;
  }

  return empty;
}

id re::xpc_array_create_with<re::UpdateDirectMesh>(const unsigned __int8 **a1)
{
  xpc_object_t empty = xpc_array_create_empty();
  uint64_t v3 = *a1;
  id v4 = a1[1];
  while (v3 != v4)
  {
    int64_t v5 = re::xpc_object_create(v3);
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);
    }
    v3 += 136;
  }

  return empty;
}

id re::xpc_array_create_unless_empty<re::CreateDirectTexture>(const unsigned __int8 **a1)
{
  uint64_t v1 = a1[1];
  if (*a1 == v1)
  {
    uint64_t v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    uint64_t v2 = re::xpc_array_create_with<re::CreateDirectTexture>(v4);
  }

  return v2;
}

id re::xpc_array_create_unless_empty<re::UpdateDirectTexture>(const unsigned __int8 **a1)
{
  uint64_t v1 = a1[1];
  if (*a1 == v1)
  {
    uint64_t v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    uint64_t v2 = re::xpc_array_create_with<re::UpdateDirectTexture>(v4);
  }

  return v2;
}

id re::xpc_array_create_with<re::CreateDirectTexture>(const unsigned __int8 **a1)
{
  xpc_object_t empty = xpc_array_create_empty();
  uint64_t v3 = *a1;
  id v4 = a1[1];
  while (v3 != v4)
  {
    int64_t v5 = re::xpc_object_create(v3);
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);
    }
    v3 += 104;
  }

  return empty;
}

id re::xpc_array_create_with<re::UpdateDirectTexture>(const unsigned __int8 **a1)
{
  xpc_object_t empty = xpc_array_create_empty();
  uint64_t v3 = *a1;
  id v4 = a1[1];
  while (v3 != v4)
  {
    int64_t v5 = re::xpc_object_create(v3);
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);
    }
    v3 += 32;
  }

  return empty;
}

id re::xpc_array_create_unless_empty<re::CreateDirectBuffer>(uint64_t *a1)
{
  uint64_t v1 = a1[1];
  if (*a1 == v1)
  {
    uint64_t v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    uint64_t v2 = re::xpc_array_create_with<re::CreateDirectBuffer>(v4);
  }

  return v2;
}

id re::xpc_array_create_unless_empty<re::UpdateDirectBuffer>(const unsigned __int8 **a1)
{
  uint64_t v1 = a1[1];
  if (*a1 == v1)
  {
    uint64_t v2 = 0;
  }
  else
  {
    v4[0] = *a1;
    v4[1] = v1;
    uint64_t v2 = re::xpc_array_create_with<re::UpdateDirectBuffer>(v4);
  }

  return v2;
}

id re::xpc_array_create_with<re::CreateDirectBuffer>(uint64_t *a1)
{
  xpc_object_t empty = xpc_array_create_empty();
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  while (v3 != v4)
  {
    int64_t v5 = re::xpc_object_create(v3);
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);
    }
    v3 += 72;
  }

  return empty;
}

id re::xpc_array_create_with<re::UpdateDirectBuffer>(const unsigned __int8 **a1)
{
  xpc_object_t empty = xpc_array_create_empty();
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  while (v3 != v4)
  {
    int64_t v5 = re::xpc_object_create(v3);
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);
    }
    v3 += 56;
  }

  return empty;
}

id re::xpc_array_create_with<re::CreateDirectPayload>(uint64_t *a1)
{
  xpc_object_t empty = xpc_array_create_empty();
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  while (v3 != v4)
  {
    int64_t v5 = re::xpc_object_create(v3);
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);
    }
    v3 += 24;
  }

  return empty;
}

id re::xpc_array_create_with<re::DestroyResource>(const unsigned __int8 **a1)
{
  xpc_object_t empty = xpc_array_create_empty();
  uint64_t v3 = *a1;
  uint64_t v4 = a1[1];
  while (v3 != v4)
  {
    xpc_object_t v5 = xpc_uuid_create(v3);
    if (v5)
    {
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v5);
    }
    else
    {
      xpc_object_t v6 = xpc_null_create();
      xpc_array_set_value(empty, 0xFFFFFFFFFFFFFFFFLL, v6);
    }
    v3 += 16;
  }

  return empty;
}

void re::MemoryMappedRegion::MemoryMappedRegion(re::MemoryMappedRegion *this, void *a2, uint64_t a3)
{
  ArcSharedObject::ArcSharedObject(this, 0);
  *xpc_object_t v5 = &unk_26FF34A88;
  void v5[2] = a2;
  v5[3] = a3;
}

void re::MemoryMappedRegion::~MemoryMappedRegion(re::MemoryMappedRegion *this)
{
  *(void *)this = &unk_26FF34A88;
  if (munmap(*((void **)this + 2), *((void *)this + 3))) {
    re::MemoryMappedRegion::~MemoryMappedRegion();
  }

  ArcSharedObject::~ArcSharedObject(this);
}

{
  uint64_t vars8;

  re::MemoryMappedRegion::~MemoryMappedRegion(this);

  JUMPOUT(0x2533130A0);
}

void re::MemoryMappedRegion::map(re::MemoryMappedRegion *this@<X0>, int a2@<W1>, int a3@<W2>, const void *a4@<X3>, void *a5@<X8>)
{
  unint64_t v9 = (unint64_t)this + *MEMORY[0x263EF8AF8] - 1;
  size_t v10 = v9 / *MEMORY[0x263EF8AF8] * *MEMORY[0x263EF8AF8];
  uint8x8_t v11 = (uint8x8_t)vcnt_s8(*MEMORY[0x263EF8AF8]);
  v11.i16[0] = vaddlv_u8(v11);
  size_t v12 = v9 & -*MEMORY[0x263EF8AF8];
  if (v11.u32[0] == 1) {
    size_t v13 = v12;
  }
  else {
    size_t v13 = v10;
  }
  int64x2_t v14 = (char *)mmap(0, v13, a2, a3, -1, 0);
  if (v14 != (char *)-1)
  {
    unint64_t v15 = v14;
    if (a4)
    {
      memcpy(v14, a4, (size_t)this);
      size_t v16 = v13 - (void)this;
      if (v13 <= (unint64_t)this)
      {
LABEL_11:
        unint64_t v18 = (ArcSharedObject *)operator new(0x20uLL);
        ArcSharedObject::ArcSharedObject(v18, 0);
        void *v17 = &unk_26FF34A88;
        v17[2] = v15;
        v17[3] = v13;
        goto LABEL_12;
      }
      int64x2_t v14 = (char *)this + (void)v15;
    }
    else
    {
      size_t v16 = v13;
    }
    bzero(v14, v16);
    goto LABEL_11;
  }
  long long v17 = 0;
LABEL_12:
  *a5 = v17;
}

BOOL re::isPrivateToThisProcess(int a1)
{
  return (a1 & 0xFFFFFFFE) != 6;
}

uint64_t re::DirectMemoryResource::capabilities(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = (void *)result;
    if ((objc_msgSend((id)result, sel_respondsToSelector_, sel_supportsBufferWithIOSurface) & 1) != 0
      || objc_msgSend(v1, sel_methodSignatureForSelector_, sel_supportsBufferWithIOSurface))
    {
      if (objc_msgSend(v1, sel_supportsBufferWithIOSurface)) {
        return 3;
      }
      else {
        return 2;
      }
    }
    else
    {
      return 2;
    }
  }
  return result;
}

uint64_t re::DirectMemoryResource::typeForUsage(re::DirectMemoryResource *this, char a2, unint64_t a3)
{
  if ((a2 & 2) != 0) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((this & 2) != 0) {
    int v4 = v3;
  }
  else {
    int v4 = 1;
  }
  if ((this & 4) != 0) {
    int v5 = 3;
  }
  else {
    int v5 = a2 & 1 ^ 7;
  }
  if ((this & 8) != 0) {
    unsigned int v6 = v5;
  }
  else {
    unsigned int v6 = v4;
  }
  if ((a2 & 2) != 0) {
    int v7 = 4;
  }
  else {
    int v7 = 2;
  }
  if ((this & 2) != 0) {
    unsigned int v8 = v7;
  }
  else {
    unsigned int v8 = 1;
  }
  if (a3 <= 0xFFF) {
    return v8;
  }
  else {
    return v6;
  }
}

void re::DirectMemoryResource::create(re::MemoryMappedRegion *a1@<X0>, re::DirectMemoryResource *a2@<X1>, char a3@<W2>, void *a4@<X3>, void *a5@<X8>)
{
  size_t v10 = (char *)operator new(0x68uLL);
  re::DirectMemoryResource::DirectMemoryResource((re::DirectMemoryResource *)v10);
  int v11 = re::DirectMemoryResource::typeForUsage(a2, a3, (unint64_t)a1);
  if (!re::DirectMemoryResource::allocate((re::DirectMemoryResource *)v10, a1, (int)a2, v12, v11, a4))
  {

    size_t v10 = 0;
  }
  *a5 = v10;
}

BOOL re::DirectMemoryResource::allocate(re::DirectMemoryResource *a1, re::MemoryMappedRegion *a2, int a3, int a4, int a5, id a6)
{
  *((_DWORD *)a1 + 9) = a3;
  switch(a5)
  {
    case 0:
    case 5:
      re::DirectMemoryResource::reset(a1);
      goto LABEL_3;
    case 1:
      BOOL result = re::DirectMemoryResource::allocatePrivateNonAligned(a1, (size_t)a2);
      break;
    case 2:
      BOOL result = re::DirectMemoryResource::allocatePrivatePageAligned(a1, (uint64_t)a2);
      break;
    case 3:
      BOOL result = re::DirectMemoryResource::allocatePrivateMemoryMap(a1, a2);
      break;
    case 4:
      BOOL result = re::DirectMemoryResource::allocatePrivateMTLBuffer((uint64_t)a1, a6, (uint64_t)a2);
      break;
    case 6:
      BOOL result = re::DirectMemoryResource::allocateIOSurface(a1, (uint64_t)a2);
      break;
    case 7:
      BOOL result = re::DirectMemoryResource::allocateSharedMemory(a1, a2);
      break;
    default:
LABEL_3:
      BOOL result = 0;
      break;
  }
  return result;
}

void re::DirectMemoryResource::create(re::MemoryMappedRegion *a1@<X0>, re::DirectMemoryResource *a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  char v8 = re::DirectMemoryResource::capabilities((uint64_t)a3);

  re::DirectMemoryResource::create(a1, a2, v8, a3, a4);
}

void re::DirectMemoryResource::createWithSharedTexture(void *a1@<X0>, int a2@<W1>, re::DirectMemoryResource **a3@<X8>)
{
  if ((objc_msgSend(a1, sel_isShareable) & 1) == 0) {
    re::DirectMemoryResource::createWithSharedTexture();
  }
  id v6 = objc_msgSend(a1, sel_newSharedTextureHandle);
  if (v6)
  {
    int v7 = v6;
    char v8 = (void **)operator new(0x68uLL);
    *a3 = re::DirectMemoryResource::DirectMemoryResource((re::DirectMemoryResource *)v8);
    re::DirectMemoryResource::assignIOSurface((re::DirectMemoryResource *)v8, (IOSurfaceRef)objc_msgSend(v7, sel_ioSurface));
    *((_DWORD *)v8 + 9) = a2;
    id v9 = a1;
    NS::SharedPtr<MTL::Resource>::operator=<MTL::Texture>(v8 + 12, &v9);
    if (v9) {

    }
    v8[11] = (void *)0x300000002;
  }
  else
  {
    *a3 = 0;
  }
}

BOOL re::DirectMemoryResource::assignIOSurface(re::DirectMemoryResource *this, IOSurfaceRef buffer)
{
  if (buffer)
  {
    *((_DWORD *)this + 8) = 6;
    *((void *)this + 5) = IOSurfaceGetAllocSize(buffer);
    *((void *)this + 7) = buffer;
    CFRetain(buffer);
  }
  return buffer != 0;
}

void **NS::SharedPtr<MTL::Resource>::operator=<MTL::Texture>(void **a1, void **a2)
{
  int v4 = *a1;
  int v5 = *a2;
  if (v4 == *a2)
  {
  }
  else
  {
    if (v4)
    {

      int v5 = *a2;
    }
    *a1 = v5;
  }
  *a2 = 0;
  return a1;
}

double re::DirectMemoryResource::createWithPrivateTexture@<D0>(void *a1@<X0>, int a2@<W1>, re::DirectMemoryResource **a3@<X8>)
{
  id v6 = (void **)operator new(0x68uLL);
  int v7 = re::DirectMemoryResource::DirectMemoryResource((re::DirectMemoryResource *)v6);
  *a3 = v7;
  *((_DWORD *)v7 + 8) = 5;
  v6[5] = objc_msgSend(a1, sel_allocatedSize);
  *((_DWORD *)v6 + 9) = a2;
  id v9 = a1;
  NS::SharedPtr<MTL::Resource>::operator=<MTL::Texture>(v6 + 12, &v9);
  if (v9) {

  }
  *(void *)&double result = 0x300000002;
  v6[11] = (void *)0x300000002;
  return result;
}

re::DirectMemoryResource *re::DirectMemoryResource::DirectMemoryResource(re::DirectMemoryResource *this, const unsigned __int8 (*a2)[16])
{
  ArcSharedObject::ArcSharedObject(this, 0);
  *(void *)uint64_t v4 = &unk_26FF34AC0;
  uuid_copy((unsigned __int8 *)(v4 + 16), (const unsigned __int8 *)a2);
  *(_OWORD *)((char *)this + 76) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_DWORD *)this + 23) = -1;
  *((void *)this + 12) = 0;
  return this;
}

re::DirectMemoryResource *re::DirectMemoryResource::DirectMemoryResource(re::DirectMemoryResource *this)
{
  ArcSharedObject::ArcSharedObject(this, 0);
  *(void *)uint64_t v2 = &unk_26FF34AC0;
  int v3 = (unsigned __int8 *)(v2 + 16);
  uuid_copy((unsigned __int8 *)(v2 + 16), UUID_NULL);
  *(_OWORD *)((char *)this + 76) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_DWORD *)this + 23) = -1;
  *((void *)this + 12) = 0;
  uuid_generate_random(v3);
  return this;
}

void re::DirectMemoryResource::~DirectMemoryResource(re::DirectMemoryResource *this)
{
  re::DirectMemoryResource::reset(this);
  uint64_t v2 = (void *)*((void *)this + 12);
  if (v2)
  {

    *((void *)this + 12) = 0;
  }
  int v3 = (void *)*((void *)this + 10);
  if (v3)
  {

    *((void *)this + 10) = 0;
  }
  uint64_t v4 = *((void *)this + 9);
  if (v4)
  {

    *((void *)this + 9) = 0;
  }
  uint64_t v5 = *((void *)this + 8);
  if (v5)
  {

    *((void *)this + 8) = 0;
  }

  ArcSharedObject::~ArcSharedObject(this);
}

{
  uint64_t vars8;

  re::DirectMemoryResource::~DirectMemoryResource(this);

  JUMPOUT(0x2533130A0);
}

void re::DirectMemoryResource::reset(re::DirectMemoryResource *this)
{
  switch(*((_DWORD *)this + 8))
  {
    case 1:
    case 2:
      int v3 = (char *)this + 48;
      uint64_t v2 = (const void *)*((void *)this + 6);
      if (v2) {
        goto LABEL_8;
      }
      goto LABEL_14;
    case 3:
      int v3 = (char *)this + 72;
      uint64_t v4 = *((void *)this + 9);
      if (v4) {
        goto LABEL_10;
      }
      goto LABEL_14;
    case 4:
      int v3 = (char *)this + 80;
      uint64_t v5 = (void *)*((void *)this + 10);
      goto LABEL_12;
    case 5:
      int v3 = (char *)this + 96;
      uint64_t v5 = (void *)*((void *)this + 12);
      goto LABEL_12;
    case 6:
      int v3 = (char *)this + 56;
      uint64_t v2 = (const void *)*((void *)this + 7);
      if (!v2) {
        goto LABEL_14;
      }
LABEL_8:
      CFRelease(v2);
      break;
    case 7:
      int v3 = (char *)this + 64;
      uint64_t v4 = *((void *)this + 8);
      if (!v4) {
        goto LABEL_14;
      }
LABEL_10:
      uint64_t v5 = (void *)(v4 + 8);
LABEL_12:

      break;
    default:
      goto LABEL_14;
  }
  *(void *)int v3 = 0;
LABEL_14:

  *((void *)this + 12) = 0;
  *((_DWORD *)this + 8) = 0;
}

id re::DirectMemoryResource::bytes(re::DirectMemoryResource *this)
{
  id result = 0;
  switch(*((_DWORD *)this + 8))
  {
    case 1:
    case 2:
      id result = CFDataGetMutableBytePtr(*((CFMutableDataRef *)this + 6));
      break;
    case 3:
      uint64_t v3 = *((void *)this + 9);
      goto LABEL_7;
    case 4:
      id result = objc_msgSend(*((id *)this + 10), sel_contents);
      break;
    case 6:
      id result = IOSurfaceGetBaseAddress(*((IOSurfaceRef *)this + 7));
      break;
    case 7:
      uint64_t v3 = *((void *)this + 8);
LABEL_7:
      id result = *(id *)(v3 + 16);
      break;
    default:
      return result;
  }
  return result;
}

BOOL re::DirectMemoryResource::allocatePrivateNonAligned(re::DirectMemoryResource *this, size_t size)
{
  uint64_t v4 = (UInt8 *)malloc_type_malloc(size, 0x9C5B0D6FuLL);
  uint64_t v5 = v4;
  if (v4)
  {
    bzero(v4, size);
    *((_DWORD *)this + 8) = 1;
    *((void *)this + 5) = size;
    *((void *)this + 6) = CFDataCreateWithBytesNoCopy(0, v5, size, (CFAllocatorRef)*MEMORY[0x263EFFB18]);
  }
  return v5 != 0;
}

BOOL re::DirectMemoryResource::allocatePrivatePageAligned(re::DirectMemoryResource *this, uint64_t a2)
{
  {
    uint64_t v10 = a2;
    a2 = v10;
    if (v11)
    {
      re::DirectMemoryResource::allocatePrivatePageAligned(unsigned long)::kMetalBufferAlignment = *MEMORY[0x263EF8AF8];
      a2 = v10;
    }
  }
  uint8x8_t v3 = (uint8x8_t)vcnt_s8((int8x8_t)re::DirectMemoryResource::allocatePrivatePageAligned(unsigned long)::kMetalBufferAlignment);
  v3.i16[0] = vaddlv_u8(v3);
  unint64_t v4 = a2 + re::DirectMemoryResource::allocatePrivatePageAligned(unsigned long)::kMetalBufferAlignment - 1;
  unint64_t v5 = v4
     / re::DirectMemoryResource::allocatePrivatePageAligned(unsigned long)::kMetalBufferAlignment
     * re::DirectMemoryResource::allocatePrivatePageAligned(unsigned long)::kMetalBufferAlignment;
  uint64_t v6 = v4 & -re::DirectMemoryResource::allocatePrivatePageAligned(unsigned long)::kMetalBufferAlignment;
  if (v3.u32[0] == 1) {
    size_t v7 = v6;
  }
  else {
    size_t v7 = v5;
  }
  memptr = 0;
  int v8 = malloc_type_posix_memalign(&memptr, re::DirectMemoryResource::allocatePrivatePageAligned(unsigned long)::kMetalBufferAlignment, v7, 0xE9AFD140uLL);
  if (!v8)
  {
    bzero(memptr, v7);
    *((_DWORD *)this + 8) = 2;
    *((void *)this + 5) = v7;
    *((void *)this + 6) = CFDataCreateWithBytesNoCopy(0, (const UInt8 *)memptr, v7, (CFAllocatorRef)*MEMORY[0x263EFFB18]);
  }
  return v8 == 0;
}

BOOL re::DirectMemoryResource::allocateIOSurface(re::DirectMemoryResource *this, uint64_t a2)
{
  keys[2] = *(void **)MEMORY[0x263EF8340];
  memset(out, 0, 37);
  uuid_unparse((const unsigned __int8 *)this + 16, out);
  snprintf(__str, 0x400uLL, "Buffer %s", out);
  *((_DWORD *)this + 8) = 6;
  *((void *)this + 5) = a2;
  uint64_t valuePtr = a2;
  CFNumberRef v4 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  CFStringRef v5 = CFStringCreateWithCString(0, __str, 0x8000100u);
  uint64_t v6 = (void *)*MEMORY[0x263F0EE28];
  keys[0] = *(void **)MEMORY[0x263F0ED30];
  keys[1] = v6;
  values[0] = v4;
  values[1] = (void *)v5;
  CFDictionaryRef v7 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const void **)keys, (const void **)values, 2, MEMORY[0x263EFFF88], MEMORY[0x263EFFF90]);
  IOSurfaceRef v8 = IOSurfaceCreate(v7);
  CFRelease(v7);
  CFRelease(v4);
  CFRelease(v5);
  *((void *)this + 7) = v8;
  return v8 != 0;
}

BOOL re::DirectMemoryResource::allocateSharedMemory(re::DirectMemoryResource *this, re::MemoryMappedRegion *a2)
{
  re::MemoryMappedRegion::map(a2, 3, 4097, 0, &v6);
  uint64_t v3 = v6;
  if (v6)
  {
    *((_DWORD *)this + 8) = 7;
    *((void *)this + 5) = *(void *)(v3 + 24);
    uint64_t v4 = *((void *)this + 8);
    *((void *)this + 8) = v3;
    if (v4) {
  }
    }
  return v3 != 0;
}

BOOL re::DirectMemoryResource::allocatePrivateMemoryMap(re::DirectMemoryResource *this, re::MemoryMappedRegion *a2)
{
  re::MemoryMappedRegion::map(a2, 3, 4098, 0, &v6);
  uint64_t v3 = v6;
  if (v6)
  {
    *((_DWORD *)this + 8) = 3;
    *((void *)this + 5) = *(void *)(v3 + 24);
    uint64_t v4 = *((void *)this + 9);
    *((void *)this + 9) = v3;
    if (v4) {
  }
    }
  return v3 != 0;
}

BOOL re::DirectMemoryResource::allocatePrivateMTLBuffer(uint64_t a1, id a2, uint64_t a3)
{
  *(_DWORD *)(a1 + 32) = 4;
  *(void *)(a1 + 40) = a3;
  id v6 = objc_msgSend(a2, sel_newBufferWithLength_options_);
  uint64_t v4 = (void **)(a1 + 80);
  NS::SharedPtr<MTL::Buffer>::operator=(v4, &v6);
  if (v6) {

  }
  return *v4 != 0;
}

BOOL re::DirectMemoryResource::copyFromPrivateMemory(re::DirectMemoryResource *this, const void *a2, re::MemoryMappedRegion *a3, char a4)
{
  if ((a4 & 2) != 0)
  {
    re::MemoryMappedRegion::map(a3, 3, 4097, a2, &v11);
    uint64_t v7 = v11;
    BOOL v6 = v11 != 0;
    if (v11)
    {
      id v8 = (id)(v11 + 8);
      *((_DWORD *)this + 8) = 3;
      *((void *)this + 5) = *(void *)(v7 + 24);
      uint64_t v9 = *((void *)this + 9);
      *((void *)this + 9) = v7;
      if (v9) {
    }
      }
  }
  else
  {
    *((_DWORD *)this + 8) = 1;
    *((void *)this + 5) = a3;
    CFDataRef v5 = CFDataCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], (const UInt8 *)a2, (CFIndex)a3);
    *((void *)this + 6) = v5;
    return v5 != 0;
  }
  return v6;
}

BOOL re::DirectMemoryResource::assignSharedMemory(uint64_t a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  if (*a2)
  {
    *(_DWORD *)(a1 + 32) = 7;
    *(void *)(a1 + 40) = *(void *)(v2 + 24);
    uint64_t v3 = *(void *)(a1 + 64);
    *(void *)(a1 + 64) = v2;
    *a2 = v3;
  }
  return v2 != 0;
}

void **NS::SharedPtr<MTL::Buffer>::operator=(void **a1, void **a2)
{
  uint64_t v4 = *a1;
  CFDataRef v5 = *a2;
  if (v4 == *a2)
  {
  }
  else
  {
    if (v4)
    {

      CFDataRef v5 = *a2;
    }
    *a1 = v5;
  }
  *a2 = 0;
  return a1;
}

void re::DirectMemoryResource::makeBuffer(id a1@<X1>, uint64_t a2@<X0>, void *a3@<X8>)
{
  switch(*(_DWORD *)(a2 + 32))
  {
    case 1:
      id v6 = objc_msgSend(a1, sel_newBufferWithBytes_length_options_, CFDataGetMutableBytePtr(*(CFMutableDataRef *)(a2 + 48)), *(void *)(a2 + 40), 0);
      goto LABEL_14;
    case 2:
      uint64_t v7 = *(__CFData **)(a2 + 48);
      MutableBytePtr = CFDataGetMutableBytePtr(v7);
      uint64_t v9 = *(void *)(a2 + 40);
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 0x40000000;
      v31[2] = ___ZNK2re20DirectMemoryResource10makeBufferEPN3MTL6DeviceE_block_invoke;
      v31[3] = &__block_descriptor_tmp;
      v31[4] = v7;
      id v10 = objc_msgSend(a1, sel_newBufferWithBytesNoCopy_length_options_deallocator_, MutableBytePtr, v9, 0, v31);
      *a3 = v10;
      if (v10) {
        CFRetain(v7);
      }
      return;
    case 3:
      uint64_t v25 = 0;
      uint64_t v26 = &v25;
      uint64_t v27 = 0x3002000000;
      int64x2_t v28 = __Block_byref_object_copy_;
      uint64_t v11 = *(void *)(a2 + 72);
      long long v29 = __Block_byref_object_dispose_;
      uint64_t v30 = v11;
      id v12 = (id)(v11 + 8);
      uint64_t v13 = v26[5];
      uint64_t v14 = *(void *)(v13 + 16);
      uint64_t v15 = *(void *)(v13 + 24);
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 0x40000000;
      v23[2] = ___ZNK2re20DirectMemoryResource10makeBufferEPN3MTL6DeviceE_block_invoke_2;
      v23[3] = &unk_2652F6BE8;
      v23[4] = &v25;
      id v16 = objc_msgSend(a1, sel_newBufferWithBytesNoCopy_length_options_deallocator_, v14, v15, 0, v23);
      goto LABEL_9;
    case 4:
      id v6 = *(id *)(a2 + 80);
      goto LABEL_14;
    case 6:
      uint64_t v22 = *(void *)(a2 + 56);
      if ((objc_msgSend(a1, sel_respondsToSelector_, sel_newBufferWithIOSurface_) & 1) != 0
        || (id v6 = objc_msgSend(a1, sel_methodSignatureForSelector_, sel_newBufferWithIOSurface_)) != 0)
      {
        id v6 = objc_msgSend(a1, sel_newBufferWithIOSurface_, v22);
      }
LABEL_14:
      *a3 = v6;
      break;
    case 7:
      uint64_t v25 = 0;
      uint64_t v26 = &v25;
      uint64_t v27 = 0x3002000000;
      int64x2_t v28 = __Block_byref_object_copy_;
      uint64_t v17 = *(void *)(a2 + 64);
      long long v29 = __Block_byref_object_dispose_;
      uint64_t v30 = v17;
      id v18 = (id)(v17 + 8);
      uint64_t v19 = v26[5];
      uint64_t v20 = *(void *)(v19 + 16);
      uint64_t v21 = *(void *)(v19 + 24);
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 0x40000000;
      v24[2] = ___ZNK2re20DirectMemoryResource10makeBufferEPN3MTL6DeviceE_block_invoke_5;
      v24[3] = &unk_2652F6BC0;
      v24[4] = &v25;
      id v16 = objc_msgSend(a1, sel_newBufferWithBytesNoCopy_length_options_deallocator_, v20, v21, 0, v24);
LABEL_9:
      *a3 = v16;
      _Block_object_dispose(&v25, 8);
      if (v30) {

      }
      break;
    default:
      *a3 = 0;
      break;
  }
}

void ___ZNK2re20DirectMemoryResource10makeBufferEPN3MTL6DeviceE_block_invoke(uint64_t a1)
{
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (v1)
  {

    *(void *)(a1 + 40) = 0;
  }
}

void ___ZNK2re20DirectMemoryResource10makeBufferEPN3MTL6DeviceE_block_invoke_5(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void *)(v1 + 40);
  if (v2)
  {

    *(void *)(v1 + 40) = 0;
  }
}

void ___ZNK2re20DirectMemoryResource10makeBufferEPN3MTL6DeviceE_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v2 = *(void *)(v1 + 40);
  if (v2)
  {

    *(void *)(v1 + 40) = 0;
  }
}

void **re::DirectMemoryResource::setRuntimeResource(uint64_t a1, void **a2)
{
  return NS::SharedPtr<MTL::Buffer>::operator=((void **)(a1 + 96), a2);
}

uint64_t re::DirectMemoryResource::runtimeResource(re::DirectMemoryResource *this)
{
  return (uint64_t)this + 96;
}

uint64_t re::DirectMemoryResource::bindToResource(uint64_t a1, int a2, int a3)
{
  int v3 = *(_DWORD *)(a1 + 88);
  if (v3)
  {
    if (v3 != a2 || *(_DWORD *)(a1 + 92) != a3) {
      return 0;
    }
  }
  else
  {
    *(_DWORD *)(a1 + 88) = a2;
    *(_DWORD *)(a1 + 92) = a3;
  }
  return 1;
}

void re::makeCommand(re *this@<X0>, uint64_t a2@<X8>)
{
  uuid_copy((unsigned __int8 *)a2, (const unsigned __int8 *)this + 16);
  long long v5 = *((_OWORD *)this + 6);
  *(_OWORD *)(a2 + 48) = *((_OWORD *)this + 5);
  *(_OWORD *)(a2 + 64) = v5;
  *(_DWORD *)(a2 + 80) = *((_DWORD *)this + 28);
  long long v6 = *((_OWORD *)this + 4);
  *(_OWORD *)(a2 + 16) = *((_OWORD *)this + 3);
  *(_OWORD *)(a2 + 32) = v6;
  uint64_t v7 = (const unsigned __int8 *)(re::DirectTexture::payload((uint64_t)this, 3, 0) + 16);

  uuid_copy((unsigned __int8 *)(a2 + 88), v7);
}

{
  long long v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;

  uuid_copy((unsigned __int8 *)a2, (const unsigned __int8 *)this + 16);
  long long v5 = *((_OWORD *)this + 4);
  *(_OWORD *)(a2 + 16) = *((_OWORD *)this + 3);
  *(_OWORD *)(a2 + 32) = v5;
  std::vector<re::DirectMeshVertexAttribute>::vector((void *)(a2 + 48), (uint64_t)this + 80);
  std::vector<re::DirectMeshVertexLayout>::vector((void *)(a2 + 72), (uint64_t)this + 104);
  *(void *)(a2 + 96) = *((void *)this + 16);
  *(unsigned char *)(a2 + 104) = 1;
  long long v6 = re::DirectMesh::partsPayload(this);
  if (v6)
  {
    uuid_copy((unsigned __int8 *)(a2 + 112), (const unsigned __int8 *)(v6 + 16));
    uint64_t v7 = 1;
  }
  else
  {
    uint64_t v7 = 0;
    *(unsigned char *)(a2 + 112) = 0;
  }
  *(unsigned char *)(a2 + 128) = v7;
  id v8 = re::DirectMesh::indexPayload(this);
  if (v8)
  {
    uuid_copy((unsigned __int8 *)(a2 + 129), (const unsigned __int8 *)(v8 + 16));
    uint64_t v9 = 1;
  }
  else
  {
    uint64_t v9 = 0;
    *(unsigned char *)(a2 + 129) = 0;
  }
  *(unsigned char *)(a2 + 145) = v9;
  id v10 = re::DirectMesh::vertexPayload(this, 0);
  if (v10)
  {
    uuid_copy((unsigned __int8 *)(a2 + 146), (const unsigned __int8 *)(v10 + 16));
    uint64_t v11 = 1;
  }
  else
  {
    uint64_t v11 = 0;
    *(unsigned char *)(a2 + 146) = 0;
  }
  *(unsigned char *)(a2 + 162) = v11;
  id v12 = re::DirectMesh::vertexPayload(this, 1uLL);
  if (v12)
  {
    uuid_copy((unsigned __int8 *)(a2 + 163), (const unsigned __int8 *)(v12 + 16));
    uint64_t v13 = 1;
  }
  else
  {
    uint64_t v13 = 0;
    *(unsigned char *)(a2 + 163) = 0;
  }
  *(unsigned char *)(a2 + 179) = v13;
  uint64_t v14 = re::DirectMesh::vertexPayload(this, 2uLL);
  if (v14)
  {
    uuid_copy((unsigned __int8 *)(a2 + 180), (const unsigned __int8 *)(v14 + 16));
    uint64_t v15 = 1;
  }
  else
  {
    uint64_t v15 = 0;
    *(unsigned char *)(a2 + 180) = 0;
  }
  *(unsigned char *)(a2 + 196) = v15;
  id v16 = re::DirectMesh::vertexPayload(this, 3uLL);
  if (v16)
  {
    uuid_copy((unsigned __int8 *)(a2 + 197), (const unsigned __int8 *)(v16 + 16));
    uint64_t v17 = 1;
  }
  else
  {
    uint64_t v17 = 0;
    *(unsigned char *)(a2 + 197) = 0;
  }
  *(unsigned char *)(a2 + 213) = v17;
}

{
  uint64_t v5;
  char v6;

  uuid_copy((unsigned __int8 *)a2, (const unsigned __int8 *)this + 16);
  *(_OWORD *)(a2 + 16) = *((_OWORD *)this + 3);
  *(void *)(a2 + 32) = *((void *)this + 8);
  *(unsigned char *)(a2 + 40) = 1;
  long long v5 = re::DirectBuffer::payload((uint64_t)this, 3, 0);
  if (v5)
  {
    uuid_copy((unsigned __int8 *)(a2 + 48), (const unsigned __int8 *)(v5 + 16));
    long long v6 = 1;
  }
  else
  {
    long long v6 = 0;
    *(unsigned char *)(a2 + 48) = 0;
  }
  *(unsigned char *)(a2 + 64) = v6;
}

void re::makeCommand(_OWORD *a1@<X0>, re::DirectMeshUpdate *a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)a3 = *a1;
  uint64_t v5 = *((void *)a2 + 3);
  *(void *)(a3 + 16) = *((void *)a2 + 2);
  *(unsigned char *)(a3 + 24) = 1;
  long long v6 = (unsigned __int8 *)(a3 + 32);
  if (v5)
  {
    uuid_copy(v6, (const unsigned __int8 *)(v5 + 16));
    LOBYTE(v5) = 1;
  }
  else
  {
    *long long v6 = 0;
  }
  *(unsigned char *)(a3 + 48) = v5;
  uint64_t v7 = (unsigned __int8 *)(a3 + 49);
  uint64_t v8 = *((void *)a2 + 4);
  if (v8)
  {
    uuid_copy(v7, (const unsigned __int8 *)(v8 + 16));
    LOBYTE(v8) = 1;
  }
  else
  {
    unsigned __int8 *v7 = 0;
  }
  *(unsigned char *)(a3 + 65) = v8;
  uint64_t v9 = re::DirectMeshUpdate::vertexUpdate(a2, 0);
  if (v9)
  {
    uuid_copy((unsigned __int8 *)(a3 + 66), (const unsigned __int8 *)(v9 + 16));
    char v10 = 1;
  }
  else
  {
    char v10 = 0;
    *(unsigned char *)(a3 + 66) = 0;
  }
  *(unsigned char *)(a3 + 82) = v10;
  uint64_t v11 = re::DirectMeshUpdate::vertexUpdate(a2, 1uLL);
  if (v11)
  {
    uuid_copy((unsigned __int8 *)(a3 + 83), (const unsigned __int8 *)(v11 + 16));
    char v12 = 1;
  }
  else
  {
    char v12 = 0;
    *(unsigned char *)(a3 + 83) = 0;
  }
  *(unsigned char *)(a3 + 99) = v12;
  uint64_t v13 = re::DirectMeshUpdate::vertexUpdate(a2, 2uLL);
  if (v13)
  {
    uuid_copy((unsigned __int8 *)(a3 + 100), (const unsigned __int8 *)(v13 + 16));
    char v14 = 1;
  }
  else
  {
    char v14 = 0;
    *(unsigned char *)(a3 + 100) = 0;
  }
  *(unsigned char *)(a3 + 116) = v14;
  uint64_t v15 = re::DirectMeshUpdate::vertexUpdate(a2, 3uLL);
  if (v15)
  {
    uuid_copy((unsigned __int8 *)(a3 + 117), (const unsigned __int8 *)(v15 + 16));
    char v16 = 1;
  }
  else
  {
    char v16 = 0;
    *(unsigned char *)(a3 + 117) = 0;
  }
  *(unsigned char *)(a3 + 133) = v16;
}

void re::makeCommand(_OWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_OWORD *)a3 = *a1;
  *(void *)(a3 + 16) = *(void *)(a2 + 24);
  *(unsigned char *)(a3 + 24) = *(unsigned char *)(a2 + 32);
  uint64_t v4 = (unsigned __int8 *)(a3 + 32);
  uint64_t v5 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a2 + 40))(a2, 3, 0);
  if (v5)
  {
    uuid_copy(v4, (const unsigned __int8 *)(v5 + 16));
    char v6 = 1;
  }
  else
  {
    char v6 = 0;
    *uint64_t v4 = 0;
  }
  *(unsigned char *)(a3 + 48) = v6;
}

void re::makeCommands(re *this@<X0>, uint64_t **a2@<X8>)
{
  uint64_t v286 = *MEMORY[0x263EF8340];
  re::make::shared::object<re::DirectResourceCommands>(a2);
  uint64_t v5 = *a2;
  void v5[2] = *((void *)this + 2);
  re::DirectResourceEvent::operator=((xpc_object_t *)v5 + 4, (xpc_object_t *)this + 4);
  re::XPCObject::setValue((xpc_object_t *)*a2 + 3, *((xpc_object_t *)this + 3));
  std::vector<re::CreateDirectPayload>::reserve((char **)*a2 + 32, *((void *)this + 73) + *((void *)this + 68));
  std::vector<re::DestroyResource>::reserve((void **)*a2 + 35, *((void *)this + 78));
  for (uint64_t i = (void *)*((void *)this + 67); i; uint64_t i = (void *)*i)
  {
    uint64_t v7 = i[4];
    if (v7) {
      id v8 = (id)(v7 + 8);
    }
    uint64_t v9 = (int64x2_t *)*a2;
    uuid_copy(dst, (const unsigned __int8 *)(v7 + 16));
    uint64_t v285 = v7;
    if (v7) {
      id v10 = (id)(v7 + 8);
    }
    unint64_t v12 = v9[16].u64[1];
    unint64_t v11 = v9[17].u64[0];
    if (v12 >= v11)
    {
      uint64_t v13 = v9[16].i64[0];
      unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v12 - v13) >> 3);
      unint64_t v15 = v14 + 1;
      if (v14 + 1 > 0xAAAAAAAAAAAAAAALL) {
LABEL_256:
      }
        abort();
      unint64_t v16 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v11 - v13) >> 3);
      if (2 * v16 > v15) {
        unint64_t v15 = 2 * v16;
      }
      if (v16 >= 0x555555555555555) {
        unint64_t v17 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v17 = v15;
      }
      *(void *)&long long v273 = v9 + 17;
      uint64_t Direct = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectPayload>>((uint64_t)v9[17].i64, v17);
      uint64_t v20 = &Direct[24 * v14];
      *(_OWORD *)uint64_t v20 = *(_OWORD *)dst;
      *((void *)v20 + 2) = v285;
      uint64_t v285 = 0;
      uint64_t v22 = v9[16].i64[0];
      unint64_t v21 = v9[16].u64[1];
      if (v21 == v22)
      {
        int64x2_t v24 = vdupq_n_s64(v21);
        long long v23 = &Direct[24 * v14];
      }
      else
      {
        long long v23 = &Direct[24 * v14];
        do
        {
          *(_OWORD *)(v23 - 24) = *(_OWORD *)(v21 - 24);
          *((void *)v23 - 1) = *(void *)(v21 - 8);
          v23 -= 24;
          *(void *)(v21 - 8) = 0;
          v21 -= 24;
        }
        while (v21 != v22);
        int64x2_t v24 = v9[16];
      }
      uint64_t v25 = v20 + 24;
      v9[16].i64[0] = (uint64_t)v23;
      v9[16].i64[1] = (uint64_t)(v20 + 24);
      *(int64x2_t *)&v272[8] = v24;
      uint64_t v26 = v9[17].i64[0];
      v9[17].i64[0] = (uint64_t)&Direct[24 * v19];
      *(void *)&v272[24] = v26;
      *(void *)v272 = v24.i64[0];
      std::__split_buffer<re::CreateDirectPayload>::~__split_buffer((uint64_t)v272);
      uint64_t v27 = v285;
      v9[16].i64[1] = (uint64_t)v25;
      if (v27) {
    }
      }
    else
    {
      *(_OWORD *)unint64_t v12 = *(_OWORD *)dst;
      *(void *)(v12 + 16) = v285;
      v9[16].i64[1] = v12 + 24;
    }
    if (v7) {
  }
    }
  for (j = (void *)*((void *)this + 72); j; j = (void *)*j)
  {
    uint64_t v29 = j[4];
    if (v29) {
      id v30 = (id)(v29 + 8);
    }
    long long v31 = (int64x2_t *)*a2;
    uuid_copy(dst, (const unsigned __int8 *)(v29 + 16));
    uint64_t v285 = v29;
    if (v29) {
      id v32 = (id)(v29 + 8);
    }
    unint64_t v34 = v31[16].u64[1];
    unint64_t v33 = v31[17].u64[0];
    if (v34 >= v33)
    {
      uint64_t v35 = v31[16].i64[0];
      unint64_t v36 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v34 - v35) >> 3);
      unint64_t v37 = v36 + 1;
      if (v36 + 1 > 0xAAAAAAAAAAAAAAALL) {
        goto LABEL_256;
      }
      unint64_t v38 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v33 - v35) >> 3);
      if (2 * v38 > v37) {
        unint64_t v37 = 2 * v38;
      }
      if (v38 >= 0x555555555555555) {
        unint64_t v39 = 0xAAAAAAAAAAAAAAALL;
      }
      else {
        unint64_t v39 = v37;
      }
      *(void *)&long long v273 = v31 + 17;
      int64x2_t v40 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectPayload>>((uint64_t)v31[17].i64, v39);
      uint64_t v42 = &v40[24 * v36];
      *(_OWORD *)uint64_t v42 = *(_OWORD *)dst;
      *((void *)v42 + 2) = v285;
      uint64_t v285 = 0;
      uint64_t v44 = v31[16].i64[0];
      unint64_t v43 = v31[16].u64[1];
      if (v43 == v44)
      {
        int64x2_t v46 = vdupq_n_s64(v43);
        long long v45 = &v40[24 * v36];
      }
      else
      {
        long long v45 = &v40[24 * v36];
        do
        {
          *(_OWORD *)(v45 - 24) = *(_OWORD *)(v43 - 24);
          *((void *)v45 - 1) = *(void *)(v43 - 8);
          v45 -= 24;
          *(void *)(v43 - 8) = 0;
          v43 -= 24;
        }
        while (v43 != v44);
        int64x2_t v46 = v31[16];
      }
      long long v47 = v42 + 24;
      v31[16].i64[0] = (uint64_t)v45;
      v31[16].i64[1] = (uint64_t)(v42 + 24);
      *(int64x2_t *)&v272[8] = v46;
      uint64_t v48 = v31[17].i64[0];
      v31[17].i64[0] = (uint64_t)&v40[24 * v41];
      *(void *)&v272[24] = v48;
      *(void *)v272 = v46.i64[0];
      std::__split_buffer<re::CreateDirectPayload>::~__split_buffer((uint64_t)v272);
      uint64_t v49 = v285;
      v31[16].i64[1] = (uint64_t)v47;
      if (v49) {
    }
      }
    else
    {
      *(_OWORD *)unint64_t v34 = *(_OWORD *)dst;
      *(void *)(v34 + 16) = v285;
      v31[16].i64[1] = v34 + 24;
    }
    if (v29) {
  }
    }
  for (k = (uint64_t *)*((void *)this + 77); k; k = (uint64_t *)*k)
  {
    *(_OWORD *)v272 = *((_OWORD *)k + 1);
    uint64_t v51 = k[4];
    if (v51) {
      id v52 = (id)(v51 + 8);
    }
    v53 = *a2;
    v55 = (_OWORD *)(*a2)[36];
    unint64_t v54 = (*a2)[37];
    if ((unint64_t)v55 >= v54)
    {
      uint64_t v57 = v53[35];
      uint64_t v58 = ((uint64_t)v55 - v57) >> 4;
      unint64_t v59 = v58 + 1;
      if ((unint64_t)(v58 + 1) >> 60) {
        goto LABEL_256;
      }
      uint64_t v60 = v54 - v57;
      if (v60 >> 3 > v59) {
        unint64_t v59 = v60 >> 3;
      }
      if ((unint64_t)v60 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v61 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v61 = v59;
      }
      if (v61) {
        v62 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>((uint64_t)(v53 + 37), v61);
      }
      else {
        v62 = 0;
      }
      v63 = &v62[16 * v58];
      *(_OWORD *)v63 = *(_OWORD *)v272;
      v65 = (char *)v53[35];
      v64 = (char *)v53[36];
      v66 = v63;
      if (v64 != v65)
      {
        do
        {
          *((_OWORD *)v66 - 1) = *((_OWORD *)v64 - 1);
          v66 -= 16;
          v64 -= 16;
        }
        while (v64 != v65);
        v64 = (char *)v53[35];
      }
      v56 = v63 + 16;
      v53[35] = (uint64_t)v66;
      v53[36] = (uint64_t)(v63 + 16);
      v53[37] = (uint64_t)&v62[16 * v61];
      if (v64) {
        operator delete(v64);
      }
    }
    else
    {
      _OWORD *v55 = *(_OWORD *)v272;
      v56 = v55 + 1;
    }
    v53[36] = (uint64_t)v56;
    if (v51) {
  }
    }
  for (m = (void *)*((void *)this + 7); m; m = (void *)*m)
  {
    uint64_t v68 = m[4];
    if (v68) {
      id v69 = (id)(v68 + 8);
    }
    v70 = *a2;
    re::makeCommand((re *)v68, (uint64_t)v272);
    unint64_t v71 = v70[6];
    if (v71 >= v70[7])
    {
      uint64_t v79 = std::vector<re::CreateDirectMesh>::__push_back_slow_path<re::CreateDirectMesh>(v70 + 5, (uint64_t)v272);
      v80 = *(void **)&__p[8];
      v70[6] = v79;
      if (v80)
      {
        *(void *)&__p[16] = v80;
        operator delete(v80);
      }
    }
    else
    {
      *(_OWORD *)unint64_t v71 = *(_OWORD *)v272;
      long long v72 = v273;
      *(_OWORD *)(v71 + 16) = *(_OWORD *)&v272[16];
      *(_OWORD *)(v71 + 32) = v72;
      *(void *)(v71 + 56) = 0;
      *(void *)(v71 + 64) = 0;
      *(void *)(v71 + 48) = 0;
      *(_OWORD *)(v71 + 48) = *(_OWORD *)v274;
      *(void *)(v71 + 64) = *(void *)__p;
      *(void *)(v71 + 72) = 0;
      v274[0] = 0;
      v274[1] = 0;
      *(void *)__p = 0;
      *(void *)(v71 + 80) = 0;
      *(void *)(v71 + 88) = 0;
      *(_OWORD *)(v71 + 72) = *(_OWORD *)&__p[8];
      *(void *)(v71 + 88) = *(void *)&__p[24];
      memset(&__p[8], 0, 24);
      long long v73 = v276;
      long long v74 = v277;
      long long v75 = v279;
      *(_OWORD *)(v71 + 128) = v278;
      *(_OWORD *)(v71 + 144) = v75;
      *(_OWORD *)(v71 + 96) = v73;
      *(_OWORD *)(v71 + 112) = v74;
      long long v76 = v280;
      long long v77 = v281;
      long long v78 = v282;
      *(void *)(v71 + 208) = v283;
      *(_OWORD *)(v71 + 176) = v77;
      *(_OWORD *)(v71 + 192) = v78;
      *(_OWORD *)(v71 + 160) = v76;
      v70[6] = v71 + 216;
    }
    if (v274[0])
    {
      v274[1] = v274[0];
      operator delete(v274[0]);
    }
    if (v68) {
  }
    }
  for (n = (uint64_t *)*((void *)this + 12); n; n = (uint64_t *)*n)
  {
    *(_OWORD *)uuid_t dst = *((_OWORD *)n + 1);
    uint64_t v82 = n[4];
    uint64_t v285 = v82;
    if (v82) {
      id v83 = (id)(v82 + 8);
    }
    v84 = *a2;
    re::makeCommand(dst, (re::DirectMeshUpdate *)v82, (uint64_t)v272);
    unint64_t v85 = v84[9];
    unint64_t v86 = v84[10];
    if (v85 >= v86)
    {
      uint64_t v94 = v84[8];
      unint64_t v95 = 0xF0F0F0F0F0F0F0F1 * ((uint64_t)(v85 - v94) >> 3);
      unint64_t v96 = v95 + 1;
      if (v95 + 1 > 0x1E1E1E1E1E1E1E1) {
        goto LABEL_256;
      }
      unint64_t v97 = 0xF0F0F0F0F0F0F0F1 * ((uint64_t)(v86 - v94) >> 3);
      if (2 * v97 > v96) {
        unint64_t v96 = 2 * v97;
      }
      if (v97 >= 0xF0F0F0F0F0F0F0) {
        unint64_t v98 = 0x1E1E1E1E1E1E1E1;
      }
      else {
        unint64_t v98 = v96;
      }
      if (v98) {
        updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectMesh>>((uint64_t)(v84 + 10), v98);
      }
      else {
        updated = 0;
      }
      v100 = &updated[136 * v95];
      *(_OWORD *)v100 = *(_OWORD *)v272;
      long long v101 = *(_OWORD *)&v272[16];
      long long v102 = v273;
      long long v103 = *(_OWORD *)__p;
      *((_OWORD *)v100 + 3) = *(_OWORD *)v274;
      *((_OWORD *)v100 + 4) = v103;
      *((_OWORD *)v100 + 1) = v101;
      *((_OWORD *)v100 + 2) = v102;
      long long v104 = *(_OWORD *)&__p[16];
      long long v105 = v276;
      long long v106 = v277;
      *((void *)v100 + 16) = v278;
      *((_OWORD *)v100 + 6) = v105;
      *((_OWORD *)v100 + 7) = v106;
      *((_OWORD *)v100 + 5) = v104;
      v108 = (char *)v84[8];
      v107 = (char *)v84[9];
      v109 = v100;
      if (v107 != v108)
      {
        do
        {
          *(_OWORD *)(v109 - 136) = *(_OWORD *)(v107 - 136);
          long long v110 = *(_OWORD *)(v107 - 120);
          long long v111 = *(_OWORD *)(v107 - 104);
          long long v112 = *(_OWORD *)(v107 - 88);
          *(_OWORD *)(v109 - 72) = *(_OWORD *)(v107 - 72);
          *(_OWORD *)(v109 - 88) = v112;
          *(_OWORD *)(v109 - 104) = v111;
          *(_OWORD *)(v109 - 120) = v110;
          long long v113 = *(_OWORD *)(v107 - 56);
          long long v114 = *(_OWORD *)(v107 - 40);
          long long v115 = *(_OWORD *)(v107 - 24);
          *((void *)v109 - 1) = *((void *)v107 - 1);
          *(_OWORD *)(v109 - 24) = v115;
          *(_OWORD *)(v109 - 40) = v114;
          *(_OWORD *)(v109 - 56) = v113;
          v109 -= 136;
          v107 -= 136;
        }
        while (v107 != v108);
        v107 = (char *)v84[8];
      }
      v93 = v100 + 136;
      v84[8] = (uint64_t)v109;
      v84[9] = (uint64_t)(v100 + 136);
      v84[10] = (uint64_t)&updated[136 * v98];
      if (v107) {
        operator delete(v107);
      }
    }
    else
    {
      *(_OWORD *)unint64_t v85 = *(_OWORD *)v272;
      long long v87 = *(_OWORD *)&v272[16];
      long long v88 = v273;
      long long v89 = *(_OWORD *)__p;
      *(_OWORD *)(v85 + 48) = *(_OWORD *)v274;
      *(_OWORD *)(v85 + 64) = v89;
      *(_OWORD *)(v85 + 16) = v87;
      *(_OWORD *)(v85 + 32) = v88;
      long long v90 = *(_OWORD *)&__p[16];
      long long v91 = v276;
      long long v92 = v277;
      *(void *)(v85 + 128) = v278;
      *(_OWORD *)(v85 + 96) = v91;
      *(_OWORD *)(v85 + 112) = v92;
      *(_OWORD *)(v85 + 80) = v90;
      v93 = (char *)(v85 + 136);
    }
    v84[9] = (uint64_t)v93;
    if (v82) {
  }
    }
  for (iuint64_t i = (uint64_t *)*((void *)this + 17); ii; iuint64_t i = (uint64_t *)*ii)
  {
    *(_OWORD *)v272 = *((_OWORD *)ii + 1);
    uint64_t v117 = ii[4];
    if (v117) {
      id v118 = (id)(v117 + 8);
    }
    v119 = *a2;
    v120 = (_OWORD *)(*a2)[12];
    unint64_t v121 = (*a2)[13];
    if ((unint64_t)v120 >= v121)
    {
      uint64_t v123 = v119[11];
      uint64_t v124 = ((uint64_t)v120 - v123) >> 4;
      unint64_t v125 = v124 + 1;
      if ((unint64_t)(v124 + 1) >> 60) {
        goto LABEL_256;
      }
      uint64_t v126 = v121 - v123;
      if (v126 >> 3 > v125) {
        unint64_t v125 = v126 >> 3;
      }
      if ((unint64_t)v126 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v127 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v127 = v125;
      }
      if (v127) {
        v128 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>((uint64_t)(*a2 + 13), v127);
      }
      else {
        v128 = 0;
      }
      v129 = &v128[16 * v124];
      *(_OWORD *)v129 = *(_OWORD *)v272;
      v131 = (char *)v119[11];
      v130 = (char *)v119[12];
      v132 = v129;
      if (v130 != v131)
      {
        do
        {
          *((_OWORD *)v132 - 1) = *((_OWORD *)v130 - 1);
          v132 -= 16;
          v130 -= 16;
        }
        while (v130 != v131);
        v130 = (char *)v119[11];
      }
      v122 = v129 + 16;
      v119[11] = (uint64_t)v132;
      v119[12] = (uint64_t)(v129 + 16);
      v119[13] = (uint64_t)&v128[16 * v127];
      if (v130) {
        operator delete(v130);
      }
    }
    else
    {
      _OWORD *v120 = *(_OWORD *)v272;
      v122 = v120 + 1;
    }
    v119[12] = (uint64_t)v122;
    if (v117) {
  }
    }
  for (jj = (void *)*((void *)this + 22); jj; jj = (void *)*jj)
  {
    uint64_t v134 = jj[4];
    if (v134) {
      id v135 = (id)(v134 + 8);
    }
    v136 = *a2;
    re::makeCommand((re *)v134, (uint64_t)v272);
    unint64_t v137 = v136[15];
    unint64_t v138 = v136[16];
    if (v137 >= v138)
    {
      uint64_t v145 = v136[14];
      uint64_t v146 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v137 - v145) >> 3);
      unint64_t v147 = v146 + 1;
      if ((unint64_t)(v146 + 1) > 0x276276276276276) {
        goto LABEL_256;
      }
      unint64_t v148 = 0x4EC4EC4EC4EC4EC5 * ((uint64_t)(v138 - v145) >> 3);
      if (2 * v148 > v147) {
        unint64_t v147 = 2 * v148;
      }
      if (v148 >= 0x13B13B13B13B13BLL) {
        unint64_t v149 = 0x276276276276276;
      }
      else {
        unint64_t v149 = v147;
      }
      if (v149) {
        v150 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectTexture>>((uint64_t)(v136 + 16), v149);
      }
      else {
        v150 = 0;
      }
      v151 = &v150[104 * v146];
      long long v152 = *(_OWORD *)v272;
      long long v153 = v273;
      *((_OWORD *)v151 + 1) = *(_OWORD *)&v272[16];
      *((_OWORD *)v151 + 2) = v153;
      *(_OWORD *)v151 = v152;
      long long v154 = *(_OWORD *)v274;
      long long v155 = *(_OWORD *)__p;
      long long v156 = *(_OWORD *)&__p[16];
      *((void *)v151 + 12) = v276;
      *((_OWORD *)v151 + 4) = v155;
      *((_OWORD *)v151 + 5) = v156;
      *((_OWORD *)v151 + 3) = v154;
      v158 = (char *)v136[14];
      v157 = (char *)v136[15];
      v159 = v151;
      if (v157 != v158)
      {
        do
        {
          long long v160 = *(_OWORD *)(v157 - 104);
          long long v161 = *(_OWORD *)(v157 - 88);
          *(_OWORD *)(v159 - 72) = *(_OWORD *)(v157 - 72);
          *(_OWORD *)(v159 - 88) = v161;
          *(_OWORD *)(v159 - 104) = v160;
          long long v162 = *(_OWORD *)(v157 - 56);
          long long v163 = *(_OWORD *)(v157 - 40);
          long long v164 = *(_OWORD *)(v157 - 24);
          *((void *)v159 - 1) = *((void *)v157 - 1);
          *(_OWORD *)(v159 - 24) = v164;
          *(_OWORD *)(v159 - 40) = v163;
          *(_OWORD *)(v159 - 56) = v162;
          v159 -= 104;
          v157 -= 104;
        }
        while (v157 != v158);
        v157 = (char *)v136[14];
      }
      v144 = v151 + 104;
      v136[14] = (uint64_t)v159;
      v136[15] = (uint64_t)(v151 + 104);
      v136[16] = (uint64_t)&v150[104 * v149];
      if (v157) {
        operator delete(v157);
      }
    }
    else
    {
      long long v139 = *(_OWORD *)v272;
      long long v140 = v273;
      *(_OWORD *)(v137 + 16) = *(_OWORD *)&v272[16];
      *(_OWORD *)(v137 + 32) = v140;
      *(_OWORD *)unint64_t v137 = v139;
      long long v141 = *(_OWORD *)v274;
      long long v142 = *(_OWORD *)__p;
      long long v143 = *(_OWORD *)&__p[16];
      *(void *)(v137 + 96) = v276;
      *(_OWORD *)(v137 + 64) = v142;
      *(_OWORD *)(v137 + 80) = v143;
      *(_OWORD *)(v137 + 48) = v141;
      v144 = (char *)(v137 + 104);
    }
    v136[15] = (uint64_t)v144;
    if (v134) {
  }
    }
  for (kk = (uint64_t *)*((void *)this + 27); kk; kk = (uint64_t *)*kk)
  {
    *(_OWORD *)uuid_t dst = *((_OWORD *)kk + 1);
    uint64_t v166 = kk[4];
    if (v166) {
      id v167 = (id)(v166 + 8);
    }
    v168 = *a2;
    *(_OWORD *)v272 = *(_OWORD *)dst;
    uint64_t v169 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)v166 + 40))(v166, 3, 0);
    uuid_copy(&v272[16], (const unsigned __int8 *)(v169 + 16));
    v170 = (_OWORD *)v168[18];
    unint64_t v171 = v168[19];
    if ((unint64_t)v170 >= v171)
    {
      uint64_t v174 = v168[17];
      uint64_t v175 = ((uint64_t)v170 - v174) >> 5;
      unint64_t v176 = v175 + 1;
      if ((unint64_t)(v175 + 1) >> 59) {
        goto LABEL_256;
      }
      uint64_t v177 = v171 - v174;
      if (v177 >> 4 > v176) {
        unint64_t v176 = v177 >> 4;
      }
      if ((unint64_t)v177 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v178 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v178 = v176;
      }
      if (v178) {
        v179 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>((uint64_t)(v168 + 19), v178);
      }
      else {
        v179 = 0;
      }
      v180 = &v179[32 * v175];
      long long v181 = *(_OWORD *)&v272[16];
      *(_OWORD *)v180 = *(_OWORD *)v272;
      *((_OWORD *)v180 + 1) = v181;
      v183 = (char *)v168[17];
      v182 = (char *)v168[18];
      v184 = v180;
      if (v182 != v183)
      {
        do
        {
          long long v185 = *((_OWORD *)v182 - 1);
          *((_OWORD *)v184 - 2) = *((_OWORD *)v182 - 2);
          *((_OWORD *)v184 - 1) = v185;
          v184 -= 32;
          v182 -= 32;
        }
        while (v182 != v183);
        v182 = (char *)v168[17];
      }
      v173 = v180 + 32;
      v168[17] = (uint64_t)v184;
      v168[18] = (uint64_t)(v180 + 32);
      v168[19] = (uint64_t)&v179[32 * v178];
      if (v182) {
        operator delete(v182);
      }
    }
    else
    {
      long long v172 = *(_OWORD *)&v272[16];
      _OWORD *v170 = *(_OWORD *)v272;
      v170[1] = v172;
      v173 = v170 + 2;
    }
    v168[18] = (uint64_t)v173;
  }
  for (mm = (uint64_t *)*((void *)this + 32); mm; mm = (uint64_t *)*mm)
  {
    *(_OWORD *)v272 = *((_OWORD *)mm + 1);
    uint64_t v187 = mm[4];
    if (v187) {
      id v188 = (id)(v187 + 8);
    }
    v189 = *a2;
    v190 = (_OWORD *)(*a2)[21];
    unint64_t v191 = (*a2)[22];
    if ((unint64_t)v190 >= v191)
    {
      uint64_t v193 = v189[20];
      uint64_t v194 = ((uint64_t)v190 - v193) >> 4;
      unint64_t v195 = v194 + 1;
      if ((unint64_t)(v194 + 1) >> 60) {
        goto LABEL_256;
      }
      uint64_t v196 = v191 - v193;
      if (v196 >> 3 > v195) {
        unint64_t v195 = v196 >> 3;
      }
      if ((unint64_t)v196 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v197 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v197 = v195;
      }
      if (v197) {
        v198 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>((uint64_t)(*a2 + 22), v197);
      }
      else {
        v198 = 0;
      }
      v199 = &v198[16 * v194];
      *(_OWORD *)v199 = *(_OWORD *)v272;
      v201 = (char *)v189[20];
      v200 = (char *)v189[21];
      v202 = v199;
      if (v200 != v201)
      {
        do
        {
          *((_OWORD *)v202 - 1) = *((_OWORD *)v200 - 1);
          v202 -= 16;
          v200 -= 16;
        }
        while (v200 != v201);
        v200 = (char *)v189[20];
      }
      v192 = v199 + 16;
      v189[20] = (uint64_t)v202;
      v189[21] = (uint64_t)(v199 + 16);
      v189[22] = (uint64_t)&v198[16 * v197];
      if (v200) {
        operator delete(v200);
      }
    }
    else
    {
      _OWORD *v190 = *(_OWORD *)v272;
      v192 = v190 + 1;
    }
    v189[21] = (uint64_t)v192;
    if (v187) {
  }
    }
  for (nn = (void *)*((void *)this + 37); nn; nn = (void *)*nn)
  {
    uint64_t v204 = nn[4];
    if (v204) {
      id v205 = (id)(v204 + 8);
    }
    v206 = *a2;
    re::makeCommand((re *)v204, (uint64_t)v272);
    unint64_t v207 = v206[24];
    unint64_t v208 = v206[25];
    if (v207 >= v208)
    {
      uint64_t v213 = v206[23];
      unint64_t v214 = 0x8E38E38E38E38E39 * ((uint64_t)(v207 - v213) >> 3);
      unint64_t v215 = v214 + 1;
      if (v214 + 1 > 0x38E38E38E38E38ELL) {
        goto LABEL_256;
      }
      unint64_t v216 = 0x8E38E38E38E38E39 * ((uint64_t)(v208 - v213) >> 3);
      if (2 * v216 > v215) {
        unint64_t v215 = 2 * v216;
      }
      if (v216 >= 0x1C71C71C71C71C7) {
        unint64_t v217 = 0x38E38E38E38E38ELL;
      }
      else {
        unint64_t v217 = v215;
      }
      if (v217) {
        v218 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::CreateDirectBuffer>>((uint64_t)(v206 + 25), v217);
      }
      else {
        v218 = 0;
      }
      v219 = &v218[72 * v214];
      *(_OWORD *)v219 = *(_OWORD *)v272;
      long long v220 = *(_OWORD *)&v272[16];
      long long v221 = v273;
      long long v222 = *(_OWORD *)v274;
      *((void *)v219 + 8) = *(void *)__p;
      *((_OWORD *)v219 + 2) = v221;
      *((_OWORD *)v219 + 3) = v222;
      *((_OWORD *)v219 + 1) = v220;
      v224 = (char *)v206[23];
      v223 = (char *)v206[24];
      v225 = v219;
      if (v223 != v224)
      {
        do
        {
          *(_OWORD *)(v225 - 72) = *(_OWORD *)(v223 - 72);
          long long v226 = *(_OWORD *)(v223 - 56);
          long long v227 = *(_OWORD *)(v223 - 40);
          long long v228 = *(_OWORD *)(v223 - 24);
          *((void *)v225 - 1) = *((void *)v223 - 1);
          *(_OWORD *)(v225 - 24) = v228;
          *(_OWORD *)(v225 - 40) = v227;
          *(_OWORD *)(v225 - 56) = v226;
          v225 -= 72;
          v223 -= 72;
        }
        while (v223 != v224);
        v223 = (char *)v206[23];
      }
      v212 = v219 + 72;
      v206[23] = (uint64_t)v225;
      v206[24] = (uint64_t)(v219 + 72);
      v206[25] = (uint64_t)&v218[72 * v217];
      if (v223) {
        operator delete(v223);
      }
    }
    else
    {
      *(_OWORD *)unint64_t v207 = *(_OWORD *)v272;
      long long v209 = *(_OWORD *)&v272[16];
      long long v210 = v273;
      long long v211 = *(_OWORD *)v274;
      *(void *)(v207 + 64) = *(void *)__p;
      *(_OWORD *)(v207 + 32) = v210;
      *(_OWORD *)(v207 + 48) = v211;
      *(_OWORD *)(v207 + 16) = v209;
      v212 = (char *)(v207 + 72);
    }
    v206[24] = (uint64_t)v212;
    if (v204) {
  }
    }
  for (i1 = (uint64_t *)*((void *)this + 42); i1; i1 = (uint64_t *)*i1)
  {
    *(_OWORD *)uuid_t dst = *((_OWORD *)i1 + 1);
    uint64_t v230 = i1[4];
    uint64_t v285 = v230;
    if (v230) {
      id v231 = (id)(v230 + 8);
    }
    v232 = *a2;
    re::makeCommand(dst, v230, (uint64_t)v272);
    unint64_t v233 = v232[27];
    unint64_t v234 = v232[28];
    if (v233 >= v234)
    {
      uint64_t v239 = v232[26];
      uint64_t v240 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v233 - v239) >> 3);
      unint64_t v241 = v240 + 1;
      if ((unint64_t)(v240 + 1) > 0x492492492492492) {
        goto LABEL_256;
      }
      unint64_t v242 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v234 - v239) >> 3);
      if (2 * v242 > v241) {
        unint64_t v241 = 2 * v242;
      }
      if (v242 >= 0x249249249249249) {
        unint64_t v243 = 0x492492492492492;
      }
      else {
        unint64_t v243 = v241;
      }
      if (v243) {
        v244 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>((uint64_t)(v232 + 28), v243);
      }
      else {
        v244 = 0;
      }
      v245 = (void **)&v244[56 * v240];
      long long v246 = *(_OWORD *)v272;
      long long v247 = *(_OWORD *)&v272[16];
      long long v248 = v273;
      v245[6] = v274[0];
      *((_OWORD *)v245 + 1) = v247;
      *((_OWORD *)v245 + 2) = v248;
      *(_OWORD *)v245 = v246;
      v250 = (char *)v232[26];
      v249 = (char *)v232[27];
      v251 = v245;
      if (v249 != v250)
      {
        do
        {
          long long v252 = *(_OWORD *)(v249 - 56);
          long long v253 = *(_OWORD *)(v249 - 40);
          long long v254 = *(_OWORD *)(v249 - 24);
          *(v251 - 1) = (void *)*((void *)v249 - 1);
          *(_OWORD *)(v251 - 3) = v254;
          *(_OWORD *)(v251 - 5) = v253;
          *(_OWORD *)(v251 - 7) = v252;
          v251 -= 7;
          v249 -= 56;
        }
        while (v249 != v250);
        v249 = (char *)v232[26];
      }
      v238 = (char *)(v245 + 7);
      v232[26] = (uint64_t)v251;
      v232[27] = (uint64_t)(v245 + 7);
      v232[28] = (uint64_t)&v244[56 * v243];
      if (v249) {
        operator delete(v249);
      }
    }
    else
    {
      long long v235 = *(_OWORD *)v272;
      long long v236 = *(_OWORD *)&v272[16];
      long long v237 = v273;
      *(void **)(v233 + 48) = v274[0];
      *(_OWORD *)(v233 + 16) = v236;
      *(_OWORD *)(v233 + 32) = v237;
      *(_OWORD *)unint64_t v233 = v235;
      v238 = (char *)(v233 + 56);
    }
    v232[27] = (uint64_t)v238;
    if (v230) {
  }
    }
  for (i2 = (uint64_t *)*((void *)this + 47); i2; i2 = (uint64_t *)*i2)
  {
    *(_OWORD *)v272 = *((_OWORD *)i2 + 1);
    uint64_t v256 = i2[4];
    if (v256) {
      id v257 = (id)(v256 + 8);
    }
    v258 = *a2;
    v259 = (_OWORD *)(*a2)[30];
    unint64_t v260 = (*a2)[31];
    if ((unint64_t)v259 >= v260)
    {
      uint64_t v262 = v258[29];
      uint64_t v263 = ((uint64_t)v259 - v262) >> 4;
      unint64_t v264 = v263 + 1;
      if ((unint64_t)(v263 + 1) >> 60) {
        goto LABEL_256;
      }
      uint64_t v265 = v260 - v262;
      if (v265 >> 3 > v264) {
        unint64_t v264 = v265 >> 3;
      }
      if ((unint64_t)v265 >= 0x7FFFFFFFFFFFFFF0) {
        unint64_t v266 = 0xFFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v266 = v264;
      }
      if (v266) {
        v267 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>((uint64_t)(*a2 + 31), v266);
      }
      else {
        v267 = 0;
      }
      v268 = &v267[16 * v263];
      *(_OWORD *)v268 = *(_OWORD *)v272;
      v270 = (char *)v258[29];
      v269 = (char *)v258[30];
      v271 = v268;
      if (v269 != v270)
      {
        do
        {
          *((_OWORD *)v271 - 1) = *((_OWORD *)v269 - 1);
          v271 -= 16;
          v269 -= 16;
        }
        while (v269 != v270);
        v269 = (char *)v258[29];
      }
      v261 = v268 + 16;
      v258[29] = (uint64_t)v271;
      v258[30] = (uint64_t)(v268 + 16);
      v258[31] = (uint64_t)&v267[16 * v266];
      if (v269) {
        operator delete(v269);
      }
    }
    else
    {
      _OWORD *v259 = *(_OWORD *)v272;
      v261 = v259 + 1;
    }
    v258[30] = (uint64_t)v261;
    if (v256) {
  }
    }
}

uint64_t re::DirectResourceLoader::findPayload(uint64_t a1, uint64_t a2)
{
  if (!*(unsigned char *)(a2 + 16)) {
    return 0;
  }
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2) {
    return (*(uint64_t (**)(uint64_t))(*(void *)v2 + 48))(v2);
  }
  uint64_t v4 = std::__throw_bad_function_call[abi:nn180100]();
  return re::DirectResourceLoader::missingPayload(v4);
}

uint64_t re::DirectResourceLoader::missingPayload(re *a1, re *a2, re *a3, unsigned int a4, int a5, uint64_t a6)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  unint64_t v12 = re::directResourceLog(a1);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    re::toString(a3, v17);
    unint64_t v14 = re::toString(a4);
    unint64_t v15 = re::toString(a5);
    re::toString(a2, v16);
    *(_DWORD *)buf = 136316162;
    uint64_t v19 = v17;
    __int16 v20 = 2080;
    unint64_t v21 = v14;
    __int16 v22 = 2080;
    long long v23 = v15;
    __int16 v24 = 2048;
    uint64_t v25 = a6;
    __int16 v26 = 2080;
    uint64_t v27 = v16;
    _os_log_error_impl(&dword_24CD28000, v12, OS_LOG_TYPE_ERROR, "MissingPayload %s for %s.%s[%zu] %s", buf, 0x34u);
  }
  *(unsigned char *)a1 = 0;
  return 0;
}

uint64_t re::DirectResourceLoader::corruptResource(re *a1, re *a2)
{
  uint64_t v4 = re::directResourceLog(a1);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    re::DirectResourceLoader::corruptResource(a2, v4);
  }
  *(unsigned char *)a1 = 0;
  return 0;
}

uint64_t re::DirectResourceLoader::setPayload(re *a1, const unsigned __int8 *a2, uint64_t a3, uint64_t a4, re *a5)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  if (!*((unsigned char *)a5 + 16)) {
    return 1;
  }
  uint64_t v6 = *((void *)a1 + 4);
  if (v6)
  {
    uint64_t v11 = (*(uint64_t (**)(uint64_t, re *))(*(void *)v6 + 48))(v6, a5);
    if (v11)
    {
      uint64_t v17 = v11;
      id v12 = (id)(v11 + 8);
      uint64_t v13 = (*(uint64_t (**)(const unsigned __int8 *, uint64_t, uint64_t, uint64_t *))(*(void *)a2 + 56))(a2, a3, a4, &v17);
      if (v17) {
    }
      }
    else
    {
      uuid_copy(dst, a2 + 16);
      unsigned int v14 = (*(uint64_t (**)(const unsigned __int8 *))(*(void *)a2 + 40))(a2);
      re::DirectResourceLoader::missingPayload(a1, (re *)dst, a5, v14, a3, a4);
      return 0;
    }
    return v13;
  }
  uint64_t v16 = std::__throw_bad_function_call[abi:nn180100]();
  return re::DirectResourceLoader::setUpdatePayload(v16);
}

void re::DirectResourceLoader::setUpdatePayload(re *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, re *a7)
{
  v20[2] = *MEMORY[0x263EF8340];
  v20[0] = a2;
  v20[1] = a3;
  if (*((unsigned char *)a7 + 16))
  {
    uint64_t v8 = *((void *)a1 + 4);
    if (v8)
    {
      uint64_t v13 = (*(uint64_t (**)(uint64_t, re *))(*(void *)v8 + 48))(v8, a7);
      if (v13)
      {
        uint64_t v19 = v13;
        id v14 = (id)(v13 + 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(void *)a4 + 48))(a4, a5, a6, &v19);
        if (v19) {
      }
        }
      else
      {
        unsigned int v15 = (*(uint64_t (**)(uint64_t))(*(void *)a4 + 64))(a4);
        re::DirectResourceLoader::missingPayload(a1, (re *)v20, a7, v15, a5, a6);
      }
    }
    else
    {
      uint64_t v16 = std::__throw_bad_function_call[abi:nn180100]();
      re::load(v16, v17, v18);
    }
  }
}

void re::load(uint64_t a1@<X0>, re *a2@<X1>, unsigned __int8 **a3@<X8>)
{
  uint64_t v6 = a1 + 16;
  if (re::DirectMeshValidation::isWellFormed(a1 + 16))
  {
    uint64_t v7 = (unsigned __int8 *)operator new(0xB8uLL);
    uint64_t v8 = (re::DirectResource *)re::DirectMesh::DirectMesh(v7, v6);
    re::DirectResource::setIdentifier(v8, (const unsigned __int8 (*)[16])a1);
    if (*(unsigned char *)(a1 + 128))
    {
      if (*(unsigned char *)(a1 + 104)) {
        uint64_t v9 = *(void *)(a1 + 96);
      }
      else {
        uint64_t v9 = 0;
      }
      uint64_t Payload = re::DirectResourceLoader::findPayload((uint64_t)a2, a1 + 112);
      re::DirectMesh::setParts((uint64_t)v7, v9, Payload);
    }
    re::DirectResourceLoader::setPayload(a2, v7, 1, 0, (re *)(a1 + 129));
    uint64_t v11 = 0;
    id v12 = (re *)(a1 + 146);
    do
    {
      re::DirectResourceLoader::setPayload(a2, v7, 2, v11++, v12);
      id v12 = (re *)((char *)v12 + 17);
    }
    while (v11 != 4);
    if (re::DirectMeshValidation::isValid((re::DirectMeshValidation *)v7, v13))
    {
      *a3 = v7;
    }
    else
    {
      re::DirectResourceLoader::corruptResource(a2, (re *)a1);
      *a3 = 0;
    }
  }
  else
  {
    re::DirectResourceLoader::corruptResource(a2, (re *)a1);
    *a3 = 0;
  }
}

void re::load(uint64_t a1@<X0>, re *a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = (re::DirectMeshUpdate *)operator new(0x40uLL);
  re::DirectMeshUpdate::DirectMeshUpdate(v6);
  *a3 = v7;
  if (*(unsigned char *)(a1 + 24))
  {
    uint64_t v8 = *(void *)(a1 + 8);
    *((void *)v6 + 2) = *(void *)(a1 + 16);
    re::DirectResourceLoader::setUpdatePayload(a2, *(void *)a1, v8, (uint64_t)v6, 0, 0, (re *)(a1 + 32));
  }
  re::DirectResourceLoader::setUpdatePayload(a2, *(void *)a1, *(void *)(a1 + 8), (uint64_t)v6, 1, 0, (re *)(a1 + 49));
  uint64_t v9 = 0;
  id v10 = (re *)(a1 + 66);
  do
  {
    re::DirectResourceLoader::setUpdatePayload(a2, *(void *)a1, *(void *)(a1 + 8), (uint64_t)v6, 2, v9++, v10);
    id v10 = (re *)((char *)v10 + 17);
  }
  while (v9 != 4);
}

{
  re::DirectContentsUpdate *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  long long v10;
  char v11;
  uint64_t v12;

  id v12 = *MEMORY[0x263EF8340];
  uint64_t v6 = (re::DirectContentsUpdate *)operator new(0x18uLL);
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 0;
  *(void *)uint64_t v6 = 0;
  re::DirectContentsUpdate::DirectContentsUpdate(v6);
  unsigned __int8 *v7 = &unk_26FF34C20;
  *a3 = v7;
  uint64_t v8 = *(void *)a1;
  uint64_t v9 = *(void *)(a1 + 8);
  id v10 = *(_OWORD *)(a1 + 16);
  uint64_t v11 = 1;
  re::DirectResourceLoader::setUpdatePayload(a2, v8, v9, (uint64_t)v6, 3, 0, (re *)&v10);
}

uint64_t re::load@<X0>(uint64_t a1@<X0>, re *a2@<X1>, const unsigned __int8 **a3@<X8>)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  uint64_t v6 = a1 + 16;
  if (re::DirectTextureValidation::isWellFormed())
  {
    uint64_t v7 = (const unsigned __int8 *)operator new(0x88uLL);
    uint64_t v8 = (re::DirectResource *)re::DirectTexture::DirectTexture(v7, v6);
    re::DirectResource::setIdentifier(v8, (const unsigned __int8 (*)[16])a1);
    long long v10 = *(_OWORD *)(a1 + 88);
    char v11 = 1;
    uint64_t result = re::DirectResourceLoader::setPayload(a2, v7, 3, 0, (re *)&v10);
  }
  else
  {
    uint64_t result = re::DirectResourceLoader::corruptResource(a2, (re *)a1);
    uint64_t v7 = 0;
  }
  *a3 = v7;
  return result;
}

void re::load(__n128 *a1@<X0>, re *a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = a1 + 1;
  if (re::DirectBufferValidation::isWellFormed((__n128 *)a1[1].n128_u64))
  {
    uint64_t v7 = (char *)operator new(0x58uLL);
    re::DirectBuffer::DirectBuffer((re::DirectResource *)v7, v6);
    re::DirectResource::setIdentifier(v8, (const unsigned __int8 (*)[16])a1);
    if (a1[2].n128_u8[8]) {
      unint64_t v9 = a1[2].n128_u64[0];
    }
    else {
      unint64_t v9 = 0;
    }
    re::DirectBuffer::setBytesUsed((re::DirectBuffer *)v7, v9);
    re::DirectResourceLoader::setPayload(a2, (const unsigned __int8 *)v7, 3, 0, (re *)&a1[3]);
    if (re::DirectBufferValidation::isValid((re::DirectBufferValidation *)v7, v10))
    {
      *a3 = v7;
    }
    else
    {
      re::DirectResourceLoader::corruptResource(a2, (re *)a1);
      *a3 = 0;
    }
  }
  else
  {
    re::DirectResourceLoader::corruptResource(a2, (re *)a1);
    *a3 = 0;
  }
}

void re::load(uint64_t *a1@<X0>, re *a2@<X1>, void *a3@<X8>)
{
  uint64_t v6 = operator new(0x28uLL);
  *uint64_t v6 = 0u;
  v6[1] = 0u;
  *((void *)v6 + 4) = 0;
  re::DirectContentsUpdate::DirectContentsUpdate((re::DirectContentsUpdate *)v6);
  *(void *)uint64_t v7 = &unk_26FF34C90;
  *a3 = v7;
  uint64_t v8 = a1[3];
  *(void *)(v7 + 24) = a1[2];
  *(unsigned char *)(v7 + 32) = v8;
  uint64_t v9 = *a1;
  uint64_t v10 = a1[1];

  re::DirectResourceLoader::setUpdatePayload(a2, v9, v10, (uint64_t)v6, 3, 0, (re *)(a1 + 4));
}

void *re::load@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  v52[4] = *MEMORY[0x263EF8340];
  uint64_t v6 = (char *)operator new(0x280uLL);
  uint64_t v7 = re::DirectResourcesCommit::DirectResourcesCommit((re::DirectResourcesCommit *)v6);
  *a3 = v7;
  *(void *)(v7 + 16) = *(void *)(a1 + 16);
  re::DirectResourceEvent::operator=((xpc_object_t *)(v7 + 32), (xpc_object_t *)(a1 + 32));
  re::XPCObject::setValue((xpc_object_t *)v6 + 3, *(xpc_object_t *)(a1 + 24));
  uint64_t v8 = *(void *)(a1 + 256);
  for (uint64_t i = *(void *)(a1 + 264); v8 != i; v8 += 24)
  {
    uint64_t v10 = *(void *)(v8 + 16);
    uint64_t v46 = v10;
    if (v10) {
      id v11 = (id)(v10 + 8);
    }
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create((uint64_t *)v6 + 65, (unsigned __int8 *)v8, &v46);
    if (v46)
    {

      uint64_t v46 = 0;
    }
  }
  uint64_t v12 = *(unsigned __int8 **)(a1 + 280);
  for (j = *(unsigned __int8 **)(a1 + 288); v12 != j; v12 += 16)
  {
    uint64_t v45 = 0;
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy((void *)v6 + 65, v12, &v45);
    if (v45)
    {

      uint64_t v45 = 0;
    }
  }
  std::__function::__value_func<re::DirectMemoryResource * ()(re::DirectResourceId const&)>::__value_func[abi:nn180100]((uint64_t)v47, a2);
  uint64_t v49 = v6;
  id v14 = v6 + 8;
  unsigned int v15 = operator new(0x30uLL);
  uint64_t v16 = v15;
  *unsigned int v15 = &unk_26FF34AF8;
  if (v48)
  {
    if (v48 == v47)
    {
      v15[4] = v15 + 1;
      (*(void (**)(void *))(v47[0] + 24))(v47);
    }
    else
    {
      v15[4] = v48;
      uint64_t v48 = 0;
    }
  }
  else
  {
    v15[4] = 0;
  }
  v16[5] = v49;
  uint64_t v49 = 0;
  v51[0] = 1;
  v52[3] = v16;
  v50[3] = 0;
  std::__function::__value_func<re::DirectMemoryResource * ()(re::DirectResourceId const&)>::~__value_func[abi:nn180100](v50);
  if (v49)
  {

    uint64_t v49 = 0;
  }
  std::__function::__value_func<re::DirectMemoryResource * ()(re::DirectResourceId const&)>::~__value_func[abi:nn180100](v47);
  uint64_t v17 = *(unsigned __int8 **)(a1 + 40);
  for (k = *(unsigned __int8 **)(a1 + 48); v17 != k; v17 += 216)
  {
    re::load((uint64_t)v17, (re *)v51, &v44);
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create((uint64_t *)v6 + 5, v17, (uint64_t *)&v44);
    if (v44)
    {

      uint64_t v44 = 0;
    }
  }
  uint64_t v19 = *(unsigned __int8 **)(a1 + 64);
  for (m = *(unsigned __int8 **)(a1 + 72); v19 != m; v19 += 136)
  {
    re::load((uint64_t)v19, (re *)v51, &v43);
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::setUpdate((void *)v6 + 5, v19, &v43);
    if (v43)
    {

      uint64_t v43 = 0;
    }
  }
  unint64_t v21 = *(unsigned __int8 **)(a1 + 88);
  for (n = *(unsigned __int8 **)(a1 + 96); v21 != n; v21 += 16)
  {
    uint64_t v42 = 0;
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy((void *)v6 + 5, v21, &v42);
    if (v42)
    {

      uint64_t v42 = 0;
    }
  }
  long long v23 = *(unsigned __int8 **)(a1 + 112);
  for (iuint64_t i = *(unsigned __int8 **)(a1 + 120); v23 != ii; v23 += 104)
  {
    re::load((uint64_t)v23, (re *)v51, &v41);
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create((uint64_t *)v6 + 20, v23, (uint64_t *)&v41);
    if (v41)
    {

      uint64_t v41 = 0;
    }
  }
  uint64_t v25 = *(unsigned __int8 **)(a1 + 136);
  for (jj = *(unsigned __int8 **)(a1 + 144); v25 != jj; v25 += 32)
  {
    re::load((uint64_t)v25, (re *)v51, &v40);
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::setUpdate((void *)v6 + 20, v25, &v40);
    if (v40)
    {

      uint64_t v40 = 0;
    }
  }
  uint64_t v27 = *(unsigned __int8 **)(a1 + 160);
  for (kk = *(unsigned __int8 **)(a1 + 168); v27 != kk; v27 += 16)
  {
    uint64_t v39 = 0;
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy((void *)v6 + 20, v27, &v39);
    if (v39)
    {

      uint64_t v39 = 0;
    }
  }
  uint64_t v29 = *(__n128 **)(a1 + 184);
  for (mm = *(__n128 **)(a1 + 192); v29 != mm; uint64_t v29 = (__n128 *)((char *)v29 + 72))
  {
    re::load(v29, (re *)v51, &v38);
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create((uint64_t *)v6 + 35, (unsigned __int8 *)v29, &v38);
    if (v38)
    {

      uint64_t v38 = 0;
    }
  }
  long long v31 = *(uint64_t **)(a1 + 208);
  for (nn = *(uint64_t **)(a1 + 216); v31 != nn; v31 += 7)
  {
    re::load(v31, (re *)v51, &v37);
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::setUpdate((void *)v6 + 35, (unsigned __int8 *)v31, &v37);
    if (v37)
    {

      uint64_t v37 = 0;
    }
  }
  unint64_t v33 = *(unsigned __int8 **)(a1 + 232);
  for (i1 = *(unsigned __int8 **)(a1 + 240); v33 != i1; v33 += 16)
  {
    uint64_t v36 = 0;
    re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy((void *)v6 + 35, v33, &v36);
    if (v36)
    {

      uint64_t v36 = 0;
    }
  }
  return std::__function::__value_func<re::DirectMemoryResource * ()(re::DirectResourceId const&)>::~__value_func[abi:nn180100](v52);
}

void *std::vector<re::DirectMeshVertexAttribute>::vector(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  int64_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    std::vector<re::DirectMeshVertexAttribute>::__vallocate[abi:nn180100](a1, v5 >> 5);
    uint64_t v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *std::vector<re::DirectMeshVertexAttribute>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >> 59) {
    abort();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[32 * v4];
  return result;
}

void *std::vector<re::DirectMeshVertexLayout>::vector(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  int64_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    std::vector<re::DirectMeshVertexLayout>::__vallocate[abi:nn180100](a1, 0xCCCCCCCCCCCCCCCDLL * (v5 >> 3));
    uint64_t v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *std::vector<re::DirectMeshVertexLayout>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x666666666666667) {
    abort();
  }
  uint64_t result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DirectMeshVertexLayout>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[40 * v4];
  return result;
}

void *std::__function::__value_func<re::DirectMemoryResource * ()(re::DirectResourceId const&)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t std::__function::__value_func<re::DirectMemoryResource * ()(re::DirectResourceId const&)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void *std::__function::__func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::~__func(void *a1)
{
  *a1 = &unk_26FF34AF8;
  uint64_t v2 = a1[5];
  if (v2)
  {

    a1[5] = 0;
  }
  std::__function::__value_func<re::DirectMemoryResource * ()(re::DirectResourceId const&)>::~__value_func[abi:nn180100](a1 + 1);
  return a1;
}

void std::__function::__func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::~__func(void *a1)
{
  *a1 = &unk_26FF34AF8;
  uint64_t v2 = a1[5];
  if (v2)
  {

    a1[5] = 0;
  }
  std::__function::__value_func<re::DirectMemoryResource * ()(re::DirectResourceId const&)>::~__value_func[abi:nn180100](a1 + 1);

  JUMPOUT(0x2533130A0);
}

void *std::__function::__func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::__clone(uint64_t a1)
{
  uint64_t v1 = a1 + 8;
  uint64_t v2 = operator new(0x30uLL);
  *uint64_t v2 = &unk_26FF34AF8;
  std::__compressed_pair_elem<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,0,false>::__compressed_pair_elem[abi:nn180100]<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> && const&,0ul>((uint64_t)(v2 + 1), v1);
  return v2;
}

uint64_t std::__function::__func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FF34AF8;
  return std::__compressed_pair_elem<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,0,false>::__compressed_pair_elem[abi:nn180100]<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> && const&,0ul>((uint64_t)(a2 + 1), a1 + 8);
}

void *std::__function::__func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::destroy(uint64_t a1)
{
  return std::__function::__alloc_func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::destroy[abi:nn180100]((void *)(a1 + 8));
}

void std::__function::__func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::destroy_deallocate(void *a1)
{
  std::__function::__alloc_func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::destroy[abi:nn180100](a1 + 1);

  operator delete(a1);
}

uint64_t std::__function::__func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::operator()(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v3 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>((void *)(*(void *)(a1 + 40) + 520), a2);
  if (v3) {
    return *((void *)v3 + 4);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    uint64_t v6 = *(uint64_t (**)(void))(*(void *)v5 + 48);
    return v6();
  }
  else
  {
    uint64_t v7 = std::__throw_bad_function_call[abi:nn180100]();
    return std::__compressed_pair_elem<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,0,false>::__compressed_pair_elem[abi:nn180100]<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> && const&,0ul>(v7, v8);
  }
}

uint64_t std::__compressed_pair_elem<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,0,false>::__compressed_pair_elem[abi:nn180100]<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> && const&,0ul>(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = std::__function::__value_func<re::DirectMemoryResource * ()(re::DirectResourceId const&)>::__value_func[abi:nn180100](a1, a2);
  uint64_t v5 = *(void *)(a2 + 32);
  *(void *)(v4 + 32) = v5;
  if (v5) {
    id v6 = (id)(v5 + 8);
  }
  return a1;
}

void *std::__function::__alloc_func<re::load(re::DirectResourceCommands const&,std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&)::$_0,std::allocator<std::function<re::DirectMemoryResource * ()(re::DirectResourceId const&)> &&>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::destroy[abi:nn180100](void *a1)
{
  uint64_t v2 = a1[4];
  if (v2)
  {

    a1[4] = 0;
  }

  return std::__function::__value_func<re::DirectMemoryResource * ()(re::DirectResourceId const&)>::~__value_func[abi:nn180100](a1);
}

const unsigned __int8 *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(void *a1, unsigned __int8 *uu2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v4 = (*((void *)uu2 + 1) + (*(void *)uu2 << 6) + (*(void *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(void *)uu2;
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  unint64_t v6 = v5.u32[0];
  if (v5.u32[0] > 1uLL)
  {
    uint64_t v7 = (*((void *)uu2 + 1) + (*(void *)uu2 << 6) + (*(void *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(void *)uu2;
    if (v4 >= *(void *)&v2) {
      uint64_t v7 = v4 % *(void *)&v2;
    }
  }
  else
  {
    uint64_t v7 = v4 & (*(void *)&v2 - 1);
  }
  uint64_t v8 = *(const unsigned __int8 ***)(*a1 + 8 * v7);
  if (!v8) {
    return 0;
  }
  for (uint64_t i = *v8; i; uint64_t i = *(const unsigned __int8 **)i)
  {
    unint64_t v10 = *((void *)i + 1);
    if (v10 == v4)
    {
      if (!uuid_compare(i + 16, uu2)) {
        return i;
      }
    }
    else
    {
      if (v6 > 1)
      {
        if (v10 >= *(void *)&v2) {
          v10 %= *(void *)&v2;
        }
      }
      else
      {
        v10 &= *(void *)&v2 - 1;
      }
      if (v10 != v7) {
        return 0;
      }
    }
  }
  return i;
}

uint64_t re::DirectTextureValidation::isWellFormed()
{
  return 1;
}

double re::DirectMeshUpdate::DirectMeshUpdate(re::DirectMeshUpdate *this)
{
  ArcSharedObject::ArcSharedObject(this, 0);
  *(void *)uint64_t v1 = &unk_26FF34B40;
  double result = 0.0;
  *(_OWORD *)(v1 + 16) = 0u;
  *(_OWORD *)(v1 + 32) = 0u;
  *(_OWORD *)(v1 + 48) = 0u;
  return result;
}

void re::DirectMeshUpdate::~DirectMeshUpdate(re::DirectMeshUpdate *this)
{
  *(void *)this = &unk_26FF34B40;
  unint64_t v4 = (void **)((char *)this + 40);
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v4);
  uint64_t v2 = *((void *)this + 4);
  if (v2)
  {

    *((void *)this + 4) = 0;
  }
  uint64_t v3 = *((void *)this + 3);
  if (v3)
  {

    *((void *)this + 3) = 0;
  }
  ArcSharedObject::~ArcSharedObject(this);
}

{
  uint64_t vars8;

  re::DirectMeshUpdate::~DirectMeshUpdate(this);

  JUMPOUT(0x2533130A0);
}

uint64_t re::DirectMeshUpdate::type(re::DirectMeshUpdate *this)
{
  return 1;
}

uint64_t re::DirectMeshUpdate::setPayload(void *a1, int a2, unint64_t a3, uint64_t *a4)
{
  switch(a2)
  {
    case 2:
      if (a3 <= 3)
      {
        uint64_t v7 = *a4;
        *a4 = 0;
        uint64_t v8 = a1[5];
        uint64_t v9 = a1 + 5;
        if (a3 >= (a1[6] - v8) >> 3)
        {
          std::vector<re::SharedPtr<re::DirectBuffer>>::resize((uint64_t)v9, a3 + 1);
          uint64_t v8 = *v9;
        }
        uint64_t v10 = *(void *)(v8 + 8 * a3);
        *(void *)(v8 + 8 * a3) = v7;
        if (v10) {

        }
        return 1;
      }
      break;
    case 1:
      uint64_t v4 = a1[4];
      a1[4] = *a4;
      goto LABEL_6;
    case 0:
      uint64_t v4 = a1[3];
      a1[3] = *a4;
LABEL_6:
      *a4 = v4;
      return 1;
  }
  return 0;
}

uint64_t re::DirectMeshUpdate::forEachSlot(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = &re::DirectMeshUpdate::forEachSlot(std::function<void ()(re::DirectResourceSlot)> const&)const::kAllMeshSlots;
  do
  {
    uint64_t v4 = *v3;
    uint64_t v5 = v3[1];
    v3 += 2;
    uint64_t result = std::function<void ()(re::DirectResourceSlot)>::operator()(a2, v4, v5);
  }
  while (v3 != &re::DirectMeshUpdate::apply(re::DirectResource *)::kMeshSlots);
  return result;
}

uint64_t re::DirectMeshUpdate::payload(uint64_t a1, int a2, unint64_t a3)
{
  switch(a2)
  {
    case 2:
      uint64_t v4 = *(void *)(a1 + 40);
      if (a3 < (*(void *)(a1 + 48) - v4) >> 3)
      {
        uint64_t v3 = v4 + 8 * a3;
        return *(void *)v3;
      }
      break;
    case 1:
      uint64_t v3 = a1 + 32;
      return *(void *)v3;
    case 0:
      uint64_t v3 = a1 + 24;
      return *(void *)v3;
  }
  return 0;
}

uint64_t re::DirectMeshUpdate::vertexUpdate(re::DirectMeshUpdate *this, unint64_t a2)
{
  uint64_t v2 = *((void *)this + 5);
  if (a2 >= (*((void *)this + 6) - v2) >> 3) {
    return 0;
  }
  else {
    return *(void *)(v2 + 8 * a2);
  }
}

BOOL re::DirectMeshUpdate::validate(re::DirectMeshUpdate *this, const re::DirectResource *a2)
{
  if ((*(unsigned int (**)(const re::DirectResource *))(*(void *)a2 + 40))(a2) != 1) {
    return 0;
  }
  BOOL result = re::DirectMeshValidation::isValid((uint64_t)this, (unint64_t *)a2 + 6);
  if (!result) {
    return result;
  }
  uint64_t v5 = *((void *)this + 4);
  if (!v5) {
    return 1;
  }
  BOOL isPrivateToThisProcess = re::isPrivateToThisProcess(*(_DWORD *)(v5 + 32));
  if (isPrivateToThisProcess) {
    return 1;
  }
  uint64_t v7 = re::directResourceLog((re *)isPrivateToThisProcess);
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  BOOL result = 0;
  if (v8)
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_24CD28000, v7, OS_LOG_TYPE_DEFAULT, "Index buffer must be private", v9, 2u);
    return 0;
  }
  return result;
}

uint64_t re::DirectMeshUpdate::attachToDevice(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5 = a1[3];
  if (!v5 || (int v6 = re::DirectMemoryResource::bindToResource(v5, 1, 0), result = 0, v6))
  {
    uint64_t v8 = a1[4];
    if (!v8 || (uint64_t result = re::DirectMemoryResource::bindToResource(v8, 1, 1), result))
    {
      uint64_t v9 = (uint64_t *)a1[5];
      uint64_t v10 = (uint64_t *)a1[6];
      while (v9 != v10)
      {
        if (*v9)
        {
          uint64_t result = re::DirectMemoryResource::bindToResource(*v9, 1, 2);
          if (!result) {
            return result;
          }
        }
        ++v9;
      }
      id v11 = (re::DirectMemoryResource *)a1[4];
      if (v11 && !*(void *)re::DirectMemoryResource::runtimeResource(v11))
      {
        uint64_t v12 = a1[4];
        re::DirectMemoryResource::makeBuffer(a3, v12, &v18);
        id v13 = v18;
        id v18 = 0;
        id v19 = v13;
        re::DirectMemoryResource::setRuntimeResource(v12, &v19);
        if (v19)
        {

          id v19 = 0;
        }
        if (v18) {
      }
        }
      id v14 = (re::DirectMemoryResource **)a1[5];
      unsigned int v15 = (re::DirectMemoryResource **)a1[6];
      while (v14 != v15)
      {
        uint64_t v16 = *v14;
        if (*v14 && !*(void *)re::DirectMemoryResource::runtimeResource(*v14))
        {
          re::DirectMemoryResource::makeBuffer(a3, (uint64_t)v16, &v18);
          id v17 = v18;
          id v18 = 0;
          re::DirectMemoryResource::setRuntimeResource((uint64_t)v16, &v17);
          if (v17)
          {

            id v17 = 0;
          }
          if (v18) {
        }
          }
        ++v14;
      }
      return 1;
    }
  }
  return result;
}

void re::DirectMeshUpdate::apply(re::DirectMeshUpdate *this, re::DirectResource *a2)
{
  if ((*(unsigned int (**)(re::DirectResource *))(*(void *)a2 + 40))(a2) == 1)
  {
    uint64_t v4 = *((void *)this + 3);
    if (v4) {
      re::DirectMesh::setParts((uint64_t)a2, *((void *)this + 2), v4);
    }
    uint64_t v5 = &re::DirectMeshUpdate::apply(re::DirectResource *)::kMeshSlots;
    do
    {
      uint64_t v6 = *v5;
      unint64_t v7 = v5[1];
      uint64_t v8 = (*(uint64_t (**)(re::DirectMeshUpdate *, uint64_t, unint64_t))(*(void *)this + 40))(this, *v5, v7);
      if (v8)
      {
        uint64_t v10 = v8;
        id v9 = (id)(v8 + 8);
        re::DirectMesh::setPayload((uint64_t)a2, v6, v7, &v10);
        if (v10)
        {

          uint64_t v10 = 0;
        }
      }
      v5 += 2;
    }
    while (v5 != &qword_24CD45938);
  }
}

void re::DirectContentsUpdate::DirectContentsUpdate(re::DirectContentsUpdate *this)
{
  ArcSharedObject::ArcSharedObject(this, 0);
  *uint64_t v1 = &unk_26FF34BB0;
  v1[2] = 0;
}

void re::DirectContentsUpdate::~DirectContentsUpdate(re::DirectContentsUpdate *this)
{
  *(void *)this = &unk_26FF34BB0;
  uint64_t v2 = *((void *)this + 2);
  if (v2)
  {

    *((void *)this + 2) = 0;
  }

  ArcSharedObject::~ArcSharedObject(this);
}

uint64_t re::DirectContentsUpdate::payload(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result = 0;
  if (a2 == 3 && !a3) {
    return *(void *)(a1 + 16);
  }
  return result;
}

uint64_t re::DirectContentsUpdate::setPayload(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  BOOL v4 = a2 == 3 && a3 == 0;
  uint64_t v5 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 16);
    *(void *)(a1 + 16) = *a4;
    *a4 = v6;
  }
  return v5;
}

void re::DirectContentsUpdate::apply(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = (*(uint64_t (**)(uint64_t, uint64_t, void))(*(void *)a1 + 40))(a1, 3, 0);
  if (v3)
  {
    uint64_t v5 = v3;
    id v4 = (id)(v3 + 8);
    (*(void (**)(uint64_t, uint64_t, void, uint64_t *))(*(void *)a2 + 56))(a2, 3, 0, &v5);
    if (v5) {
  }
    }
}

uint64_t re::DirectContentsUpdate::forEachSlot(uint64_t a1, uint64_t a2)
{
  return std::function<void ()(re::DirectResourceSlot)>::operator()(a2, 3, 0);
}

void re::DirectTextureUpdate::~DirectTextureUpdate(re::DirectTextureUpdate *this)
{
  re::DirectContentsUpdate::~DirectContentsUpdate(this);

  JUMPOUT(0x2533130A0);
}

uint64_t re::DirectTextureUpdate::type(re::DirectTextureUpdate *this)
{
  return 2;
}

BOOL re::DirectTextureUpdate::validate(uint64_t a1, uint64_t a2)
{
  return (*(unsigned int (**)(uint64_t))(*(void *)a2 + 40))(a2) == 2;
}

uint64_t re::DirectTextureUpdate::attachToDevice(uint64_t a1, uint64_t a2, void *a3)
{
  if ((*(unsigned int (**)(uint64_t))(*(void *)a2 + 40))(a2) != 2) {
    return 0;
  }
  uint64_t v6 = *(re::DirectMemoryResource **)(a1 + 16);
  if (!v6 || *(void *)re::DirectMemoryResource::runtimeResource(v6)) {
    return 1;
  }
  uint64_t v8 = *(re::DirectMemoryResource **)(a1 + 16);

  return re::DirectTexture::allocateRuntimeResource(a2 + 48, v8, a3);
}

void re::DirectBufferUpdate::~DirectBufferUpdate(re::DirectBufferUpdate *this)
{
  re::DirectContentsUpdate::~DirectContentsUpdate(this);

  JUMPOUT(0x2533130A0);
}

uint64_t re::DirectBufferUpdate::type(re::DirectBufferUpdate *this)
{
  return 3;
}

BOOL re::DirectBufferUpdate::validate(re::DirectBufferUpdate *this, const re::DirectResource *a2)
{
  if ((*(unsigned int (**)(const re::DirectResource *))(*(void *)a2 + 40))(a2) != 3) {
    return 0;
  }
  id v4 = (unint64_t *)((char *)a2 + 48);
  if (!*((unsigned char *)this + 32)
    || (BOOL result = re::DirectBufferValidation::isValidBytesUsed(*((void *)this + 3), v4), result))
  {
    uint64_t v6 = *((void *)this + 2);
    return !v6 || *(void *)(v6 + 40) >= *v4;
  }
  return result;
}

uint64_t re::DirectBufferUpdate::attachToDevice(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(re::DirectMemoryResource **)(a1 + 16);
  if (v3)
  {
    uint64_t result = re::DirectMemoryResource::bindToResource(*(void *)(a1 + 16), 3, 3);
    if (!result) {
      return result;
    }
    if (!*(void *)re::DirectMemoryResource::runtimeResource(v3))
    {
      re::DirectMemoryResource::makeBuffer(a3, (uint64_t)v3, &v7);
      id v6 = v7;
      id v7 = 0;
      id v8 = v6;
      re::DirectMemoryResource::setRuntimeResource((uint64_t)v3, &v8);
      if (v8)
      {

        id v8 = 0;
      }
      if (v7) {
    }
      }
  }
  return 1;
}

void re::DirectBufferUpdate::apply(re::DirectBufferUpdate *this, re::DirectResource *a2)
{
  if ((*(unsigned int (**)(re::DirectResource *))(*(void *)a2 + 40))(a2) == 3)
  {
    if (*((unsigned char *)this + 32)) {
      re::DirectBuffer::setBytesUsed(a2, *((void *)this + 3));
    }
    re::DirectContentsUpdate::apply((uint64_t)this, (uint64_t)a2);
  }
}

BOOL re::DirectMeshValidation::isValid(uint64_t *a1, unint64_t a2, uint64_t a3)
{
  if ((unint64_t)a1[2] > 4 || (unint64_t)a1[4] > 1) {
    return 0;
  }
  uint64_t v4 = *a1;
  return v4 + a1[1] * re::lengthInBytes(a3) <= a2;
}

uint64_t re::DirectMeshValidation::isWellFormed(unsigned int *a1, unsigned int *a2, unint64_t a3)
{
  v6[2] = *MEMORY[0x263EF8340];
  memset(v6, 0, 13);
  if (a1 == a2) {
    return 1;
  }
  while (1)
  {
    uint64_t v3 = *a1;
    if (v3 > 0xC
      || (unint64_t)(*((void *)a1 + 1) - 1) > 0x34
      || *((void *)a1 + 2) >= a3
      || *((unsigned char *)v6 + v3))
    {
      break;
    }
    uint64_t v4 = 1;
    *((unsigned char *)v6 + v3) = 1;
    a1 += 8;
    if (a1 == a2) {
      return v4;
    }
  }
  return 0;
}

BOOL re::DirectMeshValidation::isWellFormed(void *a1)
{
  if (*a1 > 3uLL) {
    return 0;
  }
  unint64_t v1 = a1[4];
  if (v1 > 2) {
    return 0;
  }
  uint64_t v2 = a1[3];
  if (!v1) {
    return v2 == 0;
  }
  BOOL v3 = v2 != 0;
  BOOL v4 = v2 == 1;
  if (v1 != 1) {
    BOOL v4 = 0;
  }
  if (v1 == 2) {
    return v3;
  }
  else {
    return v4;
  }
}

uint64_t re::DirectMeshValidation::isWellFormed(uint64_t a1)
{
  if ((unint64_t)(*(void *)(a1 + 16) - 5) < 0xFFFFFFFFFFFFFFFCLL || *(void *)a1 == 0) {
    return 0;
  }
  uint64_t result = re::lengthInBytes(*(void *)(a1 + 8));
  if (result)
  {
    BOOL v4 = *(void **)(a1 + 56);
    uint64_t v5 = *(void **)(a1 + 64);
    uint64_t result = re::DirectMeshValidation::isWellFormed(*(unsigned int **)(a1 + 32), *(unsigned int **)(a1 + 40), 0xCCCCCCCCCCCCCCCDLL * (v5 - v4));
    if (result)
    {
      if (v5 != v4)
      {
        uint64_t v6 = 8 * (v5 - v4);
        while (re::DirectMeshValidation::isWellFormed(v4))
        {
          v4 += 5;
          v6 -= 40;
          if (!v6) {
            goto LABEL_13;
          }
        }
        return 0;
      }
LABEL_13:
      if (is_mul_ok(*(void *)a1, re::lengthInBytes(*(void *)(a1 + 8))))
      {
        re::calculateBufferSizes((unint64_t *)a1, (uint64_t)v7);
        return v7[40] != 0;
      }
      return 0;
    }
  }
  return result;
}

uint64_t re::DirectMeshValidation::validateBufferSizes(re::DirectMeshValidation *this, const re::DirectMesh *a2)
{
  re::calculateBufferSizes((unint64_t *)this + 6, (uint64_t)v7);
  if (v8)
  {
    uint64_t v3 = re::DirectMesh::indexPayload(this);
    if (*(void *)(v3 + 40) >= v7[0])
    {
      unint64_t v5 = 0;
      while (1)
      {
        unint64_t v6 = v7[v5 + 1];
        if (v6)
        {
          uint64_t result = re::DirectMesh::vertexPayload(this, v5);
          if (!result) {
            return result;
          }
          if (*(void *)(result + 40) < v6) {
            break;
          }
        }
        if (++v5 == 4) {
          return 1;
        }
      }
    }
  }
  return 0;
}

BOOL re::DirectMeshValidation::validateBufferSizes(re::DirectMeshUpdate *a1, unint64_t *a2)
{
  re::calculateBufferSizes(a2, (uint64_t)v10);
  if (v11)
  {
    uint64_t v3 = *((void *)a1 + 4);
    if (!v3 || *(void *)(v3 + 40) >= v10[0])
    {
      unint64_t v4 = 0;
      while (1)
      {
        unint64_t v5 = v10[v4 + 1];
        uint64_t v6 = re::DirectMeshUpdate::vertexUpdate(a1, v4);
        BOOL v7 = !v5 || v6 == 0;
        if (!v7 && *(void *)(v6 + 40) < v5) {
          break;
        }
        if (++v4 == 4)
        {
          uint64_t v8 = *((void *)a1 + 3);
          return !v8 || *(void *)(v8 + 40) >= (unint64_t)(96 * *((void *)a1 + 2));
        }
      }
    }
  }
  return 0;
}

uint64_t re::DirectMeshValidation::validateAndFixupIndices(uint64_t a1, _WORD *a2, unint64_t a3, unsigned int a4)
{
  if (a1 != 1)
  {
    if (a1) {
      return 2;
    }
    if (a3 >= 2)
    {
      uint64_t result = 0;
      unint64_t v5 = a3 >> 1;
      do
      {
        unsigned int v6 = (unsigned __int16)*a2;
        if (v6 >= (unsigned __int16)a4 && v6 != 0xFFFF)
        {
          *a2 = -1;
          uint64_t result = 1;
        }
        ++a2;
        --v5;
      }
      while (v5);
      return result;
    }
    return 0;
  }
  if (a3 < 4) {
    return 0;
  }
  uint64_t result = 0;
  unint64_t v8 = a3 >> 2;
  do
  {
    if (*(_DWORD *)a2 >= a4 && *(_DWORD *)a2 != -1)
    {
      *(_DWORD *)a2 = -1;
      uint64_t result = 1;
    }
    a2 += 2;
    --v8;
  }
  while (v8);
  return result;
}

BOOL re::DirectMeshValidation::isValid(re::DirectMeshValidation *this, const re::DirectMesh *a2)
{
  if (!re::DirectMeshValidation::validateBufferSizes(this, a2)) {
    return 0;
  }
  uint64_t v3 = *((void *)this + 7);
  unint64_t v4 = (re::DirectMemoryResource *)re::DirectMesh::indexPayload(this);
  unint64_t v5 = (uint32x4_t *)re::DirectMemoryResource::bytes(v4);
  uint64_t v6 = re::DirectMesh::indexPayload(this);
  if (!re::MeshValidation::validateIndices(v3, v5, *(void *)(v6 + 40), *((void *)this + 9))) {
    return 0;
  }
  BOOL v7 = (re::DirectMemoryResource *)re::DirectMesh::partsPayload(this);
  unint64_t v8 = *((void *)this + 16);

  return re::DirectMeshValidation::isValidParts(v7, v8, (uint64_t *)this + 6);
}

BOOL re::DirectMeshValidation::isValidParts(re::DirectMemoryResource *a1, unint64_t a2, uint64_t *a3)
{
  if (a2 >= *((void *)a1 + 5) / 0x60uLL) {
    return 0;
  }
  uint64_t v6 = *a3;
  uint64_t v7 = re::lengthInBytes(a3[1]);
  uint64_t v8 = a3[1];
  uint64_t v9 = re::DirectMemoryResource::bytes(a1);
  if (!a2) {
    return 1;
  }
  uint64_t v10 = (uint64_t *)v9;
  unint64_t v11 = v7 * v6;
  uint64_t v12 = 96 * a2 - 96;
  do
  {
    BOOL result = re::DirectMeshValidation::isValid(v10, v11, v8);
    if (!result) {
      break;
    }
    v10 += 12;
    uint64_t v14 = v12;
    v12 -= 96;
  }
  while (v14);
  return result;
}

BOOL re::DirectMeshValidation::isValid(uint64_t a1, unint64_t *a2)
{
  BOOL result = re::DirectMeshValidation::validateBufferSizes((re::DirectMeshUpdate *)a1, a2);
  if (result)
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (!v5
      || (uint64_t v6 = a2[1],
          uint64_t v7 = (uint32x4_t *)re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(a1 + 32)),
          BOOL result = re::MeshValidation::validateIndices(v6, v7, *(void *)(v5 + 40), a2[3])))
    {
      uint64_t v8 = *(re::DirectMemoryResource **)(a1 + 24);
      if (!v8) {
        return 1;
      }
      BOOL result = re::DirectMeshValidation::isValidParts(v8, *(void *)(a1 + 16), (uint64_t *)a2);
      if (result) {
        return 1;
      }
    }
  }
  return result;
}

BOOL __REALITYKIT_WAITING_ON_RENDERER__(unint64_t *a1, unint64_t a2)
{
  unint64_t v2 = atomic_load(a1);
  if (v2 >= a2) {
    return 1;
  }
  do
  {
    int v5 = __ulock_wait();
    BOOL result = v5 >= 0;
    if (v5 < 0) {
      break;
    }
    unint64_t v7 = atomic_load(a1);
  }
  while (v7 < a2);
  return result;
}

uint64_t re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::~DirectResourceChanges(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear(a1);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear(a1 + 40);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear(a1 + 80);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table(a1 + 80);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table(a1 + 40);

  return std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table(a1);
}

uint64_t *re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create(uint64_t *result, unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = *a3;
  if (*a3)
  {
    uint64_t v5 = (uint64_t)result;
    long long v7 = *(_OWORD *)a2;
    uint64_t v8 = v3;
    id v6 = (id)(v3 + 8);
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>(v5, (unsigned __int8 *)&v7, (uint64_t)&v7);
    if (v8) {

    }
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::__erase_unique<re::DirectResourceId>((void *)(v5 + 40), a2);
    return std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::__erase_unique<re::DirectResourceId>((void *)(v5 + 80), a2);
  }
  return result;
}

void re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::setUpdate(void *a1, unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (*a3
    && !std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a1, a2))
  {
    long long v6 = *(_OWORD *)a2;
    uint64_t v7 = *a3;
    *a3 = 0;
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>((uint64_t)(a1 + 5), (unsigned __int8 *)&v6, (uint64_t)&v6);
    if (v7) {
  }
    }
}

void re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy(void *a1, unsigned __int8 *a2, uint64_t *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::__erase_unique<re::DirectResourceId>(a1, a2);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::__erase_unique<re::DirectResourceId>(a1 + 5, a2);
  uint64_t v6 = (uint64_t)(a1 + 10);
  long long v9 = *(_OWORD *)a2;
  uint64_t v7 = *a3;
  uint64_t v10 = v7;
  if (v7) {
    id v8 = (id)(v7 + 8);
  }
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>(v6, (unsigned __int8 *)&v9, (uint64_t)&v9);
  if (v10) {
}
  }

uint64_t re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::ensureUpdate(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1 + 40;
  unint64_t v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>((void *)(a1 + 40), a2);
  if (v4) {
    return *((void *)v4 + 4);
  }
  uint64_t v6 = (re::DirectMeshUpdate *)operator new(0x40uLL);
  re::DirectMeshUpdate::DirectMeshUpdate(v6);
  long long v9 = *(_OWORD *)a2;
  uint64_t v10 = v7;
  uint64_t v5 = *((void *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>(v3, (unsigned __int8 *)&v9, (uint64_t)&v9)+ 4);
  if (v10) {

  }
  return v5;
}

uint64_t re::DirectResourceChanges<re::DirectTexture,re::DirectTextureUpdate>::ensureUpdate(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1 + 40;
  unint64_t v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>((void *)(a1 + 40), a2);
  if (v4) {
    return *((void *)v4 + 4);
  }
  uint64_t v6 = (re::DirectContentsUpdate *)operator new(0x18uLL);
  *((void *)v6 + 1) = 0;
  *((void *)v6 + 2) = 0;
  *(void *)uint64_t v6 = 0;
  re::DirectContentsUpdate::DirectContentsUpdate(v6);
  void *v7 = &unk_26FF34C20;
  long long v9 = *(_OWORD *)a2;
  uint64_t v10 = v7;
  uint64_t v5 = *((void *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>(v3, (unsigned __int8 *)&v9, (uint64_t)&v9)+ 4);
  if (v10) {

  }
  return v5;
}

uint64_t re::DirectResourceChanges<re::DirectBuffer,re::DirectBufferUpdate>::ensureUpdate(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v3 = a1 + 40;
  unint64_t v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>((void *)(a1 + 40), a2);
  if (v4) {
    return *((void *)v4 + 4);
  }
  uint64_t v6 = operator new(0x28uLL);
  *uint64_t v6 = 0u;
  v6[1] = 0u;
  *((void *)v6 + 4) = 0;
  re::DirectContentsUpdate::DirectContentsUpdate((re::DirectContentsUpdate *)v6);
  *(void *)uint64_t v7 = &unk_26FF34C90;
  *(unsigned char *)(v7 + 24) = 0;
  *(unsigned char *)(v7 + 32) = 0;
  long long v9 = *(_OWORD *)a2;
  uint64_t v10 = v7;
  uint64_t v5 = *((void *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>(v3, (unsigned __int8 *)&v9, (uint64_t)&v9)+ 4);
  if (v10) {

  }
  return v5;
}

void re::DirectResourcesResolvedCommit::~DirectResourcesResolvedCommit(void **this)
{
  *this = &unk_26FF34D00;
  unint64_t v2 = this + 24;
  uint64_t v3 = this + 30;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  uint64_t v3 = this + 27;
  std::vector<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::__destroy_vector::operator()[abi:nn180100](&v3);
  uint64_t v3 = v2;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  uint64_t v3 = this + 21;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  uint64_t v3 = this + 18;
  std::vector<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::__destroy_vector::operator()[abi:nn180100](&v3);
  uint64_t v3 = this + 15;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  uint64_t v3 = this + 12;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  uint64_t v3 = this + 9;
  std::vector<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::__destroy_vector::operator()[abi:nn180100](&v3);
  uint64_t v3 = this + 6;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  re::XPCObject::~XPCObject(this + 5);
  re::XPCObject::~XPCObject(this + 4);
  ArcSharedObject::~ArcSharedObject((ArcSharedObject *)this);
}

{
  uint64_t vars8;

  re::DirectResourcesResolvedCommit::~DirectResourcesResolvedCommit(this);

  JUMPOUT(0x2533130A0);
}

uint64_t re::DirectResourcesResolvedCommit::apply(re::DirectResourcesResolvedCommit *this, re::DirectResourceContext *a2)
{
  kdebug_trace();
  re::ResolvedResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::apply((uint64_t)this + 48, a2);
  re::ResolvedResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::apply((uint64_t)this + 120, a2);
  re::ResolvedResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::apply((uint64_t)this + 192, a2);

  return kdebug_trace();
}

void re::ResolvedResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::apply(uint64_t a1, re::DirectResourceContext *this)
{
  unint64_t v4 = *(uint64_t **)a1;
  uint64_t v5 = *(uint64_t **)(a1 + 8);
  while (v4 != v5)
  {
    uint64_t v6 = *v4;
    uint64_t v15 = v6;
    if (v6) {
      id v7 = (id)(v6 + 8);
    }
    re::DirectResourceContext::addResource((uint64_t)this, &v15);
    if (v15) {

    }
    ++v4;
  }
  id v8 = *(uint64_t **)(a1 + 24);
  long long v9 = *(uint64_t **)(a1 + 32);
  while (v8 != v9)
  {
    uint64_t v11 = *v8;
    uint64_t v10 = v8[1];
    v8 += 2;
    (*(void (**)(uint64_t, uint64_t))(*(void *)v10 + 88))(v10, v11);
  }
  id v13 = *(re::DirectResource ***)(a1 + 48);
  uint64_t v12 = *(re::DirectResource ***)(a1 + 56);
  while (v13 != v12)
  {
    uint64_t v14 = *v13++;
    re::DirectResourceContext::removeResource(this, v14);
  }
}

re::DirectResourcesCommit *re::DirectResourcesCommit::DirectResourcesCommit(re::DirectResourcesCommit *this)
{
  ArcSharedObject::ArcSharedObject(this, 0);
  *unint64_t v2 = &unk_26FF34D38;
  *((void *)this + 2) = 0;
  *((void *)this + 3) = 0;
  re::DirectResourceEvent::DirectResourceEvent(v2 + 4);
  *(_OWORD *)((char *)this + 56) = 0u;
  *(_OWORD *)((char *)this + 40) = 0u;
  *((_DWORD *)this + 18) = 1065353216;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
  *((_DWORD *)this + 28) = 1065353216;
  *(_OWORD *)((char *)this + 120) = 0u;
  *(_OWORD *)((char *)this + 136) = 0u;
  *((_DWORD *)this + 38) = 1065353216;
  *((_OWORD *)this + 10) = 0u;
  *((_OWORD *)this + 11) = 0u;
  *((_DWORD *)this + 48) = 1065353216;
  *(_OWORD *)((char *)this + 200) = 0u;
  *(_OWORD *)((char *)this + 216) = 0u;
  *((_DWORD *)this + 58) = 1065353216;
  *((_OWORD *)this + 15) = 0u;
  *((_OWORD *)this + 16) = 0u;
  *((_DWORD *)this + 68) = 1065353216;
  *(_OWORD *)((char *)this + 280) = 0u;
  *(_OWORD *)((char *)this + 296) = 0u;
  *((_DWORD *)this + 78) = 1065353216;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_DWORD *)this + 88) = 1065353216;
  *(_OWORD *)((char *)this + 360) = 0u;
  *(_OWORD *)((char *)this + 376) = 0u;
  *((_DWORD *)this + 98) = 1065353216;
  *((_OWORD *)this + 25) = 0u;
  *((_OWORD *)this + 26) = 0u;
  *((_DWORD *)this + 108) = 1065353216;
  *(_OWORD *)((char *)this + 440) = 0u;
  *(_OWORD *)((char *)this + 456) = 0u;
  *((_DWORD *)this + 118) = 1065353216;
  *((_OWORD *)this + 30) = 0u;
  *((_OWORD *)this + 31) = 0u;
  *((_DWORD *)this + 128) = 1065353216;
  *(_OWORD *)((char *)this + 520) = 0u;
  *(_OWORD *)((char *)this + 536) = 0u;
  *((_DWORD *)this + 138) = 1065353216;
  *((_OWORD *)this + 35) = 0u;
  *((_OWORD *)this + 36) = 0u;
  *((_DWORD *)this + 148) = 1065353216;
  *(_OWORD *)((char *)this + 600) = 0u;
  *(_OWORD *)((char *)this + 616) = 0u;
  *((_DWORD *)this + 158) = 1065353216;
  return this;
}

void re::DirectResourcesCommit::~DirectResourcesCommit(void **this)
{
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::~DirectResourceChanges((uint64_t)(this + 65));
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::~DirectResourceChanges((uint64_t)(this + 50));
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::~DirectResourceChanges((uint64_t)(this + 35));
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::~DirectResourceChanges((uint64_t)(this + 20));
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::~DirectResourceChanges((uint64_t)(this + 5));
  re::XPCObject::~XPCObject(this + 4);
  re::XPCObject::~XPCObject(this + 3);

  ArcSharedObject::~ArcSharedObject((ArcSharedObject *)this);
}

{
  uint64_t vars8;

  re::DirectResourcesCommit::~DirectResourcesCommit(this);

  JUMPOUT(0x2533130A0);
}

BOOL re::DirectResourcesCommit::isCreatePending(re::DirectResourcesCommit *this, re::DirectResource *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  switch((*(unsigned int (**)(re::DirectResource *))(*(void *)a2 + 40))(a2))
  {
    case 1u:
      uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
      unint64_t v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>((void *)this + 5, dst);
      goto LABEL_7;
    case 2u:
      uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
      unint64_t v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>((void *)this + 20, dst);
      goto LABEL_7;
    case 3u:
      uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
      unint64_t v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>((void *)this + 35, dst);
      goto LABEL_7;
    case 4u:
      uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
      unint64_t v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>((void *)this + 50, dst);
LABEL_7:
      BOOL result = v4 != 0;
      break;
    default:
      BOOL result = 0;
      break;
  }
  return result;
}

std::string *re::DirectResourcesCommit::debugDescription@<X0>(re::DirectResourcesCommit *this@<X0>, std::string *a2@<X8>)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  a2->__r_.__value_.__r.__words[0] = 0;
  a2->__r_.__value_.__l.__size_ = 0;
  a2->__r_.__value_.__r.__words[2] = 0;
  snprintf(__str, 0x400uLL, "Commit %llu", *((void *)this + 2));
  return std::string::append(a2, __str);
}

uint64_t re::DirectResourcesPendingCommit::DirectResourcesPendingCommit(uint64_t a1, uint64_t a2)
{
  ArcSharedObject::ArcSharedObject((ArcSharedObject *)a1, 0);
  *(void *)uint64_t v4 = &unk_26FF34D70;
  *(_DWORD *)(v4 + 16) = 0;
  uint64_t v5 = (re::DirectResourcesCommit *)operator new(0x280uLL);
  *(void *)(a1 + 24) = re::DirectResourcesCommit::DirectResourcesCommit(v5);
  *(void *)(a1 + 32) = 0;
  if (a2) {
    uint64_t v6 = (void *)(a2 + 8);
  }
  else {
    uint64_t v6 = 0;
  }
  objc_initWeak((id *)(a1 + 40), v6);
  *(_DWORD *)(a1 + 48) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(void *)(a1 + 56) = 0;
  return a1;
}

void re::DirectResourcesPendingCommit::~DirectResourcesPendingCommit(id *this)
{
  uint64_t v4 = this + 7;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v4);
  objc_destroyWeak(this + 5);
  this[5] = 0;
  unint64_t v2 = (char *)this[4];
  if (v2)
  {

    this[4] = 0;
  }
  uint64_t v3 = (char *)this[3];
  if (v3)
  {

    this[3] = 0;
  }
  ArcSharedObject::~ArcSharedObject((ArcSharedObject *)this);
}

{
  uint64_t vars8;

  re::DirectResourcesPendingCommit::~DirectResourcesPendingCommit(this);

  JUMPOUT(0x2533130A0);
}

void re::DirectResourcesPendingCommit::setUserPayload(re::DirectResourcesPendingCommit *this, xpc_object_t *a2)
{
}

void re::DirectResourcesPendingCommit::addResource(uint64_t a1, const unsigned __int8 *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  switch((*(unsigned int (**)(const unsigned __int8 *))(*(void *)a2 + 40))(a2))
  {
    case 1u:
      uint64_t v4 = (uint64_t *)(*(void *)(a1 + 24) + 40);
      uuid_copy(dst, a2 + 16);
      uint64_t v16 = a2;
      uint64_t v5 = (id)(a2 + 8);
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create(v4, dst, (uint64_t *)&v16);
      uint64_t v6 = (uint64_t)v16;
      if (v16) {
        goto LABEL_9;
      }
      break;
    case 2u:
      uint64_t v7 = (uint64_t *)(*(void *)(a1 + 24) + 160);
      uuid_copy(dst, a2 + 16);
      uint64_t v15 = a2;
      id v8 = (id)(a2 + 8);
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create(v7, dst, (uint64_t *)&v15);
      uint64_t v6 = (uint64_t)v15;
      if (v15) {
        goto LABEL_9;
      }
      break;
    case 3u:
      long long v9 = (uint64_t *)(*(void *)(a1 + 24) + 280);
      uuid_copy(dst, a2 + 16);
      uint64_t v14 = a2;
      uint64_t v10 = (id)(a2 + 8);
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create(v9, dst, (uint64_t *)&v14);
      uint64_t v6 = (uint64_t)v14;
      if (v14) {
        goto LABEL_9;
      }
      break;
    case 4u:
      uint64_t v11 = (uint64_t *)(*(void *)(a1 + 24) + 400);
      uuid_copy(dst, a2 + 16);
      id v13 = a2;
      uint64_t v12 = (id)(a2 + 8);
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create(v11, dst, (uint64_t *)&v13);
      uint64_t v6 = (uint64_t)v13;
      if (v13) {
LABEL_9:
      }

      break;
    default:
      return;
  }
}

void re::DirectResourcesPendingCommit::destroyResource(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  v13[2] = *MEMORY[0x263EF8340];
  v13[0] = a3;
  v13[1] = a4;
  switch(a2)
  {
    case 1:
      uint64_t v4 = (void *)(*(void *)(a1 + 24) + 40);
      uint64_t v12 = 0;
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy(v4, (unsigned __int8 *)v13, &v12);
      uint64_t v5 = v12;
      if (v12) {
        goto LABEL_7;
      }
      break;
    case 2:
      uint64_t v6 = (void *)(*(void *)(a1 + 24) + 160);
      uint64_t v11 = 0;
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy(v6, (unsigned __int8 *)v13, &v11);
      uint64_t v5 = v11;
      if (v11) {
        goto LABEL_7;
      }
      break;
    case 3:
      uint64_t v7 = (void *)(*(void *)(a1 + 24) + 280);
      uint64_t v10 = 0;
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy(v7, (unsigned __int8 *)v13, &v10);
      uint64_t v5 = v10;
      if (v10) {
        goto LABEL_7;
      }
      break;
    case 4:
      id v8 = (void *)(*(void *)(a1 + 24) + 400);
      uint64_t v9 = 0;
      re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy(v8, (unsigned __int8 *)v13, &v9);
      uint64_t v5 = v9;
      if (v9) {
LABEL_7:
      }

      break;
    default:
      return;
  }
}

void re::DirectResourcesPendingCommit::addPayload(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = (uint64_t *)(*(void *)(a1 + 24) + 520);
  uuid_copy(dst, (const unsigned __int8 *)(a2 + 16));
  uint64_t v5 = a2;
  if (a2) {
    id v4 = (id)(a2 + 8);
  }
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::create(v3, dst, &v5);
  if (v5) {
}
  }

void re::DirectResourcesPendingCommit::updatePayload(uint64_t a1, uint64_t a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = (void *)(*(void *)(a1 + 24) + 520);
  uuid_copy(dst, (const unsigned __int8 *)(a2 + 16));
  uint64_t v5 = a2;
  if (a2) {
    id v4 = (id)(a2 + 8);
  }
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::setUpdate(v3, dst, &v5);
  if (v5) {
}
  }

void re::DirectResourcesPendingCommit::removePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void v5[2] = *MEMORY[0x263EF8340];
  v5[0] = a2;
  v5[1] = a3;
  uint64_t v3 = (void *)(*(void *)(a1 + 24) + 520);
  uint64_t v4 = 0;
  re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::destroy(v3, (unsigned __int8 *)v5, &v4);
  if (v4) {
}
  }

uint64_t re::DirectResourcesPendingCommit::ensureUpdate(re::DirectResourcesPendingCommit *this, re::DirectResource *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (*((void *)a2 + 4)) {
    re::DirectResourcesPendingCommit::ensureUpdate();
  }
  int v4 = (*(uint64_t (**)(re::DirectResource *))(*(void *)a2 + 40))(a2);
  switch(v4)
  {
    case 3:
      uint64_t v8 = *((void *)this + 3) + 280;
      uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
      return re::DirectResourceChanges<re::DirectBuffer,re::DirectBufferUpdate>::ensureUpdate(v8, dst);
    case 2:
      uint64_t v7 = *((void *)this + 3) + 160;
      uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
      return re::DirectResourceChanges<re::DirectTexture,re::DirectTextureUpdate>::ensureUpdate(v7, dst);
    case 1:
      uint64_t v5 = *((void *)this + 3) + 40;
      uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
      return re::DirectResourceChanges<re::DirectMesh,re::DirectMeshUpdate>::ensureUpdate(v5, dst);
    default:
      return 0;
  }
}

void re::DirectResourcesPendingCommit::addCommandBuffer(uint64_t a1, void *a2)
{
  if ((re::DirectResourcesPendingCommit::isPending(a1, (uint64_t)a2) & 1) == 0)
  {
    int v4 = operator new(0x50uLL);
    uint64_t v5 = re::DirectFence::DirectFence(v4, a2);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 1174405120;
    v8[2] = ___ZN2re28DirectResourcesPendingCommit16addCommandBufferEPN3MTL13CommandBufferE_block_invoke;
    v8[3] = &__block_descriptor_tmp_0;
    uint64_t v9 = v5;
    uint64_t v6 = (void *)(v5 + 8);
    id v7 = (id)(v5 + 8);
    objc_msgSend(a2, sel_addCompletedHandler_, v8);
    re::DirectResourcesPendingCommit::addFence(a1, (uint64_t)v4);
    if (v9)
    {

      uint64_t v9 = 0;
    }
  }
}

uint64_t re::DirectResourcesPendingCommit::isPending(uint64_t a1, uint64_t a2)
{
  int v4 = (os_unfair_lock_s *)(a1 + 48);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  for (uint64_t i = *(void *)(a1 + 56); ; i += 8)
  {
    if (i == *(void *)(a1 + 64))
    {
      uint64_t v6 = 0;
      goto LABEL_8;
    }
    if (*(_DWORD *)(*(void *)i + 16) == 1 && *(void *)(*(void *)i + 24) == a2) {
      break;
    }
  }
  uint64_t v6 = 1;
LABEL_8:
  os_unfair_lock_unlock(v4);
  return v6;
}

uint64_t ___ZN2re28DirectResourcesPendingCommit16addCommandBufferEPN3MTL13CommandBufferE_block_invoke(uint64_t a1)
{
  return re::DirectFence::invalidate(*(void *)(a1 + 32));
}

void *__copy_helper_block_8_32c38_ZTSN2re9SharedPtrINS_11DirectFenceEEE(void *result, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 32);
  result[4] = v2;
  if (v2) {
    return (id)(v2 + 8);
  }
  return result;
}

void __destroy_helper_block_8_32c38_ZTSN2re9SharedPtrINS_11DirectFenceEEE(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (v1)
  {

    *(void *)(a1 + 32) = 0;
  }
}

void re::DirectResourcesPendingCommit::addFence(uint64_t a1, uint64_t a2)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  kdebug_trace();
  id v4 = (id)(a1 + 8);
  id v5 = (id)(a1 + 8);
  unint64_t v21 = &unk_26FF34FD8;
  *(void *)&long long v22 = a1;
  long long v23 = &v21;
  re::DirectFence::addInvalidateHandler(a2, (uint64_t)&v21);
  std::__function::__value_func<void ()(re::DirectFence *)>::~__value_func[abi:nn180100](&v21);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  if (a2) {
    id v6 = (id)(a2 + 8);
  }
  unint64_t v7 = *(void *)(a1 + 72);
  uint64_t v8 = *(uint64_t **)(a1 + 64);
  if ((unint64_t)v8 >= v7)
  {
    uint64_t v10 = *(void **)(a1 + 56);
    uint64_t v11 = v8 - v10;
    unint64_t v12 = v11 + 1;
    if ((unint64_t)(v11 + 1) >> 61) {
      abort();
    }
    uint64_t v13 = v7 - (void)v10;
    if (v13 >> 2 > v12) {
      unint64_t v12 = v13 >> 2;
    }
    if ((unint64_t)v13 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v14 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v14 = v12;
    }
    uint64_t v24 = a1 + 72;
    if (v14)
    {
      uint64_t v15 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(a1 + 72, v14);
      uint64_t v10 = *(void **)(a1 + 56);
      uint64_t v8 = *(uint64_t **)(a1 + 64);
    }
    else
    {
      uint64_t v15 = 0;
    }
    uint64_t v16 = (uint64_t *)&v15[8 * v11];
    id v17 = (void **)&v15[8 * v14];
    long long v23 = v17;
    uint64_t *v16 = a2;
    *((void *)&v22 + 1) = v16 + 1;
    if (v8 == v10)
    {
      uint64_t v9 = v16 + 1;
    }
    else
    {
      do
      {
        uint64_t v18 = *--v8;
        *--uint64_t v16 = v18;
        uint64_t *v8 = 0;
      }
      while (v8 != v10);
      uint64_t v9 = (void *)*((void *)&v22 + 1);
      id v17 = v23;
    }
    long long v19 = *(_OWORD *)(a1 + 56);
    *(void *)(a1 + 56) = v16;
    *(void *)(a1 + 64) = v9;
    long long v22 = v19;
    __int16 v20 = *(void ***)(a1 + 72);
    *(void *)(a1 + 72) = v17;
    long long v23 = v20;
    unint64_t v21 = (void *)v19;
    std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)&v21);
  }
  else
  {
    uint64_t *v8 = a2;
    uint64_t v9 = v8 + 1;
  }
  *(void *)(a1 + 64) = v9;
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
}

void re::DirectResourcesPendingCommit::forEachFence(uint64_t a1, uint64_t a2)
{
  id v4 = (os_unfair_lock_s *)(a1 + 48);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 48));
  id v6 = *(uint64_t **)(a1 + 56);
  id v5 = *(uint64_t **)(a1 + 64);
  while (v6 != v5)
  {
    uint64_t v7 = *v6++;
    std::function<void ()(re::DirectFence *)>::operator()(a2, v7);
  }

  os_unfair_lock_unlock(v4);
}

void re::DirectResourcesPendingCommit::fenceCompleted_threadSafe(re::DirectResourcesPendingCommit *this, re::DirectFence *a2)
{
  id v4 = (os_unfair_lock_s *)((char *)this + 48);
  os_unfair_lock_lock((os_unfair_lock_t)this + 12);
  id v5 = (re::DirectFence **)*((void *)this + 7);
  id v6 = (re::DirectFence **)*((void *)this + 8);
  if (v5 != v6)
  {
    while (*v5 != a2)
    {
      if (++v5 == v6)
      {
        id v5 = (re::DirectFence **)*((void *)this + 8);
        break;
      }
    }
  }
  if (v5 == v6)
  {
    os_unfair_lock_unlock(v4);
  }
  else
  {
    uint64_t v7 = v5 + 1;
    if (v5 + 1 != v6)
    {
      uint64_t v8 = *v5;
      do
      {
        *(v7 - 1) = *v7;
        *v7++ = v8;
        ++v5;
      }
      while (v7 != v6);
      id v6 = (re::DirectFence **)*((void *)this + 8);
    }
    if (v6 != v5)
    {
      uint64_t v9 = v6;
      do
      {
        uint64_t v11 = (uint64_t)*--v9;
        uint64_t v10 = v11;
        if (v11)
        {

          *(v6 - 1) = 0;
        }
        id v6 = v9;
      }
      while (v9 != v5);
    }
    *((void *)this + 8) = v5;
    unint64_t v12 = (re::DirectFence **)*((void *)this + 7);
    os_unfair_lock_unlock(v4);
    if (v12 == v5)
    {
      WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)this + 5);
      if (WeakRetained)
      {
        unint64_t v14 = WeakRetained;
        uint64_t v15 = WeakRetained - 2;
        uint64_t v16 = WeakRetained + 16;
        os_unfair_lock_lock(WeakRetained + 16);
        re::DirectResourceContext::sendIfReady(v15);
        os_unfair_lock_unlock(v16);
      }
    }
  }
}

void re::DirectResourcesPendingCommit::scheduled(re::DirectResourcesPendingCommit *this)
{
  if (*((_DWORD *)this + 4)) {
    re::DirectResourcesPendingCommit::scheduled();
  }
  *((_DWORD *)this + 4) = 1;
  re::makeCommands(*((re **)this + 3), &v4);
  uint64_t v2 = (uint64_t *)*((void *)this + 4);
  *((void *)this + 4) = v4;
  id v4 = v2;
  if (v2) {

  }
  uint64_t v3 = *((void *)this + 3);
  if (v3)
  {

    *((void *)this + 3) = 0;
  }
}

ArcSharedObject *re::DirectResourceCommitSignaling::DirectResourceCommitSignaling(ArcSharedObject *a1, uint64_t a2, void *a3)
{
  ArcSharedObject::ArcSharedObject(a1, 0);
  *id v6 = &unk_26FF34DD8;
  void v6[3] = 0;
  uint64_t v7 = (void **)(v6 + 3);
  v6[2] = 0;
  uint64_t v8 = (void **)(v6 + 2);
  id location = objc_msgSend(a3, sel_newSharedEvent);
  NS::SharedPtr<MTL::Buffer>::operator=(v8, &location);
  if (location) {

  }
  id location = objc_msgSend(objc_msgSend(MEMORY[0x263F12A00], sel_alloc), sel_init);
  NS::SharedPtr<MTL::Buffer>::operator=(v7, &location);
  if (location) {

  }
  if (a2) {
    uint64_t v9 = (void *)(a2 + 8);
  }
  else {
    uint64_t v9 = 0;
  }
  objc_initWeak(&location, v9);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 1174405120;
  v11[2] = ___ZN2re29DirectResourceCommitSignalingC2ENS_10UnownedPtrINS_21DirectResourceContextEEEPN3MTL6DeviceE_block_invoke;
  v11[3] = &__block_descriptor_tmp_7_0;
  id v12 = 0;
  objc_copyWeak(&v12, &location);
  *((void *)a1 + 4) = _Block_copy(v11);
  objc_destroyWeak(&v12);
  id v12 = 0;
  objc_destroyWeak(&location);
  return a1;
}

void ___ZN2re29DirectResourceCommitSignalingC2ENS_10UnownedPtrINS_21DirectResourceContextEEEPN3MTL6DeviceE_block_invoke(uint64_t a1, uint64_t a2, unint64_t a3)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    re::DirectResourceContext::freeListReady((re::DirectResourceContext *)(WeakRetained - 8), a3);
  }
}

void re::DirectResourceContext::freeListReady(re::DirectResourceContext *this, unint64_t a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = (os_unfair_lock_s *)((char *)this + 208);
  os_unfair_lock_lock((os_unfair_lock_t)this + 52);
  for (uint64_t i = (uint64_t *)*((void *)this + 27); i != *((uint64_t **)this + 28); uint64_t i = (uint64_t *)*((void *)this + 27))
  {
    uint64_t v6 = *i;
    if (*(void *)(*i + 16) > a2) {
      break;
    }
    id v7 = (id)(v6 + 8);
    uint64_t v9 = (uint64_t *)*((void *)this + 27);
    uint64_t v8 = (uint64_t *)*((void *)this + 28);
    uint64_t v10 = v9 + 1;
    if (v9 + 1 != v8)
    {
      uint64_t v11 = *v9;
      do
      {
        *(v10 - 1) = *v10;
        *v10++ = v11;
        ++v9;
      }
      while (v10 != v8);
      uint64_t v10 = (uint64_t *)*((void *)this + 28);
    }
    if (v10 != v9)
    {
      id v12 = v10;
      do
      {
        uint64_t v14 = *--v12;
        uint64_t v13 = v14;
        if (v14)
        {

          *(v10 - 1) = 0;
        }
        uint64_t v10 = v12;
      }
      while (v12 != v9);
    }
    *((void *)this + 28) = v9;
    kdebug_trace();
    re::DirectResourcesReusePool::mergeFrom(*((void *)this + 30), v6);
  }
  atomic_store(a2, (unint64_t *)this + 31);
  __ulock_wake();
  unint64_t v15 = *((void *)this + 6);
  BOOL v16 = a2 > v15;
  unint64_t v17 = a2 - v15;
  if (v16)
  {
    long long v29 = 0uLL;
    uint64_t v30 = 0;
    re::DirectResourcesReusePool::purgeBefore(*((void **)this + 30), v17, (char **)v27);
    std::vector<re::DirectResourcesReuseList::Entry>::__vdeallocate((uint64_t *)&v29);
    long long v29 = *(_OWORD *)v27;
    uint64_t v30 = v28;
    *(void *)uuid_t dst = v27;
    v27[1] = 0;
    uint64_t v28 = 0;
    v27[0] = 0;
    std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100]((void ***)dst);
    if ((void)v29 != *((void *)&v29 + 1))
    {
      kdebug_trace();
      v27[0] = 0;
      v27[1] = 0;
      uint64_t v28 = 0;
      std::vector<re::DirectResourceId>::resize(v27, 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)&v29 + 1) - v29) >> 3));
      uint64_t v18 = v29;
      if (*((void *)&v29 + 1) != (void)v29)
      {
        uint64_t v19 = 0;
        unint64_t v20 = 0;
        uint64_t v21 = 48;
        do
        {
          uuid_copy(dst, (const unsigned __int8 *)(*(void *)(v18 + v21) + 16));
          *(_OWORD *)((char *)v27[0] + v19) = *(_OWORD *)dst;
          ++v20;
          uint64_t v18 = v29;
          v19 += 16;
          v21 += 56;
        }
        while (v20 < 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((void *)&v29 + 1) - v29) >> 3));
      }
      *(_OWORD *)__p = *(_OWORD *)v27;
      uint64_t v26 = v28;
      v27[1] = 0;
      uint64_t v28 = 0;
      v27[0] = 0;
      re::DirectResourceContext::destroyPayloads_anyThread(this, (uint64_t *)__p);
      if (__p[0])
      {
        __p[1] = __p[0];
        operator delete(__p[0]);
      }
      uint64_t v23 = *((void *)&v29 + 1);
      uint64_t v22 = v29;
      while (v23 != v22)
      {
        uint64_t v24 = *(void *)(v23 - 8);
        if (v24)
        {

          *(void *)(v23 - 8) = 0;
        }
        v23 -= 56;
      }
      *((void *)&v29 + 1) = v22;
      if (v27[0])
      {
        v27[1] = v27[0];
        operator delete(v27[0]);
      }
      kdebug_trace();
    }
    v27[0] = &v29;
    std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100]((void ***)v27);
  }
  os_unfair_lock_unlock(v4);
}

void __copy_helper_block_8_32c50_ZTSN2re10ArcWeakPtrINS_21DirectResourceContextEEE(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = 0;
  objc_copyWeak((id *)(a1 + 32), (id *)(a2 + 32));
}

void __destroy_helper_block_8_32c50_ZTSN2re10ArcWeakPtrINS_21DirectResourceContextEEE(uint64_t a1)
{
  *(void *)(a1 + 32) = 0;
}

void re::DirectResourceCommitSignaling::~DirectResourceCommitSignaling(re::DirectResourceCommitSignaling *this)
{
  uint64_t v2 = (void *)*((void *)this + 3);
  if (v2)
  {

    *((void *)this + 3) = 0;
  }
  uint64_t v3 = (void *)*((void *)this + 2);
  if (v3)
  {

    *((void *)this + 2) = 0;
  }

  ArcSharedObject::~ArcSharedObject(this);
}

{
  uint64_t vars8;

  re::DirectResourceCommitSignaling::~DirectResourceCommitSignaling(this);

  JUMPOUT(0x2533130A0);
}

void re::DirectResourceContext::recreatePayloadIfNecessary(re::DirectResourceContext *a1, re::DirectResource *a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6)
{
  id v12 = (re::DirectResourcesCommit **)re::DirectResourceContext::ensureUncommitted(a1);
  if (!re::DirectResourcesCommit::isCreatePending(v12[3], a2))
  {
    uint64_t v13 = re::DirectResourcesPendingCommit::ensureUpdate((re::DirectResourcesPendingCommit *)v12, a2);
    if (!(*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)v13 + 40))(v13, a3, a4))
    {
      uint64_t v14 = (*(uint64_t (**)(re::DirectResource *, uint64_t, uint64_t))(*(void *)a2 + 48))(a2, a3, a4);
      uint64_t v15 = v14;
      if (v14) {
        id v16 = (id)(v14 + 8);
      }
      int v17 = *(_DWORD *)(v15 + 36);
      if ((v17 & 8) != 0)
      {
        if ((v17 & 6) != 4)
        {
LABEL_8:
          re::DirectResourceContext::createPayload((uint64_t)a1, (unsigned __int8 *)a2, a3, a4, (uint64_t *)&v25);
          if (!a5)
          {
            id v18 = re::DirectMemoryResource::bytes(v25);
            id v19 = re::DirectMemoryResource::bytes((re::DirectMemoryResource *)v15);
            if (*(void *)(v15 + 40) >= *((void *)v25 + 5)) {
              size_t v20 = *((void *)v25 + 5);
            }
            else {
              size_t v20 = *(void *)(v15 + 40);
            }
            memcpy(v18, v19, v20);
          }
          uint64_t v24 = v25;
          if (v25) {
            uint64_t v21 = (char *)v25 + 8;
          }
          (*(void (**)(re::DirectResource *, uint64_t, uint64_t, re::DirectMemoryResource **))(*(void *)a2 + 56))(a2, a3, a4, &v24);
          if (v24)
          {

            uint64_t v24 = 0;
          }
          if (v25) {

          }
LABEL_24:
          return;
        }
      }
      else if (!a6 && (v17 & 2) != 0)
      {
        goto LABEL_8;
      }
      uint64_t v23 = v15;
      id v22 = (id)(v15 + 8);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(void *)v13 + 48))(v13, a3, a4, &v23);
      if (v23)
      {

        uint64_t v23 = 0;
      }
      if (re::isPrivateToThisProcess(*(_DWORD *)(v15 + 32))) {
        re::DirectResourcesPendingCommit::updatePayload((uint64_t)v12, v15);
      }
      goto LABEL_24;
    }
  }
}

uint64_t re::DirectResourceContext::ensureUncommitted(re::DirectResourceContext *this)
{
  uint64_t result = *((void *)this + 21);
  if (!result)
  {
    kdebug_trace();
    uint64_t v3 = operator new(0x50uLL);
    uint64_t result = re::DirectResourcesPendingCommit::DirectResourcesPendingCommit((uint64_t)v3, (uint64_t)this);
    uint64_t v4 = *((void *)this + 21);
    *((void *)this + 21) = result;
    if (v4)
    {

      uint64_t result = *((void *)this + 21);
    }
    uint64_t v6 = *((void *)this + 19);
    uint64_t v5 = *((void *)this + 20);
    *((void *)this + 20) = v5 + 1;
    *(void *)(*(void *)(result + 24) + 16) = v5;
    if (v6)
    {
      if (*(_DWORD *)(result + 16)) {
        uint64_t v5 = *(void *)(*(void *)(result + 32) + 16);
      }
      std::function<void ()(re::DirectResourceContext *,unsigned long long)>::operator()((uint64_t)this + 128, (uint64_t)this, v5);
      return *((void *)this + 21);
    }
  }
  return result;
}

void re::DirectResourceContext::createPayload(uint64_t a1@<X0>, unsigned __int8 *a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  uuid_copy(dst, a2 + 16);
  int v10 = (*(uint64_t (**)(unsigned __int8 *))(*(void *)a2 + 40))(a2);
  re::DirectResourceContext::reusePayload(a1, *(uint64_t *)dst, *(uint64_t *)&dst[8], v10, a3, a4, a5);
  if (!*a5)
  {
    if (*(void *)(a1 + 40) != 3) {
      goto LABEL_8;
    }
    unint64_t v11 = *(void *)(a1 + 56);
    if (!v11) {
      goto LABEL_8;
    }
    unint64_t v12 = *(void *)(a1 + 160) - 1;
    if (v12 <= v11) {
      goto LABEL_8;
    }
    re::DirectResourceContext::freeListWait((unint64_t *)a1, v12 - v11);
    uuid_copy(v19, a2 + 16);
    int v13 = (*(uint64_t (**)(unsigned __int8 *))(*(void *)a2 + 40))(a2);
    re::DirectResourceContext::reusePayload(a1, *(uint64_t *)v19, *(uint64_t *)&v19[8], v13, a3, a4, &v18);
    uint64_t v14 = *a5;
    uint64_t v15 = v18;
    *a5 = v18;
    uint64_t v18 = v14;
    if (v14)
    {

      uint64_t v15 = *a5;
    }
    if (!v15)
    {
LABEL_8:
      (*(void (**)(uint64_t *__return_ptr, unsigned __int8 *, uint64_t, uint64_t, void))(*(void *)a2 + 88))(&v18, a2, a3, a4, *(void *)(a1 + 64));
      uint64_t v16 = *a5;
      uint64_t v17 = v18;
      *a5 = v18;
      uint64_t v18 = v16;
      if (v16)
      {

        uint64_t v17 = *a5;
      }
      if (v17) {
        re::DirectResourceContext::addPayload((dispatch_queue_t *)a1, a2, a5);
      }
    }
  }
}

uint64_t std::function<void ()(re::DirectResourceContext *,unsigned long long)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a3;
  uint64_t v7 = a2;
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3) {
    return (*(uint64_t (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v3 + 48))(v3, &v7, &v6);
  }
  uint64_t v5 = (re::DirectResourceContext *)std::__throw_bad_function_call[abi:nn180100]();
  return re::DirectResourceContext::ensureUncommittedFreeList(v5);
}

void re::DirectResourceContext::ensureUncommittedFreeList(re::DirectResourceContext *this)
{
  if (!*((void *)this + 22))
  {
    uint64_t v2 = re::DirectResourceContext::ensureUncommitted(this);
    if (*(_DWORD *)(v2 + 16)) {
      uint64_t v3 = *(void *)(v2 + 32);
    }
    else {
      uint64_t v3 = *(void *)(v2 + 24);
    }
    uint64_t v4 = *(void *)(v3 + 16);
    uint64_t v5 = (re::DirectResourcesReuseList *)operator new(0x38uLL);
    re::DirectResourcesReuseList::DirectResourcesReuseList(v5, v4);
    uint64_t v6 = *((void *)this + 22);
    *((void *)this + 22) = v7;
    if (v6) {
  }
    }
}

void re::DirectResourceContext::sendIfReady(const os_unfair_lock *this)
{
  os_unfair_lock_assert_owner(this + 18);
  for (uint64_t i = *(os_unfair_lock_s ***)&this[46]._os_unfair_lock_opaque;
        i != *(os_unfair_lock_s ***)&this[48]._os_unfair_lock_opaque;
        uint64_t i = *(os_unfair_lock_s ***)&this[46]._os_unfair_lock_opaque)
  {
    uint64_t v3 = *i;
    uint64_t v4 = *i + 12;
    os_unfair_lock_lock(v4);
    uint64_t v6 = *(void *)&v3[14]._os_unfair_lock_opaque;
    uint64_t v5 = *(void *)&v3[16]._os_unfair_lock_opaque;
    os_unfair_lock_unlock(v4);
    if (v6 != v5) {
      break;
    }
    kdebug_trace();
    uint64_t v7 = *(uint64_t **)&this[46]._os_unfair_lock_opaque;
    uint64_t v8 = *v7;
    if (*v7)
    {
      id v9 = (id)(v8 + 8);
      uint64_t v7 = *(uint64_t **)&this[46]._os_unfair_lock_opaque;
    }
    int v10 = v7 + 1;
    unint64_t v11 = *(uint64_t **)&this[48]._os_unfair_lock_opaque;
    if (v7 + 1 != v11)
    {
      uint64_t v12 = *v7;
      do
      {
        *(v10 - 1) = *v10;
        *v10++ = v12;
        ++v7;
      }
      while (v10 != v11);
      int v10 = *(uint64_t **)&this[48]._os_unfair_lock_opaque;
    }
    if (v10 != v7)
    {
      int v13 = v10;
      do
      {
        uint64_t v15 = *--v13;
        uint64_t v14 = v15;
        if (v15)
        {

          *(v10 - 1) = 0;
        }
        int v10 = v13;
      }
      while (v13 != v7);
    }
    *(void *)&this[48]._os_unfair_lock_opaque = v7;
    kdebug_trace();
    if (*(_DWORD *)(v8 + 16) != 1) {
      re::DirectResourceContext::sendIfReady();
    }
    *(_DWORD *)(v8 + 16) = 2;
    uint64_t v16 = *(void *)&this[20]._os_unfair_lock_opaque;
    if (v16)
    {
      uint64_t v17 = *(void *)(v8 + 32);
      re::DirectResourceEvent::operator=((xpc_object_t *)(v17 + 32), *(id *)(v16 + 16));
      objc_msgSend(*(id *)(v16 + 16), sel_notifyListener_atValue_block_, *(void *)(v16 + 24), *(void *)(v17 + 16), *(void *)(v16 + 32));
    }
    if (*(void *)&this[30]._os_unfair_lock_opaque) {
      std::function<void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::operator()((uint64_t)&this[24], (uint64_t)this, *(void *)(v8 + 32));
    }
    kdebug_trace();
    kdebug_trace();
  }
}

void std::function<void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a3;
  uint64_t v7 = a2;
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t *, uint64_t *))(*(void *)v3 + 48))(v3, &v7, &v6);
  }
  else
  {
    uint64_t v4 = (void *)std::__throw_bad_function_call[abi:nn180100]();
    std::vector<re::DirectResourceId>::resize(v4, v5);
  }
}

void std::vector<re::DirectResourceId>::resize(void *a1, unint64_t a2)
{
  unint64_t v2 = (uint64_t)(a1[1] - *a1) >> 4;
  if (a2 <= v2)
  {
    if (a2 < v2) {
      a1[1] = *a1 + 16 * a2;
    }
  }
  else
  {
    std::vector<re::DirectResourceId>::__append(a1, a2 - v2);
  }
}

void re::DirectResourceContext::destroyPayloads_anyThread(void *a1, uint64_t *a2)
{
  if (dispatch_get_specific(a1))
  {
    uint64_t v5 = *a2;
    uint64_t v4 = a2[1];
    while (v5 != v4)
    {
      re::DirectResourceContext::removePayload((uint64_t)a1, v5);
      v5 += 16;
    }
  }
  else
  {
    if (a1) {
      uint64_t v6 = a1 + 1;
    }
    else {
      uint64_t v6 = 0;
    }
    objc_initWeak(&location, v6);
    uint64_t v7 = a1[3];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN2re21DirectResourceContext25destroyPayloads_anyThreadENSt3__16vectorINS_16DirectResourceIdENS1_9allocatorIS3_EEEE_block_invoke;
    block[3] = &__block_descriptor_tmp_12;
    id v9 = 0;
    objc_copyWeak(&v9, &location);
    std::vector<re::DirectResourceId>::vector(__p, (uint64_t)a2);
    dispatch_async(v7, block);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    objc_destroyWeak(&v9);
    id v9 = 0;
    objc_destroyWeak(&location);
  }
}

unint64_t *re::DirectResourceContext::freeListWait(unint64_t *this, unint64_t a2)
{
  unint64_t v2 = this + 31;
  unint64_t v3 = atomic_load(this + 31);
  if (v3 < a2)
  {
    uint64_t v5 = (re::DirectResourceContext *)this;
    kdebug_trace();
    if (!__REALITYKIT_WAITING_ON_RENDERER__(v2, a2))
    {
      re::DirectResourceContext::freeListWaitTimedOut(v5, a2);
      __REALITYKIT_WAITING_ON_RENDERER__(v2, a2);
    }
    return (unint64_t *)kdebug_trace();
  }
  return this;
}

void re::DirectResourceContext::freeListWaitTimedOut(re::DirectResourceContext *this, unint64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  lock = (os_unfair_lock_s *)((char *)this + 72);
  os_unfair_lock_lock((os_unfair_lock_t)this + 18);
  uint64_t v5 = re::directResourceLog(v4);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v6) {
    re::DirectResourceContext::freeListWaitTimedOut(v5);
  }
  uint64_t v7 = re::directResourceLog((re *)v6);
  uint64_t v8 = (re *)os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    unint64_t v9 = atomic_load((unint64_t *)this + 31);
    *(_DWORD *)buf = 134218240;
    *(void *)&uint8_t buf[4] = v9;
    __int16 v20 = 2048;
    unint64_t v21 = a2;
    _os_log_impl(&dword_24CD28000, v7, OS_LOG_TYPE_DEFAULT, "Renderer is at commit %llu, waiting for commit %llu", buf, 0x16u);
  }
  int v10 = (uint64_t *)*((void *)this + 23);
  for (uint64_t i = (uint64_t *)*((void *)this + 24); v10 != i; ++v10)
  {
    uint64_t v12 = *v10;
    int v13 = *(void **)(*v10 + 32);
    if (v13) {
      unint64_t v14 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v13[33] - v13[32]) >> 3) + ((uint64_t)(v13[36] - v13[35]) >> 4);
    }
    else {
      unint64_t v14 = 0;
    }
    uint64_t v15 = re::directResourceLog(v8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_DWORD *)(v12 + 16)) {
        uint64_t v16 = *(void *)(v12 + 32);
      }
      else {
        uint64_t v16 = *(void *)(v12 + 24);
      }
      uint64_t v17 = *(void *)(v16 + 16);
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v17;
      __int16 v20 = 2048;
      unint64_t v21 = v14;
      _os_log_impl(&dword_24CD28000, v15, OS_LOG_TYPE_DEFAULT, "\tCommit %llu pending with %zu payloads", buf, 0x16u);
    }
    *(void *)buf = &unk_26FF35020;
    id v22 = buf;
    re::DirectResourcesPendingCommit::forEachFence(v12, (uint64_t)buf);
    uint64_t v8 = (re *)std::__function::__value_func<void ()(re::DirectFence *)>::~__value_func[abi:nn180100](buf);
  }
  os_unfair_lock_unlock(lock);
}

void re::DirectResourceContext::DirectResourceContext(uint64_t a1, long long *a2)
{
  ArcSharedObject::ArcSharedObject((ArcSharedObject *)a1, 0);
  *(void *)uint64_t v4 = &unk_26FF34E40;
  *(void *)(v4 + 16) = &unk_26FF34EC0;
  long long v5 = *a2;
  long long v6 = a2[1];
  *(void *)(v4 + 56) = *((void *)a2 + 4);
  *(_OWORD *)(v4 + 40) = v6;
  *(_OWORD *)(v4 + 24) = v5;
  *(void *)(a1 + 64) = *((id *)a2 + 5);
  *(_DWORD *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 76) = 1;
  *(void *)(a1 + 120) = 0;
  *(void *)(a1 + 80) = 0;
  *(void *)(a1 + 88) = 0;
  *(void *)(a1 + 152) = 0;
  *(void *)(a1 + 160) = 1;
  *(void *)(a1 + 224) = 0;
  *(void *)(a1 + 232) = 0;
  *(void *)(a1 + 216) = 0;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 196) = 0u;
  operator new();
}

void re::DirectResourceContext::~DirectResourceContext(re::DirectResourceContext *this)
{
  unint64_t v2 = (char *)this + 256;
  for (uint64_t i = (id *)*((void *)this + 34); i; uint64_t i = (id *)*i)
  {
    id WeakRetained = objc_loadWeakRetained(i + 4);
    if (WeakRetained)
    {
      long long v5 = WeakRetained;
      re::DirectResource::setDelegate((uint64_t)WeakRetained - 8, 0);
    }
  }
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::clear((uint64_t)v2);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear((uint64_t)this + 296);
  long long v6 = (re::DirectResourcesReusePool *)*((void *)this + 30);
  if (v6)
  {
    re::DirectResourcesReusePool::~DirectResourcesReusePool(v6);
    MEMORY[0x2533130A0]();
  }
  *((void *)this + 30) = 0;
  uint64_t v7 = (const void *)*((void *)this + 11);
  if (v7)
  {
    _Block_release(v7);
    *((void *)this + 11) = 0;
  }
  dispatch_queue_set_specific(*((dispatch_queue_t *)this + 3), this, 0, 0);
  dispatch_release(*((dispatch_object_t *)this + 3));
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table((uint64_t)this + 296);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::~__hash_table((uint64_t)v2);
  __ulock_wake();
  uint64_t v12 = (void **)((char *)this + 216);
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v12);
  uint64_t v12 = (void **)((char *)this + 184);
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v12);
  uint64_t v8 = *((void *)this + 22);
  if (v8)
  {

    *((void *)this + 22) = 0;
  }
  uint64_t v9 = *((void *)this + 21);
  if (v9)
  {

    *((void *)this + 21) = 0;
  }
  std::__function::__value_func<void ()(re::DirectResourceContext *,unsigned long long)>::~__value_func[abi:nn180100]((void *)this + 16);
  std::__function::__value_func<void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::~__value_func[abi:nn180100]((void *)this + 12);
  uint64_t v10 = *((void *)this + 10);
  if (v10)
  {

    *((void *)this + 10) = 0;
  }
  unint64_t v11 = (void *)*((void *)this + 8);
  if (v11)
  {

    *((void *)this + 8) = 0;
  }
  ArcSharedObject::~ArcSharedObject(this);
}

{
  uint64_t vars8;

  re::DirectResourceContext::~DirectResourceContext(this);

  JUMPOUT(0x2533130A0);
}

void non-virtual thunk to're::DirectResourceContext::~DirectResourceContext(re::DirectResourceContext *this)
{
}

{
  uint64_t vars8;

  re::DirectResourceContext::~DirectResourceContext((re::DirectResourceContext *)((char *)this - 16));

  JUMPOUT(0x2533130A0);
}

void re::DirectResourceContext::createMesh(uint64_t a1@<X0>, _OWORD *a2@<X1>, void **a3@<X8>)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  BOOL v6 = *(void *)(a1 + 32) != 2;
  v9[0] = *(void **)(a1 + 64);
  v9[1] = (void *)v6;
  re::DirectMesh::create(a2, v9, a3);
  uint64_t v7 = (char *)*a3;
  if (*a3)
  {
    v9[0] = *a3;
    uint64_t v8 = v7 + 8;
    re::DirectResourceContext::addResource(a1, (uint64_t *)v9);
    if (v9[0]) {
  }
    }
}

uint64_t re::DirectResourceContext::addResource(uint64_t a1, uint64_t *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  re::DirectResource::setDelegate(*a2, a1 + 16);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__emplace_unique_impl<unsigned char const(&)[16],re::SharedPtr<re::DirectResource> const&>((void *)(a1 + 256), (const unsigned __int8 *)(*a2 + 16), a2);
  if (!*(void *)(*a2 + 32))
  {
    uint64_t v4 = re::DirectResourceContext::ensureUncommitted((re::DirectResourceContext *)a1);
    re::DirectResourcesPendingCommit::addResource(v4, (const unsigned __int8 *)*a2);
    uint64_t v5 = *a2;
    if (*a2) {
      id v6 = (id)(v5 + 8);
    }
    v9[2] = v5;
    uint64_t v10 = 0;
    v9[0] = &unk_26FF35068;
    v9[1] = a1;
    if (v5) {
      id v7 = (id)(v5 + 8);
    }
    uint64_t v10 = v9;
    (*(void (**)(uint64_t, void *))(*(void *)v5 + 64))(v5, v9);
    std::__function::__value_func<void ()(re::DirectResourceSlot)>::~__value_func[abi:nn180100](v9);
  }
  uint64_t result = *(void *)(a1 + 88);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void, uint64_t))(result + 16))(result, a1, 0, *a2);
  }
  return result;
}

void re::DirectResourceContext::createTexture(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  BOOL v6 = *(void *)(a1 + 32) != 2;
  v9[0] = *(void *)(a1 + 64);
  v9[1] = v6;
  re::DirectTexture::create(a2, v9, a3);
  uint64_t v7 = *a3;
  if (*a3)
  {
    v9[0] = *a3;
    id v8 = (id)(v7 + 8);
    re::DirectResourceContext::addResource(a1, v9);
    if (v9[0]) {
  }
    }
}

void re::DirectResourceContext::createBuffer(uint64_t a1@<X0>, void *a2@<X1>, uint64_t *a3@<X8>)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  BOOL v6 = *(void *)(a1 + 32) != 2;
  v9[0] = *(void *)(a1 + 64);
  v9[1] = v6;
  re::DirectBuffer::create(a2, v9, a3);
  uint64_t v7 = *a3;
  if (*a3)
  {
    v9[0] = *a3;
    id v8 = (id)(v7 + 8);
    re::DirectResourceContext::addResource(a1, v9);
    if (v9[0]) {
  }
    }
}

void re::DirectResourceContext::createMaterial(uint64_t a1@<X0>, unint64_t *a2@<X1>, uint64_t *a3@<X8>)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  BOOL v6 = *(void *)(a1 + 32) != 2;
  v9[0] = *(void *)(a1 + 64);
  v9[1] = v6;
  re::DirectMaterialParameters::create(a2, a3);
  uint64_t v7 = *a3;
  if (*a3)
  {
    v9[0] = *a3;
    id v8 = (id)(v7 + 8);
    re::DirectResourceContext::addResource(a1, v9);
    if (v9[0]) {
  }
    }
}

void re::DirectResourceContext::reusePayload(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  unint64_t v14 = (os_unfair_lock_s *)(a1 + 208);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
  re::DirectResourcesReusePool::take(*(void **)(a1 + 240), a2, a3, a4, a5, a6, a7);

  os_unfair_lock_unlock(v14);
}

void re::DirectResourceContext::addPayload(dispatch_queue_t *a1, void *a2, uint64_t *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(a1[3]);
  if (a2[4]) {
    re::DirectResourceContext::addPayload();
  }
  (*(void (**)(void *))(*a2 + 40))(a2);
  kdebug_trace();
  uint64_t v6 = re::DirectResourceContext::ensureUncommitted((re::DirectResourceContext *)a1);
  re::DirectResourcesPendingCommit::addPayload(v6, *a3);
  std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMemoryResource>>::pair[abi:nn180100]<unsigned char const(&)[16],re::SharedPtr<re::DirectMemoryResource> const&,0>((uint64_t)v7, (const unsigned __int8 *)(*a3 + 16), a3);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>((uint64_t)(a1 + 37), v7, (uint64_t)v7);
  if (v8) {
}
  }

uint64_t re::DirectResourceContext::removeResource(re::DirectResourceContext *this, re::DirectResource *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(*((dispatch_queue_t *)this + 3));
  re::DirectResource::setDelegate((uint64_t)a2, 0);
  uuid_copy(dst, (const unsigned __int8 *)a2 + 16);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__erase_unique<re::DirectResourceId>((void *)this + 32, dst);
  if (!*((void *)a2 + 4))
  {
    uint64_t v4 = re::DirectResourceContext::ensureUncommitted(this);
    int v5 = (*(uint64_t (**)(re::DirectResource *))(*(void *)a2 + 40))(a2);
    uuid_copy(v15, (const unsigned __int8 *)a2 + 16);
    re::DirectResourcesPendingCommit::destroyResource(v4, v5, *(uint64_t *)v15, *(uint64_t *)&v15[8]);
    *(void *)uuid_t dst = &unk_26FF350B0;
    *(void *)&dst[8] = this;
    int v13 = a2;
    unint64_t v14 = dst;
    (*(void (**)(re::DirectResource *, unsigned __int8 *))(*(void *)a2 + 64))(a2, dst);
    std::__function::__value_func<void ()(re::DirectResourceSlot)>::~__value_func[abi:nn180100](dst);
    os_unfair_lock_lock((os_unfair_lock_t)this + 52);
    uint64_t v6 = (void *)*((void *)this + 30);
    uuid_copy(v11, (const unsigned __int8 *)a2 + 16);
    re::DirectResourcesReusePool::purgePayloads(v6, *(uint64_t *)v11, *(uint64_t *)&v11[8], (uint64_t *)dst);
    uint64_t v7 = *(void *)dst;
    uint64_t v8 = *(void *)&dst[8];
    while (v7 != v8)
    {
      uuid_copy(v10, (const unsigned __int8 *)(*(void *)(v7 + 48) + 16));
      re::DirectResourceContext::removePayload((uint64_t)this, (uint64_t)v10);
      v7 += 56;
    }
    *(void *)uuid_t v10 = dst;
    std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100]((void ***)v10);
    os_unfair_lock_unlock((os_unfair_lock_t)this + 52);
  }
  uint64_t result = *((void *)this + 11);
  if (result) {
    return (*(uint64_t (**)(uint64_t, re::DirectResourceContext *, uint64_t, re::DirectResource *))(result + 16))(result, this, 2, a2);
  }
  return result;
}

void re::DirectResourceContext::removePayload(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  uint64_t v4 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>((void *)(a1 + 296), (unsigned __int8 *)a2);
  if (v4)
  {
    int v5 = (uint64_t *)v4;
    kdebug_trace();
    uint64_t v6 = re::DirectResourceContext::ensureUncommitted((re::DirectResourceContext *)a1);
    re::DirectResourcesPendingCommit::removePayload(v6, *(void *)a2, *(void *)(a2 + 8));
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::erase((void *)(a1 + 296), v5);
  }
  else
  {
    uint64_t v7 = re::directResourceLog(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      re::toString((re *)a2, v8);
      *(_DWORD *)buf = 136315138;
      uuid_t v10 = v8;
      _os_log_impl(&dword_24CD28000, v7, OS_LOG_TYPE_DEFAULT, "Unable to find payload %s for removal", buf, 0xCu);
    }
  }
}

void re::DirectResourceContext::willChange(uint64_t a1, re::DirectResource *a2, uint64_t a3, uint64_t a4, int a5, void *a6)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if (!*((void *)a2 + 4))
  {
    re::DirectResourceContext::recreatePayloadIfNecessary((re::DirectResourceContext *)a1, a2, a3, a4, a5, (uint64_t)a6);
    if (a6)
    {
      uint64_t v12 = *(void *)(a1 + 168);
      if (v12)
      {
        if (*(unsigned char *)(a1 + 76))
        {
          re::DirectResourcesPendingCommit::addCommandBuffer(v12, a6);
        }
      }
    }
  }
}

void non-virtual thunk to're::DirectResourceContext::willChange(uint64_t a1, re::DirectResource *a2, uint64_t a3, uint64_t a4, int a5, void *a6)
{
}

uint64_t re::DirectResourceContext::didChange(uint64_t a1, re::DirectResource *a2, int a3, uint64_t a4)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if (!*((void *)a2 + 4))
  {
    if ((*(unsigned int (**)(re::DirectResource *))(*(void *)a2 + 40))(a2) == 1 && a3 == 0 && a4 == 0)
    {
      unint64_t v14 = (re::DirectResourcesPendingCommit *)re::DirectResourceContext::ensureUncommitted((re::DirectResourceContext *)a1);
      *(void *)(re::DirectResourcesPendingCommit::ensureUpdate(v14, a2) + 16) = *((void *)a2 + 16);
    }
    else if ((*(unsigned int (**)(re::DirectResource *))(*(void *)a2 + 40))(a2) == 3 {
           && a3 == 0
    }
           && a4 == 0)
    {
      uint64_t v12 = (re::DirectResourcesPendingCommit *)re::DirectResourceContext::ensureUncommitted((re::DirectResourceContext *)a1);
      uint64_t v13 = re::DirectResourcesPendingCommit::ensureUpdate(v12, a2);
      *(void *)(v13 + 24) = *((void *)a2 + 8);
      *(unsigned char *)(v13 + 32) = 1;
    }
  }
  uint64_t result = (*(uint64_t (**)(re::DirectResource *))(*(void *)a2 + 40))(a2);
  if (result == 1 && a3 == 0 && a4 == 0)
  {
    uint64_t result = *(void *)(a1 + 88);
    if (result)
    {
      uint64_t v18 = *(uint64_t (**)(void))(result + 16);
      return v18();
    }
  }
  return result;
}

uint64_t non-virtual thunk to're::DirectResourceContext::didChange(uint64_t a1, re::DirectResource *a2, int a3, uint64_t a4)
{
  return re::DirectResourceContext::didChange(a1 - 16, a2, a3, a4);
}

void re::DirectResourceContext::payloadWillReplace(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if (*(void *)(a1 + 40))
  {
    uint64_t v8 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)a2 + 48))(a2, a3, a4);
    if (v8)
    {
      uint64_t v9 = v8;
      uuid_t v10 = (void *)(v8 + 8);
      id v11 = (id)(v8 + 8);
      uint64_t v12 = *(void *)(a2 + 32);
      if ((*(_DWORD *)(v9 + 32) - 1) <= 6 && v12 == 0)
      {
        re::DirectResourceContext::ensureUncommittedFreeList((re::DirectResourceContext *)a1);
        uuid_t v15 = v14;
        uuid_copy(v20, (const unsigned __int8 *)(a2 + 16));
        int v16 = (*(uint64_t (**)(uint64_t))(*(void *)a2 + 40))(a2);
        uint64_t v18 = v9;
        id v17 = v10;
        re::DirectResourcesReuseList::add(v15, *(uint64_t *)v20, *(uint64_t *)&v20[8], v16, a3, a4, &v18);
        if (v18)
        {

          uint64_t v18 = 0;
        }
      }
      else if (!v12)
      {
        uuid_copy(dst, (const unsigned __int8 *)(v9 + 16));
        re::DirectResourceContext::removePayload(a1, (uint64_t)dst);
      }
    }
  }
}

void non-virtual thunk to're::DirectResourceContext::payloadWillReplace(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t re::DirectResourceContext::payloadDidReplace(uint64_t a1, re::DirectResource *a2, uint64_t a3, uint64_t a4)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  if (!*((void *)a2 + 4))
  {
    uint64_t v9 = (*(uint64_t (**)(re::DirectResource *, uint64_t, uint64_t))(*(void *)a2 + 48))(a2, a3, a4);
    if (v9)
    {
      uint64_t v10 = v9;
      id v11 = (re::DirectResourcesPendingCommit *)re::DirectResourceContext::ensureUncommitted((re::DirectResourceContext *)a1);
      uint64_t v12 = re::DirectResourcesPendingCommit::ensureUpdate(v11, a2);
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v16 = v10;
        id v14 = (id)(v10 + 8);
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t *))(*(void *)v13 + 48))(v13, a3, a4, &v16);
        if (v16)
        {

          uint64_t v16 = 0;
        }
      }
      if (re::isPrivateToThisProcess(*(_DWORD *)(v10 + 32)))
      {
        uint64_t v15 = re::DirectResourceContext::ensureUncommitted((re::DirectResourceContext *)a1);
        re::DirectResourcesPendingCommit::updatePayload(v15, v10);
      }
    }
  }
  uint64_t result = *(void *)(a1 + 88);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, re::DirectResource *))(result + 16))(result, a1, 1, a2);
  }
  return result;
}

uint64_t non-virtual thunk to're::DirectResourceContext::payloadDidReplace(uint64_t a1, re::DirectResource *a2, uint64_t a3, uint64_t a4)
{
  return re::DirectResourceContext::payloadDidReplace(a1 - 16, a2, a3, a4);
}

void re::DirectResourceContext::destroyResource(re::DirectResourceContext *this, re::DirectResource *a2)
{
  if (dispatch_get_specific(this))
  {
    re::DirectResourceContext::removeResource(this, a2);
    re::DirectResource::dispose(a2);
  }
  else
  {
    if (this) {
      uint64_t v4 = (char *)this + 8;
    }
    else {
      uint64_t v4 = 0;
    }
    objc_initWeak(&location, v4);
    int v5 = *((void *)this + 3);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 1174405120;
    block[2] = ___ZN2re21DirectResourceContext15destroyResourceEPNS_14DirectResourceE_block_invoke;
    block[3] = &__block_descriptor_tmp_11;
    v7[0] = 0;
    objc_copyWeak(v7, &location);
    v7[1] = a2;
    dispatch_async(v5, block);
    objc_destroyWeak(v7);
    v7[0] = 0;
    objc_destroyWeak(&location);
  }
}

void ___ZN2re21DirectResourceContext15destroyResourceEPNS_14DirectResourceE_block_invoke(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    unint64_t v3 = WeakRetained;
    re::DirectResourceContext::removeResource((re::DirectResourceContext *)(WeakRetained - 8), *(re::DirectResource **)(a1 + 40));
  }
  *(void *)(*(void *)(a1 + 40) + 40) = 0;
  uint64_t v4 = *(re::DirectResource **)(a1 + 40);

  re::DirectResource::dispose(v4);
}

void non-virtual thunk to're::DirectResourceContext::destroyResource(re::DirectResourceContext *this, re::DirectResource *a2)
{
}

void ___ZN2re21DirectResourceContext25destroyPayloads_anyThreadENSt3__16vectorINS_16DirectResourceIdENS1_9allocatorIS3_EEEE_block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    uint64_t v3 = (uint64_t)WeakRetained - 8;
  }
  else {
    uint64_t v3 = 0;
  }
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained;
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    while (v5 != v6)
    {
      re::DirectResourceContext::removePayload(v3, v5);
      v5 += 16;
    }
  }
}

void *__copy_helper_block_8_32c50_ZTSN2re10ArcWeakPtrINS_21DirectResourceContextEEE40c63_ZTSNSt3__16vectorIN2re16DirectResourceIdENS_9allocatorIS2_EEEE(uint64_t a1, uint64_t a2)
{
  *(void *)(a1 + 32) = 0;
  uint64_t v3 = a1 + 32;
  objc_copyWeak((id *)(a1 + 32), (id *)(a2 + 32));

  return std::vector<re::DirectResourceId>::vector((void *)(v3 + 8), a2 + 40);
}

void __destroy_helper_block_8_32c50_ZTSN2re10ArcWeakPtrINS_21DirectResourceContextEEE40c63_ZTSNSt3__16vectorIN2re16DirectResourceIdENS_9allocatorIS2_EEEE(uint64_t a1)
{
  unint64_t v2 = *(void **)(a1 + 40);
  if (v2)
  {
    *(void *)(a1 + 48) = v2;
    operator delete(v2);
  }
  objc_destroyWeak((id *)(a1 + 32));
  *(void *)(a1 + 32) = 0;
}

void *re::DirectResourceContext::setObserver(uint64_t a1, void *aBlock)
{
  uint64_t v4 = *(const void **)(a1 + 88);
  if (v4) {
    _Block_release(v4);
  }
  uint64_t result = _Block_copy(aBlock);
  *(void *)(a1 + 88) = result;
  return result;
}

void *re::DirectResourceContext::setBeginCallback(uint64_t a1, uint64_t a2)
{
  return std::function<void ()(re::DirectResourceContext *,unsigned long long)>::operator=((void *)(a1 + 128), a2);
}

void *std::function<void ()(re::DirectResourceContext *,unsigned long long)>::operator=(void *a1, uint64_t a2)
{
  v4[4] = *MEMORY[0x263EF8340];
  std::__function::__value_func<void ()(re::DirectResourceContext *,unsigned long long)>::__value_func[abi:nn180100]((uint64_t)v4, a2);
  std::__function::__value_func<void ()(re::DirectResourceContext *,unsigned long long)>::swap[abi:nn180100](v4, a1);
  std::__function::__value_func<void ()(re::DirectResourceContext *,unsigned long long)>::~__value_func[abi:nn180100](v4);
  return a1;
}

void *re::DirectResourceContext::setCompleteCallback(uint64_t a1, uint64_t a2)
{
  return std::function<void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::operator=((void *)(a1 + 96), a2);
}

void *std::function<void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::operator=(void *a1, uint64_t a2)
{
  v4[4] = *MEMORY[0x263EF8340];
  std::__function::__value_func<void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::__value_func[abi:nn180100]((uint64_t)v4, a2);
  std::__function::__value_func<void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::swap[abi:nn180100](v4, a1);
  std::__function::__value_func<void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::~__value_func[abi:nn180100](v4);
  return a1;
}

void re::DirectResourceContext::commit(re::DirectResourceContext *this)
{
  unint64_t v2 = (os_unfair_lock_s *)((char *)this + 72);
  os_unfair_lock_lock((os_unfair_lock_t)this + 18);
  if (*((void *)this + 21))
  {
    kdebug_trace();
    uint64_t v3 = (re::DirectResourcesPendingCommit *)*((void *)this + 21);
    *((void *)this + 21) = 0;
    re::DirectResourcesPendingCommit::scheduled(v3);
    unint64_t v4 = *((void *)this + 25);
    uint64_t v5 = (re::DirectResourcesPendingCommit **)*((void *)this + 24);
    if ((unint64_t)v5 >= v4)
    {
      uint64_t v7 = (void *)*((void *)this + 23);
      uint64_t v8 = v5 - (re::DirectResourcesPendingCommit **)v7;
      unint64_t v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) >> 61) {
        abort();
      }
      uint64_t v10 = v4 - (void)v7;
      if (v10 >> 2 > v9) {
        unint64_t v9 = v10 >> 2;
      }
      if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
        unint64_t v11 = 0x1FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v11 = v9;
      }
      uint64_t v26 = (char *)this + 200;
      if (v11)
      {
        uint64_t v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)this + 200, v11);
        uint64_t v7 = (void *)*((void *)this + 23);
        uint64_t v5 = (re::DirectResourcesPendingCommit **)*((void *)this + 24);
      }
      else
      {
        uint64_t v12 = 0;
      }
      uint64_t v13 = (re::DirectResourcesPendingCommit **)&v12[8 * v8];
      id v14 = &v12[8 * v11];
      uint64_t v25 = v14;
      *uint64_t v13 = v3;
      *((void *)&v24 + 1) = v13 + 1;
      if (v5 == v7)
      {
        uint64_t v6 = v13 + 1;
      }
      else
      {
        do
        {
          uint64_t v15 = *--v5;
          *--uint64_t v13 = v15;
          *uint64_t v5 = 0;
        }
        while (v5 != v7);
        uint64_t v6 = (void *)*((void *)&v24 + 1);
        id v14 = v25;
      }
      long long v16 = *(_OWORD *)((char *)this + 184);
      *((void *)this + 23) = v13;
      *((void *)this + 24) = v6;
      long long v24 = v16;
      id v17 = (char *)*((void *)this + 25);
      *((void *)this + 25) = v14;
      uint64_t v25 = v17;
      uint64_t v23 = v16;
      std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)&v23);
    }
    else
    {
      *uint64_t v5 = v3;
      uint64_t v6 = v5 + 1;
    }
    *((void *)this + 24) = v6;
  }
  if (*((void *)this + 22))
  {
    kdebug_trace();
    re::DirectResourceContext::freeListAppend((uint64_t)this, (void *)this + 22);
    uint64_t v18 = *((void *)this + 22);
    if (v18)
    {

      *((void *)this + 22) = 0;
    }
  }
  re::DirectResourceContext::sendIfReady((const os_unfair_lock *)this);
  uint64_t v19 = *((void *)this + 5);
  if (v19 == 2)
  {
    unint64_t v22 = *((void *)this + 20);
    unint64_t v21 = v22 - 2;
    if (v22 >= 2) {
      goto LABEL_27;
    }
  }
  else if (v19 == 1)
  {
    uint64_t v20 = *((void *)this + 20);
    if (v20)
    {
      unint64_t v21 = v20 - 1;
LABEL_27:
      re::DirectResourceContext::freeListReady(this, v21);
    }
  }
  os_unfair_lock_unlock(v2);
}

void re::DirectResourceContext::freeListAppend(uint64_t a1, void *a2)
{
  unint64_t v4 = (os_unfair_lock_s *)(a1 + 208);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 208));
  unint64_t v5 = *(void *)(a1 + 232);
  uint64_t v6 = *(void **)(a1 + 224);
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v8 = *(void **)(a1 + 216);
    uint64_t v9 = v6 - v8;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      abort();
    }
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    uint64_t v22 = a1 + 232;
    if (v12)
    {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(a1 + 232, v12);
      uint64_t v8 = *(void **)(a1 + 216);
      uint64_t v6 = *(void **)(a1 + 224);
    }
    else
    {
      uint64_t v13 = 0;
    }
    id v14 = &v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    unint64_t v21 = v15;
    *(void *)id v14 = *a2;
    *a2 = 0;
    *((void *)&v20 + 1) = v14 + 8;
    if (v6 == v8)
    {
      uint64_t v7 = v14 + 8;
    }
    else
    {
      do
      {
        uint64_t v16 = *--v6;
        *((void *)v14 - 1) = v16;
        v14 -= 8;
        *uint64_t v6 = 0;
      }
      while (v6 != v8);
      uint64_t v7 = (void *)*((void *)&v20 + 1);
      uint64_t v15 = v21;
    }
    long long v17 = *(_OWORD *)(a1 + 216);
    *(void *)(a1 + 216) = v14;
    *(void *)(a1 + 224) = v7;
    long long v20 = v17;
    uint64_t v18 = *(char **)(a1 + 232);
    *(void *)(a1 + 232) = v15;
    unint64_t v21 = v18;
    uint64_t v19 = v17;
    std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)&v19);
  }
  else
  {
    *uint64_t v6 = *a2;
    uint64_t v7 = v6 + 1;
    *a2 = 0;
  }
  *(void *)(a1 + 224) = v7;
  os_unfair_lock_unlock(v4);
}

uint64_t re::DirectResourcesCommitQueue::DirectResourcesCommitQueue(uint64_t a1, uint64_t a2)
{
  ArcSharedObject::ArcSharedObject((ArcSharedObject *)a1, 0);
  *unint64_t v4 = &unk_26FF34F68;
  uint64_t v4[2] = *(void *)(a2 + 24);
  v4[3] = 0;
  v4[4] = a2;
  id v5 = (id)(a2 + 8);
  *(_DWORD *)(a1 + 40) = 0;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 48) = 0;
  dispatch_retain(*(dispatch_object_t *)(a1 + 16));
  return a1;
}

void re::DirectResourcesCommitQueue::~DirectResourcesCommitQueue(dispatch_object_t *this)
{
  dispatch_release(this[2]);
  uint64_t v3 = (void **)(this + 6);
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v3);
  dispatch_object_t v2 = this[4];
  if (v2)
  {

    this[4] = 0;
  }
  ArcSharedObject::~ArcSharedObject((ArcSharedObject *)this);
}

{
  uint64_t vars8;

  re::DirectResourcesCommitQueue::~DirectResourcesCommitQueue(this);

  JUMPOUT(0x2533130A0);
}

void re::DirectResourcesCommitQueue::enumerate(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = (os_unfair_lock_s *)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  uint64_t v5 = *(void *)(a1 + 48);
  if (*(void *)(a1 + 56) != v5)
  {
    unint64_t v6 = 0;
    do
    {
      if ((std::function<BOOL ()(re::DirectResourcesResolvedCommit const*)>::operator()(a2, *(void *)(v5 + 8 * v6)) & 1) == 0) {
        break;
      }
      ++v6;
      uint64_t v5 = *(void *)(a1 + 48);
    }
    while (v6 < (*(void *)(a1 + 56) - v5) >> 3);
  }

  os_unfair_lock_unlock(v4);
}

uint64_t std::function<BOOL ()(re::DirectResourcesResolvedCommit const*)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = a2;
  uint64_t v2 = *(void *)(a1 + 24);
  if (v2) {
    return (*(uint64_t (**)(uint64_t, uint64_t *))(*(void *)v2 + 48))(v2, &v5);
  }
  uint64_t v4 = std::__throw_bad_function_call[abi:nn180100]();
  return re::DirectResourcesCommitQueue::commitThrough(v4);
}

void re::DirectResourcesCommitQueue::commitThrough(uint64_t a1, unint64_t a2, uint64_t a3)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 16));
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  long long v17 = *(re::DirectResourcesResolvedCommit ***)(a1 + 48);
  unint64_t v6 = (uint64_t *)v17;
  long long v7 = *(_OWORD *)(a1 + 56);
  *(void *)(a1 + 48) = 0;
  *(void *)(a1 + 56) = 0;
  long long v18 = v7;
  *(void *)(a1 + 64) = 0;
  uint64_t v8 = (uint64_t *)v7;
  if ((uint64_t *)v7 != v6)
  {
    unint64_t v9 = (uint64_t)(v7 - (void)v6) >> 3;
    if (v9 <= 1) {
      unint64_t v9 = 1;
    }
    unint64_t v10 = v6;
    while (*(void *)(*v6 + 24) <= a2)
    {
      ++v10;
      ++v6;
      if (!--v9) {
        goto LABEL_9;
      }
    }
    std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::__insert_with_size[abi:nn180100]<std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>>((uint64_t *)(a1 + 48), 0, v10, (uint64_t *)v7, (uint64_t)(v7 - (void)v10) >> 3);
    std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::erase((uint64_t)&v17, v10, v8);
  }
LABEL_9:
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  if (v17 != (re::DirectResourcesResolvedCommit **)v18)
  {
    kdebug_trace();
    uint64_t v11 = v17;
    unint64_t v12 = (re::DirectResourcesResolvedCommit **)v18;
    while (v11 != v12)
    {
      uint64_t v13 = *v11++;
      re::DirectResourcesResolvedCommit::apply(v13, *(re::DirectResourceContext **)(a1 + 32));
    }
    if (*(void *)(a3 + 24))
    {
      id v14 = v17;
      uint64_t v15 = (re::DirectResourcesResolvedCommit **)v18;
      while (v14 != v15)
      {
        uint64_t v16 = (uint64_t)*v14++;
        std::function<void ()(re::DirectResourceEvent const&,unsigned long long)>::operator()(a3, v16 + 40, *(void *)(v16 + 24));
      }
    }
    kdebug_trace();
  }
  uint64_t v19 = &v17;
  std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100]((void ***)&v19);
}

uint64_t *std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::erase(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  if (a2 != a3)
  {
    uint64_t v5 = a3;
    unint64_t v6 = *(uint64_t **)(a1 + 8);
    if (a3 == v6)
    {
      uint64_t v8 = a2;
    }
    else
    {
      uint64_t v7 = a3 - a2;
      uint64_t v8 = a2;
      do
      {
        uint64_t v9 = *v8;
        uint64_t *v8 = v8[v7];
        v8[v7] = v9;
        ++v8;
      }
      while (&v8[v7] != v6);
      uint64_t v5 = *(uint64_t **)(a1 + 8);
    }
    if (v5 != v8)
    {
      unint64_t v10 = v5;
      do
      {
        uint64_t v12 = *--v10;
        uint64_t v11 = v12;
        if (v12)
        {

          *(v5 - 1) = 0;
        }
        uint64_t v5 = v10;
      }
      while (v10 != v8);
    }
    *(void *)(a1 + 8) = v8;
  }
  return a2;
}

void std::function<void ()(re::DirectResourceEvent const&,unsigned long long)>::operator()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a3;
  uint64_t v3 = *(void *)(a1 + 24);
  if (v3)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t *))(*(void *)v3 + 48))(v3, a2, &v6);
  }
  else
  {
    uint64_t v4 = std::__throw_bad_function_call[abi:nn180100]();
    re::DirectResourcesCommitQueue::enqueueCommit_threadSafe(v4, v5);
  }
}

void re::DirectResourcesCommitQueue::enqueueCommit_threadSafe(uint64_t a1, void *a2)
{
  uint64_t v4 = (os_unfair_lock_s *)(a1 + 40);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
  kdebug_trace();
  unint64_t v5 = *(void *)(a1 + 64);
  uint64_t v6 = *(void **)(a1 + 56);
  if ((unint64_t)v6 >= v5)
  {
    uint64_t v8 = *(void **)(a1 + 48);
    uint64_t v9 = v6 - v8;
    unint64_t v10 = v9 + 1;
    if ((unint64_t)(v9 + 1) >> 61) {
      abort();
    }
    uint64_t v11 = v5 - (void)v8;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    uint64_t v22 = a1 + 64;
    if (v12)
    {
      uint64_t v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(a1 + 64, v12);
      uint64_t v8 = *(void **)(a1 + 48);
      uint64_t v6 = *(void **)(a1 + 56);
    }
    else
    {
      uint64_t v13 = 0;
    }
    id v14 = &v13[8 * v9];
    uint64_t v15 = &v13[8 * v12];
    unint64_t v21 = v15;
    *(void *)id v14 = *a2;
    *a2 = 0;
    *((void *)&v20 + 1) = v14 + 8;
    if (v6 == v8)
    {
      uint64_t v7 = v14 + 8;
    }
    else
    {
      do
      {
        uint64_t v16 = *--v6;
        *((void *)v14 - 1) = v16;
        v14 -= 8;
        *uint64_t v6 = 0;
      }
      while (v6 != v8);
      uint64_t v7 = (void *)*((void *)&v20 + 1);
      uint64_t v15 = v21;
    }
    long long v17 = *(_OWORD *)(a1 + 48);
    *(void *)(a1 + 48) = v14;
    *(void *)(a1 + 56) = v7;
    long long v20 = v17;
    long long v18 = *(char **)(a1 + 64);
    *(void *)(a1 + 64) = v15;
    unint64_t v21 = v18;
    uint64_t v19 = v17;
    std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)&v19);
  }
  else
  {
    *uint64_t v6 = *a2;
    uint64_t v7 = v6 + 1;
    *a2 = 0;
  }
  *(void *)(a1 + 56) = v7;
  os_unfair_lock_unlock(v4);
}

void re::DirectResourcesCommitQueue::takeCommits_threadSafe(re::DirectResourcesCommitQueue *this, re::DirectResourcesCommitQueue *a2)
{
  uint64_t v4 = (os_unfair_lock_s *)((char *)this + 40);
  unint64_t v5 = (os_unfair_lock_s *)((char *)a2 + 40);
  std::lock[abi:nn180100]<re::UnfairLock,re::UnfairLock>((os_unfair_lock_s *)this + 10, (os_unfair_lock_s *)a2 + 10);
  uint64_t v6 = (uint64_t *)*((void *)a2 + 6);
  uint64_t v7 = (uint64_t *)*((void *)a2 + 7);
  if (v6 != v7)
  {
    std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::__insert_with_size[abi:nn180100]<std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>>((uint64_t *)this + 6, *((void *)this + 7), v6, v7, v7 - v6);
    *((void *)a2 + 3) = *(void *)(*(void *)(*((void *)a2 + 7) - 8) + 24);
    std::vector<re::SharedPtr<re::DirectBuffer>>::__clear[abi:nn180100]((uint64_t *)a2 + 6);
  }
  os_unfair_lock_unlock(v4);

  os_unfair_lock_unlock(v5);
}

void re::DirectResourcesCommitQueue::takeCommitsThrough_threadSafe(re::DirectResourcesCommitQueue *this, re::DirectResourcesCommitQueue *a2, unint64_t a3)
{
  uint64_t v6 = (os_unfair_lock_s *)((char *)this + 40);
  uint64_t v7 = (os_unfair_lock_s *)((char *)a2 + 40);
  std::lock[abi:nn180100]<re::UnfairLock,re::UnfairLock>((os_unfair_lock_s *)this + 10, (os_unfair_lock_s *)a2 + 10);
  uint64_t v8 = (uint64_t *)*((void *)a2 + 6);
  uint64_t v9 = *((void *)a2 + 7) - (void)v8;
  if (v9)
  {
    uint64_t v10 = 0;
    unint64_t v11 = v9 >> 3;
    if (v11 <= 1) {
      unint64_t v11 = 1;
    }
    while (*(void *)(v8[v10] + 24) <= a3)
    {
      if (v11 == ++v10)
      {
        uint64_t v10 = v11;
        goto LABEL_8;
      }
    }
    if (!v10) {
      goto LABEL_9;
    }
LABEL_8:
    std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::__insert_with_size[abi:nn180100]<std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>>((uint64_t *)this + 6, *((void *)this + 7), *((uint64_t **)a2 + 6), &v8[v10], v10);
    *((void *)a2 + 3) = *(void *)(*(void *)(*((void *)a2 + 6) + 8 * v10 - 8) + 24);
    std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::erase((uint64_t)a2 + 48, v8, &v8[v10]);
  }
LABEL_9:
  os_unfair_lock_unlock(v6);

  os_unfair_lock_unlock(v7);
}

uint64_t re::DirectResourcesCommitQueue::device(re::DirectResourcesCommitQueue *this)
{
  return *(void *)(*((void *)this + 4) + 64);
}

uint64_t re::DirectResourcesCommitQueue::availableCommitId_threadSafe(os_unfair_lock_s *this)
{
  uint64_t v2 = this + 10;
  os_unfair_lock_lock(this + 10);
  uint64_t v3 = *(void *)&this[14]._os_unfair_lock_opaque;
  if (*(void *)&this[12]._os_unfair_lock_opaque == v3) {
    uint64_t v4 = this + 6;
  }
  else {
    uint64_t v4 = (os_unfair_lock_s *)(*(void *)(v3 - 8) + 24);
  }
  uint64_t v5 = *(void *)&v4->_os_unfair_lock_opaque;
  os_unfair_lock_unlock(v2);
  return v5;
}

uint64_t re::DirectResourceClientReceiver::DirectResourceClientReceiver(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  ArcSharedObject::ArcSharedObject((ArcSharedObject *)a1, 0);
  void *v8 = &unk_26FF34FA0;
  v8[2] = a2;
  v8[3] = a3;
  *(void *)(a1 + 32) = a4;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_DWORD *)(a1 + 72) = 1065353216;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_DWORD *)(a1 + 112) = 1065353216;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_DWORD *)(a1 + 152) = 1065353216;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_DWORD *)(a1 + 192) = 1065353216;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_OWORD *)(a1 + 216) = 0u;
  *(_DWORD *)(a1 + 232) = 1065353216;
  dispatch_retain(*(dispatch_object_t *)(a1 + 24));
  return a1;
}

void re::DirectResourceClientReceiver::~DirectResourceClientReceiver(dispatch_object_t *this)
{
  dispatch_release(this[3]);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table((uint64_t)(this + 25));
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table((uint64_t)(this + 20));
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table((uint64_t)(this + 15));
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table((uint64_t)(this + 10));
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table((uint64_t)(this + 5));
  dispatch_object_t v2 = this[4];
  if (v2)
  {

    this[4] = 0;
  }

  ArcSharedObject::~ArcSharedObject((ArcSharedObject *)this);
}

{
  uint64_t vars8;

  re::DirectResourceClientReceiver::~DirectResourceClientReceiver(this);

  JUMPOUT(0x2533130A0);
}

void re::DirectResourceClientReceiver::destroyAll(re::DirectResourceClientReceiver *this@<X0>, ArcSharedObject **a2@<X8>)
{
  dispatch_assert_queue_V2(*((dispatch_queue_t *)this + 3));
  uint64_t v7 = -1;
  re::make::shared::object<re::DirectResourcesResolvedCommit,unsigned long long const&,unsigned long long>((uint64_t *)this + 2, &v7, a2);
  for (uint64_t i = (void *)*((void *)this + 7); i; uint64_t i = (void *)*i)
    std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)*a2 + 12, i + 4);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear((uint64_t)this + 40);
  for (j = (void *)*((void *)this + 12); j; j = (void *)*j)
    std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)*a2 + 21, j + 4);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear((uint64_t)this + 80);
  for (k = (void *)*((void *)this + 17); k; k = (void *)*k)
    std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)*a2 + 30, k + 4);
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear((uint64_t)this + 120);
}

void *std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100](char **a1, uint64_t *a2)
{
  unint64_t v6 = (unint64_t)a1[2];
  uint64_t result = a1 + 2;
  unint64_t v5 = v6;
  uint64_t v7 = (char *)*(result - 1);
  if ((unint64_t)v7 >= v6)
  {
    uint64_t v10 = (v7 - *a1) >> 3;
    if ((unint64_t)(v10 + 1) >> 61) {
      abort();
    }
    uint64_t v11 = v5 - (void)*a1;
    uint64_t v12 = v11 >> 2;
    if (v11 >> 2 <= (unint64_t)(v10 + 1)) {
      uint64_t v12 = v10 + 1;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v13 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v13 = v12;
    }
    uint64_t v27 = result;
    if (v13) {
      id v14 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>((uint64_t)result, v13);
    }
    else {
      id v14 = 0;
    }
    uint64_t v15 = &v14[8 * v10];
    uint64_t v16 = &v14[8 * v13];
    uint64_t v26 = v16;
    uint64_t v17 = *a2;
    *(void *)uint64_t v15 = *a2;
    if (v17) {
      id v18 = (id)(v17 + 8);
    }
    uint64_t v9 = v15 + 8;
    v25.i64[1] = (uint64_t)(v15 + 8);
    long long v20 = *a1;
    uint64_t v19 = a1[1];
    if (v19 == *a1)
    {
      int64x2_t v22 = vdupq_n_s64((unint64_t)v19);
    }
    else
    {
      do
      {
        uint64_t v21 = *((void *)v19 - 1);
        v19 -= 8;
        *((void *)v15 - 1) = v21;
        v15 -= 8;
        *(void *)uint64_t v19 = 0;
      }
      while (v19 != v20);
      int64x2_t v22 = *(int64x2_t *)a1;
      uint64_t v9 = (char *)v25.i64[1];
      uint64_t v16 = v26;
    }
    *a1 = v15;
    a1[1] = v9;
    int64x2_t v25 = v22;
    uint64_t v23 = a1[2];
    a1[2] = v16;
    uint64_t v26 = v23;
    uint64_t v24 = v22.i64[0];
    uint64_t result = (void *)std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)&v24);
  }
  else
  {
    uint64_t v8 = *a2;
    *(void *)uint64_t v7 = *a2;
    if (v8) {
      uint64_t result = (id)(v8 + 8);
    }
    uint64_t v9 = v7 + 8;
  }
  a1[1] = v9;
  return result;
}

void re::DirectResourceClientReceiver::resolvePayloadChanges(uint64_t a1, uint64_t a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  for (uint64_t i = *(uint64_t **)(a2 + 16); i; uint64_t i = (uint64_t *)*i)
  {
    long long v9 = *((_OWORD *)i + 1);
    uint64_t v5 = i[4];
    uint64_t v10 = v5;
    if (v5) {
      id v6 = (id)(v5 + 8);
    }
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>(a1 + 200, (unsigned __int8 *)&v9, (uint64_t)&v9);
    if (v10) {
  }
    }
  uint64_t v7 = *(unsigned __int8 **)(a2 + 96);
  if (v7)
  {
    uint64_t v8 = (void *)(a1 + 200);
    do
    {
      std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::__erase_unique<re::DirectResourceId>(v8, v7 + 16);
      uint64_t v7 = *(unsigned __int8 **)v7;
    }
    while (v7);
  }
}

BOOL re::DirectResourceClientReceiver::receiveCommit(re::DirectResourceClientReceiver *this, void *a2, re::DirectResourcesCommitQueue *a3)
{
  void v11[4] = *(ArcSharedObject **)MEMORY[0x263EF8340];
  uint64_t v10 = 0;
  if (re::xpc_get_value(a2, &v10)
    && (v11[0] = (ArcSharedObject *)&unk_26FF350F8,
        v11[1] = this,
        v11[3] = (ArcSharedObject *)v11,
        re::load(v10, (uint64_t)v11, &v9),
        std::__function::__value_func<re::DirectMemoryResource * ()(re::DirectResourceId const&)>::~__value_func[abi:nn180100](v11),
        v9))
  {
    re::DirectResourceClientReceiver::validateAndResolve((uint64_t)this, (uint64_t)&v9, v11);
    BOOL v5 = v11[0] != 0;
    if (v11[0])
    {
      uint64_t v8 = v11[0];
      id v6 = (char *)v11[0] + 8;
      re::DirectResourcesCommitQueue::enqueueCommit_threadSafe((uint64_t)a3, &v8);
      if (v8) {

      }
      if (v11[0]) {
    }
      }
    if (v9) {
  }
    }
  else
  {
    BOOL v5 = 0;
  }
  if (v10) {

  }
  return v5;
}

uint64_t re::DirectResourceClientReceiver::validateAndResolve@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, ArcSharedObject **a3@<X8>)
{
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  id v6 = (uint64_t *)(a1 + 16);
  kdebug_trace();
  if (re::DirectResourceClientReceiver::isValid((void *)a1, a2))
  {
    re::DirectResourceClientReceiver::resolvePayloadChanges(a1, *(void *)a2 + 520);
    re::make::shared::object<re::DirectResourcesResolvedCommit,unsigned long long const&,unsigned long long>((uint64_t *)(a1 + 16), (uint64_t *)(*(void *)a2 + 16), a3);
    re::DirectResourceEvent::operator=((xpc_object_t *)*a3 + 5, (xpc_object_t *)(*(void *)a2 + 32));
    re::XPCObject::setValue((xpc_object_t *)*a3 + 4, *(xpc_object_t *)(*(void *)a2 + 24));
    re::DirectResourceClientReceiver::resolve<re::DirectMesh,re::DirectMeshUpdate>(a1, (void *)(*(void *)a2 + 40), (void *)(a1 + 40), (uint64_t)&v13);
    uint64_t v7 = *a3;
    std::vector<re::SharedPtr<re::DirectMesh>>::__vdeallocate((uint64_t *)*a3 + 6);
    *((_OWORD *)v7 + 3) = v13;
    *((void *)v7 + 8) = v14;
    uint64_t v14 = 0;
    long long v13 = 0uLL;
    std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__vdeallocate((void *)v7 + 9);
    *(_OWORD *)((char *)v7 + 72) = v15;
    *((void *)v7 + 11) = v16;
    uint64_t v16 = 0;
    long long v15 = 0uLL;
    std::vector<re::SharedPtr<re::DirectMesh>>::__vdeallocate((uint64_t *)v7 + 12);
    *((_OWORD *)v7 + 6) = v17;
    *((void *)v7 + 14) = v18;
    uint64_t v18 = 0;
    long long v17 = 0uLL;
    uint64_t v19 = (void **)&v17;
    std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v19);
    uint64_t v19 = (void **)&v15;
    std::vector<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::__destroy_vector::operator()[abi:nn180100](&v19);
    uint64_t v19 = (void **)&v13;
    std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v19);
    re::DirectResourceClientReceiver::resolve<re::DirectBuffer,re::DirectBufferUpdate>(a1, (void *)(*(void *)a2 + 280), (void *)(a1 + 120), (uint64_t)&v13);
    uint64_t v8 = *a3;
    std::vector<re::SharedPtr<re::DirectMesh>>::__vdeallocate((uint64_t *)*a3 + 24);
    *((_OWORD *)v8 + 12) = v13;
    *((void *)v8 + 26) = v14;
    uint64_t v14 = 0;
    long long v13 = 0uLL;
    std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__vdeallocate((void *)v8 + 27);
    *(_OWORD *)((char *)v8 + 216) = v15;
    *((void *)v8 + 29) = v16;
    uint64_t v16 = 0;
    long long v15 = 0uLL;
    std::vector<re::SharedPtr<re::DirectMesh>>::__vdeallocate((uint64_t *)v8 + 30);
    *((_OWORD *)v8 + 15) = v17;
    *((void *)v8 + 32) = v18;
    uint64_t v18 = 0;
    long long v17 = 0uLL;
    uint64_t v19 = (void **)&v17;
    std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v19);
    uint64_t v19 = (void **)&v15;
    std::vector<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::__destroy_vector::operator()[abi:nn180100](&v19);
    uint64_t v19 = (void **)&v13;
    std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v19);
    re::DirectResourceClientReceiver::resolve<re::DirectTexture,re::DirectTextureUpdate>(a1, (void *)(*(void *)a2 + 160), (void *)(a1 + 80), (uint64_t)&v13);
    uint64_t v9 = (uint64_t *)*a3;
    std::vector<re::SharedPtr<re::DirectMesh>>::__vdeallocate(v9 + 15);
    *(_OWORD *)(v9 + 15) = v13;
    v9[17] = v14;
    uint64_t v14 = 0;
    long long v13 = 0uLL;
    std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__vdeallocate(v9 + 18);
    *((_OWORD *)v9 + 9) = v15;
    v9[20] = v16;
    uint64_t v16 = 0;
    long long v15 = 0uLL;
    std::vector<re::SharedPtr<re::DirectMesh>>::__vdeallocate(v9 + 21);
    *(_OWORD *)(v9 + 21) = v17;
    v9[23] = v18;
    uint64_t v18 = 0;
    long long v17 = 0uLL;
    uint64_t v19 = (void **)&v17;
    std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v19);
    uint64_t v19 = (void **)&v15;
    std::vector<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::__destroy_vector::operator()[abi:nn180100](&v19);
    uint64_t v19 = (void **)&v13;
    std::vector<re::SharedPtr<re::DirectBuffer>>::__destroy_vector::operator()[abi:nn180100](&v19);
  }
  else
  {
    uint64_t v10 = (re *)kdebug_trace();
    uint64_t v11 = re::directResourceLog(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      re::DirectResourceClientReceiver::validateAndResolve(v6, v11);
    }
    *a3 = 0;
  }
  return kdebug_trace();
}

uint64_t re::DirectResourceClientReceiver::isValid(void *a1, uint64_t a2)
{
  if (!re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>((uint64_t)a1, (void *)(*(void *)a2 + 40), a1 + 5)|| !re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>((uint64_t)a1, (void *)(*(void *)a2 + 160), a1 + 10))
  {
    return 0;
  }
  uint64_t v4 = (void *)(*(void *)a2 + 280);

  return re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>((uint64_t)a1, v4, a1 + 15);
}

void re::DirectResourceClientReceiver::resolve<re::DirectMesh,re::DirectMeshUpdate>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  *(void *)(a4 + 64) = 0;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  std::vector<re::SharedPtr<re::DirectMesh>>::reserve((char **)a4, a2[3]);
  uint64_t v8 = (void *)(a4 + 24);
  std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::reserve((void *)(a4 + 24), a2[8]);
  std::vector<re::SharedPtr<re::DirectMesh>>::reserve((char **)(a4 + 48), a2[13]);
  for (uint64_t i = (uint64_t *)a2[2]; i; uint64_t i = (uint64_t *)*i)
  {
    uint64_t v10 = i[4];
    *(void *)(v10 + 32) = *(void *)(a1 + 16);
    re::DirectMesh::attachToDevice(v10, *(void **)(a1 + 32));
    *(_OWORD *)uu2 = *((_OWORD *)i + 1);
    uint64_t v11 = (_OWORD *)i[4];
    uint64_t v32 = v11;
    if (v11) {
      uint64_t v12 = (char *)v11 + 8;
    }
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>((uint64_t)a3, uu2, (uint64_t)uu2);
    if (v32) {

    }
    std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)a4, i + 4);
  }
  for (j = (uint64_t *)a2[7]; j; j = (uint64_t *)*j)
  {
    uint64_t v14 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a3, (unsigned __int8 *)j + 16);
    if (v14)
    {
      long long v15 = v14;
      (*(void (**)(uint64_t, void, void))(*(void *)j[4] + 80))(j[4], *((void *)v14 + 4), *(void *)(a1 + 32));
      std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>::pair[abi:nn180100]<re::SharedPtr<re::DirectMesh>&,re::SharedPtr<re::DirectMeshUpdate> const&,0>((uint64_t *)&v30, (uint64_t *)v15 + 4, j + 4);
      uint64_t v16 = *(_OWORD **)(a4 + 32);
      unint64_t v17 = *(void *)(a4 + 40);
      if ((unint64_t)v16 >= v17)
      {
        uint64_t v18 = ((uint64_t)v16 - *v8) >> 4;
        unint64_t v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 60) {
          abort();
        }
        uint64_t v20 = v17 - *v8;
        if (v20 >> 3 > v19) {
          unint64_t v19 = v20 >> 3;
        }
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v19;
        }
        uint64_t v34 = a4 + 40;
        int64x2_t v22 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>(a4 + 40, v21);
        uint64_t v23 = &v22[16 * v18];
        *(void *)uu2 = v22;
        *(void *)&uu2[8] = v23;
        unint64_t v33 = &v22[16 * v24];
        *(_OWORD *)uint64_t v23 = v30;
        long long v30 = 0uLL;
        uint64_t v32 = v23 + 16;
        std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__swap_out_circular_buffer((void *)(a4 + 24), uu2);
        uint64_t v25 = *(void *)(a4 + 32);
        std::__split_buffer<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::~__split_buffer((void **)uu2);
        uint64_t v26 = *((void *)&v30 + 1);
        *(void *)(a4 + 32) = v25;
        if (v26)
        {

          *((void *)&v30 + 1) = 0;
        }
      }
      else
      {
        _OWORD *v16 = v30;
        long long v30 = 0uLL;
        *(void *)(a4 + 32) = v16 + 1;
      }
      if ((void)v30) {
    }
      }
  }
  for (k = (unsigned __int8 *)a2[12]; k; k = *(unsigned __int8 **)k)
  {
    uint64_t v28 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a3, k + 16);
    if (v28)
    {
      long long v29 = (uint64_t *)v28;
      std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)(a4 + 48), (uint64_t *)v28 + 4);
      std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::erase(a3, v29);
    }
  }
}

void re::DirectResourceClientReceiver::resolve<re::DirectBuffer,re::DirectBufferUpdate>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  *(void *)(a4 + 64) = 0;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  std::vector<re::SharedPtr<re::DirectMesh>>::reserve((char **)a4, a2[3]);
  uint64_t v8 = (void *)(a4 + 24);
  std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::reserve((void *)(a4 + 24), a2[8]);
  std::vector<re::SharedPtr<re::DirectMesh>>::reserve((char **)(a4 + 48), a2[13]);
  for (uint64_t i = (uint64_t *)a2[2]; i; uint64_t i = (uint64_t *)*i)
  {
    uint64_t v10 = i[4];
    *(void *)(v10 + 32) = *(void *)(a1 + 16);
    re::DirectBuffer::attachToDevice(v10, *(void **)(a1 + 32));
    *(_OWORD *)uu2 = *((_OWORD *)i + 1);
    uint64_t v11 = (_OWORD *)i[4];
    uint64_t v32 = v11;
    if (v11) {
      uint64_t v12 = (char *)v11 + 8;
    }
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>((uint64_t)a3, uu2, (uint64_t)uu2);
    if (v32) {

    }
    std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)a4, i + 4);
  }
  for (j = (uint64_t *)a2[7]; j; j = (uint64_t *)*j)
  {
    uint64_t v14 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a3, (unsigned __int8 *)j + 16);
    if (v14)
    {
      long long v15 = v14;
      (*(void (**)(uint64_t, void, void))(*(void *)j[4] + 80))(j[4], *((void *)v14 + 4), *(void *)(a1 + 32));
      std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>::pair[abi:nn180100]<re::SharedPtr<re::DirectMesh>&,re::SharedPtr<re::DirectMeshUpdate> const&,0>((uint64_t *)&v30, (uint64_t *)v15 + 4, j + 4);
      uint64_t v16 = *(_OWORD **)(a4 + 32);
      unint64_t v17 = *(void *)(a4 + 40);
      if ((unint64_t)v16 >= v17)
      {
        uint64_t v18 = ((uint64_t)v16 - *v8) >> 4;
        unint64_t v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 60) {
          abort();
        }
        uint64_t v20 = v17 - *v8;
        if (v20 >> 3 > v19) {
          unint64_t v19 = v20 >> 3;
        }
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v19;
        }
        uint64_t v34 = a4 + 40;
        int64x2_t v22 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>(a4 + 40, v21);
        uint64_t v23 = &v22[16 * v18];
        *(void *)uu2 = v22;
        *(void *)&uu2[8] = v23;
        unint64_t v33 = &v22[16 * v24];
        *(_OWORD *)uint64_t v23 = v30;
        long long v30 = 0uLL;
        uint64_t v32 = v23 + 16;
        std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__swap_out_circular_buffer((void *)(a4 + 24), uu2);
        uint64_t v25 = *(void *)(a4 + 32);
        std::__split_buffer<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::~__split_buffer((void **)uu2);
        uint64_t v26 = *((void *)&v30 + 1);
        *(void *)(a4 + 32) = v25;
        if (v26)
        {

          *((void *)&v30 + 1) = 0;
        }
      }
      else
      {
        _OWORD *v16 = v30;
        long long v30 = 0uLL;
        *(void *)(a4 + 32) = v16 + 1;
      }
      if ((void)v30) {
    }
      }
  }
  for (k = (unsigned __int8 *)a2[12]; k; k = *(unsigned __int8 **)k)
  {
    uint64_t v28 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a3, k + 16);
    if (v28)
    {
      long long v29 = (uint64_t *)v28;
      std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)(a4 + 48), (uint64_t *)v28 + 4);
      std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::erase(a3, v29);
    }
  }
}

void re::DirectResourceClientReceiver::resolve<re::DirectTexture,re::DirectTextureUpdate>(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  *(void *)(a4 + 64) = 0;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  *(_OWORD *)(a4 + 48) = 0u;
  std::vector<re::SharedPtr<re::DirectMesh>>::reserve((char **)a4, a2[3]);
  uint64_t v8 = (void *)(a4 + 24);
  std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::reserve((void *)(a4 + 24), a2[8]);
  std::vector<re::SharedPtr<re::DirectMesh>>::reserve((char **)(a4 + 48), a2[13]);
  for (uint64_t i = (uint64_t *)a2[2]; i; uint64_t i = (uint64_t *)*i)
  {
    uint64_t v10 = i[4];
    *(void *)(v10 + 32) = *(void *)(a1 + 16);
    re::DirectTexture::attachToDevice(v10, *(void **)(a1 + 32));
    *(_OWORD *)uu2 = *((_OWORD *)i + 1);
    uint64_t v11 = (_OWORD *)i[4];
    uint64_t v32 = v11;
    if (v11) {
      uint64_t v12 = (char *)v11 + 8;
    }
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>((uint64_t)a3, uu2, (uint64_t)uu2);
    if (v32) {

    }
    std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)a4, i + 4);
  }
  for (j = (uint64_t *)a2[7]; j; j = (uint64_t *)*j)
  {
    uint64_t v14 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a3, (unsigned __int8 *)j + 16);
    if (v14)
    {
      long long v15 = v14;
      (*(void (**)(uint64_t, void, void))(*(void *)j[4] + 80))(j[4], *((void *)v14 + 4), *(void *)(a1 + 32));
      std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>::pair[abi:nn180100]<re::SharedPtr<re::DirectMesh>&,re::SharedPtr<re::DirectMeshUpdate> const&,0>((uint64_t *)&v30, (uint64_t *)v15 + 4, j + 4);
      uint64_t v16 = *(_OWORD **)(a4 + 32);
      unint64_t v17 = *(void *)(a4 + 40);
      if ((unint64_t)v16 >= v17)
      {
        uint64_t v18 = ((uint64_t)v16 - *v8) >> 4;
        unint64_t v19 = v18 + 1;
        if ((unint64_t)(v18 + 1) >> 60) {
          abort();
        }
        uint64_t v20 = v17 - *v8;
        if (v20 >> 3 > v19) {
          unint64_t v19 = v20 >> 3;
        }
        if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
          unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v21 = v19;
        }
        uint64_t v34 = a4 + 40;
        int64x2_t v22 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>(a4 + 40, v21);
        uint64_t v23 = &v22[16 * v18];
        *(void *)uu2 = v22;
        *(void *)&uu2[8] = v23;
        unint64_t v33 = &v22[16 * v24];
        *(_OWORD *)uint64_t v23 = v30;
        long long v30 = 0uLL;
        uint64_t v32 = v23 + 16;
        std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__swap_out_circular_buffer((void *)(a4 + 24), uu2);
        uint64_t v25 = *(void *)(a4 + 32);
        std::__split_buffer<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::~__split_buffer((void **)uu2);
        uint64_t v26 = *((void *)&v30 + 1);
        *(void *)(a4 + 32) = v25;
        if (v26)
        {

          *((void *)&v30 + 1) = 0;
        }
      }
      else
      {
        _OWORD *v16 = v30;
        long long v30 = 0uLL;
        *(void *)(a4 + 32) = v16 + 1;
      }
      if ((void)v30) {
    }
      }
  }
  for (k = (unsigned __int8 *)a2[12]; k; k = *(unsigned __int8 **)k)
  {
    uint64_t v28 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a3, k + 16);
    if (v28)
    {
      long long v29 = (uint64_t *)v28;
      std::vector<re::SharedPtr<re::DirectMesh>>::push_back[abi:nn180100]((char **)(a4 + 48), (uint64_t *)v28 + 4);
      std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::erase(a3, v29);
    }
  }
}

uint64_t re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 24));
  BOOL v5 = (uint64_t *)a2[2];
  if (v5)
  {
    while (1)
    {
      *(_OWORD *)uu2 = *((_OWORD *)v5 + 1);
      uint64_t v6 = v5[4];
      uint64_t v25 = v6;
      if (v6) {
        id v7 = (id)(v6 + 8);
      }
      uint64_t v8 = (re *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>(a3, uu2);
      if (v8) {
        break;
      }
      if (v25) {

      }
      BOOL v5 = (uint64_t *)*v5;
      if (!v5) {
        goto LABEL_8;
      }
    }
    unint64_t v19 = re::directResourceLog(v8);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>((re *)uu2);
    }
  }
  else
  {
LABEL_8:
    uint64_t v9 = (uint64_t *)a2[7];
    if (v9)
    {
      while (1)
      {
        *(_OWORD *)uu2 = *((_OWORD *)v9 + 1);
        uint64_t v10 = v9[4];
        uint64_t v25 = v10;
        if (v10) {
          id v11 = (id)(v10 + 8);
        }
        uint64_t v23 = 0;
        uint64_t v12 = (uint64_t *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>(a3, uu2);
        if (v12
          || (uint64_t v12 = (uint64_t *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>(a2, uu2)) != 0)
        {
          re::SharedPtr<re::DirectBuffer>::reset(&v23, v12[4]);
        }
        if (!v23) {
          break;
        }
        long long v13 = (re *)(*(uint64_t (**)(uint64_t))(*(void *)v25 + 72))(v25);
        if ((v13 & 1) == 0)
        {
          unint64_t v21 = re::directResourceLog(v13);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>((re *)uu2);
          }
          goto LABEL_40;
        }
        if (v23) {

        }
        if (v25) {
        uint64_t v9 = (uint64_t *)*v9;
        }
        if (!v9) {
          goto LABEL_21;
        }
      }
      uint64_t v20 = re::directResourceLog((re *)v12);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>((re *)uu2);
      }
    }
    else
    {
LABEL_21:
      uint64_t v14 = (uint64_t *)a2[12];
      if (!v14) {
        return 1;
      }
      while (1)
      {
        *(_OWORD *)uu2 = *((_OWORD *)v14 + 1);
        uint64_t v15 = v14[4];
        uint64_t v25 = v15;
        if (v15) {
          id v16 = (id)(v15 + 8);
        }
        uint64_t v23 = 0;
        unint64_t v17 = (uint64_t *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>(a3, uu2);
        if (v17
          || (unint64_t v17 = (uint64_t *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>(a2, uu2)) != 0)
        {
          re::SharedPtr<re::DirectBuffer>::reset(&v23, v17[4]);
        }
        if (!v23) {
          break;
        }

        if (v25) {
        uint64_t v14 = (uint64_t *)*v14;
        }
        if (!v14) {
          return 1;
        }
      }
      int64x2_t v22 = re::directResourceLog((re *)v17);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>((re *)uu2);
      }
    }
LABEL_40:
    if (v23) {
  }
    }
  if (v25) {

  }
  return 0;
}

void std::vector<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v1 = *a1;
  dispatch_object_t v2 = **a1;
  if (v2)
  {
    uint64_t v4 = v1[1];
    BOOL v5 = **a1;
    if (v4 != v2)
    {
      do
      {
        v4 -= 2;
        std::allocator<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::destroy[abi:nn180100]((uint64_t)(v1 + 2), v4);
      }
      while (v4 != v2);
      BOOL v5 = **a1;
    }
    v1[1] = v2;
    operator delete(v5);
  }
}

void std::allocator<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::destroy[abi:nn180100](uint64_t a1, void *a2)
{
  uint64_t v3 = a2[1];
  if (v3)
  {

    a2[1] = 0;
  }
  if (*a2)
  {

    *a2 = 0;
  }
}

uint64_t std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMemoryResource>>::pair[abi:nn180100]<unsigned char const(&)[16],re::SharedPtr<re::DirectMemoryResource> const&,0>(uint64_t a1, const unsigned __int8 *a2, uint64_t *a3)
{
  uuid_copy((unsigned __int8 *)a1, a2);
  uint64_t v5 = *a3;
  *(void *)(a1 + 16) = *a3;
  if (v5) {
    id v6 = (id)(v5 + 8);
  }
  return a1;
}

void std::vector<re::SharedPtr<re::DirectMesh>>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<re::SharedPtr<re::DirectBuffer>>::__clear[abi:nn180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__vdeallocate(void *a1)
{
  uint64_t v1 = (void *)*a1;
  if (*a1)
  {
    uint64_t v3 = (void *)a1[1];
    uint64_t v4 = (void *)*a1;
    if (v3 != v1)
    {
      do
      {
        v3 -= 2;
        std::allocator<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::destroy[abi:nn180100]((uint64_t)(a1 + 2), v3);
      }
      while (v3 != v1);
      uint64_t v4 = (void *)*a1;
    }
    a1[1] = v1;
    operator delete(v4);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

uint64_t std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
  dispatch_object_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__deallocate_node(int a1, void *__p)
{
  if (__p)
  {
    dispatch_object_t v2 = __p;
    do
    {
      uint64_t v3 = (void *)*v2;
      uint64_t v4 = v2[4];
      if (v4) {

      }
      operator delete(v2);
      dispatch_object_t v2 = v3;
    }
    while (v3);
  }
}

void std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__deallocate_node(a1, *(void **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

const unsigned __int8 *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::find<re::DirectResourceId>(void *a1, unsigned __int8 *uu2)
{
  int8x8_t v2 = (int8x8_t)a1[1];
  if (!*(void *)&v2) {
    return 0;
  }
  unint64_t v4 = (*((void *)uu2 + 1) + (*(void *)uu2 << 6) + (*(void *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(void *)uu2;
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v2);
  v5.i16[0] = vaddlv_u8(v5);
  unint64_t v6 = v5.u32[0];
  if (v5.u32[0] > 1uLL)
  {
    uint64_t v7 = (*((void *)uu2 + 1) + (*(void *)uu2 << 6) + (*(void *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(void *)uu2;
    if (v4 >= *(void *)&v2) {
      uint64_t v7 = v4 % *(void *)&v2;
    }
  }
  else
  {
    uint64_t v7 = v4 & (*(void *)&v2 - 1);
  }
  uint64_t v8 = *(const unsigned __int8 ***)(*a1 + 8 * v7);
  if (!v8) {
    return 0;
  }
  for (uint64_t i = *v8; i; uint64_t i = *(const unsigned __int8 **)i)
  {
    unint64_t v10 = *((void *)i + 1);
    if (v4 == v10)
    {
      if (!uuid_compare(i + 16, uu2)) {
        return i;
      }
    }
    else
    {
      if (v6 > 1)
      {
        if (v10 >= *(void *)&v2) {
          v10 %= *(void *)&v2;
        }
      }
      else
      {
        v10 &= *(void *)&v2 - 1;
      }
      if (v10 != v7) {
        return 0;
      }
    }
  }
  return i;
}

void *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,re::SharedPtr<re::DirectMesh>>>(uint64_t a1, unsigned __int8 *uu2, uint64_t a3)
{
  unint64_t v6 = (*((void *)uu2 + 1) + (*(void *)uu2 << 6) + (*(void *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(void *)uu2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v9.i16[0] = vaddlv_u8(v9);
    unint64_t v10 = v9.u32[0];
    if (v9.u32[0] > 1uLL)
    {
      uint64_t v3 = (*((void *)uu2 + 1) + (*(void *)uu2 << 6) + (*(void *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(void *)uu2;
      if (v6 >= v7) {
        uint64_t v3 = v6 % v7;
      }
    }
    else
    {
      uint64_t v3 = v6 & (v7 - 1);
    }
    id v11 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      for (uint64_t i = *v11; i; uint64_t i = *(void **)i)
      {
        unint64_t v13 = *((void *)i + 1);
        if (v13 == v6)
        {
          if (!uuid_compare((const unsigned __int8 *)i + 16, uu2)) {
            return i;
          }
        }
        else
        {
          if (v10 > 1)
          {
            if (v13 >= v7) {
              v13 %= v7;
            }
          }
          else
          {
            v13 &= v7 - 1;
          }
          if (v13 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x28uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v6;
  *((_OWORD *)i + 1) = *(_OWORD *)a3;
  *((void *)i + 4) = *(void *)(a3 + 16);
  *(void *)(a3 + 16) = 0;
  float v14 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v15 = *(float *)(a1 + 32);
  if (!v7 || (float)(v15 * (float)v7) < v14)
  {
    BOOL v16 = 1;
    if (v7 >= 3) {
      BOOL v16 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v17 = v16 | (2 * v7);
    unint64_t v18 = vcvtps_u32_f32(v14 / v15);
    if (v17 <= v18) {
      size_t v19 = v18;
    }
    else {
      size_t v19 = v17;
    }
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__rehash<true>(a1, v19);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        uint64_t v3 = v6 % v7;
      }
      else {
        uint64_t v3 = v6;
      }
    }
    else
    {
      uint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v20 = *(void *)a1;
  unint64_t v21 = *(void **)(*(void *)a1 + 8 * v3);
  if (v21)
  {
    *(void *)uint64_t i = *v21;
LABEL_38:
    *unint64_t v21 = i;
    goto LABEL_39;
  }
  *(void *)uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v20 + 8 * v3) = a1 + 16;
  if (*(void *)i)
  {
    unint64_t v22 = *(void *)(*(void *)i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v22 >= v7) {
        v22 %= v7;
      }
    }
    else
    {
      v22 &= v7 - 1;
    }
    unint64_t v21 = (void *)(*(void *)a1 + 8 * v22);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

void std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  if (__n == 1)
  {
    size_t prime = 2;
  }
  else
  {
    size_t prime = __n;
    if ((__n & (__n - 1)) != 0) {
      size_t prime = std::__next_prime(__n);
    }
  }
  int8x8_t v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(void *)&v4) {
    goto LABEL_16;
  }
  if (prime < *(void *)&v4)
  {
    unint64_t v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(void *)&v4 < 3uLL || (uint8x8_t v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      unint64_t v5 = std::__next_prime(v5);
    }
    else
    {
      uint64_t v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2) {
        unint64_t v5 = v7;
      }
    }
    if (prime <= v5) {
      size_t prime = v5;
    }
    if (prime < *(void *)&v4)
    {
LABEL_16:
      std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__do_rehash<true>(a1, prime);
    }
  }
}

void std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  if (a2)
  {
    if (a2 >> 61) {
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
    int8x8_t v4 = operator new(8 * a2);
    unint64_t v5 = *(void **)a1;
    *(void *)a1 = v4;
    if (v5) {
      operator delete(v5);
    }
    uint64_t v6 = 0;
    *(void *)(a1 + 8) = a2;
    do
      *(void *)(*(void *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    uint64_t v7 = *(void **)(a1 + 16);
    if (v7)
    {
      unint64_t v8 = v7[1];
      uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2) {
          v8 %= a2;
        }
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(void *)(*(void *)a1 + 8 * v8) = a1 + 16;
      id v11 = (void *)*v7;
      if (*v7)
      {
        do
        {
          unint64_t v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2) {
              v12 %= a2;
            }
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(void *)(*(void *)a1 + 8 * v12))
            {
              *(void *)(*(void *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            void *v7 = *v11;
            *id v11 = **(void **)(*(void *)a1 + 8 * v12);
            **(void **)(*(void *)a1 + 8 * v12) = v11;
            id v11 = v7;
          }
          unint64_t v12 = v8;
LABEL_24:
          uint64_t v7 = v11;
          id v11 = (void *)*v11;
          unint64_t v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    unint64_t v10 = *(void **)a1;
    *(void *)a1 = 0;
    if (v10) {
      operator delete(v10);
    }
    *(void *)(a1 + 8) = 0;
  }
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,void *>>>::operator()[abi:nn180100](uint64_t a1, void *__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v3 = __p[4];
    if (v3) {
  }
    }
  else if (!__p)
  {
    return;
  }

  operator delete(__p);
}

uint64_t *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::__erase_unique<re::DirectResourceId>(void *a1, unsigned __int8 *a2)
{
  uint64_t result = (uint64_t *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

uint64_t std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::erase(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::remove(a1, a2, (uint64_t)&__p);
  uint64_t v3 = __p;
  __p = 0;
  if (v3) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,void *>>>::operator()[abi:nn180100]((uint64_t)&v6, v3);
  }
  return v2;
}

void *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::remove@<X0>(void *result@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3 = (int8x8_t)result[1];
  unint64_t v4 = a2[1];
  uint8x8_t v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(void *)&v3) {
      v4 %= *(void *)&v3;
    }
  }
  else
  {
    v4 &= *(void *)&v3 - 1;
  }
  uint64_t v6 = *(void **)(*result + 8 * v4);
  do
  {
    uint64_t v7 = v6;
    uint64_t v6 = (void *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2) {
    goto LABEL_18;
  }
  unint64_t v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(void *)&v3) {
      v8 %= *(void *)&v3;
    }
  }
  else
  {
    v8 &= *(void *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2) {
      goto LABEL_19;
    }
    unint64_t v9 = *(void *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(void *)&v3) {
        v9 %= *(void *)&v3;
      }
    }
    else
    {
      v9 &= *(void *)&v3 - 1;
    }
    if (v9 != v4) {
LABEL_19:
    }
      *(void *)(*result + 8 * v4) = 0;
  }
  uint64_t v10 = *a2;
  if (*a2)
  {
    unint64_t v11 = *(void *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(void *)&v3) {
        v11 %= *(void *)&v3;
      }
    }
    else
    {
      v11 &= *(void *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(void *)(*result + 8 * v11) = v7;
      uint64_t v10 = *a2;
    }
  }
  void *v7 = v10;
  *a2 = 0;
  --result[3];
  *(void *)a3 = a2;
  *(void *)(a3 + 8) = result + 2;
  *(unsigned char *)(a3 + 16) = 1;
  return result;
}

void *std::__function::__func<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0,std::allocator<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0>,void ()(re::DirectFence*)>::~__func(void *a1)
{
  *a1 = &unk_26FF34FD8;
  uint64_t v2 = a1[1];
  if (v2)
  {

    a1[1] = 0;
  }
  return a1;
}

void std::__function::__func<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0,std::allocator<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0>,void ()(re::DirectFence*)>::~__func(void *a1)
{
  *a1 = &unk_26FF34FD8;
  uint64_t v2 = a1[1];
  if (v2)
  {

    a1[1] = 0;
  }

  JUMPOUT(0x2533130A0);
}

void *std::__function::__func<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0,std::allocator<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0>,void ()(re::DirectFence*)>::__clone(uint64_t a1)
{
  uint64_t v2 = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t v2 = &unk_26FF34FD8;
  v2[1] = v3;
  if (v3) {
    id v4 = (id)(v3 + 8);
  }
  return v2;
}

void *std::__function::__func<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0,std::allocator<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0>,void ()(re::DirectFence*)>::__clone(void *result, void *a2)
{
  uint64_t v2 = result[1];
  *a2 = &unk_26FF34FD8;
  a2[1] = v2;
  if (v2) {
    return (id)(v2 + 8);
  }
  return result;
}

void std::__function::__func<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0,std::allocator<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0>,void ()(re::DirectFence*)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 8);
  if (v1)
  {

    *(void *)(a1 + 8) = 0;
  }
}

void std::__function::__func<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0,std::allocator<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0>,void ()(re::DirectFence*)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = __p[1];
  if (v2) {

  }
  operator delete(__p);
}

void std::__function::__func<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0,std::allocator<re::DirectResourcesPendingCommit::addFence(re::UnownedPtr<re::DirectFence>)::$_0>,void ()(re::DirectFence*)>::operator()(uint64_t a1, re::DirectFence **a2)
{
}

void std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100](void ***a1)
{
  uint64_t v2 = *a1;
  if (*v2)
  {
    std::vector<re::DirectResourcesReuseList::Entry>::__clear[abi:nn180100]((uint64_t *)v2);
    uint64_t v3 = **a1;
    operator delete(v3);
  }
}

void std::vector<re::DirectResourcesReuseList::Entry>::__clear[abi:nn180100](uint64_t *a1)
{
  uint64_t v2 = *a1;
  for (uint64_t i = a1[1]; i != v2; i -= 56)
  {
    uint64_t v4 = *(void *)(i - 8);
    if (v4)
    {

      *(void *)(i - 8) = 0;
    }
  }
  a1[1] = v2;
}

void std::vector<re::DirectResourcesReuseList::Entry>::__vdeallocate(uint64_t *a1)
{
  if (*a1)
  {
    std::vector<re::DirectResourcesReuseList::Entry>::__clear[abi:nn180100](a1);
    operator delete((void *)*a1);
    *a1 = 0;
    a1[1] = 0;
    a1[2] = 0;
  }
}

void std::vector<re::DirectResourceId>::__append(void *a1, unint64_t a2)
{
  uint64_t v6 = a1[2];
  uint64_t v4 = (uint64_t)(a1 + 2);
  uint64_t v5 = v6;
  uint64_t v7 = *(unsigned __int8 **)(v4 - 8);
  if (a2 <= (v6 - (uint64_t)v7) >> 4)
  {
    if (a2)
    {
      uint64_t v16 = 16 * a2;
      unint64_t v17 = &v7[16 * a2];
      do
      {
        uuid_copy(v7, UUID_NULL);
        v7 += 16;
        v16 -= 16;
      }
      while (v16);
      uint64_t v7 = v17;
    }
    a1[1] = v7;
  }
  else
  {
    uint64_t v8 = (uint64_t)&v7[-*a1];
    unint64_t v9 = a2 + (v8 >> 4);
    if (v9 >> 60) {
      abort();
    }
    uint64_t v10 = v8 >> 4;
    uint64_t v11 = v5 - *a1;
    if (v11 >> 3 > v9) {
      unint64_t v9 = v11 >> 3;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v12 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v9;
    }
    if (v12)
    {
      unint64_t v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>(v4, v12);
      uint64_t v15 = v14;
    }
    else
    {
      unint64_t v13 = 0;
      uint64_t v15 = 0;
    }
    unint64_t v18 = (unsigned __int8 *)&v13[16 * v10];
    size_t v19 = &v18[16 * a2];
    uint64_t v20 = 16 * a2;
    unint64_t v21 = v18;
    do
    {
      uuid_copy(v21, UUID_NULL);
      v21 += 16;
      v20 -= 16;
    }
    while (v20);
    uint64_t v23 = (char *)*a1;
    unint64_t v22 = (char *)a1[1];
    if (v22 != (char *)*a1)
    {
      do
      {
        *((_OWORD *)v18 - 1) = *((_OWORD *)v22 - 1);
        v18 -= 16;
        v22 -= 16;
      }
      while (v22 != v23);
      unint64_t v22 = (char *)*a1;
    }
    *a1 = v18;
    a1[1] = v19;
    a1[2] = &v13[16 * v15];
    if (v22)
    {
      operator delete(v22);
    }
  }
}

void std::__function::__func<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0,std::allocator<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0>,void ()(re::DirectFence *)>::~__func()
{
}

void *std::__function::__func<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0,std::allocator<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0>,void ()(re::DirectFence *)>::__clone()
{
  uint64_t result = operator new(0x10uLL);
  *uint64_t result = &unk_26FF35020;
  return result;
}

void std::__function::__func<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0,std::allocator<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0>,void ()(re::DirectFence *)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FF35020;
}

void std::__function::__func<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0,std::allocator<re::DirectResourceContext::freeListWaitTimedOut(unsigned long long)::$_0>,void ()(re::DirectFence *)>::operator()(re *a1, uint64_t *a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a2;
  uint64_t v3 = re::directResourceLog(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    (*(void (**)(void **__return_ptr, uint64_t))(*(void *)v2 + 24))(__p, v2);
    if (v6 >= 0) {
      uint64_t v4 = __p;
    }
    else {
      uint64_t v4 = (void **)__p[0];
    }
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = v4;
    _os_log_impl(&dword_24CD28000, v3, OS_LOG_TYPE_DEFAULT, "\t\tWaiting for %s", buf, 0xCu);
    if (v6 < 0) {
      operator delete(__p[0]);
    }
  }
}

void *std::__function::__value_func<void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

void *std::__function::__value_func<void ()(re::DirectResourceContext *,unsigned long long)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__deallocate_node(a1, *(id **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__deallocate_node(uint64_t a1, id *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = (id *)*v2;
      objc_destroyWeak(v2 + 4);
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

void std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::clear(uint64_t a1)
{
  if (*(void *)(a1 + 24))
  {
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__deallocate_node(a1, *(id **)(a1 + 16));
    *(void *)(a1 + 16) = 0;
    uint64_t v2 = *(void *)(a1 + 8);
    if (v2)
    {
      for (uint64_t i = 0; i != v2; ++i)
        *(void *)(*(void *)a1 + 8 * i) = 0;
    }
    *(void *)(a1 + 24) = 0;
  }
}

const unsigned __int8 *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__emplace_unique_impl<unsigned char const(&)[16],re::SharedPtr<re::DirectResource> const&>(void *a1, const unsigned __int8 *a2, void *a3)
{
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__construct_node<unsigned char const(&)[16],re::SharedPtr<re::DirectResource> const&>((uint64_t)a1, a2, a3, (uint64_t)v7);
  inserted = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__node_insert_unique(a1, v7[0]);
  if (v5) {
    v7[0] = 0;
  }
  std::unique_ptr<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,void *>>>>::reset[abi:nn180100]((uint64_t)v7, 0);
  return inserted;
}

id std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__construct_node<unsigned char const(&)[16],re::SharedPtr<re::DirectResource> const&>@<X0>(uint64_t a1@<X0>, const unsigned __int8 *a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7 = a1 + 16;
  uint64_t v8 = operator new(0x28uLL);
  *(void *)a4 = v8;
  *(void *)(a4 + 8) = v7;
  *(void *)uint64_t v8 = 0;
  *((void *)v8 + 1) = 0;
  uuid_copy((unsigned __int8 *)v8 + 16, a2);
  if (*a3) {
    uint64_t v9 = (void *)(*a3 + 8);
  }
  else {
    uint64_t v9 = 0;
  }
  id result = objc_initWeak((id *)v8 + 4, v9);
  *(unsigned char *)(a4 + 16) = 1;
  *((void *)v8 + 1) = (*((void *)v8 + 3)
                       + (*((void *)v8 + 2) << 6)
                       + (*((void *)v8 + 2) >> 2)
                       - 0x61C8864680B583E9) ^ *((void *)v8 + 2);
  return result;
}

const unsigned __int8 *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__node_insert_unique(void *a1, uint64_t a2)
{
  uint64_t v2 = (void *)a2;
  uint64_t v4 = (unsigned __int8 *)(a2 + 16);
  unint64_t v5 = (*(void *)(a2 + 24) + (*(void *)(a2 + 16) << 6) + (*(void *)(a2 + 16) >> 2) - 0x61C8864680B583E9) ^ *(void *)(a2 + 16);
  *((void *)v4 - 1) = v5;
  char v6 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__node_insert_unique_prepare[abi:nn180100]((uint64_t)a1, v5, v4);
  if (v6) {
    return v6;
  }
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__node_insert_unique_perform[abi:nn180100](a1, v2);
  return (const unsigned __int8 *)v2;
}

const unsigned __int8 *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__node_insert_unique_prepare[abi:nn180100](uint64_t a1, unint64_t a2, unsigned __int8 *uu2)
{
  unint64_t v4 = *(void *)(a1 + 8);
  if (v4)
  {
    uint8x8_t v7 = (uint8x8_t)vcnt_s8((int8x8_t)v4);
    v7.i16[0] = vaddlv_u8(v7);
    unint64_t v8 = v7.u32[0];
    if (v7.u32[0] > 1uLL) {
      uint64_t v9 = v4 <= a2 ? a2 % v4 : a2;
    }
    else {
      uint64_t v9 = (v4 - 1) & a2;
    }
    uint64_t v10 = *(const unsigned __int8 ***)(*(void *)a1 + 8 * v9);
    if (v10)
    {
      for (uint64_t i = *v10; i; uint64_t i = *(const unsigned __int8 **)i)
      {
        unint64_t v12 = *((void *)i + 1);
        if (v12 == a2)
        {
          if (!uuid_compare(i + 16, uu2)) {
            return i;
          }
        }
        else
        {
          if (v8 > 1)
          {
            if (v12 >= v4) {
              v12 %= v4;
            }
          }
          else
          {
            v12 &= v4 - 1;
          }
          if (v12 != v9) {
            break;
          }
        }
      }
    }
  }
  float v13 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v14 = *(float *)(a1 + 32);
  if (!v4 || (float)(v14 * (float)v4) < v13)
  {
    BOOL v15 = 1;
    if (v4 >= 3) {
      BOOL v15 = (v4 & (v4 - 1)) != 0;
    }
    unint64_t v16 = v15 | (2 * v4);
    unint64_t v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17) {
      size_t v18 = v17;
    }
    else {
      size_t v18 = v16;
    }
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__rehash<true>(a1, v18);
  }
  return 0;
}

void *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__node_insert_unique_perform[abi:nn180100](void *result, void *a2)
{
  int8x8_t v2 = (int8x8_t)result[1];
  unint64_t v3 = a2[1];
  uint8x8_t v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    if (v3 >= *(void *)&v2) {
      v3 %= *(void *)&v2;
    }
  }
  else
  {
    v3 &= *(void *)&v2 - 1;
  }
  unint64_t v5 = *(void **)(*result + 8 * v3);
  if (v5)
  {
    *a2 = *v5;
LABEL_13:
    *unint64_t v5 = a2;
    goto LABEL_14;
  }
  *a2 = result[2];
  result[2] = a2;
  *(void *)(*result + 8 * v3) = result + 2;
  if (*a2)
  {
    unint64_t v6 = *(void *)(*a2 + 8);
    if (v4.u32[0] > 1uLL)
    {
      if (v6 >= *(void *)&v2) {
        v6 %= *(void *)&v2;
      }
    }
    else
    {
      v6 &= *(void *)&v2 - 1;
    }
    unint64_t v5 = (void *)(*result + 8 * v6);
    goto LABEL_13;
  }
LABEL_14:
  ++result[3];
  return result;
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,void *>>>>::reset[abi:nn180100](uint64_t a1, uint64_t a2)
{
  int8x8_t v2 = *(id **)a1;
  *(void *)a1 = a2;
  if (v2)
  {
    if (*(unsigned char *)(a1 + 16)) {
      objc_destroyWeak(v2 + 4);
    }
    operator delete(v2);
  }
}

void *std::__function::__func<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0,std::allocator<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0>,void ()(re::DirectResourceSlot)>::~__func(void *a1)
{
  *a1 = &unk_26FF35068;
  uint64_t v2 = a1[2];
  if (v2)
  {

    a1[2] = 0;
  }
  return a1;
}

void std::__function::__func<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0,std::allocator<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0>,void ()(re::DirectResourceSlot)>::~__func(void *a1)
{
  *a1 = &unk_26FF35068;
  uint64_t v2 = a1[2];
  if (v2)
  {

    a1[2] = 0;
  }

  JUMPOUT(0x2533130A0);
}

void *std::__function::__func<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0,std::allocator<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0>,void ()(re::DirectResourceSlot)>::__clone(uint64_t a1)
{
  uint64_t v2 = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(void *)(a1 + 16);
  *uint64_t v2 = &unk_26FF35068;
  v2[1] = v4;
  v2[2] = v3;
  if (v3) {
    id v5 = (id)(v3 + 8);
  }
  return v2;
}

void *std::__function::__func<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0,std::allocator<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0>,void ()(re::DirectResourceSlot)>::__clone(void *result, void *a2)
{
  uint64_t v3 = result[1];
  uint64_t v2 = result[2];
  *a2 = &unk_26FF35068;
  a2[1] = v3;
  a2[2] = v2;
  if (v2) {
    return (id)(v2 + 8);
  }
  return result;
}

void std::__function::__func<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0,std::allocator<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0>,void ()(re::DirectResourceSlot)>::destroy(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 16);
  if (v1)
  {

    *(void *)(a1 + 16) = 0;
  }
}

void std::__function::__func<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0,std::allocator<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0>,void ()(re::DirectResourceSlot)>::destroy_deallocate(void *__p)
{
  uint64_t v2 = __p[2];
  if (v2) {

  }
  operator delete(__p);
}

void std::__function::__func<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0,std::allocator<re::DirectResourceContext::addResource(re::SharedPtr<re::DirectResource> const&)::$_0>,void ()(re::DirectResourceSlot)>::operator()(uint64_t a1, void *a2)
{
  uint64_t v3 = *(dispatch_queue_t **)(a1 + 8);
  uint64_t v4 = (*(uint64_t (**)(void, void, void))(**(void **)(a1 + 16) + 48))(*(void *)(a1 + 16), *a2, a2[1]);
  if (v4)
  {
    id v5 = *(void **)(a1 + 16);
    uint64_t v7 = v4;
    id v6 = (id)(v4 + 8);
    re::DirectResourceContext::addPayload(v3, v5, &v7);
    if (v7) {
  }
    }
}

void *std::__function::__value_func<void ()(re::DirectResourceSlot)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

unsigned __int8 *std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>>>::__erase_unique<re::DirectResourceId>(void *a1, unsigned __int8 *a2)
{
  id result = (unsigned __int8 *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a1, a2);
  if (result)
  {
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::remove(a1, result, (uint64_t)v4);
    std::unique_ptr<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<re::DirectResourceId,re::ArcWeakPtr<re::DirectResource>>,void *>>>>::reset[abi:nn180100]((uint64_t)v4, 0);
    return (unsigned __int8 *)1;
  }
  return result;
}

void std::__function::__func<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0,std::allocator<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0>,void ()(re::DirectResourceSlot)>::~__func()
{
}

__n128 std::__function::__func<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0,std::allocator<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0>,void ()(re::DirectResourceSlot)>::__clone(uint64_t a1)
{
  uint64_t v2 = (char *)operator new(0x18uLL);
  *(void *)uint64_t v2 = &unk_26FF350B0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(v2 + 8) = result;
  return result;
}

__n128 std::__function::__func<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0,std::allocator<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0>,void ()(re::DirectResourceSlot)>::__clone(uint64_t a1, uint64_t a2)
{
  *(void *)a2 = &unk_26FF350B0;
  __n128 result = *(__n128 *)(a1 + 8);
  *(__n128 *)(a2 + 8) = result;
  return result;
}

void std::__function::__func<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0,std::allocator<re::DirectResourceContext::removeResource(re::DirectResource *)::$_0>,void ()(re::DirectResourceSlot)>::operator()(uint64_t a1, void *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 8);
  uint64_t v3 = (*(uint64_t (**)(void, void, void))(**(void **)(a1 + 16) + 48))(*(void *)(a1 + 16), *a2, a2[1]);
  if (v3)
  {
    uuid_copy(dst, (const unsigned __int8 *)(v3 + 16));
    re::DirectResourceContext::removePayload(v2, (uint64_t)dst);
  }
}

void *std::vector<re::DirectResourceId>::vector(void *a1, uint64_t a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  uint64_t v4 = *(const void **)a2;
  uint64_t v3 = *(void *)(a2 + 8);
  int64_t v5 = v3 - *(void *)a2;
  if (v3 != *(void *)a2)
  {
    std::vector<re::DirectResourceId>::__vallocate[abi:nn180100](a1, v5 >> 4);
    id v6 = (char *)a1[1];
    memmove(v6, v4, v5);
    a1[1] = &v6[v5];
  }
  return a1;
}

char *std::vector<re::DirectResourceId>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >> 60) {
    abort();
  }
  __n128 result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[16 * v4];
  return result;
}

uint64_t std::__function::__value_func<void ()(re::DirectResourceContext *,unsigned long long)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void *std::__function::__value_func<void ()(re::DirectResourceContext *,unsigned long long)>::swap[abi:nn180100](void *result, void *a2)
{
  void v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)result[3];
    int64_t v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        __n128 result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

uint64_t std::__function::__value_func<void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::__value_func[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a2 + 24);
  if (v3)
  {
    if (v3 == a2)
    {
      *(void *)(a1 + 24) = a1;
      (*(void (**)(void, uint64_t))(**(void **)(a2 + 24) + 24))(*(void *)(a2 + 24), a1);
    }
    else
    {
      *(void *)(a1 + 24) = (*(uint64_t (**)(uint64_t))(*(void *)v3 + 16))(v3);
    }
  }
  else
  {
    *(void *)(a1 + 24) = 0;
  }
  return a1;
}

void *std::__function::__value_func<void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::swap[abi:nn180100](void *result, void *a2)
{
  void v6[3] = *MEMORY[0x263EF8340];
  if (a2 != result)
  {
    uint64_t v3 = result;
    uint64_t v4 = (void *)result[3];
    int64_t v5 = (void *)a2[3];
    if (v4 == result)
    {
      if (v5 == a2)
      {
        (*(void (**)(void *, void *))(*result + 24))(result, v6);
        (*(void (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = 0;
        (*(void (**)(void, void *))(*(void *)a2[3] + 24))(a2[3], v3);
        (*(void (**)(void))(*(void *)a2[3] + 32))(a2[3]);
        a2[3] = 0;
        v3[3] = v3;
        (*(void (**)(void *, void *))(v6[0] + 24))(v6, a2);
        __n128 result = (void *)(*(uint64_t (**)(void *))(v6[0] + 32))(v6);
      }
      else
      {
        (*(void (**)(void *, void *))(*result + 24))(result, a2);
        __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)v3[3] + 32))(v3[3]);
        v3[3] = a2[3];
      }
      a2[3] = a2;
    }
    else if (v5 == a2)
    {
      (*(void (**)(void *, void *))(*a2 + 24))(a2, result);
      __n128 result = (void *)(*(uint64_t (**)(void))(*(void *)a2[3] + 32))(a2[3]);
      a2[3] = v3[3];
      v3[3] = v3;
    }
    else
    {
      result[3] = v5;
      a2[3] = v4;
    }
  }
  return result;
}

uint64_t *std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::__insert_with_size[abi:nn180100]<std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit>*>>(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t *a4, uint64_t a5)
{
  uint64_t v5 = *a1;
  uint64_t v6 = a2 - *a1;
  uint64_t v7 = (uint64_t *)(*a1 + (v6 & 0xFFFFFFFFFFFFFFF8));
  if (a5 < 1) {
    return v7;
  }
  uint64_t v9 = a3;
  uint64_t v11 = v6 >> 3;
  uint64_t v14 = a1[2];
  uint64_t v12 = (uint64_t)(a1 + 2);
  uint64_t v13 = v14;
  unint64_t v15 = *(void *)(v12 - 8);
  if (a5 > (uint64_t)(v14 - v15) >> 3)
  {
    unint64_t v16 = a5 + ((uint64_t)(v15 - v5) >> 3);
    if (v16 >> 61) {
      abort();
    }
    uint64_t v17 = v13 - v5;
    if (v17 >> 2 > v16) {
      unint64_t v16 = v17 >> 2;
    }
    if ((unint64_t)v17 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v18 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v18 = v16;
    }
    v44[4] = v12;
    if (v18) {
      size_t v19 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(v12, v18);
    }
    else {
      size_t v19 = 0;
    }
    uint64_t v36 = (uint64_t *)&v19[8 * v11];
    v44[0] = v19;
    v44[1] = v36;
    v44[3] = &v19[8 * v18];
    uint64_t v37 = 8 * a5;
    uint64_t v38 = &v36[a5];
    do
    {
      uint64_t v39 = *v9;
      *uint64_t v36 = *v9;
      if (v39) {
        id v40 = (id)(v39 + 8);
      }
      ++v36;
      ++v9;
      v37 -= 8;
    }
    while (v37);
    v44[2] = v38;
    uint64_t v7 = (uint64_t *)std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::__swap_out_circular_buffer(a1, v44, v7);
    std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)v44);
    return v7;
  }
  uint64_t v20 = (uint64_t)(v15 - (void)v7) >> 3;
  if (v20 >= a5)
  {
    uint64_t v27 = &a3[a5];
    uint64_t v23 = *(void **)(v12 - 8);
    goto LABEL_20;
  }
  uint64_t v43 = v11;
  unint64_t v22 = &a3[v20];
  uint64_t v42 = v22;
  uint64_t v23 = *(void **)(v12 - 8);
  if (v22 != a4)
  {
    uint64_t v24 = *(uint64_t **)(v12 - 8);
    do
    {
      uint64_t v25 = *v22;
      *uint64_t v24 = *v22;
      if (v25) {
        id v26 = (id)(v25 + 8);
      }
      ++v22;
      ++v24;
      ++v23;
    }
    while (v22 != a4);
  }
  a1[1] = (uint64_t)v23;
  if ((uint64_t)(v15 - (void)v7) >= 1)
  {
    uint64_t v27 = v42;
    uint64_t v11 = v43;
LABEL_20:
    uint64_t v28 = &v7[a5];
    long long v29 = &v23[-a5];
    long long v30 = v23;
    if ((unint64_t)v29 < v15)
    {
      long long v30 = v23;
      do
      {
        *v30++ = *v29;
        *v29++ = 0;
      }
      while ((unint64_t)v29 < v15);
    }
    a1[1] = (uint64_t)v30;
    if (v23 != v28)
    {
      uint64_t v31 = v23 - v28;
      uint64_t v32 = v23 - 1;
      uint64_t v33 = 8 * v31;
      uint64_t v34 = v5 + 8 * v11 - 8;
      do
      {
        uint64_t v35 = *v32;
        *v32-- = *(void *)(v34 + v33);
        *(void *)(v34 + v33) = v35;
        v33 -= 8;
      }
      while (v33);
    }
    std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit> *>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit> *>,re::SharedPtr<re::DirectResourcesResolvedCommit> *,0>(v9, v27, v7);
  }
  return v7;
}

uint64_t std::vector<re::SharedPtr<re::DirectResourcesResolvedCommit>>::__swap_out_circular_buffer(void *a1, void *a2, void *a3)
{
  uint64_t result = a2[1];
  uint64_t v5 = (void *)*a1;
  uint64_t v6 = result;
  if ((void *)*a1 != a3)
  {
    uint64_t v7 = a3;
    uint64_t v6 = a2[1];
    do
    {
      uint64_t v8 = *--v7;
      *(void *)(v6 - 8) = v8;
      v6 -= 8;
      void *v7 = 0;
    }
    while (v7 != v5);
  }
  a2[1] = v6;
  uint64_t v9 = (void *)a1[1];
  uint64_t v10 = (void *)a2[2];
  if (v9 != a3)
  {
    do
    {
      *v10++ = *a3;
      *a3++ = 0;
    }
    while (a3 != v9);
    uint64_t v6 = a2[1];
  }
  a2[2] = v10;
  uint64_t v11 = (void *)*a1;
  *a1 = v6;
  a2[1] = v11;
  uint64_t v12 = a1[1];
  a1[1] = a2[2];
  a2[2] = v12;
  uint64_t v13 = a1[2];
  a1[2] = a2[3];
  a2[3] = v13;
  *a2 = a2[1];
  return result;
}

uint64_t *std::__unwrap_and_dispatch[abi:nn180100]<std::__overload<std::__copy_loop<std::_ClassicAlgPolicy>,std::__copy_trivial>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit> *>,std::__wrap_iter<re::SharedPtr<re::DirectResourcesResolvedCommit> *>,re::SharedPtr<re::DirectResourcesResolvedCommit> *,0>(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v4 = a1;
  if (a1 != a2)
  {
    do
    {
      uint64_t v6 = *v4++;
      re::SharedPtr<re::DirectBuffer>::reset(a3++, v6);
    }
    while (v4 != a2);
    return a2;
  }
  return v4;
}

void *std::__function::__value_func<void ()(re::DirectResourceEvent const&,unsigned long long)>::~__value_func[abi:nn180100](void *a1)
{
  uint64_t v2 = (void *)a1[3];
  if (v2 == a1)
  {
    (*(void (**)(void *))(*a1 + 32))(a1);
  }
  else if (v2)
  {
    (*(void (**)(void *))(*v2 + 40))(v2);
  }
  return a1;
}

BOOL std::lock[abi:nn180100]<re::UnfairLock,re::UnfairLock>(os_unfair_lock_s *a1, os_unfair_lock_s *a2)
{
  os_unfair_lock_lock(a1);
  for (BOOL result = os_unfair_lock_trylock(a2); !result; BOOL result = os_unfair_lock_trylock(a2))
  {
    os_unfair_lock_unlock(a1);
    sched_yield();
    os_unfair_lock_lock(a2);
    BOOL result = os_unfair_lock_trylock(a1);
    if (result) {
      break;
    }
    os_unfair_lock_unlock(a2);
    sched_yield();
    os_unfair_lock_lock(a1);
  }
  return result;
}

double re::make::shared::object<re::DirectResourcesResolvedCommit,unsigned long long const&,unsigned long long>@<D0>(uint64_t *a1@<X0>, uint64_t *a2@<X1>, ArcSharedObject **a3@<X8>)
{
  uint64_t v6 = (ArcSharedObject *)operator new(0x108uLL);
  uint64_t v7 = *a1;
  uint64_t v8 = *a2;
  ArcSharedObject::ArcSharedObject(v6, 0);
  *uint64_t v9 = &unk_26FF34D00;
  uint64_t v9[2] = v7;
  void v9[3] = v8;
  v9[4] = 0;
  re::DirectResourceEvent::DirectResourceEvent(v9 + 5);
  *((void *)v6 + 32) = 0;
  double result = 0.0;
  *((_OWORD *)v6 + 14) = 0u;
  *((_OWORD *)v6 + 15) = 0u;
  *((_OWORD *)v6 + 12) = 0u;
  *((_OWORD *)v6 + 13) = 0u;
  *((_OWORD *)v6 + 10) = 0u;
  *((_OWORD *)v6 + 11) = 0u;
  *((_OWORD *)v6 + 8) = 0u;
  *((_OWORD *)v6 + 9) = 0u;
  *((_OWORD *)v6 + 6) = 0u;
  *((_OWORD *)v6 + 7) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_OWORD *)v6 + 5) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *a3 = v6;
  return result;
}

uint64_t std::vector<re::SharedPtr<re::DirectMesh>>::reserve(char **a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (uint64_t)(a1 + 2);
  if (a2 > (v4 - *a1) >> 3)
  {
    if (a2 >> 61) {
      abort();
    }
    uint64_t v5 = a1[1] - *a1;
    uint64_t v17 = result;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned long>>(result, a2);
    uint64_t v9 = *a1;
    uint64_t v8 = a1[1];
    if (v8 == *a1)
    {
      int64x2_t v12 = vdupq_n_s64((unint64_t)v8);
      uint64_t v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    }
    else
    {
      uint64_t v10 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
      do
      {
        uint64_t v11 = *((void *)v8 - 1);
        v8 -= 8;
        *((void *)v10 - 1) = v11;
        v10 -= 8;
        *(void *)uint64_t v8 = 0;
      }
      while (v8 != v9);
      int64x2_t v12 = *(int64x2_t *)a1;
    }
    *a1 = v10;
    a1[1] = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    int64x2_t v15 = v12;
    uint64_t v13 = a1[2];
    a1[2] = &v6[8 * v7];
    unint64_t v16 = v13;
    uint64_t v14 = v12.i64[0];
    return std::__split_buffer<re::SharedPtr<re::DirectBuffer>>::~__split_buffer((uint64_t)&v14);
  }
  return result;
}

void **std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::reserve(void *a1, unint64_t a2)
{
  uint64_t v4 = a1[2];
  uint64_t result = (void **)(a1 + 2);
  if (a2 > (v4 - *a1) >> 4)
  {
    if (a2 >> 60) {
      abort();
    }
    uint64_t v5 = a1[1] - *a1;
    v7[4] = result;
    v7[0] = std::__allocate_at_least[abi:nn180100]<std::allocator<re::DestroyResource>>((uint64_t)result, a2);
    v7[1] = (char *)v7[0] + v5;
    id v7[2] = (char *)v7[0] + v5;
    uint64_t v7[3] = (char *)v7[0] + 16 * v6;
    std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__swap_out_circular_buffer(a1, v7);
    return std::__split_buffer<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::~__split_buffer(v7);
  }
  return result;
}

void *std::vector<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::__swap_out_circular_buffer(void *result, void *a2)
{
  uint64_t v3 = (void *)*result;
  uint64_t v2 = (void *)result[1];
  uint64_t v4 = a2[1];
  while (v2 != v3)
  {
    long long v5 = *((_OWORD *)v2 - 1);
    v2 -= 2;
    *(_OWORD *)(v4 - 16) = v5;
    v4 -= 16;
    *uint64_t v2 = 0;
    v2[1] = 0;
  }
  a2[1] = v4;
  uint64_t v6 = (void *)*result;
  *uint64_t result = v4;
  a2[1] = v6;
  uint64_t v7 = result[1];
  result[1] = a2[2];
  a2[2] = v7;
  uint64_t v8 = result[2];
  result[2] = a2[3];
  a2[3] = v8;
  *a2 = a2[1];
  return result;
}

void **std::__split_buffer<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::~__split_buffer(void **a1)
{
  if (*a1) {
    operator delete(*a1);
  }
  return a1;
}

void std::__split_buffer<std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>>::clear[abi:nn180100](void *a1)
{
  uint64_t v2 = a1[1];
  for (uint64_t i = a1[2]; i != v2; uint64_t i = a1[2])
  {
    uint64_t v4 = a1[4];
    a1[2] = i - 16;
    std::allocator<std::pair<re::SharedPtr<re::DirectBuffer>,re::SharedPtr<re::DirectBufferUpdate>>>::destroy[abi:nn180100](v4, (void *)(i - 16));
  }
}

uint64_t *std::pair<re::SharedPtr<re::DirectMesh>,re::SharedPtr<re::DirectMeshUpdate>>::pair[abi:nn180100]<re::SharedPtr<re::DirectMesh>&,re::SharedPtr<re::DirectMeshUpdate> const&,0>(uint64_t *a1, uint64_t *a2, uint64_t *a3)
{
  uint64_t v5 = *a2;
  *a1 = *a2;
  if (v5) {
    id v6 = (id)(v5 + 8);
  }
  uint64_t v7 = *a3;
  a1[1] = *a3;
  if (v7) {
    id v8 = (id)(v7 + 8);
  }
  return a1;
}

void std::__function::__func<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0,std::allocator<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::~__func()
{
}

void *std::__function::__func<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0,std::allocator<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::__clone(uint64_t a1)
{
  uint64_t result = operator new(0x10uLL);
  uint64_t v3 = *(void *)(a1 + 8);
  *uint64_t result = &unk_26FF350F8;
  result[1] = v3;
  return result;
}

uint64_t std::__function::__func<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0,std::allocator<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::__clone(uint64_t result, void *a2)
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_26FF350F8;
  a2[1] = v2;
  return result;
}

const unsigned __int8 *std::__function::__func<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0,std::allocator<re::DirectResourceClientReceiver::load(re::SharedPtr<re::DirectResourceCommands> const&)::$_0>,re::DirectMemoryResource * ()(re::DirectResourceId const&)>::operator()(uint64_t a1, unsigned __int8 *a2)
{
  uint64_t result = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>((void *)(*(void *)(a1 + 8) + 200), a2);
  if (result) {
    return (const unsigned __int8 *)*((void *)result + 4);
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1(re *a1@<X0>, uint64_t a2@<X8>, uint64_t a3, uint64_t a4, __int16 a5, char a6, char a7)
{
  *(void *)(v7 - 24) = a2;
  re::toString(a1, &a7);
}

uint64_t ArcObjectDestroy(char *a1, objc_selector *a2)
{
  if (a1) {
    uint64_t v2 = a1 - 8;
  }
  else {
    uint64_t v2 = 0;
  }
  return (*(uint64_t (**)(void))(*(void *)v2 + 16))();
}

uint64_t ArcObjectDescription(char *a1, objc_selector *a2)
{
  if (a1) {
    uint64_t v2 = a1 - 8;
  }
  else {
    uint64_t v2 = 0;
  }
  (*(void (**)(void **__return_ptr))(*(void *)v2 + 24))(__p);
  if (v7 >= 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  uint64_t v4 = [NSString stringWithUTF8String:v3];
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return v4;
}

uint64_t ArcObjectDebugDescription(char *a1, objc_selector *a2)
{
  if (a1) {
    uint64_t v2 = a1 - 8;
  }
  else {
    uint64_t v2 = 0;
  }
  (*(void (**)(void **__return_ptr))(*(void *)v2 + 32))(__p);
  if (v7 >= 0) {
    uint64_t v3 = __p;
  }
  else {
    uint64_t v3 = (void **)__p[0];
  }
  uint64_t v4 = [NSString stringWithUTF8String:v3];
  if (v7 < 0) {
    operator delete(__p[0]);
  }
  return v4;
}

uint64_t ArcObjectClass(void)
{
  unint64_t v0 = 0x26982D000uLL;
  {
    unint64_t v0 = 0x26982D000;
    if (v2)
    {
      ArcObjectClass(void)::cls = (uint64_t)ArcObjectClass(void)::$_0::operator()();
      unint64_t v0 = 0x26982D000;
    }
  }
  return *(void *)(v0 + 344);
}

Class ArcObjectClass(void)::$_0::operator()()
{
  unint64_t v0 = (objc_class *)objc_opt_class();
  ClassPair = objc_allocateClassPair(v0, "_DRObject", 0);
  if (ClassPair)
  {
    int v2 = ClassPair;
    class_addMethod(ClassPair, sel_dealloc, (IMP)ArcObjectDestroy, "");
    class_addMethod(v2, sel_description, (IMP)ArcObjectDescription, "");
    class_addMethod(v2, sel_debugDescription, (IMP)ArcObjectDebugDescription, "");
    objc_registerClassPair(v2);
    return v2;
  }
  else
  {
    return objc_getClass("_DRObject");
  }
}

void ArcSharedObject::ArcSharedObject(ArcSharedObject *this, Class cls)
{
  int v2 = cls;
  *(void *)this = &unk_26FF35140;
  if (!cls) {
    int v2 = (objc_class *)ArcObjectClass();
  }
  *((void *)this + 1) = 0;
  objc_constructInstance(v2, (char *)this + 8);
}

void ArcSharedObject::~ArcSharedObject(ArcSharedObject *this)
{
  *(void *)this = &unk_26FF35140;
  objc_destructInstance((char *)this + 8);
}

{
  *(void *)this = &unk_26FF35140;
  objc_destructInstance((char *)this + 8);
}

{
  uint64_t vars8;

  *(void *)this = &unk_26FF35140;
  objc_destructInstance((char *)this + 8);

  JUMPOUT(0x2533130A0);
}

void ArcSharedObject::dispose(ArcSharedObject *this)
{
  (**(void (***)(ArcSharedObject *))this)(this);

  free(this);
}

void *ArcSharedObject::description@<X0>(void *a1@<X8>)
{
  return std::string::basic_string[abi:nn180100]<0>(a1, "DRObject");
}

uint64_t ArcSharedObject::debugDescription(ArcSharedObject *this)
{
  return (*(uint64_t (**)(void))(*(void *)this + 24))();
}

double re::DirectResourcesReuseList::DirectResourcesReuseList(re::DirectResourcesReuseList *this, uint64_t a2)
{
  ArcSharedObject::ArcSharedObject(this, 0);
  *(void *)uint64_t v3 = &unk_26FF35178;
  *(void *)(v3 + 16) = a2;
  double result = 0.0;
  *(_OWORD *)(v3 + 24) = 0u;
  *(_OWORD *)(v3 + 40) = 0u;
  return result;
}

void re::DirectResourcesReuseList::~DirectResourcesReuseList(re::DirectResourcesReuseList *this)
{
  int v2 = (void **)((char *)this + 32);
  std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100](&v2);
  ArcSharedObject::~ArcSharedObject(this);
}

{
  void **v2;

  int v2 = (void **)((char *)this + 32);
  std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100](&v2);
  ArcSharedObject::~ArcSharedObject(this);
  MEMORY[0x2533130A0]();
}

uint64_t re::DirectResourcesReuseList::add(int64x2_t *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t *a7)
{
  uint64_t v14 = a1[1].i64[0];
  uint64_t v15 = *a7;
  if (*a7) {
    id v16 = (id)(v15 + 8);
  }
  uint64_t result = (uint64_t)a1[3].i64;
  unint64_t v18 = a1[3].u64[0];
  unint64_t v19 = a1[2].u64[1];
  if (v19 >= v18)
  {
    uint64_t v21 = a1[2].i64[0];
    uint64_t v22 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v19 - v21) >> 3);
    unint64_t v23 = v22 + 1;
    if ((unint64_t)(v22 + 1) > 0x492492492492492) {
      abort();
    }
    unint64_t v24 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v18 - v21) >> 3);
    if (2 * v24 > v23) {
      unint64_t v23 = 2 * v24;
    }
    if (v24 >= 0x249249249249249) {
      unint64_t v25 = 0x492492492492492;
    }
    else {
      unint64_t v25 = v23;
    }
    uint64_t v39 = a1 + 3;
    updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>(result, v25);
    uint64_t v28 = &updated[56 * v22];
    *(void *)uint64_t v28 = v14;
    *((void *)v28 + 1) = a2;
    *((void *)v28 + 2) = a3;
    *((_DWORD *)v28 + 6) = a4;
    *((void *)v28 + 4) = a5;
    *((void *)v28 + 5) = a6;
    *((void *)v28 + 6) = v15;
    uint64_t v30 = a1[2].i64[0];
    unint64_t v29 = a1[2].u64[1];
    if (v29 == v30)
    {
      int64x2_t v34 = vdupq_n_s64(v29);
      uint64_t v31 = &updated[56 * v22];
    }
    else
    {
      uint64_t v31 = &updated[56 * v22];
      do
      {
        long long v32 = *(_OWORD *)(v29 - 56);
        long long v33 = *(_OWORD *)(v29 - 40);
        *(_OWORD *)(v31 - 24) = *(_OWORD *)(v29 - 24);
        *(_OWORD *)(v31 - 40) = v33;
        *(_OWORD *)(v31 - 56) = v32;
        *((void *)v31 - 1) = *(void *)(v29 - 8);
        v31 -= 56;
        *(void *)(v29 - 8) = 0;
        v29 -= 56;
      }
      while (v29 != v30);
      int64x2_t v34 = a1[2];
    }
    uint64_t v20 = v28 + 56;
    a1[2].i64[0] = (uint64_t)v31;
    a1[2].i64[1] = (uint64_t)(v28 + 56);
    int64x2_t v37 = v34;
    uint64_t v35 = a1[3].i64[0];
    a1[3].i64[0] = (uint64_t)&updated[56 * v27];
    uint64_t v38 = v35;
    uint64_t v36 = v34.i64[0];
    uint64_t result = std::__split_buffer<re::DirectResourcesReuseList::Entry>::~__split_buffer((uint64_t)&v36);
  }
  else
  {
    *(void *)unint64_t v19 = v14;
    *(void *)(v19 + 8) = a2;
    *(void *)(v19 + 16) = a3;
    *(_DWORD *)(v19 + 24) = a4;
    *(void *)(v19 + 32) = a5;
    *(void *)(v19 + 40) = a6;
    uint64_t v20 = (char *)(v19 + 56);
    *(void *)(v19 + 48) = v15;
  }
  a1[2].i64[1] = (uint64_t)v20;
  a1[1].i64[1] += *(void *)(*a7 + 40);
  return result;
}

double re::DirectResourcesReusePool::DirectResourcesReusePool(re::DirectResourcesReusePool *this)
{
  double result = 0.0;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  *((_DWORD *)this + 8) = 1065353216;
  *((void *)this + 5) = 0;
  *((void *)this + 6) = 0;
  return result;
}

void re::DirectResourcesReusePool::take(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, int a5@<W4>, uint64_t a6@<X5>, void *a7@<X8>)
{
  uint64_t v10 = a1;
  uint64_t v41 = *MEMORY[0x263EF8340];
  *(void *)uu2 = a2;
  uint64_t v40 = a3;
  *a7 = 0;
  int64x2_t v12 = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a1, uu2);
  if (v12)
  {
    uint64_t v13 = (uint64_t *)v12;
    uint64_t v14 = *((void *)v12 + 5);
    uint64_t v15 = 0x6DB6DB6DB6DB6DB7 * ((v14 - *((void *)v12 + 4)) >> 3);
    unsigned int v16 = v15 - 1;
    if ((int)v15 >= 1)
    {
      int64x2_t v37 = a7;
      uint64_t v38 = v10;
      uint64_t v17 = -1227133513 * ((v14 - *((void *)v12 + 4)) >> 3) + 1;
      while (1)
      {
        uint64_t v18 = (v17 - 2);
        uint64_t v19 = v13[4];
        uint64_t v20 = v19 + 56 * v18;
        if (!uuid_compare((const unsigned __int8 *)(v20 + 8), uu2) && *(_DWORD *)(v20 + 24) == a4)
        {
          uint64_t v22 = v19 + 56 * v18;
          int v23 = *(_DWORD *)(v22 + 32);
          uint64_t v24 = *(void *)(v22 + 40);
          if (v23 == a5 && v24 == a6) {
            break;
          }
        }
        --v16;
        if ((unint64_t)--v17 <= 1)
        {
          uint64_t v14 = v13[5];
          uint64_t v10 = v38;
          goto LABEL_24;
        }
      }
      uint64_t v26 = v19 + 56 * v18;
      uint64_t v27 = *(void *)(v26 + 48);
      uint64_t v10 = v38;
      *int64x2_t v37 = v27;
      *(void *)(v26 + 48) = 0;
      uint64_t v28 = v38[6] - *(void *)(v27 + 40);
      --v38[5];
      v38[6] = v28;
      uint64_t v30 = v13[4];
      uint64_t v29 = v13[5];
      uint64_t v14 = v30 + 56 * v18;
      uint64_t v31 = v14 + 56;
      if (v14 + 56 != v29)
      {
        uint64_t v32 = v30 + 56 * v18;
        uint64_t v14 = v30 + 56 * v16;
        do
        {
          long long v33 = *(_OWORD *)(v32 + 72);
          *(_OWORD *)uint64_t v32 = *(_OWORD *)(v32 + 56);
          *(_OWORD *)(v32 + 16) = v33;
          *(_OWORD *)(v32 + 32) = *(_OWORD *)(v32 + 88);
          uint64_t v34 = *(void *)(v32 + 48);
          *(void *)(v32 + 48) = *(void *)(v32 + 104);
          *(void *)(v32 + 104) = v34;
          uint64_t v35 = v32 + 112;
          v32 += 56;
          v14 += 56;
        }
        while (v35 != v29);
        uint64_t v31 = v13[5];
      }
      while (v31 != v14)
      {
        uint64_t v36 = *(void *)(v31 - 8);
        if (v36)
        {

          *(void *)(v31 - 8) = 0;
        }
        v31 -= 56;
      }
      void v13[5] = v14;
    }
LABEL_24:
    if (v14 == v13[4]) {
      std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::erase(v10, v13);
    }
  }
}

void re::DirectResourcesReusePool::mergeFrom(uint64_t a1, uint64_t a2)
{
  v35[3] = *MEMORY[0x263EF8340];
  int v2 = *(long long **)(a2 + 32);
  for (i = *(long long **)(a2 + 40); v2 != i; int v2 = (long long *)((char *)v2 + 56))
  {
    uint64_t v5 = *(void *)(a1 + 48);
    ++*(void *)(a1 + 40);
    *(void *)(a1 + 48) = v5 + *(void *)(*((void *)v2 + 6) + 40);
    memset(v29, 0, sizeof(v29));
    *(_OWORD *)uu2 = *(long long *)((char *)v2 + 8);
    memset(v35, 0, 24);
    std::vector<re::DirectResourcesReuseList::Entry>::__init_with_size[abi:nn180100]<re::DirectResourcesReuseList::Entry*,re::DirectResourcesReuseList::Entry*>(v35, 0, 0, 0);
    id v6 = (int64x2_t *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,std::vector<re::DirectResourcesReuseList::Entry>>>(a1, uu2, (uint64_t)uu2);
    unint64_t v7 = v6[2].u64[1];
    unint64_t v8 = v6[3].u64[0];
    if (v7 >= v8)
    {
      uint64_t v12 = v6[2].i64[0];
      uint64_t v13 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v7 - v12) >> 3);
      unint64_t v14 = v13 + 1;
      if ((unint64_t)(v13 + 1) > 0x492492492492492) {
        abort();
      }
      unint64_t v15 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v8 - v12) >> 3);
      if (2 * v15 > v14) {
        unint64_t v14 = 2 * v15;
      }
      if (v15 >= 0x249249249249249) {
        unint64_t v16 = 0x492492492492492;
      }
      else {
        unint64_t v16 = v14;
      }
      long long v33 = v6 + 3;
      updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>((uint64_t)v6[3].i64, v16);
      uint64_t v19 = &updated[56 * v13];
      long long v20 = *v2;
      long long v21 = v2[2];
      *((_OWORD *)v19 + 1) = v2[1];
      *((_OWORD *)v19 + 2) = v21;
      *(_OWORD *)uint64_t v19 = v20;
      *((void *)v19 + 6) = *((void *)v2 + 6);
      *((void *)v2 + 6) = 0;
      uint64_t v23 = v6[2].i64[0];
      unint64_t v22 = v6[2].u64[1];
      if (v22 == v23)
      {
        int64x2_t v27 = vdupq_n_s64(v22);
        uint64_t v24 = &updated[56 * v13];
      }
      else
      {
        uint64_t v24 = &updated[56 * v13];
        do
        {
          long long v25 = *(_OWORD *)(v22 - 56);
          long long v26 = *(_OWORD *)(v22 - 40);
          *(_OWORD *)(v24 - 24) = *(_OWORD *)(v22 - 24);
          *(_OWORD *)(v24 - 40) = v26;
          *(_OWORD *)(v24 - 56) = v25;
          *((void *)v24 - 1) = *(void *)(v22 - 8);
          v24 -= 56;
          *(void *)(v22 - 8) = 0;
          v22 -= 56;
        }
        while (v22 != v23);
        int64x2_t v27 = v6[2];
      }
      uint64_t v11 = v19 + 56;
      v6[2].i64[0] = (uint64_t)v24;
      v6[2].i64[1] = (uint64_t)(v19 + 56);
      int64x2_t v31 = v27;
      uint64_t v28 = v6[3].i64[0];
      v6[3].i64[0] = (uint64_t)&updated[56 * v18];
      uint64_t v32 = v28;
      uint64_t v30 = (void **)v27.i64[0];
      std::__split_buffer<re::DirectResourcesReuseList::Entry>::~__split_buffer((uint64_t)&v30);
    }
    else
    {
      long long v9 = *v2;
      long long v10 = v2[2];
      *(_OWORD *)(v7 + 16) = v2[1];
      *(_OWORD *)(v7 + 32) = v10;
      *(_OWORD *)unint64_t v7 = v9;
      *(void *)(v7 + 48) = *((void *)v2 + 6);
      *((void *)v2 + 6) = 0;
      uint64_t v11 = (char *)(v7 + 56);
    }
    v6[2].i64[1] = (uint64_t)v11;
    uint64_t v30 = (void **)v35;
    std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100](&v30);
    uint64_t v30 = (void **)v29;
    std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100](&v30);
  }
}

void *re::DirectResourcesReusePool::purgeBefore@<X0>(void *this@<X0>, unint64_t a2@<X1>, char **a3@<X8>)
{
  *a3 = 0;
  a3[1] = 0;
  a3[2] = 0;
  uint64_t v37 = (uint64_t)this;
  uint64_t v3 = (void *)this[2];
  if (v3)
  {
    uint64_t v6 = 0;
    uint64_t v39 = 0;
    uint64_t v40 = (uint64_t)(a3 + 2);
    while (1)
    {
      unint64_t v7 = (long long *)v3[4];
      this = v3 + 4;
      if ((long long *)v3[5] != v7)
      {
        if (*(void *)v7 >= a2)
        {
          uint64_t v9 = 0;
          unint64_t v8 = 0;
          uint64_t v10 = v3[4];
LABEL_24:
          if (!v8) {
            goto LABEL_28;
          }
        }
        else
        {
          uint64_t v38 = v6;
          unint64_t v8 = 0;
          uint64_t v9 = 0;
          uint64_t v10 = v3[4];
          while (1)
          {
            uint64_t v11 = v10 + 56 * v8;
            uint64_t v13 = *(void *)(v11 + 48);
            uint64_t v12 = (void *)(v11 + 48);
            uint64_t v14 = *(void *)(v13 + 40);
            unint64_t v15 = (unint64_t)a3[1];
            unint64_t v16 = (unint64_t)a3[2];
            if (v15 >= v16)
            {
              uint64_t v20 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v15 - (void)*a3) >> 3);
              unint64_t v21 = v20 + 1;
              if ((unint64_t)(v20 + 1) > 0x492492492492492) {
                abort();
              }
              unint64_t v22 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v16 - (void)*a3) >> 3);
              if (2 * v22 > v21) {
                unint64_t v21 = 2 * v22;
              }
              unint64_t v23 = v22 >= 0x249249249249249 ? 0x492492492492492 : v21;
              uint64_t v44 = v40;
              updated = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>(v40, v23);
              long long v26 = &updated[56 * v20];
              long long v27 = *v7;
              long long v28 = v7[2];
              *((_OWORD *)v26 + 1) = v7[1];
              *((_OWORD *)v26 + 2) = v28;
              *(_OWORD *)long long v26 = v27;
              *((void *)v26 + 6) = *v12;
              *uint64_t v12 = 0;
              uint64_t v30 = *a3;
              unint64_t v29 = (unint64_t)a3[1];
              if ((char *)v29 == *a3)
              {
                int64x2_t v34 = vdupq_n_s64(v29);
                int64x2_t v31 = &updated[56 * v20];
              }
              else
              {
                int64x2_t v31 = &updated[56 * v20];
                do
                {
                  long long v32 = *(_OWORD *)(v29 - 56);
                  long long v33 = *(_OWORD *)(v29 - 40);
                  *(_OWORD *)(v31 - 24) = *(_OWORD *)(v29 - 24);
                  *(_OWORD *)(v31 - 40) = v33;
                  *(_OWORD *)(v31 - 56) = v32;
                  *((void *)v31 - 1) = *(void *)(v29 - 8);
                  v31 -= 56;
                  *(void *)(v29 - 8) = 0;
                  v29 -= 56;
                }
                while ((char *)v29 != v30);
                int64x2_t v34 = *(int64x2_t *)a3;
              }
              uint64_t v19 = v26 + 56;
              *a3 = v31;
              a3[1] = v26 + 56;
              int64x2_t v42 = v34;
              uint64_t v35 = a3[2];
              a3[2] = &updated[56 * v25];
              uint64_t v43 = v35;
              uint64_t v41 = v34.i64[0];
              std::__split_buffer<re::DirectResourcesReuseList::Entry>::~__split_buffer((uint64_t)&v41);
            }
            else
            {
              long long v17 = *v7;
              long long v18 = v7[2];
              *(_OWORD *)(v15 + 16) = v7[1];
              *(_OWORD *)(v15 + 32) = v18;
              *(_OWORD *)unint64_t v15 = v17;
              *(void *)(v15 + 48) = *v12;
              *uint64_t v12 = 0;
              uint64_t v19 = (char *)(v15 + 56);
            }
            v9 += v14;
            a3[1] = v19;
            ++v8;
            uint64_t v10 = v3[4];
            if (v8 >= 0x6DB6DB6DB6DB6DB7 * ((v3[5] - v10) >> 3)) {
              break;
            }
            unint64_t v7 = (long long *)(v10 + 56 * v8);
            if (*(void *)v7 >= a2)
            {
              unint64_t v7 = (long long *)v3[4];
              this = v3 + 4;
              uint64_t v6 = v38;
              goto LABEL_24;
            }
          }
          unint64_t v7 = (long long *)v3[4];
          this = v3 + 4;
          uint64_t v6 = v38;
        }
        this = (void *)std::vector<re::DirectResourcesReuseList::Entry>::erase((uint64_t)this, (uint64_t)v7, v10 + 56 * v8);
        v39 += v8;
        v6 += v9;
      }
LABEL_28:
      uint64_t v3 = (void *)*v3;
      if (!v3) {
        goto LABEL_31;
      }
    }
  }
  uint64_t v6 = 0;
  uint64_t v39 = 0;
LABEL_31:
  uint64_t v36 = *(void *)(v37 + 48) - v6;
  *(void *)(v37 + 40) -= v39;
  *(void *)(v37 + 48) = v36;
  return this;
}

uint64_t std::vector<re::DirectResourcesReuseList::Entry>::erase(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 != a3)
  {
    uint64_t v5 = a3;
    uint64_t v6 = *(void *)(a1 + 8);
    if (a3 == v6)
    {
      uint64_t v8 = a2;
    }
    else
    {
      uint64_t v7 = 8 * ((a3 - a2) >> 3);
      uint64_t v8 = a2;
      do
      {
        long long v9 = *(_OWORD *)(v8 + v7);
        long long v10 = *(_OWORD *)(v8 + v7 + 32);
        *(_OWORD *)(v8 + 16) = *(_OWORD *)(v8 + v7 + 16);
        *(_OWORD *)(v8 + 32) = v10;
        *(_OWORD *)uint64_t v8 = v9;
        uint64_t v11 = *(void *)(v8 + 48);
        *(void *)(v8 + 48) = *(void *)(v8 + v7 + 48);
        *(void *)(v8 + v7 + 48) = v11;
        v8 += 56;
      }
      while (v8 + v7 != v6);
      uint64_t v5 = *(void *)(a1 + 8);
    }
    while (v5 != v8)
    {
      uint64_t v12 = *(void *)(v5 - 8);
      if (v12)
      {

        *(void *)(v5 - 8) = 0;
      }
      v5 -= 56;
    }
    *(void *)(a1 + 8) = v8;
  }
  return a2;
}

const unsigned __int8 *re::DirectResourcesReusePool::purgePayloads@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t *a4@<X8>)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  *(void *)uu2 = a2;
  uint64_t v14 = a3;
  a4[1] = 0;
  a4[2] = 0;
  *a4 = 0;
  double result = std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMemoryResource>>>>::find<re::DirectResourceId>(a1, uu2);
  if (result)
  {
    uint64_t v7 = (unsigned __int8 *)result;
    uint64_t v8 = *((void *)result + 4);
    uint64_t v9 = *((void *)result + 5);
    long long v10 = result + 32;
    if (v8 != v9)
    {
      uint64_t v11 = a1[5];
      uint64_t v12 = a1[6];
      do
      {
        --v11;
        v12 -= *(void *)(*(void *)(v8 + 48) + 40);
        v8 += 56;
      }
      while (v8 != v9);
      a1[5] = v11;
      a1[6] = v12;
    }
    std::vector<re::DirectResourcesReuseList::Entry>::__vdeallocate(a4);
    *(_OWORD *)a4 = *((_OWORD *)v7 + 2);
    a4[2] = *((void *)v7 + 6);
    *long long v10 = 0;
    v10[1] = 0;
    v10[2] = 0;
    return (const unsigned __int8 *)std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::erase(a1, (uint64_t *)v7);
  }
  return result;
}

void *std::vector<re::DirectResourcesReuseList::Entry>::__init_with_size[abi:nn180100]<re::DirectResourcesReuseList::Entry*,re::DirectResourcesReuseList::Entry*>(void *result, long long *a2, long long *a3, unint64_t a4)
{
  if (a4)
  {
    uint64_t v6 = result;
    std::vector<re::DirectResourcesReuseList::Entry>::__vallocate[abi:nn180100](result, a4);
    return std::vector<re::DirectResourcesReuseList::Entry>::__construct_at_end<re::DirectResourcesReuseList::Entry*,re::DirectResourcesReuseList::Entry*>(v6, a2, a3);
  }
  return result;
}

char *std::vector<re::DirectResourcesReuseList::Entry>::__vallocate[abi:nn180100](void *a1, unint64_t a2)
{
  if (a2 >= 0x492492492492493) {
    abort();
  }
  double result = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::UpdateDirectBuffer>>((uint64_t)(a1 + 2), a2);
  *a1 = result;
  a1[1] = result;
  a1[2] = &result[56 * v4];
  return result;
}

void *std::vector<re::DirectResourcesReuseList::Entry>::__construct_at_end<re::DirectResourcesReuseList::Entry*,re::DirectResourcesReuseList::Entry*>(void *result, long long *a2, long long *a3)
{
  uint64_t v3 = result;
  uint64_t v4 = result[1];
  if (a2 != a3)
  {
    uint64_t v6 = a2;
    do
    {
      long long v7 = *v6;
      long long v8 = v6[2];
      *(_OWORD *)(v4 + 16) = v6[1];
      *(_OWORD *)(v4 + 32) = v8;
      *(_OWORD *)uint64_t v4 = v7;
      uint64_t v9 = *((void *)v6 + 6);
      *(void *)(v4 + 48) = v9;
      if (v9) {
        double result = (id)(v9 + 8);
      }
      v4 += 56;
      uint64_t v6 = (long long *)((char *)v6 + 56);
    }
    while (v6 != a3);
  }
  v3[1] = v4;
  return result;
}

uint64_t std::__split_buffer<re::DirectResourcesReuseList::Entry>::~__split_buffer(uint64_t a1)
{
  if (*(void *)a1) {
    operator delete(*(void **)a1);
  }
  return a1;
}

void std::__split_buffer<re::DirectResourcesReuseList::Entry>::__destruct_at_end[abi:nn180100](uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 16);
  while (v2 != a2)
  {
    *(void *)(a1 + 16) = v2 - 56;
    uint64_t v5 = *(void *)(v2 - 8);
    if (v5)
    {

      *(void *)(v2 - 8) = 0;
      uint64_t v2 = *(void *)(a1 + 16);
    }
    else
    {
      v2 -= 56;
    }
  }
}

uint64_t std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::~__hash_table(uint64_t a1)
{
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::__deallocate_node(a1, *(char **)(a1 + 16));
  uint64_t v2 = *(void **)a1;
  *(void *)a1 = 0;
  if (v2) {
    operator delete(v2);
  }
  return a1;
}

void std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::__deallocate_node(uint64_t a1, char *a2)
{
  if (a2)
  {
    uint64_t v2 = a2;
    do
    {
      uint64_t v3 = *(char **)v2;
      uint64_t v4 = (void **)(v2 + 32);
      std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100](&v4);
      operator delete(v2);
      uint64_t v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::erase(void *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMeshUpdate>>>>::remove(a1, a2, (uint64_t)&__p);
  uint64_t v3 = (void **)__p;
  __p = 0;
  if (v3) {
    std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,void *>>>::operator()[abi:nn180100]((uint64_t)&v6, v3);
  }
  return v2;
}

void std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,void *>>>::operator()[abi:nn180100](uint64_t a1, void **__p)
{
  if (*(unsigned char *)(a1 + 8))
  {
    uint64_t v3 = __p + 4;
    std::vector<re::DirectResourcesReuseList::Entry>::__destroy_vector::operator()[abi:nn180100](&v3);
  }
  if (__p) {
    operator delete(__p);
  }
}

void *std::__hash_table<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,std::vector<re::DirectResourcesReuseList::Entry>>>>::__emplace_unique_key_args<re::DirectResourceId,std::pair<re::DirectResourceId const,std::vector<re::DirectResourcesReuseList::Entry>>>(uint64_t a1, unsigned __int8 *uu2, uint64_t a3)
{
  unint64_t v6 = (*((void *)uu2 + 1) + (*(void *)uu2 << 6) + (*(void *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(void *)uu2;
  unint64_t v7 = *(void *)(a1 + 8);
  if (v7)
  {
    uint8x8_t v9 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v9.i16[0] = vaddlv_u8(v9);
    unint64_t v10 = v9.u32[0];
    if (v9.u32[0] > 1uLL)
    {
      uint64_t v3 = (*((void *)uu2 + 1) + (*(void *)uu2 << 6) + (*(void *)uu2 >> 2) - 0x61C8864680B583E9) ^ *(void *)uu2;
      if (v6 >= v7) {
        uint64_t v3 = v6 % v7;
      }
    }
    else
    {
      uint64_t v3 = v6 & (v7 - 1);
    }
    uint64_t v11 = *(void ***)(*(void *)a1 + 8 * v3);
    if (v11)
    {
      for (uint64_t i = *v11; i; uint64_t i = *(void **)i)
      {
        unint64_t v13 = *((void *)i + 1);
        if (v13 == v6)
        {
          if (!uuid_compare((const unsigned __int8 *)i + 16, uu2)) {
            return i;
          }
        }
        else
        {
          if (v10 > 1)
          {
            if (v13 >= v7) {
              v13 %= v7;
            }
          }
          else
          {
            v13 &= v7 - 1;
          }
          if (v13 != v3) {
            break;
          }
        }
      }
    }
  }
  uint64_t i = operator new(0x38uLL);
  *(void *)uint64_t i = 0;
  *((void *)i + 1) = v6;
  long long v14 = *(_OWORD *)(a3 + 16);
  *((_OWORD *)i + 1) = *(_OWORD *)a3;
  *((_OWORD *)i + 2) = v14;
  *((void *)i + 6) = *(void *)(a3 + 32);
  *(void *)(a3 + 16) = 0;
  *(void *)(a3 + 24) = 0;
  *(void *)(a3 + 32) = 0;
  float v15 = (float)(unint64_t)(*(void *)(a1 + 24) + 1);
  float v16 = *(float *)(a1 + 32);
  if (!v7 || (float)(v16 * (float)v7) < v15)
  {
    BOOL v17 = 1;
    if (v7 >= 3) {
      BOOL v17 = (v7 & (v7 - 1)) != 0;
    }
    unint64_t v18 = v17 | (2 * v7);
    unint64_t v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19) {
      size_t v20 = v19;
    }
    else {
      size_t v20 = v18;
    }
    std::__hash_table<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::__unordered_map_hasher<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::hash<re::DirectResourceId>,std::equal_to<re::DirectResourceId>,true>,std::__unordered_map_equal<re::DirectResourceId,std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>,std::equal_to<re::DirectResourceId>,std::hash<re::DirectResourceId>,true>,std::allocator<std::__hash_value_type<re::DirectResourceId,re::SharedPtr<re::DirectMesh>>>>::__rehash<true>(a1, v20);
    unint64_t v7 = *(void *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v6 >= v7) {
        uint64_t v3 = v6 % v7;
      }
      else {
        uint64_t v3 = v6;
      }
    }
    else
    {
      uint64_t v3 = (v7 - 1) & v6;
    }
  }
  uint64_t v21 = *(void *)a1;
  unint64_t v22 = *(void **)(*(void *)a1 + 8 * v3);
  if (v22)
  {
    *(void *)uint64_t i = *v22;
LABEL_38:
    *unint64_t v22 = i;
    goto LABEL_39;
  }
  *(void *)uint64_t i = *(void *)(a1 + 16);
  *(void *)(a1 + 16) = i;
  *(void *)(v21 + 8 * v3) = a1 + 16;
  if (*(void *)i)
  {
    unint64_t v23 = *(void *)(*(void *)i + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v23 >= v7) {
        v23 %= v7;
      }
    }
    else
    {
      v23 &= v7 - 1;
    }
    unint64_t v22 = (void *)(*(void *)a1 + 8 * v23);
    goto LABEL_38;
  }
LABEL_39:
  ++*(void *)(a1 + 24);
  return i;
}

BOOL re::DirectBufferValidation::isWellFormed(void *a1)
{
  return (*a1 & 0xFLL) == 0 && *a1 != 0;
}

BOOL re::DirectBufferValidation::isValid(re::DirectBufferValidation *this, const re::DirectBuffer *a2)
{
  if (*(void *)(re::DirectBuffer::payload((uint64_t)this, 3, 0) + 40) < *((void *)this + 6)) {
    return 0;
  }
  unint64_t v4 = *((void *)this + 8);

  return re::DirectBuffer::isValidBytesUsed(this, v4);
}

BOOL re::DirectBufferValidation::isValidBytesUsed(unint64_t a1, unint64_t *a2)
{
  return !(a1 % a2[1]) && *a2 >= a1;
}

re::DirectResource *re::DirectResource::DirectResource(re::DirectResource *this)
{
  ArcSharedObject::ArcSharedObject(this, 0);
  *(void *)uint64_t v2 = &unk_26FF351B0;
  uint64_t v3 = (unsigned __int8 *)(v2 + 16);
  uuid_copy((unsigned __int8 *)(v2 + 16), UUID_NULL);
  *((void *)this + 4) = 0;
  *((void *)this + 5) = 0;
  uuid_generate_random(v3);
  return this;
}

void re::DirectResource::dispose(re::DirectResource *this)
{
  uint64_t v2 = *((void *)this + 5);
  if (v2) {
    (*(void (**)(uint64_t, re::DirectResource *))(*(void *)v2 + 32))(v2, this);
  }
  else {
    ArcSharedObject::dispose(this);
  }
}

double re::DirectResource::setIdentifier(re::DirectResource *this, const unsigned __int8 (*a2)[16])
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (*((void *)this + 5)) {
    re::DirectResource::setIdentifier();
  }
  uuid_copy(dst, (const unsigned __int8 *)a2);
  double result = *(double *)dst;
  *((_OWORD *)this + 1) = *(_OWORD *)dst;
  return result;
}

uint64_t re::DirectResource::setDelegate(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = a2;
  return result;
}

uint64_t re::DirectResource::willChange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)result + 16))(result, a1, a2, a3, a4, a5);
  }
  return result;
}

uint64_t re::DirectResource::didChange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)result + 24))(result, a1, a2, a3, a4);
  }
  return result;
}

void re::DirectResource::newPayload(uint64_t a1@<X0>, void *a2@<X3>, void *a3@<X8>)
{
  uint64_t v5 = (*(uint64_t (**)(uint64_t))(*(void *)a1 + 48))(a1);
  if (v5)
  {
    unint64_t v6 = (re::DirectMemoryResource *)*(unsigned int *)(v5 + 36);
    unint64_t v7 = *(re::MemoryMappedRegion **)(v5 + 40);
    re::DirectMemoryResource::create(v7, v6, a2, a3);
  }
  else
  {
    *a3 = 0;
  }
}

void re::DirectTexture::create(uint64_t a1@<X0>, void *a2@<X1>, void *a3@<X8>)
{
  if (*a2 && (re::DirectTextureValidation::isWellFormed() & 1) != 0)
  {
    unint64_t v6 = (char *)operator new(0x88uLL);
    uint64_t v7 = re::DirectTexture::DirectTexture((uint64_t)v6, a1);
    if (re::DirectTexture::allocateStorage(v7, (uint64_t)a2))
    {
      *a3 = v6;
    }
    else
    {
      *a3 = 0;
    }
  }
  else
  {
    *a3 = 0;
  }
}

BOOL re::DirectTexture::allocateStorage(uint64_t a1, uint64_t a2)
{
  re::DirectTexture::allocatePayload(*(id *)a2, a1, *(unsigned __int8 *)(a2 + 8), &v6);
  uint64_t v3 = *(void *)(a1 + 128);
  unint64_t v4 = v6;
  *(void *)(a1 + 128) = v6;
  unint64_t v6 = (re::DirectMemoryResource *)v3;
  if (v3)
  {

    unint64_t v4 = *(re::DirectMemoryResource **)(a1 + 128);
  }
  return v4 != 0;
}

uint64_t re::DirectTexture::DirectTexture(uint64_t a1, uint64_t a2)
{
  unint64_t v4 = re::DirectResource::DirectResource((re::DirectResource *)a1);
  *(void *)unint64_t v4 = &unk_26FF35220;
  *((_OWORD *)v4 + 3) = *(_OWORD *)a2;
  long long v5 = *(_OWORD *)(a2 + 16);
  long long v6 = *(_OWORD *)(a2 + 32);
  long long v7 = *(_OWORD *)(a2 + 48);
  *((void *)v4 + 14) = *(void *)(a2 + 64);
  *((_OWORD *)v4 + 5) = v6;
  *((_OWORD *)v4 + 6) = v7;
  *((_OWORD *)v4 + 4) = v5;
  id v8 = objc_msgSend(objc_msgSend(MEMORY[0x263F12A50], sel_alloc), sel_init);
  *(void *)(a1 + 120) = v8;
  objc_msgSend(v8, sel_setWidth_, *(void *)(a1 + 48));
  objc_msgSend(v8, sel_setHeight_, *(void *)(a1 + 56));
  objc_msgSend(v8, sel_setDepth_, *(void *)(a1 + 64));
  objc_msgSend(v8, sel_setMipmapLevelCount_, *(void *)(a1 + 72));
  objc_msgSend(v8, sel_setArrayLength_, *(void *)(a1 + 80));
  objc_msgSend(v8, sel_setPixelFormat_, *(void *)(a1 + 88));
  objc_msgSend(v8, sel_setTextureType_, *(void *)(a1 + 96));
  objc_msgSend(v8, sel_setUsage_, *(void *)(a1 + 104));
  objc_msgSend(v8, sel_setSwizzle_, *(unsigned int *)(a1 + 112));
  objc_msgSend(v8, sel_setStorageMode_, 2);
  objc_msgSend(v8, sel_setResourceOptions_, 32);
  *(void *)(a1 + 128) = 0;
  return a1;
}

void re::DirectTexture::allocatePayload(id a1@<X1>, uint64_t a2@<X0>, int a3@<W2>, re::DirectMemoryResource **a4@<X8>)
{
  id v8 = 0;
  if (a3)
  {
    uint64_t v5 = *(void *)(a2 + 120);
    long long v6 = &selRef_newSharedTextureWithDescriptor_;
  }
  else
  {
    uint64_t v5 = *(void *)(a2 + 120);
    long long v6 = &selRef_newTextureWithDescriptor_;
  }
  id v7 = objc_msgSend(a1, *v6, v5);
  NS::SharedPtr<MTL::Buffer>::operator=(&v8, &v7);
  if (v7) {

  }
  if (v8)
  {
    if (objc_msgSend(v8, sel_isShareable)) {
      re::DirectMemoryResource::createWithSharedTexture(v8, 10, a4);
    }
    else {
      re::DirectMemoryResource::createWithPrivateTexture(v8, 2, a4);
    }
    if (v8) {
  }
    }
  else
  {
    *a4 = 0;
  }
}

BOOL re::DirectTexture::isAttachedToDevice(re::DirectMemoryResource **this)
{
  id v1 = *(id *)re::DirectMemoryResource::runtimeResource(this[16]);
  id v2 = v1;
  if (v1) {

  }
  return v2 != 0;
}

uint64_t re::DirectTexture::attachToDevice(uint64_t a1, void *a2)
{
  return re::DirectTexture::allocateRuntimeResource(a1, *(re::DirectMemoryResource **)(a1 + 128), a2);
}

uint64_t re::DirectTexture::allocateRuntimeResource(uint64_t a1, re::DirectMemoryResource *a2, void *a3)
{
  if (!re::DirectMemoryResource::bindToResource((uint64_t)a2, 2, 3)) {
    return 0;
  }
  if (*(void *)re::DirectMemoryResource::runtimeResource(a2)) {
    return 1;
  }
  uint64_t v6 = *((void *)a2 + 7);
  if (!v6) {
    return 0;
  }
  id v11 = 0;
  id v10 = objc_msgSend(objc_msgSend(MEMORY[0x263F12A08], sel_alloc), sel_initWithIOSurface_label_, v6, &stru_26FF35560);
  NS::SharedPtr<MTL::Buffer>::operator=(&v11, &v10);
  if (v10) {

  }
  id v7 = objc_msgSend(a3, sel_newSharedTextureWithHandle_, v11);
  id v9 = v7;
  re::DirectMemoryResource::setRuntimeResource((uint64_t)a2, &v9);
  if (v9)
  {

    id v9 = 0;
  }
  BOOL v5 = v7 != 0;
  if (v7) {

  }
  if (v11) {
  return v5;
  }
}

void re::DirectTexture::newPayload(id a1@<X3>, uint64_t a2@<X0>, int a3@<W1>, uint64_t a4@<X2>, re::DirectMemoryResource **a5@<X8>)
{
  if (a1 && a3 == 3 && !a4) {
    re::DirectTexture::allocatePayload(a1, a2, (*(_DWORD *)(*(void *)(a2 + 128) + 36) >> 3) & 1, a5);
  }
  else {
    *a5 = 0;
  }
}

uint64_t re::DirectTexture::payload(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result = 0;
  if (a2 == 3 && !a3) {
    return *(void *)(a1 + 128);
  }
  return result;
}

uint64_t re::DirectTexture::setPayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t result = re::DirectMemoryResource::bindToResource(*a4, 2, a2);
  if (result)
  {
    uint64_t result = 0;
    if (a2 == 3 && !a3)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      if (v9) {
        (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)v9 + 40))(v9, a1, a2, 0);
      }
      uint64_t v10 = *(void *)(a1 + 128);
      *(void *)(a1 + 128) = *a4;
      *a4 = v10;
      uint64_t v11 = *(void *)(a1 + 40);
      if (v11) {
        (*(void (**)(uint64_t, uint64_t, uint64_t, void))(*(void *)v11 + 48))(v11, a1, a2, 0);
      }
      return 1;
    }
  }
  return result;
}

uint64_t re::DirectTexture::forEachSlot(uint64_t a1, uint64_t a2)
{
  return std::function<void ()(re::DirectResourceSlot)>::operator()(a2, 3, 0);
}

id re::DirectTexture::readTexture@<X0>(re::DirectMemoryResource **this@<X0>, void *a2@<X8>)
{
  id result = *(id *)re::DirectMemoryResource::runtimeResource(this[16]);
  *a2 = result;
  return result;
}

id re::DirectTexture::replaceTexture@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X8>)
{
  re::DirectResource::willChange(a1, 3, 0, 1, a2);
  id result = *(id *)re::DirectMemoryResource::runtimeResource(*(re::DirectMemoryResource **)(a1 + 128));
  *a3 = result;
  return result;
}

void re::DirectTexture::~DirectTexture(re::DirectTexture *this)
{
  uint64_t v2 = *((void *)this + 16);
  if (v2)
  {

    *((void *)this + 16) = 0;
  }
  uint64_t v3 = (void *)*((void *)this + 15);
  if (v3)
  {

    *((void *)this + 15) = 0;
  }

  re::DirectResource::~DirectResource(this);
}

{
  uint64_t v2;
  void *v3;
  uint64_t vars8;

  uint64_t v2 = *((void *)this + 16);
  if (v2)
  {

    *((void *)this + 16) = 0;
  }
  uint64_t v3 = (void *)*((void *)this + 15);
  if (v3)
  {

    *((void *)this + 15) = 0;
  }
  re::DirectResource::~DirectResource(this);

  JUMPOUT(0x2533130A0);
}

uint64_t re::DirectTexture::type(re::DirectTexture *this)
{
  return 2;
}

void re::DirectMesh::create(_OWORD *a1@<X0>, void **a2@<X1>, void *a3@<X8>)
{
  if (*a2 && (re::DirectMeshValidation::isWellFormed((uint64_t)a1) & 1) != 0)
  {
    uint64_t v6 = (char *)operator new(0xB8uLL);
    id v7 = (unint64_t *)re::DirectMesh::DirectMesh((uint64_t)v6, a1);
    if (re::DirectMesh::allocateStorage(v7, (uint64_t)a2))
    {
      re::DirectMesh::attachToDevice((uint64_t)v6, *a2);
      *a3 = v6;
    }
    else
    {
      *a3 = 0;
    }
  }
  else
  {
    *a3 = 0;
  }
}

BOOL re::DirectMesh::allocateStorage(unint64_t *a1, uint64_t a2)
{
  uint64_t v3 = *(void **)a2;
  if (*(unsigned char *)(a2 + 8)) {
    char v4 = -1;
  }
  else {
    char v4 = -9;
  }
  re::calculateBufferSizes(a1 + 6, (uint64_t)v20);
  if (!v21) {
    return 0;
  }
  BOOL v5 = (re::DirectMemoryResource *)(v4 & 0xB);
  re::DirectMemoryResource::create(v20[0], (re::DirectMemoryResource *)(v4 & 0xF), v3, &v19);
  unint64_t v6 = a1[18];
  unint64_t v7 = v19;
  a1[18] = v19;
  unint64_t v19 = v6;
  char v8 = v7 != 0;
  if (v6) {

  }
  uint64_t v9 = 0;
  uint64_t v10 = a1 + 19;
  do
  {
    char v11 = v8;
    uint64_t v12 = v20[v9 + 1];
    v8 &= v12 == 0;
    if (v12)
    {
      if (v11)
      {
        re::DirectMemoryResource::create(v12, v5, v3, &v19);
        unint64_t v13 = v10[v9];
        unint64_t v14 = v19;
        v10[v9] = v19;
        unint64_t v19 = v13;
        char v8 = v14 != 0;
        if (v13) {
      }
        }
    }
    ++v9;
  }
  while (v9 != 4);
  if (v8)
  {
    re::DirectMemoryResource::create((re::MemoryMappedRegion *)0x300, (re::DirectMemoryResource *)5, v3, &v19);
    unint64_t v15 = a1[17];
    unint64_t v16 = v19;
    a1[17] = v19;
    unint64_t v19 = v15;
    BOOL v17 = v16 != 0;
    if (v15) {
  }
    }
  else
  {
    BOOL v17 = 0;
  }
  a1[16] = 0;
  return v17;
}

uint64_t re::DirectMesh::attachToDevice(uint64_t a1, void *a2)
{
  char v4 = (uint64_t *)(a1 + 144);
  BOOL v5 = (uint64_t *)(a1 + 136);
  unint64_t v6 = (uint64_t *)&re::DirectMesh::attachToDevice(MTL::Device *)::gpuSlots;
  do
  {
    int v7 = *(_DWORD *)v6;
    char v8 = v5;
    if (*(_DWORD *)v6)
    {
      if (v7 == 2)
      {
        unint64_t v9 = v6[1];
        if (v9 > 3) {
          goto LABEL_15;
        }
        char v8 = (uint64_t *)(a1 + 8 * v9 + 152);
      }
      else
      {
        char v8 = v4;
        if (v7 != 1) {
          goto LABEL_15;
        }
      }
    }
    uint64_t v10 = (re::DirectMemoryResource *)*v8;
    if (*v8)
    {
      uint64_t result = re::DirectMemoryResource::bindToResource(*v8, 1, v7);
      if (!result) {
        return result;
      }
      if (!*(void *)re::DirectMemoryResource::runtimeResource(v10))
      {
        re::DirectMemoryResource::makeBuffer(a2, (uint64_t)v10, &v13);
        id v12 = v13;
        id v13 = 0;
        id v14 = v12;
        re::DirectMemoryResource::setRuntimeResource((uint64_t)v10, &v14);
        if (v14)
        {

          id v14 = 0;
        }
        if (v13) {
      }
        }
    }
LABEL_15:
    v6 += 2;
  }
  while (v6 != &re::DirectMesh::forEachSlot(std::function<void ()(re::DirectResourceSlot)> const&)const::allSlots);
  return 1;
}

uint64_t re::DirectMesh::DirectMesh(uint64_t a1, _OWORD *a2)
{
  char v4 = re::DirectResource::DirectResource((re::DirectResource *)a1);
  *(void *)char v4 = &unk_26FF35290;
  long long v5 = a2[1];
  *((_OWORD *)v4 + 3) = *a2;
  *((_OWORD *)v4 + 4) = v5;
  std::vector<re::DirectMeshVertexAttribute>::vector((void *)v4 + 10, (uint64_t)(a2 + 2));
  std::vector<re::DirectMeshVertexLayout>::vector((void *)(a1 + 104), (uint64_t)a2 + 56);
  *(void *)(a1 + 176) = 0;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  return a1;
}

void re::DirectMesh::~DirectMesh(re::DirectMesh *this)
{
  for (uint64_t i = 176; i != 144; i -= 8)
  {
    uint64_t v3 = *(void *)((char *)this + i);
    if (v3)
    {

      *(void *)((char *)this + i) = 0;
    }
  }
  uint64_t v4 = *((void *)this + 18);
  if (v4)
  {

    *((void *)this + 18) = 0;
  }
  uint64_t v5 = *((void *)this + 17);
  if (v5)
  {

    *((void *)this + 17) = 0;
  }
  unint64_t v6 = (void *)*((void *)this + 13);
  if (v6)
  {
    *((void *)this + 14) = v6;
    operator delete(v6);
  }
  int v7 = (void *)*((void *)this + 10);
  if (v7)
  {
    *((void *)this + 11) = v7;
    operator delete(v7);
  }

  re::DirectResource::~DirectResource(this);
}

{
  uint64_t vars8;

  re::DirectMesh::~DirectMesh(this);

  JUMPOUT(0x2533130A0);
}

unint64_t re::calculateBufferSizes@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  memset(&v15[8], 0, 32);
  unint64_t result = re::lengthInBytes(a1[1]);
  if (is_mul_ok(result, *a1))
  {
    *(void *)unint64_t v15 = result * *a1;
    uint64_t v6 = a1[4];
    unint64_t v7 = a1[5];
    if (v6 == v7)
    {
LABEL_10:
      long long v14 = *(_OWORD *)&v15[16];
      *(_OWORD *)a2 = *(_OWORD *)v15;
      *(_OWORD *)(a2 + 16) = v14;
      *(void *)(a2 + 32) = *(void *)&v15[32];
      char v5 = 1;
      goto LABEL_11;
    }
    while (1)
    {
      unint64_t v8 = *(void *)(v6 + 16);
      unint64_t v9 = a1[7];
      if (v8 >= 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(a1[8] - v9) >> 3)) {
        break;
      }
      uint64_t v10 = (void *)(v9 + 40 * v8);
      if (*v10 >= 4uLL) {
        break;
      }
      unint64_t result = re::lengthInBytes(v6, v10, a1[3]);
      if (!v11) {
        break;
      }
      id v12 = &v15[8 * *v10];
      unint64_t v13 = *((void *)v12 + 1);
      if (v13 <= result) {
        unint64_t v13 = result;
      }
      *((void *)v12 + 1) = v13;
      v6 += 32;
      if (v6 == v7) {
        goto LABEL_10;
      }
    }
  }
  char v5 = 0;
  *(unsigned char *)a2 = 0;
LABEL_11:
  *(unsigned char *)(a2 + 40) = v5;
  return result;
}

re::DirectMemoryResource *re::DirectMesh::isAttachedToDevice(re::DirectMesh *this)
{
  unint64_t result = (re::DirectMemoryResource *)*((void *)this + 18);
  if (result) {
    return (re::DirectMemoryResource *)(*(void *)re::DirectMemoryResource::runtimeResource(result) != 0);
  }
  return result;
}

uint64_t re::DirectMesh::payload(uint64_t a1, int a2, unint64_t a3)
{
  switch(a2)
  {
    case 2:
      if (a3 <= 3)
      {
        uint64_t v3 = a1 + 8 * a3 + 152;
        return *(void *)v3;
      }
      break;
    case 1:
      uint64_t v3 = a1 + 144;
      return *(void *)v3;
    case 0:
      uint64_t v3 = a1 + 136;
      return *(void *)v3;
  }
  return 0;
}

uint64_t re::DirectMesh::indexPayload(re::DirectMesh *this)
{
  return *((void *)this + 18);
}

uint64_t re::DirectMesh::partsPayload(re::DirectMesh *this)
{
  return *((void *)this + 17);
}

uint64_t re::DirectMesh::vertexPayload(re::DirectMesh *this, unint64_t a2)
{
  if (a2 > 3) {
    return 0;
  }
  else {
    return *((void *)this + a2 + 19);
  }
}

id re::DirectMesh::parts(re::DirectMemoryResource **this)
{
  return re::DirectMemoryResource::bytes(this[17]);
}

void re::DirectMesh::setParts(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = a3;
  if (a3) {
    id v5 = (id)(a3 + 8);
  }
  re::DirectMesh::setPayload(a1, 0, 0, &v6);
  if (v6) {

  }
  if (*(void *)(a1 + 128) != a2)
  {
    re::DirectResource::willChange(a1, 0, 0, 0, 0);
    *(void *)(a1 + 128) = a2;
    re::DirectResource::didChange(a1, 0, 0, 0);
  }
}

uint64_t re::DirectMesh::setPayload(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t *a4)
{
  uint64_t result = re::DirectMemoryResource::bindToResource(*a4, 1, a2);
  if (!result) {
    return result;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, unint64_t))(*(void *)v9 + 40))(v9, a1, a2, a3);
  }
  if (a2 == 2)
  {
    if (a3 <= 3)
    {
      uint64_t v11 = *a4;
      uint64_t v10 = (uint64_t *)(a1 + 8 * a3 + 152);
      uint64_t v14 = *a4;
      *a4 = 0;
      id v12 = &v14;
      goto LABEL_12;
    }
    return 0;
  }
  if (a2 == 1)
  {
    uint64_t v10 = (uint64_t *)(a1 + 144);
    uint64_t v11 = *a4;
    uint64_t v15 = *a4;
    *a4 = 0;
    id v12 = &v15;
    goto LABEL_12;
  }
  if (a2) {
    return 0;
  }
  uint64_t v10 = (uint64_t *)(a1 + 136);
  uint64_t v11 = *a4;
  uint64_t v16 = *a4;
  *a4 = 0;
  id v12 = &v16;
LABEL_12:
  re::DirectMesh::replaceInternal(a1, v10, v12);
  if (v11) {

  }
  uint64_t v13 = *(void *)(a1 + 40);
  if (v13) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, unint64_t))(*(void *)v13 + 48))(v13, a1, a2, a3);
  }
  return 1;
}

uint64_t re::DirectMesh::setPartCount(uint64_t this, unint64_t a2)
{
  if (*(void *)(this + 128) != a2)
  {
    uint64_t v3 = this;
    re::DirectResource::willChange(this, 0, 0, 0, 0);
    unint64_t v4 = *(void *)(v3 + 128);
    unint64_t v5 = *(void *)(*(void *)(v3 + 136) + 40) / 0x60uLL;
    if (v5 < a2)
    {
      unint64_t v6 = 2 * v5;
      if (v6 <= a2) {
        unint64_t v6 = a2;
      }
      re::DirectMemoryResource::create((re::MemoryMappedRegion *)(96 * v6), (re::DirectMemoryResource *)5, 0, &v14);
      if (v14)
      {
        id v7 = re::DirectMemoryResource::bytes(v14);
        id v8 = re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(v3 + 136));
        memcpy(v7, v8, 96 * v4);
        uint64_t v13 = v14;
        if (v14) {
          uint64_t v9 = (char *)v14 + 8;
        }
      }
      else
      {
        uint64_t v13 = 0;
      }
      re::DirectMesh::setPayload(v3, 0, 0, (uint64_t *)&v13);
      if (v13) {

      }
      if (v14) {
    }
      }
    *(void *)(v3 + 128) = a2;
    BOOL v10 = a2 > v4;
    unint64_t v11 = a2 - v4;
    if (v10)
    {
      id v12 = (char *)re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(v3 + 136)) + 96 * v4 + 24;
      do
      {
        *((void *)v12 - 3) = 0;
        *((void *)v12 - 2) = 0;
        *((void *)v12 - 1) = 3;
        *(void *)id v12 = 0;
        *((void *)v12 + 1) = 0;
        *(_OWORD *)(v12 + 24) = 0uLL;
        *(_OWORD *)(v12 + 40) = 0uLL;
        *((void *)v12 + 7) = 0;
        v12 += 96;
        --v11;
      }
      while (v11);
    }
    return re::DirectResource::didChange(v3, 0, 0, 0);
  }
  return this;
}

uint64_t re::DirectMesh::updateParts(uint64_t a1, uint64_t a2)
{
  re::DirectResource::willChange(a1, 0, 0, 0, 0);
  id v4 = re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(a1 + 136));
  (*(void (**)(uint64_t, id, void))(a2 + 16))(a2, v4, *(void *)(a1 + 128));

  return re::DirectResource::didChange(a1, 0, 0, 0);
}

uint64_t re::DirectMesh::readBuffer(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 <= 3 && (uint64_t v4 = a1 + 8 * a2, v7 = *(re::DirectMemoryResource **)(v4 + 152), v6 = v4 + 152, (v5 = v7) != 0))
  {
    id v8 = re::DirectMemoryResource::bytes(v5);
    uint64_t v9 = *(void *)(*(void *)v6 + 40);
    BOOL v10 = *(uint64_t (**)(uint64_t, id, uint64_t))(a3 + 16);
    uint64_t v11 = a3;
  }
  else
  {
    BOOL v10 = *(uint64_t (**)(uint64_t, id, uint64_t))(a3 + 16);
    uint64_t v11 = a3;
    id v8 = 0;
    uint64_t v9 = 0;
  }

  return v10(v11, v8, v9);
}

uint64_t re::DirectMesh::readIndices(uint64_t a1, uint64_t a2)
{
  id v4 = re::DirectMemoryResource::bytes(*(re::DirectMemoryResource **)(a1 + 144));
  uint64_t v5 = *(void *)(*(void *)(a1 + 144) + 40);
  uint64_t v6 = *(uint64_t (**)(uint64_t, id, uint64_t))(a2 + 16);

  return v6(a2, v4, v5);
}

uint64_t re::DirectMesh::updateBuffer(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 <= 3 && (unint64_t v6 = a1 + 8 * a2, v8 = *(void *)(v6 + 152), v7 = (re::DirectMemoryResource **)(v6 + 152), v8))
  {
    re::DirectResource::willChange(a1, 2, a2, 0, 0);
    id v9 = re::DirectMemoryResource::bytes(*v7);
    (*(void (**)(uint64_t, id, void))(a3 + 16))(a3, v9, *((void *)*v7 + 5));
    return re::DirectResource::didChange(a1, 2, a2, 0);
  }
  else
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, void, void))(a3 + 16);
    return v11(a3, 0, 0);
  }
}

{
  unint64_t v3;
  re::DirectMemoryResource **v4;
  uint64_t v5;

  if (a2 > 3) {
    return 0;
  }
  uint64_t v3 = a1 + 8 * a2;
  uint64_t v5 = *(void *)(v3 + 152);
  id v4 = (re::DirectMemoryResource **)(v3 + 152);
  if (!v5) {
    return 0;
  }
  re::DirectResource::willChange(a1, 2, a2, 0, a3);
  return *(void *)re::DirectMemoryResource::runtimeResource(*v4);
}

uint64_t re::DirectMesh::updateIndices(re::DirectMemoryResource **a1, uint64_t a2)
{
  re::DirectResource::willChange((uint64_t)a1, 1, 0, 0, 0);
  id v4 = re::DirectMemoryResource::bytes(a1[18]);
  (*(void (**)(uint64_t, id, void))(a2 + 16))(a2, v4, *((void *)a1[18] + 5));
  re::DirectMesh::validateIndices((re::DirectMesh *)a1);

  return re::DirectResource::didChange((uint64_t)a1, 1, 0, 0);
}

BOOL re::DirectMesh::validateIndices(re::DirectMesh *this)
{
  uint64_t v2 = *((void *)this + 7);
  uint64_t v3 = re::DirectMemoryResource::bytes(*((re::DirectMemoryResource **)this + 18));
  return re::DirectMeshValidation::validateAndFixupIndices(v2, v3, *(void *)(*((void *)this + 18) + 40), *((void *)this + 9)) == 0;
}

uint64_t re::DirectMesh::replaceBuffer(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a2 <= 3 && (unint64_t v6 = a1 + 8 * a2, v8 = *(void *)(v6 + 152), v7 = (re::DirectMemoryResource **)(v6 + 152), v8))
  {
    re::DirectResource::willChange(a1, 2, a2, 1, 0);
    id v9 = re::DirectMemoryResource::bytes(*v7);
    (*(void (**)(uint64_t, id, void))(a3 + 16))(a3, v9, *((void *)*v7 + 5));
    return re::DirectResource::didChange(a1, 2, a2, 0);
  }
  else
  {
    uint64_t v11 = *(uint64_t (**)(uint64_t, void, void))(a3 + 16);
    return v11(a3, 0, 0);
  }
}

{
  unint64_t v3;
  re::DirectMemoryResource **v4;
  uint64_t v5;

  if (a2 > 3) {
    return 0;
  }
  uint64_t v3 = a1 + 8 * a2;
  uint64_t v5 = *(void *)(v3 + 152);
  id v4 = (re::DirectMemoryResource **)(v3 + 152);
  if (!v5) {
    return 0;
  }
  re::DirectResource::willChange(a1, 2, a2, 1, a3);
  return *(void *)re::DirectMemoryResource::runtimeResource(*v4);
}

uint64_t re::DirectMesh::replaceIndices(re::DirectMemoryResource **a1, uint64_t a2)
{
  re::DirectResource::willChange((uint64_t)a1, 1, 0, 1, 0);
  id v4 = re::DirectMemoryResource::bytes(a1[18]);
  (*(void (**)(uint64_t, id, void))(a2 + 16))(a2, v4, *((void *)a1[18] + 5));
  re::DirectMesh::validateIndices((re::DirectMesh *)a1);

  return re::DirectResource::didChange((uint64_t)a1, 1, 0, 0);
}

re::DirectMemoryResource *re::DirectMesh::readBuffer(uint64_t a1, unint64_t a2)
{
  if (a2 > 3) {
    return 0;
  }
  uint64_t result = *(re::DirectMemoryResource **)(a1 + 8 * a2 + 152);
  if (result) {
    return *(re::DirectMemoryResource **)re::DirectMemoryResource::runtimeResource(result);
  }
  return result;
}

uint64_t re::DirectMesh::readIndices(uint64_t a1)
{
  return *(void *)re::DirectMemoryResource::runtimeResource(*(re::DirectMemoryResource **)(a1 + 144));
}

uint64_t re::DirectMesh::updateIndices(uint64_t a1, uint64_t a2)
{
  return *(void *)re::DirectMemoryResource::runtimeResource(*(re::DirectMemoryResource **)(a1 + 144));
}

uint64_t re::DirectMesh::replaceIndices(uint64_t a1, uint64_t a2)
{
  return *(void *)re::DirectMemoryResource::runtimeResource(*(re::DirectMemoryResource **)(a1 + 144));
}

void re::DirectMesh::replaceInternal(uint64_t a1, uint64_t *a2, uint64_t *a3)
{
  unint64_t v6 = *(re::DirectMemoryResource **)(a1 + 144);
  if (v6 && *(void *)re::DirectMemoryResource::runtimeResource(v6))
  {
    id v7 = objc_msgSend(*(id *)re::DirectMemoryResource::runtimeResource(*(re::DirectMemoryResource **)(a1 + 144)), sel_device);
    re::SharedPtr<re::DirectBuffer>::reset(a2, *a3);
    if (v7 && !*(void *)re::DirectMemoryResource::runtimeResource((re::DirectMemoryResource *)*a3))
    {
      uint64_t v8 = *a3;
      re::DirectMemoryResource::makeBuffer(v7, v8, &v11);
      id v9 = v11;
      id v11 = 0;
      id v12 = v9;
      re::DirectMemoryResource::setRuntimeResource(v8, &v12);
      if (v12)
      {

        id v12 = 0;
      }
      if (v11) {
    }
      }
  }
  else
  {
    uint64_t v10 = *a3;
    re::SharedPtr<re::DirectBuffer>::reset(a2, v10);
  }
}

uint64_t re::DirectMesh::forEachSlot(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = &re::DirectMesh::forEachSlot(std::function<void ()(re::DirectResourceSlot)> const&)const::allSlots;
  do
  {
    uint64_t v4 = *v3;
    uint64_t v5 = v3[1];
    v3 += 2;
    uint64_t result = std::function<void ()(re::DirectResourceSlot)>::operator()(a2, v4, v5);
  }
  while (v3 != (uint64_t *)"@(#)PROGRAM:DirectResource  PROJECT:DirectResource-\n");
  return result;
}

uint64_t re::DirectMesh::type(re::DirectMesh *this)
{
  return 1;
}

uint64_t DRMeshDescriptorCreate()
{
  re::make::shared::object<re::DirectMeshDescriptor>(&v1);
  if (v1) {
    return v1 + 8;
  }
  else {
    return 0;
  }
}

uint64_t DRMeshDescriptorGetVertexBufferCount(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 32);
}

uint64_t DRMeshDescriptorSetVertexBufferCount(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t DRMeshDescriptorGetVertexCapacity(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 40);
}

uint64_t DRMeshDescriptorSetVertexCapacity(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t DRMeshDescriptorGetIndexCapacity(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 16);
}

uint64_t DRMeshDescriptorSetIndexCapacity(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t DRMeshDescriptorGetIndexType(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 24);
}

uint64_t DRMeshDescriptorSetIndexType(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t DRMeshDescriptorGetVertexAttributeCount(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return (uint64_t)(*(void *)(v1 + 56) - *(void *)(v1 + 48)) >> 5;
}

void DRMeshDescriptorSetVertexAttributeCount(void *a1, unint64_t a2)
{
  uint64_t v3 = a1;
  id v18 = v3;
  if (v3) {
    uint64_t v4 = v3 - 8;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *((void *)v4 + 6);
  unint64_t v6 = (char *)*((void *)v4 + 7);
  unint64_t v7 = (uint64_t)&v6[-v5] >> 5;
  if (v7 < a2)
  {
    uint64_t v8 = v4 + 64;
    do
    {
      memset(v19, 0, 28);
      if ((unint64_t)v6 >= *v8)
      {
        if ((v7 + 1) >> 59) {
          abort();
        }
        uint64_t v9 = *v8 - v5;
        uint64_t v10 = v9 >> 4;
        if (v9 >> 4 <= v7 + 1) {
          uint64_t v10 = v7 + 1;
        }
        if ((unint64_t)v9 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v11 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v11 = v10;
        }
        if (v11) {
          id v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<std::function<void ()(re::DirectFence *)>>>((uint64_t)(v4 + 64), v11);
        }
        else {
          id v12 = 0;
        }
        uint64_t v13 = &v12[32 * v7];
        *(_DWORD *)uint64_t v13 = -1;
        *(void *)(v13 + 4) = 0;
        *(void *)(v13 + 20) = 0;
        *(void *)(v13 + 12) = 0;
        *((_DWORD *)v13 + 7) = 0;
        uint64_t v15 = (char *)*((void *)v4 + 6);
        uint64_t v14 = (char *)*((void *)v4 + 7);
        uint64_t v16 = v13;
        if (v14 != v15)
        {
          do
          {
            long long v17 = *((_OWORD *)v14 - 1);
            *((_OWORD *)v16 - 2) = *((_OWORD *)v14 - 2);
            *((_OWORD *)v16 - 1) = v17;
            v16 -= 32;
            v14 -= 32;
          }
          while (v14 != v15);
          uint64_t v14 = (char *)*((void *)v4 + 6);
        }
        unint64_t v6 = v13 + 32;
        *((void *)v4 + 6) = v16;
        *((void *)v4 + 7) = v13 + 32;
        *((void *)v4 + 8) = &v12[32 * v11];
        if (v14) {
          operator delete(v14);
        }
      }
      else
      {
        *(_DWORD *)unint64_t v6 = -1;
        *((_OWORD *)v6 + 1) = *(_OWORD *)((char *)v19 + 12);
        *(_OWORD *)(v6 + 4) = v19[0];
        v6 += 32;
      }
      *((void *)v4 + 7) = v6;
      uint64_t v5 = *((void *)v4 + 6);
      unint64_t v7 = (uint64_t)&v6[-v5] >> 5;
    }
    while (v7 < a2);
  }
}

BOOL DRMeshDescriptorGetVertexAttributeFormat(uint64_t a1, unint64_t a2, _DWORD *a3, void *a4, void *a5, void *a6)
{
  uint64_t v6 = a1 - 8;
  if (!a1) {
    uint64_t v6 = 0;
  }
  uint64_t v7 = *(void *)(v6 + 48);
  unint64_t v8 = (*(void *)(v6 + 56) - v7) >> 5;
  if (v8 > a2)
  {
    uint64_t v9 = v7 + 32 * a2;
    *a3 = *(_DWORD *)v9;
    uint64_t v10 = *(void *)(v9 + 16);
    *a4 = *(void *)(v9 + 8);
    *a5 = v10;
    *a6 = *(void *)(v9 + 24);
  }
  return v8 > a2;
}

uint64_t DRMeshDescriptorSetVertexAttributeFormat(uint64_t result, unint64_t a2, int a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = result - 8;
  if (!result) {
    uint64_t v6 = 0;
  }
  uint64_t v8 = v6 + 48;
  uint64_t v7 = *(void *)(v6 + 48);
  if (a2 < (*(void *)(v8 + 8) - v7) >> 5)
  {
    uint64_t v9 = v7 + 32 * a2;
    *(_DWORD *)uint64_t v9 = a3;
    *(void *)(v9 + 8) = a4;
    *(void *)(v9 + 16) = a5;
    *(void *)(v9 + 24) = a6;
  }
  return result;
}

unint64_t DRMeshDescriptorGetVertexLayoutCount(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*(void *)(v1 + 80) - *(void *)(v1 + 72)) >> 3);
}

void DRMeshDescriptorSetVertexLayoutCount(void *a1, unint64_t a2)
{
  uint64_t v3 = a1;
  id v19 = v3;
  if (v3) {
    uint64_t v4 = v3 - 8;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *((void *)v4 + 9);
  uint64_t v6 = (char *)*((void *)v4 + 10);
  unint64_t v7 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v6[-v5] >> 3);
  if (v7 < a2)
  {
    uint64_t v8 = v4 + 88;
    int64x2_t v20 = vdupq_n_s64(1uLL);
    do
    {
      if ((unint64_t)v6 >= *v8)
      {
        if (v7 + 1 > 0x666666666666666) {
          abort();
        }
        unint64_t v9 = 0xCCCCCCCCCCCCCCCDLL * ((*v8 - v5) >> 3);
        uint64_t v10 = 2 * v9;
        if (2 * v9 <= v7 + 1) {
          uint64_t v10 = v7 + 1;
        }
        if (v9 >= 0x333333333333333) {
          unint64_t v11 = 0x666666666666666;
        }
        else {
          unint64_t v11 = v10;
        }
        if (v11) {
          id v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<re::DirectMeshVertexLayout>>((uint64_t)(v4 + 88), v11);
        }
        else {
          id v12 = 0;
        }
        uint64_t v13 = &v12[40 * v7];
        *(void *)uint64_t v13 = 0;
        *((void *)v13 + 1) = 0;
        *((void *)v13 + 2) = 0;
        *(int64x2_t *)(v13 + 24) = vdupq_n_s64(1uLL);
        uint64_t v15 = (char *)*((void *)v4 + 9);
        uint64_t v14 = (char *)*((void *)v4 + 10);
        uint64_t v16 = v13;
        if (v14 != v15)
        {
          do
          {
            long long v17 = *(_OWORD *)(v14 - 40);
            long long v18 = *(_OWORD *)(v14 - 24);
            *((void *)v16 - 1) = *((void *)v14 - 1);
            *(_OWORD *)(v16 - 24) = v18;
            *(_OWORD *)(v16 - 40) = v17;
            v16 -= 40;
            v14 -= 40;
          }
          while (v14 != v15);
          uint64_t v14 = (char *)*((void *)v4 + 9);
        }
        uint64_t v6 = v13 + 40;
        *((void *)v4 + 9) = v16;
        *((void *)v4 + 10) = v13 + 40;
        *((void *)v4 + 11) = &v12[40 * v11];
        if (v14) {
          operator delete(v14);
        }
      }
      else
      {
        *(void *)uint64_t v6 = 0;
        *((void *)v6 + 1) = 0;
        *((void *)v6 + 2) = 0;
        *(int64x2_t *)(v6 + 24) = v20;
        v6 += 40;
      }
      *((void *)v4 + 10) = v6;
      uint64_t v5 = *((void *)v4 + 9);
      unint64_t v7 = 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)&v6[-v5] >> 3);
    }
    while (v7 < a2);
  }
}

BOOL DRMeshDescriptorGetVertexLayout(uint64_t a1, unint64_t a2, void *a3, void *a4, void *a5)
{
  uint64_t v5 = a1 - 8;
  if (!a1) {
    uint64_t v5 = 0;
  }
  uint64_t v6 = *(void *)(v5 + 72);
  unint64_t v7 = 0xCCCCCCCCCCCCCCCDLL * ((*(void *)(v5 + 80) - v6) >> 3);
  if (v7 > a2)
  {
    uint64_t v8 = (void *)(v6 + 40 * a2);
    *a3 = *v8;
    *a4 = v8[1];
    *a5 = v8[2];
  }
  return v7 > a2;
}

uint64_t DRMeshDescriptorSetVertexLayout(uint64_t result, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5 = result - 8;
  if (!result) {
    uint64_t v5 = 0;
  }
  uint64_t v7 = v5 + 72;
  uint64_t v6 = *(void *)(v5 + 72);
  if (0xCCCCCCCCCCCCCCCDLL * ((*(void *)(v7 + 8) - v6) >> 3) > a2)
  {
    uint64_t v8 = (void *)(v6 + 40 * a2);
    void *v8 = a3;
    v8[1] = a4;
    v8[2] = a5;
  }
  return result;
}

uint64_t DRMeshCreateUnmanaged(uint64_t a1, void *a2, CFErrorRef *a3)
{
  id v5 = a2;
  uint64_t v13 = v5;
  char v14 = 0;
  uint64_t v6 = a1 - 8;
  if (!a1) {
    uint64_t v6 = 0;
  }
  re::DirectMesh::create((_OWORD *)(v6 + 16), &v13, &v12);
  uint64_t v7 = v12;
  if (a3 && !v12)
  {
    userInfoValues = (void *)CFStringCreateWithCString(0, "Direct Mesh Validation Failed", 0x8000100u);
    userInfoKeys = (void *)*MEMORY[0x263EFFC48];
    *a3 = CFErrorCreateWithUserInfoKeysAndValues(0, @"DRMeshErrorDomain", 100, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(userInfoValues);
    uint64_t v7 = v12;
  }
  if (v7) {
    uint64_t v8 = v7 + 8;
  }
  else {
    uint64_t v8 = 0;
  }

  return v8;
}

uint64_t DRMeshCopyDescriptor(void *a1)
{
  uint64_t v1 = a1;
  re::make::shared::object<re::DirectMeshDescriptor>(&v35);
  uint64_t v2 = v35;
  uint64_t v3 = (char *)(v35 + 16);
  if (v1) {
    uint64_t v4 = v1 - 8;
  }
  else {
    uint64_t v4 = 0;
  }
  long long v5 = *((_OWORD *)v4 + 4);
  *(_OWORD *)(v35 + 16) = *((_OWORD *)v4 + 3);
  *(_OWORD *)(v2 + 32) = v5;
  if (v3 != v4 + 48)
  {
    uint64_t v6 = *(char **)(v2 + 48);
    uint64_t v7 = (char *)*((void *)v4 + 10);
    uint64_t v8 = (unsigned char *)*((void *)v4 + 11);
    size_t v9 = v8 - v7;
    unint64_t v10 = (v8 - v7) >> 5;
    uint64_t v11 = *(void *)(v2 + 64);
    if (v10 <= (v11 - (uint64_t)v6) >> 5)
    {
      char v14 = *(unsigned char **)(v2 + 56);
      unint64_t v15 = (v14 - v6) >> 5;
      if (v15 < v10)
      {
        uint64_t v16 = &v7[32 * v15];
        if (v14 != v6)
        {
          memmove(*(void **)(v2 + 48), *((const void **)v4 + 10), v14 - v6);
          uint64_t v6 = *(char **)(v2 + 56);
        }
        size_t v9 = v8 - v16;
        if (v8 == v16) {
          goto LABEL_23;
        }
        long long v17 = v6;
        long long v18 = v16;
        goto LABEL_22;
      }
    }
    else
    {
      if (v6)
      {
        *(void *)(v2 + 56) = v6;
        operator delete(v6);
        uint64_t v11 = 0;
        *(void *)(v2 + 48) = 0;
        *(void *)(v2 + 56) = 0;
        *(void *)(v2 + 64) = 0;
      }
      if ((v9 & 0x8000000000000000) != 0) {
        goto LABEL_43;
      }
      uint64_t v12 = v11 >> 4;
      if (v11 >> 4 <= v10) {
        uint64_t v12 = (v8 - v7) >> 5;
      }
      if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v13 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v13 = v12;
      }
      std::vector<re::DirectMeshVertexAttribute>::__vallocate[abi:nn180100]((void *)(v2 + 48), v13);
      uint64_t v6 = *(char **)(v2 + 56);
    }
    if (v8 == v7)
    {
LABEL_23:
      id v19 = &v6[v9];
      int64x2_t v20 = *(char **)(v2 + 72);
      *(void *)(v2 + 56) = v19;
      char v21 = (char *)*((void *)v4 + 13);
      unint64_t v22 = (unsigned char *)*((void *)v4 + 14);
      size_t v23 = v22 - v21;
      unint64_t v24 = 0xCCCCCCCCCCCCCCCDLL * ((v22 - v21) >> 3);
      uint64_t v25 = *(void *)(v2 + 88);
      if (0xCCCCCCCCCCCCCCCDLL * ((v25 - (uint64_t)v20) >> 3) >= v24)
      {
        unint64_t v29 = (void **)(v2 + 80);
        uint64_t v30 = *(unsigned char **)(v2 + 80);
        if (0xCCCCCCCCCCCCCCCDLL * ((v30 - v20) >> 3) < v24)
        {
          int64x2_t v31 = &v21[8 * ((v30 - v20) >> 3)];
          if (v30 != v20)
          {
            memmove(v20, v21, v30 - v20);
            int64x2_t v20 = (char *)*v29;
          }
          size_t v23 = v22 - v31;
          if (v22 == v31) {
            goto LABEL_41;
          }
          long long v32 = v20;
          long long v33 = v31;
          goto LABEL_40;
        }
LABEL_38:
        if (v22 == v21)
        {
LABEL_41:
          *unint64_t v29 = &v20[v23];
          goto LABEL_42;
        }
        long long v32 = v20;
        long long v33 = v21;
LABEL_40:
        memmove(v32, v33, v23);
        goto LABEL_41;
      }
      if (v20)
      {
        *(void *)(v2 + 80) = v20;
        operator delete(v20);
        uint64_t v25 = 0;
        *(void *)(v2 + 72) = 0;
        *(void *)(v2 + 80) = 0;
        *(void *)(v2 + 88) = 0;
      }
      if (v24 <= 0x666666666666666)
      {
        unint64_t v26 = 0xCCCCCCCCCCCCCCCDLL * (v25 >> 3);
        uint64_t v27 = 2 * v26;
        if (2 * v26 <= v24) {
          uint64_t v27 = 0xCCCCCCCCCCCCCCCDLL * ((v22 - v21) >> 3);
        }
        if (v26 >= 0x333333333333333) {
          unint64_t v28 = 0x666666666666666;
        }
        else {
          unint64_t v28 = v27;
        }
        std::vector<re::DirectMeshVertexLayout>::__vallocate[abi:nn180100]((void *)(v2 + 72), v28);
        unint64_t v29 = (void **)(v2 + 80);
        int64x2_t v20 = *(char **)(v2 + 80);
        goto LABEL_38;
      }
LABEL_43:
      abort();
    }
    long long v17 = v6;
    long long v18 = v7;
LABEL_22:
    memmove(v17, v18, v9);
    goto LABEL_23;
  }
LABEL_42:

  return v2 + 8;
}

uint64_t DRMeshGetVertexCapacity(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 72);
}

uint64_t DRMeshGetIndexCapacity(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 48);
}

unint64_t DRMeshGetPartCount(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = (re::DirectMemoryResource **)(a1 - 8);
  }
  else {
    uint64_t v1 = 0;
  }
  id v2 = re::DirectMesh::parts(v1);
  return 0xAAAAAAAAAAAAAAABLL * ((v3 - (uint64_t)v2) >> 5);
}

uint64_t DRMeshSetPartCount(uint64_t result, unint64_t a2)
{
  if (result)
  {
    if ((a2 & 0x8000000000000000) == 0) {
      return re::DirectMesh::setPartCount(result - 8, a2);
    }
  }
  return result;
}

void DRMeshSetPartAt(void *a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, __n128 a7, __n128 a8)
{
  id v13 = a1;
  char v14 = v13;
  if (v13)
  {
    if ((a2 & 0x8000000000000000) == 0)
    {
      id v15 = re::DirectMesh::parts((re::DirectMemoryResource **)v13 - 1);
      if (0xAAAAAAAAAAAAAAABLL * ((v16 - (uint64_t)v15) >> 5) > a2)
      {
        v19[0] = MEMORY[0x263EF8330];
        v19[1] = 3221225472;
        _OWORD v19[2] = __DRMeshSetPartAt_block_invoke;
        v19[3] = &__block_descriptor_104_e34_v24__0__DirectMeshPart_QQQQQQ_8Q16l;
        unint64_t v22 = a2;
        uint64_t v23 = a3;
        uint64_t v24 = a4;
        uint64_t v25 = a5;
        uint64_t v26 = a6;
        __n128 v20 = a7;
        __n128 v21 = a8;
        re::DirectMesh::updateParts((uint64_t)v14 - 8, (uint64_t)v19);
      }
    }
  }
}

uint64_t DRMeshGetPartAt(void *a1, unint64_t a2, void *a3, void *a4, void *a5, void *a6, _OWORD *a7, _OWORD *a8)
{
  id v15 = a1;
  uint64_t v16 = v15;
  uint64_t v17 = 0;
  if (v15 && (a2 & 0x8000000000000000) == 0)
  {
    id v18 = re::DirectMesh::parts(v15 - 1);
    if (0xAAAAAAAAAAAAAAABLL * ((v19 - (uint64_t)v18) >> 5) <= a2)
    {
      uint64_t v17 = 0;
    }
    else
    {
      __n128 v20 = (char *)re::DirectMesh::parts(v16 - 1) + 96 * a2;
      uint64_t v21 = *((void *)v20 + 1);
      uint64_t v22 = *((void *)v20 + 2);
      uint64_t v23 = *((void *)v20 + 3);
      long long v24 = *((_OWORD *)v20 + 3);
      long long v25 = *((_OWORD *)v20 + 4);
      *a3 = *(void *)v20;
      *a4 = v21;
      *a5 = v22;
      *a6 = v23;
      *a7 = v24;
      *a8 = v25;
      uint64_t v17 = 1;
    }
  }

  return v17;
}

uint64_t DRMeshGetPartRenderFlagsAt(void *a1, unint64_t a2)
{
  uint64_t v3 = a1;
  uint64_t v4 = v3;
  uint64_t v5 = 0;
  if (v3 && (a2 & 0x8000000000000000) == 0)
  {
    id v6 = re::DirectMesh::parts(v3 - 1);
    if (0xAAAAAAAAAAAAAAABLL * ((v7 - (uint64_t)v6) >> 5) <= a2) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = *((void *)re::DirectMesh::parts(v4 - 1) + 12 * a2 + 10);
    }
  }

  return v5;
}

void DRMeshSetPartRenderFlagsAt(void *a1, unint64_t a2, uint64_t a3)
{
  id v5 = a1;
  id v6 = v5;
  if (v5)
  {
    if ((a2 & 0x8000000000000000) == 0)
    {
      id v7 = re::DirectMesh::parts((re::DirectMemoryResource **)v5 - 1);
      if (0xAAAAAAAAAAAAAAABLL * ((v8 - (uint64_t)v7) >> 5) > a2)
      {
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        uint64_t v9[2] = __DRMeshSetPartRenderFlagsAt_block_invoke;
        void v9[3] = &__block_descriptor_48_e34_v24__0__DirectMeshPart_QQQQQQ_8Q16l;
        v9[4] = a2;
        v9[5] = a3;
        re::DirectMesh::updateParts((uint64_t)v6 - 8, (uint64_t)v9);
      }
    }
  }
}

uint64_t __DRMeshSetPartRenderFlagsAt_block_invoke(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 96 * *(void *)(result + 32) + 80) = *(void *)(result + 40);
  return result;
}

unint64_t DRMeshDescriptorCalculateBufferSizes(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7 = a1 - 8;
  if (!a1) {
    uint64_t v7 = 0;
  }
  unint64_t result = re::calculateBufferSizes((unint64_t *)(v7 + 16), (uint64_t)v11);
  v13[0] = v11[0];
  v13[1] = v11[1];
  uint64_t v14 = v12;
  *a2 = *(void *)&v11[0];
  if (a4)
  {
    unint64_t v9 = 0;
    do
    {
      if (v9 > 3) {
        uint64_t v10 = 0;
      }
      else {
        uint64_t v10 = *((void *)v13 + v9 + 1);
      }
      *(void *)(a3 + 8 * v9++) = v10;
    }
    while (a4 != v9);
  }
  return result;
}

void DRMeshReadVertices(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1) {
    uint64_t v6 = a1 - 8;
  }
  else {
    uint64_t v6 = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __DRMeshReadVertices_block_invoke;
  v8[3] = &unk_2652F6C50;
  id v9 = v5;
  id v7 = v5;
  re::DirectMesh::readBuffer(v6, a2, (uint64_t)v8);
}

uint64_t __DRMeshReadVertices_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void DRMeshReplaceVertices(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1) {
    uint64_t v6 = a1 - 8;
  }
  else {
    uint64_t v6 = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __DRMeshReplaceVertices_block_invoke;
  v8[3] = &unk_2652F6C78;
  id v9 = v5;
  id v7 = v5;
  re::DirectMesh::replaceBuffer(v6, a2, (uint64_t)v8);
}

uint64_t __DRMeshReplaceVertices_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void DRMeshUpdateVertices(uint64_t a1, unint64_t a2, void *a3)
{
  id v5 = a3;
  if (a1) {
    uint64_t v6 = a1 - 8;
  }
  else {
    uint64_t v6 = 0;
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __DRMeshUpdateVertices_block_invoke;
  v8[3] = &unk_2652F6C78;
  id v9 = v5;
  id v7 = v5;
  re::DirectMesh::updateBuffer(v6, a2, (uint64_t)v8);
}

uint64_t __DRMeshUpdateVertices_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void DRMeshReadIndices(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1) {
    uint64_t v4 = a1 - 8;
  }
  else {
    uint64_t v4 = 0;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __DRMeshReadIndices_block_invoke;
  void v6[3] = &unk_2652F6C50;
  id v7 = v3;
  id v5 = v3;
  re::DirectMesh::readIndices(v4, (uint64_t)v6);
}

uint64_t __DRMeshReadIndices_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void DRMeshReplaceIndices(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1) {
    uint64_t v4 = (re::DirectMemoryResource **)(a1 - 8);
  }
  else {
    uint64_t v4 = 0;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __DRMeshReplaceIndices_block_invoke;
  void v6[3] = &unk_2652F6C78;
  id v7 = v3;
  id v5 = v3;
  re::DirectMesh::replaceIndices(v4, (uint64_t)v6);
}

uint64_t __DRMeshReplaceIndices_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void DRMeshUpdateIndices(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1) {
    uint64_t v4 = (re::DirectMemoryResource **)(a1 - 8);
  }
  else {
    uint64_t v4 = 0;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __DRMeshUpdateIndices_block_invoke;
  void v6[3] = &unk_2652F6C78;
  id v7 = v3;
  id v5 = v3;
  re::DirectMesh::updateIndices(v4, (uint64_t)v6);
}

uint64_t __DRMeshUpdateIndices_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

re::DirectMemoryResource *DRMeshReadVerticesUsing(uint64_t a1, unint64_t a2)
{
  if (a1) {
    uint64_t v2 = a1 - 8;
  }
  else {
    uint64_t v2 = 0;
  }
  return re::DirectMesh::readBuffer(v2, a2);
}

uint64_t DRMeshUpdateVerticesUsing(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a1) {
    uint64_t v3 = a1 - 8;
  }
  else {
    uint64_t v3 = 0;
  }
  return re::DirectMesh::updateBuffer(v3, a2, a3);
}

uint64_t DRMeshReplaceVerticesUsing(uint64_t a1, unint64_t a2, uint64_t a3)
{
  if (a1) {
    uint64_t v3 = a1 - 8;
  }
  else {
    uint64_t v3 = 0;
  }
  return re::DirectMesh::replaceBuffer(v3, a2, a3);
}

uint64_t DRMeshReadIndicesUsing(uint64_t a1)
{
  if (a1) {
    return re::DirectMesh::readIndices(a1 - 8);
  }
  else {
    return re::DirectMesh::readIndices(0);
  }
}

uint64_t DRMeshUpdateIndicesUsing(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a1 - 8;
  }
  else {
    uint64_t v2 = 0;
  }
  return re::DirectMesh::updateIndices(v2, a2);
}

uint64_t DRMeshReplaceIndicesUsing(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a1 - 8;
  }
  else {
    uint64_t v2 = 0;
  }
  return re::DirectMesh::replaceIndices(v2, a2);
}

double re::make::shared::object<re::DirectMeshDescriptor>(void *a1)
{
  uint64_t v2 = (ArcSharedObject *)operator new(0x60uLL);
  *(_OWORD *)uint64_t v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  *((_OWORD *)v2 + 2) = 0u;
  *((_OWORD *)v2 + 3) = 0u;
  *((_OWORD *)v2 + 4) = 0u;
  *((_OWORD *)v2 + 5) = 0u;
  ArcSharedObject::ArcSharedObject(v2, 0);
  *(_OWORD *)(v3 + 16) = xmmword_24CD45800;
  *(void *)(v3 + 32) = 1;
  double result = 0.0;
  *(_OWORD *)(v3 + 40) = 0u;
  *(_OWORD *)(v3 + 56) = 0u;
  *(_OWORD *)(v3 + 72) = 0u;
  *(void *)(v3 + 88) = 0;
  *(void *)uint64_t v3 = &unk_26FF35300;
  *a1 = v3;
  return result;
}

void re::DirectMeshDescriptor::~DirectMeshDescriptor(re::DirectMeshDescriptor *this)
{
  uint64_t v2 = (void *)*((void *)this + 9);
  if (v2)
  {
    *((void *)this + 10) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 6);
  if (v3)
  {
    *((void *)this + 7) = v3;
    operator delete(v3);
  }

  ArcSharedObject::~ArcSharedObject(this);
}

{
  void *v2;
  void *v3;
  uint64_t vars8;

  uint64_t v2 = (void *)*((void *)this + 9);
  if (v2)
  {
    *((void *)this + 10) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 6);
  if (v3)
  {
    *((void *)this + 7) = v3;
    operator delete(v3);
  }
  ArcSharedObject::~ArcSharedObject(this);

  JUMPOUT(0x2533130A0);
}

id DRFenceCreate(const char *a1)
{
  if (a1) {
    uint64_t v1 = a1;
  }
  else {
    uint64_t v1 = "";
  }
  uint64_t v2 = (re::DirectFence *)operator new(0x50uLL);
  uint64_t v3 = (void *)(re::DirectFence::DirectFence(v2, v1) + 8);

  return v3;
}

uint64_t DRFenceInvalidate(uint64_t a1)
{
  if (a1) {
    return re::DirectFence::invalidate(a1 - 8);
  }
  else {
    return re::DirectFence::invalidate(0);
  }
}

uint64_t DRFenceGetLabel(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  uint64_t result = v1 + 32;
  if (*(char *)(v1 + 55) < 0) {
    return *(void *)result;
  }
  return result;
}

uint64_t DRTextureCreateUnmanaged(uint64_t a1, void *a2, CFErrorRef *a3)
{
  id v5 = a2;
  id v14 = v5;
  char v15 = 0;
  uint64_t v6 = a1 - 8;
  if (!a1) {
    uint64_t v6 = 0;
  }
  re::DirectTexture::create(v6 + 16, &v14, &v13);
  uint64_t v7 = v13;
  if (a3 && !v13)
  {
    uint64_t v8 = (__CFString *)CFStringCreateWithCString(0, "Direct Texture Validation Failed", 0x8000100u);
    userInfoKeys = (void *)*MEMORY[0x263EFFC48];
    userInfoValues = v8;
    *a3 = CFErrorCreateWithUserInfoKeysAndValues(0, @"DirectResourceErrorDomain", 100, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(userInfoValues);
    uint64_t v7 = v13;
  }
  if (v7) {
    uint64_t v9 = v7 + 8;
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

uint64_t DRTextureDescriptorCreate()
{
  re::make::shared::object<re::DirectTextureDescriptor>(&v1);
  if (v1) {
    return v1 + 8;
  }
  else {
    return 0;
  }
}

uint64_t DRTextureDescriptorGetWidth(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 16);
}

uint64_t DRTextureDescriptorSetWidth(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetHeight(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 24);
}

uint64_t DRTextureDescriptorSetHeight(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetDepth(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 32);
}

uint64_t DRTextureDescriptorSetDepth(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetMipmapLevelCount(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 40);
}

uint64_t DRTextureDescriptorSetMipmapLevelCount(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 40) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetPixelFormat(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 56);
}

uint64_t DRTextureDescriptorSetPixelFormat(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 56) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetTextureType(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 64);
}

uint64_t DRTextureDescriptorSetTextureType(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 64) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetTextureUsage(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 72);
}

uint64_t DRTextureDescriptorSetTextureUsage(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 72) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetArrayLength(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 48);
}

uint64_t DRTextureDescriptorSetArrayLength(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t DRTextureDescriptorGetSwizzle(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(unsigned int *)(v1 + 80);
}

uint64_t DRTextureDescriptorSetSwizzle(uint64_t result, int a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(_DWORD *)(v2 + 80) = a2;
  return result;
}

id DRTextureCopyDescriptor(void *a1)
{
  uint64_t v1 = a1;
  re::make::shared::object<re::DirectTextureDescriptor>(&v11);
  uint64_t v2 = v11;
  uint64_t v3 = v1 - 8;
  if (!v1) {
    uint64_t v3 = 0;
  }
  *(_OWORD *)(v11 + 16) = *((_OWORD *)v3 + 3);
  long long v5 = *((_OWORD *)v3 + 5);
  long long v4 = *((_OWORD *)v3 + 6);
  long long v6 = *((_OWORD *)v3 + 4);
  *(_DWORD *)(v2 + 80) = *((_DWORD *)v3 + 28);
  *(_OWORD *)(v2 + 48) = v5;
  *(_OWORD *)(v2 + 64) = v4;
  *(_OWORD *)(v2 + 32) = v6;

  uint64_t v7 = (void *)(v2 + 8);
  if (v2) {
    uint64_t v8 = (void *)(v2 + 8);
  }
  else {
    uint64_t v8 = 0;
  }
  id v9 = v8;

  return v9;
}

id DRTextureReadTexture(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = (re::DirectMemoryResource **)(a1 - 8);
  }
  else {
    uint64_t v1 = 0;
  }
  re::DirectTexture::readTexture(v1, &v5);
  id v2 = v5;
  uint64_t v3 = v2;
  if (v2) {

  }
  return v3;
}

id DRTextureReplaceTexture(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a1 - 8;
  }
  else {
    uint64_t v2 = 0;
  }
  re::DirectTexture::replaceTexture(v2, a2, &v6);
  id v3 = v6;
  long long v4 = v3;
  if (v3) {

  }
  return v4;
}

double re::make::shared::object<re::DirectTextureDescriptor>(void *a1)
{
  uint64_t v2 = operator new(0x58uLL);
  *uint64_t v2 = 0u;
  v2[1] = 0u;
  v2[2] = 0u;
  v2[3] = 0u;
  v2[4] = 0u;
  *((void *)v2 + 10) = 0;
  ArcSharedObject::ArcSharedObject((ArcSharedObject *)v2, 0);
  int64x2_t v3 = vdupq_n_s64(1uLL);
  *(int64x2_t *)(v4 + 16) = v3;
  *(int64x2_t *)(v4 + 32) = v3;
  *(_OWORD *)(v4 + 48) = xmmword_24CD45810;
  *(_OWORD *)(v4 + 64) = xmmword_24CD45820;
  *(void *)&double result = 84148994;
  *(_DWORD *)(v4 + 80) = 84148994;
  *(void *)uint64_t v4 = &unk_26FF35338;
  *a1 = v4;
  return result;
}

void re::DirectTextureDescriptor::~DirectTextureDescriptor(re::DirectTextureDescriptor *this)
{
  ArcSharedObject::~ArcSharedObject(this);

  JUMPOUT(0x2533130A0);
}

uint64_t DRContextConfigCreate()
{
  unint64_t v0 = (ArcSharedObject *)operator new(0x40uLL);
  *(_OWORD *)unint64_t v0 = 0u;
  *((_OWORD *)v0 + 1) = 0u;
  *((_OWORD *)v0 + 2) = 0u;
  *((_OWORD *)v0 + 3) = 0u;
  ArcSharedObject::ArcSharedObject(v0, 0);
  *(void *)(v1 + 16) = 0;
  *(_OWORD *)(v1 + 24) = xmmword_24CD45820;
  *(_OWORD *)(v1 + 40) = xmmword_24CD45A70;
  *(void *)(v1 + 56) = 0;
  *(void *)uint64_t v1 = &unk_26FF35370;
  return v1 + 8;
}

void DRContextConfigSetDispatchQueue(uint64_t a1, void *a2)
{
  uint64_t v2 = a1 - 8;
  if (!a1) {
    uint64_t v2 = 0;
  }
  objc_storeStrong((id *)(v2 + 16), a2);
}

uint64_t DRContextConfigSetMode(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t DRContextConfigGetMode(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 24);
}

uint64_t DRContextConfigSetReuseStrategy(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 32) = a2;
  return result;
}

uint64_t DRContextConfigSetMaxPendingFrames(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 48) = a2;
  return result;
}

uint64_t DRContextConfigSetUnusedResourceMaxAge(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 40) = a2;
  return result;
}

void DRContextConfigSetDevice(void *a1, void *a2)
{
  id v8 = a2;
  int64x2_t v3 = a1;
  id v4 = v8;
  id v5 = v8;
  if (v3) {
    id v6 = v3 - 8;
  }
  else {
    id v6 = 0;
  }
  id v7 = (id)*((void *)v6 + 7);
  if (v7 == v8)
  {
  }
  else
  {
    if (v7)
    {

      id v5 = v8;
    }
    *((void *)v6 + 7) = v5;
  }
}

char *DRContextCreate(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = a1 - 8;
  }
  else {
    uint64_t v1 = 0;
  }
  uint64_t v2 = (char *)operator new(0x150uLL);
  id v4 = *(id *)(v1 + 16);
  long long v5 = *(_OWORD *)(v1 + 24);
  long long v6 = *(_OWORD *)(v1 + 40);
  id v7 = *(id *)(v1 + 56);
  re::DirectResourceContext::DirectResourceContext(v2, &v4);
  if (v7)
  {

    id v7 = 0;
  }

  return v2 + 8;
}

char *DRContextCreateMesh(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  if (a1) {
    uint64_t v4 = a1 - 8;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = a2 - 8;
  if (!a2) {
    uint64_t v5 = 0;
  }
  re::DirectResourceContext::createMesh(v4, (_OWORD *)(v5 + 16), (void **)&v11);
  long long v6 = v11;
  if (a3 && !v11)
  {
    id v7 = (__CFString *)CFStringCreateWithCString(0, "Direct Mesh Validation Failed", 0x8000100u);
    userInfoKeys = (void *)*MEMORY[0x263EFFC48];
    userInfoValues = v7;
    *a3 = CFErrorCreateWithUserInfoKeysAndValues(0, @"DirectResourceErrorDomain", 100, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(userInfoValues);
    long long v6 = v11;
  }
  if (v6) {
    return v6 + 8;
  }
  else {
    return 0;
  }
}

uint64_t DRContextCreateTexture(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  if (a1) {
    uint64_t v4 = a1 - 8;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = a2 - 8;
  if (!a2) {
    uint64_t v5 = 0;
  }
  re::DirectResourceContext::createTexture(v4, v5 + 16, &v11);
  uint64_t v6 = v11;
  if (a3 && !v11)
  {
    id v7 = (__CFString *)CFStringCreateWithCString(0, "Direct Texture Validation Failed", 0x8000100u);
    userInfoKeys = (void *)*MEMORY[0x263EFFC48];
    userInfoValues = v7;
    *a3 = CFErrorCreateWithUserInfoKeysAndValues(0, @"DirectResourceErrorDomain", 100, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(userInfoValues);
    uint64_t v6 = v11;
  }
  if (v6) {
    return v6 + 8;
  }
  else {
    return 0;
  }
}

uint64_t DRContextCreateBuffer(uint64_t a1, uint64_t a2, CFErrorRef *a3)
{
  if (a1) {
    uint64_t v4 = a1 - 8;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = a2 - 8;
  if (!a2) {
    uint64_t v5 = 0;
  }
  re::DirectResourceContext::createBuffer(v4, (void *)(v5 + 16), &v11);
  uint64_t v6 = v11;
  if (a3 && !v11)
  {
    id v7 = (__CFString *)CFStringCreateWithCString(0, "Direct Texture Validation Failed", 0x8000100u);
    userInfoKeys = (void *)*MEMORY[0x263EFFC48];
    userInfoValues = v7;
    *a3 = CFErrorCreateWithUserInfoKeysAndValues(0, @"DirectResourceErrorDomain", 100, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(userInfoValues);
    uint64_t v6 = v11;
  }
  if (v6) {
    return v6 + 8;
  }
  else {
    return 0;
  }
}

BOOL DRContextHasOpenCommit(char *a1)
{
  if (a1) {
    uint64_t v1 = a1 - 8;
  }
  else {
    uint64_t v1 = 0;
  }
  uint64_t v2 = *((void *)v1 + 3);
  int64x2_t v3 = a1;
  dispatch_assert_queue_V2(v2);
  uint64_t v4 = *((void *)v1 + 21);

  return v4 != 0;
}

void DRContextCommit(char *a1)
{
  if (a1) {
    uint64_t v1 = (re::DirectResourceContext *)(a1 - 8);
  }
  else {
    uint64_t v1 = 0;
  }
  uint64_t v2 = *((void *)v1 + 3);
  int64x2_t v3 = a1;
  dispatch_assert_queue_V2(v2);
  re::DirectResourceContext::commit(v1);
}

BOOL DRContextSetCommitUserPayload(char *a1, void *a2)
{
  id v3 = a2;
  if (a1) {
    uint64_t v4 = a1 - 8;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = *((void *)v4 + 3);
  uint64_t v6 = a1;
  dispatch_assert_queue_V2(v5);
  id v7 = (re::DirectResourcesPendingCommit *)*((void *)v4 + 21);

  if (v7)
  {
    re::XPCObject::retain(v3, &v9);
    re::DirectResourcesPendingCommit::setUserPayload(v7, &v9);
    re::XPCObject::~XPCObject(&v9);
  }

  return v7 != 0;
}

id DRContextGetCommitUserPayload(char *a1)
{
  if (a1) {
    uint64_t v1 = a1 - 8;
  }
  else {
    uint64_t v1 = 0;
  }
  uint64_t v2 = *((void *)v1 + 3);
  id v3 = a1;
  dispatch_assert_queue_V2(v2);
  uint64_t v4 = *((void *)v1 + 21);

  if (v4) {
    id v5 = *(id *)(*(void *)(v4 + 24) + 24);
  }
  else {
    id v5 = 0;
  }

  return v5;
}

BOOL DRContextCommitAddFence(char *a1, void *a2)
{
  id v3 = a2;
  if (a1) {
    uint64_t v4 = a1 - 8;
  }
  else {
    uint64_t v4 = 0;
  }
  id v5 = *((void *)v4 + 3);
  uint64_t v6 = a1;
  dispatch_assert_queue_V2(v5);
  uint64_t v7 = *((void *)v4 + 21);

  if (v7)
  {
    if (v3) {
      uint64_t v8 = (uint64_t)v3 - 8;
    }
    else {
      uint64_t v8 = 0;
    }
    re::DirectResourcesPendingCommit::addFence(v7, v8);
  }

  return v7 != 0;
}

void DRContextSetOnCommitBegan(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1) {
    uint64_t v4 = (uint64_t)a1 - 8;
  }
  else {
    uint64_t v4 = 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v7[2] = __DRContextSetOnCommitBegan_block_invoke;
  uint64_t v7[3] = &unk_2652F6C78;
  uint64_t v10 = 0;
  id v8 = v3;
  v9[0] = &unk_26FF353A8;
  id v5 = v3;
  id v6 = a1;
  v9[1] = _Block_copy(v7);
  uint64_t v10 = v9;
  re::DirectResourceContext::setBeginCallback(v4, (uint64_t)v9);

  std::__function::__value_func<void ()(re::DirectResourceContext *,unsigned long long)>::~__value_func[abi:nn180100](v9);
}

void __DRContextSetOnCommitBegan_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(a2);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v5, a3);
}

id re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(uint64_t a1)
{
  if (a1) {
    return (id)(a1 + 8);
  }
  else {
    return 0;
  }
}

void DRContextSetOnCommitComplete(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1) {
    uint64_t v4 = (uint64_t)a1 - 8;
  }
  else {
    uint64_t v4 = 0;
  }
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  id v7[2] = __DRContextSetOnCommitComplete_block_invoke;
  uint64_t v7[3] = &unk_2652F6CA8;
  uint64_t v10 = 0;
  id v8 = v3;
  v9[0] = &unk_26FF353F0;
  id v5 = v3;
  id v6 = a1;
  v9[1] = _Block_copy(v7);
  uint64_t v10 = v9;
  re::DirectResourceContext::setCompleteCallback(v4, (uint64_t)v9);

  std::__function::__value_func<void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::~__value_func[abi:nn180100](v9);
}

void __DRContextSetOnCommitComplete_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(a2);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = (void *)(a3 + 8);
  if (!a3) {
    id v5 = 0;
  }
  id v6 = v5;
  (*(void (**)(uint64_t, id, id))(v4 + 16))(v4, v7, v6);
}

void DRContextSetChangeObserver(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (a1) {
    uint64_t v4 = a1 - 8;
  }
  else {
    uint64_t v4 = 0;
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __DRContextSetChangeObserver_block_invoke;
  aBlock[3] = &unk_2652F6CD0;
  id v7 = v3;
  id v5 = v3;
  re::DirectResourceContext::setObserver(v4, aBlock);
}

void __DRContextSetChangeObserver_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(a2);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = (void *)(a4 + 8);
  if (!a4) {
    id v7 = 0;
  }
  id v8 = v7;
  (*(void (**)(uint64_t, id, uint64_t, id))(v6 + 16))(v6, v9, a3, v8);
}

void ContextConfig::~ContextConfig(ContextConfig *this)
{
  uint64_t v2 = (void *)*((void *)this + 7);
  if (v2)
  {

    *((void *)this + 7) = 0;
  }

  ArcSharedObject::~ArcSharedObject(this);
}

{
  void *v2;
  uint64_t vars8;

  uint64_t v2 = (void *)*((void *)this + 7);
  if (v2)
  {

    *((void *)this + 7) = 0;
  }

  ArcSharedObject::~ArcSharedObject(this);

  JUMPOUT(0x2533130A0);
}

uint64_t std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long)>,void ()(re::DirectResourceContext *,unsigned long long)>::~__func(uint64_t a1)
{
  return a1;
}

void std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long)>,void ()(re::DirectResourceContext *,unsigned long long)>::~__func(uint64_t a1)
{
  JUMPOUT(0x2533130A0);
}

uint64_t std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long)>,void ()(re::DirectResourceContext *,unsigned long long)>::__clone()
{
  return 0;
}

void *std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long)>,void ()(re::DirectResourceContext *,unsigned long long)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FF353A8;
  double result = _Block_copy(*(const void **)(a1 + 8));
  a2[1] = result;
  return result;
}

uint64_t std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long)>,void ()(re::DirectResourceContext *,unsigned long long)>::destroy(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  return MEMORY[0x270F9A758]();
}

uint64_t std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,unsigned long long)>,void ()(re::DirectResourceContext *,unsigned long long)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

uint64_t std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *)>,void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::~__func(uint64_t a1)
{
  return a1;
}

void std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *)>,void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::~__func(uint64_t a1)
{
  JUMPOUT(0x2533130A0);
}

uint64_t std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *)>,void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::__clone()
{
  return 0;
}

void *std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *)>,void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FF353F0;
  double result = _Block_copy(*(const void **)(a1 + 8));
  a2[1] = result;
  return result;
}

uint64_t std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *)>,void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::destroy(uint64_t a1)
{
  *(void *)(a1 + 8) = 0;
  return MEMORY[0x270F9A758]();
}

uint64_t std::__function::__func<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *),std::allocator<void({block_pointer} {__strong})(re::DirectResourceContext *,re::DirectResourceCommands *)>,void ()(re::DirectResourceContext *,re::DirectResourceCommands *)>::operator()(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))();
}

void DRResourceGetIdentifier(uint64_t a1, uuid_t dst)
{
  uint64_t v2 = a1 - 8;
  if (!a1) {
    uint64_t v2 = 0;
  }
  uuid_copy(dst, (const unsigned __int8 *)(v2 + 16));
}

uint64_t DRResourceGetClientIdentifier(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 32);
}

id DRResourceAsMesh(void *a1)
{
  id v1 = a1;
  if (v1 && (*(unsigned int (**)(void))(*((void *)v1 - 1) + 40))() == 1) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id DRMeshAsResource(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = a1 - 8;
  }
  else {
    uint64_t v1 = 0;
  }
  id v2 = re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(v1);

  return v2;
}

id DRResourceAsTexture(void *a1)
{
  id v1 = a1;
  if (v1 && (*(unsigned int (**)(void))(*((void *)v1 - 1) + 40))() == 2) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id DRTextureAsResource(uint64_t a1)
{
  if (a1) {
    return re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(a1 - 8);
  }
  else {
    return re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(0);
  }
}

id DRResourceAsBuffer(void *a1)
{
  id v1 = a1;
  if (v1 && (*(unsigned int (**)(void))(*((void *)v1 - 1) + 40))() == 3) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id DRBufferAsResource(uint64_t a1)
{
  if (a1) {
    return re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(a1 - 8);
  }
  else {
    return re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(0);
  }
}

id DRResourceAsMaterial(void *a1)
{
  id v1 = a1;
  if (v1 && (*(unsigned int (**)(void))(*((void *)v1 - 1) + 40))() == 4) {
    id v2 = v1;
  }
  else {
    id v2 = 0;
  }

  return v2;
}

id DRMaterialAsResource(uint64_t a1)
{
  if (a1) {
    return re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(a1 - 8);
  }
  else {
    return re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(0);
  }
}

uint64_t DRResourceIsAttachedToDevice_RemoveMeAfterVerification(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = a1 - 8;
  }
  else {
    uint64_t v1 = 0;
  }
  return (*(uint64_t (**)(void))(*(void *)v1 + 80))();
}

uint64_t DRBufferDescriptorCreate()
{
  unint64_t v0 = (ArcSharedObject *)operator new(0x20uLL);
  *(_OWORD *)unint64_t v0 = 0u;
  *((_OWORD *)v0 + 1) = 0u;
  ArcSharedObject::ArcSharedObject(v0, 0);
  *(_OWORD *)(v1 + 16) = xmmword_24CD45830;
  *(void *)uint64_t v1 = &unk_26FF35438;
  return v1 + 8;
}

uint64_t DRBufferDescriptorGetCapacity(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 16);
}

uint64_t DRBufferDescriptorSetCapacity(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 16) = a2;
  return result;
}

uint64_t DRBufferDescriptorGetSizeMultiple(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 24);
}

uint64_t DRBufferDescriptorSetSizeMultiple(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 24) = a2;
  return result;
}

uint64_t DRBufferCreateUnmanaged(uint64_t a1, void *a2, CFErrorRef *a3)
{
  id v5 = a2;
  id v14 = v5;
  char v15 = 0;
  uint64_t v6 = a1 - 8;
  if (!a1) {
    uint64_t v6 = 0;
  }
  re::DirectBuffer::create((void *)(v6 + 16), &v14, &v13);
  uint64_t v7 = v13;
  if (a3 && !v13)
  {
    id v8 = (__CFString *)CFStringCreateWithCString(0, "Buffer Validation Failed", 0x8000100u);
    userInfoKeys = (void *)*MEMORY[0x263EFFC48];
    userInfoValues = v8;
    *a3 = CFErrorCreateWithUserInfoKeysAndValues(0, @"DirectResourceErrorDomain", 100, (const void *const *)&userInfoKeys, (const void *const *)&userInfoValues, 1);
    CFRelease(userInfoValues);
    uint64_t v7 = v13;
  }
  if (v7) {
    uint64_t v9 = v7 + 8;
  }
  else {
    uint64_t v9 = 0;
  }

  return v9;
}

char *DRBufferCopyDescriptor(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = (ArcSharedObject *)operator new(0x20uLL);
  *(_OWORD *)uint64_t v2 = 0u;
  *((_OWORD *)v2 + 1) = 0u;
  ArcSharedObject::ArcSharedObject(v2, 0);
  *(void *)uint64_t v3 = &unk_26FF35438;
  uint64_t v4 = v1 - 8;
  if (!v1) {
    uint64_t v4 = 0;
  }
  *(_OWORD *)(v3 + 16) = *((_OWORD *)v4 + 3);

  return (char *)v2 + 8;
}

uint64_t DRBufferGetBytesUsed(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 64);
}

BOOL DRBufferSetBytesUsed(uint64_t a1, unint64_t a2)
{
  if (a1) {
    uint64_t v2 = (re::DirectBuffer *)(a1 - 8);
  }
  else {
    uint64_t v2 = 0;
  }
  return re::DirectBuffer::setBytesUsed(v2, a2);
}

uint64_t DRBufferRead(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a1 - 8;
  }
  else {
    uint64_t v2 = 0;
  }
  return re::DirectBuffer::read(v2, a2);
}

uint64_t DRBufferReplace(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a1 - 8;
  }
  else {
    uint64_t v2 = 0;
  }
  return re::DirectBuffer::replace(v2, a2);
}

uint64_t DRBufferUpdate(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a1 - 8;
  }
  else {
    uint64_t v2 = 0;
  }
  return re::DirectBuffer::update(v2, a2);
}

id DRBufferReadUsing(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = a1 - 8;
  }
  else {
    uint64_t v1 = 0;
  }
  re::DirectBuffer::read(v1, &v5);
  id v2 = v5;
  uint64_t v3 = v2;
  if (v2) {

  }
  return v3;
}

id DRBufferReplaceUsing(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = a1 - 8;
  }
  else {
    uint64_t v2 = 0;
  }
  re::DirectBuffer::replace(v2, a2, &v6);
  id v3 = v6;
  uint64_t v4 = v3;
  if (v3) {

  }
  return v4;
}

void re::DirectBufferDescriptor::~DirectBufferDescriptor(re::DirectBufferDescriptor *this)
{
  ArcSharedObject::~ArcSharedObject(this);

  JUMPOUT(0x2533130A0);
}

uint64_t DRMemoryResourceCreate(re::MemoryMappedRegion *a1, re::DirectMemoryResource *a2, void *a3)
{
  re::DirectMemoryResource::create(a1, a2, a3, &v4);
  if (v4) {
    return v4 + 8;
  }
  else {
    return 0;
  }
}

uint64_t DRMemoryResourceCopyBuffer(uint64_t a1, void *a2)
{
  if (a1) {
    uint64_t v2 = a1 - 8;
  }
  else {
    uint64_t v2 = 0;
  }
  re::DirectMemoryResource::makeBuffer(a2, v2, &v4);
  return v4;
}

uint64_t DRMemoryResourceCopyToXPC(uint64_t a1, const re::DirectMemoryResource *a2)
{
  if (a1) {
    uint64_t v2 = (re *)(a1 - 8);
  }
  else {
    uint64_t v2 = 0;
  }
  re::xpc_object_create(v2, a2);
  return objc_claimAutoreleasedReturnValue();
}

char *DRMemoryResourceCreateFromXPC(void *a1)
{
  uint64_t v2 = 0;
  if (re::xpc_get_value(a1, &v2))
  {
    if (v2) {
      return (char *)v2 + 8;
    }
    else {
      return 0;
    }
  }
  else
  {
    if (v2) {

    }
    return 0;
  }
}

BOOL DRMemoryResourceIsPrivateToProcess(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return re::isPrivateToThisProcess(*(_DWORD *)(v1 + 32));
}

uint64_t DRMemoryResourceGetLength(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 40);
}

id DRMemoryResourceGetBytes(uint64_t a1)
{
  if (a1) {
    return re::DirectMemoryResource::bytes((re::DirectMemoryResource *)(a1 - 8));
  }
  else {
    return re::DirectMemoryResource::bytes(0);
  }
}

void DRMemoryResourceDidUpdateBytes(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  id v2 = *(id *)(v1 + 80);
  if (v2)
  {
  }
}

void *DRClientConnectionConfigCreate()
{
  unint64_t v0 = (ArcSharedObject *)operator new(0x20uLL);
  *(_OWORD *)unint64_t v0 = 0u;
  *((_OWORD *)v0 + 1) = 0u;
  ArcSharedObject::ArcSharedObject(v0, 0);
  *uint64_t v1 = &unk_26FF35470;
  v1[2] = 0;
  v1[3] = 0;
  return v1 + 1;
}

uint64_t DRClientConnectionConfigSetUserData(uint64_t result, uint64_t a2)
{
  uint64_t v2 = result - 8;
  if (!result) {
    uint64_t v2 = 0;
  }
  *(void *)(v2 + 16) = a2;
  return result;
}

void DRClientConnectionConfigSetServiceQueue(uint64_t a1, void *a2)
{
  uint64_t v2 = a1 - 8;
  if (!a1) {
    uint64_t v2 = 0;
  }
  objc_storeStrong((id *)(v2 + 24), a2);
}

char *DRContextCreateClient(void *a1, void *a2)
{
  id v3 = a1;
  uint64_t v4 = a2;
  id v5 = v4;
  if (v3) {
    id v6 = v3 - 8;
  }
  else {
    id v6 = 0;
  }
  if (v4) {
    uint64_t v7 = v4 - 8;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = (char *)operator new(0x20uLL);
  *(_OWORD *)id v8 = 0u;
  *((_OWORD *)v8 + 1) = 0u;
  uint64_t v9 = (uint64_t *)(v8 + 16);
  ArcSharedObject::ArcSharedObject((ArcSharedObject *)v8, 0);
  *uint64_t v10 = &unk_26FF354A8;
  void v10[3] = 0;
  *((void *)v8 + 2) = 0;
  uint64_t v11 = operator new(0x48uLL);
  uint64_t v12 = re::DirectResourcesCommitQueue::DirectResourcesCommitQueue(v11, v6);
  uint64_t v13 = *((void *)v8 + 3);
  *((void *)v8 + 3) = v12;
  if (v13) {

  }
  uint64_t v14 = *((void *)v7 + 2);
  uint64_t v15 = *((void *)v7 + 3);
  uint64_t v16 = *((void *)v6 + 8);
  uint64_t v17 = operator new(0xF0uLL);
  uint64_t v18 = re::DirectResourceClientReceiver::DirectResourceClientReceiver(v17, v14, v15, v16);
  uint64_t v19 = *v9;
  *uint64_t v9 = v18;
  if (v19) {

  }
  return v8 + 8;
}

id DRClientConnectionGetCommitQueue(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(*(void *)(v1 + 24));
}

BOOL DRClientConnectionReceive(uint64_t a1, void *a2)
{
  uint64_t v2 = a1 - 8;
  if (!a1) {
    uint64_t v2 = 0;
  }
  return re::DirectResourceClientReceiver::receiveCommit(*(re::DirectResourceClientReceiver **)(v2 + 16), a2, *(re::DirectResourcesCommitQueue **)(v2 + 24));
}

id DRClientConnectionTearDown(void *a1)
{
  uint64_t v1 = a1;
  uint64_t v2 = v1;
  if (v1) {
    id v3 = v1 - 8;
  }
  else {
    id v3 = 0;
  }
  uint64_t v4 = *((void *)v3 + 3);
  re::DirectResourceClientReceiver::destroyAll(*((re::DirectResourceClientReceiver **)v3 + 2), &v7);
  re::DirectResourcesCommitQueue::enqueueCommit_threadSafe(v4, &v7);
  if (v7)
  {

    uint64_t v7 = 0;
  }
  id v5 = re::UnownedPtr<re::DirectResourceContext>::operator re::bridge_to_api<re::DirectResourceContext>::type<re::DirectResourceContext,void>(*((void *)v3 + 3));

  return v5;
}

uint64_t DRContextCreateCommitQueue(uint64_t a1)
{
  if (a1) {
    uint64_t v1 = a1 - 8;
  }
  else {
    uint64_t v1 = 0;
  }
  uint64_t v2 = operator new(0x48uLL);
  return re::DirectResourcesCommitQueue::DirectResourcesCommitQueue(v2, v1) + 8;
}

uint64_t DRCommitQueueEnumerate(void *a1, const void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (a1) {
    uint64_t v3 = (uint64_t)a1 - 8;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = a1;
  v6[0] = &unk_26FF354E0;
  v6[1] = _Block_copy(a2);
  uint64_t v7 = v6;
  re::DirectResourcesCommitQueue::enumerate(v3, (uint64_t)v6);

  uint64_t result = (uint64_t)v7;
  if (v7 == v6) {
    return (*(uint64_t (**)(void *))(v6[0] + 32))(v6);
  }
  if (v7) {
    return (*(uint64_t (**)(void))(*v7 + 40))();
  }
  return result;
}

void *DRCommitQueueApplyThrough(void *a1, unint64_t a2, const void *a3)
{
  void v8[4] = *MEMORY[0x263EF8340];
  if (a1) {
    uint64_t v5 = (uint64_t)a1 - 8;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = a1;
  v8[0] = &unk_26FF35528;
  v8[1] = v5;
  v8[2] = _Block_copy(a3);
  v8[3] = v8;
  re::DirectResourcesCommitQueue::commitThrough(v5, a2, (uint64_t)v8);

  return std::__function::__value_func<void ()(re::DirectResourceEvent const&,unsigned long long)>::~__value_func[abi:nn180100](v8);
}

void *DRCommitQueueApplyAll(void *a1, const void *a2)
{
  return DRCommitQueueApplyThrough(a1, 0xFFFFFFFFFFFFFFFFLL, a2);
}

uint64_t DRCommitQueueGetLastAppliedCommitId(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 24);
}

uint64_t DRCommitQueueGetLatestAvailableCommitId(uint64_t a1)
{
  if (a1) {
    return re::DirectResourcesCommitQueue::availableCommitId_threadSafe((os_unfair_lock_s *)(a1 - 8));
  }
  else {
    return re::DirectResourcesCommitQueue::availableCommitId_threadSafe(0);
  }
}

void DRCommitQueueTakeFrom(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uint64_t v2 = (re::DirectResourcesCommitQueue *)(a1 - 8);
  }
  else {
    uint64_t v2 = 0;
  }
  if (a2) {
    uint64_t v3 = (re::DirectResourcesCommitQueue *)(a2 - 8);
  }
  else {
    uint64_t v3 = 0;
  }
  re::DirectResourcesCommitQueue::takeCommits_threadSafe(v2, v3);
}

void DRCommitQueueTakeThrough(uint64_t a1, uint64_t a2, unint64_t a3)
{
  if (a1) {
    uint64_t v3 = (re::DirectResourcesCommitQueue *)(a1 - 8);
  }
  else {
    uint64_t v3 = 0;
  }
  if (a2) {
    id v4 = (re::DirectResourcesCommitQueue *)(a2 - 8);
  }
  else {
    id v4 = 0;
  }
  re::DirectResourcesCommitQueue::takeCommitsThrough_threadSafe(v3, v4, a3);
}

uint64_t DRCommitQueueEntryGetCommitId(uint64_t a1)
{
  return *(void *)a1;
}

id DRCommitQueueEntryGetUserPayload(uint64_t a1)
{
  return *(id *)(a1 + 8);
}

void ClientConnectionConfig::~ClientConnectionConfig(id *this)
{
  ArcSharedObject::~ArcSharedObject((ArcSharedObject *)this);
}

{
  uint64_t vars8;

  ArcSharedObject::~ArcSharedObject((ArcSharedObject *)this);

  JUMPOUT(0x2533130A0);
}

void ClientConnection::~ClientConnection(ClientConnection *this)
{
  *(void *)this = &unk_26FF354A8;
  uint64_t v2 = *((void *)this + 3);
  if (v2)
  {

    *((void *)this + 3) = 0;
  }
  uint64_t v3 = *((void *)this + 2);
  if (v3)
  {

    *((void *)this + 2) = 0;
  }

  ArcSharedObject::~ArcSharedObject(this);
}

{
  uint64_t v2;
  uint64_t v3;
  uint64_t vars8;

  *(void *)this = &unk_26FF354A8;
  uint64_t v2 = *((void *)this + 3);
  if (v2)
  {

    *((void *)this + 3) = 0;
  }
  uint64_t v3 = *((void *)this + 2);
  if (v3)
  {

    *((void *)this + 2) = 0;
  }
  ArcSharedObject::~ArcSharedObject(this);

  JUMPOUT(0x2533130A0);
}

uint64_t std::__function::__func<DRCommitQueueEnumerate::$_0,std::allocator<DRCommitQueueEnumerate::$_0>,BOOL ()(re::DirectResourcesResolvedCommit const*)>::~__func(uint64_t a1)
{
  return a1;
}

void std::__function::__func<DRCommitQueueEnumerate::$_0,std::allocator<DRCommitQueueEnumerate::$_0>,BOOL ()(re::DirectResourcesResolvedCommit const*)>::~__func(uint64_t a1)
{
  JUMPOUT(0x2533130A0);
}

void *std::__function::__func<DRCommitQueueEnumerate::$_0,std::allocator<DRCommitQueueEnumerate::$_0>,BOOL ()(re::DirectResourcesResolvedCommit const*)>::__clone(uint64_t a1)
{
  uint64_t v2 = operator new(0x10uLL);
  *uint64_t v2 = &unk_26FF354E0;
  v2[1] = _Block_copy(*(const void **)(a1 + 8));
  return v2;
}

void *std::__function::__func<DRCommitQueueEnumerate::$_0,std::allocator<DRCommitQueueEnumerate::$_0>,BOOL ()(re::DirectResourcesResolvedCommit const*)>::__clone(uint64_t a1, void *a2)
{
  *a2 = &unk_26FF354E0;
  uint64_t result = _Block_copy(*(const void **)(a1 + 8));
  a2[1] = result;
  return result;
}

void std::__function::__func<DRCommitQueueEnumerate::$_0,std::allocator<DRCommitQueueEnumerate::$_0>,BOOL ()(re::DirectResourcesResolvedCommit const*)>::destroy(uint64_t a1)
{
}

void std::__function::__func<DRCommitQueueEnumerate::$_0,std::allocator<DRCommitQueueEnumerate::$_0>,BOOL ()(re::DirectResourcesResolvedCommit const*)>::destroy_deallocate(id *a1)
{
  operator delete(a1);
}

uint64_t std::__function::__func<DRCommitQueueEnumerate::$_0,std::allocator<DRCommitQueueEnumerate::$_0>,BOOL ()(re::DirectResourcesResolvedCommit const*)>::operator()(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void **)(*(void *)a2 + 32);
  uint64_t v6 = *(void *)(*(void *)a2 + 24);
  id v7 = v3;
  uint64_t v4 = (*(uint64_t (**)(void))(*(void *)(a1 + 8) + 16))(*(void *)(a1 + 8));

  return v4;
}

uint64_t std::__function::__func<DRCommitQueueApplyThrough::$_0,std::allocator<DRCommitQueueApplyThrough::$_0>,void ()(re::DirectResourceEvent const&,unsigned long long)>::~__func(uint64_t a1)
{
  return a1;
}

void std::__function::__func<DRCommitQueueApplyThrough::$_0,std::allocator<DRCommitQueueApplyThrough::$_0>,void ()(re::DirectResourceEvent const&,unsigned long long)>::~__func(uint64_t a1)
{
  JUMPOUT(0x2533130A0);
}

void *std::__function::__func<DRCommitQueueApplyThrough::$_0,std::allocator<DRCommitQueueApplyThrough::$_0>,void ()(re::DirectResourceEvent const&,unsigned long long)>::__clone(uint64_t a1)
{
  uint64_t v2 = operator new(0x18uLL);
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(const void **)(a1 + 16);
  *uint64_t v2 = &unk_26FF35528;
  v2[1] = v4;
  v2[2] = _Block_copy(v3);
  return v2;
}

void *std::__function::__func<DRCommitQueueApplyThrough::$_0,std::allocator<DRCommitQueueApplyThrough::$_0>,void ()(re::DirectResourceEvent const&,unsigned long long)>::__clone(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 8);
  uint64_t v3 = *(const void **)(a1 + 16);
  *a2 = &unk_26FF35528;
  a2[1] = v4;
  uint64_t result = _Block_copy(v3);
  a2[2] = result;
  return result;
}

void std::__function::__func<DRCommitQueueApplyThrough::$_0,std::allocator<DRCommitQueueApplyThrough::$_0>,void ()(re::DirectResourceEvent const&,unsigned long long)>::destroy(uint64_t a1)
{
}

void std::__function::__func<DRCommitQueueApplyThrough::$_0,std::allocator<DRCommitQueueApplyThrough::$_0>,void ()(re::DirectResourceEvent const&,unsigned long long)>::destroy_deallocate(id *a1)
{
  operator delete(a1);
}

void std::__function::__func<DRCommitQueueApplyThrough::$_0,std::allocator<DRCommitQueueApplyThrough::$_0>,void ()(re::DirectResourceEvent const&,unsigned long long)>::operator()(uint64_t a1, void *a2, uint64_t *a3)
{
  if (*a2)
  {
    uint64_t v3 = *a3;
    uint64_t v4 = *(void *)(a1 + 16);
    uint64_t v5 = (void *)re::DirectResourcesCommitQueue::device(*(re::DirectResourcesCommitQueue **)(a1 + 8));
    re::DirectResourceEvent::makeEvent(v5, &v6);
    (*(void (**)(uint64_t, id, uint64_t))(v4 + 16))(v4, v6, v3);
    if (v6) {
  }
    }
}

uint64_t DRResourcesCommitCopyToXPC(uint64_t a1, const re::DirectResourceCommands *a2)
{
  if (a1) {
    uint64_t v2 = (re *)(a1 - 8);
  }
  else {
    uint64_t v2 = 0;
  }
  re::xpc_object_create(v2, a2);
  return objc_claimAutoreleasedReturnValue();
}

id DRResourcesCommitCopyEventWithDevice(uint64_t a1, void *a2)
{
  re::DirectResourceEvent::makeEvent(a2, &v5);
  id v2 = v5;
  id v3 = v2;
  if (v2) {

  }
  return v3;
}

BOOL DRResourcesCommitHasEvent(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 32) != 0;
}

uint64_t DRResourcesCommitGetId(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(void *)(v1 + 16);
}

id DRResourcesCommitGetUserPayload(uint64_t a1)
{
  uint64_t v1 = a1 - 8;
  if (!a1) {
    uint64_t v1 = 0;
  }
  return *(id *)(v1 + 24);
}

void re::DirectFence::~DirectFence()
{
}

void re::DirectFence::invalidate()
{
}

void re::MemoryMappedRegion::~MemoryMappedRegion()
{
}

void re::DirectMemoryResource::createWithSharedTexture()
{
}

void re::DirectResourceLoader::corruptResource(re *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  re::toString(a1, v5);
  int v3 = 136315138;
  uint64_t v4 = v5;
  _os_log_error_impl(&dword_24CD28000, a2, OS_LOG_TYPE_ERROR, "CorruptResource %s", (uint8_t *)&v3, 0xCu);
}

void re::DirectResourcesPendingCommit::ensureUpdate()
{
}

void re::DirectResourcesPendingCommit::scheduled()
{
  __assert_rtn("scheduled", "DirectResourceContext.cpp", 441, "m_state == State::kOpen");
}

void re::DirectResourceContext::sendIfReady()
{
  __assert_rtn("completed", "DirectResourceContext.cpp", 450, "m_state == State::kScheduled");
}

void re::DirectResourceContext::freeListWaitTimedOut(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_24CD28000, log, OS_LOG_TYPE_ERROR, "Timed out waiting for renderer to free resources.", v1, 2u);
}

void re::DirectResourceContext::addPayload()
{
}

void re::DirectResourceClientReceiver::validateAndResolve(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_24CD28000, a2, OS_LOG_TYPE_ERROR, "Discarding invalid commit from client %llu", (uint8_t *)&v3, 0xCu);
}

void re::DirectResourceClientReceiver::isValid<re::DirectMesh,re::DirectMeshUpdate>(re *a1)
{
  OUTLINED_FUNCTION_1(a1, *MEMORY[0x263EF8340], v7, v9, v10, SBYTE2(v10), SHIBYTE(v10));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24CD28000, v1, v2, "Attempting to destroy unknown resource %s", v3, v4, v5, v6, v8);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;
  uint64_t v9;
  int v10;

  OUTLINED_FUNCTION_1(a1, *MEMORY[0x263EF8340], v7, v9, v10, SBYTE2(v10), SHIBYTE(v10));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24CD28000, v1, v2, "Update destined for unknown resource %s", v3, v4, v5, v6, v8);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;
  uint64_t v9;
  int v10;

  OUTLINED_FUNCTION_1(a1, *MEMORY[0x263EF8340], v7, v9, v10, SBYTE2(v10), SHIBYTE(v10));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24CD28000, v1, v2, "Update failed validation for resource %s", v3, v4, v5, v6, v8);
}

{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;
  uint64_t v9;
  int v10;

  OUTLINED_FUNCTION_1(a1, *MEMORY[0x263EF8340], v7, v9, v10, SBYTE2(v10), SHIBYTE(v10));
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_24CD28000, v1, v2, "Attempting to create a resource %s which already exists", v3, v4, v5, v6, v8);
}

void re::DirectResource::setIdentifier()
{
  __assert_rtn("setIdentifier", "DirectResource.cpp", 40, "m_delegate == nullptr");
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x270EE47C8](allocator, bytes, length);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x270EE47F0](allocator, bytes, length, bytesDeallocator);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x270EE4830](theData);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x270EE4908](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFErrorRef CFErrorCreateWithUserInfoKeysAndValues(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, const void *const *userInfoKeys, const void *const *userInfoValues, CFIndex numUserInfoValues)
{
  return (CFErrorRef)MEMORY[0x270EE49C8](allocator, domain, code, userInfoKeys, userInfoValues, numUserInfoValues);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x270EE4BE8](allocator, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x270EE50E0](alloc, cStr, *(void *)&encoding);
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  return (IOSurfaceRef)MEMORY[0x270EF4C28](properties);
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  return (xpc_object_t)MEMORY[0x270EF4C38](aSurface);
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4C50](buffer);
}

void *__cdecl IOSurfaceGetBaseAddress(IOSurfaceRef buffer)
{
  return (void *)MEMORY[0x270EF4C58](buffer);
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  return (IOSurfaceRef)MEMORY[0x270EF4E38](xobj);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t MTLAttributeFormatSize(MTLAttributeFormat a1)
{
  return MEMORY[0x270EF6048](a1);
}

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x270F98458](__n);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F98498](this, __s);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984A0](this, __s, __n);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x270F984B8](this, __s);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

uint64_t __ulock_wait()
{
  return MEMORY[0x270ED7F18]();
}

uint64_t __ulock_wake()
{
  return MEMORY[0x270ED7F20]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void bzero(void *a1, size_t a2)
{
}

BOOL class_addMethod(Class cls, SEL name, IMP imp, const char *types)
{
  return MEMORY[0x270F9A400](cls, name, imp, types);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x270ED9320](key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void free(void *a1)
{
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

Class objc_allocateClassPair(Class superclass, const char *name, size_t extraBytes)
{
  return (Class)MEMORY[0x270F9A550](superclass, name, extraBytes);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

id objc_constructInstance(Class cls, void *bytes)
{
  return (id)MEMORY[0x270F9A5B8](cls, bytes);
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void *__cdecl objc_destructInstance(id obj)
{
  return (void *)MEMORY[0x270F9A600](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6D0](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

void objc_registerClassPair(Class cls)
{
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

BOOL os_unfair_lock_trylock(os_unfair_lock_t lock)
{
  return MEMORY[0x270EDAAD8](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int sched_yield(void)
{
  return MEMORY[0x270EDB320]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x270EDBA08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
}

void uuid_generate_random(uuid_t out)
{
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x270EDBD10](xarray, applier);
}

xpc_object_t xpc_array_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDBD20]();
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x270EDBD38](xarray);
}

xpc_object_t xpc_array_get_value(xpc_object_t xarray, size_t index)
{
  return (xpc_object_t)MEMORY[0x270EDBD88](xarray, index);
}

void xpc_array_set_value(xpc_object_t xarray, size_t index, xpc_object_t value)
{
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x270EDC018]();
}

xpc_object_t xpc_dictionary_get_array(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC040](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x270EDC060](xdict, key, length);
}

xpc_object_t xpc_dictionary_get_dictionary(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC078](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x270EDC0B0](xdict, key);
}

const uint8_t *__cdecl xpc_dictionary_get_uuid(xpc_object_t xdict, const char *key)
{
  return (const uint8_t *)MEMORY[0x270EDC0B8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x270EDC0C0](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x270EDC268]();
}

uint64_t xpc_mach_send_get_right()
{
  return MEMORY[0x270EDC278]();
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x270EDC290]();
}

void xpc_release(xpc_object_t object)
{
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x270EDC2B8](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x270EDC3B0](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x270EDC3C0](xshmem, region);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x270EDC430](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x270EDC440](xuint);
}

xpc_object_t xpc_uuid_create(const unsigned __int8 *uuid)
{
  return (xpc_object_t)MEMORY[0x270EDC458](uuid);
}

const uint8_t *__cdecl xpc_uuid_get_bytes(xpc_object_t xuuid)
{
  return (const uint8_t *)MEMORY[0x270EDC460](xuuid);
}