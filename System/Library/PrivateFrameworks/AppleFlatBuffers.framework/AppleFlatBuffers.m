void sub_22CA21BF4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void cfDeallocateBackingObject(void *a1, CFTypeRef cf)
{
}

uint64_t AFBIsValidUTF8(uint64_t a1)
{
  int v1 = 0;
  while (1)
  {
    uint64_t v2 = v1;
    uint64_t v3 = v1 + 1;
    int v4 = *(char *)(a1 + v1);
    int v5 = v4;
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_19;
    }
    if (v3 == -1) {
      return 0;
    }
    if (v4 >= 0xE0u) {
      break;
    }
    if (v4 < 0xC2u) {
      return 0;
    }
    int v8 = v4 & 0x1F;
LABEL_17:
    unsigned int v11 = *(unsigned __int8 *)(a1 + (int)v3) ^ 0x80;
    if (v11 > 0x3F) {
      return 0;
    }
    int v5 = v11 | (v8 << 6);
    LODWORD(v3) = v3 + 1;
LABEL_19:
    int v1 = v3;
    if (!v5) {
      return 1;
    }
  }
  if (v4 <= 0xEFu)
  {
    uint64_t v6 = v4 & 0xF;
    if (((a00000000000000[v6] >> (*(unsigned char *)(a1 + v3) >> 5)) & 1) == 0) {
      return 0;
    }
    unsigned int v7 = *(unsigned char *)(a1 + v3) & 0x3F;
    goto LABEL_15;
  }
  if (v4 <= 0xF4u)
  {
    int v9 = v4 - 240;
    unint64_t v10 = *(unsigned __int8 *)(a1 + v3);
    if ((byte_22CA34CA3[v10 >> 4] >> (v5 + 16)))
    {
      uint64_t v3 = v2 + 2;
      if (v2 != -3)
      {
        unsigned int v7 = *(unsigned __int8 *)(a1 + v3) ^ 0x80;
        if (v7 <= 0x3F)
        {
          LODWORD(v6) = v10 & 0x3F | (v9 << 6);
LABEL_15:
          LODWORD(v3) = v3 + 1;
          if (v3 == -1) {
            return 0;
          }
          int v8 = v7 | (v6 << 6);
          goto LABEL_17;
        }
      }
    }
  }
  return 0;
}

void sub_22CA22070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  unint64_t v10 = v9;
  a9.receiver = v10;
  a9.super_class = (Class)AFBBufRef;
  [(_Unwind_Exception *)&a9 dealloc];
  _Unwind_Resume(a1);
}

void sub_22CA22428(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if (a13) {
    (*(void (**)(uint64_t))(*(void *)a13 + 16))(a13);
  }

  _Unwind_Resume(a1);
}

void sub_22CA22740(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
}

void sub_22CA22910(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA22AFC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA22D58(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(apple::aiml::flatbuffers2::FlatBufferBuilder *this, uint64_t a2, unint64_t a3)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)this);
  *((unsigned char *)this + 70) = 1;
  uint64_t v6 = a3 * a2;
  apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, v6, 4uLL);
  return apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, v6, a3);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<BOOL>(uint64_t a1, char a2)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 1uLL);
  int v4 = (unsigned char *)(*(void *)(a1 + 48)
               - apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 1uLL));
  *(void *)(a1 + 48) = v4;
  *int v4 = a2;
  return (*(_DWORD *)(a1 + 32) - v4 + *(_DWORD *)(a1 + 40));
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(apple::aiml::flatbuffers2::FlatBufferBuilder *this, int a2)
{
  if (!*((unsigned char *)this + 70)) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector();
  }
  *((unsigned char *)this + 70) = 0;
  return apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)this, a2);
}

void sub_22CA2313C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment(apple::aiml::flatbuffers2::FlatBufferBuilder *this, uint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a4 - 1 > 0xF || (uint8x8_t v5 = (uint8x8_t)vcnt_s8((int8x8_t)a4), v5.i16[0] = vaddlv_u8(v5), v5.u32[0] >= 2uLL)) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment();
  }
  uint64_t v6 = a3 * a2;
  return apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, v6, a4);
}

void sub_22CA23464(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA23714(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA23A20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA23CF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2406C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<signed char>(uint64_t a1, char a2)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 1uLL);
  uint64_t v4 = (unsigned char *)(*(void *)(a1 + 48)
               - apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 1uLL));
  *(void *)(a1 + 48) = v4;
  *uint64_t v4 = a2;
  return (*(_DWORD *)(a1 + 32) - *(_DWORD *)(a1 + 48) + *(_DWORD *)(a1 + 40));
}

void sub_22CA243B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2468C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2493C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA24C48(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA24F14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA25290(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA25578(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA25854(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA25B04(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA25E10(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA260DC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA263A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA26674(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA269F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<short>(uint64_t a1, __int16 a2)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 2uLL);
  uint64_t v4 = (_WORD *)(*(void *)(a1 + 48)
               - apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 2uLL));
  *(void *)(a1 + 48) = v4;
  *uint64_t v4 = a2;
  return (*(_DWORD *)(a1 + 32) - v4 + *(_DWORD *)(a1 + 40));
}

void sub_22CA26D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA27010(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA272C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA275D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA278A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA27C1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA27F08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA281E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA28498(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA287A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA28A74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA28DF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>(uint64_t a1, int a2)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 4uLL);
  uint64_t v4 = (_DWORD *)(*(void *)(a1 + 48)
                - apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 4uLL));
  *(void *)(a1 + 48) = v4;
  *uint64_t v4 = a2;
  return (*(_DWORD *)(a1 + 32) - v4 + *(_DWORD *)(a1 + 40));
}

void sub_22CA29134(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA29410(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA296C4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA299D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA29CA0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2A01C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2A308(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2A5E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2A898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2ABA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2AE74(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2B1F0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<long long>(uint64_t a1, uint64_t a2)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 8uLL);
  uint64_t v4 = (void *)(*(void *)(a1 + 48)
                - apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 8uLL));
  *(void *)(a1 + 48) = v4;
  *uint64_t v4 = a2;
  return (*(_DWORD *)(a1 + 32) - v4 + *(_DWORD *)(a1 + 40));
}

void sub_22CA2B534(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2B810(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2BAC4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2BDD0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2C0A0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2C41C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2C708(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2C9E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2CC98(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2CFA4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2D274(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2D5EC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<float>(uint64_t a1, float a2)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 4uLL);
  uint64_t v4 = (float *)(*(void *)(a1 + 48)
               - apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 4uLL));
  *(void *)(a1 + 48) = v4;
  *uint64_t v4 = a2;
  return (*(_DWORD *)(a1 + 32) - v4 + *(_DWORD *)(a1 + 40));
}

void sub_22CA2D938(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2DC14(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2DEC8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2E1D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2E4A4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2E81C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<double>(uint64_t a1, double a2)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::Align((apple::aiml::flatbuffers2::FlatBufferBuilder *)a1, 8uLL);
  uint64_t v4 = (double *)(*(void *)(a1 + 48)
                - apple::aiml::flatbuffers2::vector_downward::ensure_space((apple::aiml::flatbuffers2::vector_downward *)a1, 8uLL));
  *(void *)(a1 + 48) = v4;
  *uint64_t v4 = a2;
  return (*(_DWORD *)(a1 + 32) - v4 + *(_DWORD *)(a1 + 40));
}

void sub_22CA2EB68(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2EE44(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2F0F8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2F404(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2F6D4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2F898(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2FA24(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2FB34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA2FCCC(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::ForceStringAlignment(apple::aiml::flatbuffers2::FlatBufferBuilder *this, uint64_t a2, unint64_t a3)
{
  if (a3 - 1 > 0xF || (uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)a3), v4.i16[0] = vaddlv_u8(v4), v4.u32[0] >= 2uLL)) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::ForceStringAlignment();
  }
  uint64_t v5 = a2 + 1;
  return apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, v5, a3);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::CreateString(apple::aiml::flatbuffers2::FlatBufferBuilder *this, const char *a2, unint64_t a3)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested((uint64_t)this);
  apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(this, a3 + 1, 4uLL);
  uint64_t v6 = (unsigned char *)(*((void *)this + 6) - apple::aiml::flatbuffers2::vector_downward::ensure_space(this, 1uLL));
  *((void *)this + 6) = v6;
  *uint64_t v6 = 0;
  if (a3)
  {
    unsigned int v7 = (void *)(*((void *)this + 6) - apple::aiml::flatbuffers2::vector_downward::ensure_space(this, a3));
    *((void *)this + 6) = v7;
    memcpy(v7, a2, a3);
  }
  apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)this, a3);
  return (*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10));
}

void sub_22CA2FFF0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA301D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA3039C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA30750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  _Unwind_Resume(a1);
}

void std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::reserve(void **a1, unint64_t a2)
{
  uint8x8_t v4 = a1[2];
  uint64_t v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (unsigned char *)*a1) >> 2)
  {
    if (a2 >> 62) {
      std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::__throw_length_error[abi:ne180100]();
    }
    int64_t v5 = (unsigned char *)a1[1] - (unsigned char *)*a1;
    uint64_t v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(v3, a2);
    unsigned int v7 = &v6[v5 & 0xFFFFFFFFFFFFFFFCLL];
    int v9 = &v6[4 * v8];
    unint64_t v10 = (char *)*a1;
    unsigned int v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        int v13 = *((_DWORD *)v11 - 1);
        v11 -= 4;
        *((_DWORD *)v12 - 1) = v13;
        v12 -= 4;
      }
      while (v11 != v10);
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

void sub_22CA30A28(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_22CA30DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  _Unwind_Resume(a1);
}

void sub_22CA312E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *__p,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  _Unwind_Resume(a1);
}

void apple::aiml::flatbuffers2::vector_downward::~vector_downward(apple::aiml::flatbuffers2::vector_downward *this)
{
  if (*((unsigned char *)this + 8) && *(void *)this) {
    (*(void (**)(void))(**(void **)this + 8))(*(void *)this);
  }
  *(void *)this = 0;
  *((unsigned char *)this + 8) = 0;
}

void *apple::aiml::flatbuffers2::vector_downward::clear_buffer(void *this)
{
  int v1 = this;
  uint64_t v2 = this[5];
  if (v2)
  {
    uint64_t v3 = *this;
    if (*v1)
    {
      this = (void *)(*(uint64_t (**)(uint64_t))(*(void *)v3 + 24))(v3);
    }
    else
    {
      uint8x8_t v4 = &unk_26E01F860;
      this = (void *)MEMORY[0x230F713A0](v2, 0x1000C8077774924);
    }
  }
  v1[5] = 0;
  return this;
}

void apple::aiml::flatbuffers2::DefaultAllocator::deallocate(apple::aiml::flatbuffers2::DefaultAllocator *this, unsigned __int8 *a2)
{
  if (a2) {
    JUMPOUT(0x230F713A0);
  }
}

void apple::aiml::flatbuffers2::DefaultAllocator::~DefaultAllocator(apple::aiml::flatbuffers2::DefaultAllocator *this)
{
}

void apple::aiml::flatbuffers2::DefaultAllocator::allocate(apple::aiml::flatbuffers2::DefaultAllocator *this)
{
}

char *apple::aiml::flatbuffers2::Allocator::reallocate_downward(apple::aiml::flatbuffers2::Allocator *this, unsigned __int8 *a2, unint64_t a3, unint64_t a4, size_t a5, size_t a6)
{
  if (a4 <= a3) {
    apple::aiml::flatbuffers2::Allocator::reallocate_downward();
  }
  v12 = (char *)(*(uint64_t (**)(apple::aiml::flatbuffers2::Allocator *, unint64_t))(*(void *)this + 16))(this, a4);
  memcpy(&v12[a4 - a5], &a2[a3 - a5], a5);
  memcpy(v12, a2, a6);
  (*(void (**)(apple::aiml::flatbuffers2::Allocator *, unsigned __int8 *, unint64_t))(*(void *)this + 24))(this, a2, a3);
  return v12;
}

void apple::aiml::flatbuffers2::FlatBufferBuilder::~FlatBufferBuilder(apple::aiml::flatbuffers2::FlatBufferBuilder *this)
{
  uint64_t v2 = *((void *)this + 11);
  if (v2)
  {
    std::__tree<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,apple::aiml::flatbuffers2::FlatBufferBuilder::StringOffsetCompare,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>::destroy(*((void *)this + 11), *(void **)(v2 + 8));
    MEMORY[0x230F713C0](v2, 0x1060C40C2B13FB5);
  }
  apple::aiml::flatbuffers2::vector_downward::~vector_downward(this);
}

void std::__tree<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,apple::aiml::flatbuffers2::FlatBufferBuilder::StringOffsetCompare,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>::destroy(uint64_t a1, void *a2)
{
  if (a2)
  {
    std::__tree<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,apple::aiml::flatbuffers2::FlatBufferBuilder::StringOffsetCompare,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>::destroy(a1, *a2);
    std::__tree<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>,apple::aiml::flatbuffers2::FlatBufferBuilder::StringOffsetCompare,std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested(uint64_t this)
{
  if (*(unsigned char *)(this + 70)) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested();
  }
  if (*(_DWORD *)(this + 64)) {
    apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested();
  }
  return this;
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::PreAlign(apple::aiml::flatbuffers2::FlatBufferBuilder *this, uint64_t a2, unint64_t a3)
{
  if (*((void *)this + 9) < a3) {
    *((void *)this + 9) = a3;
  }
  return apple::aiml::flatbuffers2::vector_downward::fill(this, (a3 - 1) & (-a2 - (*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10))));
}

unint64_t apple::aiml::flatbuffers2::vector_downward::fill(apple::aiml::flatbuffers2::vector_downward *this, unint64_t a2)
{
  unint64_t result = apple::aiml::flatbuffers2::vector_downward::ensure_space(this, a2);
  *((void *)this + 6) -= result;
  if (a2)
  {
    uint64_t v5 = 0;
    do
      *(unsigned char *)(*((void *)this + 6) + v5++) = 0;
    while (a2 != v5);
  }
  return result;
}

unint64_t apple::aiml::flatbuffers2::vector_downward::ensure_space(apple::aiml::flatbuffers2::vector_downward *this, unint64_t a2)
{
  unint64_t v2 = *((void *)this + 6);
  unint64_t v3 = *((void *)this + 7);
  if (v2 < v3 || (unint64_t v5 = *((void *)this + 5), v3 < v5)) {
    apple::aiml::flatbuffers2::vector_downward::ensure_space();
  }
  if (v2 - v3 < a2)
  {
    apple::aiml::flatbuffers2::vector_downward::reallocate(this, a2);
    unint64_t v5 = *((void *)this + 5);
    unint64_t v2 = *((void *)this + 6);
  }
  if ((*((_DWORD *)this + 8) - v2 + v5) >= 0x7FFFFFFF) {
    apple::aiml::flatbuffers2::vector_downward::ensure_space();
  }
  return a2;
}

char *apple::aiml::flatbuffers2::vector_downward::reallocate(apple::aiml::flatbuffers2::vector_downward *this, unint64_t a2)
{
  unint64_t v5 = *((void *)this + 4);
  uint8x8_t v4 = (unsigned __int8 *)*((void *)this + 5);
  uint64_t v6 = &v4[v5 - *((void *)this + 6)];
  uint64_t v7 = *((void *)this + 7) - (void)v4;
  if (v5) {
    unint64_t v8 = v5 >> 1;
  }
  else {
    unint64_t v8 = *((void *)this + 2);
  }
  if (v8 > a2) {
    a2 = v8;
  }
  unint64_t v9 = (*((void *)this + 3) + v5 + a2 - 1) & -*((void *)this + 3);
  *((void *)this + 4) = v9;
  uint64_t v10 = *(void *)this;
  if (v4)
  {
    if (v10)
    {
      unint64_t result = (char *)(*(uint64_t (**)(uint64_t))(*(void *)v10 + 32))(v10);
    }
    else
    {
      int v13 = &unk_26E01F860;
      unint64_t result = apple::aiml::flatbuffers2::Allocator::reallocate_downward((apple::aiml::flatbuffers2::Allocator *)&v13, v4, v5, v9, v6, v7);
    }
  }
  else
  {
    if (!v10)
    {
      int v13 = &unk_26E01F860;
      operator new[]();
    }
    unint64_t result = (char *)(*(uint64_t (**)(uint64_t, unint64_t))(*(void *)v10 + 16))(v10, v9);
  }
  uint64_t v12 = (uint64_t)&result[*((void *)this + 4) - v6];
  *((void *)this + 5) = result;
  *((void *)this + 6) = v12;
  *((void *)this + 7) = &result[v7];
  return result;
}

unint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::Align(apple::aiml::flatbuffers2::FlatBufferBuilder *this, unint64_t a2)
{
  if (*((void *)this + 9) < a2) {
    *((void *)this + 9) = a2;
  }
  return apple::aiml::flatbuffers2::vector_downward::fill(this, (a2 - 1) & -(uint64_t)(*((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10)));
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::CreateVector<apple::aiml::flatbuffers2::String>(apple::aiml::flatbuffers2::FlatBufferBuilder *a1, uint64_t a2, uint64_t a3)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::StartVector(a1, a3, 4uLL);
  if (a3)
  {
    uint64_t v6 = a2 - 4;
    uint64_t v7 = a3;
    do
    {
      uint64_t v8 = v7 - 1;
      int v9 = apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(a1, *(_DWORD *)(v6 + 4 * v7));
      apple::aiml::flatbuffers2::FlatBufferBuilder::PushElement<int>((uint64_t)a1, v9);
      uint64_t v7 = v8;
    }
    while (v8);
  }
  return apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector(a1, a3);
}

uint64_t apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo(apple::aiml::flatbuffers2::FlatBufferBuilder *this, unsigned int a2)
{
  apple::aiml::flatbuffers2::FlatBufferBuilder::Align(this, 4uLL);
  if (!a2
    || (unsigned int v4 = *((_DWORD *)this + 8) - *((_DWORD *)this + 12) + *((_DWORD *)this + 10), v5 = v4 >= a2, v6 = v4 - a2, !v5))
  {
    apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo();
  }
  return v6 + 4;
}

void std::vector<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>::__throw_length_error[abi:ne180100]()
{
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_26492B478, MEMORY[0x263F8C060]);
}

void sub_22CA31BD0(_Unwind_Exception *a1)
{
  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  unint64_t result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x263F8C388] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<apple::aiml::flatbuffers2::Offset<apple::aiml::flatbuffers2::String>>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:ne180100]();
  }
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  int v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x263F8C208], MEMORY[0x263F8C090]);
}

void sub_22CA3235C(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t cfAllocateAlwaysFailing(uint64_t a1, unint64_t a2, void *a3)
{
  return 0;
}

unint64_t apple::aiml::flatbuffers2::objc_apple::page_align_rounddown(unint64_t this)
{
  return this / *MEMORY[0x263EF8AF8] * *MEMORY[0x263EF8AF8];
}

unint64_t apple::aiml::flatbuffers2::objc_apple::page_align_roundup(apple::aiml::flatbuffers2::objc_apple *this)
{
  return ((unint64_t)this + *MEMORY[0x263EF8AF8] - 1) / *MEMORY[0x263EF8AF8] * *MEMORY[0x263EF8AF8];
}

void *apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::PageAlignedMemmove(void *this, uint64_t a2)
{
  *this = &unk_26E01F800;
  this[1] = a2;
  return this;
}

void apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::~PageAlignedMemmove(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *this)
{
}

void apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::sync(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *this, unsigned __int8 **a2, unint64_t *a3)
{
  if (*a2 && (unint64_t)*a2 % *MEMORY[0x263EF8AF8]) {
    apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::sync();
  }
  *a2 = 0;
  *a3 = 0;
}

uint64_t apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *this, unint64_t __dst, const unsigned __int8 *__src, size_t a4)
{
  if ((unint64_t)__src <= __dst) {
    apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
  }
  size_t v8 = 0;
  unint64_t v9 = *((void *)this + 1);
  uint64_t v10 = (unint64_t *)MEMORY[0x263EF8AF8];
  unint64_t v11 = *MEMORY[0x263EF8AF8];
  if (v9 <= *MEMORY[0x263EF8AF8]) {
    unint64_t v9 = *MEMORY[0x263EF8AF8];
  }
  unint64_t v12 = (v11 - 1 + v9) / v11 * v11;
  unint64_t v13 = (v11 - 1 + __dst) / v11 * v11;
  unint64_t v25 = 0;
  v26 = 0;
  BOOL v14 = v13 > __dst;
  unint64_t v15 = v13 - __dst;
  if (v14)
  {
    size_t v8 = v15 >= a4 ? a4 : v15;
    memmove((void *)__dst, __src, v8);
    unint64_t v16 = *v10;
    unint64_t v17 = __dst / *v10 * *v10;
    unint64_t v25 = v16;
    v26 = (unsigned __int8 *)v17;
    if (v16 >= v12)
    {
      if (v17 > __dst) {
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
      }
      if (v17 + v16 < __dst + v8) {
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
      }
      (**(void (***)(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *, unsigned __int8 **, unint64_t *))this)(this, &v26, &v25);
    }
  }
  if (v8 < a4)
  {
    unint64_t v18 = *v10;
    do
    {
      v19 = (unsigned __int8 *)(__dst + v8);
      if ((__dst + v8) % v18) {
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
      }
      unint64_t v20 = v25;
      if (v12 <= v25) {
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
      }
      if (v12 - v25 >= a4 - v8) {
        size_t v21 = a4 - v8;
      }
      else {
        size_t v21 = v12 - v25;
      }
      if (!v21) {
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
      }
      memmove((void *)(__dst + v8), &__src[v8], v21);
      v22 = v26;
      if (!v26)
      {
        v26 = (unsigned __int8 *)(__dst + v8);
        v22 = (unsigned __int8 *)(__dst + v8);
      }
      unint64_t v18 = *v10;
      unint64_t v23 = v20 + (v21 + *v10 - 1) / *v10 * *v10;
      unint64_t v25 = v23;
      if (v23 >= v12)
      {
        if (v22 > v19) {
          apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
        }
        if (&v22[v23] < &v19[v21]) {
          apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down();
        }
        (**(void (***)(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *, unsigned __int8 **, unint64_t *))this)(this, &v26, &v25);
        unint64_t v18 = *v10;
      }
      v8 += v21;
    }
    while (v8 < a4);
  }
  return (**(uint64_t (***)(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *, unsigned __int8 **, unint64_t *))this)(this, &v26, &v25);
}

uint64_t apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *this, unsigned __int8 *a2, unsigned __int8 *a3, unint64_t a4)
{
  if (a3 >= a2) {
    apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
  }
  size_t v7 = 0;
  unint64_t v8 = *((void *)this + 1);
  unint64_t v9 = *MEMORY[0x263EF8AF8];
  if (v8 <= *MEMORY[0x263EF8AF8]) {
    unint64_t v8 = *MEMORY[0x263EF8AF8];
  }
  unint64_t v10 = (v9 + v8 - 1) / v9 * v9;
  unint64_t v22 = 0;
  unint64_t v23 = 0;
  unint64_t v11 = &a2[a4];
  unint64_t v12 = (unint64_t)&a2[a4] / v9 * v9;
  if ((unint64_t)&a2[a4] % v9 != 0 && (unint64_t)&a2[a4] >= v12)
  {
    size_t v7 = (unint64_t)&a2[a4] % v9 >= a4 ? a4 : (unint64_t)&a2[a4] % v9;
    memmove(&v11[-v7], &a3[a4 - v7], v7);
    unint64_t v23 = v12;
    unint64_t v13 = *MEMORY[0x263EF8AF8];
    unint64_t v22 = v13;
    if (v13 >= v10)
    {
      if ((unint64_t)&v11[-v7] < v12) {
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
      }
      if (v12 + v13 < (unint64_t)v11) {
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
      }
      (**(void (***)(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *, unint64_t *, unint64_t *))this)(this, &v23, &v22);
    }
  }
  if (v7 < a4)
  {
    BOOL v14 = &a3[a4];
    unint64_t v15 = *MEMORY[0x263EF8AF8];
    do
    {
      unint64_t v16 = &v11[-v7];
      if ((unint64_t)&v11[-v7] % v15) {
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
      }
      unint64_t v17 = v22;
      if (v10 <= v22) {
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
      }
      if (v10 - v22 >= a4 - v7) {
        size_t v18 = a4 - v7;
      }
      else {
        size_t v18 = v10 - v22;
      }
      if (!v18) {
        apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
      }
      memmove(&v16[-v18], &v14[-v7 - v18], v18);
      unint64_t v15 = *MEMORY[0x263EF8AF8];
      size_t v19 = (unint64_t)&v16[-v18] / *MEMORY[0x263EF8AF8] * *MEMORY[0x263EF8AF8];
      unint64_t v20 = v17 + (v18 + *MEMORY[0x263EF8AF8] - 1) / *MEMORY[0x263EF8AF8] * *MEMORY[0x263EF8AF8];
      unint64_t v22 = v20;
      unint64_t v23 = v19;
      if (v20 >= v10)
      {
        if ((unint64_t)&v16[-v18] < v19) {
          apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
        }
        if (v19 + v20 < (unint64_t)v16) {
          apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up();
        }
        (**(void (***)(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *, unint64_t *, unint64_t *))this)(this, &v23, &v22);
        unint64_t v15 = *MEMORY[0x263EF8AF8];
      }
      v7 += v18;
    }
    while (v7 < a4);
  }
  return (**(uint64_t (***)(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *, unint64_t *, unint64_t *))this)(this, &v23, &v22);
}

apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove(apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *this, unsigned __int8 *a2, unsigned __int8 *a3, unint64_t a4)
{
  if (a2 != a3 && a4)
  {
    if (a2 <= a3) {
      return (apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *)apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down(this, (unint64_t)a2, a3, a4);
    }
    else {
      return (apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *)apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up(this, a2, a3, a4);
    }
  }
  return this;
}

void *apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync::MemmoveWithMsync(void *this, uint64_t a2)
{
  *this = &unk_26E01F7B0;
  this[1] = a2;
  return this;
}

unint64_t apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync::sync(apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync *this, unsigned __int8 **a2, unint64_t *a3)
{
  unint64_t result = (unint64_t)*a2;
  if (*a2)
  {
    if (result % *MEMORY[0x263EF8AF8]) {
      apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync::sync();
    }
    if (*a3)
    {
      unint64_t result = msync((void *)result, *a3, 16);
      if (result) {
        apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync::sync();
      }
    }
    *a2 = 0;
    *a3 = 0;
  }
  return result;
}

__n128 apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::MappedFileAllocator(uint64_t a1, __n128 *a2, uint64_t *a3)
{
  *(void *)a1 = &unk_26E01F828;
  __n128 result = *a2;
  *(void *)(a1 + 24) = a2[1].n128_u64[0];
  *(__n128 *)(a1 + 8) = result;
  uint64_t v4 = *a3;
  *a3 = 0;
  *(void *)(a1 + 32) = v4;
  *(_DWORD *)(a1 + 40) = -1;
  *(_DWORD *)(a1 + 84) = 0;
  *(void *)(a1 + 48) = -1;
  *(void *)(a1 + 56) = 0;
  *(void *)(a1 + 64) = 0;
  *(void *)(a1 + 72) = 0;
  *(unsigned char *)(a1 + 80) = 0;
  return result;
}

uint64_t apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::init(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *this, const char *a2, int a3, int *a4)
{
  if (*((unsigned char *)this + 80)) {
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::init();
  }
  if (*((_DWORD *)this + 2) == 1)
  {
    uint64_t result = 0;
    if (a4) {
      *a4 = *((_DWORD *)this + 6);
    }
  }
  else
  {
    int v7 = open_dprotected_np(a2, 1538, a3, 0, 420);
    *((_DWORD *)this + 10) = v7;
    if (v7 < 0)
    {
      if (a4) {
        *a4 = *__error();
      }
      uint64_t result = 0;
      *((unsigned char *)this + 80) = 1;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

void apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::~MappedFileAllocator(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *this)
{
  *(void *)this = &unk_26E01F828;
  unint64_t v2 = (void *)*((void *)this + 6);
  if (v2 != (void *)-1) {
    munmap(v2, *((void *)this + 7));
  }
  int v3 = *((_DWORD *)this + 10);
  if ((v3 & 0x80000000) == 0) {
    close(v3);
  }
  uint64_t v4 = *((void *)this + 4);
  *((void *)this + 4) = 0;
  if (v4) {
    (*(void (**)(uint64_t))(*(void *)v4 + 16))(v4);
  }
}

{
  uint64_t vars8;

  apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::~MappedFileAllocator(this);
  JUMPOUT(0x230F713C0);
}

uint64_t apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::allocate(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *this, uint64_t a2)
{
  if (*((unsigned char *)this + 80)) {
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::allocate();
  }
  if (*((_DWORD *)this + 2) == 3)
  {
    int v3 = *((_DWORD *)this + 21);
    if (v3 == *((_DWORD *)this + 7))
    {
      exception = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(&v7, "(Test mode) allocation failure");
      apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(exception, &v7);
    }
    *((_DWORD *)this + 21) = v3 + 1;
  }
  if (*((void *)this + 8))
  {
    BOOL v5 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v7, "Only one region can be allocated from the mmap");
    apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(v5, &v7);
  }
  (*(void (**)(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *, void, void, uint64_t, void, void))(*(void *)this + 32))(this, 0, *((void *)this + 9), a2, 0, 0);
  return *((void *)this + 8);
}

void sub_22CA32FB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0) {
    operator delete(__p);
  }
  if (v16) {
    __cxa_free_exception(v15);
  }
  _Unwind_Resume(exception_object);
}

void apple::aiml::flatbuffers2::objc_apple::AllocatorException::~AllocatorException(std::exception *this)
{
  this->__vftable = (std::exception_vtbl *)&unk_26E01F7D8;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
}

{
  uint64_t vars8;

  this->__vftable = (std::exception_vtbl *)&unk_26E01F7D8;
  if (SHIBYTE(this[3].__vftable) < 0) {
    operator delete(this[1].__vftable);
  }
  std::exception::~exception(this);
  JUMPOUT(0x230F713C0);
}

uint64_t apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::deallocate(uint64_t this, unsigned __int8 *a2)
{
  if (*(unsigned char *)(this + 80)) {
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::deallocate();
  }
  *(void *)(this + 64) = 0;
  *(void *)(this + 72) = 0;
  return this;
}

unint64_t apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::reallocate_downward(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *this, unsigned __int8 *a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)this + 80)) {
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::reallocate_downward();
  }
  if (a6 + a5 > a4) {
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::reallocate_downward();
  }
  if (*((_DWORD *)this + 2) == 4)
  {
    int v11 = *((_DWORD *)this + 21);
    if (v11 == *((_DWORD *)this + 7))
    {
      exception = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(__str, "(Test mode) realloc failure");
      apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(exception, __str);
    }
    *((_DWORD *)this + 21) = v11 + 1;
  }
  if (*((unsigned __int8 **)this + 8) != a2 || *((void *)this + 9) != a3)
  {
    snprintf((char *)__str, 0x200uLL, "Mismatched region reallocation (exp %p, act %p)", *((const void **)this + 8), a2);
    char v16 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v18, (char *)__str);
    apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(v16, &v18);
  }
  unint64_t v12 = *((void *)this + 7);
  if (v12 < a4)
  {
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::increase_map_size(this, a4);
    unint64_t v12 = *((void *)this + 7);
    a2 = (unsigned __int8 *)*((void *)this + 8);
  }
  unint64_t v13 = *((void *)this + 6) + v12;
  unint64_t v14 = v13 - a4;
  if (a2) {
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::memmove_downward(this, a2, a3, (unsigned __int8 *)(v13 - a4), a4, a5, a6);
  }
  *((void *)this + 8) = v14;
  *((void *)this + 9) = a4;
  return v14;
}

void sub_22CA3325C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, __int16 a14, char a15, char a16, void *__p, uint64_t a18, int a19, __int16 a20,char a21,char a22)
{
  if (a22 < 0)
  {
    operator delete(__p);
    if ((v23 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v23)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v22);
  goto LABEL_6;
}

char *apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::increase_map_size(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *this, unint64_t a2)
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  uint64_t v4 = *((void *)this + 6);
  if (v4 != -1)
  {
    if (msync(*((void **)this + 6), *((void *)this + 7), 16))
    {
      int v15 = *__error();
      char v16 = strerror(v15);
      snprintf(__str, 0x200uLL, "Unable to sync memory to disk: %s (%d)", v16, v15);
      exception = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(&v21, __str);
      apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(exception, &v21);
    }
    if (munmap(*((void **)this + 6), *((void *)this + 7)))
    {
      int v18 = *__error();
      size_t v19 = strerror(v18);
      snprintf(__str, 0x200uLL, "Unable to release memory mapping: %s (%d)", v19, v18);
      uint64_t v20 = __cxa_allocate_exception(0x20uLL);
      std::string::basic_string[abi:ne180100]<0>(&v21, __str);
      apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(v20, &v21);
    }
  }
  unint64_t v5 = *((void *)this + 7);
  if (v5 <= a2) {
    unint64_t v5 = a2;
  }
  off_t v6 = (v5 + *MEMORY[0x263EF8AF8] - 1) / *MEMORY[0x263EF8AF8] * *MEMORY[0x263EF8AF8];
  *((void *)this + 7) = v6;
  if (ftruncate(*((_DWORD *)this + 10), v6))
  {
    int v9 = *__error();
    unint64_t v10 = strerror(v9);
    snprintf(__str, 0x200uLL, "Unable to extend file: %s (%d)", v10, v9);
    int v11 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v21, __str);
    apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(v11, &v21);
  }
  uint64_t result = (char *)mmap(0, *((void *)this + 7), 3, 1, *((_DWORD *)this + 10), 0);
  *((void *)this + 6) = result;
  if (result == (char *)-1)
  {
    int v12 = *__error();
    unint64_t v13 = strerror(v12);
    snprintf(__str, 0x200uLL, "Unable to map file: %s (%d)", v13, v12);
    unint64_t v14 = __cxa_allocate_exception(0x20uLL);
    std::string::basic_string[abi:ne180100]<0>(&v21, __str);
    apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(v14, &v21);
  }
  uint64_t v8 = *((void *)this + 8);
  if (v8) {
    *((void *)this + 8) = &result[v8 - v4];
  }
  return result;
}

void sub_22CA33594(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *__p, uint64_t a12, int a13, __int16 a14, char a15, char a16)
{
  if (a16 < 0)
  {
    operator delete(__p);
    if ((v17 & 1) == 0) {
LABEL_6:
    }
      _Unwind_Resume(a1);
  }
  else if (!v17)
  {
    goto LABEL_6;
  }
  __cxa_free_exception(v16);
  goto LABEL_6;
}

apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::memmove_downward(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *this, unsigned __int8 *a2, uint64_t a3, unsigned __int8 *a4, uint64_t a5, unint64_t a6, unint64_t a7)
{
  unint64_t v14 = (apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *)*((void *)this + 4);
  if (a4 <= a2)
  {
    apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove(v14, a4, a2, a7);
    int v15 = (apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *)*((void *)this + 4);
    char v16 = &a4[a5 - a6];
    int v17 = &a2[a3 - a6];
    unint64_t v18 = a6;
  }
  else
  {
    apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove(v14, &a4[a5 - a6], &a2[a3 - a6], a6);
    int v15 = (apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove *)*((void *)this + 4);
    char v16 = a4;
    int v17 = a2;
    unint64_t v18 = a7;
  }
  return apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove(v15, v16, v17, v18);
}

uint64_t apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::truncate_to_region(apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator *this, unsigned __int8 *a2, unint64_t a3, int *a4)
{
  if (*((unsigned char *)this + 80)) {
    apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::truncate_to_region();
  }
  uint64_t v8 = (unsigned __int8 *)*((void *)this + 6);
  if (v8 == (unsigned __int8 *)-1)
  {
    if (a4)
    {
      uint64_t result = 0;
      int v10 = 2;
      goto LABEL_9;
    }
    return 0;
  }
  if (v8 > a2 || &a2[a3] > &v8[*((void *)this + 7)])
  {
    if (a4)
    {
      uint64_t result = 0;
      int v10 = 22;
LABEL_9:
      *a4 = v10;
      return result;
    }
    return 0;
  }
  *((unsigned char *)this + 80) = 1;
  if (*((_DWORD *)this + 2) == 2)
  {
    if (a4)
    {
      uint64_t result = 0;
      int v10 = *((_DWORD *)this + 6);
      goto LABEL_9;
    }
    return 0;
  }
  apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove(*((apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove **)this + 4), v8, a2, a3);
  if (msync(*((void **)this + 6), (a3 + *MEMORY[0x263EF8AF8] - 1) / *MEMORY[0x263EF8AF8] * *MEMORY[0x263EF8AF8], 16)
    || munmap(*((void **)this + 6), *((void *)this + 7)))
  {
    if (a4)
    {
      int v11 = __error();
      uint64_t result = 0;
      int v10 = *v11;
      goto LABEL_9;
    }
    return 0;
  }
  *((void *)this + 6) = -1;
  int v12 = ftruncate(*((_DWORD *)this + 10), a3);
  if (a4 && v12) {
    *a4 = *__error();
  }
  int v13 = close(*((_DWORD *)this + 10));
  if (a4)
  {
    if (v13) {
      *a4 = *__error();
    }
  }
  *((_DWORD *)this + 10) = -1;
  return 1;
}

void apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync::~MemmoveWithMsync(apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync *this)
{
}

void *apple::aiml::flatbuffers2::objc_apple::AllocatorException::AllocatorException(void *a1, long long *a2)
{
  *a1 = &unk_26E01F7D8;
  int v3 = (std::string *)(a1 + 1);
  if (*((char *)a2 + 23) < 0)
  {
    std::string::__init_copy_ctor_external(v3, *(const std::string::value_type **)a2, *((void *)a2 + 1));
  }
  else
  {
    long long v4 = *a2;
    v3->__r_.__value_.__r.__words[2] = *((void *)a2 + 2);
    *(_OWORD *)&v3->__r_.__value_.__l.__data_ = v4;
  }
  return a1;
}

void sub_22CA33888(_Unwind_Exception *a1)
{
  std::exception::~exception(v1);
  _Unwind_Resume(a1);
}

uint64_t apple::aiml::flatbuffers2::objc_apple::AllocatorException::what(apple::aiml::flatbuffers2::objc_apple::AllocatorException *this)
{
  uint64_t result = (uint64_t)this + 8;
  if (*((char *)this + 31) < 0) {
    return *(void *)result;
  }
  return result;
}

void std::string::__init_copy_ctor_external(std::string *this, const std::string::value_type *__s, std::string::size_type __sz)
{
  unint64_t v5 = this;
  if (__sz > 0x16)
  {
    if (__sz >= 0x7FFFFFFFFFFFFFF8) {
      std::string::__throw_length_error[abi:ne180100]();
    }
    std::string::size_type v6 = (__sz & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__sz | 7) != 0x17) {
      std::string::size_type v6 = __sz | 7;
    }
    std::string::size_type v7 = v6 + 1;
    uint64_t v8 = (std::string *)operator new(v6 + 1);
    v5->__r_.__value_.__l.__size_ = __sz;
    v5->__r_.__value_.__r.__words[2] = v7 | 0x8000000000000000;
    v5->__r_.__value_.__r.__words[0] = (std::string::size_type)v8;
    unint64_t v5 = v8;
  }
  else
  {
    *((unsigned char *)&this->__r_.__value_.__s + 23) = __sz;
  }
  memmove(v5, __s, __sz + 1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
}

void *std::string::basic_string[abi:ne180100]<0>(void *a1, char *__s)
{
  size_t v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8) {
    std::string::__throw_length_error[abi:ne180100]();
  }
  size_t v5 = v4;
  if (v4 >= 0x17)
  {
    uint64_t v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17) {
      uint64_t v7 = v4 | 7;
    }
    uint64_t v8 = v7 + 1;
    std::string::size_type v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((unsigned char *)a1 + 23) = v4;
    std::string::size_type v6 = a1;
    if (!v4) {
      goto LABEL_9;
    }
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((unsigned char *)v6 + v5) = 0;
  return a1;
}

void apple::aiml::flatbuffers2::FlatBufferBuilder::EndVector()
{
}

void apple::aiml::flatbuffers2::FlatBufferBuilder::ForceVectorAlignment()
{
}

void apple::aiml::flatbuffers2::FlatBufferBuilder::ForceStringAlignment()
{
}

void apple::aiml::flatbuffers2::Allocator::reallocate_downward()
{
}

void apple::aiml::flatbuffers2::FlatBufferBuilder::NotNested()
{
}

{
  __assert_rtn("NotNested", "flatbuffers.h", 1432, "!nested");
}

void apple::aiml::flatbuffers2::vector_downward::ensure_space()
{
  __assert_rtn("ensure_space", "flatbuffers.h", 988, "cur_ >= scratch_ && scratch_ >= buf_");
}

{
  __assert_rtn("ensure_space", "flatbuffers.h", 992, "size() < FLATBUFFERS_MAX_BUFFER_SIZE");
}

void apple::aiml::flatbuffers2::FlatBufferBuilder::ReferTo()
{
  __assert_rtn("ReferTo", "flatbuffers.h", 1419, "off && off <= GetSize()");
}

void apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::sync()
{
  __assert_rtn("sync", "AFBMappedFileAllocator.mm", 62, "page_align_rounddown(aligned_dirty_start) == aligned_dirty_start");
}

void apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_down()
{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 106, "bytes_this_time != 0");
}

{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 113, "aligned_dirty_start <= dest + bytes_transferred");
}

{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 114, "aligned_dirty_start + aligned_bytes_dirtied >= dest + bytes_transferred + bytes_this_time");
}

{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 104, "max_dirty_size > aligned_bytes_dirtied");
}

{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 102, "dest + bytes_transferred == page_align_rounddown(dest + bytes_transferred)");
}

{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 90, "aligned_dirty_start <= dest");
}

{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 91, "aligned_dirty_start + aligned_bytes_dirtied >= dest + bytes_this_time");
}

{
  __assert_rtn("memmove_down", "AFBMappedFileAllocator.mm", 73, "src > dest");
}

void apple::aiml::flatbuffers2::objc_apple::PageAlignedMemmove::memmove_up()
{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 162, "bytes_this_time != 0");
}

{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 167, "aligned_dirty_start <= dest + size - bytes_transferred - bytes_this_time");
}

{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 168, "aligned_dirty_start + aligned_bytes_dirtied >= dest + size - bytes_transferred");
}

{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 160, "max_dirty_size > aligned_bytes_dirtied");
}

{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 158, "dest + size - bytes_transferred == page_align_rounddown(dest + size - bytes_transferred)");
}

{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 146, "aligned_dirty_start <= dest + size - bytes_this_time");
}

{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 147, "aligned_dirty_start + aligned_bytes_dirtied >= dest + size");
}

{
  __assert_rtn("memmove_up", "AFBMappedFileAllocator.mm", 129, "src < dest");
}

void apple::aiml::flatbuffers2::objc_apple::MemmoveWithMsync::sync()
{
  __assert_rtn("sync", "AFBMappedFileAllocator.mm", 198, "rc == 0");
}

{
  __assert_rtn("sync", "AFBMappedFileAllocator.mm", 195, "page_align_rounddown(aligned_dirty_start) == aligned_dirty_start");
}

void apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::init()
{
}

void apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::allocate()
{
}

void apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::deallocate()
{
}

void apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::reallocate_downward()
{
  __assert_rtn("reallocate_downward", "AFBMappedFileAllocator.mm", 275, "in_use_back + in_use_front <= new_size");
}

{
  __assert_rtn("reallocate_downward", "AFBMappedFileAllocator.mm", 274, "!file_complete");
}

void apple::aiml::flatbuffers2::objc_apple::MappedFileAllocator::truncate_to_region()
{
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x270EE4298](allocator, context);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x270F98330](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x270F98428](this);
}

void std::exception::~exception(std::exception *this)
{
}

void std::terminate(void)
{
}

void operator delete[]()
{
  while (1)
    ;
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

void operator new[]()
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

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x270F98EC0](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x270F98ED8](a1);
}

void __cxa_end_catch(void)
{
}

void __cxa_free_exception(void *a1)
{
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x270ED9B30](*(void *)&a1, a2);
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

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x270EDA5E0](a1, a2, *(void *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
{
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x270EDA830](a1, *(void *)&a2, *(void *)&a3, *(void *)&a4);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}