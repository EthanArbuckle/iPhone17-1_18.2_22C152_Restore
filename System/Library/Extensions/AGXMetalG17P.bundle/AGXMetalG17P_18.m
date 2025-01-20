void ___ZN3AGX4HeapILb0EED2Ev_block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void *)(a1 + 32);
  v2 = *(void **)v1;
  if (*(void *)v1)
  {
    do
    {
      v4 = *(void **)v2;
      v3 = (void *)*((void *)v2 + 1);
      if (*(void *)v2)
      {
        v4[1] = v3;
        v3 = (void *)*((void *)v2 + 1);
      }
      else
      {
        *(void *)(v1 + 8) = v3;
      }
      *v3 = v4;
      [*((id *)v2 + 37) gpuAddress];
      [*((id *)v2 + 37) virtualAddress];

      free(v2);
      v2 = v4;
    }
    while (v4);
  }
}

void AGX::HeapBuffer::~HeapBuffer(AGX::HeapBuffer *this)
{
  if (*((void *)this + 8))
  {
    if (*((void *)this + 3))
    {
      uint64_t v2 = *((void *)this + 4);
      v3 = *(NSObject **)(v2 + 16);
      v4[0] = MEMORY[0x263EF8330];
      v4[1] = 3221225472;
      v4[2] = ___ZN3AGX4HeapILb1EE14deallocateImplERKNS1_10AllocationE_block_invoke;
      v4[3] = &__block_descriptor_48_e5_v8__0l;
      v4[4] = v2;
      v4[5] = this;
      dispatch_sync(v3, v4);
      *(_OWORD *)((char *)this + 25) = 0u;
      *(_OWORD *)this = 0u;
      *((_OWORD *)this + 1) = 0u;
    }
  }
}

uint64x2_t InterchangeTiledMemory::getPlaneInfo(InterchangeTiledMemory *this, int a2, MTLPixelFormat a3, uint64_t a4)
{
  switch(a3)
  {
    case 0x228uLL:
    case 0x229uLL:
    case 0x27DuLL:
    case 0x27EuLL:
    case 0x27FuLL:
    case 0x280uLL:
    case 0x281uLL:
      *(_WORD *)this = 4112;
      *((unsigned char *)this + 2) = 64;
      *(_OWORD *)((char *)this + 8) = xmmword_242EB3098;
      *(_OWORD *)((char *)this + 24) = unk_242EB30A8;
      v7 = &xmmword_242EB30B8;
      goto LABEL_14;
    case 0x22AuLL:
    case 0x22BuLL:
LABEL_13:
      *(_WORD *)this = 4112;
      *((unsigned char *)this + 2) = 32;
      *(_OWORD *)((char *)this + 8) = xmmword_242EB3398;
      *(_OWORD *)((char *)this + 24) = unk_242EB33A8;
      v7 = &xmmword_242EB33B8;
LABEL_14:
      uint64x2_t result = (uint64x2_t)*v7;
      long long v11 = v7[1];
      *(_OWORD *)((char *)this + 40) = *v7;
      *(_OWORD *)((char *)this + 56) = v11;
      break;
    case 0x22CuLL:
    case 0x22DuLL:
    case 0x22EuLL:
    case 0x22FuLL:
    case 0x230uLL:
    case 0x231uLL:
    case 0x232uLL:
    case 0x233uLL:
    case 0x234uLL:
    case 0x235uLL:
    case 0x236uLL:
    case 0x237uLL:
    case 0x238uLL:
    case 0x239uLL:
    case 0x23AuLL:
    case 0x23BuLL:
    case 0x23CuLL:
    case 0x23DuLL:
    case 0x23EuLL:
    case 0x23FuLL:
    case 0x240uLL:
    case 0x241uLL:
    case 0x242uLL:
    case 0x243uLL:
    case 0x24AuLL:
    case 0x24BuLL:
    case 0x24CuLL:
    case 0x24DuLL:
    case 0x24EuLL:
    case 0x24FuLL:
    case 0x250uLL:
    case 0x251uLL:
    case 0x252uLL:
    case 0x253uLL:
    case 0x254uLL:
    case 0x255uLL:
    case 0x256uLL:
    case 0x257uLL:
    case 0x25BuLL:
    case 0x25CuLL:
    case 0x25DuLL:
    case 0x25EuLL:
    case 0x25FuLL:
    case 0x260uLL:
    case 0x261uLL:
    case 0x262uLL:
    case 0x263uLL:
    case 0x264uLL:
    case 0x265uLL:
    case 0x266uLL:
    case 0x267uLL:
    case 0x268uLL:
    case 0x269uLL:
    case 0x26DuLL:
    case 0x26EuLL:
    case 0x26FuLL:
    case 0x270uLL:
    case 0x271uLL:
    case 0x272uLL:
    case 0x273uLL:
    case 0x274uLL:
    case 0x275uLL:
    case 0x276uLL:
    case 0x277uLL:
    case 0x278uLL:
    case 0x279uLL:
    case 0x27AuLL:
    case 0x27BuLL:
    case 0x27CuLL:
LABEL_10:
      switch(a3)
      {
        case 0x1F4uLL:
        case 0x1F6uLL:
        case 0x1F7uLL:
        case 0x208uLL:
        case 0x20AuLL:
        case 0x20BuLL:
        case 0x21CuLL:
        case 0x21DuLL:
        case 0x21EuLL:
          v14 = (_OWORD *)((char *)this + 8);
          v5 = (long long *)((char *)this + 40);
          if (a2)
          {
            *(_WORD *)this = 4112;
            *((unsigned char *)this + 2) = 16;
            _OWORD *v14 = xmmword_242EB3118;
            *(_OWORD *)((char *)this + 24) = unk_242EB3128;
            v6 = &xmmword_242EB3138;
          }
          else
          {
            *(_WORD *)this = 8224;
            *((unsigned char *)this + 2) = 8;
            _OWORD *v14 = xmmword_242EB30D8;
            *(_OWORD *)((char *)this + 24) = unk_242EB30E8;
            v6 = &xmmword_242EB30F8;
          }
          goto LABEL_9;
        case 0x1F8uLL:
        case 0x20CuLL:
        case 0x233uLL:
        case 0x24AuLL:
        case 0x24BuLL:
        case 0x24EuLL:
        case 0x25FuLL:
        case 0x26FuLL:
        case 0x274uLL:
        case 0x275uLL:
          goto LABEL_13;
        case 0x1F9uLL:
        case 0x1FAuLL:
        case 0x1FBuLL:
        case 0x20DuLL:
        case 0x20EuLL:
        case 0x20FuLL:
        case 0x21FuLL:
        case 0x220uLL:
        case 0x221uLL:
        case 0x234uLL:
        case 0x235uLL:
        case 0x236uLL:
        case 0x24FuLL:
        case 0x250uLL:
        case 0x251uLL:
        case 0x260uLL:
        case 0x261uLL:
        case 0x262uLL:
          v10 = (_OWORD *)((char *)this + 8);
          v5 = (long long *)((char *)this + 40);
          if (a2)
          {
            *(_WORD *)this = 4112;
            *((unsigned char *)this + 2) = 32;
            _OWORD *v10 = xmmword_242EB3218;
            *(_OWORD *)((char *)this + 24) = unk_242EB3228;
            v6 = &xmmword_242EB3238;
          }
          else
          {
            *(_WORD *)this = 8224;
            *((unsigned char *)this + 2) = 16;
            _OWORD *v10 = xmmword_242EB31D8;
            *(_OWORD *)((char *)this + 24) = unk_242EB31E8;
            v6 = &xmmword_242EB31F8;
          }
          goto LABEL_9;
        case 0x1FCuLL:
        case 0x1FDuLL:
        case 0x1FEuLL:
        case 0x210uLL:
        case 0x211uLL:
        case 0x212uLL:
        case 0x222uLL:
        case 0x223uLL:
        case 0x224uLL:
        case 0x237uLL:
        case 0x238uLL:
        case 0x239uLL:
        case 0x252uLL:
        case 0x253uLL:
        case 0x254uLL:
        case 0x263uLL:
        case 0x264uLL:
        case 0x265uLL:
          v12 = (_OWORD *)((char *)this + 8);
          v5 = (long long *)((char *)this + 40);
          if (a2)
          {
            *(_WORD *)this = 4112;
            *((unsigned char *)this + 2) = 20;
            _OWORD *v12 = xmmword_242EB3318;
            *(_OWORD *)((char *)this + 24) = unk_242EB3328;
            v6 = &xmmword_242EB3338;
          }
          else
          {
            *(_WORD *)this = 8224;
            *((unsigned char *)this + 2) = 10;
            _OWORD *v12 = xmmword_242EB32D8;
            *(_OWORD *)((char *)this + 24) = unk_242EB32E8;
            v6 = &xmmword_242EB32F8;
          }
          goto LABEL_9;
        case 0x226uLL:
        case 0x227uLL:
        case 0x270uLL:
        case 0x271uLL:
        case 0x272uLL:
        case 0x273uLL:
          *(_WORD *)this = 4112;
          v5 = (long long *)((char *)this + 40);
          v15 = (_OWORD *)((char *)this + 8);
          if (a2)
          {
            *((unsigned char *)this + 2) = 8;
            _OWORD *v15 = xmmword_242EB3358;
            *(_OWORD *)((char *)this + 24) = unk_242EB3368;
            v6 = &xmmword_242EB3378;
          }
          else
          {
            *((unsigned char *)this + 2) = 32;
            _OWORD *v15 = xmmword_242EB3398;
            *(_OWORD *)((char *)this + 24) = unk_242EB33A8;
            v6 = &xmmword_242EB33B8;
          }
          goto LABEL_9;
        case 0x23AuLL:
        case 0x23BuLL:
        case 0x23CuLL:
        case 0x23DuLL:
        case 0x23EuLL:
        case 0x23FuLL:
        case 0x255uLL:
        case 0x256uLL:
        case 0x257uLL:
        case 0x267uLL:
        case 0x268uLL:
        case 0x269uLL:
          v13 = (_OWORD *)((char *)this + 8);
          v5 = (long long *)((char *)this + 40);
          if (a2)
          {
            *(_WORD *)this = 4112;
            *((unsigned char *)this + 2) = 32;
            _OWORD *v13 = xmmword_242EB3298;
            *(_OWORD *)((char *)this + 24) = unk_242EB32A8;
            v6 = &xmmword_242EB32B8;
          }
          else
          {
            *(_WORD *)this = 8224;
            *((unsigned char *)this + 2) = 16;
            _OWORD *v13 = xmmword_242EB3258;
            *(_OWORD *)((char *)this + 24) = unk_242EB3268;
            v6 = &xmmword_242EB3278;
          }
          goto LABEL_9;
        case 0x240uLL:
        case 0x241uLL:
        case 0x25EuLL:
        case 0x26DuLL:
        case 0x282uLL:
          *(_WORD *)this = 8224;
          *((unsigned char *)this + 2) = 16;
          *(_OWORD *)((char *)this + 8) = xmmword_242EB31D8;
          *(_OWORD *)((char *)this + 24) = unk_242EB31E8;
          v7 = &xmmword_242EB31F8;
          goto LABEL_14;
        case 0x242uLL:
        case 0x243uLL:
        case 0x284uLL:
          *(_WORD *)this = 4112;
          *((unsigned char *)this + 2) = 32;
          *(_OWORD *)((char *)this + 8) = xmmword_242EB3158;
          *(_OWORD *)((char *)this + 24) = unk_242EB3168;
          v7 = &xmmword_242EB3178;
          goto LABEL_14;
        case 0x24CuLL:
        case 0x283uLL:
          *(_WORD *)this = 8224;
          *((unsigned char *)this + 2) = 10;
          *(_OWORD *)((char *)this + 8) = xmmword_242EB32D8;
          *(_OWORD *)((char *)this + 24) = unk_242EB32E8;
          v7 = &xmmword_242EB32F8;
          goto LABEL_14;
        case 0x24DuLL:
        case 0x285uLL:
          *(_WORD *)this = 4112;
          *((unsigned char *)this + 2) = 20;
          *(_OWORD *)((char *)this + 8) = xmmword_242EB3198;
          *(_OWORD *)((char *)this + 24) = unk_242EB31A8;
          v7 = &xmmword_242EB31B8;
          goto LABEL_14;
        case 0x25BuLL:
        case 0x25CuLL:
        case 0x26EuLL:
          *(_WORD *)this = 8224;
          *((unsigned char *)this + 2) = 16;
          *(_OWORD *)((char *)this + 8) = xmmword_242EB3258;
          *(_OWORD *)((char *)this + 24) = unk_242EB3268;
          v7 = &xmmword_242EB3278;
          goto LABEL_14;
        case 0x25DuLL:
          *(_WORD *)this = 4112;
          *((unsigned char *)this + 2) = 32;
          *(_OWORD *)((char *)this + 8) = xmmword_242EB3298;
          *(_OWORD *)((char *)this + 24) = unk_242EB32A8;
          v7 = &xmmword_242EB32B8;
          goto LABEL_14;
        case 0x276uLL:
        case 0x277uLL:
        case 0x278uLL:
        case 0x279uLL:
        case 0x27AuLL:
        case 0x27BuLL:
        case 0x27CuLL:
          *(_WORD *)this = 4112;
          *((unsigned char *)this + 2) = 40;
          *(_OWORD *)((char *)this + 8) = xmmword_242EB33D8;
          *(_OWORD *)((char *)this + 24) = unk_242EB33E8;
          v7 = &xmmword_242EB33F8;
          goto LABEL_14;
        default:
          float v16 = (float)(unint64_t)(32 * a4);
          float v17 = (float)(unint64_t)(a4 << 8);
          *(_WORD *)this = 4112;
          *((unsigned char *)this + 2) = 8 * a4;
          *((void *)this + 1) = 32 * a4;
          *((uint64x2_t *)this + 1) = vcvtq_u64_f64(vcvtq_f64_f32(vmul_n_f32((float32x2_t)0x3F2000003F400000, v16)));
          *((void *)this + 4) = (unint64_t)(float)(v16 * 0.5);
          *((void *)this + 5) = a4 << 8;
          uint64x2_t result = vcvtq_u64_f64(vcvtq_f64_f32(vmul_n_f32((float32x2_t)0x3F2000003F400000, v17)));
          *((uint64x2_t *)this + 3) = result;
          *((void *)this + 8) = (unint64_t)(float)(v17 * 0.5);
          break;
      }
      break;
    case 0x244uLL:
    case 0x245uLL:
    case 0x246uLL:
    case 0x247uLL:
    case 0x248uLL:
    case 0x249uLL:
    case 0x258uLL:
    case 0x259uLL:
    case 0x25AuLL:
    case 0x26AuLL:
    case 0x26BuLL:
    case 0x26CuLL:
      v4 = (_OWORD *)((char *)this + 8);
      v5 = (long long *)((char *)this + 40);
      if (a2)
      {
        *(_WORD *)this = 4112;
        *((unsigned char *)this + 2) = 24;
        _OWORD *v4 = xmmword_242EB3058;
        *(_OWORD *)((char *)this + 24) = unk_242EB3068;
        v6 = &xmmword_242EB3078;
      }
      else
      {
        *(_WORD *)this = 8224;
        *((unsigned char *)this + 2) = 12;
        _OWORD *v4 = xmmword_242EB3018;
        *(_OWORD *)((char *)this + 24) = unk_242EB3028;
        v6 = &xmmword_242EB3038;
      }
LABEL_9:
      uint64x2_t result = (uint64x2_t)*v6;
      long long v9 = v6[1];
      long long *v5 = *v6;
      v5[1] = v9;
      break;
    default:
      switch(a3)
      {
        case MTLPixelFormatR8Unorm:
        case MTLPixelFormatR8Unorm_sRGB:
        case MTLPixelFormatR8Snorm:
        case MTLPixelFormatR8Uint:
        case MTLPixelFormatR8Sint:
          *(_WORD *)this = 8224;
          *((unsigned char *)this + 2) = 8;
          *(_OWORD *)((char *)this + 8) = xmmword_242EB30D8;
          *(_OWORD *)((char *)this + 24) = unk_242EB30E8;
          v7 = &xmmword_242EB30F8;
          goto LABEL_14;
        case MTLPixelFormatR16Unorm:
        case MTLPixelFormatR16Snorm:
        case MTLPixelFormatR16Uint:
        case MTLPixelFormatR16Sint:
        case MTLPixelFormatR16Float:
          *(_WORD *)this = 8224;
          *((unsigned char *)this + 2) = 16;
          *(_OWORD *)((char *)this + 8) = xmmword_242EB2FD8;
          *(_OWORD *)((char *)this + 24) = unk_242EB2FE8;
          v7 = &xmmword_242EB2FF8;
          goto LABEL_14;
        case MTLPixelFormatRGB10A2Unorm:
        case MTLPixelFormatRGB10A2Uint:
        case MTLPixelFormatBGR10A2Unorm:
          goto LABEL_13;
        default:
          goto LABEL_10;
      }
  }
  return result;
}

uint64_t InterchangeTiledMemory::getPlaneSize(uint64_t a1, unsigned int a2, int a3, MTLPixelFormat a4, uint64_t a5)
{
  uint64_t v11 = 0;
  memset(v10, 0, sizeof(v10));
  InterchangeTiledMemory::getPlaneInfo((InterchangeTiledMemory *)v10, a3, a4, *(unsigned __int8 *)(a5 + 49));
  if (a3 == 1 && *(_DWORD *)(a5 + 72) == 3) {
    a2 = (a2 + 1) >> 1;
  }
  return (a2 + BYTE1(v10[0]) - 1) / BYTE1(v10[0]) * a1;
}

uint64_t InterchangeTiledMemory::read(uint64_t result, uint64_t a2, int a3, unsigned int a4, unsigned int a5, int a6, int a7, uint64_t a8, unsigned __int8 *a9, uint64_t a10)
{
  uint64_t v38 = result;
  int v11 = a9[2];
  HIDWORD(v13) = v11;
  LODWORD(v13) = v11 - 8;
  unsigned int v12 = v13 >> 3;
  if (v12 > 7) {
    v14 = 0;
  }
  else {
    v14 = off_26F853F30[v12];
  }
  unsigned int v15 = a9[1];
  int v16 = a5 / v15;
  int v44 = a7 + a5;
  unsigned int v37 = (a7 + a5 - 1) / v15;
  if (a5 / v15 <= v37)
  {
    unsigned int v17 = *a9;
    int v43 = a6 + a4;
    int v36 = a4 / v17;
    unsigned int v42 = (a6 + a4 - 1) / v17;
    if (a4 / v17 <= v42)
    {
      int v18 = 4 * v11;
      int v49 = (v17 >> 3) * 4 * v11;
      unsigned int v39 = (v17 * v11 * v15) >> 3;
      unsigned int v35 = (a3 + v17 - 1) / v17 * v39;
      do
      {
        int v19 = v36;
        uint64_t v41 = v38 + v35 * v16;
        int v47 = v16;
        do
        {
          int v20 = *a9;
          int v48 = v19;
          unsigned int v21 = v19 * v20;
          int v22 = a9[1];
          uint64_t v23 = (v16 * v22);
          if (a4 >= v21) {
            unsigned int v24 = a4 - v21;
          }
          else {
            unsigned int v24 = 0;
          }
          if (a5 >= v23) {
            uint64x2_t result = a5 - v23;
          }
          else {
            uint64x2_t result = 0;
          }
          unsigned int v25 = v20 - v24;
          if (v25 >= v43 - v21) {
            unsigned int v25 = v43 - v21;
          }
          unsigned int v26 = v25 - 1;
          unsigned int v27 = v44 - v23;
          unsigned int v28 = v22 - v24;
          if (v28 < v44 - (int)v23) {
            unsigned int v27 = v28;
          }
          unint64_t v29 = result >> 2;
          unint64_t v30 = v26 >> 3;
          unint64_t v51 = (v27 - 1) >> 2;
          if (v29 <= v51 && v24 >> 3 <= v30)
          {
            unint64_t v50 = a2 + v23 * a8 + *(unsigned __int8 *)(a10 + 49) * (unint64_t)v21;
            do
            {
              unint64_t v52 = v29;
              uint64_t v53 = v41 + v48 * v39 + (v49 * v29);
              unint64_t v32 = v50 + (4 * v29) * a8;
              unint64_t v33 = v24 >> 3;
              do
                uint64x2_t result = ((uint64_t (*)(uint64_t, unint64_t, uint64_t, uint64_t, uint64_t, uint64_t))v14)(v53 + (v18 * v33), v32 + 8 * v33 * *(unsigned __int8 *)(a10 + 49), 8, 4, 8, 4);
              while (v33++ < v30);
              unint64_t v29 = v52 + 1;
            }
            while (v52 < v51);
          }
          int v16 = v47;
          int v19 = v48 + 1;
        }
        while (v48 + 1 <= v42);
        int v16 = v47 + 1;
      }
      while (v47 + 1 <= v37);
    }
  }
  return result;
}

uint64_t agxsTwiddleAddressZ<AGXSConverterPassThru<false,8ul,1u,(TwiddleOrder)1>>(uint64_t result, void *a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned int a9, unsigned int a10, uint64_t a11, unsigned __int16 *a12, unsigned int *a13)
{
  if (!result) {
    return result;
  }
  unint64_t v13 = a2;
  if (!a2) {
    return result;
  }
  unsigned int v15 = a7;
  uint64_t v18 = result;
  uint64_t v19 = a11;
  int v20 = a12;
  unsigned int v21 = a10;
  if (!a12)
  {
    unsigned int v26 = 32 - __clz(a5 - 1);
    if (a5 >= 2) {
      unsigned int v27 = v26;
    }
    else {
      unsigned int v27 = 0;
    }
    unsigned int v28 = 32 - __clz(a6 - 1);
    if (a6 >= 2) {
      unsigned int v29 = v28;
    }
    else {
      unsigned int v29 = 0;
    }
    if (v29 | v27)
    {
      unsigned int v30 = 0;
      uint64_t v31 = 0;
      BOOL v32 = v27 != 0;
      BOOL v33 = v29 != 0;
      BOOL v34 = v27 != 0;
      BOOL v35 = v29 != 0;
      int v36 = 1;
      unsigned int v37 = v27;
      unsigned int v38 = v29;
      do
      {
        --v37;
        if (v34) {
          v31 |= (unint64_t)(v36 & ~(-1 << v27)) << v30++;
        }
        else {
          unsigned int v37 = 0;
        }
        --v38;
        if (!v35) {
          unsigned int v38 = 0;
        }
        v36 *= 2;
        unsigned int v30 = (__PAIR64__(v30, v35) - 1) >> 32;
        BOOL v35 = v38 != 0;
        BOOL v34 = v37 != 0;
      }
      while (v38 | v37);
      int v39 = 0;
      uint64_t v40 = 0;
      int v41 = 1;
      BOOL v42 = v27 != 0;
      BOOL v43 = v29 != 0;
      unsigned int v44 = v27;
      unsigned int v45 = v29;
      do
      {
        --v44;
        int v46 = v42;
        if (!v46) {
          unsigned int v44 = 0;
        }
        int v47 = v39 + v46;
        --v45;
        if (v43) {
          v40 |= (unint64_t)(v41 & ~(-1 << v29)) << v47++;
        }
        else {
          unsigned int v45 = 0;
        }
        v41 *= 2;
        int v39 = v47 - 1;
        BOOL v43 = v45 != 0;
        BOOL v42 = v44 != 0;
      }
      while (v45 | v44);
      unsigned int v48 = 0;
      uint64_t v49 = 0;
      BOOL v50 = v27 != 0;
      BOOL v51 = v29 != 0;
      int v52 = 1;
      unsigned int v53 = v27;
      unsigned int v54 = v29;
      do
      {
        --v53;
        if (v50) {
          v49 |= (unint64_t)(v52 & a7) << v48++;
        }
        else {
          unsigned int v53 = 0;
        }
        --v54;
        if (!v51) {
          unsigned int v54 = 0;
        }
        v52 *= 2;
        unsigned int v48 = (__PAIR64__(v48, v51) - 1) >> 32;
        BOOL v51 = v54 != 0;
        BOOL v50 = v53 != 0;
      }
      while (v54 | v53);
      int v55 = 0;
      uint64_t v56 = 0;
      int v57 = 1;
      do
      {
        --v27;
        int v58 = v32;
        if (!v58) {
          unsigned int v27 = 0;
        }
        int v59 = v55 + v58;
        --v29;
        if (v33)
        {
          v56 |= (unint64_t)(v57 & a8) << v59;
          int v60 = v59 + 1;
        }
        else
        {
          unsigned int v29 = 0;
          int v60 = v59;
        }
        v57 *= 2;
        int v55 = v60 - 1;
        BOOL v33 = v29 != 0;
        BOOL v32 = v27 != 0;
        uint64x2_t result = v29 | v27;
      }
      while (result);
      if (!a10) {
        return result;
      }
    }
    else
    {
      uint64_t v49 = 0;
      uint64_t v31 = 0;
      uint64_t v40 = 0;
      uint64_t v56 = 0;
      if (!a10) {
        return result;
      }
    }
    if (a9)
    {
      for (int i = 0; i != a10; ++i)
      {
        unsigned int v234 = a9;
        v235 = v13;
        uint64_t v236 = v49;
        do
        {
          *v235++ = *(void *)(v18 + 8 * (v236 + v56));
          uint64_t v236 = (v236 - v31) & v31;
          --v234;
        }
        while (v234);
        uint64_t v56 = (v56 - v40) & v40;
        unint64_t v13 = (void *)((char *)v13 + a11);
      }
    }
    return result;
  }
  unsigned int v266 = a8;
  if (*((unsigned char *)a12 + 20))
  {
    uint64x2_t result = agxCalcSparseInputs(a12[3], *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 8), a13[2], a13[3], a13[1], *a13, *((unsigned __int8 *)a12 + 16) - 1 < 2, a7, a8, a9, a10, (uint64_t)v304);
    char v22 = *((unsigned char *)a12 + 13);
    char v23 = *((unsigned char *)a12 + 12);
    if (1 << v22 >= a6 || a5 >> v23)
    {
      unsigned int v149 = a6 >> v22;
      unsigned int v150 = 1 << v23;
      unsigned int v151 = __clz(~(-1 << -(char)__clz(a6 - 1))) - 32;
      if (a6 < 2) {
        unsigned int v151 = 0;
      }
      BOOL v152 = v150 >= a5;
      if (v150 < a5) {
        char v153 = v23 + v22 + v151;
      }
      else {
        char v153 = *((unsigned char *)a12 + 12);
      }
      if (v152) {
        LOBYTE(v154) = *((unsigned char *)a12 + 13);
      }
      else {
        int v154 = -v151;
      }
      if (!v149) {
        char v23 = v153;
      }
      char v261 = v23;
      if (v149) {
        char v25 = *((unsigned char *)a12 + 13);
      }
      else {
        char v25 = v154;
      }
    }
    else
    {
      unsigned int v24 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
      if (a5 < 2) {
        LOBYTE(v24) = 0;
      }
      char v261 = v24;
      char v25 = v23 + v22 - v24;
    }
    unsigned int v156 = a8;
    unsigned int v155 = a10;
    unsigned int v157 = a7;
    unsigned int v259 = v310;
    if (v310)
    {
      unsigned int v158 = 1 << v25;
      unsigned int v159 = v311;
      int v292 = v308;
      BOOL v288 = v308 != 0;
      int v290 = v309;
      BOOL v286 = v309 != 0;
      int v260 = 1 << v261;
      if (1 << v261 >= a5) {
        unsigned int v160 = a5;
      }
      else {
        unsigned int v160 = 1 << v261;
      }
      if (v158 >= a6) {
        unsigned int v161 = a6;
      }
      else {
        unsigned int v161 = 1 << v25;
      }
      unsigned int v162 = 32 - __clz(v160 - 1);
      if (v160 >= 2) {
        unsigned int v163 = v162;
      }
      else {
        unsigned int v163 = 0;
      }
      unsigned int v164 = 32 - __clz(v161 - 1);
      if (v161 < 2) {
        unsigned int v164 = 0;
      }
      BOOL v296 = v163 != 0;
      unsigned int v298 = v164;
      BOOL v294 = v164 != 0;
      if (v311)
      {
        int v165 = 0;
        unsigned int v258 = a7 >> v261;
        unsigned int v280 = a8 >> v25;
        int v303 = v309 | v308;
        int v301 = v312;
        unsigned int v257 = a9 + a7;
        int v256 = v305;
        int v166 = v307;
        int v300 = v306;
        int v275 = (v158 - 1) & a8;
        int v277 = (v158 - 1) & (a10 + a8);
        unsigned int v273 = v158 - v275;
        int v167 = ~(-1 << v163);
        int v271 = v164 | v163;
        int v168 = ~(-1 << v164);
        unsigned int v283 = v163;
        int v264 = 1 << v25;
        char v265 = v25;
        int v269 = v307;
        do
        {
          int v169 = 0;
          int v170 = v165 + v256;
          unsigned int v171 = (v165 + v258) << v261;
          unsigned int v172 = a9;
          if (v257 >= (v165 + v258 + 1) << v261) {
            unsigned int v172 = v260 - ((v260 - 1) & a7);
          }
          int v173 = 1 << v261;
          if (v257 < (v165 + v258 + 1) << v261) {
            int v173 = (v260 - 1) & (a9 + a7);
          }
          int v263 = v165;
          if (v171 >= v157) {
            int v174 = v173;
          }
          else {
            int v174 = v172;
          }
          if (v171 >= v157) {
            int v175 = 0;
          }
          else {
            int v175 = (v260 - 1) & a7;
          }
          v267 = &v13[v175 + (v165 << v261)];
          do
          {
            int v176 = v169 + v300;
            if (v301)
            {
              int v177 = v303;
              if (v303)
              {
                int v178 = 0;
                int v177 = 0;
                int v179 = 1;
                BOOL v180 = v286;
                BOOL v181 = v288;
                int v183 = v290;
                int v182 = v292;
                do
                {
                  --v182;
                  if (v181) {
                    v177 |= (v179 & v170) << v178;
                  }
                  else {
                    int v182 = 0;
                  }
                  if (v181) {
                    ++v178;
                  }
                  --v183;
                  if (v180) {
                    v177 |= (v179 & v176) << v178;
                  }
                  else {
                    int v183 = 0;
                  }
                  if (v180) {
                    ++v178;
                  }
                  v179 *= 2;
                  --v178;
                  BOOL v180 = v183 != 0;
                  BOOL v181 = v182 != 0;
                }
                while (v183 | v182);
              }
            }
            else
            {
              int v177 = v303;
              if (v303)
              {
                int v184 = 0;
                int v177 = 0;
                int v185 = 1;
                BOOL v187 = v286;
                BOOL v186 = v288;
                int v188 = v290;
                int v189 = v292;
                do
                {
                  --v188;
                  if (v187) {
                    v177 |= (v185 & v176) << v184;
                  }
                  else {
                    int v188 = 0;
                  }
                  if (v187) {
                    ++v184;
                  }
                  --v189;
                  if (v186) {
                    v177 |= (v185 & v170) << v184;
                  }
                  else {
                    int v189 = 0;
                  }
                  if (v186) {
                    ++v184;
                  }
                  v185 *= 2;
                  --v184;
                  BOOL v186 = v189 != 0;
                  BOOL v187 = v188 != 0;
                }
                while (v189 | v188);
              }
            }
            int v190 = *(_DWORD *)(v18 + 4 * ((v177 + v166) | ((v177 + v166) >> 8 << 9)));
            if (v190 < 0)
            {
              unint64_t v191 = v18 - *((void *)a13 + 3) + ((unint64_t)(v190 & 0x1FFFFFFF) << 14);
              uint64x2_t result = *a13;
              unsigned int v192 = a13[2];
              if (result > v192)
              {
                uint64x2_t result = get_level_offset_within_tail(result, v192, *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 16) - 1 < 2);
                unsigned int v163 = v283;
                unsigned int v158 = v264;
                char v25 = v265;
                uint64_t v19 = a11;
                unsigned int v157 = a7;
                unsigned int v156 = v266;
                unsigned int v155 = a10;
                v191 += result;
              }
              unsigned int v193 = (v169 + v280) << v25;
              unsigned int v194 = v273;
              if (a10 + v266 >= (v169 + v280 + 1) << v25)
              {
                unsigned int v195 = v158;
              }
              else
              {
                unsigned int v194 = v155;
                unsigned int v195 = v277;
              }
              if (v193 >= v156) {
                int v196 = 0;
              }
              else {
                int v196 = v275;
              }
              if (v193 >= v156) {
                unsigned int v194 = v195;
              }
              if (!v271)
              {
                uint64_t v214 = 0;
                uint64_t v198 = 0;
                uint64_t v205 = 0;
                uint64_t v221 = 0;
                int v166 = v269;
                if (!v194) {
                  goto LABEL_192;
                }
LABEL_264:
                if (v174)
                {
                  int v228 = 0;
                  v229 = (void *)((char *)v267 + (v196 + (v169 << v25)) * v19);
                  do
                  {
                    int v230 = v174;
                    v231 = v229;
                    uint64_t v232 = v214;
                    do
                    {
                      uint64x2_t result = *(void *)(v191 + 8 * (v232 + v221));
                      *v231++ = result;
                      uint64_t v232 = (v232 - v198) & v198;
                      --v230;
                    }
                    while (v230);
                    uint64_t v221 = (v221 - v205) & v205;
                    v229 = (uint64_t *)((char *)v229 + v19);
                    ++v228;
                  }
                  while (v228 != v194);
                }
                goto LABEL_192;
              }
              unsigned int v197 = 0;
              uint64_t v198 = 0;
              int v199 = 1;
              BOOL v200 = v294;
              BOOL v201 = v296;
              unsigned int v202 = v163;
              unsigned int v203 = v298;
              do
              {
                --v202;
                if (v201) {
                  v198 |= (unint64_t)(v199 & v167) << v197++;
                }
                else {
                  unsigned int v202 = 0;
                }
                --v203;
                if (!v200) {
                  unsigned int v203 = 0;
                }
                v199 *= 2;
                unsigned int v197 = (__PAIR64__(v197, v200) - 1) >> 32;
                BOOL v200 = v203 != 0;
                BOOL v201 = v202 != 0;
              }
              while (v203 | v202);
              int v204 = 0;
              uint64_t v205 = 0;
              int v206 = 1;
              BOOL v207 = v294;
              BOOL v208 = v296;
              unsigned int v209 = v163;
              unsigned int v210 = v298;
              do
              {
                --v209;
                int v211 = v208;
                if (!v211) {
                  unsigned int v209 = 0;
                }
                int v212 = v204 + v211;
                --v210;
                if (v207) {
                  v205 |= (unint64_t)(v206 & v168) << v212++;
                }
                else {
                  unsigned int v210 = 0;
                }
                v206 *= 2;
                int v204 = v212 - 1;
                BOOL v207 = v210 != 0;
                BOOL v208 = v209 != 0;
              }
              while (v210 | v209);
              unsigned int v213 = 0;
              uint64_t v214 = 0;
              int v215 = 1;
              BOOL v217 = v294;
              BOOL v216 = v296;
              unsigned int v218 = v163;
              unsigned int v219 = v298;
              do
              {
                --v218;
                if (v216) {
                  v214 |= (unint64_t)(v215 & v175) << v213++;
                }
                else {
                  unsigned int v218 = 0;
                }
                --v219;
                if (!v217) {
                  unsigned int v219 = 0;
                }
                v215 *= 2;
                unsigned int v213 = (__PAIR64__(v213, v217) - 1) >> 32;
                BOOL v217 = v219 != 0;
                BOOL v216 = v218 != 0;
              }
              while (v219 | v218);
              int v220 = 0;
              uint64_t v221 = 0;
              int v222 = 1;
              LOBYTE(result) = v294;
              BOOL v223 = v296;
              unsigned int v224 = v163;
              unsigned int v225 = v298;
              do
              {
                --v224;
                int v226 = v223;
                if (!v226) {
                  unsigned int v224 = 0;
                }
                int v227 = v220 + v226;
                --v225;
                if (result) {
                  v221 |= (unint64_t)(v222 & v196) << v227++;
                }
                else {
                  unsigned int v225 = 0;
                }
                v222 *= 2;
                int v220 = v227 - 1;
                uint64x2_t result = v225 != 0;
                BOOL v223 = v224 != 0;
              }
              while (v225 | v224);
              unsigned int v163 = v283;
              int v166 = v269;
              if (v194) {
                goto LABEL_264;
              }
            }
LABEL_192:
            ++v169;
          }
          while (v159 > (unsigned __int16)v169);
          int v165 = v263 + 1;
        }
        while (v259 > (unsigned __int16)(v263 + 1));
      }
    }
  }
  else
  {
    int v61 = *((unsigned __int8 *)a12 + 13);
    int v62 = *((unsigned __int8 *)a12 + 12);
    unsigned int v63 = 1 << v61;
    unsigned int v64 = a5 >> v62;
    unsigned int v65 = __clz(~(-1 << -__clz(a6 - 1))) - 32;
    if (a6 < 2) {
      unsigned int v65 = 0;
    }
    char v66 = v62 + v61;
    uint64x2_t result = v62 + v61 + v65;
    if (a6 >> v61) {
      BOOL v67 = 1;
    }
    else {
      BOOL v67 = 1 << v62 >= a5;
    }
    if (v67)
    {
      LOBYTE(v68) = *((unsigned char *)a12 + 13);
    }
    else
    {
      LOBYTE(v62) = v62 + v61 + v65;
      int v68 = -v65;
    }
    unsigned int v69 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
    if (a5 < 2) {
      LOBYTE(v69) = 0;
    }
    if (v63 < a6 && v64 == 0)
    {
      char v71 = v66 - v69;
    }
    else
    {
      LOBYTE(v69) = v62;
      char v71 = v68;
    }
    int v72 = 1 << v71;
    char v73 = *((unsigned char *)a12 + 15);
    unsigned int v74 = 1 << v73;
    if (v73) {
      BOOL v75 = v74 > a3;
    }
    else {
      BOOL v75 = 1;
    }
    BOOL v76 = v75 || v74 > a4;
    int v77 = (~(-1 << v73) + a3) & (-1 << v73);
    if (v76) {
      int v78 = a3;
    }
    else {
      int v78 = v77;
    }
    unsigned int v282 = 1 << v71;
    int v79 = v72 - 1;
    unsigned int v274 = a8 >> v71;
    unsigned int v279 = (v72 - 1 + a10 + a8) >> v71;
    unsigned int v281 = a10 + a8;
    if (a8 >> v71 < v279)
    {
      int v80 = (1 << v69) - 1;
      unsigned int v302 = a9 + a7;
      uint64x2_t result = (v80 + a9 + a7) >> v69;
      if (1 << v69 >= a5) {
        unsigned int v81 = a5;
      }
      else {
        unsigned int v81 = 1 << v69;
      }
      unsigned int v82 = 1 << v71;
      if (v282 >= a6) {
        unsigned int v82 = a6;
      }
      unsigned int v83 = 32 - __clz(v81 - 1);
      if (v81 >= 2) {
        unsigned int v84 = v83;
      }
      else {
        unsigned int v84 = 0;
      }
      unsigned int v85 = 32 - __clz(v82 - 1);
      if (v82 >= 2) {
        unsigned int v86 = v85;
      }
      else {
        unsigned int v86 = 0;
      }
      unsigned int v293 = a7 >> v69;
      unsigned int v299 = (v80 + a9 + a7) >> v69;
      if (a7 >> v69 < result)
      {
        unsigned int v272 = (v78 + ~(-1 << v69)) >> v69;
        uint64_t v87 = v80 & a7;
        uint64_t v88 = v79 & a8;
        int v297 = v80 & v302;
        uint64_t v291 = v87;
        unsigned int v295 = (1 << v69) - v87;
        int v278 = v79 & v281;
        unsigned int v276 = v282 - v88;
        if (v86 | v84)
        {
          unsigned int v89 = a8 >> v71;
          v262 = v13;
          char v270 = v71;
          uint64_t v268 = v79 & a8;
          do
          {
            unsigned int v90 = v89 << v71;
            unsigned int v91 = v89 - v274;
            int v289 = v89 * v272;
            unsigned int v285 = v89 + 1;
            BOOL v92 = v281 >= (v89 + 1) << v71;
            unsigned int v93 = v282;
            if (!v92) {
              unsigned int v93 = v278;
            }
            unsigned int v94 = v276;
            if (!v92) {
              unsigned int v94 = v21;
            }
            unsigned int v95 = v91 << v71;
            if (v90 >= a8) {
              unsigned int v96 = 0;
            }
            else {
              unsigned int v96 = v88;
            }
            if (v90 >= a8) {
              uint64x2_t result = v93;
            }
            else {
              uint64x2_t result = v94;
            }
            v287 = (char *)v13 + (v96 + v95 - v88) * a11;
            unsigned int v97 = v293;
            do
            {
              unsigned int v98 = 0;
              uint64_t v99 = 0;
              unsigned int v100 = v97 << v69;
              unsigned int v101 = v97 - v293;
              unsigned int v102 = v97 + v289;
              unsigned int v103 = ++v97 << v69;
              if (v100 >= v15) {
                unsigned int v104 = 0;
              }
              else {
                unsigned int v104 = v291;
              }
              uint64_t v105 = v104 + (v101 << v69) - v291;
              uint64_t v106 = v102 * v20[3] * *((unsigned __int8 *)v20 + 9);
              int v107 = 1;
              BOOL v108 = v84 != 0;
              BOOL v109 = v86 != 0;
              unsigned int v110 = v84;
              unsigned int v111 = v86;
              do
              {
                --v110;
                if (v108) {
                  v99 |= (unint64_t)(v107 & ~(-1 << v84)) << v98++;
                }
                else {
                  unsigned int v110 = 0;
                }
                --v111;
                if (!v109) {
                  unsigned int v111 = 0;
                }
                v107 *= 2;
                unsigned int v98 = (__PAIR64__(v98, v109) - 1) >> 32;
                BOOL v109 = v111 != 0;
                BOOL v108 = v110 != 0;
              }
              while (v111 | v110);
              int v112 = 0;
              uint64_t v113 = 0;
              uint64_t v114 = 8 * v105;
              if (v302 >= v103) {
                int v115 = 1 << v69;
              }
              else {
                int v115 = v297;
              }
              int v116 = 1;
              BOOL v117 = v84 != 0;
              BOOL v118 = v86 != 0;
              unsigned int v119 = v84;
              unsigned int v120 = v86;
              do
              {
                int v121 = v117;
                if (v121) {
                  --v119;
                }
                else {
                  unsigned int v119 = 0;
                }
                int v122 = v112 + v121;
                if (v118) {
                  --v120;
                }
                else {
                  unsigned int v120 = 0;
                }
                if (v118) {
                  v113 |= (unint64_t)(v116 & ~(-1 << v86)) << v122++;
                }
                v116 *= 2;
                int v112 = v122 - 1;
                BOOL v118 = v120 != 0;
                BOOL v117 = v119 != 0;
              }
              while (v120 | v119);
              unsigned int v123 = 0;
              uint64_t v124 = 0;
              unsigned int v125 = v295;
              if (v302 < v103) {
                unsigned int v125 = a9;
              }
              v126 = &v287[v114];
              int v127 = 1;
              BOOL v128 = v84 != 0;
              BOOL v129 = v86 != 0;
              unsigned int v130 = v84;
              unsigned int v131 = v86;
              do
              {
                --v130;
                if (v128)
                {
                  v124 |= (unint64_t)(v127 & v104) << v123;
                  unsigned int v132 = v123 + 1;
                }
                else
                {
                  unsigned int v130 = 0;
                  unsigned int v132 = v123;
                }
                if (v129) {
                  --v131;
                }
                else {
                  unsigned int v131 = 0;
                }
                v127 *= 2;
                unsigned int v123 = (__PAIR64__(v132, v129) - 1) >> 32;
                BOOL v129 = v131 != 0;
                BOOL v128 = v130 != 0;
              }
              while (v131 | v130);
              int v133 = 0;
              unint64_t v134 = 0;
              int v135 = 1;
              BOOL v136 = v84 != 0;
              BOOL v137 = v86 != 0;
              unsigned int v138 = v84;
              unsigned int v139 = v86;
              do
              {
                int v140 = v136;
                if (v140) {
                  --v138;
                }
                else {
                  unsigned int v138 = 0;
                }
                int v141 = v133 + v140;
                unint64_t v142 = ((unint64_t)(v135 & v96) << (v133 + v140)) | v134;
                if (v137) {
                  --v139;
                }
                else {
                  unsigned int v139 = 0;
                }
                if (v137)
                {
                  unint64_t v134 = v142;
                  ++v141;
                }
                v135 *= 2;
                int v133 = v141 - 1;
                BOOL v137 = v139 != 0;
                BOOL v136 = v138 != 0;
              }
              while (v139 | v138);
              unsigned int v15 = a7;
              if (v100 >= a7) {
                int v143 = v115;
              }
              else {
                int v143 = v125;
              }
              if (result && v143)
              {
                int v144 = 0;
                uint64_t v145 = v106 + v18;
                do
                {
                  int v146 = v143;
                  v147 = v126;
                  uint64_t v148 = v124;
                  do
                  {
                    *(void *)v147 = *(void *)(v145 + 8 * (v148 + v134));
                    v147 += 8;
                    uint64_t v148 = (v148 - v99) & v99;
                    --v146;
                  }
                  while (v146);
                  unint64_t v134 = (v134 - v113) & v113;
                  v126 += a11;
                  ++v144;
                }
                while (v144 != result);
              }
              int v20 = a12;
            }
            while (v97 != v299);
            unsigned int v89 = v285;
            unint64_t v13 = v262;
            a8 = v266;
            unsigned int v21 = a10;
            char v71 = v270;
            uint64_t v88 = v268;
          }
          while (v285 != v279);
        }
        else
        {
          unsigned int v237 = a8 >> v71;
          do
          {
            unsigned int v238 = v237 << v71;
            unsigned int v239 = v237 + 1;
            int v240 = v278;
            if (v281 >= (v237 + 1) << v71) {
              int v240 = 1 << v71;
            }
            if (v281 >= v239 << v71) {
              unsigned int v241 = v282 - v88;
            }
            else {
              unsigned int v241 = a10;
            }
            if (v238 >= a8) {
              int v242 = 0;
            }
            else {
              int v242 = v88;
            }
            if (v238 >= a8) {
              int v243 = v240;
            }
            else {
              int v243 = v241;
            }
            if (v243)
            {
              int v244 = (v237 - v274) << v71;
              int v245 = v237 * v272;
              v246 = (char *)v13 + ((v242 + v244) - v88) * a11;
              unsigned int v247 = v293;
              do
              {
                uint64x2_t result = v247 << v69;
                unsigned int v248 = v247 + 1;
                unsigned int v249 = a9;
                if (v302 >= (v247 + 1) << v69) {
                  unsigned int v249 = v295;
                }
                int v250 = 1 << v69;
                if (v302 < v248 << v69) {
                  int v250 = v297;
                }
                if (result >= v15) {
                  unsigned int v249 = v250;
                }
                if (v249)
                {
                  int v251 = 0;
                  uint64_t v252 = (v247 + v245) * a12[3] * *((unsigned __int8 *)a12 + 9);
                  if (result >= v15) {
                    int v253 = 0;
                  }
                  else {
                    int v253 = v291;
                  }
                  uint64x2_t result = (uint64_t)&v246[8 * (v253 + ((v247 - v293) << v69) - v291)];
                  do
                  {
                    unsigned int v254 = v249;
                    v255 = (void *)result;
                    do
                    {
                      *v255++ = *(void *)(v18 + v252);
                      --v254;
                    }
                    while (v254);
                    result += a11;
                    ++v251;
                  }
                  while (v251 != v243);
                }
                unsigned int v247 = v248;
              }
              while (v248 != v299);
            }
            unsigned int v237 = v239;
          }
          while (v239 != v279);
        }
      }
    }
  }
  return result;
}

BOOL agxCalcSparseInputs(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned int a9, int a10, unsigned int a11, char a12, unsigned int a13, unsigned int a14, unsigned int a15, unsigned int a16, uint64_t a17)
{
  uint64_t v85 = *MEMORY[0x263EF8340];
  unsigned int v17 = a4 - 1;
  unsigned int v18 = (a4 - 1 + a2) / a4;
  unsigned int v19 = a5 - 1;
  unsigned int v20 = 32 - __clz(a1 / a6 - 1);
  if (a1 / a6 >= 2) {
    unsigned int v21 = v20;
  }
  else {
    unsigned int v21 = 0;
  }
  unsigned int v22 = (v21 + 1) >> 1;
  unsigned int v23 = (a5 - 1 + a3) / a5;
  if (v18 < 2) {
    unsigned int v24 = 0;
  }
  else {
    unsigned int v24 = 32 - __clz(~(-1 << -(char)__clz(v18 - 1)));
  }
  unsigned int v26 = v21 - v22;
  if (v23 < 2) {
    unsigned int v29 = 0;
  }
  else {
    unsigned int v29 = 32 - __clz(~(-1 << -(char)__clz(v23 - 1)));
  }
  int v30 = 0;
  uint64_t v31 = 0;
  v84[0] = 0;
  if (a8 + 1 > 1) {
    uint64_t v32 = a8 + 1;
  }
  else {
    uint64_t v32 = 1;
  }
  do
  {
    int v33 = v24 - v31;
    if (v24 < v31) {
      int v33 = 0;
    }
    int v34 = v29 - v31;
    if (v29 < v31) {
      int v34 = 0;
    }
    unsigned int v35 = v33 + v34;
    BOOL v36 = v35 >= v21;
    char v37 = v35 - v21;
    if (!v36) {
      char v37 = 0;
    }
    v30 += 1 << v37;
    v84[++v31] = v30;
  }
  while (v32 != v31);
  unsigned int v38 = 0;
  if (a7 >= 2)
  {
    unsigned int v39 = a7 - a8;
    if (a7 > a8)
    {
      if (v39 >= 8)
      {
        unsigned int v41 = v39 & 0xFFFFFFF8;
        int32x4_t v42 = vaddq_s32(vdupq_n_s32(a8), (int32x4_t)xmmword_242EA7E20);
        uint32x4_t v43 = (uint32x4_t)vdupq_n_s32(v24);
        uint32x4_t v44 = (uint32x4_t)vdupq_n_s32(v29);
        uint64x2_t v45 = (uint64x2_t)vdupq_n_s64(a6);
        int32x4_t v46 = 0uLL;
        v47.i64[0] = 0x400000004;
        v47.i64[1] = 0x400000004;
        v48.i64[0] = 0x7F0000007FLL;
        v48.i64[1] = 0x7F0000007FLL;
        v49.i64[0] = 0x800000008;
        v49.i64[1] = 0x800000008;
        unsigned int v50 = v39 & 0xFFFFFFF8;
        int32x4_t v51 = 0uLL;
        do
        {
          uint32x4_t v52 = (uint32x4_t)vaddq_s32(v42, v47);
          int32x4_t v53 = vaddq_s32((int32x4_t)vqsubq_u32(v43, (uint32x4_t)v42), (int32x4_t)vqsubq_u32(v44, (uint32x4_t)v42));
          int32x4_t v54 = vaddq_s32((int32x4_t)vqsubq_u32(v43, v52), (int32x4_t)vqsubq_u32(v44, v52));
          v55.i64[0] = v53.u32[0];
          v55.i64[1] = v53.u32[1];
          uint64x2_t v56 = v55;
          v55.i64[0] = v53.u32[2];
          v55.i64[1] = v53.u32[3];
          uint64x2_t v57 = v55;
          v55.i64[0] = v54.u32[0];
          v55.i64[1] = v54.u32[1];
          uint64x2_t v58 = v55;
          v55.i64[0] = v54.u32[2];
          v55.i64[1] = v54.u32[3];
          int32x4_t v46 = vaddq_s32((int32x4_t)(*(_OWORD *)&vaddq_s32(vuzp1q_s32((int32x4_t)vshlq_u64(v45, v56), (int32x4_t)vshlq_u64(v45, v57)), v48) & __PAIR128__(0xFFFFFF80FFFFFF80, 0xFFFFFF80FFFFFF80)), v46);
          int32x4_t v51 = vaddq_s32((int32x4_t)(*(_OWORD *)&vaddq_s32(vuzp1q_s32((int32x4_t)vshlq_u64(v45, v58), (int32x4_t)vshlq_u64(v45, v55)), v48) & __PAIR128__(0xFFFFFF80FFFFFF80, 0xFFFFFF80FFFFFF80)), v51);
          int32x4_t v42 = vaddq_s32(v42, v49);
          v50 -= 8;
        }
        while (v50);
        unsigned int v38 = vaddvq_s32(vaddq_s32(v51, v46));
        if (v39 == v41) {
          goto LABEL_31;
        }
        unsigned int v40 = v41 + a8;
      }
      else
      {
        unsigned int v38 = 0;
        unsigned int v40 = a8;
      }
      do
      {
        char v59 = v24 - v40;
        if (v24 < v40) {
          char v59 = 0;
        }
        char v60 = v29 - v40;
        if (v29 < v40) {
          char v60 = 0;
        }
        v38 += (((unint64_t)a6 << (v59 + v60)) + 127) & 0xFFFFFF80;
        ++v40;
      }
      while (a7 != v40);
    }
  }
LABEL_31:
  if (a11 >= a8) {
    unsigned int v61 = a8;
  }
  else {
    unsigned int v61 = a11;
  }
  if (a7 <= 1) {
    unsigned int v62 = 1;
  }
  else {
    unsigned int v62 = a8 + 1;
  }
  uint64_t v63 = v62;
  unsigned int v64 = (v84[v63] + 255) & 0xFFFFFF00;
  v84[v63] = v64;
  unsigned int v65 = a2 >> v61;
  unsigned int v66 = a3 >> v61;
  if ((a12 & 1) == 0)
  {
    if (v65 && (unsigned int v69 = (v17 + v65) / a4, v69 >= 2))
    {
      unsigned int v67 = 32 - __clz(~(-1 << -(char)__clz(v69 - 1)));
      if (!v66) {
        goto LABEL_51;
      }
    }
    else
    {
      unsigned int v67 = 0;
      if (!v66) {
        goto LABEL_51;
      }
    }
    unsigned int v70 = (v19 + v66) / a5;
    if (v70 >= 2)
    {
      unsigned int v68 = 32 - __clz(~(-1 << -(char)__clz(v70 - 1)));
      goto LABEL_52;
    }
LABEL_51:
    unsigned int v68 = 0;
    goto LABEL_52;
  }
  if (v24 >= v61) {
    unsigned int v67 = v24 - v61;
  }
  else {
    unsigned int v67 = 0;
  }
  if (v29 >= v61) {
    unsigned int v68 = v29 - v61;
  }
  else {
    unsigned int v68 = 0;
  }
LABEL_52:
  unsigned int v71 = 1 << v67;
  unsigned int v72 = 1 << v68;
  if (1 << v26 >= (1 << v68) || v71 >> v22)
  {
    if (!(v72 >> v26) && 1 << v22 < v71)
    {
      if (v68) {
        unsigned int v73 = __clz(~(-1 << -(char)__clz(v72 - 1))) - 32;
      }
      else {
        unsigned int v73 = 0;
      }
      unsigned int v22 = v73 + v21;
      unsigned int v26 = -v73;
    }
  }
  else if (v67)
  {
    unsigned int v22 = 32 - __clz(~(-1 << -(char)__clz(v71 - 1)));
    unsigned int v26 = v21 - v22;
  }
  else
  {
    unsigned int v22 = 0;
    unsigned int v26 = v21;
  }
  if (v67 >= v22) {
    unsigned int v74 = v67 - v22;
  }
  else {
    unsigned int v74 = 0;
  }
  unsigned int v75 = v68 - v26;
  if (v68 < v26) {
    unsigned int v75 = 0;
  }
  *(_DWORD *)(a17 + 28) = v74;
  *(_DWORD *)(a17 + 32) = v75;
  BOOL result = a8 <= a11 && v38 > a1;
  if (result) {
    *(_DWORD *)(a17 + 28) = v74 + 1;
  }
  *(unsigned char *)(a17 + 57) = v26 == v22;
  *(_DWORD *)(a17 + 36) = v22;
  *(_DWORD *)(a17 + 40) = v26;
  *(_DWORD *)(a17 + 24) = v84[v61] + v64 * a10;
  *(unsigned char *)(a17 + 53) = a6;
  if ((a12 & 1) == 0)
  {
    if (v65)
    {
      unsigned int v71 = (v17 + v65) / a4;
      if (v66)
      {
LABEL_77:
        unsigned int v72 = (v19 + v66) / a5;
        goto LABEL_80;
      }
    }
    else
    {
      unsigned int v71 = 1;
      if (v66) {
        goto LABEL_77;
      }
    }
    unsigned int v72 = 1;
  }
LABEL_80:
  if (v61 >= a9)
  {
    a14 = 0;
    a13 = 0;
    a15 = v71;
    a16 = v72;
  }
  unsigned int v79 = (v17 + a15 + a13) / a4;
  unsigned int v80 = v19 + a16 + a14;
  unsigned int v81 = (a13 / a4) >> v22;
  unsigned int v82 = (a14 / a5) >> v26;
  *(_DWORD *)(a17 + 16) = v81;
  *(_DWORD *)(a17 + 20) = v82;
  unsigned int v83 = ((v79 + ~(-1 << v22)) >> v22) - v81;
  *(_DWORD *)(a17 + 44) = v83;
  *(_DWORD *)(a17 + 48) = ((v80 / a5 + ~(-1 << v26)) >> v26) - v82;
  if (result) {
    *(_DWORD *)(a17 + 44) = v83 + 1;
  }
  return result;
}

uint64_t agxsTwiddleAddressZ<AGXSConverterPassThru<false,4ul,1u,(TwiddleOrder)1>>(uint64_t result, _DWORD *a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned int a9, unsigned int a10, uint64_t a11, unsigned __int16 *a12, unsigned int *a13)
{
  if (!result) {
    return result;
  }
  unint64_t v13 = a2;
  if (!a2) {
    return result;
  }
  unsigned int v15 = a7;
  uint64_t v18 = result;
  uint64_t v19 = a11;
  unsigned int v20 = a12;
  unsigned int v21 = a10;
  if (!a12)
  {
    unsigned int v26 = 32 - __clz(a5 - 1);
    if (a5 >= 2) {
      unsigned int v27 = v26;
    }
    else {
      unsigned int v27 = 0;
    }
    unsigned int v28 = 32 - __clz(a6 - 1);
    if (a6 >= 2) {
      unsigned int v29 = v28;
    }
    else {
      unsigned int v29 = 0;
    }
    if (v29 | v27)
    {
      unsigned int v30 = 0;
      uint64_t v31 = 0;
      BOOL v32 = v27 != 0;
      BOOL v33 = v29 != 0;
      BOOL v34 = v27 != 0;
      BOOL v35 = v29 != 0;
      int v36 = 1;
      unsigned int v37 = v27;
      unsigned int v38 = v29;
      do
      {
        --v37;
        if (v34) {
          v31 |= (unint64_t)(v36 & ~(-1 << v27)) << v30++;
        }
        else {
          unsigned int v37 = 0;
        }
        --v38;
        if (!v35) {
          unsigned int v38 = 0;
        }
        v36 *= 2;
        unsigned int v30 = (__PAIR64__(v30, v35) - 1) >> 32;
        BOOL v35 = v38 != 0;
        BOOL v34 = v37 != 0;
      }
      while (v38 | v37);
      int v39 = 0;
      uint64_t v40 = 0;
      int v41 = 1;
      BOOL v42 = v27 != 0;
      BOOL v43 = v29 != 0;
      unsigned int v44 = v27;
      unsigned int v45 = v29;
      do
      {
        --v44;
        int v46 = v42;
        if (!v46) {
          unsigned int v44 = 0;
        }
        int v47 = v39 + v46;
        --v45;
        if (v43) {
          v40 |= (unint64_t)(v41 & ~(-1 << v29)) << v47++;
        }
        else {
          unsigned int v45 = 0;
        }
        v41 *= 2;
        int v39 = v47 - 1;
        BOOL v43 = v45 != 0;
        BOOL v42 = v44 != 0;
      }
      while (v45 | v44);
      unsigned int v48 = 0;
      uint64_t v49 = 0;
      BOOL v50 = v27 != 0;
      BOOL v51 = v29 != 0;
      int v52 = 1;
      unsigned int v53 = v27;
      unsigned int v54 = v29;
      do
      {
        --v53;
        if (v50) {
          v49 |= (unint64_t)(v52 & a7) << v48++;
        }
        else {
          unsigned int v53 = 0;
        }
        --v54;
        if (!v51) {
          unsigned int v54 = 0;
        }
        v52 *= 2;
        unsigned int v48 = (__PAIR64__(v48, v51) - 1) >> 32;
        BOOL v51 = v54 != 0;
        BOOL v50 = v53 != 0;
      }
      while (v54 | v53);
      int v55 = 0;
      uint64_t v56 = 0;
      int v57 = 1;
      do
      {
        --v27;
        int v58 = v32;
        if (!v58) {
          unsigned int v27 = 0;
        }
        int v59 = v55 + v58;
        --v29;
        if (v33)
        {
          v56 |= (unint64_t)(v57 & a8) << v59;
          int v60 = v59 + 1;
        }
        else
        {
          unsigned int v29 = 0;
          int v60 = v59;
        }
        v57 *= 2;
        int v55 = v60 - 1;
        BOOL v33 = v29 != 0;
        BOOL v32 = v27 != 0;
        BOOL result = v29 | v27;
      }
      while (result);
      if (!a10) {
        return result;
      }
    }
    else
    {
      uint64_t v49 = 0;
      uint64_t v31 = 0;
      uint64_t v40 = 0;
      uint64_t v56 = 0;
      if (!a10) {
        return result;
      }
    }
    if (a9)
    {
      for (int i = 0; i != a10; ++i)
      {
        unsigned int v234 = a9;
        v235 = v13;
        uint64_t v236 = v49;
        do
        {
          *v235++ = *(_DWORD *)(v18 + 4 * (v236 + v56));
          uint64_t v236 = (v236 - v31) & v31;
          --v234;
        }
        while (v234);
        uint64_t v56 = (v56 - v40) & v40;
        unint64_t v13 = (_DWORD *)((char *)v13 + a11);
      }
    }
    return result;
  }
  unsigned int v266 = a8;
  if (*((unsigned char *)a12 + 20))
  {
    BOOL result = agxCalcSparseInputs(a12[3], *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 8), a13[2], a13[3], a13[1], *a13, *((unsigned __int8 *)a12 + 16) - 1 < 2, a7, a8, a9, a10, (uint64_t)v304);
    char v22 = *((unsigned char *)a12 + 13);
    char v23 = *((unsigned char *)a12 + 12);
    if (1 << v22 >= a6 || a5 >> v23)
    {
      unsigned int v149 = a6 >> v22;
      unsigned int v150 = 1 << v23;
      unsigned int v151 = __clz(~(-1 << -(char)__clz(a6 - 1))) - 32;
      if (a6 < 2) {
        unsigned int v151 = 0;
      }
      BOOL v152 = v150 >= a5;
      if (v150 < a5) {
        char v153 = v23 + v22 + v151;
      }
      else {
        char v153 = *((unsigned char *)a12 + 12);
      }
      if (v152) {
        LOBYTE(v154) = *((unsigned char *)a12 + 13);
      }
      else {
        int v154 = -v151;
      }
      if (!v149) {
        char v23 = v153;
      }
      char v261 = v23;
      if (v149) {
        char v25 = *((unsigned char *)a12 + 13);
      }
      else {
        char v25 = v154;
      }
    }
    else
    {
      unsigned int v24 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
      if (a5 < 2) {
        LOBYTE(v24) = 0;
      }
      char v261 = v24;
      char v25 = v23 + v22 - v24;
    }
    unsigned int v156 = a8;
    unsigned int v155 = a10;
    unsigned int v157 = a7;
    unsigned int v259 = v310;
    if (v310)
    {
      unsigned int v158 = 1 << v25;
      unsigned int v159 = v311;
      int v292 = v308;
      BOOL v288 = v308 != 0;
      int v290 = v309;
      BOOL v286 = v309 != 0;
      int v260 = 1 << v261;
      if (1 << v261 >= a5) {
        unsigned int v160 = a5;
      }
      else {
        unsigned int v160 = 1 << v261;
      }
      if (v158 >= a6) {
        unsigned int v161 = a6;
      }
      else {
        unsigned int v161 = 1 << v25;
      }
      unsigned int v162 = 32 - __clz(v160 - 1);
      if (v160 >= 2) {
        unsigned int v163 = v162;
      }
      else {
        unsigned int v163 = 0;
      }
      unsigned int v164 = 32 - __clz(v161 - 1);
      if (v161 < 2) {
        unsigned int v164 = 0;
      }
      BOOL v296 = v163 != 0;
      unsigned int v298 = v164;
      BOOL v294 = v164 != 0;
      if (v311)
      {
        int v165 = 0;
        unsigned int v258 = a7 >> v261;
        unsigned int v280 = a8 >> v25;
        int v303 = v309 | v308;
        int v301 = v312;
        unsigned int v257 = a9 + a7;
        int v256 = v305;
        int v166 = v307;
        int v300 = v306;
        int v275 = (v158 - 1) & a8;
        int v277 = (v158 - 1) & (a10 + a8);
        unsigned int v273 = v158 - v275;
        int v167 = ~(-1 << v163);
        int v271 = v164 | v163;
        int v168 = ~(-1 << v164);
        unsigned int v283 = v163;
        int v264 = 1 << v25;
        char v265 = v25;
        int v269 = v307;
        do
        {
          int v169 = 0;
          int v170 = v165 + v256;
          unsigned int v171 = (v165 + v258) << v261;
          unsigned int v172 = a9;
          if (v257 >= (v165 + v258 + 1) << v261) {
            unsigned int v172 = v260 - ((v260 - 1) & a7);
          }
          int v173 = 1 << v261;
          if (v257 < (v165 + v258 + 1) << v261) {
            int v173 = (v260 - 1) & (a9 + a7);
          }
          int v263 = v165;
          if (v171 >= v157) {
            int v174 = v173;
          }
          else {
            int v174 = v172;
          }
          if (v171 >= v157) {
            int v175 = 0;
          }
          else {
            int v175 = (v260 - 1) & a7;
          }
          v267 = &v13[v175 + (v165 << v261)];
          do
          {
            int v176 = v169 + v300;
            if (v301)
            {
              int v177 = v303;
              if (v303)
              {
                int v178 = 0;
                int v177 = 0;
                int v179 = 1;
                BOOL v180 = v286;
                BOOL v181 = v288;
                int v183 = v290;
                int v182 = v292;
                do
                {
                  --v182;
                  if (v181) {
                    v177 |= (v179 & v170) << v178;
                  }
                  else {
                    int v182 = 0;
                  }
                  if (v181) {
                    ++v178;
                  }
                  --v183;
                  if (v180) {
                    v177 |= (v179 & v176) << v178;
                  }
                  else {
                    int v183 = 0;
                  }
                  if (v180) {
                    ++v178;
                  }
                  v179 *= 2;
                  --v178;
                  BOOL v180 = v183 != 0;
                  BOOL v181 = v182 != 0;
                }
                while (v183 | v182);
              }
            }
            else
            {
              int v177 = v303;
              if (v303)
              {
                int v184 = 0;
                int v177 = 0;
                int v185 = 1;
                BOOL v187 = v286;
                BOOL v186 = v288;
                int v188 = v290;
                int v189 = v292;
                do
                {
                  --v188;
                  if (v187) {
                    v177 |= (v185 & v176) << v184;
                  }
                  else {
                    int v188 = 0;
                  }
                  if (v187) {
                    ++v184;
                  }
                  --v189;
                  if (v186) {
                    v177 |= (v185 & v170) << v184;
                  }
                  else {
                    int v189 = 0;
                  }
                  if (v186) {
                    ++v184;
                  }
                  v185 *= 2;
                  --v184;
                  BOOL v186 = v189 != 0;
                  BOOL v187 = v188 != 0;
                }
                while (v189 | v188);
              }
            }
            int v190 = *(_DWORD *)(v18 + 4 * ((v177 + v166) | ((v177 + v166) >> 8 << 9)));
            if (v190 < 0)
            {
              unint64_t v191 = v18 - *((void *)a13 + 3) + ((unint64_t)(v190 & 0x1FFFFFFF) << 14);
              BOOL result = *a13;
              unsigned int v192 = a13[2];
              if (result > v192)
              {
                BOOL result = get_level_offset_within_tail(result, v192, *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 16) - 1 < 2);
                unsigned int v163 = v283;
                unsigned int v158 = v264;
                char v25 = v265;
                uint64_t v19 = a11;
                unsigned int v157 = a7;
                unsigned int v156 = v266;
                unsigned int v155 = a10;
                v191 += result;
              }
              unsigned int v193 = (v169 + v280) << v25;
              unsigned int v194 = v273;
              if (a10 + v266 >= (v169 + v280 + 1) << v25)
              {
                unsigned int v195 = v158;
              }
              else
              {
                unsigned int v194 = v155;
                unsigned int v195 = v277;
              }
              if (v193 >= v156) {
                int v196 = 0;
              }
              else {
                int v196 = v275;
              }
              if (v193 >= v156) {
                unsigned int v194 = v195;
              }
              if (!v271)
              {
                uint64_t v214 = 0;
                uint64_t v198 = 0;
                uint64_t v205 = 0;
                uint64_t v221 = 0;
                int v166 = v269;
                if (!v194) {
                  goto LABEL_192;
                }
LABEL_264:
                if (v174)
                {
                  int v228 = 0;
                  v229 = (_DWORD *)((char *)v267 + (v196 + (v169 << v25)) * v19);
                  do
                  {
                    int v230 = v174;
                    v231 = v229;
                    uint64_t v232 = v214;
                    do
                    {
                      BOOL result = *(unsigned int *)(v191 + 4 * (v232 + v221));
                      *v231++ = result;
                      uint64_t v232 = (v232 - v198) & v198;
                      --v230;
                    }
                    while (v230);
                    uint64_t v221 = (v221 - v205) & v205;
                    v229 = (_DWORD *)((char *)v229 + v19);
                    ++v228;
                  }
                  while (v228 != v194);
                }
                goto LABEL_192;
              }
              unsigned int v197 = 0;
              uint64_t v198 = 0;
              int v199 = 1;
              BOOL v200 = v294;
              BOOL v201 = v296;
              unsigned int v202 = v163;
              unsigned int v203 = v298;
              do
              {
                --v202;
                if (v201) {
                  v198 |= (unint64_t)(v199 & v167) << v197++;
                }
                else {
                  unsigned int v202 = 0;
                }
                --v203;
                if (!v200) {
                  unsigned int v203 = 0;
                }
                v199 *= 2;
                unsigned int v197 = (__PAIR64__(v197, v200) - 1) >> 32;
                BOOL v200 = v203 != 0;
                BOOL v201 = v202 != 0;
              }
              while (v203 | v202);
              int v204 = 0;
              uint64_t v205 = 0;
              int v206 = 1;
              BOOL v207 = v294;
              BOOL v208 = v296;
              unsigned int v209 = v163;
              unsigned int v210 = v298;
              do
              {
                --v209;
                int v211 = v208;
                if (!v211) {
                  unsigned int v209 = 0;
                }
                int v212 = v204 + v211;
                --v210;
                if (v207) {
                  v205 |= (unint64_t)(v206 & v168) << v212++;
                }
                else {
                  unsigned int v210 = 0;
                }
                v206 *= 2;
                int v204 = v212 - 1;
                BOOL v207 = v210 != 0;
                BOOL v208 = v209 != 0;
              }
              while (v210 | v209);
              unsigned int v213 = 0;
              uint64_t v214 = 0;
              int v215 = 1;
              BOOL v217 = v294;
              BOOL v216 = v296;
              unsigned int v218 = v163;
              unsigned int v219 = v298;
              do
              {
                --v218;
                if (v216) {
                  v214 |= (unint64_t)(v215 & v175) << v213++;
                }
                else {
                  unsigned int v218 = 0;
                }
                --v219;
                if (!v217) {
                  unsigned int v219 = 0;
                }
                v215 *= 2;
                unsigned int v213 = (__PAIR64__(v213, v217) - 1) >> 32;
                BOOL v217 = v219 != 0;
                BOOL v216 = v218 != 0;
              }
              while (v219 | v218);
              int v220 = 0;
              uint64_t v221 = 0;
              int v222 = 1;
              LOBYTE(result) = v294;
              BOOL v223 = v296;
              unsigned int v224 = v163;
              unsigned int v225 = v298;
              do
              {
                --v224;
                int v226 = v223;
                if (!v226) {
                  unsigned int v224 = 0;
                }
                int v227 = v220 + v226;
                --v225;
                if (result) {
                  v221 |= (unint64_t)(v222 & v196) << v227++;
                }
                else {
                  unsigned int v225 = 0;
                }
                v222 *= 2;
                int v220 = v227 - 1;
                BOOL result = v225 != 0;
                BOOL v223 = v224 != 0;
              }
              while (v225 | v224);
              unsigned int v163 = v283;
              int v166 = v269;
              if (v194) {
                goto LABEL_264;
              }
            }
LABEL_192:
            ++v169;
          }
          while (v159 > (unsigned __int16)v169);
          int v165 = v263 + 1;
        }
        while (v259 > (unsigned __int16)(v263 + 1));
      }
    }
  }
  else
  {
    int v61 = *((unsigned __int8 *)a12 + 13);
    int v62 = *((unsigned __int8 *)a12 + 12);
    unsigned int v63 = 1 << v61;
    unsigned int v64 = a5 >> v62;
    unsigned int v65 = __clz(~(-1 << -__clz(a6 - 1))) - 32;
    if (a6 < 2) {
      unsigned int v65 = 0;
    }
    char v66 = v62 + v61;
    BOOL result = v62 + v61 + v65;
    if (a6 >> v61) {
      BOOL v67 = 1;
    }
    else {
      BOOL v67 = 1 << v62 >= a5;
    }
    if (v67)
    {
      LOBYTE(v68) = *((unsigned char *)a12 + 13);
    }
    else
    {
      LOBYTE(v62) = v62 + v61 + v65;
      int v68 = -v65;
    }
    unsigned int v69 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
    if (a5 < 2) {
      LOBYTE(v69) = 0;
    }
    if (v63 < a6 && v64 == 0)
    {
      char v71 = v66 - v69;
    }
    else
    {
      LOBYTE(v69) = v62;
      char v71 = v68;
    }
    int v72 = 1 << v71;
    char v73 = *((unsigned char *)a12 + 15);
    unsigned int v74 = 1 << v73;
    if (v73) {
      BOOL v75 = v74 > a3;
    }
    else {
      BOOL v75 = 1;
    }
    BOOL v76 = v75 || v74 > a4;
    int v77 = (~(-1 << v73) + a3) & (-1 << v73);
    if (v76) {
      int v78 = a3;
    }
    else {
      int v78 = v77;
    }
    unsigned int v282 = 1 << v71;
    int v79 = v72 - 1;
    unsigned int v274 = a8 >> v71;
    unsigned int v279 = (v72 - 1 + a10 + a8) >> v71;
    unsigned int v281 = a10 + a8;
    if (a8 >> v71 < v279)
    {
      int v80 = (1 << v69) - 1;
      unsigned int v302 = a9 + a7;
      BOOL result = (v80 + a9 + a7) >> v69;
      if (1 << v69 >= a5) {
        unsigned int v81 = a5;
      }
      else {
        unsigned int v81 = 1 << v69;
      }
      unsigned int v82 = 1 << v71;
      if (v282 >= a6) {
        unsigned int v82 = a6;
      }
      unsigned int v83 = 32 - __clz(v81 - 1);
      if (v81 >= 2) {
        unsigned int v84 = v83;
      }
      else {
        unsigned int v84 = 0;
      }
      unsigned int v85 = 32 - __clz(v82 - 1);
      if (v82 >= 2) {
        unsigned int v86 = v85;
      }
      else {
        unsigned int v86 = 0;
      }
      unsigned int v293 = a7 >> v69;
      unsigned int v299 = (v80 + a9 + a7) >> v69;
      if (a7 >> v69 < result)
      {
        unsigned int v272 = (v78 + ~(-1 << v69)) >> v69;
        uint64_t v87 = v80 & a7;
        uint64_t v88 = v79 & a8;
        int v297 = v80 & v302;
        uint64_t v291 = v87;
        unsigned int v295 = (1 << v69) - v87;
        int v278 = v79 & v281;
        unsigned int v276 = v282 - v88;
        if (v86 | v84)
        {
          unsigned int v89 = a8 >> v71;
          v262 = v13;
          char v270 = v71;
          uint64_t v268 = v79 & a8;
          do
          {
            unsigned int v90 = v89 << v71;
            unsigned int v91 = v89 - v274;
            int v289 = v89 * v272;
            unsigned int v285 = v89 + 1;
            BOOL v92 = v281 >= (v89 + 1) << v71;
            unsigned int v93 = v282;
            if (!v92) {
              unsigned int v93 = v278;
            }
            unsigned int v94 = v276;
            if (!v92) {
              unsigned int v94 = v21;
            }
            unsigned int v95 = v91 << v71;
            if (v90 >= a8) {
              unsigned int v96 = 0;
            }
            else {
              unsigned int v96 = v88;
            }
            if (v90 >= a8) {
              BOOL result = v93;
            }
            else {
              BOOL result = v94;
            }
            v287 = (char *)v13 + (v96 + v95 - v88) * a11;
            unsigned int v97 = v293;
            do
            {
              unsigned int v98 = 0;
              uint64_t v99 = 0;
              unsigned int v100 = v97 << v69;
              unsigned int v101 = v97 - v293;
              unsigned int v102 = v97 + v289;
              unsigned int v103 = ++v97 << v69;
              if (v100 >= v15) {
                unsigned int v104 = 0;
              }
              else {
                unsigned int v104 = v291;
              }
              uint64_t v105 = v104 + (v101 << v69) - v291;
              uint64_t v106 = v102 * v20[3] * *((unsigned __int8 *)v20 + 9);
              int v107 = 1;
              BOOL v108 = v84 != 0;
              BOOL v109 = v86 != 0;
              unsigned int v110 = v84;
              unsigned int v111 = v86;
              do
              {
                --v110;
                if (v108) {
                  v99 |= (unint64_t)(v107 & ~(-1 << v84)) << v98++;
                }
                else {
                  unsigned int v110 = 0;
                }
                --v111;
                if (!v109) {
                  unsigned int v111 = 0;
                }
                v107 *= 2;
                unsigned int v98 = (__PAIR64__(v98, v109) - 1) >> 32;
                BOOL v109 = v111 != 0;
                BOOL v108 = v110 != 0;
              }
              while (v111 | v110);
              int v112 = 0;
              uint64_t v113 = 0;
              uint64_t v114 = 4 * v105;
              if (v302 >= v103) {
                int v115 = 1 << v69;
              }
              else {
                int v115 = v297;
              }
              int v116 = 1;
              BOOL v117 = v84 != 0;
              BOOL v118 = v86 != 0;
              unsigned int v119 = v84;
              unsigned int v120 = v86;
              do
              {
                int v121 = v117;
                if (v121) {
                  --v119;
                }
                else {
                  unsigned int v119 = 0;
                }
                int v122 = v112 + v121;
                if (v118) {
                  --v120;
                }
                else {
                  unsigned int v120 = 0;
                }
                if (v118) {
                  v113 |= (unint64_t)(v116 & ~(-1 << v86)) << v122++;
                }
                v116 *= 2;
                int v112 = v122 - 1;
                BOOL v118 = v120 != 0;
                BOOL v117 = v119 != 0;
              }
              while (v120 | v119);
              unsigned int v123 = 0;
              uint64_t v124 = 0;
              unsigned int v125 = v295;
              if (v302 < v103) {
                unsigned int v125 = a9;
              }
              v126 = &v287[v114];
              int v127 = 1;
              BOOL v128 = v84 != 0;
              BOOL v129 = v86 != 0;
              unsigned int v130 = v84;
              unsigned int v131 = v86;
              do
              {
                --v130;
                if (v128)
                {
                  v124 |= (unint64_t)(v127 & v104) << v123;
                  unsigned int v132 = v123 + 1;
                }
                else
                {
                  unsigned int v130 = 0;
                  unsigned int v132 = v123;
                }
                if (v129) {
                  --v131;
                }
                else {
                  unsigned int v131 = 0;
                }
                v127 *= 2;
                unsigned int v123 = (__PAIR64__(v132, v129) - 1) >> 32;
                BOOL v129 = v131 != 0;
                BOOL v128 = v130 != 0;
              }
              while (v131 | v130);
              int v133 = 0;
              unint64_t v134 = 0;
              int v135 = 1;
              BOOL v136 = v84 != 0;
              BOOL v137 = v86 != 0;
              unsigned int v138 = v84;
              unsigned int v139 = v86;
              do
              {
                int v140 = v136;
                if (v140) {
                  --v138;
                }
                else {
                  unsigned int v138 = 0;
                }
                int v141 = v133 + v140;
                unint64_t v142 = ((unint64_t)(v135 & v96) << (v133 + v140)) | v134;
                if (v137) {
                  --v139;
                }
                else {
                  unsigned int v139 = 0;
                }
                if (v137)
                {
                  unint64_t v134 = v142;
                  ++v141;
                }
                v135 *= 2;
                int v133 = v141 - 1;
                BOOL v137 = v139 != 0;
                BOOL v136 = v138 != 0;
              }
              while (v139 | v138);
              unsigned int v15 = a7;
              if (v100 >= a7) {
                int v143 = v115;
              }
              else {
                int v143 = v125;
              }
              if (result && v143)
              {
                int v144 = 0;
                uint64_t v145 = v106 + v18;
                do
                {
                  int v146 = v143;
                  v147 = v126;
                  uint64_t v148 = v124;
                  do
                  {
                    *(_DWORD *)v147 = *(_DWORD *)(v145 + 4 * (v148 + v134));
                    v147 += 4;
                    uint64_t v148 = (v148 - v99) & v99;
                    --v146;
                  }
                  while (v146);
                  unint64_t v134 = (v134 - v113) & v113;
                  v126 += a11;
                  ++v144;
                }
                while (v144 != result);
              }
              unsigned int v20 = a12;
            }
            while (v97 != v299);
            unsigned int v89 = v285;
            unint64_t v13 = v262;
            a8 = v266;
            unsigned int v21 = a10;
            char v71 = v270;
            uint64_t v88 = v268;
          }
          while (v285 != v279);
        }
        else
        {
          unsigned int v237 = a8 >> v71;
          do
          {
            unsigned int v238 = v237 << v71;
            unsigned int v239 = v237 + 1;
            int v240 = v278;
            if (v281 >= (v237 + 1) << v71) {
              int v240 = 1 << v71;
            }
            if (v281 >= v239 << v71) {
              unsigned int v241 = v282 - v88;
            }
            else {
              unsigned int v241 = a10;
            }
            if (v238 >= a8) {
              int v242 = 0;
            }
            else {
              int v242 = v88;
            }
            if (v238 >= a8) {
              int v243 = v240;
            }
            else {
              int v243 = v241;
            }
            if (v243)
            {
              int v244 = (v237 - v274) << v71;
              int v245 = v237 * v272;
              v246 = (char *)v13 + ((v242 + v244) - v88) * a11;
              unsigned int v247 = v293;
              do
              {
                BOOL result = v247 << v69;
                unsigned int v248 = v247 + 1;
                unsigned int v249 = a9;
                if (v302 >= (v247 + 1) << v69) {
                  unsigned int v249 = v295;
                }
                int v250 = 1 << v69;
                if (v302 < v248 << v69) {
                  int v250 = v297;
                }
                if (result >= v15) {
                  unsigned int v249 = v250;
                }
                if (v249)
                {
                  int v251 = 0;
                  uint64_t v252 = (v247 + v245) * a12[3] * *((unsigned __int8 *)a12 + 9);
                  if (result >= v15) {
                    int v253 = 0;
                  }
                  else {
                    int v253 = v291;
                  }
                  BOOL result = (uint64_t)&v246[4 * (v253 + ((v247 - v293) << v69) - v291)];
                  do
                  {
                    unsigned int v254 = v249;
                    v255 = (_DWORD *)result;
                    do
                    {
                      *v255++ = *(_DWORD *)(v18 + v252);
                      --v254;
                    }
                    while (v254);
                    result += a11;
                    ++v251;
                  }
                  while (v251 != v243);
                }
                unsigned int v247 = v248;
              }
              while (v248 != v299);
            }
            unsigned int v237 = v239;
          }
          while (v239 != v279);
        }
      }
    }
  }
  return result;
}

uint64_t agxsTwiddleAddressZ<AGXSConverterPassThru<false,2ul,1u,(TwiddleOrder)1>>(uint64_t result, _WORD *a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned int a9, unsigned int a10, uint64_t a11, unsigned __int16 *a12, unsigned int *a13)
{
  if (!result) {
    return result;
  }
  unint64_t v13 = a2;
  if (!a2) {
    return result;
  }
  unsigned int v15 = a7;
  uint64_t v18 = result;
  uint64_t v19 = a11;
  unsigned int v20 = a12;
  unsigned int v21 = a10;
  if (!a12)
  {
    unsigned int v26 = 32 - __clz(a5 - 1);
    if (a5 >= 2) {
      unsigned int v27 = v26;
    }
    else {
      unsigned int v27 = 0;
    }
    unsigned int v28 = 32 - __clz(a6 - 1);
    if (a6 >= 2) {
      unsigned int v29 = v28;
    }
    else {
      unsigned int v29 = 0;
    }
    if (v29 | v27)
    {
      unsigned int v30 = 0;
      uint64_t v31 = 0;
      BOOL v32 = v27 != 0;
      BOOL v33 = v29 != 0;
      BOOL v34 = v27 != 0;
      BOOL v35 = v29 != 0;
      int v36 = 1;
      unsigned int v37 = v27;
      unsigned int v38 = v29;
      do
      {
        --v37;
        if (v34) {
          v31 |= (unint64_t)(v36 & ~(-1 << v27)) << v30++;
        }
        else {
          unsigned int v37 = 0;
        }
        --v38;
        if (!v35) {
          unsigned int v38 = 0;
        }
        v36 *= 2;
        unsigned int v30 = (__PAIR64__(v30, v35) - 1) >> 32;
        BOOL v35 = v38 != 0;
        BOOL v34 = v37 != 0;
      }
      while (v38 | v37);
      int v39 = 0;
      uint64_t v40 = 0;
      int v41 = 1;
      BOOL v42 = v27 != 0;
      BOOL v43 = v29 != 0;
      unsigned int v44 = v27;
      unsigned int v45 = v29;
      do
      {
        --v44;
        int v46 = v42;
        if (!v46) {
          unsigned int v44 = 0;
        }
        int v47 = v39 + v46;
        --v45;
        if (v43) {
          v40 |= (unint64_t)(v41 & ~(-1 << v29)) << v47++;
        }
        else {
          unsigned int v45 = 0;
        }
        v41 *= 2;
        int v39 = v47 - 1;
        BOOL v43 = v45 != 0;
        BOOL v42 = v44 != 0;
      }
      while (v45 | v44);
      unsigned int v48 = 0;
      uint64_t v49 = 0;
      BOOL v50 = v27 != 0;
      BOOL v51 = v29 != 0;
      int v52 = 1;
      unsigned int v53 = v27;
      unsigned int v54 = v29;
      do
      {
        --v53;
        if (v50) {
          v49 |= (unint64_t)(v52 & a7) << v48++;
        }
        else {
          unsigned int v53 = 0;
        }
        --v54;
        if (!v51) {
          unsigned int v54 = 0;
        }
        v52 *= 2;
        unsigned int v48 = (__PAIR64__(v48, v51) - 1) >> 32;
        BOOL v51 = v54 != 0;
        BOOL v50 = v53 != 0;
      }
      while (v54 | v53);
      int v55 = 0;
      uint64_t v56 = 0;
      int v57 = 1;
      do
      {
        --v27;
        int v58 = v32;
        if (!v58) {
          unsigned int v27 = 0;
        }
        int v59 = v55 + v58;
        --v29;
        if (v33)
        {
          v56 |= (unint64_t)(v57 & a8) << v59;
          int v60 = v59 + 1;
        }
        else
        {
          unsigned int v29 = 0;
          int v60 = v59;
        }
        v57 *= 2;
        int v55 = v60 - 1;
        BOOL v33 = v29 != 0;
        BOOL v32 = v27 != 0;
        BOOL result = v29 | v27;
      }
      while (result);
      if (!a10) {
        return result;
      }
    }
    else
    {
      uint64_t v49 = 0;
      uint64_t v31 = 0;
      uint64_t v40 = 0;
      uint64_t v56 = 0;
      if (!a10) {
        return result;
      }
    }
    if (a9)
    {
      for (int i = 0; i != a10; ++i)
      {
        unsigned int v234 = a9;
        v235 = v13;
        uint64_t v236 = v49;
        do
        {
          *v235++ = *(_WORD *)(v18 + 2 * (v236 + v56));
          uint64_t v236 = (v236 - v31) & v31;
          --v234;
        }
        while (v234);
        uint64_t v56 = (v56 - v40) & v40;
        unint64_t v13 = (_WORD *)((char *)v13 + a11);
      }
    }
    return result;
  }
  unsigned int v266 = a8;
  if (*((unsigned char *)a12 + 20))
  {
    BOOL result = agxCalcSparseInputs(a12[3], *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 8), a13[2], a13[3], a13[1], *a13, *((unsigned __int8 *)a12 + 16) - 1 < 2, a7, a8, a9, a10, (uint64_t)v304);
    char v22 = *((unsigned char *)a12 + 13);
    char v23 = *((unsigned char *)a12 + 12);
    if (1 << v22 >= a6 || a5 >> v23)
    {
      unsigned int v149 = a6 >> v22;
      unsigned int v150 = 1 << v23;
      unsigned int v151 = __clz(~(-1 << -(char)__clz(a6 - 1))) - 32;
      if (a6 < 2) {
        unsigned int v151 = 0;
      }
      BOOL v152 = v150 >= a5;
      if (v150 < a5) {
        char v153 = v23 + v22 + v151;
      }
      else {
        char v153 = *((unsigned char *)a12 + 12);
      }
      if (v152) {
        LOBYTE(v154) = *((unsigned char *)a12 + 13);
      }
      else {
        int v154 = -v151;
      }
      if (!v149) {
        char v23 = v153;
      }
      char v261 = v23;
      if (v149) {
        char v25 = *((unsigned char *)a12 + 13);
      }
      else {
        char v25 = v154;
      }
    }
    else
    {
      unsigned int v24 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
      if (a5 < 2) {
        LOBYTE(v24) = 0;
      }
      char v261 = v24;
      char v25 = v23 + v22 - v24;
    }
    unsigned int v156 = a8;
    unsigned int v155 = a10;
    unsigned int v157 = a7;
    unsigned int v259 = v310;
    if (v310)
    {
      unsigned int v158 = 1 << v25;
      unsigned int v159 = v311;
      int v292 = v308;
      BOOL v288 = v308 != 0;
      int v290 = v309;
      BOOL v286 = v309 != 0;
      int v260 = 1 << v261;
      if (1 << v261 >= a5) {
        unsigned int v160 = a5;
      }
      else {
        unsigned int v160 = 1 << v261;
      }
      if (v158 >= a6) {
        unsigned int v161 = a6;
      }
      else {
        unsigned int v161 = 1 << v25;
      }
      unsigned int v162 = 32 - __clz(v160 - 1);
      if (v160 >= 2) {
        unsigned int v163 = v162;
      }
      else {
        unsigned int v163 = 0;
      }
      unsigned int v164 = 32 - __clz(v161 - 1);
      if (v161 < 2) {
        unsigned int v164 = 0;
      }
      BOOL v296 = v163 != 0;
      unsigned int v298 = v164;
      BOOL v294 = v164 != 0;
      if (v311)
      {
        int v165 = 0;
        unsigned int v258 = a7 >> v261;
        unsigned int v280 = a8 >> v25;
        int v303 = v309 | v308;
        int v301 = v312;
        unsigned int v257 = a9 + a7;
        int v256 = v305;
        int v166 = v307;
        int v300 = v306;
        int v275 = (v158 - 1) & a8;
        int v277 = (v158 - 1) & (a10 + a8);
        unsigned int v273 = v158 - v275;
        int v167 = ~(-1 << v163);
        int v271 = v164 | v163;
        int v168 = ~(-1 << v164);
        unsigned int v283 = v163;
        int v264 = 1 << v25;
        char v265 = v25;
        int v269 = v307;
        do
        {
          int v169 = 0;
          int v170 = v165 + v256;
          unsigned int v171 = (v165 + v258) << v261;
          unsigned int v172 = a9;
          if (v257 >= (v165 + v258 + 1) << v261) {
            unsigned int v172 = v260 - ((v260 - 1) & a7);
          }
          int v173 = 1 << v261;
          if (v257 < (v165 + v258 + 1) << v261) {
            int v173 = (v260 - 1) & (a9 + a7);
          }
          int v263 = v165;
          if (v171 >= v157) {
            int v174 = v173;
          }
          else {
            int v174 = v172;
          }
          if (v171 >= v157) {
            int v175 = 0;
          }
          else {
            int v175 = (v260 - 1) & a7;
          }
          v267 = &v13[v175 + (v165 << v261)];
          do
          {
            int v176 = v169 + v300;
            if (v301)
            {
              int v177 = v303;
              if (v303)
              {
                int v178 = 0;
                int v177 = 0;
                int v179 = 1;
                BOOL v180 = v286;
                BOOL v181 = v288;
                int v183 = v290;
                int v182 = v292;
                do
                {
                  --v182;
                  if (v181) {
                    v177 |= (v179 & v170) << v178;
                  }
                  else {
                    int v182 = 0;
                  }
                  if (v181) {
                    ++v178;
                  }
                  --v183;
                  if (v180) {
                    v177 |= (v179 & v176) << v178;
                  }
                  else {
                    int v183 = 0;
                  }
                  if (v180) {
                    ++v178;
                  }
                  v179 *= 2;
                  --v178;
                  BOOL v180 = v183 != 0;
                  BOOL v181 = v182 != 0;
                }
                while (v183 | v182);
              }
            }
            else
            {
              int v177 = v303;
              if (v303)
              {
                int v184 = 0;
                int v177 = 0;
                int v185 = 1;
                BOOL v187 = v286;
                BOOL v186 = v288;
                int v188 = v290;
                int v189 = v292;
                do
                {
                  --v188;
                  if (v187) {
                    v177 |= (v185 & v176) << v184;
                  }
                  else {
                    int v188 = 0;
                  }
                  if (v187) {
                    ++v184;
                  }
                  --v189;
                  if (v186) {
                    v177 |= (v185 & v170) << v184;
                  }
                  else {
                    int v189 = 0;
                  }
                  if (v186) {
                    ++v184;
                  }
                  v185 *= 2;
                  --v184;
                  BOOL v186 = v189 != 0;
                  BOOL v187 = v188 != 0;
                }
                while (v189 | v188);
              }
            }
            int v190 = *(_DWORD *)(v18 + 4 * ((v177 + v166) | ((v177 + v166) >> 8 << 9)));
            if (v190 < 0)
            {
              unint64_t v191 = v18 - *((void *)a13 + 3) + ((unint64_t)(v190 & 0x1FFFFFFF) << 14);
              BOOL result = *a13;
              unsigned int v192 = a13[2];
              if (result > v192)
              {
                BOOL result = get_level_offset_within_tail(result, v192, *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 16) - 1 < 2);
                unsigned int v163 = v283;
                unsigned int v158 = v264;
                char v25 = v265;
                uint64_t v19 = a11;
                unsigned int v157 = a7;
                unsigned int v156 = v266;
                unsigned int v155 = a10;
                v191 += result;
              }
              unsigned int v193 = (v169 + v280) << v25;
              unsigned int v194 = v273;
              if (a10 + v266 >= (v169 + v280 + 1) << v25)
              {
                unsigned int v195 = v158;
              }
              else
              {
                unsigned int v194 = v155;
                unsigned int v195 = v277;
              }
              if (v193 >= v156) {
                int v196 = 0;
              }
              else {
                int v196 = v275;
              }
              if (v193 >= v156) {
                unsigned int v194 = v195;
              }
              if (!v271)
              {
                uint64_t v214 = 0;
                uint64_t v198 = 0;
                uint64_t v205 = 0;
                uint64_t v221 = 0;
                int v166 = v269;
                if (!v194) {
                  goto LABEL_192;
                }
LABEL_264:
                if (v174)
                {
                  int v228 = 0;
                  v229 = (_WORD *)((char *)v267 + (v196 + (v169 << v25)) * v19);
                  do
                  {
                    int v230 = v174;
                    v231 = v229;
                    uint64_t v232 = v214;
                    do
                    {
                      BOOL result = *(unsigned __int16 *)(v191 + 2 * (v232 + v221));
                      *v231++ = result;
                      uint64_t v232 = (v232 - v198) & v198;
                      --v230;
                    }
                    while (v230);
                    uint64_t v221 = (v221 - v205) & v205;
                    v229 = (_WORD *)((char *)v229 + v19);
                    ++v228;
                  }
                  while (v228 != v194);
                }
                goto LABEL_192;
              }
              unsigned int v197 = 0;
              uint64_t v198 = 0;
              int v199 = 1;
              BOOL v200 = v294;
              BOOL v201 = v296;
              unsigned int v202 = v163;
              unsigned int v203 = v298;
              do
              {
                --v202;
                if (v201) {
                  v198 |= (unint64_t)(v199 & v167) << v197++;
                }
                else {
                  unsigned int v202 = 0;
                }
                --v203;
                if (!v200) {
                  unsigned int v203 = 0;
                }
                v199 *= 2;
                unsigned int v197 = (__PAIR64__(v197, v200) - 1) >> 32;
                BOOL v200 = v203 != 0;
                BOOL v201 = v202 != 0;
              }
              while (v203 | v202);
              int v204 = 0;
              uint64_t v205 = 0;
              int v206 = 1;
              BOOL v207 = v294;
              BOOL v208 = v296;
              unsigned int v209 = v163;
              unsigned int v210 = v298;
              do
              {
                --v209;
                int v211 = v208;
                if (!v211) {
                  unsigned int v209 = 0;
                }
                int v212 = v204 + v211;
                --v210;
                if (v207) {
                  v205 |= (unint64_t)(v206 & v168) << v212++;
                }
                else {
                  unsigned int v210 = 0;
                }
                v206 *= 2;
                int v204 = v212 - 1;
                BOOL v207 = v210 != 0;
                BOOL v208 = v209 != 0;
              }
              while (v210 | v209);
              unsigned int v213 = 0;
              uint64_t v214 = 0;
              int v215 = 1;
              BOOL v217 = v294;
              BOOL v216 = v296;
              unsigned int v218 = v163;
              unsigned int v219 = v298;
              do
              {
                --v218;
                if (v216) {
                  v214 |= (unint64_t)(v215 & v175) << v213++;
                }
                else {
                  unsigned int v218 = 0;
                }
                --v219;
                if (!v217) {
                  unsigned int v219 = 0;
                }
                v215 *= 2;
                unsigned int v213 = (__PAIR64__(v213, v217) - 1) >> 32;
                BOOL v217 = v219 != 0;
                BOOL v216 = v218 != 0;
              }
              while (v219 | v218);
              int v220 = 0;
              uint64_t v221 = 0;
              int v222 = 1;
              LOBYTE(result) = v294;
              BOOL v223 = v296;
              unsigned int v224 = v163;
              unsigned int v225 = v298;
              do
              {
                --v224;
                int v226 = v223;
                if (!v226) {
                  unsigned int v224 = 0;
                }
                int v227 = v220 + v226;
                --v225;
                if (result) {
                  v221 |= (unint64_t)(v222 & v196) << v227++;
                }
                else {
                  unsigned int v225 = 0;
                }
                v222 *= 2;
                int v220 = v227 - 1;
                BOOL result = v225 != 0;
                BOOL v223 = v224 != 0;
              }
              while (v225 | v224);
              unsigned int v163 = v283;
              int v166 = v269;
              if (v194) {
                goto LABEL_264;
              }
            }
LABEL_192:
            ++v169;
          }
          while (v159 > (unsigned __int16)v169);
          int v165 = v263 + 1;
        }
        while (v259 > (unsigned __int16)(v263 + 1));
      }
    }
  }
  else
  {
    int v61 = *((unsigned __int8 *)a12 + 13);
    int v62 = *((unsigned __int8 *)a12 + 12);
    unsigned int v63 = 1 << v61;
    unsigned int v64 = a5 >> v62;
    unsigned int v65 = __clz(~(-1 << -__clz(a6 - 1))) - 32;
    if (a6 < 2) {
      unsigned int v65 = 0;
    }
    char v66 = v62 + v61;
    BOOL result = v62 + v61 + v65;
    if (a6 >> v61) {
      BOOL v67 = 1;
    }
    else {
      BOOL v67 = 1 << v62 >= a5;
    }
    if (v67)
    {
      LOBYTE(v68) = *((unsigned char *)a12 + 13);
    }
    else
    {
      LOBYTE(v62) = v62 + v61 + v65;
      int v68 = -v65;
    }
    unsigned int v69 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
    if (a5 < 2) {
      LOBYTE(v69) = 0;
    }
    if (v63 < a6 && v64 == 0)
    {
      char v71 = v66 - v69;
    }
    else
    {
      LOBYTE(v69) = v62;
      char v71 = v68;
    }
    int v72 = 1 << v71;
    char v73 = *((unsigned char *)a12 + 15);
    unsigned int v74 = 1 << v73;
    if (v73) {
      BOOL v75 = v74 > a3;
    }
    else {
      BOOL v75 = 1;
    }
    BOOL v76 = v75 || v74 > a4;
    int v77 = (~(-1 << v73) + a3) & (-1 << v73);
    if (v76) {
      int v78 = a3;
    }
    else {
      int v78 = v77;
    }
    unsigned int v282 = 1 << v71;
    int v79 = v72 - 1;
    unsigned int v274 = a8 >> v71;
    unsigned int v279 = (v72 - 1 + a10 + a8) >> v71;
    unsigned int v281 = a10 + a8;
    if (a8 >> v71 < v279)
    {
      int v80 = (1 << v69) - 1;
      unsigned int v302 = a9 + a7;
      BOOL result = (v80 + a9 + a7) >> v69;
      if (1 << v69 >= a5) {
        unsigned int v81 = a5;
      }
      else {
        unsigned int v81 = 1 << v69;
      }
      unsigned int v82 = 1 << v71;
      if (v282 >= a6) {
        unsigned int v82 = a6;
      }
      unsigned int v83 = 32 - __clz(v81 - 1);
      if (v81 >= 2) {
        unsigned int v84 = v83;
      }
      else {
        unsigned int v84 = 0;
      }
      unsigned int v85 = 32 - __clz(v82 - 1);
      if (v82 >= 2) {
        unsigned int v86 = v85;
      }
      else {
        unsigned int v86 = 0;
      }
      unsigned int v293 = a7 >> v69;
      unsigned int v299 = (v80 + a9 + a7) >> v69;
      if (a7 >> v69 < result)
      {
        unsigned int v272 = (v78 + ~(-1 << v69)) >> v69;
        uint64_t v87 = v80 & a7;
        uint64_t v88 = v79 & a8;
        int v297 = v80 & v302;
        uint64_t v291 = v87;
        unsigned int v295 = (1 << v69) - v87;
        int v278 = v79 & v281;
        unsigned int v276 = v282 - v88;
        if (v86 | v84)
        {
          unsigned int v89 = a8 >> v71;
          v262 = v13;
          char v270 = v71;
          uint64_t v268 = v79 & a8;
          do
          {
            unsigned int v90 = v89 << v71;
            unsigned int v91 = v89 - v274;
            int v289 = v89 * v272;
            unsigned int v285 = v89 + 1;
            BOOL v92 = v281 >= (v89 + 1) << v71;
            unsigned int v93 = v282;
            if (!v92) {
              unsigned int v93 = v278;
            }
            unsigned int v94 = v276;
            if (!v92) {
              unsigned int v94 = v21;
            }
            unsigned int v95 = v91 << v71;
            if (v90 >= a8) {
              unsigned int v96 = 0;
            }
            else {
              unsigned int v96 = v88;
            }
            if (v90 >= a8) {
              BOOL result = v93;
            }
            else {
              BOOL result = v94;
            }
            v287 = (char *)v13 + (v96 + v95 - v88) * a11;
            unsigned int v97 = v293;
            do
            {
              unsigned int v98 = 0;
              uint64_t v99 = 0;
              unsigned int v100 = v97 << v69;
              unsigned int v101 = v97 - v293;
              unsigned int v102 = v97 + v289;
              unsigned int v103 = ++v97 << v69;
              if (v100 >= v15) {
                unsigned int v104 = 0;
              }
              else {
                unsigned int v104 = v291;
              }
              uint64_t v105 = v104 + (v101 << v69) - v291;
              uint64_t v106 = v102 * v20[3] * *((unsigned __int8 *)v20 + 9);
              int v107 = 1;
              BOOL v108 = v84 != 0;
              BOOL v109 = v86 != 0;
              unsigned int v110 = v84;
              unsigned int v111 = v86;
              do
              {
                --v110;
                if (v108) {
                  v99 |= (unint64_t)(v107 & ~(-1 << v84)) << v98++;
                }
                else {
                  unsigned int v110 = 0;
                }
                --v111;
                if (!v109) {
                  unsigned int v111 = 0;
                }
                v107 *= 2;
                unsigned int v98 = (__PAIR64__(v98, v109) - 1) >> 32;
                BOOL v109 = v111 != 0;
                BOOL v108 = v110 != 0;
              }
              while (v111 | v110);
              int v112 = 0;
              uint64_t v113 = 0;
              uint64_t v114 = 2 * v105;
              if (v302 >= v103) {
                int v115 = 1 << v69;
              }
              else {
                int v115 = v297;
              }
              int v116 = 1;
              BOOL v117 = v84 != 0;
              BOOL v118 = v86 != 0;
              unsigned int v119 = v84;
              unsigned int v120 = v86;
              do
              {
                int v121 = v117;
                if (v121) {
                  --v119;
                }
                else {
                  unsigned int v119 = 0;
                }
                int v122 = v112 + v121;
                if (v118) {
                  --v120;
                }
                else {
                  unsigned int v120 = 0;
                }
                if (v118) {
                  v113 |= (unint64_t)(v116 & ~(-1 << v86)) << v122++;
                }
                v116 *= 2;
                int v112 = v122 - 1;
                BOOL v118 = v120 != 0;
                BOOL v117 = v119 != 0;
              }
              while (v120 | v119);
              unsigned int v123 = 0;
              uint64_t v124 = 0;
              unsigned int v125 = v295;
              if (v302 < v103) {
                unsigned int v125 = a9;
              }
              v126 = &v287[v114];
              int v127 = 1;
              BOOL v128 = v84 != 0;
              BOOL v129 = v86 != 0;
              unsigned int v130 = v84;
              unsigned int v131 = v86;
              do
              {
                --v130;
                if (v128)
                {
                  v124 |= (unint64_t)(v127 & v104) << v123;
                  unsigned int v132 = v123 + 1;
                }
                else
                {
                  unsigned int v130 = 0;
                  unsigned int v132 = v123;
                }
                if (v129) {
                  --v131;
                }
                else {
                  unsigned int v131 = 0;
                }
                v127 *= 2;
                unsigned int v123 = (__PAIR64__(v132, v129) - 1) >> 32;
                BOOL v129 = v131 != 0;
                BOOL v128 = v130 != 0;
              }
              while (v131 | v130);
              int v133 = 0;
              unint64_t v134 = 0;
              int v135 = 1;
              BOOL v136 = v84 != 0;
              BOOL v137 = v86 != 0;
              unsigned int v138 = v84;
              unsigned int v139 = v86;
              do
              {
                int v140 = v136;
                if (v140) {
                  --v138;
                }
                else {
                  unsigned int v138 = 0;
                }
                int v141 = v133 + v140;
                unint64_t v142 = ((unint64_t)(v135 & v96) << (v133 + v140)) | v134;
                if (v137) {
                  --v139;
                }
                else {
                  unsigned int v139 = 0;
                }
                if (v137)
                {
                  unint64_t v134 = v142;
                  ++v141;
                }
                v135 *= 2;
                int v133 = v141 - 1;
                BOOL v137 = v139 != 0;
                BOOL v136 = v138 != 0;
              }
              while (v139 | v138);
              unsigned int v15 = a7;
              if (v100 >= a7) {
                int v143 = v115;
              }
              else {
                int v143 = v125;
              }
              if (result && v143)
              {
                int v144 = 0;
                uint64_t v145 = v106 + v18;
                do
                {
                  int v146 = v143;
                  v147 = v126;
                  uint64_t v148 = v124;
                  do
                  {
                    *(_WORD *)v147 = *(_WORD *)(v145 + 2 * (v148 + v134));
                    v147 += 2;
                    uint64_t v148 = (v148 - v99) & v99;
                    --v146;
                  }
                  while (v146);
                  unint64_t v134 = (v134 - v113) & v113;
                  v126 += a11;
                  ++v144;
                }
                while (v144 != result);
              }
              unsigned int v20 = a12;
            }
            while (v97 != v299);
            unsigned int v89 = v285;
            unint64_t v13 = v262;
            a8 = v266;
            unsigned int v21 = a10;
            char v71 = v270;
            uint64_t v88 = v268;
          }
          while (v285 != v279);
        }
        else
        {
          unsigned int v237 = a8 >> v71;
          do
          {
            unsigned int v238 = v237 << v71;
            unsigned int v239 = v237 + 1;
            int v240 = v278;
            if (v281 >= (v237 + 1) << v71) {
              int v240 = 1 << v71;
            }
            if (v281 >= v239 << v71) {
              unsigned int v241 = v282 - v88;
            }
            else {
              unsigned int v241 = a10;
            }
            if (v238 >= a8) {
              int v242 = 0;
            }
            else {
              int v242 = v88;
            }
            if (v238 >= a8) {
              int v243 = v240;
            }
            else {
              int v243 = v241;
            }
            if (v243)
            {
              int v244 = (v237 - v274) << v71;
              int v245 = v237 * v272;
              v246 = (char *)v13 + ((v242 + v244) - v88) * a11;
              unsigned int v247 = v293;
              do
              {
                BOOL result = v247 << v69;
                unsigned int v248 = v247 + 1;
                unsigned int v249 = a9;
                if (v302 >= (v247 + 1) << v69) {
                  unsigned int v249 = v295;
                }
                int v250 = 1 << v69;
                if (v302 < v248 << v69) {
                  int v250 = v297;
                }
                if (result >= v15) {
                  unsigned int v249 = v250;
                }
                if (v249)
                {
                  int v251 = 0;
                  uint64_t v252 = (v247 + v245) * a12[3] * *((unsigned __int8 *)a12 + 9);
                  if (result >= v15) {
                    int v253 = 0;
                  }
                  else {
                    int v253 = v291;
                  }
                  BOOL result = (uint64_t)&v246[2 * (v253 + ((v247 - v293) << v69) - v291)];
                  do
                  {
                    unsigned int v254 = v249;
                    v255 = (_WORD *)result;
                    do
                    {
                      *v255++ = *(_WORD *)(v18 + v252);
                      --v254;
                    }
                    while (v254);
                    result += a11;
                    ++v251;
                  }
                  while (v251 != v243);
                }
                unsigned int v247 = v248;
              }
              while (v248 != v299);
            }
            unsigned int v237 = v239;
          }
          while (v239 != v279);
        }
      }
    }
  }
  return result;
}

uint64_t agxsTwiddleAddressZ<AGXSConverterPassThru<false,1ul,1u,(TwiddleOrder)1>>(uint64_t result, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned int a9, unsigned int a10, uint64_t a11, unsigned __int16 *a12, unsigned int *a13)
{
  if (!result) {
    return result;
  }
  uint64_t v13 = a2;
  if (!a2) {
    return result;
  }
  uint64_t v17 = result;
  uint64_t v19 = a11;
  uint64_t v18 = a12;
  unsigned int v20 = a10;
  if (!a12)
  {
    unsigned int v25 = 32 - __clz(a5 - 1);
    if (a5 >= 2) {
      unsigned int v26 = v25;
    }
    else {
      unsigned int v26 = 0;
    }
    unsigned int v27 = 32 - __clz(a6 - 1);
    if (a6 >= 2) {
      unsigned int v28 = v27;
    }
    else {
      unsigned int v28 = 0;
    }
    if (v28 | v26)
    {
      unsigned int v29 = 0;
      uint64_t v30 = 0;
      BOOL v31 = v26 != 0;
      BOOL v32 = v28 != 0;
      BOOL v33 = v26 != 0;
      BOOL v34 = v28 != 0;
      int v35 = 1;
      unsigned int v36 = v26;
      unsigned int v37 = v28;
      do
      {
        --v36;
        if (v33) {
          v30 |= (unint64_t)(v35 & ~(-1 << v26)) << v29++;
        }
        else {
          unsigned int v36 = 0;
        }
        --v37;
        if (!v34) {
          unsigned int v37 = 0;
        }
        v35 *= 2;
        unsigned int v29 = (__PAIR64__(v29, v34) - 1) >> 32;
        BOOL v34 = v37 != 0;
        BOOL v33 = v36 != 0;
      }
      while (v37 | v36);
      int v38 = 0;
      uint64_t v39 = 0;
      int v40 = 1;
      BOOL v41 = v26 != 0;
      BOOL v42 = v28 != 0;
      unsigned int v43 = v26;
      unsigned int v44 = v28;
      do
      {
        --v43;
        int v45 = v41;
        if (!v45) {
          unsigned int v43 = 0;
        }
        int v46 = v38 + v45;
        --v44;
        if (v42) {
          v39 |= (unint64_t)(v40 & ~(-1 << v28)) << v46++;
        }
        else {
          unsigned int v44 = 0;
        }
        v40 *= 2;
        int v38 = v46 - 1;
        BOOL v42 = v44 != 0;
        BOOL v41 = v43 != 0;
      }
      while (v44 | v43);
      unsigned int v47 = 0;
      uint64_t v48 = 0;
      BOOL v49 = v26 != 0;
      BOOL v50 = v28 != 0;
      int v51 = 1;
      unsigned int v52 = v26;
      unsigned int v53 = v28;
      do
      {
        --v52;
        if (v49) {
          v48 |= (unint64_t)(v51 & a7) << v47++;
        }
        else {
          unsigned int v52 = 0;
        }
        --v53;
        if (!v50) {
          unsigned int v53 = 0;
        }
        v51 *= 2;
        unsigned int v47 = (__PAIR64__(v47, v50) - 1) >> 32;
        BOOL v50 = v53 != 0;
        BOOL v49 = v52 != 0;
      }
      while (v53 | v52);
      int v54 = 0;
      uint64_t v55 = 0;
      int v56 = 1;
      do
      {
        --v26;
        int v57 = v31;
        if (!v57) {
          unsigned int v26 = 0;
        }
        int v58 = v54 + v57;
        --v28;
        if (v32)
        {
          v55 |= (unint64_t)(v56 & a8) << v58;
          int v59 = v58 + 1;
        }
        else
        {
          unsigned int v28 = 0;
          int v59 = v58;
        }
        v56 *= 2;
        int v54 = v59 - 1;
        BOOL v32 = v28 != 0;
        BOOL v31 = v26 != 0;
        BOOL result = v28 | v26;
      }
      while (result);
      if (!a10) {
        return result;
      }
    }
    else
    {
      uint64_t v48 = 0;
      uint64_t v30 = 0;
      uint64_t v39 = 0;
      uint64_t v55 = 0;
      if (!a10) {
        return result;
      }
    }
    if (a9)
    {
      for (int i = 0; i != a10; ++i)
      {
        uint64_t v228 = 0;
        uint64_t v229 = v48;
        do
        {
          *(unsigned char *)(v13 + v228) = *(unsigned char *)(v55 + v17 + v229);
          uint64_t v229 = (v229 - v30) & v30;
          ++v228;
        }
        while (a9 != v228);
        uint64_t v55 = (v55 - v39) & v39;
        v13 += a11;
      }
    }
    return result;
  }
  unsigned int v262 = a8;
  unsigned int v265 = a7;
  if (*((unsigned char *)a12 + 20))
  {
    BOOL result = agxCalcSparseInputs(a12[3], *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 8), a13[2], a13[3], a13[1], *a13, *((unsigned __int8 *)a12 + 16) - 1 < 2, a7, a8, a9, a10, (uint64_t)v299);
    char v21 = *((unsigned char *)a12 + 13);
    char v22 = *((unsigned char *)a12 + 12);
    if (1 << v21 >= a6 || a5 >> v22)
    {
      unsigned int v144 = a6 >> v21;
      unsigned int v145 = 1 << v22;
      unsigned int v146 = __clz(~(-1 << -(char)__clz(a6 - 1))) - 32;
      if (a6 < 2) {
        unsigned int v146 = 0;
      }
      BOOL v147 = v145 >= a5;
      if (v145 < a5) {
        char v148 = v22 + v21 + v146;
      }
      else {
        char v148 = *((unsigned char *)a12 + 12);
      }
      if (v147) {
        LOBYTE(v149) = *((unsigned char *)a12 + 13);
      }
      else {
        int v149 = -v146;
      }
      if (!v144) {
        char v22 = v148;
      }
      char v256 = v22;
      if (v144) {
        char v24 = *((unsigned char *)a12 + 13);
      }
      else {
        char v24 = v149;
      }
    }
    else
    {
      unsigned int v23 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
      if (a5 < 2) {
        LOBYTE(v23) = 0;
      }
      char v256 = v23;
      char v24 = v22 + v21 - v23;
    }
    unsigned int v151 = v262;
    unsigned int v150 = a10;
    unsigned int v254 = v305;
    if (v305)
    {
      unsigned int v152 = 1 << v24;
      unsigned int v153 = v306;
      int v154 = v303;
      BOOL v285 = v303 != 0;
      int v287 = v304;
      BOOL v283 = v304 != 0;
      int v255 = 1 << v256;
      if (1 << v256 >= a5) {
        unsigned int v155 = a5;
      }
      else {
        unsigned int v155 = 1 << v256;
      }
      if (v152 >= a6) {
        unsigned int v156 = a6;
      }
      else {
        unsigned int v156 = 1 << v24;
      }
      unsigned int v157 = 32 - __clz(v155 - 1);
      if (v155 >= 2) {
        unsigned int v158 = v157;
      }
      else {
        unsigned int v158 = 0;
      }
      unsigned int v159 = 32 - __clz(v156 - 1);
      if (v156 < 2) {
        unsigned int v159 = 0;
      }
      BOOL v291 = v158 != 0;
      unsigned int v293 = v159;
      BOOL v289 = v159 != 0;
      if (v306)
      {
        int v160 = 0;
        unsigned int v253 = a7 >> v256;
        unsigned int v278 = v262 >> v24;
        int v298 = v304 | v303;
        int v296 = v307;
        unsigned int v252 = a9 + a7;
        int v251 = (v255 - 1) & (a9 + a7);
        int v249 = v300;
        int v161 = v302;
        int v295 = v301;
        int v250 = (v255 - 1) & a7;
        int v273 = (v152 - 1) & v262;
        int v275 = (v152 - 1) & (a10 + v262);
        unsigned int v271 = v152 - v273;
        int v162 = ~(-1 << v158);
        int v269 = v159 | v158;
        int v163 = ~(-1 << v159);
        unsigned int v281 = v158;
        int v259 = 1 << v24;
        char v261 = v24;
        unsigned int v258 = v306;
        int v267 = v302;
        do
        {
          int v164 = 0;
          int v165 = v160 + v249;
          unsigned int v166 = (v160 + v253) << v256;
          if (v252 >= (v160 + v253 + 1) << v256) {
            unsigned int v167 = v255 - v250;
          }
          else {
            unsigned int v167 = a9;
          }
          int v168 = 1 << v256;
          if (v252 < (v160 + v253 + 1) << v256) {
            int v168 = v251;
          }
          int v257 = v160;
          if (v166 >= a7) {
            int v169 = v168;
          }
          else {
            int v169 = v167;
          }
          if (v166 >= a7) {
            int v170 = 0;
          }
          else {
            int v170 = v250;
          }
          uint64_t v264 = (v170 + (v160 << v256)) + v13;
          do
          {
            int v171 = v164 + v295;
            if (v296)
            {
              int v172 = v298;
              if (v298)
              {
                int v173 = 0;
                int v172 = 0;
                int v174 = 1;
                BOOL v176 = v285;
                int v175 = v287;
                BOOL v177 = v283;
                int v178 = v154;
                do
                {
                  --v178;
                  if (v176) {
                    v172 |= (v174 & v165) << v173;
                  }
                  else {
                    int v178 = 0;
                  }
                  if (v176) {
                    ++v173;
                  }
                  --v175;
                  if (v177) {
                    v172 |= (v174 & v171) << v173;
                  }
                  else {
                    int v175 = 0;
                  }
                  if (v177) {
                    ++v173;
                  }
                  v174 *= 2;
                  --v173;
                  BOOL v177 = v175 != 0;
                  BOOL v176 = v178 != 0;
                }
                while (v175 | v178);
              }
            }
            else
            {
              int v172 = v298;
              if (v298)
              {
                int v179 = 0;
                int v172 = 0;
                int v180 = 1;
                BOOL v181 = v283;
                BOOL v183 = v285;
                int v182 = v287;
                int v184 = v154;
                do
                {
                  --v182;
                  if (v181) {
                    v172 |= (v180 & v171) << v179;
                  }
                  else {
                    int v182 = 0;
                  }
                  if (v181) {
                    ++v179;
                  }
                  --v184;
                  if (v183) {
                    v172 |= (v180 & v165) << v179;
                  }
                  else {
                    int v184 = 0;
                  }
                  if (v183) {
                    ++v179;
                  }
                  v180 *= 2;
                  --v179;
                  BOOL v183 = v184 != 0;
                  BOOL v181 = v182 != 0;
                }
                while (v184 | v182);
              }
            }
            int v185 = *(_DWORD *)(v17 + 4 * ((v172 + v161) | ((v172 + v161) >> 8 << 9)));
            if (v185 < 0)
            {
              unint64_t v186 = v17 - *((void *)a13 + 3) + ((unint64_t)(v185 & 0x1FFFFFFF) << 14);
              BOOL result = *a13;
              unsigned int v187 = a13[2];
              if (result > v187)
              {
                BOOL result = get_level_offset_within_tail(result, v187, *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 16) - 1 < 2);
                unsigned int v158 = v281;
                unsigned int v153 = v258;
                unsigned int v152 = v259;
                char v24 = v261;
                uint64_t v19 = a11;
                unsigned int v151 = v262;
                unsigned int v150 = a10;
                v186 += result;
              }
              unsigned int v188 = (v164 + v278) << v24;
              unsigned int v189 = v271;
              if (a10 + v262 >= (v164 + v278 + 1) << v24)
              {
                unsigned int v190 = v152;
              }
              else
              {
                unsigned int v189 = v150;
                unsigned int v190 = v275;
              }
              if (v188 >= v151) {
                int v191 = 0;
              }
              else {
                int v191 = v273;
              }
              if (v188 >= v151) {
                unsigned int v189 = v190;
              }
              if (!v269)
              {
                uint64_t v209 = 0;
                uint64_t v193 = 0;
                uint64_t v200 = 0;
                uint64_t v216 = 0;
                int v161 = v267;
                if (!v189) {
                  goto LABEL_190;
                }
LABEL_262:
                if (v169)
                {
                  int v223 = 0;
                  uint64_t v224 = v264 + (v191 + (v164 << v24)) * v19;
                  do
                  {
                    uint64_t v225 = 0;
                    uint64_t v226 = v209;
                    do
                    {
                      BOOL result = *(unsigned __int8 *)(v216 + v186 + v226);
                      *(unsigned char *)(v224 + v225) = result;
                      uint64_t v226 = (v226 - v193) & v193;
                      ++v225;
                    }
                    while (v169 != v225);
                    uint64_t v216 = (v216 - v200) & v200;
                    v224 += v19;
                    ++v223;
                  }
                  while (v223 != v189);
                }
                goto LABEL_190;
              }
              unsigned int v192 = 0;
              uint64_t v193 = 0;
              int v194 = 1;
              BOOL v195 = v289;
              BOOL v196 = v291;
              unsigned int v197 = v158;
              unsigned int v198 = v293;
              do
              {
                --v197;
                if (v196) {
                  v193 |= (unint64_t)(v194 & v162) << v192++;
                }
                else {
                  unsigned int v197 = 0;
                }
                --v198;
                if (!v195) {
                  unsigned int v198 = 0;
                }
                v194 *= 2;
                unsigned int v192 = (__PAIR64__(v192, v195) - 1) >> 32;
                BOOL v195 = v198 != 0;
                BOOL v196 = v197 != 0;
              }
              while (v198 | v197);
              int v199 = 0;
              uint64_t v200 = 0;
              int v201 = 1;
              BOOL v202 = v289;
              BOOL v203 = v291;
              unsigned int v204 = v158;
              unsigned int v205 = v293;
              do
              {
                --v204;
                int v206 = v203;
                if (!v206) {
                  unsigned int v204 = 0;
                }
                int v207 = v199 + v206;
                --v205;
                if (v202) {
                  v200 |= (unint64_t)(v201 & v163) << v207++;
                }
                else {
                  unsigned int v205 = 0;
                }
                v201 *= 2;
                int v199 = v207 - 1;
                BOOL v202 = v205 != 0;
                BOOL v203 = v204 != 0;
              }
              while (v205 | v204);
              unsigned int v208 = 0;
              uint64_t v209 = 0;
              int v210 = 1;
              BOOL v212 = v289;
              BOOL v211 = v291;
              unsigned int v213 = v158;
              unsigned int v214 = v293;
              do
              {
                --v213;
                if (v211) {
                  v209 |= (unint64_t)(v210 & v170) << v208++;
                }
                else {
                  unsigned int v213 = 0;
                }
                --v214;
                if (!v212) {
                  unsigned int v214 = 0;
                }
                v210 *= 2;
                unsigned int v208 = (__PAIR64__(v208, v212) - 1) >> 32;
                BOOL v212 = v214 != 0;
                BOOL v211 = v213 != 0;
              }
              while (v214 | v213);
              int v215 = 0;
              uint64_t v216 = 0;
              int v217 = 1;
              LOBYTE(result) = v289;
              BOOL v218 = v291;
              unsigned int v219 = v158;
              unsigned int v220 = v293;
              do
              {
                --v219;
                int v221 = v218;
                if (!v221) {
                  unsigned int v219 = 0;
                }
                int v222 = v215 + v221;
                --v220;
                if (result) {
                  v216 |= (unint64_t)(v217 & v191) << v222++;
                }
                else {
                  unsigned int v220 = 0;
                }
                v217 *= 2;
                int v215 = v222 - 1;
                BOOL result = v220 != 0;
                BOOL v218 = v219 != 0;
              }
              while (v220 | v219);
              unsigned int v158 = v281;
              int v161 = v267;
              if (v189) {
                goto LABEL_262;
              }
            }
LABEL_190:
            ++v164;
          }
          while (v153 > (unsigned __int16)v164);
          int v160 = v257 + 1;
          a7 = v265;
        }
        while (v254 > (unsigned __int16)(v257 + 1));
      }
    }
  }
  else
  {
    int v60 = *((unsigned __int8 *)a12 + 13);
    int v61 = *((unsigned __int8 *)a12 + 12);
    unsigned int v62 = 1 << v60;
    unsigned int v63 = a5 >> v61;
    unsigned int v64 = __clz(~(-1 << -__clz(a6 - 1))) - 32;
    if (a6 < 2) {
      unsigned int v64 = 0;
    }
    char v65 = v61 + v60;
    BOOL result = v61 + v60 + v64;
    if (a6 >> v60) {
      BOOL v66 = 1;
    }
    else {
      BOOL v66 = 1 << v61 >= a5;
    }
    if (v66)
    {
      LOBYTE(v67) = *((unsigned char *)a12 + 13);
    }
    else
    {
      LOBYTE(v61) = v61 + v60 + v64;
      int v67 = -v64;
    }
    unsigned int v68 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
    if (a5 < 2) {
      LOBYTE(v68) = 0;
    }
    char v69 = v65 - v68;
    if (v62 >= a6 || v63 != 0)
    {
      LOBYTE(v68) = v61;
      char v69 = v67;
    }
    int v71 = 1 << v69;
    char v72 = *((unsigned char *)a12 + 15);
    unsigned int v73 = 1 << v72;
    if (v72) {
      BOOL v74 = v73 > a3;
    }
    else {
      BOOL v74 = 1;
    }
    BOOL v75 = v74 || v73 > a4;
    int v76 = (~(-1 << v72) + a3) & (-1 << v72);
    if (v75) {
      int v77 = a3;
    }
    else {
      int v77 = v76;
    }
    unsigned int v277 = a10 + a8;
    unsigned int v279 = 1 << v69;
    int v78 = v71 - 1;
    unsigned int v270 = a8 >> v69;
    unsigned int v276 = (v71 - 1 + a10 + a8) >> v69;
    if (a8 >> v69 < v276)
    {
      BOOL result = a7 >> v68;
      int v79 = (1 << v68) - 1;
      unsigned int v297 = a9 + a7;
      if (1 << v68 >= a5) {
        unsigned int v80 = a5;
      }
      else {
        unsigned int v80 = 1 << v68;
      }
      unsigned int v81 = 1 << v69;
      if (v279 >= a6) {
        unsigned int v81 = a6;
      }
      unsigned int v82 = 32 - __clz(v80 - 1);
      if (v80 >= 2) {
        unsigned int v83 = v82;
      }
      else {
        unsigned int v83 = 0;
      }
      unsigned int v84 = 32 - __clz(v81 - 1);
      if (v81 >= 2) {
        unsigned int v85 = v84;
      }
      else {
        unsigned int v85 = 0;
      }
      unsigned int v288 = a7 >> v68;
      unsigned int v294 = (v79 + a9 + a7) >> v68;
      if (result < v294)
      {
        unsigned int v268 = (v77 + ~(-1 << v68)) >> v68;
        uint64_t v86 = v78 & a8;
        int v292 = v79 & v297;
        int v290 = (1 << v68) - (v79 & a7);
        int v274 = v78 & v277;
        unsigned int v272 = v279 - v86;
        int v286 = v79 & a7;
        uint64_t v266 = a2 - (v79 & a7);
        if (v85 | v83)
        {
          unsigned int v87 = a8 >> v69;
          char v263 = v69;
          uint64_t v260 = v78 & a8;
          do
          {
            unsigned int v88 = v87 << v69;
            unsigned int v89 = v87 - v270;
            int v284 = v87 * v268;
            unsigned int v280 = v87 + 1;
            BOOL v90 = v277 >= (v87 + 1) << v69;
            unsigned int v91 = v279;
            if (!v90) {
              unsigned int v91 = v274;
            }
            unsigned int v92 = v272;
            if (!v90) {
              unsigned int v92 = v20;
            }
            unsigned int v93 = v89 << v69;
            if (v88 >= a8) {
              BOOL result = 0;
            }
            else {
              BOOL result = v86;
            }
            if (v88 >= a8) {
              unsigned int v94 = v91;
            }
            else {
              unsigned int v94 = v92;
            }
            uint64_t v282 = v266 + (result + v93 - v86) * a11;
            unsigned int v95 = v288;
            do
            {
              unsigned int v96 = 0;
              uint64_t v97 = 0;
              unsigned int v98 = v95 << v68;
              unsigned int v99 = v95 - v288;
              unsigned int v100 = v95 + v284;
              unsigned int v101 = ++v95 << v68;
              if (v98 >= a7) {
                int v102 = 0;
              }
              else {
                int v102 = v286;
              }
              uint64_t v103 = v102 + (v99 << v68);
              uint64_t v104 = v100 * v18[3] * *((unsigned __int8 *)v18 + 9);
              int v105 = 1;
              BOOL v106 = v83 != 0;
              BOOL v107 = v85 != 0;
              unsigned int v108 = v83;
              unsigned int v109 = v85;
              do
              {
                --v108;
                if (v106) {
                  v97 |= (unint64_t)(v105 & ~(-1 << v83)) << v96++;
                }
                else {
                  unsigned int v108 = 0;
                }
                --v109;
                if (!v107) {
                  unsigned int v109 = 0;
                }
                v105 *= 2;
                unsigned int v96 = (__PAIR64__(v96, v107) - 1) >> 32;
                BOOL v107 = v109 != 0;
                BOOL v106 = v108 != 0;
              }
              while (v109 | v108);
              int v110 = 0;
              uint64_t v111 = 0;
              int v112 = 1 << v68;
              if (v297 < v101) {
                int v112 = v292;
              }
              int v113 = 1;
              BOOL v114 = v83 != 0;
              BOOL v115 = v85 != 0;
              unsigned int v116 = v83;
              unsigned int v117 = v85;
              do
              {
                --v116;
                int v118 = v114;
                if (!v118) {
                  unsigned int v116 = 0;
                }
                int v119 = v110 + v118;
                if (v115) {
                  --v117;
                }
                else {
                  unsigned int v117 = 0;
                }
                if (v115) {
                  v111 |= (unint64_t)(v113 & ~(-1 << v85)) << v119++;
                }
                v113 *= 2;
                int v110 = v119 - 1;
                BOOL v115 = v117 != 0;
                BOOL v114 = v116 != 0;
              }
              while (v117 | v116);
              unsigned int v120 = 0;
              uint64_t v121 = 0;
              if (v297 >= v101) {
                int v122 = v290;
              }
              else {
                int v122 = a9;
              }
              uint64_t v123 = v282 + v103;
              int v124 = 1;
              BOOL v125 = v83 != 0;
              BOOL v126 = v85 != 0;
              unsigned int v127 = v83;
              unsigned int v128 = v85;
              do
              {
                --v127;
                if (v125)
                {
                  v121 |= (unint64_t)(v124 & v102) << v120;
                  unsigned int v129 = v120 + 1;
                }
                else
                {
                  unsigned int v127 = 0;
                  unsigned int v129 = v120;
                }
                if (v126) {
                  --v128;
                }
                else {
                  unsigned int v128 = 0;
                }
                v124 *= 2;
                unsigned int v120 = (__PAIR64__(v129, v126) - 1) >> 32;
                BOOL v126 = v128 != 0;
                BOOL v125 = v127 != 0;
              }
              while (v128 | v127);
              int v130 = 0;
              unint64_t v131 = 0;
              int v132 = 1;
              BOOL v133 = v83 != 0;
              BOOL v134 = v85 != 0;
              unsigned int v135 = v83;
              unsigned int v136 = v85;
              do
              {
                int v137 = v133;
                if (v137) {
                  --v135;
                }
                else {
                  unsigned int v135 = 0;
                }
                int v138 = v130 + v137;
                unint64_t v139 = ((unint64_t)(v132 & result) << (v130 + v137)) | v131;
                if (v134) {
                  --v136;
                }
                else {
                  unsigned int v136 = 0;
                }
                if (v134)
                {
                  unint64_t v131 = v139;
                  ++v138;
                }
                v132 *= 2;
                int v130 = v138 - 1;
                BOOL v134 = v136 != 0;
                BOOL v133 = v135 != 0;
              }
              while (v136 | v135);
              a7 = v265;
              if (v98 < v265) {
                int v112 = v122;
              }
              uint64_t v18 = a12;
              if (v94 && v112)
              {
                int v140 = 0;
                uint64_t v141 = v104 + v17;
                do
                {
                  uint64_t v142 = 0;
                  uint64_t v143 = v121;
                  do
                  {
                    *(unsigned char *)(v123 + v142) = *(unsigned char *)(v141 + v131 + v143);
                    uint64_t v143 = (v143 - v97) & v97;
                    ++v142;
                  }
                  while (v112 != v142);
                  unint64_t v131 = (v131 - v111) & v111;
                  v123 += a11;
                  ++v140;
                }
                while (v140 != v94);
              }
            }
            while (v95 != v294);
            unsigned int v87 = v280;
            a8 = v262;
            unsigned int v20 = a10;
            char v69 = v263;
            uint64_t v86 = v260;
          }
          while (v280 != v276);
        }
        else
        {
          unsigned int v230 = a8 >> v69;
          do
          {
            unsigned int v231 = v230 << v69;
            unsigned int v232 = v230 + 1;
            int v233 = v274;
            if (v277 >= (v230 + 1) << v69) {
              int v233 = 1 << v69;
            }
            if (v277 >= v232 << v69) {
              unsigned int v234 = v279 - v86;
            }
            else {
              unsigned int v234 = a10;
            }
            if (v231 >= a8) {
              int v235 = 0;
            }
            else {
              int v235 = v86;
            }
            if (v231 >= a8) {
              int v236 = v233;
            }
            else {
              int v236 = v234;
            }
            if (v236)
            {
              int v237 = (v230 - v270) << v69;
              int v238 = v230 * v268;
              uint64_t v239 = v266 + ((v235 + v237) - v86) * a11;
              LODWORD(result) = a7 >> v68;
              do
              {
                unsigned int v240 = result << v68;
                uint64_t v241 = (result + 1);
                unsigned int v242 = v290;
                if (v297 < v241 << v68) {
                  unsigned int v242 = a9;
                }
                int v243 = 1 << v68;
                if (v297 < v241 << v68) {
                  int v243 = v292;
                }
                if (v240 >= a7) {
                  unsigned int v242 = v243;
                }
                if (v242)
                {
                  int v244 = 0;
                  uint64_t v245 = (result + v238) * a12[3] * *((unsigned __int8 *)a12 + 9);
                  BOOL v66 = v240 >= a7;
                  int v246 = v286;
                  if (v66) {
                    int v246 = 0;
                  }
                  uint64_t v247 = v239 + v246 + ((result - v288) << v68);
                  do
                  {
                    uint64_t v248 = 0;
                    do
                      *(unsigned char *)(v247 + v248++) = *(unsigned char *)(v17 + v245);
                    while (v242 != v248);
                    v247 += a11;
                    ++v244;
                  }
                  while (v244 != v236);
                }
                BOOL result = v241;
              }
              while (v241 != v294);
            }
            unsigned int v230 = v232;
          }
          while (v232 != v276);
        }
      }
    }
  }
  return result;
}

uint64_t agxsTwiddleAddressZ<AGXSConverterPassThru<true,8ul,1u,(TwiddleOrder)1>>(uint64_t result, uint64_t *a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned int a9, unsigned int a10, uint64_t a11, unsigned __int16 *a12, unsigned int *a13)
{
  if (!result) {
    return result;
  }
  uint64_t v13 = a2;
  if (!a2) {
    return result;
  }
  unsigned int v14 = a8;
  uint64_t v17 = result;
  uint64_t v18 = a11;
  uint64_t v19 = a12;
  unsigned int v20 = a10;
  if (!a12)
  {
    unsigned int v25 = 32 - __clz(a5 - 1);
    if (a5 >= 2) {
      unsigned int v26 = v25;
    }
    else {
      unsigned int v26 = 0;
    }
    unsigned int v27 = 32 - __clz(a6 - 1);
    if (a6 >= 2) {
      unsigned int v28 = v27;
    }
    else {
      unsigned int v28 = 0;
    }
    if (v28 | v26)
    {
      unsigned int v29 = 0;
      uint64_t v30 = 0;
      BOOL v31 = v26 != 0;
      BOOL v32 = v28 != 0;
      BOOL v33 = v26 != 0;
      BOOL v34 = v28 != 0;
      int v35 = 1;
      unsigned int v36 = v26;
      unsigned int v37 = v28;
      do
      {
        --v36;
        if (v33) {
          v30 |= (unint64_t)(v35 & ~(-1 << v26)) << v29++;
        }
        else {
          unsigned int v36 = 0;
        }
        --v37;
        if (!v34) {
          unsigned int v37 = 0;
        }
        v35 *= 2;
        unsigned int v29 = (__PAIR64__(v29, v34) - 1) >> 32;
        BOOL v34 = v37 != 0;
        BOOL v33 = v36 != 0;
      }
      while (v37 | v36);
      int v38 = 0;
      uint64_t v39 = 0;
      int v40 = 1;
      BOOL v41 = v26 != 0;
      BOOL v42 = v28 != 0;
      unsigned int v43 = v26;
      unsigned int v44 = v28;
      do
      {
        --v43;
        int v45 = v41;
        if (!v45) {
          unsigned int v43 = 0;
        }
        int v46 = v38 + v45;
        --v44;
        if (v42) {
          v39 |= (unint64_t)(v40 & ~(-1 << v28)) << v46++;
        }
        else {
          unsigned int v44 = 0;
        }
        v40 *= 2;
        int v38 = v46 - 1;
        BOOL v42 = v44 != 0;
        BOOL v41 = v43 != 0;
      }
      while (v44 | v43);
      unsigned int v47 = 0;
      uint64_t v48 = 0;
      BOOL v49 = v26 != 0;
      BOOL v50 = v28 != 0;
      int v51 = 1;
      unsigned int v52 = v26;
      unsigned int v53 = v28;
      do
      {
        --v52;
        if (v49) {
          v48 |= (unint64_t)(v51 & a7) << v47++;
        }
        else {
          unsigned int v52 = 0;
        }
        --v53;
        if (!v50) {
          unsigned int v53 = 0;
        }
        v51 *= 2;
        unsigned int v47 = (__PAIR64__(v47, v50) - 1) >> 32;
        BOOL v50 = v53 != 0;
        BOOL v49 = v52 != 0;
      }
      while (v53 | v52);
      int v54 = 0;
      uint64_t v55 = 0;
      int v56 = 1;
      do
      {
        --v26;
        int v57 = v31;
        if (!v57) {
          unsigned int v26 = 0;
        }
        int v58 = v54 + v57;
        --v28;
        if (v32)
        {
          v55 |= (unint64_t)(v56 & a8) << v58;
          int v59 = v58 + 1;
        }
        else
        {
          unsigned int v28 = 0;
          int v59 = v58;
        }
        v56 *= 2;
        int v54 = v59 - 1;
        BOOL v32 = v28 != 0;
        BOOL v31 = v26 != 0;
        BOOL result = v28 | v26;
      }
      while (result);
      if (!a10) {
        return result;
      }
    }
    else
    {
      uint64_t v48 = 0;
      uint64_t v30 = 0;
      uint64_t v39 = 0;
      uint64_t v55 = 0;
      if (!a10) {
        return result;
      }
    }
    if (a9)
    {
      for (int i = 0; i != a10; ++i)
      {
        unsigned int v234 = a9;
        int v235 = v13;
        uint64_t v236 = v48;
        do
        {
          uint64_t v237 = *v235++;
          *(void *)(v17 + 8 * (v236 + v55)) = v237;
          uint64_t v236 = (v236 - v30) & v30;
          --v234;
        }
        while (v234);
        uint64_t v55 = (v55 - v39) & v39;
        uint64_t v13 = (uint64_t *)((char *)v13 + a11);
      }
    }
    return result;
  }
  if (*((unsigned char *)a12 + 20))
  {
    BOOL result = agxCalcSparseInputs(a12[3], *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 8), a13[2], a13[3], a13[1], *a13, *((unsigned __int8 *)a12 + 16) - 1 < 2, a7, a8, a9, a10, (uint64_t)v306);
    char v21 = *((unsigned char *)a12 + 13);
    char v22 = *((unsigned char *)a12 + 12);
    if (1 << v21 >= a6 || a5 >> v22)
    {
      unsigned int v149 = a6 >> v21;
      unsigned int v150 = 1 << v22;
      unsigned int v151 = __clz(~(-1 << -(char)__clz(a6 - 1))) - 32;
      if (a6 < 2) {
        unsigned int v151 = 0;
      }
      BOOL v152 = v150 >= a5;
      if (v150 < a5) {
        char v153 = v22 + v21 + v151;
      }
      else {
        char v153 = *((unsigned char *)a12 + 12);
      }
      if (v152) {
        LOBYTE(v154) = *((unsigned char *)a12 + 13);
      }
      else {
        int v154 = -v151;
      }
      if (!v149) {
        char v22 = v153;
      }
      char v263 = v22;
      if (v149) {
        char v24 = *((unsigned char *)a12 + 13);
      }
      else {
        char v24 = v154;
      }
    }
    else
    {
      unsigned int v23 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
      if (a5 < 2) {
        LOBYTE(v23) = 0;
      }
      char v263 = v23;
      char v24 = v22 + v21 - v23;
    }
    unsigned int v156 = a8;
    unsigned int v155 = a10;
    unsigned int v261 = v312;
    if (v312)
    {
      unsigned int v157 = 1 << v24;
      unsigned int v158 = v313;
      int v159 = v310;
      int v292 = v311;
      BOOL v288 = v311 != 0;
      BOOL v290 = v310 != 0;
      int v262 = 1 << v263;
      if (1 << v263 >= a5) {
        unsigned int v160 = a5;
      }
      else {
        unsigned int v160 = 1 << v263;
      }
      if (v157 >= a6) {
        unsigned int v161 = a6;
      }
      else {
        unsigned int v161 = 1 << v24;
      }
      unsigned int v162 = 32 - __clz(v160 - 1);
      if (v160 >= 2) {
        unsigned int v163 = v162;
      }
      else {
        unsigned int v163 = 0;
      }
      unsigned int v164 = 32 - __clz(v161 - 1);
      if (v161 < 2) {
        unsigned int v164 = 0;
      }
      BOOL v296 = v163 != 0;
      unsigned int v297 = v164;
      BOOL v294 = v164 != 0;
      if (v313)
      {
        int v165 = 0;
        unsigned int v260 = a7 >> v263;
        unsigned int v282 = a8 >> v24;
        int v305 = v309;
        int v303 = v311 | v310;
        int v301 = v314;
        unsigned int v259 = a9 + a7;
        int v258 = v307;
        int v299 = v308;
        int v277 = (v157 - 1) & a8;
        int v279 = (v157 - 1) & (a10 + a8);
        unsigned int v275 = v157 - v277;
        int v166 = ~(-1 << v163);
        int v273 = v164 | v163;
        int v167 = ~(-1 << v164);
        unsigned int v285 = v163;
        int v267 = 1 << v24;
        char v268 = v24;
        unsigned int v266 = v313;
        do
        {
          int v168 = 0;
          int v169 = v165 + v258;
          unsigned int v170 = (v165 + v260) << v263;
          unsigned int v171 = a9;
          if (v259 >= (v165 + v260 + 1) << v263) {
            unsigned int v171 = v262 - ((v262 - 1) & a7);
          }
          int v172 = 1 << v263;
          if (v259 < (v165 + v260 + 1) << v263) {
            int v172 = (v262 - 1) & (a9 + a7);
          }
          int v265 = v165;
          if (v170 >= a7) {
            int v173 = v172;
          }
          else {
            int v173 = v171;
          }
          if (v170 >= a7) {
            int v174 = 0;
          }
          else {
            int v174 = (v262 - 1) & a7;
          }
          unsigned int v271 = &v13[v174 + (v165 << v263)];
          do
          {
            int v175 = v168 + v299;
            if (v301)
            {
              int v176 = v303;
              if (v303)
              {
                int v177 = 0;
                int v176 = 0;
                int v178 = 1;
                BOOL v179 = v288;
                BOOL v180 = v290;
                int v181 = v159;
                int v182 = v292;
                do
                {
                  --v181;
                  if (v180) {
                    v176 |= (v178 & v169) << v177;
                  }
                  else {
                    int v181 = 0;
                  }
                  if (v180) {
                    ++v177;
                  }
                  --v182;
                  if (v179) {
                    v176 |= (v178 & v175) << v177;
                  }
                  else {
                    int v182 = 0;
                  }
                  if (v179) {
                    ++v177;
                  }
                  v178 *= 2;
                  --v177;
                  BOOL v179 = v182 != 0;
                  BOOL v180 = v181 != 0;
                }
                while (v182 | v181);
              }
            }
            else
            {
              int v176 = v303;
              if (v303)
              {
                int v183 = 0;
                int v176 = 0;
                int v184 = 1;
                BOOL v186 = v288;
                BOOL v185 = v290;
                int v187 = v292;
                int v188 = v159;
                do
                {
                  --v187;
                  if (v186) {
                    v176 |= (v184 & v175) << v183;
                  }
                  else {
                    int v187 = 0;
                  }
                  if (v186) {
                    ++v183;
                  }
                  --v188;
                  if (v185) {
                    v176 |= (v184 & v169) << v183;
                  }
                  else {
                    int v188 = 0;
                  }
                  if (v185) {
                    ++v183;
                  }
                  v184 *= 2;
                  --v183;
                  BOOL v185 = v188 != 0;
                  BOOL v186 = v187 != 0;
                }
                while (v188 | v187);
              }
            }
            int v189 = *(_DWORD *)(v17 + 4 * ((v176 + v305) | ((v176 + v305) >> 8 << 9)));
            if (v189 < 0)
            {
              unint64_t v190 = v17 - *((void *)a13 + 3) + ((unint64_t)(v189 & 0x1FFFFFFF) << 14);
              BOOL result = *a13;
              unsigned int v191 = a13[2];
              if (result > v191)
              {
                BOOL result = get_level_offset_within_tail(result, v191, *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 16) - 1 < 2);
                unsigned int v163 = v285;
                unsigned int v158 = v266;
                unsigned int v157 = v267;
                char v24 = v268;
                uint64_t v18 = a11;
                unsigned int v156 = a8;
                unsigned int v155 = a10;
                v190 += result;
              }
              unsigned int v192 = (v168 + v282) << v24;
              unsigned int v193 = v275;
              if (a10 + a8 >= (v168 + v282 + 1) << v24)
              {
                unsigned int v194 = v157;
              }
              else
              {
                unsigned int v193 = v155;
                unsigned int v194 = v279;
              }
              if (v192 >= v156) {
                int v195 = 0;
              }
              else {
                int v195 = v277;
              }
              if (v192 >= v156) {
                unsigned int v193 = v194;
              }
              if (!v273)
              {
                uint64_t v213 = 0;
                uint64_t v197 = 0;
                uint64_t v204 = 0;
                uint64_t v220 = 0;
                if (!v193) {
                  goto LABEL_192;
                }
LABEL_264:
                if (v173)
                {
                  int v227 = 0;
                  uint64_t v228 = (uint64_t *)((char *)v271 + (v195 + (v168 << v24)) * v18);
                  do
                  {
                    int v229 = v173;
                    unsigned int v230 = v228;
                    uint64_t v231 = v213;
                    do
                    {
                      uint64_t v232 = *v230++;
                      BOOL result = v232;
                      *(void *)(v190 + 8 * (v231 + v220)) = v232;
                      uint64_t v231 = (v231 - v197) & v197;
                      --v229;
                    }
                    while (v229);
                    uint64_t v220 = (v220 - v204) & v204;
                    uint64_t v228 = (uint64_t *)((char *)v228 + v18);
                    ++v227;
                  }
                  while (v227 != v193);
                }
                goto LABEL_192;
              }
              unsigned int v196 = 0;
              uint64_t v197 = 0;
              int v198 = 1;
              BOOL v200 = v296;
              unsigned int v199 = v297;
              BOOL v201 = v294;
              unsigned int v202 = v163;
              do
              {
                --v202;
                if (v200) {
                  v197 |= (unint64_t)(v198 & v166) << v196++;
                }
                else {
                  unsigned int v202 = 0;
                }
                --v199;
                if (!v201) {
                  unsigned int v199 = 0;
                }
                v198 *= 2;
                unsigned int v196 = (__PAIR64__(v196, v201) - 1) >> 32;
                BOOL v201 = v199 != 0;
                BOOL v200 = v202 != 0;
              }
              while (v199 | v202);
              int v203 = 0;
              uint64_t v204 = 0;
              int v205 = 1;
              BOOL v207 = v296;
              unsigned int v206 = v297;
              BOOL v208 = v294;
              unsigned int v209 = v163;
              do
              {
                --v209;
                int v210 = v207;
                if (!v210) {
                  unsigned int v209 = 0;
                }
                int v211 = v203 + v210;
                --v206;
                if (v208) {
                  v204 |= (unint64_t)(v205 & v167) << v211++;
                }
                else {
                  unsigned int v206 = 0;
                }
                v205 *= 2;
                int v203 = v211 - 1;
                BOOL v208 = v206 != 0;
                BOOL v207 = v209 != 0;
              }
              while (v206 | v209);
              unsigned int v212 = 0;
              uint64_t v213 = 0;
              int v214 = 1;
              BOOL v215 = v296;
              unsigned int v216 = v297;
              BOOL v217 = v294;
              unsigned int v218 = v163;
              do
              {
                --v218;
                if (v215) {
                  v213 |= (unint64_t)(v214 & v174) << v212++;
                }
                else {
                  unsigned int v218 = 0;
                }
                --v216;
                if (!v217) {
                  unsigned int v216 = 0;
                }
                v214 *= 2;
                unsigned int v212 = (__PAIR64__(v212, v217) - 1) >> 32;
                BOOL v217 = v216 != 0;
                BOOL v215 = v218 != 0;
              }
              while (v216 | v218);
              int v219 = 0;
              uint64_t v220 = 0;
              int v221 = 1;
              BOOL v222 = v296;
              unsigned int v223 = v297;
              LOBYTE(result) = v294;
              unsigned int v224 = v163;
              do
              {
                --v224;
                int v225 = v222;
                if (!v225) {
                  unsigned int v224 = 0;
                }
                int v226 = v219 + v225;
                --v223;
                if (result) {
                  v220 |= (unint64_t)(v221 & v195) << v226++;
                }
                else {
                  unsigned int v223 = 0;
                }
                v221 *= 2;
                int v219 = v226 - 1;
                BOOL result = v223 != 0;
                BOOL v222 = v224 != 0;
              }
              while (v223 | v224);
              unsigned int v163 = v285;
              if (v193) {
                goto LABEL_264;
              }
            }
LABEL_192:
            ++v168;
          }
          while (v158 > (unsigned __int16)v168);
          int v165 = v265 + 1;
        }
        while (v261 > (unsigned __int16)(v265 + 1));
      }
    }
  }
  else
  {
    int v60 = *((unsigned __int8 *)a12 + 13);
    int v61 = *((unsigned __int8 *)a12 + 12);
    unsigned int v62 = 1 << v60;
    unsigned int v63 = a5 >> v61;
    unsigned int v64 = __clz(~(-1 << -__clz(a6 - 1))) - 32;
    if (a6 < 2) {
      unsigned int v64 = 0;
    }
    char v65 = v61 + v60;
    BOOL result = v61 + v60 + v64;
    if (a6 >> v60) {
      BOOL v66 = 1;
    }
    else {
      BOOL v66 = 1 << v61 >= a5;
    }
    if (v66)
    {
      LOBYTE(v67) = *((unsigned char *)a12 + 13);
    }
    else
    {
      LOBYTE(v61) = v61 + v60 + v64;
      int v67 = -v64;
    }
    unsigned int v68 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
    if (a5 < 2) {
      LOBYTE(v68) = 0;
    }
    if (v62 < a6 && v63 == 0)
    {
      char v70 = v65 - v68;
    }
    else
    {
      LOBYTE(v68) = v61;
      char v70 = v67;
    }
    int v71 = 1 << v70;
    char v72 = *((unsigned char *)a12 + 15);
    unsigned int v73 = 1 << v72;
    if (v72) {
      BOOL v74 = v73 > a3;
    }
    else {
      BOOL v74 = 1;
    }
    BOOL v75 = v74 || v73 > a4;
    int v76 = (~(-1 << v72) + a3) & (-1 << v72);
    if (v75) {
      int v77 = a3;
    }
    else {
      int v77 = v76;
    }
    unsigned int v284 = 1 << v70;
    int v78 = v71 - 1;
    unsigned int v276 = a8 >> v70;
    unsigned int v281 = (v71 - 1 + a10 + a8) >> v70;
    unsigned int v283 = a10 + a8;
    if (a8 >> v70 < v281)
    {
      int v79 = (1 << v68) - 1;
      int v302 = 1 << v68;
      unsigned int v304 = a9 + a7;
      BOOL result = (v79 + a9 + a7) >> v68;
      if (1 << v68 >= a5) {
        unsigned int v80 = a5;
      }
      else {
        unsigned int v80 = 1 << v68;
      }
      unsigned int v81 = 1 << v70;
      if (v284 >= a6) {
        unsigned int v81 = a6;
      }
      unsigned int v82 = 32 - __clz(v80 - 1);
      if (v80 >= 2) {
        unsigned int v83 = v82;
      }
      else {
        unsigned int v83 = 0;
      }
      unsigned int v84 = 32 - __clz(v81 - 1);
      if (v81 >= 2) {
        unsigned int v85 = v84;
      }
      else {
        unsigned int v85 = 0;
      }
      unsigned int v295 = a7 >> v68;
      unsigned int v300 = (v79 + a9 + a7) >> v68;
      if (a7 >> v68 < result)
      {
        unsigned int v274 = (v77 + ~(-1 << v68)) >> v68;
        uint64_t v86 = v78 & a8;
        int v298 = v79 & v304;
        uint64_t v293 = v79 & a7;
        int v280 = v78 & v283;
        unsigned int v278 = v284 - v86;
        if (v85 | v83)
        {
          unsigned int v87 = v276;
          char v272 = v70;
          uint64_t v270 = v78 & v14;
          do
          {
            unsigned int v88 = v87 << v70;
            unsigned int v89 = v87 - v276;
            int v291 = v87 * v274;
            unsigned int v287 = v87 + 1;
            BOOL v90 = v283 >= (v87 + 1) << v70;
            unsigned int v91 = v284;
            if (!v90) {
              unsigned int v91 = v280;
            }
            unsigned int v92 = v278;
            if (!v90) {
              unsigned int v92 = v20;
            }
            int v93 = v89 << v70;
            if (v88 >= v14) {
              unsigned int v94 = 0;
            }
            else {
              unsigned int v94 = v86;
            }
            if (v88 >= v14) {
              BOOL result = v91;
            }
            else {
              BOOL result = v92;
            }
            BOOL v289 = (char *)v13 + (v94 + v93 - v86) * a11;
            unsigned int v95 = a7 >> v68;
            unsigned int v96 = a7;
            do
            {
              unsigned int v97 = 0;
              uint64_t v98 = 0;
              unsigned int v99 = v95 << v68;
              unsigned int v100 = v95 - v295;
              unsigned int v101 = v95 + v291;
              unsigned int v102 = ++v95 << v68;
              if (v99 >= v96) {
                unsigned int v103 = 0;
              }
              else {
                unsigned int v103 = v293;
              }
              uint64_t v104 = v103 + (v100 << v68) - v293;
              uint64_t v105 = v101 * v19[3] * *((unsigned __int8 *)v19 + 9);
              int v106 = 1;
              BOOL v107 = v83 != 0;
              BOOL v108 = v85 != 0;
              unsigned int v109 = v83;
              unsigned int v110 = v85;
              do
              {
                --v109;
                if (v107) {
                  v98 |= (unint64_t)(v106 & ~(-1 << v83)) << v97++;
                }
                else {
                  unsigned int v109 = 0;
                }
                --v110;
                if (!v108) {
                  unsigned int v110 = 0;
                }
                v106 *= 2;
                unsigned int v97 = (__PAIR64__(v97, v108) - 1) >> 32;
                BOOL v108 = v110 != 0;
                BOOL v107 = v109 != 0;
              }
              while (v110 | v109);
              int v111 = 0;
              uint64_t v112 = 0;
              uint64_t v113 = 8 * v104;
              if (v304 >= v102) {
                int v114 = 1 << v68;
              }
              else {
                int v114 = v298;
              }
              int v115 = 1;
              BOOL v116 = v83 != 0;
              BOOL v117 = v85 != 0;
              unsigned int v118 = v83;
              unsigned int v119 = v85;
              do
              {
                int v120 = v116;
                if (v120) {
                  --v118;
                }
                else {
                  unsigned int v118 = 0;
                }
                int v121 = v111 + v120;
                if (v117) {
                  --v119;
                }
                else {
                  unsigned int v119 = 0;
                }
                if (v117) {
                  v112 |= (unint64_t)(v115 & ~(-1 << v85)) << v121++;
                }
                v115 *= 2;
                int v111 = v121 - 1;
                BOOL v117 = v119 != 0;
                BOOL v116 = v118 != 0;
              }
              while (v119 | v118);
              unsigned int v122 = 0;
              uint64_t v123 = 0;
              unsigned int v124 = v302 - v293;
              if (v304 < v102) {
                unsigned int v124 = a9;
              }
              BOOL v125 = &v289[v113];
              int v126 = 1;
              BOOL v127 = v83 != 0;
              BOOL v128 = v85 != 0;
              unsigned int v129 = v83;
              unsigned int v130 = v85;
              do
              {
                --v129;
                if (v127)
                {
                  v123 |= (unint64_t)(v126 & v103) << v122;
                  unsigned int v131 = v122 + 1;
                }
                else
                {
                  unsigned int v129 = 0;
                  unsigned int v131 = v122;
                }
                if (v128) {
                  --v130;
                }
                else {
                  unsigned int v130 = 0;
                }
                v126 *= 2;
                unsigned int v122 = (__PAIR64__(v131, v128) - 1) >> 32;
                BOOL v128 = v130 != 0;
                BOOL v127 = v129 != 0;
              }
              while (v130 | v129);
              int v132 = 0;
              unint64_t v133 = 0;
              int v134 = 1;
              BOOL v135 = v83 != 0;
              BOOL v136 = v85 != 0;
              unsigned int v137 = v83;
              unsigned int v138 = v85;
              do
              {
                int v139 = v135;
                if (v139) {
                  --v137;
                }
                else {
                  unsigned int v137 = 0;
                }
                int v140 = v132 + v139;
                unint64_t v141 = ((unint64_t)(v134 & v94) << (v132 + v139)) | v133;
                if (v136) {
                  --v138;
                }
                else {
                  unsigned int v138 = 0;
                }
                if (v136)
                {
                  unint64_t v133 = v141;
                  ++v140;
                }
                v134 *= 2;
                int v132 = v140 - 1;
                BOOL v136 = v138 != 0;
                BOOL v135 = v137 != 0;
              }
              while (v138 | v137);
              unsigned int v96 = a7;
              if (v99 >= a7) {
                int v142 = v114;
              }
              else {
                int v142 = v124;
              }
              if (result && v142)
              {
                int v143 = 0;
                uint64_t v144 = v105 + v17;
                do
                {
                  int v145 = v142;
                  unsigned int v146 = (uint64_t *)v125;
                  uint64_t v147 = v123;
                  do
                  {
                    uint64_t v148 = *v146++;
                    *(void *)(v144 + 8 * (v147 + v133)) = v148;
                    uint64_t v147 = (v147 - v98) & v98;
                    --v145;
                  }
                  while (v145);
                  unint64_t v133 = (v133 - v112) & v112;
                  v125 += a11;
                  ++v143;
                }
                while (v143 != result);
              }
              uint64_t v19 = a12;
            }
            while (v95 != v300);
            unsigned int v87 = v287;
            uint64_t v13 = a2;
            unsigned int v14 = a8;
            unsigned int v20 = a10;
            char v70 = v272;
            uint64_t v86 = v270;
          }
          while (v287 != v281);
        }
        else
        {
          unsigned int v238 = v276;
          do
          {
            unsigned int v239 = v238 << v70;
            unsigned int v240 = v238 + 1;
            int v241 = v280;
            if (v283 >= (v238 + 1) << v70) {
              int v241 = 1 << v70;
            }
            if (v283 >= v240 << v70) {
              unsigned int v242 = v284 - v86;
            }
            else {
              unsigned int v242 = a10;
            }
            if (v239 >= v14) {
              int v243 = 0;
            }
            else {
              int v243 = v86;
            }
            if (v239 >= v14) {
              int v244 = v241;
            }
            else {
              int v244 = v242;
            }
            if (v244)
            {
              int v245 = (v238 - v276) << v70;
              int v246 = v238 * v274;
              uint64_t v247 = (uint64_t)a2 + ((v243 + v245) - v86) * a11;
              unsigned int v248 = a7 >> v68;
              do
              {
                BOOL result = v248 << v68;
                unsigned int v249 = v248 + 1;
                unsigned int v250 = a9;
                if (v304 >= (v248 + 1) << v68) {
                  unsigned int v250 = v302 - v293;
                }
                int v251 = 1 << v68;
                if (v304 < v249 << v68) {
                  int v251 = v298;
                }
                if (result >= a7) {
                  unsigned int v250 = v251;
                }
                if (v250)
                {
                  int v252 = 0;
                  uint64_t v253 = (v248 + v246) * a12[3] * *((unsigned __int8 *)a12 + 9);
                  if (result >= a7) {
                    int v254 = 0;
                  }
                  else {
                    int v254 = v293;
                  }
                  BOOL result = v247 + 8 * (v254 + ((v248 - v295) << v68) - v293);
                  do
                  {
                    unsigned int v255 = v250;
                    char v256 = (uint64_t *)result;
                    do
                    {
                      uint64_t v257 = *v256++;
                      *(void *)(v17 + v253) = v257;
                      --v255;
                    }
                    while (v255);
                    result += a11;
                    ++v252;
                  }
                  while (v252 != v244);
                }
                unsigned int v248 = v249;
              }
              while (v249 != v300);
            }
            unsigned int v238 = v240;
          }
          while (v240 != v281);
        }
      }
    }
  }
  return result;
}

uint64_t agxsTwiddleAddressZ<AGXSConverterPassThru<true,4ul,1u,(TwiddleOrder)1>>(uint64_t result, int *a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned int a9, unsigned int a10, uint64_t a11, unsigned __int16 *a12, unsigned int *a13)
{
  if (!result) {
    return result;
  }
  uint64_t v13 = a2;
  if (!a2) {
    return result;
  }
  unsigned int v14 = a8;
  uint64_t v17 = result;
  uint64_t v18 = a11;
  uint64_t v19 = a12;
  unsigned int v20 = a10;
  if (!a12)
  {
    unsigned int v25 = 32 - __clz(a5 - 1);
    if (a5 >= 2) {
      unsigned int v26 = v25;
    }
    else {
      unsigned int v26 = 0;
    }
    unsigned int v27 = 32 - __clz(a6 - 1);
    if (a6 >= 2) {
      unsigned int v28 = v27;
    }
    else {
      unsigned int v28 = 0;
    }
    if (v28 | v26)
    {
      unsigned int v29 = 0;
      uint64_t v30 = 0;
      BOOL v31 = v26 != 0;
      BOOL v32 = v28 != 0;
      BOOL v33 = v26 != 0;
      BOOL v34 = v28 != 0;
      int v35 = 1;
      unsigned int v36 = v26;
      unsigned int v37 = v28;
      do
      {
        --v36;
        if (v33) {
          v30 |= (unint64_t)(v35 & ~(-1 << v26)) << v29++;
        }
        else {
          unsigned int v36 = 0;
        }
        --v37;
        if (!v34) {
          unsigned int v37 = 0;
        }
        v35 *= 2;
        unsigned int v29 = (__PAIR64__(v29, v34) - 1) >> 32;
        BOOL v34 = v37 != 0;
        BOOL v33 = v36 != 0;
      }
      while (v37 | v36);
      int v38 = 0;
      uint64_t v39 = 0;
      int v40 = 1;
      BOOL v41 = v26 != 0;
      BOOL v42 = v28 != 0;
      unsigned int v43 = v26;
      unsigned int v44 = v28;
      do
      {
        --v43;
        int v45 = v41;
        if (!v45) {
          unsigned int v43 = 0;
        }
        int v46 = v38 + v45;
        --v44;
        if (v42) {
          v39 |= (unint64_t)(v40 & ~(-1 << v28)) << v46++;
        }
        else {
          unsigned int v44 = 0;
        }
        v40 *= 2;
        int v38 = v46 - 1;
        BOOL v42 = v44 != 0;
        BOOL v41 = v43 != 0;
      }
      while (v44 | v43);
      unsigned int v47 = 0;
      uint64_t v48 = 0;
      BOOL v49 = v26 != 0;
      BOOL v50 = v28 != 0;
      int v51 = 1;
      unsigned int v52 = v26;
      unsigned int v53 = v28;
      do
      {
        --v52;
        if (v49) {
          v48 |= (unint64_t)(v51 & a7) << v47++;
        }
        else {
          unsigned int v52 = 0;
        }
        --v53;
        if (!v50) {
          unsigned int v53 = 0;
        }
        v51 *= 2;
        unsigned int v47 = (__PAIR64__(v47, v50) - 1) >> 32;
        BOOL v50 = v53 != 0;
        BOOL v49 = v52 != 0;
      }
      while (v53 | v52);
      int v54 = 0;
      uint64_t v55 = 0;
      int v56 = 1;
      do
      {
        --v26;
        int v57 = v31;
        if (!v57) {
          unsigned int v26 = 0;
        }
        int v58 = v54 + v57;
        --v28;
        if (v32)
        {
          v55 |= (unint64_t)(v56 & a8) << v58;
          int v59 = v58 + 1;
        }
        else
        {
          unsigned int v28 = 0;
          int v59 = v58;
        }
        v56 *= 2;
        int v54 = v59 - 1;
        BOOL v32 = v28 != 0;
        BOOL v31 = v26 != 0;
        BOOL result = v28 | v26;
      }
      while (result);
      if (!a10) {
        return result;
      }
    }
    else
    {
      uint64_t v48 = 0;
      uint64_t v30 = 0;
      uint64_t v39 = 0;
      uint64_t v55 = 0;
      if (!a10) {
        return result;
      }
    }
    if (a9)
    {
      for (int i = 0; i != a10; ++i)
      {
        unsigned int v234 = a9;
        int v235 = v13;
        uint64_t v236 = v48;
        do
        {
          int v237 = *v235++;
          *(_DWORD *)(v17 + 4 * (v236 + v55)) = v237;
          uint64_t v236 = (v236 - v30) & v30;
          --v234;
        }
        while (v234);
        uint64_t v55 = (v55 - v39) & v39;
        uint64_t v13 = (int *)((char *)v13 + a11);
      }
    }
    return result;
  }
  if (*((unsigned char *)a12 + 20))
  {
    BOOL result = agxCalcSparseInputs(a12[3], *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 8), a13[2], a13[3], a13[1], *a13, *((unsigned __int8 *)a12 + 16) - 1 < 2, a7, a8, a9, a10, (uint64_t)v306);
    char v21 = *((unsigned char *)a12 + 13);
    char v22 = *((unsigned char *)a12 + 12);
    if (1 << v21 >= a6 || a5 >> v22)
    {
      unsigned int v149 = a6 >> v21;
      unsigned int v150 = 1 << v22;
      unsigned int v151 = __clz(~(-1 << -(char)__clz(a6 - 1))) - 32;
      if (a6 < 2) {
        unsigned int v151 = 0;
      }
      BOOL v152 = v150 >= a5;
      if (v150 < a5) {
        char v153 = v22 + v21 + v151;
      }
      else {
        char v153 = *((unsigned char *)a12 + 12);
      }
      if (v152) {
        LOBYTE(v154) = *((unsigned char *)a12 + 13);
      }
      else {
        int v154 = -v151;
      }
      if (!v149) {
        char v22 = v153;
      }
      char v263 = v22;
      if (v149) {
        char v24 = *((unsigned char *)a12 + 13);
      }
      else {
        char v24 = v154;
      }
    }
    else
    {
      unsigned int v23 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
      if (a5 < 2) {
        LOBYTE(v23) = 0;
      }
      char v263 = v23;
      char v24 = v22 + v21 - v23;
    }
    unsigned int v156 = a8;
    unsigned int v155 = a10;
    unsigned int v261 = v312;
    if (v312)
    {
      unsigned int v157 = 1 << v24;
      unsigned int v158 = v313;
      int v159 = v310;
      int v292 = v311;
      BOOL v288 = v311 != 0;
      BOOL v290 = v310 != 0;
      int v262 = 1 << v263;
      if (1 << v263 >= a5) {
        unsigned int v160 = a5;
      }
      else {
        unsigned int v160 = 1 << v263;
      }
      if (v157 >= a6) {
        unsigned int v161 = a6;
      }
      else {
        unsigned int v161 = 1 << v24;
      }
      unsigned int v162 = 32 - __clz(v160 - 1);
      if (v160 >= 2) {
        unsigned int v163 = v162;
      }
      else {
        unsigned int v163 = 0;
      }
      unsigned int v164 = 32 - __clz(v161 - 1);
      if (v161 < 2) {
        unsigned int v164 = 0;
      }
      BOOL v296 = v163 != 0;
      unsigned int v297 = v164;
      BOOL v294 = v164 != 0;
      if (v313)
      {
        int v165 = 0;
        unsigned int v260 = a7 >> v263;
        unsigned int v282 = a8 >> v24;
        int v305 = v309;
        int v303 = v311 | v310;
        int v301 = v314;
        unsigned int v259 = a9 + a7;
        int v258 = v307;
        int v299 = v308;
        int v277 = (v157 - 1) & a8;
        int v279 = (v157 - 1) & (a10 + a8);
        unsigned int v275 = v157 - v277;
        int v166 = ~(-1 << v163);
        int v273 = v164 | v163;
        int v167 = ~(-1 << v164);
        unsigned int v285 = v163;
        int v267 = 1 << v24;
        char v268 = v24;
        unsigned int v266 = v313;
        do
        {
          int v168 = 0;
          int v169 = v165 + v258;
          unsigned int v170 = (v165 + v260) << v263;
          unsigned int v171 = a9;
          if (v259 >= (v165 + v260 + 1) << v263) {
            unsigned int v171 = v262 - ((v262 - 1) & a7);
          }
          int v172 = 1 << v263;
          if (v259 < (v165 + v260 + 1) << v263) {
            int v172 = (v262 - 1) & (a9 + a7);
          }
          int v265 = v165;
          if (v170 >= a7) {
            int v173 = v172;
          }
          else {
            int v173 = v171;
          }
          if (v170 >= a7) {
            int v174 = 0;
          }
          else {
            int v174 = (v262 - 1) & a7;
          }
          unsigned int v271 = &v13[v174 + (v165 << v263)];
          do
          {
            int v175 = v168 + v299;
            if (v301)
            {
              int v176 = v303;
              if (v303)
              {
                int v177 = 0;
                int v176 = 0;
                int v178 = 1;
                BOOL v179 = v288;
                BOOL v180 = v290;
                int v181 = v159;
                int v182 = v292;
                do
                {
                  --v181;
                  if (v180) {
                    v176 |= (v178 & v169) << v177;
                  }
                  else {
                    int v181 = 0;
                  }
                  if (v180) {
                    ++v177;
                  }
                  --v182;
                  if (v179) {
                    v176 |= (v178 & v175) << v177;
                  }
                  else {
                    int v182 = 0;
                  }
                  if (v179) {
                    ++v177;
                  }
                  v178 *= 2;
                  --v177;
                  BOOL v179 = v182 != 0;
                  BOOL v180 = v181 != 0;
                }
                while (v182 | v181);
              }
            }
            else
            {
              int v176 = v303;
              if (v303)
              {
                int v183 = 0;
                int v176 = 0;
                int v184 = 1;
                BOOL v186 = v288;
                BOOL v185 = v290;
                int v187 = v292;
                int v188 = v159;
                do
                {
                  --v187;
                  if (v186) {
                    v176 |= (v184 & v175) << v183;
                  }
                  else {
                    int v187 = 0;
                  }
                  if (v186) {
                    ++v183;
                  }
                  --v188;
                  if (v185) {
                    v176 |= (v184 & v169) << v183;
                  }
                  else {
                    int v188 = 0;
                  }
                  if (v185) {
                    ++v183;
                  }
                  v184 *= 2;
                  --v183;
                  BOOL v185 = v188 != 0;
                  BOOL v186 = v187 != 0;
                }
                while (v188 | v187);
              }
            }
            int v189 = *(_DWORD *)(v17 + 4 * ((v176 + v305) | ((v176 + v305) >> 8 << 9)));
            if (v189 < 0)
            {
              unint64_t v190 = v17 - *((void *)a13 + 3) + ((unint64_t)(v189 & 0x1FFFFFFF) << 14);
              BOOL result = *a13;
              unsigned int v191 = a13[2];
              if (result > v191)
              {
                BOOL result = get_level_offset_within_tail(result, v191, *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 16) - 1 < 2);
                unsigned int v163 = v285;
                unsigned int v158 = v266;
                unsigned int v157 = v267;
                char v24 = v268;
                uint64_t v18 = a11;
                unsigned int v156 = a8;
                unsigned int v155 = a10;
                v190 += result;
              }
              unsigned int v192 = (v168 + v282) << v24;
              unsigned int v193 = v275;
              if (a10 + a8 >= (v168 + v282 + 1) << v24)
              {
                unsigned int v194 = v157;
              }
              else
              {
                unsigned int v193 = v155;
                unsigned int v194 = v279;
              }
              if (v192 >= v156) {
                int v195 = 0;
              }
              else {
                int v195 = v277;
              }
              if (v192 >= v156) {
                unsigned int v193 = v194;
              }
              if (!v273)
              {
                uint64_t v213 = 0;
                uint64_t v197 = 0;
                uint64_t v204 = 0;
                uint64_t v220 = 0;
                if (!v193) {
                  goto LABEL_192;
                }
LABEL_264:
                if (v173)
                {
                  int v227 = 0;
                  uint64_t v228 = (unsigned int *)((char *)v271 + (v195 + (v168 << v24)) * v18);
                  do
                  {
                    int v229 = v173;
                    unsigned int v230 = v228;
                    uint64_t v231 = v213;
                    do
                    {
                      unsigned int v232 = *v230++;
                      BOOL result = v232;
                      *(_DWORD *)(v190 + 4 * (v231 + v220)) = v232;
                      uint64_t v231 = (v231 - v197) & v197;
                      --v229;
                    }
                    while (v229);
                    uint64_t v220 = (v220 - v204) & v204;
                    uint64_t v228 = (unsigned int *)((char *)v228 + v18);
                    ++v227;
                  }
                  while (v227 != v193);
                }
                goto LABEL_192;
              }
              unsigned int v196 = 0;
              uint64_t v197 = 0;
              int v198 = 1;
              BOOL v200 = v296;
              unsigned int v199 = v297;
              BOOL v201 = v294;
              unsigned int v202 = v163;
              do
              {
                --v202;
                if (v200) {
                  v197 |= (unint64_t)(v198 & v166) << v196++;
                }
                else {
                  unsigned int v202 = 0;
                }
                --v199;
                if (!v201) {
                  unsigned int v199 = 0;
                }
                v198 *= 2;
                unsigned int v196 = (__PAIR64__(v196, v201) - 1) >> 32;
                BOOL v201 = v199 != 0;
                BOOL v200 = v202 != 0;
              }
              while (v199 | v202);
              int v203 = 0;
              uint64_t v204 = 0;
              int v205 = 1;
              BOOL v207 = v296;
              unsigned int v206 = v297;
              BOOL v208 = v294;
              unsigned int v209 = v163;
              do
              {
                --v209;
                int v210 = v207;
                if (!v210) {
                  unsigned int v209 = 0;
                }
                int v211 = v203 + v210;
                --v206;
                if (v208) {
                  v204 |= (unint64_t)(v205 & v167) << v211++;
                }
                else {
                  unsigned int v206 = 0;
                }
                v205 *= 2;
                int v203 = v211 - 1;
                BOOL v208 = v206 != 0;
                BOOL v207 = v209 != 0;
              }
              while (v206 | v209);
              unsigned int v212 = 0;
              uint64_t v213 = 0;
              int v214 = 1;
              BOOL v215 = v296;
              unsigned int v216 = v297;
              BOOL v217 = v294;
              unsigned int v218 = v163;
              do
              {
                --v218;
                if (v215) {
                  v213 |= (unint64_t)(v214 & v174) << v212++;
                }
                else {
                  unsigned int v218 = 0;
                }
                --v216;
                if (!v217) {
                  unsigned int v216 = 0;
                }
                v214 *= 2;
                unsigned int v212 = (__PAIR64__(v212, v217) - 1) >> 32;
                BOOL v217 = v216 != 0;
                BOOL v215 = v218 != 0;
              }
              while (v216 | v218);
              int v219 = 0;
              uint64_t v220 = 0;
              int v221 = 1;
              BOOL v222 = v296;
              unsigned int v223 = v297;
              LOBYTE(result) = v294;
              unsigned int v224 = v163;
              do
              {
                --v224;
                int v225 = v222;
                if (!v225) {
                  unsigned int v224 = 0;
                }
                int v226 = v219 + v225;
                --v223;
                if (result) {
                  v220 |= (unint64_t)(v221 & v195) << v226++;
                }
                else {
                  unsigned int v223 = 0;
                }
                v221 *= 2;
                int v219 = v226 - 1;
                BOOL result = v223 != 0;
                BOOL v222 = v224 != 0;
              }
              while (v223 | v224);
              unsigned int v163 = v285;
              if (v193) {
                goto LABEL_264;
              }
            }
LABEL_192:
            ++v168;
          }
          while (v158 > (unsigned __int16)v168);
          int v165 = v265 + 1;
        }
        while (v261 > (unsigned __int16)(v265 + 1));
      }
    }
  }
  else
  {
    int v60 = *((unsigned __int8 *)a12 + 13);
    int v61 = *((unsigned __int8 *)a12 + 12);
    unsigned int v62 = 1 << v60;
    unsigned int v63 = a5 >> v61;
    unsigned int v64 = __clz(~(-1 << -__clz(a6 - 1))) - 32;
    if (a6 < 2) {
      unsigned int v64 = 0;
    }
    char v65 = v61 + v60;
    BOOL result = v61 + v60 + v64;
    if (a6 >> v60) {
      BOOL v66 = 1;
    }
    else {
      BOOL v66 = 1 << v61 >= a5;
    }
    if (v66)
    {
      LOBYTE(v67) = *((unsigned char *)a12 + 13);
    }
    else
    {
      LOBYTE(v61) = v61 + v60 + v64;
      int v67 = -v64;
    }
    unsigned int v68 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
    if (a5 < 2) {
      LOBYTE(v68) = 0;
    }
    if (v62 < a6 && v63 == 0)
    {
      char v70 = v65 - v68;
    }
    else
    {
      LOBYTE(v68) = v61;
      char v70 = v67;
    }
    int v71 = 1 << v70;
    char v72 = *((unsigned char *)a12 + 15);
    unsigned int v73 = 1 << v72;
    if (v72) {
      BOOL v74 = v73 > a3;
    }
    else {
      BOOL v74 = 1;
    }
    BOOL v75 = v74 || v73 > a4;
    int v76 = (~(-1 << v72) + a3) & (-1 << v72);
    if (v75) {
      int v77 = a3;
    }
    else {
      int v77 = v76;
    }
    unsigned int v284 = 1 << v70;
    int v78 = v71 - 1;
    unsigned int v276 = a8 >> v70;
    unsigned int v281 = (v71 - 1 + a10 + a8) >> v70;
    unsigned int v283 = a10 + a8;
    if (a8 >> v70 < v281)
    {
      int v79 = (1 << v68) - 1;
      int v302 = 1 << v68;
      unsigned int v304 = a9 + a7;
      BOOL result = (v79 + a9 + a7) >> v68;
      if (1 << v68 >= a5) {
        unsigned int v80 = a5;
      }
      else {
        unsigned int v80 = 1 << v68;
      }
      unsigned int v81 = 1 << v70;
      if (v284 >= a6) {
        unsigned int v81 = a6;
      }
      unsigned int v82 = 32 - __clz(v80 - 1);
      if (v80 >= 2) {
        unsigned int v83 = v82;
      }
      else {
        unsigned int v83 = 0;
      }
      unsigned int v84 = 32 - __clz(v81 - 1);
      if (v81 >= 2) {
        unsigned int v85 = v84;
      }
      else {
        unsigned int v85 = 0;
      }
      unsigned int v295 = a7 >> v68;
      unsigned int v300 = (v79 + a9 + a7) >> v68;
      if (a7 >> v68 < result)
      {
        unsigned int v274 = (v77 + ~(-1 << v68)) >> v68;
        uint64_t v86 = v78 & a8;
        int v298 = v79 & v304;
        uint64_t v293 = v79 & a7;
        int v280 = v78 & v283;
        unsigned int v278 = v284 - v86;
        if (v85 | v83)
        {
          unsigned int v87 = v276;
          char v272 = v70;
          uint64_t v270 = v78 & v14;
          do
          {
            unsigned int v88 = v87 << v70;
            unsigned int v89 = v87 - v276;
            int v291 = v87 * v274;
            unsigned int v287 = v87 + 1;
            BOOL v90 = v283 >= (v87 + 1) << v70;
            unsigned int v91 = v284;
            if (!v90) {
              unsigned int v91 = v280;
            }
            unsigned int v92 = v278;
            if (!v90) {
              unsigned int v92 = v20;
            }
            int v93 = v89 << v70;
            if (v88 >= v14) {
              unsigned int v94 = 0;
            }
            else {
              unsigned int v94 = v86;
            }
            if (v88 >= v14) {
              BOOL result = v91;
            }
            else {
              BOOL result = v92;
            }
            BOOL v289 = (char *)v13 + (v94 + v93 - v86) * a11;
            unsigned int v95 = a7 >> v68;
            unsigned int v96 = a7;
            do
            {
              unsigned int v97 = 0;
              uint64_t v98 = 0;
              unsigned int v99 = v95 << v68;
              unsigned int v100 = v95 - v295;
              unsigned int v101 = v95 + v291;
              unsigned int v102 = ++v95 << v68;
              if (v99 >= v96) {
                unsigned int v103 = 0;
              }
              else {
                unsigned int v103 = v293;
              }
              uint64_t v104 = v103 + (v100 << v68) - v293;
              uint64_t v105 = v101 * v19[3] * *((unsigned __int8 *)v19 + 9);
              int v106 = 1;
              BOOL v107 = v83 != 0;
              BOOL v108 = v85 != 0;
              unsigned int v109 = v83;
              unsigned int v110 = v85;
              do
              {
                --v109;
                if (v107) {
                  v98 |= (unint64_t)(v106 & ~(-1 << v83)) << v97++;
                }
                else {
                  unsigned int v109 = 0;
                }
                --v110;
                if (!v108) {
                  unsigned int v110 = 0;
                }
                v106 *= 2;
                unsigned int v97 = (__PAIR64__(v97, v108) - 1) >> 32;
                BOOL v108 = v110 != 0;
                BOOL v107 = v109 != 0;
              }
              while (v110 | v109);
              int v111 = 0;
              uint64_t v112 = 0;
              uint64_t v113 = 4 * v104;
              if (v304 >= v102) {
                int v114 = 1 << v68;
              }
              else {
                int v114 = v298;
              }
              int v115 = 1;
              BOOL v116 = v83 != 0;
              BOOL v117 = v85 != 0;
              unsigned int v118 = v83;
              unsigned int v119 = v85;
              do
              {
                int v120 = v116;
                if (v120) {
                  --v118;
                }
                else {
                  unsigned int v118 = 0;
                }
                int v121 = v111 + v120;
                if (v117) {
                  --v119;
                }
                else {
                  unsigned int v119 = 0;
                }
                if (v117) {
                  v112 |= (unint64_t)(v115 & ~(-1 << v85)) << v121++;
                }
                v115 *= 2;
                int v111 = v121 - 1;
                BOOL v117 = v119 != 0;
                BOOL v116 = v118 != 0;
              }
              while (v119 | v118);
              unsigned int v122 = 0;
              uint64_t v123 = 0;
              unsigned int v124 = v302 - v293;
              if (v304 < v102) {
                unsigned int v124 = a9;
              }
              BOOL v125 = &v289[v113];
              int v126 = 1;
              BOOL v127 = v83 != 0;
              BOOL v128 = v85 != 0;
              unsigned int v129 = v83;
              unsigned int v130 = v85;
              do
              {
                --v129;
                if (v127)
                {
                  v123 |= (unint64_t)(v126 & v103) << v122;
                  unsigned int v131 = v122 + 1;
                }
                else
                {
                  unsigned int v129 = 0;
                  unsigned int v131 = v122;
                }
                if (v128) {
                  --v130;
                }
                else {
                  unsigned int v130 = 0;
                }
                v126 *= 2;
                unsigned int v122 = (__PAIR64__(v131, v128) - 1) >> 32;
                BOOL v128 = v130 != 0;
                BOOL v127 = v129 != 0;
              }
              while (v130 | v129);
              int v132 = 0;
              unint64_t v133 = 0;
              int v134 = 1;
              BOOL v135 = v83 != 0;
              BOOL v136 = v85 != 0;
              unsigned int v137 = v83;
              unsigned int v138 = v85;
              do
              {
                int v139 = v135;
                if (v139) {
                  --v137;
                }
                else {
                  unsigned int v137 = 0;
                }
                int v140 = v132 + v139;
                unint64_t v141 = ((unint64_t)(v134 & v94) << (v132 + v139)) | v133;
                if (v136) {
                  --v138;
                }
                else {
                  unsigned int v138 = 0;
                }
                if (v136)
                {
                  unint64_t v133 = v141;
                  ++v140;
                }
                v134 *= 2;
                int v132 = v140 - 1;
                BOOL v136 = v138 != 0;
                BOOL v135 = v137 != 0;
              }
              while (v138 | v137);
              unsigned int v96 = a7;
              if (v99 >= a7) {
                int v142 = v114;
              }
              else {
                int v142 = v124;
              }
              if (result && v142)
              {
                int v143 = 0;
                uint64_t v144 = v105 + v17;
                do
                {
                  int v145 = v142;
                  unsigned int v146 = (int *)v125;
                  uint64_t v147 = v123;
                  do
                  {
                    int v148 = *v146++;
                    *(_DWORD *)(v144 + 4 * (v147 + v133)) = v148;
                    uint64_t v147 = (v147 - v98) & v98;
                    --v145;
                  }
                  while (v145);
                  unint64_t v133 = (v133 - v112) & v112;
                  v125 += a11;
                  ++v143;
                }
                while (v143 != result);
              }
              uint64_t v19 = a12;
            }
            while (v95 != v300);
            unsigned int v87 = v287;
            uint64_t v13 = a2;
            unsigned int v14 = a8;
            unsigned int v20 = a10;
            char v70 = v272;
            uint64_t v86 = v270;
          }
          while (v287 != v281);
        }
        else
        {
          unsigned int v238 = v276;
          do
          {
            unsigned int v239 = v238 << v70;
            unsigned int v240 = v238 + 1;
            int v241 = v280;
            if (v283 >= (v238 + 1) << v70) {
              int v241 = 1 << v70;
            }
            if (v283 >= v240 << v70) {
              unsigned int v242 = v284 - v86;
            }
            else {
              unsigned int v242 = a10;
            }
            if (v239 >= v14) {
              int v243 = 0;
            }
            else {
              int v243 = v86;
            }
            if (v239 >= v14) {
              int v244 = v241;
            }
            else {
              int v244 = v242;
            }
            if (v244)
            {
              int v245 = (v238 - v276) << v70;
              int v246 = v238 * v274;
              uint64_t v247 = (uint64_t)a2 + ((v243 + v245) - v86) * a11;
              unsigned int v248 = a7 >> v68;
              do
              {
                BOOL result = v248 << v68;
                unsigned int v249 = v248 + 1;
                unsigned int v250 = a9;
                if (v304 >= (v248 + 1) << v68) {
                  unsigned int v250 = v302 - v293;
                }
                int v251 = 1 << v68;
                if (v304 < v249 << v68) {
                  int v251 = v298;
                }
                if (result >= a7) {
                  unsigned int v250 = v251;
                }
                if (v250)
                {
                  int v252 = 0;
                  uint64_t v253 = (v248 + v246) * a12[3] * *((unsigned __int8 *)a12 + 9);
                  if (result >= a7) {
                    int v254 = 0;
                  }
                  else {
                    int v254 = v293;
                  }
                  BOOL result = v247 + 4 * (v254 + ((v248 - v295) << v68) - v293);
                  do
                  {
                    unsigned int v255 = v250;
                    char v256 = (int *)result;
                    do
                    {
                      int v257 = *v256++;
                      *(_DWORD *)(v17 + v253) = v257;
                      --v255;
                    }
                    while (v255);
                    result += a11;
                    ++v252;
                  }
                  while (v252 != v244);
                }
                unsigned int v248 = v249;
              }
              while (v249 != v300);
            }
            unsigned int v238 = v240;
          }
          while (v240 != v281);
        }
      }
    }
  }
  return result;
}

uint64_t agxsTwiddleAddressZ<AGXSConverterPassThru<true,2ul,1u,(TwiddleOrder)1>>(uint64_t result, __int16 *a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned int a9, unsigned int a10, uint64_t a11, unsigned __int16 *a12, unsigned int *a13)
{
  if (!result) {
    return result;
  }
  uint64_t v13 = a2;
  if (!a2) {
    return result;
  }
  unsigned int v14 = a8;
  uint64_t v17 = result;
  uint64_t v18 = a11;
  uint64_t v19 = a12;
  unsigned int v20 = a10;
  if (!a12)
  {
    unsigned int v25 = 32 - __clz(a5 - 1);
    if (a5 >= 2) {
      unsigned int v26 = v25;
    }
    else {
      unsigned int v26 = 0;
    }
    unsigned int v27 = 32 - __clz(a6 - 1);
    if (a6 >= 2) {
      unsigned int v28 = v27;
    }
    else {
      unsigned int v28 = 0;
    }
    if (v28 | v26)
    {
      unsigned int v29 = 0;
      uint64_t v30 = 0;
      BOOL v31 = v26 != 0;
      BOOL v32 = v28 != 0;
      BOOL v33 = v26 != 0;
      BOOL v34 = v28 != 0;
      int v35 = 1;
      unsigned int v36 = v26;
      unsigned int v37 = v28;
      do
      {
        --v36;
        if (v33) {
          v30 |= (unint64_t)(v35 & ~(-1 << v26)) << v29++;
        }
        else {
          unsigned int v36 = 0;
        }
        --v37;
        if (!v34) {
          unsigned int v37 = 0;
        }
        v35 *= 2;
        unsigned int v29 = (__PAIR64__(v29, v34) - 1) >> 32;
        BOOL v34 = v37 != 0;
        BOOL v33 = v36 != 0;
      }
      while (v37 | v36);
      int v38 = 0;
      uint64_t v39 = 0;
      int v40 = 1;
      BOOL v41 = v26 != 0;
      BOOL v42 = v28 != 0;
      unsigned int v43 = v26;
      unsigned int v44 = v28;
      do
      {
        --v43;
        int v45 = v41;
        if (!v45) {
          unsigned int v43 = 0;
        }
        int v46 = v38 + v45;
        --v44;
        if (v42) {
          v39 |= (unint64_t)(v40 & ~(-1 << v28)) << v46++;
        }
        else {
          unsigned int v44 = 0;
        }
        v40 *= 2;
        int v38 = v46 - 1;
        BOOL v42 = v44 != 0;
        BOOL v41 = v43 != 0;
      }
      while (v44 | v43);
      unsigned int v47 = 0;
      uint64_t v48 = 0;
      BOOL v49 = v26 != 0;
      BOOL v50 = v28 != 0;
      int v51 = 1;
      unsigned int v52 = v26;
      unsigned int v53 = v28;
      do
      {
        --v52;
        if (v49) {
          v48 |= (unint64_t)(v51 & a7) << v47++;
        }
        else {
          unsigned int v52 = 0;
        }
        --v53;
        if (!v50) {
          unsigned int v53 = 0;
        }
        v51 *= 2;
        unsigned int v47 = (__PAIR64__(v47, v50) - 1) >> 32;
        BOOL v50 = v53 != 0;
        BOOL v49 = v52 != 0;
      }
      while (v53 | v52);
      int v54 = 0;
      uint64_t v55 = 0;
      int v56 = 1;
      do
      {
        --v26;
        int v57 = v31;
        if (!v57) {
          unsigned int v26 = 0;
        }
        int v58 = v54 + v57;
        --v28;
        if (v32)
        {
          v55 |= (unint64_t)(v56 & a8) << v58;
          int v59 = v58 + 1;
        }
        else
        {
          unsigned int v28 = 0;
          int v59 = v58;
        }
        v56 *= 2;
        int v54 = v59 - 1;
        BOOL v32 = v28 != 0;
        BOOL v31 = v26 != 0;
        BOOL result = v28 | v26;
      }
      while (result);
      if (!a10) {
        return result;
      }
    }
    else
    {
      uint64_t v48 = 0;
      uint64_t v30 = 0;
      uint64_t v39 = 0;
      uint64_t v55 = 0;
      if (!a10) {
        return result;
      }
    }
    if (a9)
    {
      for (int i = 0; i != a10; ++i)
      {
        unsigned int v234 = a9;
        int v235 = v13;
        uint64_t v236 = v48;
        do
        {
          __int16 v237 = *v235++;
          *(_WORD *)(v17 + 2 * (v236 + v55)) = v237;
          uint64_t v236 = (v236 - v30) & v30;
          --v234;
        }
        while (v234);
        uint64_t v55 = (v55 - v39) & v39;
        uint64_t v13 = (__int16 *)((char *)v13 + a11);
      }
    }
    return result;
  }
  if (*((unsigned char *)a12 + 20))
  {
    BOOL result = agxCalcSparseInputs(a12[3], *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 8), a13[2], a13[3], a13[1], *a13, *((unsigned __int8 *)a12 + 16) - 1 < 2, a7, a8, a9, a10, (uint64_t)v306);
    char v21 = *((unsigned char *)a12 + 13);
    char v22 = *((unsigned char *)a12 + 12);
    if (1 << v21 >= a6 || a5 >> v22)
    {
      unsigned int v149 = a6 >> v21;
      unsigned int v150 = 1 << v22;
      unsigned int v151 = __clz(~(-1 << -(char)__clz(a6 - 1))) - 32;
      if (a6 < 2) {
        unsigned int v151 = 0;
      }
      BOOL v152 = v150 >= a5;
      if (v150 < a5) {
        char v153 = v22 + v21 + v151;
      }
      else {
        char v153 = *((unsigned char *)a12 + 12);
      }
      if (v152) {
        LOBYTE(v154) = *((unsigned char *)a12 + 13);
      }
      else {
        int v154 = -v151;
      }
      if (!v149) {
        char v22 = v153;
      }
      char v263 = v22;
      if (v149) {
        char v24 = *((unsigned char *)a12 + 13);
      }
      else {
        char v24 = v154;
      }
    }
    else
    {
      unsigned int v23 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
      if (a5 < 2) {
        LOBYTE(v23) = 0;
      }
      char v263 = v23;
      char v24 = v22 + v21 - v23;
    }
    unsigned int v156 = a8;
    unsigned int v155 = a10;
    unsigned int v261 = v312;
    if (v312)
    {
      unsigned int v157 = 1 << v24;
      unsigned int v158 = v313;
      int v159 = v310;
      int v292 = v311;
      BOOL v288 = v311 != 0;
      BOOL v290 = v310 != 0;
      int v262 = 1 << v263;
      if (1 << v263 >= a5) {
        unsigned int v160 = a5;
      }
      else {
        unsigned int v160 = 1 << v263;
      }
      if (v157 >= a6) {
        unsigned int v161 = a6;
      }
      else {
        unsigned int v161 = 1 << v24;
      }
      unsigned int v162 = 32 - __clz(v160 - 1);
      if (v160 >= 2) {
        unsigned int v163 = v162;
      }
      else {
        unsigned int v163 = 0;
      }
      unsigned int v164 = 32 - __clz(v161 - 1);
      if (v161 < 2) {
        unsigned int v164 = 0;
      }
      BOOL v296 = v163 != 0;
      unsigned int v297 = v164;
      BOOL v294 = v164 != 0;
      if (v313)
      {
        int v165 = 0;
        unsigned int v260 = a7 >> v263;
        unsigned int v282 = a8 >> v24;
        int v305 = v309;
        int v303 = v311 | v310;
        int v301 = v314;
        unsigned int v259 = a9 + a7;
        int v258 = v307;
        int v299 = v308;
        int v277 = (v157 - 1) & a8;
        int v279 = (v157 - 1) & (a10 + a8);
        unsigned int v275 = v157 - v277;
        int v166 = ~(-1 << v163);
        int v273 = v164 | v163;
        int v167 = ~(-1 << v164);
        unsigned int v285 = v163;
        int v267 = 1 << v24;
        char v268 = v24;
        unsigned int v266 = v313;
        do
        {
          int v168 = 0;
          int v169 = v165 + v258;
          unsigned int v170 = (v165 + v260) << v263;
          unsigned int v171 = a9;
          if (v259 >= (v165 + v260 + 1) << v263) {
            unsigned int v171 = v262 - ((v262 - 1) & a7);
          }
          int v172 = 1 << v263;
          if (v259 < (v165 + v260 + 1) << v263) {
            int v172 = (v262 - 1) & (a9 + a7);
          }
          int v265 = v165;
          if (v170 >= a7) {
            int v173 = v172;
          }
          else {
            int v173 = v171;
          }
          if (v170 >= a7) {
            int v174 = 0;
          }
          else {
            int v174 = (v262 - 1) & a7;
          }
          unsigned int v271 = &v13[v174 + (v165 << v263)];
          do
          {
            int v175 = v168 + v299;
            if (v301)
            {
              int v176 = v303;
              if (v303)
              {
                int v177 = 0;
                int v176 = 0;
                int v178 = 1;
                BOOL v179 = v288;
                BOOL v180 = v290;
                int v181 = v159;
                int v182 = v292;
                do
                {
                  --v181;
                  if (v180) {
                    v176 |= (v178 & v169) << v177;
                  }
                  else {
                    int v181 = 0;
                  }
                  if (v180) {
                    ++v177;
                  }
                  --v182;
                  if (v179) {
                    v176 |= (v178 & v175) << v177;
                  }
                  else {
                    int v182 = 0;
                  }
                  if (v179) {
                    ++v177;
                  }
                  v178 *= 2;
                  --v177;
                  BOOL v179 = v182 != 0;
                  BOOL v180 = v181 != 0;
                }
                while (v182 | v181);
              }
            }
            else
            {
              int v176 = v303;
              if (v303)
              {
                int v183 = 0;
                int v176 = 0;
                int v184 = 1;
                BOOL v186 = v288;
                BOOL v185 = v290;
                int v187 = v292;
                int v188 = v159;
                do
                {
                  --v187;
                  if (v186) {
                    v176 |= (v184 & v175) << v183;
                  }
                  else {
                    int v187 = 0;
                  }
                  if (v186) {
                    ++v183;
                  }
                  --v188;
                  if (v185) {
                    v176 |= (v184 & v169) << v183;
                  }
                  else {
                    int v188 = 0;
                  }
                  if (v185) {
                    ++v183;
                  }
                  v184 *= 2;
                  --v183;
                  BOOL v185 = v188 != 0;
                  BOOL v186 = v187 != 0;
                }
                while (v188 | v187);
              }
            }
            int v189 = *(_DWORD *)(v17 + 4 * ((v176 + v305) | ((v176 + v305) >> 8 << 9)));
            if (v189 < 0)
            {
              unint64_t v190 = v17 - *((void *)a13 + 3) + ((unint64_t)(v189 & 0x1FFFFFFF) << 14);
              BOOL result = *a13;
              unsigned int v191 = a13[2];
              if (result > v191)
              {
                BOOL result = get_level_offset_within_tail(result, v191, *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 16) - 1 < 2);
                unsigned int v163 = v285;
                unsigned int v158 = v266;
                unsigned int v157 = v267;
                char v24 = v268;
                uint64_t v18 = a11;
                unsigned int v156 = a8;
                unsigned int v155 = a10;
                v190 += result;
              }
              unsigned int v192 = (v168 + v282) << v24;
              unsigned int v193 = v275;
              if (a10 + a8 >= (v168 + v282 + 1) << v24)
              {
                unsigned int v194 = v157;
              }
              else
              {
                unsigned int v193 = v155;
                unsigned int v194 = v279;
              }
              if (v192 >= v156) {
                int v195 = 0;
              }
              else {
                int v195 = v277;
              }
              if (v192 >= v156) {
                unsigned int v193 = v194;
              }
              if (!v273)
              {
                uint64_t v213 = 0;
                uint64_t v197 = 0;
                uint64_t v204 = 0;
                uint64_t v220 = 0;
                if (!v193) {
                  goto LABEL_192;
                }
LABEL_264:
                if (v173)
                {
                  int v227 = 0;
                  uint64_t v228 = (unsigned __int16 *)((char *)v271 + (v195 + (v168 << v24)) * v18);
                  do
                  {
                    int v229 = v173;
                    unsigned int v230 = v228;
                    uint64_t v231 = v213;
                    do
                    {
                      unsigned int v232 = *v230++;
                      BOOL result = v232;
                      *(_WORD *)(v190 + 2 * (v231 + v220)) = v232;
                      uint64_t v231 = (v231 - v197) & v197;
                      --v229;
                    }
                    while (v229);
                    uint64_t v220 = (v220 - v204) & v204;
                    uint64_t v228 = (unsigned __int16 *)((char *)v228 + v18);
                    ++v227;
                  }
                  while (v227 != v193);
                }
                goto LABEL_192;
              }
              unsigned int v196 = 0;
              uint64_t v197 = 0;
              int v198 = 1;
              BOOL v200 = v296;
              unsigned int v199 = v297;
              BOOL v201 = v294;
              unsigned int v202 = v163;
              do
              {
                --v202;
                if (v200) {
                  v197 |= (unint64_t)(v198 & v166) << v196++;
                }
                else {
                  unsigned int v202 = 0;
                }
                --v199;
                if (!v201) {
                  unsigned int v199 = 0;
                }
                v198 *= 2;
                unsigned int v196 = (__PAIR64__(v196, v201) - 1) >> 32;
                BOOL v201 = v199 != 0;
                BOOL v200 = v202 != 0;
              }
              while (v199 | v202);
              int v203 = 0;
              uint64_t v204 = 0;
              int v205 = 1;
              BOOL v207 = v296;
              unsigned int v206 = v297;
              BOOL v208 = v294;
              unsigned int v209 = v163;
              do
              {
                --v209;
                int v210 = v207;
                if (!v210) {
                  unsigned int v209 = 0;
                }
                int v211 = v203 + v210;
                --v206;
                if (v208) {
                  v204 |= (unint64_t)(v205 & v167) << v211++;
                }
                else {
                  unsigned int v206 = 0;
                }
                v205 *= 2;
                int v203 = v211 - 1;
                BOOL v208 = v206 != 0;
                BOOL v207 = v209 != 0;
              }
              while (v206 | v209);
              unsigned int v212 = 0;
              uint64_t v213 = 0;
              int v214 = 1;
              BOOL v215 = v296;
              unsigned int v216 = v297;
              BOOL v217 = v294;
              unsigned int v218 = v163;
              do
              {
                --v218;
                if (v215) {
                  v213 |= (unint64_t)(v214 & v174) << v212++;
                }
                else {
                  unsigned int v218 = 0;
                }
                --v216;
                if (!v217) {
                  unsigned int v216 = 0;
                }
                v214 *= 2;
                unsigned int v212 = (__PAIR64__(v212, v217) - 1) >> 32;
                BOOL v217 = v216 != 0;
                BOOL v215 = v218 != 0;
              }
              while (v216 | v218);
              int v219 = 0;
              uint64_t v220 = 0;
              int v221 = 1;
              BOOL v222 = v296;
              unsigned int v223 = v297;
              LOBYTE(result) = v294;
              unsigned int v224 = v163;
              do
              {
                --v224;
                int v225 = v222;
                if (!v225) {
                  unsigned int v224 = 0;
                }
                int v226 = v219 + v225;
                --v223;
                if (result) {
                  v220 |= (unint64_t)(v221 & v195) << v226++;
                }
                else {
                  unsigned int v223 = 0;
                }
                v221 *= 2;
                int v219 = v226 - 1;
                BOOL result = v223 != 0;
                BOOL v222 = v224 != 0;
              }
              while (v223 | v224);
              unsigned int v163 = v285;
              if (v193) {
                goto LABEL_264;
              }
            }
LABEL_192:
            ++v168;
          }
          while (v158 > (unsigned __int16)v168);
          int v165 = v265 + 1;
        }
        while (v261 > (unsigned __int16)(v265 + 1));
      }
    }
  }
  else
  {
    int v60 = *((unsigned __int8 *)a12 + 13);
    int v61 = *((unsigned __int8 *)a12 + 12);
    unsigned int v62 = 1 << v60;
    unsigned int v63 = a5 >> v61;
    unsigned int v64 = __clz(~(-1 << -__clz(a6 - 1))) - 32;
    if (a6 < 2) {
      unsigned int v64 = 0;
    }
    char v65 = v61 + v60;
    BOOL result = v61 + v60 + v64;
    if (a6 >> v60) {
      BOOL v66 = 1;
    }
    else {
      BOOL v66 = 1 << v61 >= a5;
    }
    if (v66)
    {
      LOBYTE(v67) = *((unsigned char *)a12 + 13);
    }
    else
    {
      LOBYTE(v61) = v61 + v60 + v64;
      int v67 = -v64;
    }
    unsigned int v68 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
    if (a5 < 2) {
      LOBYTE(v68) = 0;
    }
    if (v62 < a6 && v63 == 0)
    {
      char v70 = v65 - v68;
    }
    else
    {
      LOBYTE(v68) = v61;
      char v70 = v67;
    }
    int v71 = 1 << v70;
    char v72 = *((unsigned char *)a12 + 15);
    unsigned int v73 = 1 << v72;
    if (v72) {
      BOOL v74 = v73 > a3;
    }
    else {
      BOOL v74 = 1;
    }
    BOOL v75 = v74 || v73 > a4;
    int v76 = (~(-1 << v72) + a3) & (-1 << v72);
    if (v75) {
      int v77 = a3;
    }
    else {
      int v77 = v76;
    }
    unsigned int v284 = 1 << v70;
    int v78 = v71 - 1;
    unsigned int v276 = a8 >> v70;
    unsigned int v281 = (v71 - 1 + a10 + a8) >> v70;
    unsigned int v283 = a10 + a8;
    if (a8 >> v70 < v281)
    {
      int v79 = (1 << v68) - 1;
      int v302 = 1 << v68;
      unsigned int v304 = a9 + a7;
      BOOL result = (v79 + a9 + a7) >> v68;
      if (1 << v68 >= a5) {
        unsigned int v80 = a5;
      }
      else {
        unsigned int v80 = 1 << v68;
      }
      unsigned int v81 = 1 << v70;
      if (v284 >= a6) {
        unsigned int v81 = a6;
      }
      unsigned int v82 = 32 - __clz(v80 - 1);
      if (v80 >= 2) {
        unsigned int v83 = v82;
      }
      else {
        unsigned int v83 = 0;
      }
      unsigned int v84 = 32 - __clz(v81 - 1);
      if (v81 >= 2) {
        unsigned int v85 = v84;
      }
      else {
        unsigned int v85 = 0;
      }
      unsigned int v295 = a7 >> v68;
      unsigned int v300 = (v79 + a9 + a7) >> v68;
      if (a7 >> v68 < result)
      {
        unsigned int v274 = (v77 + ~(-1 << v68)) >> v68;
        uint64_t v86 = v78 & a8;
        int v298 = v79 & v304;
        uint64_t v293 = v79 & a7;
        int v280 = v78 & v283;
        unsigned int v278 = v284 - v86;
        if (v85 | v83)
        {
          unsigned int v87 = v276;
          char v272 = v70;
          uint64_t v270 = v78 & v14;
          do
          {
            unsigned int v88 = v87 << v70;
            unsigned int v89 = v87 - v276;
            int v291 = v87 * v274;
            unsigned int v287 = v87 + 1;
            BOOL v90 = v283 >= (v87 + 1) << v70;
            unsigned int v91 = v284;
            if (!v90) {
              unsigned int v91 = v280;
            }
            unsigned int v92 = v278;
            if (!v90) {
              unsigned int v92 = v20;
            }
            int v93 = v89 << v70;
            if (v88 >= v14) {
              unsigned int v94 = 0;
            }
            else {
              unsigned int v94 = v86;
            }
            if (v88 >= v14) {
              BOOL result = v91;
            }
            else {
              BOOL result = v92;
            }
            BOOL v289 = (char *)v13 + (v94 + v93 - v86) * a11;
            unsigned int v95 = a7 >> v68;
            unsigned int v96 = a7;
            do
            {
              unsigned int v97 = 0;
              uint64_t v98 = 0;
              unsigned int v99 = v95 << v68;
              unsigned int v100 = v95 - v295;
              unsigned int v101 = v95 + v291;
              unsigned int v102 = ++v95 << v68;
              if (v99 >= v96) {
                unsigned int v103 = 0;
              }
              else {
                unsigned int v103 = v293;
              }
              uint64_t v104 = v103 + (v100 << v68) - v293;
              uint64_t v105 = v101 * v19[3] * *((unsigned __int8 *)v19 + 9);
              int v106 = 1;
              BOOL v107 = v83 != 0;
              BOOL v108 = v85 != 0;
              unsigned int v109 = v83;
              unsigned int v110 = v85;
              do
              {
                --v109;
                if (v107) {
                  v98 |= (unint64_t)(v106 & ~(-1 << v83)) << v97++;
                }
                else {
                  unsigned int v109 = 0;
                }
                --v110;
                if (!v108) {
                  unsigned int v110 = 0;
                }
                v106 *= 2;
                unsigned int v97 = (__PAIR64__(v97, v108) - 1) >> 32;
                BOOL v108 = v110 != 0;
                BOOL v107 = v109 != 0;
              }
              while (v110 | v109);
              int v111 = 0;
              uint64_t v112 = 0;
              uint64_t v113 = 2 * v104;
              if (v304 >= v102) {
                int v114 = 1 << v68;
              }
              else {
                int v114 = v298;
              }
              int v115 = 1;
              BOOL v116 = v83 != 0;
              BOOL v117 = v85 != 0;
              unsigned int v118 = v83;
              unsigned int v119 = v85;
              do
              {
                int v120 = v116;
                if (v120) {
                  --v118;
                }
                else {
                  unsigned int v118 = 0;
                }
                int v121 = v111 + v120;
                if (v117) {
                  --v119;
                }
                else {
                  unsigned int v119 = 0;
                }
                if (v117) {
                  v112 |= (unint64_t)(v115 & ~(-1 << v85)) << v121++;
                }
                v115 *= 2;
                int v111 = v121 - 1;
                BOOL v117 = v119 != 0;
                BOOL v116 = v118 != 0;
              }
              while (v119 | v118);
              unsigned int v122 = 0;
              uint64_t v123 = 0;
              unsigned int v124 = v302 - v293;
              if (v304 < v102) {
                unsigned int v124 = a9;
              }
              BOOL v125 = &v289[v113];
              int v126 = 1;
              BOOL v127 = v83 != 0;
              BOOL v128 = v85 != 0;
              unsigned int v129 = v83;
              unsigned int v130 = v85;
              do
              {
                --v129;
                if (v127)
                {
                  v123 |= (unint64_t)(v126 & v103) << v122;
                  unsigned int v131 = v122 + 1;
                }
                else
                {
                  unsigned int v129 = 0;
                  unsigned int v131 = v122;
                }
                if (v128) {
                  --v130;
                }
                else {
                  unsigned int v130 = 0;
                }
                v126 *= 2;
                unsigned int v122 = (__PAIR64__(v131, v128) - 1) >> 32;
                BOOL v128 = v130 != 0;
                BOOL v127 = v129 != 0;
              }
              while (v130 | v129);
              int v132 = 0;
              unint64_t v133 = 0;
              int v134 = 1;
              BOOL v135 = v83 != 0;
              BOOL v136 = v85 != 0;
              unsigned int v137 = v83;
              unsigned int v138 = v85;
              do
              {
                int v139 = v135;
                if (v139) {
                  --v137;
                }
                else {
                  unsigned int v137 = 0;
                }
                int v140 = v132 + v139;
                unint64_t v141 = ((unint64_t)(v134 & v94) << (v132 + v139)) | v133;
                if (v136) {
                  --v138;
                }
                else {
                  unsigned int v138 = 0;
                }
                if (v136)
                {
                  unint64_t v133 = v141;
                  ++v140;
                }
                v134 *= 2;
                int v132 = v140 - 1;
                BOOL v136 = v138 != 0;
                BOOL v135 = v137 != 0;
              }
              while (v138 | v137);
              unsigned int v96 = a7;
              if (v99 >= a7) {
                int v142 = v114;
              }
              else {
                int v142 = v124;
              }
              if (result && v142)
              {
                int v143 = 0;
                uint64_t v144 = v105 + v17;
                do
                {
                  int v145 = v142;
                  unsigned int v146 = (__int16 *)v125;
                  uint64_t v147 = v123;
                  do
                  {
                    __int16 v148 = *v146++;
                    *(_WORD *)(v144 + 2 * (v147 + v133)) = v148;
                    uint64_t v147 = (v147 - v98) & v98;
                    --v145;
                  }
                  while (v145);
                  unint64_t v133 = (v133 - v112) & v112;
                  v125 += a11;
                  ++v143;
                }
                while (v143 != result);
              }
              uint64_t v19 = a12;
            }
            while (v95 != v300);
            unsigned int v87 = v287;
            uint64_t v13 = a2;
            unsigned int v14 = a8;
            unsigned int v20 = a10;
            char v70 = v272;
            uint64_t v86 = v270;
          }
          while (v287 != v281);
        }
        else
        {
          unsigned int v238 = v276;
          do
          {
            unsigned int v239 = v238 << v70;
            unsigned int v240 = v238 + 1;
            int v241 = v280;
            if (v283 >= (v238 + 1) << v70) {
              int v241 = 1 << v70;
            }
            if (v283 >= v240 << v70) {
              unsigned int v242 = v284 - v86;
            }
            else {
              unsigned int v242 = a10;
            }
            if (v239 >= v14) {
              int v243 = 0;
            }
            else {
              int v243 = v86;
            }
            if (v239 >= v14) {
              int v244 = v241;
            }
            else {
              int v244 = v242;
            }
            if (v244)
            {
              int v245 = (v238 - v276) << v70;
              int v246 = v238 * v274;
              uint64_t v247 = (uint64_t)a2 + ((v243 + v245) - v86) * a11;
              unsigned int v248 = a7 >> v68;
              do
              {
                BOOL result = v248 << v68;
                unsigned int v249 = v248 + 1;
                unsigned int v250 = a9;
                if (v304 >= (v248 + 1) << v68) {
                  unsigned int v250 = v302 - v293;
                }
                int v251 = 1 << v68;
                if (v304 < v249 << v68) {
                  int v251 = v298;
                }
                if (result >= a7) {
                  unsigned int v250 = v251;
                }
                if (v250)
                {
                  int v252 = 0;
                  uint64_t v253 = (v248 + v246) * a12[3] * *((unsigned __int8 *)a12 + 9);
                  if (result >= a7) {
                    int v254 = 0;
                  }
                  else {
                    int v254 = v293;
                  }
                  BOOL result = v247 + 2 * (v254 + ((v248 - v295) << v68) - v293);
                  do
                  {
                    unsigned int v255 = v250;
                    char v256 = (__int16 *)result;
                    do
                    {
                      __int16 v257 = *v256++;
                      *(_WORD *)(v17 + v253) = v257;
                      --v255;
                    }
                    while (v255);
                    result += a11;
                    ++v252;
                  }
                  while (v252 != v244);
                }
                unsigned int v248 = v249;
              }
              while (v249 != v300);
            }
            unsigned int v238 = v240;
          }
          while (v240 != v281);
        }
      }
    }
  }
  return result;
}

uint64_t agxsTwiddleAddressZ<AGXSConverterPassThru<true,1ul,1u,(TwiddleOrder)1>>(uint64_t result, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned int a9, unsigned int a10, uint64_t a11, unsigned __int16 *a12, unsigned int *a13)
{
  if (!result) {
    return result;
  }
  uint64_t v13 = a2;
  if (!a2) {
    return result;
  }
  uint64_t v17 = result;
  uint64_t v19 = a11;
  uint64_t v18 = a12;
  unsigned int v20 = a10;
  if (!a12)
  {
    unsigned int v25 = 32 - __clz(a5 - 1);
    if (a5 >= 2) {
      unsigned int v26 = v25;
    }
    else {
      unsigned int v26 = 0;
    }
    unsigned int v27 = 32 - __clz(a6 - 1);
    if (a6 >= 2) {
      unsigned int v28 = v27;
    }
    else {
      unsigned int v28 = 0;
    }
    if (v28 | v26)
    {
      unsigned int v29 = 0;
      uint64_t v30 = 0;
      BOOL v31 = v26 != 0;
      BOOL v32 = v28 != 0;
      BOOL v33 = v26 != 0;
      BOOL v34 = v28 != 0;
      int v35 = 1;
      unsigned int v36 = v26;
      unsigned int v37 = v28;
      do
      {
        --v36;
        if (v33) {
          v30 |= (unint64_t)(v35 & ~(-1 << v26)) << v29++;
        }
        else {
          unsigned int v36 = 0;
        }
        --v37;
        if (!v34) {
          unsigned int v37 = 0;
        }
        v35 *= 2;
        unsigned int v29 = (__PAIR64__(v29, v34) - 1) >> 32;
        BOOL v34 = v37 != 0;
        BOOL v33 = v36 != 0;
      }
      while (v37 | v36);
      int v38 = 0;
      uint64_t v39 = 0;
      int v40 = 1;
      BOOL v41 = v26 != 0;
      BOOL v42 = v28 != 0;
      unsigned int v43 = v26;
      unsigned int v44 = v28;
      do
      {
        --v43;
        int v45 = v41;
        if (!v45) {
          unsigned int v43 = 0;
        }
        int v46 = v38 + v45;
        --v44;
        if (v42) {
          v39 |= (unint64_t)(v40 & ~(-1 << v28)) << v46++;
        }
        else {
          unsigned int v44 = 0;
        }
        v40 *= 2;
        int v38 = v46 - 1;
        BOOL v42 = v44 != 0;
        BOOL v41 = v43 != 0;
      }
      while (v44 | v43);
      unsigned int v47 = 0;
      uint64_t v48 = 0;
      BOOL v49 = v26 != 0;
      BOOL v50 = v28 != 0;
      int v51 = 1;
      unsigned int v52 = v26;
      unsigned int v53 = v28;
      do
      {
        --v52;
        if (v49) {
          v48 |= (unint64_t)(v51 & a7) << v47++;
        }
        else {
          unsigned int v52 = 0;
        }
        --v53;
        if (!v50) {
          unsigned int v53 = 0;
        }
        v51 *= 2;
        unsigned int v47 = (__PAIR64__(v47, v50) - 1) >> 32;
        BOOL v50 = v53 != 0;
        BOOL v49 = v52 != 0;
      }
      while (v53 | v52);
      int v54 = 0;
      uint64_t v55 = 0;
      int v56 = 1;
      do
      {
        --v26;
        int v57 = v31;
        if (!v57) {
          unsigned int v26 = 0;
        }
        int v58 = v54 + v57;
        --v28;
        if (v32)
        {
          v55 |= (unint64_t)(v56 & a8) << v58;
          int v59 = v58 + 1;
        }
        else
        {
          unsigned int v28 = 0;
          int v59 = v58;
        }
        v56 *= 2;
        int v54 = v59 - 1;
        BOOL v32 = v28 != 0;
        BOOL v31 = v26 != 0;
        BOOL result = v28 | v26;
      }
      while (result);
      if (!a10) {
        return result;
      }
    }
    else
    {
      uint64_t v48 = 0;
      uint64_t v30 = 0;
      uint64_t v39 = 0;
      uint64_t v55 = 0;
      if (!a10) {
        return result;
      }
    }
    if (a9)
    {
      for (int i = 0; i != a10; ++i)
      {
        uint64_t v228 = 0;
        uint64_t v229 = v48;
        do
        {
          *(unsigned char *)(v55 + v17 + v229) = *(unsigned char *)(v13 + v228);
          uint64_t v229 = (v229 - v30) & v30;
          ++v228;
        }
        while (a9 != v228);
        uint64_t v55 = (v55 - v39) & v39;
        v13 += a11;
      }
    }
    return result;
  }
  unsigned int v262 = a8;
  unsigned int v265 = a7;
  if (*((unsigned char *)a12 + 20))
  {
    BOOL result = agxCalcSparseInputs(a12[3], *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 8), a13[2], a13[3], a13[1], *a13, *((unsigned __int8 *)a12 + 16) - 1 < 2, a7, a8, a9, a10, (uint64_t)v299);
    char v21 = *((unsigned char *)a12 + 13);
    char v22 = *((unsigned char *)a12 + 12);
    if (1 << v21 >= a6 || a5 >> v22)
    {
      unsigned int v144 = a6 >> v21;
      unsigned int v145 = 1 << v22;
      unsigned int v146 = __clz(~(-1 << -(char)__clz(a6 - 1))) - 32;
      if (a6 < 2) {
        unsigned int v146 = 0;
      }
      BOOL v147 = v145 >= a5;
      if (v145 < a5) {
        char v148 = v22 + v21 + v146;
      }
      else {
        char v148 = *((unsigned char *)a12 + 12);
      }
      if (v147) {
        LOBYTE(v149) = *((unsigned char *)a12 + 13);
      }
      else {
        int v149 = -v146;
      }
      if (!v144) {
        char v22 = v148;
      }
      char v256 = v22;
      if (v144) {
        char v24 = *((unsigned char *)a12 + 13);
      }
      else {
        char v24 = v149;
      }
    }
    else
    {
      unsigned int v23 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
      if (a5 < 2) {
        LOBYTE(v23) = 0;
      }
      char v256 = v23;
      char v24 = v22 + v21 - v23;
    }
    unsigned int v151 = v262;
    unsigned int v150 = a10;
    unsigned int v254 = v305;
    if (v305)
    {
      unsigned int v152 = 1 << v24;
      unsigned int v153 = v306;
      int v154 = v303;
      BOOL v285 = v303 != 0;
      int v287 = v304;
      BOOL v283 = v304 != 0;
      int v255 = 1 << v256;
      if (1 << v256 >= a5) {
        unsigned int v155 = a5;
      }
      else {
        unsigned int v155 = 1 << v256;
      }
      if (v152 >= a6) {
        unsigned int v156 = a6;
      }
      else {
        unsigned int v156 = 1 << v24;
      }
      unsigned int v157 = 32 - __clz(v155 - 1);
      if (v155 >= 2) {
        unsigned int v158 = v157;
      }
      else {
        unsigned int v158 = 0;
      }
      unsigned int v159 = 32 - __clz(v156 - 1);
      if (v156 < 2) {
        unsigned int v159 = 0;
      }
      BOOL v291 = v158 != 0;
      unsigned int v293 = v159;
      BOOL v289 = v159 != 0;
      if (v306)
      {
        int v160 = 0;
        unsigned int v253 = a7 >> v256;
        unsigned int v278 = v262 >> v24;
        int v298 = v304 | v303;
        int v296 = v307;
        unsigned int v252 = a9 + a7;
        int v251 = (v255 - 1) & (a9 + a7);
        int v249 = v300;
        int v161 = v302;
        int v295 = v301;
        int v250 = (v255 - 1) & a7;
        int v273 = (v152 - 1) & v262;
        int v275 = (v152 - 1) & (a10 + v262);
        unsigned int v271 = v152 - v273;
        int v162 = ~(-1 << v158);
        int v269 = v159 | v158;
        int v163 = ~(-1 << v159);
        unsigned int v281 = v158;
        int v259 = 1 << v24;
        char v261 = v24;
        unsigned int v258 = v306;
        int v267 = v302;
        do
        {
          int v164 = 0;
          int v165 = v160 + v249;
          unsigned int v166 = (v160 + v253) << v256;
          if (v252 >= (v160 + v253 + 1) << v256) {
            unsigned int v167 = v255 - v250;
          }
          else {
            unsigned int v167 = a9;
          }
          int v168 = 1 << v256;
          if (v252 < (v160 + v253 + 1) << v256) {
            int v168 = v251;
          }
          int v257 = v160;
          if (v166 >= a7) {
            int v169 = v168;
          }
          else {
            int v169 = v167;
          }
          if (v166 >= a7) {
            int v170 = 0;
          }
          else {
            int v170 = v250;
          }
          uint64_t v264 = (v170 + (v160 << v256)) + v13;
          do
          {
            int v171 = v164 + v295;
            if (v296)
            {
              int v172 = v298;
              if (v298)
              {
                int v173 = 0;
                int v172 = 0;
                int v174 = 1;
                BOOL v176 = v285;
                int v175 = v287;
                BOOL v177 = v283;
                int v178 = v154;
                do
                {
                  --v178;
                  if (v176) {
                    v172 |= (v174 & v165) << v173;
                  }
                  else {
                    int v178 = 0;
                  }
                  if (v176) {
                    ++v173;
                  }
                  --v175;
                  if (v177) {
                    v172 |= (v174 & v171) << v173;
                  }
                  else {
                    int v175 = 0;
                  }
                  if (v177) {
                    ++v173;
                  }
                  v174 *= 2;
                  --v173;
                  BOOL v177 = v175 != 0;
                  BOOL v176 = v178 != 0;
                }
                while (v175 | v178);
              }
            }
            else
            {
              int v172 = v298;
              if (v298)
              {
                int v179 = 0;
                int v172 = 0;
                int v180 = 1;
                BOOL v181 = v283;
                BOOL v183 = v285;
                int v182 = v287;
                int v184 = v154;
                do
                {
                  --v182;
                  if (v181) {
                    v172 |= (v180 & v171) << v179;
                  }
                  else {
                    int v182 = 0;
                  }
                  if (v181) {
                    ++v179;
                  }
                  --v184;
                  if (v183) {
                    v172 |= (v180 & v165) << v179;
                  }
                  else {
                    int v184 = 0;
                  }
                  if (v183) {
                    ++v179;
                  }
                  v180 *= 2;
                  --v179;
                  BOOL v183 = v184 != 0;
                  BOOL v181 = v182 != 0;
                }
                while (v184 | v182);
              }
            }
            int v185 = *(_DWORD *)(v17 + 4 * ((v172 + v161) | ((v172 + v161) >> 8 << 9)));
            if (v185 < 0)
            {
              unint64_t v186 = v17 - *((void *)a13 + 3) + ((unint64_t)(v185 & 0x1FFFFFFF) << 14);
              BOOL result = *a13;
              unsigned int v187 = a13[2];
              if (result > v187)
              {
                BOOL result = get_level_offset_within_tail(result, v187, *a12, a12[1], *((unsigned __int8 *)a12 + 18), *((unsigned __int8 *)a12 + 19), *((unsigned __int8 *)a12 + 14), *((unsigned __int8 *)a12 + 16) - 1 < 2);
                unsigned int v158 = v281;
                unsigned int v153 = v258;
                unsigned int v152 = v259;
                char v24 = v261;
                uint64_t v19 = a11;
                unsigned int v151 = v262;
                unsigned int v150 = a10;
                v186 += result;
              }
              unsigned int v188 = (v164 + v278) << v24;
              unsigned int v189 = v271;
              if (a10 + v262 >= (v164 + v278 + 1) << v24)
              {
                unsigned int v190 = v152;
              }
              else
              {
                unsigned int v189 = v150;
                unsigned int v190 = v275;
              }
              if (v188 >= v151) {
                int v191 = 0;
              }
              else {
                int v191 = v273;
              }
              if (v188 >= v151) {
                unsigned int v189 = v190;
              }
              if (!v269)
              {
                uint64_t v209 = 0;
                uint64_t v193 = 0;
                uint64_t v200 = 0;
                uint64_t v216 = 0;
                int v161 = v267;
                if (!v189) {
                  goto LABEL_190;
                }
LABEL_262:
                if (v169)
                {
                  int v223 = 0;
                  uint64_t v224 = v264 + (v191 + (v164 << v24)) * v19;
                  do
                  {
                    uint64_t v225 = 0;
                    uint64_t v226 = v209;
                    do
                    {
                      BOOL result = *(unsigned __int8 *)(v224 + v225);
                      *(unsigned char *)(v216 + v186 + v226) = result;
                      uint64_t v226 = (v226 - v193) & v193;
                      ++v225;
                    }
                    while (v169 != v225);
                    uint64_t v216 = (v216 - v200) & v200;
                    v224 += v19;
                    ++v223;
                  }
                  while (v223 != v189);
                }
                goto LABEL_190;
              }
              unsigned int v192 = 0;
              uint64_t v193 = 0;
              int v194 = 1;
              BOOL v195 = v289;
              BOOL v196 = v291;
              unsigned int v197 = v158;
              unsigned int v198 = v293;
              do
              {
                --v197;
                if (v196) {
                  v193 |= (unint64_t)(v194 & v162) << v192++;
                }
                else {
                  unsigned int v197 = 0;
                }
                --v198;
                if (!v195) {
                  unsigned int v198 = 0;
                }
                v194 *= 2;
                unsigned int v192 = (__PAIR64__(v192, v195) - 1) >> 32;
                BOOL v195 = v198 != 0;
                BOOL v196 = v197 != 0;
              }
              while (v198 | v197);
              int v199 = 0;
              uint64_t v200 = 0;
              int v201 = 1;
              BOOL v202 = v289;
              BOOL v203 = v291;
              unsigned int v204 = v158;
              unsigned int v205 = v293;
              do
              {
                --v204;
                int v206 = v203;
                if (!v206) {
                  unsigned int v204 = 0;
                }
                int v207 = v199 + v206;
                --v205;
                if (v202) {
                  v200 |= (unint64_t)(v201 & v163) << v207++;
                }
                else {
                  unsigned int v205 = 0;
                }
                v201 *= 2;
                int v199 = v207 - 1;
                BOOL v202 = v205 != 0;
                BOOL v203 = v204 != 0;
              }
              while (v205 | v204);
              unsigned int v208 = 0;
              uint64_t v209 = 0;
              int v210 = 1;
              BOOL v212 = v289;
              BOOL v211 = v291;
              unsigned int v213 = v158;
              unsigned int v214 = v293;
              do
              {
                --v213;
                if (v211) {
                  v209 |= (unint64_t)(v210 & v170) << v208++;
                }
                else {
                  unsigned int v213 = 0;
                }
                --v214;
                if (!v212) {
                  unsigned int v214 = 0;
                }
                v210 *= 2;
                unsigned int v208 = (__PAIR64__(v208, v212) - 1) >> 32;
                BOOL v212 = v214 != 0;
                BOOL v211 = v213 != 0;
              }
              while (v214 | v213);
              int v215 = 0;
              uint64_t v216 = 0;
              int v217 = 1;
              LOBYTE(result) = v289;
              BOOL v218 = v291;
              unsigned int v219 = v158;
              unsigned int v220 = v293;
              do
              {
                --v219;
                int v221 = v218;
                if (!v221) {
                  unsigned int v219 = 0;
                }
                int v222 = v215 + v221;
                --v220;
                if (result) {
                  v216 |= (unint64_t)(v217 & v191) << v222++;
                }
                else {
                  unsigned int v220 = 0;
                }
                v217 *= 2;
                int v215 = v222 - 1;
                BOOL result = v220 != 0;
                BOOL v218 = v219 != 0;
              }
              while (v220 | v219);
              unsigned int v158 = v281;
              int v161 = v267;
              if (v189) {
                goto LABEL_262;
              }
            }
LABEL_190:
            ++v164;
          }
          while (v153 > (unsigned __int16)v164);
          int v160 = v257 + 1;
          a7 = v265;
        }
        while (v254 > (unsigned __int16)(v257 + 1));
      }
    }
  }
  else
  {
    int v60 = *((unsigned __int8 *)a12 + 13);
    int v61 = *((unsigned __int8 *)a12 + 12);
    unsigned int v62 = 1 << v60;
    unsigned int v63 = a5 >> v61;
    unsigned int v64 = __clz(~(-1 << -__clz(a6 - 1))) - 32;
    if (a6 < 2) {
      unsigned int v64 = 0;
    }
    char v65 = v61 + v60;
    BOOL result = v61 + v60 + v64;
    if (a6 >> v60) {
      BOOL v66 = 1;
    }
    else {
      BOOL v66 = 1 << v61 >= a5;
    }
    if (v66)
    {
      LOBYTE(v67) = *((unsigned char *)a12 + 13);
    }
    else
    {
      LOBYTE(v61) = v61 + v60 + v64;
      int v67 = -v64;
    }
    unsigned int v68 = 32 - __clz(~(-1 << -(char)__clz(a5 - 1)));
    if (a5 < 2) {
      LOBYTE(v68) = 0;
    }
    char v69 = v65 - v68;
    if (v62 >= a6 || v63 != 0)
    {
      LOBYTE(v68) = v61;
      char v69 = v67;
    }
    int v71 = 1 << v69;
    char v72 = *((unsigned char *)a12 + 15);
    unsigned int v73 = 1 << v72;
    if (v72) {
      BOOL v74 = v73 > a3;
    }
    else {
      BOOL v74 = 1;
    }
    BOOL v75 = v74 || v73 > a4;
    int v76 = (~(-1 << v72) + a3) & (-1 << v72);
    if (v75) {
      int v77 = a3;
    }
    else {
      int v77 = v76;
    }
    unsigned int v277 = a10 + a8;
    unsigned int v279 = 1 << v69;
    int v78 = v71 - 1;
    unsigned int v270 = a8 >> v69;
    unsigned int v276 = (v71 - 1 + a10 + a8) >> v69;
    if (a8 >> v69 < v276)
    {
      BOOL result = a7 >> v68;
      int v79 = (1 << v68) - 1;
      unsigned int v297 = a9 + a7;
      if (1 << v68 >= a5) {
        unsigned int v80 = a5;
      }
      else {
        unsigned int v80 = 1 << v68;
      }
      unsigned int v81 = 1 << v69;
      if (v279 >= a6) {
        unsigned int v81 = a6;
      }
      unsigned int v82 = 32 - __clz(v80 - 1);
      if (v80 >= 2) {
        unsigned int v83 = v82;
      }
      else {
        unsigned int v83 = 0;
      }
      unsigned int v84 = 32 - __clz(v81 - 1);
      if (v81 >= 2) {
        unsigned int v85 = v84;
      }
      else {
        unsigned int v85 = 0;
      }
      unsigned int v288 = a7 >> v68;
      unsigned int v294 = (v79 + a9 + a7) >> v68;
      if (result < v294)
      {
        unsigned int v268 = (v77 + ~(-1 << v68)) >> v68;
        uint64_t v86 = v78 & a8;
        int v292 = v79 & v297;
        int v290 = (1 << v68) - (v79 & a7);
        int v274 = v78 & v277;
        unsigned int v272 = v279 - v86;
        int v286 = v79 & a7;
        uint64_t v266 = a2 - (v79 & a7);
        if (v85 | v83)
        {
          unsigned int v87 = a8 >> v69;
          char v263 = v69;
          uint64_t v260 = v78 & a8;
          do
          {
            unsigned int v88 = v87 << v69;
            unsigned int v89 = v87 - v270;
            int v284 = v87 * v268;
            unsigned int v280 = v87 + 1;
            BOOL v90 = v277 >= (v87 + 1) << v69;
            unsigned int v91 = v279;
            if (!v90) {
              unsigned int v91 = v274;
            }
            unsigned int v92 = v272;
            if (!v90) {
              unsigned int v92 = v20;
            }
            unsigned int v93 = v89 << v69;
            if (v88 >= a8) {
              BOOL result = 0;
            }
            else {
              BOOL result = v86;
            }
            if (v88 >= a8) {
              unsigned int v94 = v91;
            }
            else {
              unsigned int v94 = v92;
            }
            uint64_t v282 = v266 + (result + v93 - v86) * a11;
            unsigned int v95 = v288;
            do
            {
              unsigned int v96 = 0;
              uint64_t v97 = 0;
              unsigned int v98 = v95 << v68;
              unsigned int v99 = v95 - v288;
              unsigned int v100 = v95 + v284;
              unsigned int v101 = ++v95 << v68;
              if (v98 >= a7) {
                int v102 = 0;
              }
              else {
                int v102 = v286;
              }
              uint64_t v103 = v102 + (v99 << v68);
              uint64_t v104 = v100 * v18[3] * *((unsigned __int8 *)v18 + 9);
              int v105 = 1;
              BOOL v106 = v83 != 0;
              BOOL v107 = v85 != 0;
              unsigned int v108 = v83;
              unsigned int v109 = v85;
              do
              {
                --v108;
                if (v106) {
                  v97 |= (unint64_t)(v105 & ~(-1 << v83)) << v96++;
                }
                else {
                  unsigned int v108 = 0;
                }
                --v109;
                if (!v107) {
                  unsigned int v109 = 0;
                }
                v105 *= 2;
                unsigned int v96 = (__PAIR64__(v96, v107) - 1) >> 32;
                BOOL v107 = v109 != 0;
                BOOL v106 = v108 != 0;
              }
              while (v109 | v108);
              int v110 = 0;
              uint64_t v111 = 0;
              int v112 = 1 << v68;
              if (v297 < v101) {
                int v112 = v292;
              }
              int v113 = 1;
              BOOL v114 = v83 != 0;
              BOOL v115 = v85 != 0;
              unsigned int v116 = v83;
              unsigned int v117 = v85;
              do
              {
                --v116;
                int v118 = v114;
                if (!v118) {
                  unsigned int v116 = 0;
                }
                int v119 = v110 + v118;
                if (v115) {
                  --v117;
                }
                else {
                  unsigned int v117 = 0;
                }
                if (v115) {
                  v111 |= (unint64_t)(v113 & ~(-1 << v85)) << v119++;
                }
                v113 *= 2;
                int v110 = v119 - 1;
                BOOL v115 = v117 != 0;
                BOOL v114 = v116 != 0;
              }
              while (v117 | v116);
              unsigned int v120 = 0;
              uint64_t v121 = 0;
              if (v297 >= v101) {
                int v122 = v290;
              }
              else {
                int v122 = a9;
              }
              uint64_t v123 = v282 + v103;
              int v124 = 1;
              BOOL v125 = v83 != 0;
              BOOL v126 = v85 != 0;
              unsigned int v127 = v83;
              unsigned int v128 = v85;
              do
              {
                --v127;
                if (v125)
                {
                  v121 |= (unint64_t)(v124 & v102) << v120;
                  unsigned int v129 = v120 + 1;
                }
                else
                {
                  unsigned int v127 = 0;
                  unsigned int v129 = v120;
                }
                if (v126) {
                  --v128;
                }
                else {
                  unsigned int v128 = 0;
                }
                v124 *= 2;
                unsigned int v120 = (__PAIR64__(v129, v126) - 1) >> 32;
                BOOL v126 = v128 != 0;
                BOOL v125 = v127 != 0;
              }
              while (v128 | v127);
              int v130 = 0;
              unint64_t v131 = 0;
              int v132 = 1;
              BOOL v133 = v83 != 0;
              BOOL v134 = v85 != 0;
              unsigned int v135 = v83;
              unsigned int v136 = v85;
              do
              {
                int v137 = v133;
                if (v137) {
                  --v135;
                }
                else {
                  unsigned int v135 = 0;
                }
                int v138 = v130 + v137;
                unint64_t v139 = ((unint64_t)(v132 & result) << (v130 + v137)) | v131;
                if (v134) {
                  --v136;
                }
                else {
                  unsigned int v136 = 0;
                }
                if (v134)
                {
                  unint64_t v131 = v139;
                  ++v138;
                }
                v132 *= 2;
                int v130 = v138 - 1;
                BOOL v134 = v136 != 0;
                BOOL v133 = v135 != 0;
              }
              while (v136 | v135);
              a7 = v265;
              if (v98 < v265) {
                int v112 = v122;
              }
              uint64_t v18 = a12;
              if (v94 && v112)
              {
                int v140 = 0;
                uint64_t v141 = v104 + v17;
                do
                {
                  uint64_t v142 = 0;
                  uint64_t v143 = v121;
                  do
                  {
                    *(unsigned char *)(v141 + v131 + v143) = *(unsigned char *)(v123 + v142);
                    uint64_t v143 = (v143 - v97) & v97;
                    ++v142;
                  }
                  while (v112 != v142);
                  unint64_t v131 = (v131 - v111) & v111;
                  v123 += a11;
                  ++v140;
                }
                while (v140 != v94);
              }
            }
            while (v95 != v294);
            unsigned int v87 = v280;
            a8 = v262;
            unsigned int v20 = a10;
            char v69 = v263;
            uint64_t v86 = v260;
          }
          while (v280 != v276);
        }
        else
        {
          unsigned int v230 = a8 >> v69;
          do
          {
            unsigned int v231 = v230 << v69;
            unsigned int v232 = v230 + 1;
            int v233 = v274;
            if (v277 >= (v230 + 1) << v69) {
              int v233 = 1 << v69;
            }
            if (v277 >= v232 << v69) {
              unsigned int v234 = v279 - v86;
            }
            else {
              unsigned int v234 = a10;
            }
            if (v231 >= a8) {
              int v235 = 0;
            }
            else {
              int v235 = v86;
            }
            if (v231 >= a8) {
              int v236 = v233;
            }
            else {
              int v236 = v234;
            }
            if (v236)
            {
              int v237 = (v230 - v270) << v69;
              int v238 = v230 * v268;
              uint64_t v239 = v266 + ((v235 + v237) - v86) * a11;
              LODWORD(result) = a7 >> v68;
              do
              {
                unsigned int v240 = result << v68;
                uint64_t v241 = (result + 1);
                unsigned int v242 = v290;
                if (v297 < v241 << v68) {
                  unsigned int v242 = a9;
                }
                int v243 = 1 << v68;
                if (v297 < v241 << v68) {
                  int v243 = v292;
                }
                if (v240 >= a7) {
                  unsigned int v242 = v243;
                }
                if (v242)
                {
                  int v244 = 0;
                  uint64_t v245 = (result + v238) * a12[3] * *((unsigned __int8 *)a12 + 9);
                  BOOL v66 = v240 >= a7;
                  int v246 = v286;
                  if (v66) {
                    int v246 = 0;
                  }
                  uint64_t v247 = v239 + v246 + ((result - v288) << v68);
                  do
                  {
                    uint64_t v248 = 0;
                    do
                      *(unsigned char *)(v17 + v245) = *(unsigned char *)(v247 + v248++);
                    while (v242 != v248);
                    v247 += a11;
                    ++v244;
                  }
                  while (v244 != v236);
                }
                BOOL result = v241;
              }
              while (v241 != v294);
            }
            unsigned int v230 = v232;
          }
          while (v232 != v276);
        }
      }
    }
  }
  return result;
}

os_unfair_lock_s *AGX::PooledAllocator<8u>::~PooledAllocator(os_unfair_lock_s *a1)
{
  __dst[8] = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 3;
  os_unfair_lock_lock(a1 + 3);
  uint64_t os_unfair_lock_opaque = a1[2]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque)
  {
    if (os_unfair_lock_opaque <= 7) {
      size_t v4 = 64 - 8 * os_unfair_lock_opaque;
    }
    else {
      size_t v4 = 0;
    }
    v5 = (void **)__dst;
    bzero(&__dst[os_unfair_lock_opaque], v4);
    memcpy(__dst, &a1[4], 8 * os_unfair_lock_opaque);
    a1[2]._uint64_t os_unfair_lock_opaque = 0;
    os_unfair_lock_unlock(v2);
    do
    {
      v6 = *v5++;
      free(v6);
      --os_unfair_lock_opaque;
    }
    while (os_unfair_lock_opaque);
  }
  else
  {
    a1[2]._uint64_t os_unfair_lock_opaque = 0;
    os_unfair_lock_unlock(v2);
  }
  return a1;
}

void AGX::PooledAllocator<8u>::shrink(os_unfair_lock_s *a1, float a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  size_t v4 = a1 + 3;
  os_unfair_lock_lock(a1 + 3);
  uint64_t os_unfair_lock_opaque = a1[2]._os_unfair_lock_opaque;
  if (a2 >= 0.0) {
    uint64_t v6 = (float)((float)os_unfair_lock_opaque * a2);
  }
  else {
    uint64_t v6 = os_unfair_lock_opaque;
  }
  memset(v19, 0, sizeof(v19));
  if (v6) {
    memcpy(v19, &a1[4], 8 * v6);
  }
  if (os_unfair_lock_opaque > v6)
  {
    uint64_t v7 = os_unfair_lock_opaque - v6;
    BOOL v8 = (unint64_t)(os_unfair_lock_opaque - v6) >= 0xA && -8 * (unint64_t)v6 > 0x1F;
    uint64_t v9 = v6;
    if (!v8) {
      goto LABEL_16;
    }
    unint64_t v10 = v7 & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v11 = 2 * v6;
    unsigned int v12 = a1;
    unint64_t v13 = v7 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      long long v14 = *(_OWORD *)&v12[v11 + 4]._os_unfair_lock_opaque;
      *(_OWORD *)&v12[8]._uint64_t os_unfair_lock_opaque = *(_OWORD *)&v12[v11 + 8]._os_unfair_lock_opaque;
      v12 += 8;
      *(_OWORD *)&v12[-4]._uint64_t os_unfair_lock_opaque = v14;
      v13 -= 4;
    }
    while (v13);
    if (v7 != v10)
    {
      uint64_t v9 = v10 + v6;
LABEL_16:
      uint64_t v15 = os_unfair_lock_opaque - v9;
      int v16 = &a1[2 * v9 + 4];
      do
      {
        *(void *)&v16[-2 * v6]._uint64_t os_unfair_lock_opaque = *(void *)&v16->_os_unfair_lock_opaque;
        v16 += 2;
        --v15;
      }
      while (v15);
    }
  }
  a1[2]._uint64_t os_unfair_lock_opaque = os_unfair_lock_opaque - v6;
  os_unfair_lock_unlock(v4);
  if (v6)
  {
    uint64_t v17 = (void **)v19;
    do
    {
      uint64_t v18 = *v17++;
      free(v18);
      --v6;
    }
    while (v6);
  }
}

os_unfair_lock_s *AGX::PooledAllocator<16u>::~PooledAllocator(os_unfair_lock_s *a1)
{
  __dst[16] = *MEMORY[0x263EF8340];
  uint64_t v2 = a1 + 3;
  os_unfair_lock_lock(a1 + 3);
  uint64_t os_unfair_lock_opaque = a1[2]._os_unfair_lock_opaque;
  if (os_unfair_lock_opaque)
  {
    if (os_unfair_lock_opaque <= 0xF) {
      size_t v4 = 128 - 8 * os_unfair_lock_opaque;
    }
    else {
      size_t v4 = 0;
    }
    v5 = (void **)__dst;
    bzero(&__dst[os_unfair_lock_opaque], v4);
    memcpy(__dst, &a1[4], 8 * os_unfair_lock_opaque);
    a1[2]._uint64_t os_unfair_lock_opaque = 0;
    os_unfair_lock_unlock(v2);
    do
    {
      uint64_t v6 = *v5++;
      free(v6);
      --os_unfair_lock_opaque;
    }
    while (os_unfair_lock_opaque);
  }
  else
  {
    a1[2]._uint64_t os_unfair_lock_opaque = 0;
    os_unfair_lock_unlock(v2);
  }
  return a1;
}

void AGX::PooledAllocator<16u>::shrink(os_unfair_lock_s *a1, float a2)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  size_t v4 = a1 + 3;
  os_unfair_lock_lock(a1 + 3);
  uint64_t os_unfair_lock_opaque = a1[2]._os_unfair_lock_opaque;
  if (a2 >= 0.0) {
    uint64_t v6 = (float)((float)os_unfair_lock_opaque * a2);
  }
  else {
    uint64_t v6 = os_unfair_lock_opaque;
  }
  memset(v19, 0, sizeof(v19));
  if (v6) {
    memcpy(v19, &a1[4], 8 * v6);
  }
  if (os_unfair_lock_opaque > v6)
  {
    uint64_t v7 = os_unfair_lock_opaque - v6;
    BOOL v8 = (unint64_t)(os_unfair_lock_opaque - v6) >= 0xA && -8 * (unint64_t)v6 > 0x1F;
    uint64_t v9 = v6;
    if (!v8) {
      goto LABEL_16;
    }
    unint64_t v10 = v7 & 0xFFFFFFFFFFFFFFFCLL;
    uint64_t v11 = 2 * v6;
    unsigned int v12 = a1;
    unint64_t v13 = v7 & 0xFFFFFFFFFFFFFFFCLL;
    do
    {
      long long v14 = *(_OWORD *)&v12[v11 + 4]._os_unfair_lock_opaque;
      *(_OWORD *)&v12[8]._uint64_t os_unfair_lock_opaque = *(_OWORD *)&v12[v11 + 8]._os_unfair_lock_opaque;
      v12 += 8;
      *(_OWORD *)&v12[-4]._uint64_t os_unfair_lock_opaque = v14;
      v13 -= 4;
    }
    while (v13);
    if (v7 != v10)
    {
      uint64_t v9 = v10 + v6;
LABEL_16:
      uint64_t v15 = os_unfair_lock_opaque - v9;
      int v16 = &a1[2 * v9 + 4];
      do
      {
        *(void *)&v16[-2 * v6]._uint64_t os_unfair_lock_opaque = *(void *)&v16->_os_unfair_lock_opaque;
        v16 += 2;
        --v15;
      }
      while (v15);
    }
  }
  a1[2]._uint64_t os_unfair_lock_opaque = os_unfair_lock_opaque - v6;
  os_unfair_lock_unlock(v4);
  if (v6)
  {
    uint64_t v17 = (void **)v19;
    do
    {
      uint64_t v18 = *v17++;
      free(v18);
      --v6;
    }
    while (v6);
  }
}

BOOL AGX::CounterSamplingContextGen1::setCounterSampleBuffer(AGX::CounterSamplingContextGen1 *this, AGXMTLCounterSampleBuffer *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    size_t v4 = [(AGXMTLCounterSampleBuffer *)a2 buffer];
    if (v4)
    {
      *(void *)this = v4;
      return 1;
    }
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** Error, invalid counter sample storage\n", "agxa_mtl_counters.mm", 299, "setCounterSampleBuffer");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v9 = "agxa_mtl_counters.mm";
      __int16 v10 = 1024;
      int v11 = 299;
      __int16 v12 = 2080;
      unint64_t v13 = "setCounterSampleBuffer";
      _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Error, invalid counter sample storage\n", buf, 0x1Cu);
    }
    BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v9 = "agxa_mtl_counters.mm";
      __int16 v10 = 1024;
      int v11 = 299;
      __int16 v12 = 2080;
      unint64_t v13 = "setCounterSampleBuffer";
      uint64_t v6 = &_os_log_internal;
      uint64_t v7 = "AGX: AGX: %s:%d:%s: *** Error, invalid counter sample storage\n";
      goto LABEL_12;
    }
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** Error, counter sample buffer is not of type AGXMTLCounterSampleBuffer\n", "agxa_mtl_counters.mm", 292, "setCounterSampleBuffer");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v9 = "agxa_mtl_counters.mm";
      __int16 v10 = 1024;
      int v11 = 292;
      __int16 v12 = 2080;
      unint64_t v13 = "setCounterSampleBuffer";
      _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Error, counter sample buffer is not of type AGXMTLCounterSampleBuffer\n", buf, 0x1Cu);
    }
    BOOL result = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO);
    if (result)
    {
      *(_DWORD *)buf = 136315650;
      uint64_t v9 = "agxa_mtl_counters.mm";
      __int16 v10 = 1024;
      int v11 = 292;
      __int16 v12 = 2080;
      unint64_t v13 = "setCounterSampleBuffer";
      uint64_t v6 = &_os_log_internal;
      uint64_t v7 = "AGX: AGX: %s:%d:%s: *** Error, counter sample buffer is not of type AGXMTLCounterSampleBuffer\n";
LABEL_12:
      _os_log_impl(&dword_2427AD000, v6, OS_LOG_TYPE_INFO, v7, buf, 0x1Cu);
      return 0;
    }
  }
  return result;
}

uint64_t AGX::CounterSamplingContextGen1::validateSampleIndex(void *a1, unsigned int *a2)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  unsigned int v2 = *a2;
  if (*a2 == -1) {
    return 0;
  }
  unsigned int v4 = [a1 sampleCount];
  if (v2 < v4) {
    return 1;
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** Invalid sample index: %u > %u\n", "agxa_mtl_counters.mm", 379, "validateSampleIndex", v2, v4);
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v7 = "agxa_mtl_counters.mm";
    __int16 v8 = 1024;
    int v9 = 379;
    __int16 v10 = 2080;
    int v11 = "validateSampleIndex";
    __int16 v12 = 1024;
    unsigned int v13 = v2;
    __int16 v14 = 1024;
    unsigned int v15 = v4;
    _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Invalid sample index: %u > %u\n", buf, 0x28u);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136316162;
    uint64_t v7 = "agxa_mtl_counters.mm";
    __int16 v8 = 1024;
    int v9 = 379;
    __int16 v10 = 2080;
    int v11 = "validateSampleIndex";
    __int16 v12 = 1024;
    unsigned int v13 = v2;
    __int16 v14 = 1024;
    unsigned int v15 = v4;
    _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Invalid sample index: %u > %u\n", buf, 0x28u);
  }
  uint64_t result = 0;
  *a2 = -1;
  return result;
}

AGX::ComputeCounterSamplingContextGen1 *AGX::ComputeCounterSamplingContextGen1::ComputeCounterSamplingContextGen1(AGX::ComputeCounterSamplingContextGen1 *this, MTLComputePassDescriptor *a2)
{
  *(void *)this = 0;
  v3 = (unsigned int *)((char *)this + 12);
  *((void *)this + 1) = -1;
  unsigned int v4 = (unsigned int *)((char *)this + 8);
  v5 = [(MTLComputePassDescriptor *)a2 sampleBufferAttachments];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = (void *)[(MTLComputePassSampleBufferAttachmentDescriptorArray *)v5 _descriptorAtIndex:0];
    if (v7)
    {
      __int16 v8 = v7;
      int v9 = (AGXMTLCounterSampleBuffer *)[v7 sampleBuffer];
      unsigned int v10 = [v8 startOfEncoderSampleIndex];
      unsigned int v11 = [v8 endOfEncoderSampleIndex];
      if (v9)
      {
        unsigned int *v4 = v10;
        unsigned int *v3 = v11;
        char v12 = AGX::CounterSamplingContextGen1::validateSampleIndex(v9, v4);
        int v13 = AGX::CounterSamplingContextGen1::validateSampleIndex(v9, v3);
        if ((v12 & 1) != 0 || v13) {
          AGX::CounterSamplingContextGen1::setCounterSampleBuffer(this, v9);
        }
      }
    }
    __int16 v14 = (void *)[(MTLComputePassSampleBufferAttachmentDescriptorArray *)v6 _descriptorAtIndex:1];
    if (v14)
    {
      unsigned int v15 = v14;
      uint64_t v16 = (AGXMTLCounterSampleBuffer *)[v14 sampleBuffer];
      unsigned int v17 = [v15 startOfEncoderSampleIndex];
      unsigned int v18 = [v15 endOfEncoderSampleIndex];
      if (v16)
      {
        unsigned int *v4 = v17;
        unsigned int *v3 = v18;
        char v19 = AGX::CounterSamplingContextGen1::validateSampleIndex(v16, v4);
        int v20 = AGX::CounterSamplingContextGen1::validateSampleIndex(v16, v3);
        if ((v19 & 1) != 0 || v20) {
          AGX::CounterSamplingContextGen1::setCounterSampleBuffer(this, v16);
        }
      }
    }
    char v21 = (void *)[(MTLComputePassSampleBufferAttachmentDescriptorArray *)v6 _descriptorAtIndex:2];
    if (v21)
    {
      char v22 = v21;
      unsigned int v23 = (AGXMTLCounterSampleBuffer *)[v21 sampleBuffer];
      unsigned int v24 = [v22 startOfEncoderSampleIndex];
      unsigned int v25 = [v22 endOfEncoderSampleIndex];
      if (v23)
      {
        unsigned int *v4 = v24;
        unsigned int *v3 = v25;
        char v26 = AGX::CounterSamplingContextGen1::validateSampleIndex(v23, v4);
        int v27 = AGX::CounterSamplingContextGen1::validateSampleIndex(v23, v3);
        if ((v26 & 1) != 0 || v27) {
          AGX::CounterSamplingContextGen1::setCounterSampleBuffer(this, v23);
        }
      }
    }
    unsigned int v28 = (void *)[(MTLComputePassSampleBufferAttachmentDescriptorArray *)v6 _descriptorAtIndex:3];
    if (v28)
    {
      unsigned int v29 = v28;
      uint64_t v30 = (AGXMTLCounterSampleBuffer *)[v28 sampleBuffer];
      unsigned int v31 = [v29 startOfEncoderSampleIndex];
      unsigned int v32 = [v29 endOfEncoderSampleIndex];
      if (v30)
      {
        unsigned int *v4 = v31;
        unsigned int *v3 = v32;
        char v33 = AGX::CounterSamplingContextGen1::validateSampleIndex(v30, v4);
        int v34 = AGX::CounterSamplingContextGen1::validateSampleIndex(v30, v3);
        if ((v33 & 1) != 0 || v34) {
          AGX::CounterSamplingContextGen1::setCounterSampleBuffer(this, v30);
        }
      }
    }
  }
  return this;
}

AGX::BlitCounterSamplingContextGen1 *AGX::BlitCounterSamplingContextGen1::BlitCounterSamplingContextGen1(AGX::BlitCounterSamplingContextGen1 *this, MTLBlitPassDescriptor *a2, MTLResourceStatePassDescriptor *a3)
{
  *(void *)this = 0;
  v5 = (unsigned int *)((char *)this + 12);
  *((void *)this + 1) = -1;
  uint64_t v6 = (unsigned int *)((char *)this + 8);
  if (a2)
  {
    uint64_t v7 = [(MTLBlitPassDescriptor *)a2 sampleBufferAttachments];
    if (v7)
    {
      __int16 v8 = v7;
      int v9 = (void *)[(MTLBlitPassSampleBufferAttachmentDescriptorArray *)v7 _descriptorAtIndex:0];
      if (v9)
      {
        unsigned int v10 = v9;
        unsigned int v11 = (AGXMTLCounterSampleBuffer *)[v9 sampleBuffer];
        unsigned int v12 = [v10 startOfEncoderSampleIndex];
        unsigned int v13 = [v10 endOfEncoderSampleIndex];
        if (v11)
        {
          unsigned int *v6 = v12;
          unsigned int *v5 = v13;
          char v14 = AGX::CounterSamplingContextGen1::validateSampleIndex(v11, v6);
          int v15 = AGX::CounterSamplingContextGen1::validateSampleIndex(v11, v5);
          if ((v14 & 1) != 0 || v15) {
            AGX::CounterSamplingContextGen1::setCounterSampleBuffer(this, v11);
          }
        }
      }
      uint64_t v16 = (void *)[(MTLBlitPassSampleBufferAttachmentDescriptorArray *)v8 _descriptorAtIndex:1];
      if (v16)
      {
        unsigned int v17 = v16;
        unsigned int v18 = (AGXMTLCounterSampleBuffer *)[v16 sampleBuffer];
        unsigned int v19 = [v17 startOfEncoderSampleIndex];
        unsigned int v20 = [v17 endOfEncoderSampleIndex];
        if (v18)
        {
          unsigned int *v6 = v19;
          unsigned int *v5 = v20;
          char v21 = AGX::CounterSamplingContextGen1::validateSampleIndex(v18, v6);
          int v22 = AGX::CounterSamplingContextGen1::validateSampleIndex(v18, v5);
          if ((v21 & 1) != 0 || v22) {
            AGX::CounterSamplingContextGen1::setCounterSampleBuffer(this, v18);
          }
        }
      }
      unsigned int v23 = (void *)[(MTLBlitPassSampleBufferAttachmentDescriptorArray *)v8 _descriptorAtIndex:2];
      if (v23)
      {
        unsigned int v24 = v23;
        unsigned int v25 = (AGXMTLCounterSampleBuffer *)[v23 sampleBuffer];
        unsigned int v26 = [v24 startOfEncoderSampleIndex];
        unsigned int v27 = [v24 endOfEncoderSampleIndex];
        if (v25)
        {
          unsigned int *v6 = v26;
          unsigned int *v5 = v27;
          char v28 = AGX::CounterSamplingContextGen1::validateSampleIndex(v25, v6);
          int v29 = AGX::CounterSamplingContextGen1::validateSampleIndex(v25, v5);
          if ((v28 & 1) != 0 || v29) {
            AGX::CounterSamplingContextGen1::setCounterSampleBuffer(this, v25);
          }
        }
      }
      uint64_t v30 = (void *)[(MTLBlitPassSampleBufferAttachmentDescriptorArray *)v8 _descriptorAtIndex:3];
      if (v30)
      {
        unsigned int v31 = v30;
        unsigned int v32 = (AGXMTLCounterSampleBuffer *)[v30 sampleBuffer];
        unsigned int v33 = [v31 startOfEncoderSampleIndex];
        unsigned int v34 = [v31 endOfEncoderSampleIndex];
        if (v32)
        {
          unsigned int *v6 = v33;
          unsigned int *v5 = v34;
          char v35 = AGX::CounterSamplingContextGen1::validateSampleIndex(v32, v6);
          int v36 = AGX::CounterSamplingContextGen1::validateSampleIndex(v32, v5);
          if ((v35 & 1) != 0 || v36) {
            AGX::CounterSamplingContextGen1::setCounterSampleBuffer(this, v32);
          }
        }
      }
    }
  }
  if (a3)
  {
    unsigned int v37 = [(MTLResourceStatePassDescriptor *)a3 sampleBufferAttachments];
    if (v37)
    {
      int v38 = v37;
      uint64_t v39 = (void *)[(MTLResourceStatePassSampleBufferAttachmentDescriptorArray *)v37 _descriptorAtIndex:0];
      if (v39)
      {
        int v40 = v39;
        BOOL v41 = (AGXMTLCounterSampleBuffer *)[v39 sampleBuffer];
        unsigned int v42 = [v40 startOfEncoderSampleIndex];
        unsigned int v43 = [v40 endOfEncoderSampleIndex];
        if (v41)
        {
          unsigned int *v6 = v42;
          unsigned int *v5 = v43;
          char v44 = AGX::CounterSamplingContextGen1::validateSampleIndex(v41, v6);
          int v45 = AGX::CounterSamplingContextGen1::validateSampleIndex(v41, v5);
          if ((v44 & 1) != 0 || v45) {
            AGX::CounterSamplingContextGen1::setCounterSampleBuffer(this, v41);
          }
        }
      }
      int v46 = (void *)[(MTLResourceStatePassSampleBufferAttachmentDescriptorArray *)v38 _descriptorAtIndex:1];
      if (v46)
      {
        unsigned int v47 = v46;
        uint64_t v48 = (AGXMTLCounterSampleBuffer *)[v46 sampleBuffer];
        unsigned int v49 = [v47 startOfEncoderSampleIndex];
        unsigned int v50 = [v47 endOfEncoderSampleIndex];
        if (v48)
        {
          unsigned int *v6 = v49;
          unsigned int *v5 = v50;
          char v51 = AGX::CounterSamplingContextGen1::validateSampleIndex(v48, v6);
          int v52 = AGX::CounterSamplingContextGen1::validateSampleIndex(v48, v5);
          if ((v51 & 1) != 0 || v52) {
            AGX::CounterSamplingContextGen1::setCounterSampleBuffer(this, v48);
          }
        }
      }
      unsigned int v53 = (void *)[(MTLResourceStatePassSampleBufferAttachmentDescriptorArray *)v38 _descriptorAtIndex:2];
      if (v53)
      {
        int v54 = v53;
        uint64_t v55 = (AGXMTLCounterSampleBuffer *)[v53 sampleBuffer];
        unsigned int v56 = [v54 startOfEncoderSampleIndex];
        unsigned int v57 = [v54 endOfEncoderSampleIndex];
        if (v55)
        {
          unsigned int *v6 = v56;
          unsigned int *v5 = v57;
          char v58 = AGX::CounterSamplingContextGen1::validateSampleIndex(v55, v6);
          int v59 = AGX::CounterSamplingContextGen1::validateSampleIndex(v55, v5);
          if ((v58 & 1) != 0 || v59) {
            AGX::CounterSamplingContextGen1::setCounterSampleBuffer(this, v55);
          }
        }
      }
      int v60 = (void *)[(MTLResourceStatePassSampleBufferAttachmentDescriptorArray *)v38 _descriptorAtIndex:3];
      if (v60)
      {
        int v61 = v60;
        unsigned int v62 = (AGXMTLCounterSampleBuffer *)[v60 sampleBuffer];
        unsigned int v63 = [v61 startOfEncoderSampleIndex];
        unsigned int v64 = [v61 endOfEncoderSampleIndex];
        if (v62)
        {
          unsigned int *v6 = v63;
          unsigned int *v5 = v64;
          char v65 = AGX::CounterSamplingContextGen1::validateSampleIndex(v62, v6);
          int v66 = AGX::CounterSamplingContextGen1::validateSampleIndex(v62, v5);
          if ((v65 & 1) != 0 || v66) {
            AGX::CounterSamplingContextGen1::setCounterSampleBuffer(this, v62);
          }
        }
      }
    }
  }
  return this;
}

void AGX::Impl::VertexProgramKey::addToDigest(AGX::Impl::VertexProgramKey *this, CC_SHA256state_st *c)
{
  if (atomic_load_explicit((atomic_ullong *volatile)&AGX::defaultVertexDescriptor(void)::once, memory_order_acquire) != -1)
  {
    BOOL v41 = &v39;
    data = &v41;
    std::__call_once(&AGX::defaultVertexDescriptor(void)::once, &data, (void (__cdecl *)(void *))std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultVertexDescriptor(void)::$_0 &&>>);
  }
  unsigned int v4 = (int *)AGX::defaultVertexDescriptor(void)::_desc;
  unint64_t v5 = *((void *)this + 7);
  unsigned int v6 = (v5 >> 10) & 3;
  uint64_t v7 = *(int *)AGX::defaultVertexDescriptor(void)::_desc;
  unsigned int v8 = *(unsigned __int16 *)(AGX::defaultVertexDescriptor(void)::_desc - v7);
  if (v8 < 0x15)
  {
    if (!v6)
    {
LABEL_7:
      uint64_t v10 = -v7;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v9 = *(unsigned __int16 *)(AGX::defaultVertexDescriptor(void)::_desc - v7 + 20);
    if (*(_WORD *)(AGX::defaultVertexDescriptor(void)::_desc - v7 + 20)) {
      LODWORD(v9) = *(unsigned __int8 *)(AGX::defaultVertexDescriptor(void)::_desc + v9);
    }
    if (v6 == v9) {
      goto LABEL_7;
    }
  }
  BOOL v41 = (char *)((v5 >> 10) & 3);
  LOWORD(data) = 20;
  CC_SHA256_Update(c, &data, 2u);
  CC_SHA256_Update(c, &v41, 8u);
  unint64_t v5 = *((void *)this + 7);
  uint64_t v11 = *v4;
  uint64_t v10 = -v11;
  unsigned int v8 = *(unsigned __int16 *)((char *)v4 - v11);
LABEL_10:
  if (v8 < 0x19)
  {
    LODWORD(v12) = 0;
  }
  else
  {
    uint64_t v12 = *(unsigned __int16 *)((char *)v4 + v10 + 24);
    if (*(_WORD *)((char *)v4 + v10 + 24)) {
      LODWORD(v12) = *((unsigned __int8 *)v4 + v12);
    }
  }
  if (((v5 >> 8) & 3) != v12)
  {
    BOOL v41 = (char *)((v5 >> 8) & 3);
    LOWORD(data) = 24;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, &v41, 8u);
  }
  if (*((void *)this + 5))
  {
    LOWORD(v41) = 30;
    CC_SHA256_Update(c, &v41, 2u);
    CC_SHA256_Update(c, (char *)this + 40, 8u);
  }
  uint64_t v13 = *v4;
  uint64_t v14 = -v13;
  int v15 = (char *)v4 - v13;
  unsigned int v16 = *(unsigned __int16 *)((char *)v4 - v13);
  if (v16 >= 0x21 && (uint64_t v17 = *((unsigned __int16 *)v15 + 16)) != 0)
  {
    int v18 = *((_DWORD *)this + 22) & 1;
    if ((v18 == 0) != (*((unsigned char *)v4 + v17) != 0))
    {
      unint64_t v19 = *((void *)this + 7);
      unsigned int v20 = (v19 >> 12) & 3;
      goto LABEL_26;
    }
  }
  else
  {
    if ((*((_DWORD *)this + 22) & 1) == 0) {
      goto LABEL_25;
    }
    int v18 = 1;
  }
  LODWORD(v41) = v18;
  LOWORD(data) = 32;
  CC_SHA256_Update(c, &data, 2u);
  CC_SHA256_Update(c, &v41, 4u);
  uint64_t v21 = *v4;
  uint64_t v14 = -v21;
  unsigned int v16 = *(unsigned __int16 *)((char *)v4 - v21);
LABEL_25:
  unint64_t v19 = *((void *)this + 7);
  unsigned int v20 = (v19 >> 12) & 3;
  if (v16 < 0x1D)
  {
    if (!v20) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
LABEL_26:
  uint64_t v22 = *(unsigned __int16 *)((char *)v4 + v14 + 28);
  if (*(_WORD *)((char *)v4 + v14 + 28)) {
    LODWORD(v22) = *((unsigned __int8 *)v4 + v22);
  }
  if (v20 != v22)
  {
LABEL_29:
    BOOL v41 = (char *)((v19 >> 12) & 3);
    LOWORD(data) = 28;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, &v41, 8u);
    unint64_t v19 = *((void *)this + 7);
    uint64_t v23 = *v4;
    uint64_t v14 = -v23;
    unsigned int v16 = *(unsigned __int16 *)((char *)v4 - v23);
  }
LABEL_30:
  uint64_t v24 = (v19 >> 14) & 0xF;
  if (v16 >= 0x1B && *(_WORD *)((char *)v4 + v14 + 26))
  {
    if (v24 == *(void *)((char *)v4 + *(unsigned __int16 *)((char *)v4 + v14 + 26))) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  if (v24 != 1)
  {
LABEL_35:
    BOOL v41 = (char *)((v19 >> 14) & 0xF);
    LOWORD(data) = 26;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, &v41, 8u);
    unint64_t v19 = *((void *)this + 7);
    uint64_t v25 = *v4;
    uint64_t v14 = -v25;
    unsigned int v16 = *(unsigned __int16 *)((char *)v4 - v25);
  }
LABEL_36:
  if (v16 >= 0x2B && *(_WORD *)((char *)v4 + v14 + 42))
  {
    if (((v19 & 0x80000) == 0) != (*((unsigned char *)v4 + *(unsigned __int16 *)((char *)v4 + v14 + 42)) != 0))
    {
      unsigned int v26 = (v19 >> 20) & 1;
      goto LABEL_43;
    }
  }
  else if ((v19 & 0x80000) == 0)
  {
    goto LABEL_42;
  }
  BOOL v41 = (char *)((v19 >> 19) & 1);
  LOWORD(data) = 42;
  CC_SHA256_Update(c, &data, 2u);
  CC_SHA256_Update(c, &v41, 8u);
  unint64_t v19 = *((void *)this + 7);
  uint64_t v27 = *v4;
  uint64_t v14 = -v27;
  unsigned int v16 = *(unsigned __int16 *)((char *)v4 - v27);
LABEL_42:
  unsigned int v26 = (v19 >> 20) & 1;
  if (v16 < 9) {
    goto LABEL_52;
  }
LABEL_43:
  char v28 = (char *)v4 + v14;
  if (*(_WORD *)((char *)v4 + v14 + 8))
  {
    LODWORD(v29) = 0;
    if (v16 < 0xB || !*((unsigned char *)v4 + *(unsigned __int16 *)((char *)v4 + v14 + 8))) {
      goto LABEL_53;
    }
    goto LABEL_50;
  }
  if (v16 < 0xB)
  {
LABEL_52:
    LODWORD(v29) = 0;
    goto LABEL_53;
  }
LABEL_50:
  uint64_t v29 = *((unsigned __int16 *)v28 + 5);
  if (*((_WORD *)v28 + 5)) {
    LODWORD(v29) = *((unsigned __int8 *)v4 + v29) == 1;
  }
LABEL_53:
  if (v26 != v29)
  {
    BOOL v41 = (char *)((v19 >> 20) & 1);
    LOWORD(data) = 8;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, &v41, 8u);
    unint64_t v19 = *((void *)this + 7);
    uint64_t v30 = *v4;
    uint64_t v14 = -v30;
    unsigned int v16 = *(unsigned __int16 *)((char *)v4 - v30);
  }
  unsigned int v31 = (v19 >> 22) & 1;
  if (v16 < 0x11)
  {
    if (!v31) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
  uint64_t v32 = *(unsigned __int16 *)((char *)v4 + v14 + 16);
  if (*(_WORD *)((char *)v4 + v14 + 16)) {
    LODWORD(v32) = *((unsigned __int8 *)v4 + v32);
  }
  if (v31 != v32)
  {
LABEL_59:
    BOOL v41 = (char *)((v19 >> 22) & 1);
    LOWORD(data) = 16;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, &v41, 8u);
    unint64_t v19 = *((void *)this + 7);
    uint64_t v33 = *v4;
    uint64_t v14 = -v33;
    unsigned int v16 = *(unsigned __int16 *)((char *)v4 - v33);
  }
LABEL_60:
  if (v16 < 0x23 || (uint64_t v34 = *(unsigned __int16 *)((char *)v4 + v14 + 34)) == 0)
  {
    if ((v19 & 0x2000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
  if (((v19 & 0x2000000) == 0) == (*((unsigned char *)v4 + v34) != 0))
  {
LABEL_65:
    BOOL v41 = (char *)((v19 >> 25) & 1);
    LOWORD(data) = 34;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, &v41, 8u);
  }
LABEL_66:
  char v35 = (void *)((char *)this + 144);
  if (*((char *)this + 167) < 0)
  {
    uint64_t v36 = *((void *)this + 19);
    if (!v36) {
      goto LABEL_74;
    }
    char v35 = (void *)*v35;
    goto LABEL_73;
  }
  LODWORD(v36) = *((unsigned __int8 *)this + 167);
  if (*((unsigned char *)this + 167)) {
LABEL_73:
  }
    CC_SHA256_Update(c, v35, v36);
LABEL_74:
  unsigned int v37 = (void *)((char *)this + 168);
  if (*((char *)this + 191) < 0)
  {
    uint64_t v38 = *((void *)this + 22);
    if (!v38) {
      return;
    }
    unsigned int v37 = (void *)*v37;
    goto LABEL_79;
  }
  LODWORD(v38) = *((unsigned __int8 *)this + 191);
  if (*((unsigned char *)this + 191)) {
LABEL_79:
  }
    CC_SHA256_Update(c, v37, v38);
}

void std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultVertexDescriptor(void)::$_0 &&>>()
{
}

uint64_t flatbuffers::FlatBufferBuilder::Finish(uint64_t this, int a2, const char *a3)
{
  uint64_t v4 = this;
  uint64_t v6 = *(void *)(this + 40);
  uint64_t v5 = *(void *)(this + 48);
  *(void *)(this + 56) = v6;
  unint64_t v7 = *(void *)(this + 72);
  unint64_t v8 = (-4 - (*(_DWORD *)(this + 32) + v6 - v5)) & (v7 - 1);
  if (v5 - v6 >= v8)
  {
    *(void *)(this + 48) = v5 - v8;
    if (!v8) {
      goto LABEL_7;
    }
  }
  else
  {
    this = flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)this, v8);
    *(void *)(v4 + 48) -= v8;
  }
  uint64_t v9 = 0;
  do
    *(unsigned char *)(*(void *)(v4 + 48) + v9++) = 0;
  while (v8 != v9);
  unint64_t v7 = *(void *)(v4 + 72);
LABEL_7:
  if (v7 <= 3) {
    *(void *)(v4 + 72) = 4;
  }
  uint64_t v10 = *(void *)(v4 + 32);
  uint64_t v11 = *(void *)(v4 + 40);
  uint64_t v12 = *(void *)(v4 + 48);
  unint64_t v13 = ((_BYTE)v12 - ((_BYTE)v10 + (_BYTE)v11)) & 3;
  if (v12 - *(void *)(v4 + 56) >= v13)
  {
    uint64_t v14 = v12 - v13;
    *(void *)(v4 + 48) = v14;
    if (!v13)
    {
      int v16 = v11 - v14 + v10;
      goto LABEL_17;
    }
  }
  else
  {
    this = flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)v4, ((_BYTE)v12 - ((_BYTE)v10 + (_BYTE)v11)) & 3);
    *(void *)(v4 + 48) -= v13;
  }
  uint64_t v15 = 0;
  do
    *(unsigned char *)(*(void *)(v4 + 48) + v15++) = 0;
  while (v13 != v15);
  uint64_t v11 = *(void *)(v4 + 40);
  uint64_t v14 = *(void *)(v4 + 48);
  uint64_t v10 = *(void *)(v4 + 32);
  int v16 = v11 - v14 + v10;
  if (*(void *)(v4 + 72) <= 3uLL) {
    *(void *)(v4 + 72) = 4;
  }
LABEL_17:
  unint64_t v17 = ((_BYTE)v14 - ((_BYTE)v10 + (_BYTE)v11)) & 3;
  uint64_t v18 = *(void *)(v4 + 56);
  if (v14 - v18 >= v17)
  {
    uint64_t v19 = v14 - v17;
    *(void *)(v4 + 48) = v14 - v17;
    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
    this = flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)v4, v17);
    *(void *)(v4 + 48) -= v17;
  }
  uint64_t v20 = 0;
  do
    *(unsigned char *)(*(void *)(v4 + 48) + v20++) = 0;
  while (v17 != v20);
  uint64_t v19 = *(void *)(v4 + 48);
  uint64_t v18 = *(void *)(v4 + 56);
LABEL_23:
  if ((unint64_t)(v19 - v18) <= 3)
  {
    this = flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)v4, 4uLL);
    uint64_t v19 = *(void *)(v4 + 48);
  }
  *(_DWORD *)(v19 - 4) = v16 - a2 + 4;
  *(void *)(v4 + 48) = v19 - 4;
  *(unsigned char *)(v4 + 71) = 1;
  return this;
}

uint64_t flatbuffers::vector_downward::reallocate(flatbuffers::vector_downward *this, unint64_t a2)
{
  unint64_t v3 = *((void *)this + 4);
  uint64_t v4 = *((void *)this + 5);
  uint64_t v5 = v3 - *((void *)this + 6) + v4;
  uint64_t v6 = *((void *)this + 7) - v4;
  if (v3) {
    unint64_t v7 = v3 >> 1;
  }
  else {
    unint64_t v7 = *((void *)this + 2);
  }
  if (v7 <= a2) {
    unint64_t v7 = a2;
  }
  uint64_t v8 = (*((void *)this + 3) + v3 + v7 - 1) & -*((void *)this + 3);
  *((void *)this + 4) = v8;
  uint64_t v9 = *(void *)this;
  if (v4)
  {
    if (!v9)
    {
      uint64_t v12 = &unk_26F854110;
      operator new[]();
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t, unint64_t, uint64_t, void, void))(*(void *)v9 + 32))(v9, v4, v3, v8, v5, v6);
  }
  else
  {
    if (!v9)
    {
      uint64_t v12 = &unk_26F854110;
      operator new[]();
    }
    uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(*(void *)v9 + 16))(v9, v8);
  }
  uint64_t v11 = result + *((void *)this + 4) - v5;
  *((void *)this + 5) = result;
  *((void *)this + 6) = v11;
  *((void *)this + 7) = result + v6;
  return result;
}

char *flatbuffers::Allocator::reallocate_downward(flatbuffers::Allocator *this, unsigned __int8 *a2, uint64_t a3, uint64_t a4, size_t a5, size_t a6)
{
  uint64_t v12 = (char *)(*(uint64_t (**)(flatbuffers::Allocator *, uint64_t))(*(void *)this + 16))(this, a4);
  memcpy(&v12[a4 - a5], &a2[a3 - a5], a5);
  memcpy(v12, a2, a6);
  (*(void (**)(flatbuffers::Allocator *, unsigned __int8 *, uint64_t))(*(void *)this + 24))(this, a2, a3);
  return v12;
}

void flatbuffers::DefaultAllocator::deallocate(flatbuffers::DefaultAllocator *this, unsigned __int8 *a2)
{
  if (a2) {
    JUMPOUT(0x24566ED70);
  }
}

void flatbuffers::DefaultAllocator::allocate(flatbuffers::DefaultAllocator *this)
{
}

void flatbuffers::DefaultAllocator::~DefaultAllocator(flatbuffers::DefaultAllocator *this)
{
}

uint64_t flatbuffers::FlatBufferBuilder::AddElement<unsigned long long>(uint64_t this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v6 = this;
  if (a3 == a4 && !*(unsigned char *)(this + 80)) {
    return this;
  }
  if (*(void *)(this + 72) <= 7uLL) {
    *(void *)(this + 72) = 8;
  }
  uint64_t v8 = *(void *)(this + 48);
  unint64_t v7 = *(unint64_t **)(this + 56);
  unint64_t v9 = ((_BYTE)v8 - (*(_DWORD *)(this + 32) + *(_DWORD *)(this + 40))) & 7;
  if (v8 - (uint64_t)v7 < v9)
  {
    this = flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)this, ((_BYTE)v8 - (*(_DWORD *)(this + 32) + *(_DWORD *)(this + 40))) & 7);
    *(void *)(v6 + 48) -= v9;
    goto LABEL_8;
  }
  uint64_t v10 = v8 - v9;
  *(void *)(this + 48) = v10;
  if (v9)
  {
LABEL_8:
    uint64_t v11 = 0;
    do
      *(unsigned char *)(*(void *)(v6 + 48) + v11++) = 0;
    while (v9 != v11);
    uint64_t v10 = *(void *)(v6 + 48);
    unint64_t v7 = *(unint64_t **)(v6 + 56);
  }
  if ((unint64_t)(v10 - (void)v7) <= 7)
  {
    this = flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)v6, 8uLL);
    uint64_t v10 = *(void *)(v6 + 48);
    unint64_t v7 = *(unint64_t **)(v6 + 56);
  }
  *(void *)(v10 - 8) = a3;
  uint64_t v12 = v10 - 8;
  *(void *)(v6 + 48) = v12;
  uint64_t v13 = *(void *)(v6 + 32) - v12 + *(void *)(v6 + 40);
  if ((unint64_t)(v12 - (void)v7) <= 7)
  {
    this = flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)v6, 8uLL);
    unint64_t v7 = *(unint64_t **)(v6 + 56);
  }
  unint64_t *v7 = v13 | (unint64_t)(a2 << 32);
  *(void *)(v6 + 56) += 8;
  ++*(_DWORD *)(v6 + 64);
  unsigned int v14 = *(unsigned __int16 *)(v6 + 68);
  if (v14 <= a2) {
    LOWORD(v14) = a2;
  }
  *(_WORD *)(v6 + 68) = v14;
  return this;
}

uint64_t flatbuffers::FlatBufferBuilder::AddElement<unsigned int>(uint64_t this, uint64_t a2)
{
  if (!*(unsigned char *)(this + 80)) {
    return this;
  }
  uint64_t v3 = this;
  if (*(void *)(this + 72) <= 3uLL) {
    *(void *)(this + 72) = 4;
  }
  uint64_t v5 = *(void *)(this + 48);
  uint64_t v4 = *(unint64_t **)(this + 56);
  unint64_t v6 = ((_BYTE)v5 - (*(_DWORD *)(this + 32) + *(_DWORD *)(this + 40))) & 3;
  if (v5 - (uint64_t)v4 < v6)
  {
    this = flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)this, ((_BYTE)v5 - (*(_DWORD *)(this + 32) + *(_DWORD *)(this + 40))) & 3);
    *(void *)(v3 + 48) -= v6;
    goto LABEL_7;
  }
  uint64_t v7 = v5 - v6;
  *(void *)(this + 48) = v7;
  if (v6)
  {
LABEL_7:
    uint64_t v8 = 0;
    do
      *(unsigned char *)(*(void *)(v3 + 48) + v8++) = 0;
    while (v6 != v8);
    uint64_t v7 = *(void *)(v3 + 48);
    uint64_t v4 = *(unint64_t **)(v3 + 56);
  }
  if ((unint64_t)(v7 - (void)v4) <= 3)
  {
    this = flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)v3, 4uLL);
    uint64_t v7 = *(void *)(v3 + 48);
    uint64_t v4 = *(unint64_t **)(v3 + 56);
  }
  *(_DWORD *)(v7 - 4) = 0;
  uint64_t v9 = v7 - 4;
  *(void *)(v3 + 48) = v9;
  uint64_t v10 = *(void *)(v3 + 32) - v9 + *(void *)(v3 + 40);
  if ((unint64_t)(v9 - (void)v4) <= 7)
  {
    this = flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)v3, 8uLL);
    uint64_t v4 = *(unint64_t **)(v3 + 56);
  }
  unint64_t *v4 = v10 | (unint64_t)(a2 << 32);
  *(void *)(v3 + 56) += 8;
  ++*(_DWORD *)(v3 + 64);
  unsigned int v11 = *(unsigned __int16 *)(v3 + 68);
  if (v11 <= a2) {
    LOWORD(v11) = a2;
  }
  *(_WORD *)(v3 + 68) = v11;
  return this;
}

uint64_t flatbuffers::FlatBufferBuilder::EndTable(flatbuffers::FlatBufferBuilder *this, __int16 a2)
{
  if (*((void *)this + 9) <= 3uLL) {
    *((void *)this + 9) = 4;
  }
  uint64_t v4 = *((void *)this + 6);
  uint64_t v5 = *((void *)this + 7);
  unint64_t v6 = ((_BYTE)v4 - (*((_DWORD *)this + 8) + *((_DWORD *)this + 10))) & 3;
  if (v4 - v5 >= v6)
  {
    uint64_t v7 = v4 - v6;
    *((void *)this + 6) = v7;
    if (!v6) {
      goto LABEL_9;
    }
  }
  else
  {
    flatbuffers::vector_downward::reallocate(this, ((_BYTE)v4 - (*((_DWORD *)this + 8) + *((_DWORD *)this + 10))) & 3);
    *((void *)this + 6) -= v6;
  }
  uint64_t v8 = 0;
  do
    *(unsigned char *)(*((void *)this + 6) + v8++) = 0;
  while (v6 != v8);
  uint64_t v7 = *((void *)this + 6);
  uint64_t v5 = *((void *)this + 7);
LABEL_9:
  if ((unint64_t)(v7 - v5) <= 3)
  {
    flatbuffers::vector_downward::reallocate(this, 4uLL);
    uint64_t v7 = *((void *)this + 6);
    uint64_t v5 = *((void *)this + 7);
  }
  *(_DWORD *)(v7 - 4) = 0;
  uint64_t v9 = v7 - 4;
  *((void *)this + 6) = v9;
  uint64_t v10 = *((void *)this + 4) - v9 + *((void *)this + 5);
  if ((unsigned __int16)(*((_WORD *)this + 34) + 2) <= 4u) {
    unint64_t v11 = 4;
  }
  else {
    unint64_t v11 = (unsigned __int16)(*((_WORD *)this + 34) + 2);
  }
  *((_WORD *)this + 34) = v11;
  if (v9 - v5 < v11)
  {
    flatbuffers::vector_downward::reallocate(this, v11);
    uint64_t v9 = *((void *)this + 6);
  }
  *((void *)this + 6) = v9 - v11;
  bzero((void *)(v9 - v11), v11);
  unsigned __int16 v12 = v10 - a2;
  unsigned int v14 = (unsigned __int16 *)*((void *)this + 6);
  unint64_t v13 = *((void *)this + 7);
  v14[1] = v12;
  unsigned __int16 *v14 = *((_WORD *)this + 34);
  uint64_t v15 = *((unsigned int *)this + 16);
  int v16 = (char *)(v13 - 8 * v15);
  if (v15)
  {
    unint64_t v17 = (_WORD *)(v13 - 8 * v15);
    do
    {
      *(unsigned __int16 *)((char *)v14 + (unsigned __int16)v17[2]) = v10 - *v17;
      v17 += 4;
    }
    while ((unint64_t)v17 < v13);
  }
  *((void *)this + 7) = v16;
  *((_DWORD *)this + 16) = 0;
  *((_WORD *)this + 34) = 0;
  uint64_t v19 = *((void *)this + 4);
  unint64_t v18 = *((void *)this + 5);
  LODWORD(v20) = v19 - v14 + v18;
  if (*((unsigned char *)this + 81) && v18 < (unint64_t)v16)
  {
    size_t v21 = *v14;
    uint64_t v22 = v18 + v19;
    uint64_t v23 = (unsigned int *)*((void *)this + 5);
    do
    {
      uint64_t v20 = *v23;
      if (v21 == *(unsigned __int16 *)(v22 - v20) && !memcmp((const void *)(v22 - v20), v14, v21))
      {
        unsigned int v14 = (unsigned __int16 *)((char *)v14 + (v19 - v14 + v18 - v10));
        *((void *)this + 6) = v14;
        goto LABEL_27;
      }
      ++v23;
    }
    while (v23 < (unsigned int *)v16);
    LODWORD(v20) = v19 - v14 + v18;
  }
LABEL_27:
  if (v20 == v19 + v18 - v14)
  {
    if ((unint64_t)((char *)v14 - v16) <= 3)
    {
      flatbuffers::vector_downward::reallocate(this, 4uLL);
      int v16 = (char *)*((void *)this + 7);
      uint64_t v19 = *((void *)this + 4);
      unint64_t v18 = *((void *)this + 5);
    }
    *(_DWORD *)int v16 = v20;
    *((void *)this + 7) = v16 + 4;
  }
  *(_DWORD *)(v18 + v19 - v10) = v20 - v10;
  *((unsigned char *)this + 70) = 0;
  return v10;
}

uint64_t AGX::Impl::MeshProgramKey::addToDigest(AGX::Impl::MeshProgramKey *this, CC_SHA256state_st *a2)
{
  if (atomic_load_explicit((atomic_ullong *volatile)&AGX::defaultMeshDescriptor(void)::once, memory_order_acquire) != -1)
  {
    data = &v31;
    p_data = &data;
    std::__call_once(&AGX::defaultMeshDescriptor(void)::once, &p_data, (void (__cdecl *)(void *))std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultMeshDescriptor(void)::$_0 &&>>);
  }
  uint64_t v4 = (int *)AGX::defaultMeshDescriptor(void)::_desc;
  uint64_t result = (*(uint64_t (**)(AGX::Impl::MeshProgramKey *))(*(void *)this + 40))(this);
  uint64_t v6 = *v4;
  uint64_t v7 = -v6;
  uint64_t v8 = (char *)v4 - v6;
  unsigned int v9 = *(unsigned __int16 *)((char *)v4 - v6);
  if (v9 >= 0x15)
  {
    uint64_t v10 = *((unsigned __int16 *)v8 + 10);
    if (v10)
    {
      if (result == (*((unsigned char *)v4 + v10) != 0)) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  if (result)
  {
LABEL_8:
    LOBYTE(p_data) = (*(uint64_t (**)(AGX::Impl::MeshProgramKey *))(*(void *)this + 40))(this);
    LOWORD(data) = 20;
    CC_SHA256_Update(a2, &data, 2u);
    uint64_t result = CC_SHA256_Update(a2, &p_data, 1u);
    uint64_t v11 = *v4;
    uint64_t v7 = -v11;
    unsigned int v9 = *(unsigned __int16 *)((char *)v4 - v11);
  }
LABEL_9:
  unsigned int v12 = *((_DWORD *)this + 13);
  if (v9 < 0x17 || (uint64_t v13 = *(unsigned __int16 *)((char *)v4 + v7 + 22)) == 0)
  {
    if ((v12 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (((*((_DWORD *)this + 13) & 0x200) == 0) == (*((unsigned char *)v4 + v13) != 0))
  {
LABEL_14:
    LODWORD(data) = (v12 >> 9) & 1;
    LOWORD(p_data) = 22;
    CC_SHA256_Update(a2, &p_data, 2u);
    uint64_t result = CC_SHA256_Update(a2, &data, 4u);
  }
LABEL_15:
  if (*((void *)this + 5))
  {
    LOWORD(data) = 18;
    CC_SHA256_Update(a2, &data, 2u);
    uint64_t result = CC_SHA256_Update(a2, (char *)this + 40, 8u);
  }
  unsigned int v14 = *((_DWORD *)this + 14);
  uint64_t v15 = *v4;
  uint64_t v16 = -v15;
  unint64_t v17 = (char *)v4 - v15;
  unsigned int v18 = *(unsigned __int16 *)((char *)v4 - v15);
  if (v18 >= 0x1D && (uint64_t v19 = *((unsigned __int16 *)v17 + 14)) != 0)
  {
    if (((*((_DWORD *)this + 14) & 0x20) == 0) != (*((unsigned char *)v4 + v19) != 0))
    {
      uint64_t v20 = v14 & 0xF;
      goto LABEL_24;
    }
  }
  else if ((v14 & 0x20) == 0)
  {
    goto LABEL_23;
  }
  LODWORD(data) = (v14 >> 5) & 1;
  LOWORD(p_data) = 28;
  CC_SHA256_Update(a2, &p_data, 2u);
  uint64_t result = CC_SHA256_Update(a2, &data, 4u);
  unsigned int v14 = *((_DWORD *)this + 14);
  uint64_t v21 = *v4;
  uint64_t v16 = -v21;
  unsigned int v18 = *(unsigned __int16 *)((char *)v4 - v21);
LABEL_23:
  uint64_t v20 = v14 & 0xF;
  if (v18 < 0xF) {
    goto LABEL_27;
  }
LABEL_24:
  if (!*(_WORD *)((char *)v4 + v16 + 14))
  {
LABEL_27:
    if (v20 == 1) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  if (*(void *)((char *)v4 + *(unsigned __int16 *)((char *)v4 + v16 + 14)) != v20)
  {
LABEL_28:
    LODWORD(data) = v20;
    LOWORD(p_data) = 14;
    CC_SHA256_Update(a2, &p_data, 2u);
    uint64_t result = CC_SHA256_Update(a2, &data, 4u);
    uint64_t v22 = *v4;
    uint64_t v16 = -v22;
    unsigned int v18 = *(unsigned __int16 *)((char *)v4 - v22);
  }
LABEL_29:
  if (v18 < 7)
  {
    if (*((_DWORD *)this + 15))
    {
LABEL_33:
      LOWORD(data) = 6;
      CC_SHA256_Update(a2, &data, 2u);
      uint64_t result = CC_SHA256_Update(a2, (char *)this + 60, 4u);
      uint64_t v24 = *v4;
      uint64_t v16 = -v24;
      unsigned int v18 = *(unsigned __int16 *)((char *)v4 - v24);
    }
  }
  else
  {
    uint64_t v23 = *(unsigned __int16 *)((char *)v4 + v16 + 6);
    if (*(_WORD *)((char *)v4 + v16 + 6)) {
      uint64_t v23 = *(void *)((char *)v4 + v23);
    }
    if (v23 != *((_DWORD *)this + 15)) {
      goto LABEL_33;
    }
  }
  if (v18 < 9)
  {
    if (!*((_DWORD *)this + 16)) {
      goto LABEL_38;
    }
  }
  else
  {
    uint64_t v25 = *(unsigned __int16 *)((char *)v4 + v16 + 8);
    if (v25) {
      uint64_t v25 = *(void *)((char *)v4 + v25);
    }
    if (v25 == *((_DWORD *)this + 16))
    {
LABEL_38:
      unsigned int v26 = *((_DWORD *)this + 14);
      if ((v26 & 0x80) == 0) {
        goto LABEL_39;
      }
      goto LABEL_48;
    }
  }
  LOWORD(data) = 8;
  CC_SHA256_Update(a2, &data, 2u);
  uint64_t result = CC_SHA256_Update(a2, (char *)this + 64, 4u);
  unsigned int v26 = *((_DWORD *)this + 14);
  if ((v26 & 0x80) == 0)
  {
LABEL_39:
    if ((v26 & 0x100) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_48:
  LODWORD(data) = (v26 >> 7) & 1;
  LOWORD(p_data) = 0x8000;
  CC_SHA256_Update(a2, &p_data, 2u);
  uint64_t result = CC_SHA256_Update(a2, &data, 4u);
  unsigned int v26 = *((_DWORD *)this + 14);
  if ((v26 & 0x100) != 0)
  {
LABEL_40:
    LODWORD(data) = (v26 >> 8) & 1;
    LOWORD(p_data) = -32767;
    CC_SHA256_Update(a2, &p_data, 2u);
    uint64_t result = CC_SHA256_Update(a2, &data, 4u);
  }
LABEL_41:
  uint64_t v27 = (void *)((char *)this + 152);
  if (*((char *)this + 175) < 0)
  {
    uint64_t v28 = *((void *)this + 20);
    if (!v28) {
      goto LABEL_53;
    }
    uint64_t v27 = (void *)*v27;
    goto LABEL_52;
  }
  LODWORD(v28) = *((unsigned __int8 *)this + 175);
  if (*((unsigned char *)this + 175)) {
LABEL_52:
  }
    uint64_t result = CC_SHA256_Update(a2, v27, v28);
LABEL_53:
  uint64_t v29 = (void *)((char *)this + 176);
  if (*((char *)this + 199) < 0)
  {
    uint64_t v30 = *((void *)this + 23);
    if (!v30) {
      return result;
    }
    uint64_t v29 = (void *)*v29;
    return CC_SHA256_Update(a2, v29, v30);
  }
  LODWORD(v30) = *((unsigned __int8 *)this + 199);
  if (*((unsigned char *)this + 199)) {
    return CC_SHA256_Update(a2, v29, v30);
  }
  return result;
}

void std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultMeshDescriptor(void)::$_0 &&>>()
{
}

uint64_t AGX::Impl::ObjectProgramKey::addToDigest(AGX::Impl::ObjectProgramKey *this, CC_SHA256state_st *a2)
{
  if (atomic_load_explicit((atomic_ullong *volatile)&AGX::defaultObjectDescriptor(void)::once, memory_order_acquire) != -1)
  {
    data = &v30;
    p_data = &data;
    std::__call_once(&AGX::defaultObjectDescriptor(void)::once, &p_data, (void (__cdecl *)(void *))std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultObjectDescriptor(void)::$_0 &&>>);
  }
  uint64_t v4 = (int *)AGX::defaultObjectDescriptor(void)::_desc;
  uint64_t result = (*(uint64_t (**)(AGX::Impl::ObjectProgramKey *))(*(void *)this + 40))(this);
  uint64_t v6 = *v4;
  uint64_t v7 = -v6;
  uint64_t v8 = (char *)v4 - v6;
  unsigned int v9 = *(unsigned __int16 *)((char *)v4 - v6);
  if (v9 >= 0x15)
  {
    uint64_t v10 = *((unsigned __int16 *)v8 + 10);
    if (v10)
    {
      if (result == (*((unsigned char *)v4 + v10) != 0)) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  if (result)
  {
LABEL_8:
    LOBYTE(p_data) = (*(uint64_t (**)(AGX::Impl::ObjectProgramKey *))(*(void *)this + 40))(this);
    LOWORD(data) = 20;
    CC_SHA256_Update(a2, &data, 2u);
    uint64_t result = CC_SHA256_Update(a2, &p_data, 1u);
    uint64_t v11 = *v4;
    uint64_t v7 = -v11;
    unsigned int v9 = *(unsigned __int16 *)((char *)v4 - v11);
  }
LABEL_9:
  unsigned int v12 = *((_DWORD *)this + 13);
  if (v9 < 0x17 || (uint64_t v13 = *(unsigned __int16 *)((char *)v4 + v7 + 22)) == 0)
  {
    if ((v12 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
  if (((*((_DWORD *)this + 13) & 0x200) == 0) == (*((unsigned char *)v4 + v13) != 0))
  {
LABEL_14:
    LODWORD(data) = (v12 >> 9) & 1;
    LOWORD(p_data) = 22;
    CC_SHA256_Update(a2, &p_data, 2u);
    uint64_t result = CC_SHA256_Update(a2, &data, 4u);
  }
LABEL_15:
  if (*((void *)this + 5))
  {
    LOWORD(data) = 18;
    CC_SHA256_Update(a2, &data, 2u);
    uint64_t result = CC_SHA256_Update(a2, (char *)this + 40, 8u);
  }
  unint64_t v14 = *((unsigned int *)this + 14);
  uint64_t v15 = *v4;
  uint64_t v16 = -v15;
  unint64_t v17 = (char *)v4 - v15;
  unsigned int v18 = *(unsigned __int16 *)((char *)v4 - v15);
  if (v18 >= 0x1B && (uint64_t v19 = *((unsigned __int16 *)v17 + 13)) != 0)
  {
    BOOL v20 = *((unsigned __int8 *)v4 + v19) != 0;
    int v21 = *((_DWORD *)this + 14) & 1;
    if ((v21 == 0) != v20)
    {
      uint64_t v22 = (v14 >> 3) & 0xF;
      goto LABEL_25;
    }
  }
  else
  {
    if ((v14 & 1) == 0) {
      goto LABEL_24;
    }
    int v21 = 1;
  }
  LODWORD(data) = v21;
  LOWORD(p_data) = 26;
  CC_SHA256_Update(a2, &p_data, 2u);
  uint64_t result = CC_SHA256_Update(a2, &data, 4u);
  LODWORD(v14) = *((_DWORD *)this + 14);
  uint64_t v23 = *v4;
  uint64_t v16 = -v23;
  unsigned int v18 = *(unsigned __int16 *)((char *)v4 - v23);
LABEL_24:
  uint64_t v22 = (v14 >> 3) & 0xF;
  if (v18 < 0xF) {
    goto LABEL_28;
  }
LABEL_25:
  if (!*(_WORD *)((char *)v4 + v16 + 14))
  {
LABEL_28:
    if (v22 == 1) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (*(void *)((char *)v4 + *(unsigned __int16 *)((char *)v4 + v16 + 14)) != v22)
  {
LABEL_29:
    LODWORD(data) = v22;
    LOWORD(p_data) = 14;
    CC_SHA256_Update(a2, &p_data, 2u);
    uint64_t result = CC_SHA256_Update(a2, &data, 4u);
    uint64_t v24 = *v4;
    uint64_t v16 = -v24;
    unsigned int v18 = *(unsigned __int16 *)((char *)v4 - v24);
  }
LABEL_30:
  if (v18 < 7)
  {
    if (*((_DWORD *)this + 15))
    {
LABEL_34:
      LOWORD(data) = 6;
      CC_SHA256_Update(a2, &data, 2u);
      uint64_t result = CC_SHA256_Update(a2, (char *)this + 60, 4u);
      uint64_t v26 = *v4;
      uint64_t v16 = -v26;
      unsigned int v18 = *(unsigned __int16 *)((char *)v4 - v26);
    }
  }
  else
  {
    uint64_t v25 = *(unsigned __int16 *)((char *)v4 + v16 + 6);
    if (*(_WORD *)((char *)v4 + v16 + 6)) {
      uint64_t v25 = *(void *)((char *)v4 + v25);
    }
    if (v25 != *((_DWORD *)this + 15)) {
      goto LABEL_34;
    }
  }
  if (v18 < 9)
  {
    if (*((_DWORD *)this + 16))
    {
LABEL_39:
      LOWORD(data) = 8;
      CC_SHA256_Update(a2, &data, 2u);
      uint64_t result = CC_SHA256_Update(a2, (char *)this + 64, 4u);
    }
  }
  else
  {
    uint64_t v27 = *(unsigned __int16 *)((char *)v4 + v16 + 8);
    if (v27) {
      uint64_t v27 = *(void *)((char *)v4 + v27);
    }
    if (v27 != *((_DWORD *)this + 16)) {
      goto LABEL_39;
    }
  }
  unsigned int v28 = *((_DWORD *)this + 14);
  if ((v28 & 4) != 0)
  {
    LODWORD(data) = (v28 >> 1) & 1;
    LOWORD(p_data) = 0x8000;
    CC_SHA256_Update(a2, &p_data, 2u);
    uint64_t result = CC_SHA256_Update(a2, &data, 4u);
    unsigned int v29 = *((_DWORD *)this + 14);
    if ((v29 & 4) != 0)
    {
      LODWORD(data) = (v29 >> 2) & 1;
      LOWORD(p_data) = -32767;
      CC_SHA256_Update(a2, &p_data, 2u);
      return CC_SHA256_Update(a2, &data, 4u);
    }
  }
  return result;
}

void std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultObjectDescriptor(void)::$_0 &&>>()
{
}

void AGX::Impl::FragmentProgramKey::addToDigest(AGX::Impl::FragmentProgramKey *this, CC_SHA256state_st *c)
{
  if (atomic_load_explicit((atomic_ullong *volatile)&AGX::defaultFragmentDescriptor(void)::once, memory_order_acquire) != -1)
  {
    BOOL v41 = &v39;
    data = &v41;
    std::__call_once(&AGX::defaultFragmentDescriptor(void)::once, &data, (void (__cdecl *)(void *))std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultFragmentDescriptor(void)::$_0 &&>>);
  }
  unsigned int v4 = 0;
  uint64_t v5 = (int *)AGX::defaultFragmentDescriptor(void)::_desc;
  LODWORD(v41) = 0;
  do
  {
    if (*((_DWORD *)this + v4 + 16))
    {
      LOWORD(data) = 22;
      CC_SHA256_Update(c, &data, 2u);
      CC_SHA256_Update(c, &v41, 4u);
      uint64_t v6 = (char *)this + 4 * v41 + 64;
      LOWORD(data) = 22;
      CC_SHA256_Update(c, &data, 2u);
      CC_SHA256_Update(c, v6, 4u);
      unsigned int v4 = v41;
    }
    LODWORD(v41) = ++v4;
  }
  while (v4 < 8);
  if (*((_DWORD *)this + 12))
  {
    LOWORD(v41) = 22;
    CC_SHA256_Update(c, &v41, 2u);
    CC_SHA256_Update(c, (char *)this + 48, 4u);
  }
  unsigned int v7 = *((_DWORD *)this + 10);
  int v8 = (v7 >> 6) & 0x1F;
  uint64_t v9 = *v5;
  unsigned int v10 = *(unsigned __int16 *)((char *)v5 - v9);
  if (v10 < 0x27 || !*(_WORD *)((char *)v5 - v9 + 38))
  {
    if (v8 != 1) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v13 = -v9;
    goto LABEL_16;
  }
  unint64_t v11 = *((unsigned __int8 *)v5 + *(unsigned __int16 *)((char *)v5 - v9 + 38));
  if (v11 > 0xF)
  {
    if (v8) {
      goto LABEL_13;
    }
    goto LABEL_15;
  }
  if (v8 == dword_242EB3418[v11]) {
    goto LABEL_15;
  }
LABEL_13:
  LODWORD(v41) = (v7 >> 6) & 0x1F;
  LOWORD(data) = 38;
  CC_SHA256_Update(c, &data, 2u);
  CC_SHA256_Update(c, &v41, 4u);
  unsigned int v7 = *((_DWORD *)this + 10);
  uint64_t v12 = *v5;
  uint64_t v13 = -v12;
  unsigned int v10 = *(unsigned __int16 *)((char *)v5 - v12);
LABEL_16:
  int v14 = (unsigned __int16)v7 >> 12;
  if (v10 >= 0x2B && *(_WORD *)((char *)v5 + v13 + 42))
  {
    unint64_t v15 = *((unsigned __int8 *)v5 + *(unsigned __int16 *)((char *)v5 + v13 + 42));
    if (v15 > 7)
    {
      if (!((unsigned __int16)v7 >> 12)) {
        goto LABEL_23;
      }
    }
    else if (v14 == dword_242EB3458[v15])
    {
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  if (v14 != 1)
  {
LABEL_22:
    LODWORD(v41) = (unsigned __int16)v7 >> 12;
    LOWORD(data) = 42;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, &v41, 4u);
    unsigned int v7 = *((_DWORD *)this + 10);
    uint64_t v16 = *v5;
    uint64_t v13 = -v16;
    unsigned int v10 = *(unsigned __int16 *)((char *)v5 - v16);
  }
LABEL_23:
  if (v10 >= 9 && *(_WORD *)((char *)v5 + v13 + 8))
  {
    int v17 = v7 & 1;
    if ((v17 == 0) != (*((unsigned char *)v5 + *(unsigned __int16 *)((char *)v5 + v13 + 8)) != 0)) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  if (v7)
  {
    int v17 = 1;
LABEL_29:
    LODWORD(v41) = v17;
    LOWORD(data) = 8;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, &v41, 4u);
    unsigned int v7 = *((_DWORD *)this + 10);
    uint64_t v18 = *v5;
    uint64_t v13 = -v18;
    unsigned int v10 = *(unsigned __int16 *)((char *)v5 - v18);
  }
LABEL_30:
  if (v10 < 0xB || !*(_WORD *)((char *)v5 + v13 + 10))
  {
    if ((v7 & 2) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
  if (((v7 & 2) == 0) == (*((unsigned char *)v5 + *(unsigned __int16 *)((char *)v5 + v13 + 10)) != 0))
  {
LABEL_35:
    LODWORD(v41) = (v7 >> 1) & 1;
    LOWORD(data) = 10;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, &v41, 4u);
    unsigned int v7 = *((_DWORD *)this + 10);
    uint64_t v19 = *v5;
    uint64_t v13 = -v19;
    unsigned int v10 = *(unsigned __int16 *)((char *)v5 - v19);
  }
LABEL_36:
  int v20 = (v7 >> 2) & 1;
  int v21 = (char *)v5 + v13;
  if (v10 < 0x13)
  {
    if (v10 < 0x11) {
      goto LABEL_44;
    }
    goto LABEL_42;
  }
  if (!*((_WORD *)v21 + 9) || *(float *)((char *)v5 + *((unsigned __int16 *)v21 + 9)) == 1.0)
  {
LABEL_42:
    if (*((_WORD *)v21 + 8))
    {
      uint64_t v22 = *(void *)((char *)v5 + *((unsigned __int16 *)v21 + 8));
      goto LABEL_45;
    }
LABEL_44:
    uint64_t v22 = -1;
LABEL_45:
    if (v20 == (v22 != 0xFFFFFFFFLL)) {
      goto LABEL_47;
    }
    goto LABEL_46;
  }
  if (v20 != 1)
  {
LABEL_46:
    LODWORD(v41) = v20;
    LOWORD(data) = 18;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, &v41, 4u);
  }
LABEL_47:
  if (*((void *)this + 7))
  {
    LOWORD(v41) = 28;
    CC_SHA256_Update(c, &v41, 2u);
    CC_SHA256_Update(c, (char *)this + 56, 8u);
  }
  uint64_t v23 = *v5;
  unsigned int v24 = *(unsigned __int16 *)((char *)v5 - v23);
  if (v24 < 0x1F)
  {
    LODWORD(v25) = 0;
  }
  else
  {
    uint64_t v25 = *(unsigned __int16 *)((char *)v5 - v23 + 30);
    if (*(_WORD *)((char *)v5 - v23 + 30)) {
      LODWORD(v25) = *((unsigned __int8 *)v5 + v25) != 0;
    }
  }
  if (*((unsigned __int8 *)this + 224) == v25)
  {
    uint64_t v26 = -v23;
  }
  else
  {
    LOWORD(v41) = 30;
    CC_SHA256_Update(c, &v41, 2u);
    CC_SHA256_Update(c, (char *)this + 224, 1u);
    uint64_t v27 = *v5;
    uint64_t v26 = -v27;
    unsigned int v24 = *(unsigned __int16 *)((char *)v5 - v27);
  }
  unsigned int v28 = *((_DWORD *)this + 26);
  if (v24 >= 0x33 && *(_WORD *)((char *)v5 + v26 + 50))
  {
    if (((*((_DWORD *)this + 26) & 4) == 0) != (*((unsigned char *)v5 + *(unsigned __int16 *)((char *)v5 + v26 + 50)) != 0)) {
      goto LABEL_63;
    }
  }
  else if ((v28 & 4) == 0)
  {
    goto LABEL_62;
  }
  LODWORD(v41) = (v28 >> 2) & 1;
  LOWORD(data) = 50;
  CC_SHA256_Update(c, &data, 2u);
  CC_SHA256_Update(c, &v41, 4u);
  unsigned int v28 = *((_DWORD *)this + 26);
  uint64_t v29 = *v5;
  uint64_t v26 = -v29;
  unsigned int v24 = *(unsigned __int16 *)((char *)v5 - v29);
LABEL_62:
  if (v24 < 0x21) {
    goto LABEL_66;
  }
LABEL_63:
  if (!*(_WORD *)((char *)v5 + v26 + 32))
  {
LABEL_66:
    if ((v28 & 0x40) == 0) {
      goto LABEL_68;
    }
    goto LABEL_67;
  }
  if (((v28 & 0x40) == 0) == (*((unsigned char *)v5 + *(unsigned __int16 *)((char *)v5 + v26 + 32)) != 0))
  {
LABEL_67:
    LODWORD(v41) = (v28 >> 6) & 1;
    LOWORD(data) = 32;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, &v41, 4u);
  }
LABEL_68:
  unsigned int v30 = *((_DWORD *)this + 36);
  if ((_BYTE)v30)
  {
    LOWORD(v41) = 22;
    CC_SHA256_Update(c, &v41, 2u);
    CC_SHA256_Update(c, (char *)this + 112, 0x20u);
    LODWORD(v41) = *((unsigned __int8 *)this + 144);
    LOWORD(data) = 22;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, &v41, 4u);
    unsigned int v30 = *((_DWORD *)this + 36);
  }
  uint64_t v31 = (v30 >> 8) & 0xF;
  uint64_t v32 = *v5;
  unsigned int v33 = *(unsigned __int16 *)((char *)v5 - v32);
  if (v33 >= 0xD && *(_WORD *)((char *)v5 - v32 + 12))
  {
    if (*(void *)((char *)v5 + *(unsigned __int16 *)((char *)v5 - v32 + 12)) != v31)
    {
LABEL_73:
      LODWORD(v41) = (v30 >> 8) & 0xF;
      LOWORD(data) = 12;
      CC_SHA256_Update(c, &data, 2u);
      CC_SHA256_Update(c, &v41, 4u);
      unsigned int v30 = *((_DWORD *)this + 36);
      uint64_t v34 = *v5;
      uint64_t v35 = -v34;
      unsigned int v33 = *(unsigned __int16 *)((char *)v5 - v34);
      goto LABEL_76;
    }
  }
  else if (v31 != 1)
  {
    goto LABEL_73;
  }
  uint64_t v35 = -v32;
LABEL_76:
  uint64_t v36 = (unsigned __int16)v30 >> 12;
  if (v33 < 0xF)
  {
    if (v36)
    {
LABEL_80:
      LODWORD(v41) = v36;
      LOWORD(data) = 14;
      CC_SHA256_Update(c, &data, 2u);
      CC_SHA256_Update(c, &v41, 4u);
    }
  }
  else
  {
    uint64_t v37 = *(unsigned __int16 *)((char *)v5 + v35 + 14);
    if (*(_WORD *)((char *)v5 + v35 + 14)) {
      uint64_t v37 = *(void *)((char *)v5 + v37);
    }
    if (v37 != v36) {
      goto LABEL_80;
    }
  }
  unsigned int v38 = *((_DWORD *)this + 26);
  if ((v38 & 0x100) != 0)
  {
    LODWORD(v41) = (v38 >> 8) & 1;
    LOWORD(data) = 0x8000;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, &v41, 4u);
  }
}

void std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultFragmentDescriptor(void)::$_0 &&>>()
{
}

uint64_t flatbuffers::FlatBufferBuilder::AddElement<unsigned short>(uint64_t this, uint64_t a2)
{
  if (!*(unsigned char *)(this + 80)) {
    return this;
  }
  uint64_t v3 = this;
  if (*(void *)(this + 72) <= 1uLL) {
    *(void *)(this + 72) = 2;
  }
  uint64_t v5 = *(void *)(this + 48);
  unsigned int v4 = *(unint64_t **)(this + 56);
  unint64_t v6 = ((_BYTE)v5 - (*(_DWORD *)(this + 32) + *(_DWORD *)(this + 40))) & 1;
  if (v5 - (uint64_t)v4 < v6)
  {
    this = flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)this, ((_BYTE)v5 - (*(_DWORD *)(this + 32) + *(_DWORD *)(this + 40))) & 1);
    *(void *)(v3 + 48) -= v6;
    goto LABEL_7;
  }
  uint64_t v7 = v5 - v6;
  *(void *)(this + 48) = v7;
  if (v6)
  {
LABEL_7:
    uint64_t v8 = 0;
    do
      *(unsigned char *)(*(void *)(v3 + 48) + v8++) = 0;
    while (v6 != v8);
    uint64_t v7 = *(void *)(v3 + 48);
    unsigned int v4 = *(unint64_t **)(v3 + 56);
  }
  if ((unint64_t)(v7 - (void)v4) <= 1)
  {
    this = flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)v3, 2uLL);
    uint64_t v7 = *(void *)(v3 + 48);
    unsigned int v4 = *(unint64_t **)(v3 + 56);
  }
  *(_WORD *)(v7 - 2) = 0;
  uint64_t v9 = v7 - 2;
  *(void *)(v3 + 48) = v9;
  uint64_t v10 = *(void *)(v3 + 32) - v9 + *(void *)(v3 + 40);
  if ((unint64_t)(v9 - (void)v4) <= 7)
  {
    this = flatbuffers::vector_downward::reallocate((flatbuffers::vector_downward *)v3, 8uLL);
    unsigned int v4 = *(unint64_t **)(v3 + 56);
  }
  unint64_t *v4 = v10 | (unint64_t)(a2 << 32);
  *(void *)(v3 + 56) += 8;
  ++*(_DWORD *)(v3 + 64);
  unsigned int v11 = *(unsigned __int16 *)(v3 + 68);
  if (v11 <= a2) {
    LOWORD(v11) = a2;
  }
  *(_WORD *)(v3 + 68) = v11;
  return this;
}

void AGX::Impl::TileProgramKey::addToDigest(AGX::Impl::TileProgramKey *this, CC_SHA256state_st *c)
{
  if (atomic_load_explicit((atomic_ullong *volatile)&AGX::defaultTileDescriptor(void)::once, memory_order_acquire) != -1)
  {
    data = &v25;
    p_data = &data;
    std::__call_once(&AGX::defaultTileDescriptor(void)::once, &p_data, (void (__cdecl *)(void *))std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultTileDescriptor(void)::$_0 &&>>);
  }
  unsigned int v4 = (int *)AGX::defaultTileDescriptor(void)::_desc;
  if (*((_DWORD *)this + 12))
  {
    LOWORD(data) = 14;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, (char *)this + 48, 4u);
  }
  uint64_t v5 = (_DWORD *)((char *)this + 152);
  uint64_t v6 = *v4;
  uint64_t v7 = -v6;
  uint64_t v8 = (char *)v4 - v6;
  unsigned int v9 = *(unsigned __int16 *)((char *)v4 - v6);
  if (v9 < 5 || (uint64_t v10 = *((unsigned __int16 *)v8 + 2)) == 0)
  {
    if ((*((_DWORD *)this + 39) & 1) == 0) {
      goto LABEL_12;
    }
    int v11 = 1;
    goto LABEL_11;
  }
  int v11 = *((_DWORD *)this + 39) & 1;
  if ((v11 == 0) == (*((unsigned char *)v4 + v10) != 0))
  {
LABEL_11:
    LODWORD(data) = v11;
    LOWORD(p_data) = 4;
    CC_SHA256_Update(c, &p_data, 2u);
    CC_SHA256_Update(c, &data, 4u);
    uint64_t v12 = *v4;
    uint64_t v7 = -v12;
    unsigned int v9 = *(unsigned __int16 *)((char *)v4 - v12);
  }
LABEL_12:
  if (v9 < 7)
  {
    if (*v5)
    {
LABEL_16:
      LOWORD(data) = 6;
      CC_SHA256_Update(c, &data, 2u);
      CC_SHA256_Update(c, (char *)this + 152, 4u);
    }
  }
  else
  {
    uint64_t v13 = *(unsigned __int16 *)((char *)v4 + v7 + 6);
    if (v13) {
      uint64_t v13 = *(void *)((char *)v4 + v13);
    }
    if (v13 != *v5) {
      goto LABEL_16;
    }
  }
  if (*((void *)this + 7))
  {
    LOWORD(data) = 16;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, (char *)this + 56, 8u);
  }
  unsigned int v14 = *((_DWORD *)this + 26);
  unint64_t v15 = (unsigned __int16 *)((char *)v4 - *v4);
  if (*v15 < 0x13u || (uint64_t v16 = v15[9]) == 0)
  {
    if ((v14 & 0x40) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (((*((_DWORD *)this + 26) & 0x40) == 0) == (*((unsigned char *)v4 + v16) != 0))
  {
LABEL_24:
    LODWORD(data) = (v14 >> 6) & 1;
    LOWORD(p_data) = 18;
    CC_SHA256_Update(c, &p_data, 2u);
    CC_SHA256_Update(c, &data, 4u);
  }
LABEL_25:
  unsigned int v17 = *((_DWORD *)this + 36);
  if ((_BYTE)v17)
  {
    LOWORD(data) = 14;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, (char *)this + 112, 0x20u);
    LODWORD(data) = *((unsigned __int8 *)this + 144);
    LOWORD(p_data) = 14;
    CC_SHA256_Update(c, &p_data, 2u);
    CC_SHA256_Update(c, &data, 4u);
    unsigned int v17 = *((_DWORD *)this + 36);
  }
  uint64_t v18 = (v17 >> 8) & 0xF;
  uint64_t v19 = *v4;
  unsigned int v20 = *(unsigned __int16 *)((char *)v4 - v19);
  if (v20 >= 0xB && *(_WORD *)((char *)v4 - v19 + 10))
  {
    if (*(void *)((char *)v4 + *(unsigned __int16 *)((char *)v4 - v19 + 10)) != v18)
    {
LABEL_30:
      LODWORD(data) = (v17 >> 8) & 0xF;
      LOWORD(p_data) = 10;
      CC_SHA256_Update(c, &p_data, 2u);
      CC_SHA256_Update(c, &data, 4u);
      unsigned int v17 = *((_DWORD *)this + 36);
      uint64_t v21 = *v4;
      uint64_t v22 = -v21;
      unsigned int v20 = *(unsigned __int16 *)((char *)v4 - v21);
      goto LABEL_33;
    }
  }
  else if (v18 != 1)
  {
    goto LABEL_30;
  }
  uint64_t v22 = -v19;
LABEL_33:
  uint64_t v23 = (unsigned __int16)v17 >> 12;
  if (v20 < 0xD)
  {
    if (!v23) {
      return;
    }
    goto LABEL_37;
  }
  uint64_t v24 = *(unsigned __int16 *)((char *)v4 + v22 + 12);
  if (*(_WORD *)((char *)v4 + v22 + 12)) {
    uint64_t v24 = *(void *)((char *)v4 + v24);
  }
  if (v24 != v23)
  {
LABEL_37:
    LODWORD(data) = v23;
    LOWORD(p_data) = 12;
    CC_SHA256_Update(c, &p_data, 2u);
    CC_SHA256_Update(c, &data, 4u);
  }
}

void std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultTileDescriptor(void)::$_0 &&>>()
{
}

void AGX::Impl::ComputeProgramKey::addToDigest(AGX::Impl::ComputeProgramKey *this, CC_SHA256state_st *c)
{
  if (atomic_load_explicit((atomic_ullong *volatile)&AGX::defaultComputeDescriptor(void)::once, memory_order_acquire) != -1)
  {
    data = &v20;
    p_data = &data;
    std::__call_once(&AGX::defaultComputeDescriptor(void)::once, &p_data, (void (__cdecl *)(void *))std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultComputeDescriptor(void)::$_0 &&>>);
  }
  unsigned int v4 = (int *)AGX::defaultComputeDescriptor(void)::_desc;
  if (*((void *)this + 5))
  {
    LOWORD(data) = 12;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, (char *)this + 40, 8u);
  }
  uint64_t v5 = 0;
  uint64_t v6 = *v4;
  uint64_t v7 = (char *)v4 - v6;
  unsigned int v8 = *(unsigned __int16 *)((char *)v4 - v6);
  if (v8 >= 7)
  {
    uint64_t v5 = *((unsigned __int16 *)v7 + 3);
    if (*((_WORD *)v7 + 3)) {
      uint64_t v5 = *(void *)((char *)v4 + v5);
    }
  }
  if (v5 == *((_DWORD *)this + 12))
  {
    uint64_t v9 = -v6;
  }
  else
  {
    LOWORD(data) = 6;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, (char *)this + 48, 4u);
    uint64_t v10 = *v4;
    uint64_t v9 = -v10;
    unsigned int v8 = *(unsigned __int16 *)((char *)v4 - v10);
  }
  unsigned int v11 = *((_DWORD *)this + 14);
  if (v8 >= 5 && *(_WORD *)((char *)v4 + v9 + 4))
  {
    int v12 = *((_DWORD *)this + 14) & 1;
    if ((v12 == 0) != (*((unsigned char *)v4 + *(unsigned __int16 *)((char *)v4 + v9 + 4)) != 0)) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  if (v11)
  {
    int v12 = 1;
LABEL_17:
    LODWORD(data) = v12;
    LOWORD(p_data) = 4;
    CC_SHA256_Update(c, &p_data, 2u);
    CC_SHA256_Update(c, &data, 4u);
    unsigned int v11 = *((_DWORD *)this + 14);
    uint64_t v13 = *v4;
    uint64_t v9 = -v13;
    unsigned int v8 = *(unsigned __int16 *)((char *)v4 - v13);
  }
LABEL_18:
  if (v8 >= 0x15 && *(_WORD *)((char *)v4 + v9 + 20))
  {
    if (((v11 & 2) == 0) != (*((unsigned char *)v4 + *(unsigned __int16 *)((char *)v4 + v9 + 20)) != 0))
    {
      unint64_t v15 = (char *)this + 88;
      int v14 = *((unsigned __int8 *)this + 88);
      goto LABEL_25;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_24;
  }
  LODWORD(data) = (v11 >> 1) & 1;
  LOWORD(p_data) = 20;
  CC_SHA256_Update(c, &p_data, 2u);
  CC_SHA256_Update(c, &data, 4u);
  uint64_t v16 = *v4;
  uint64_t v9 = -v16;
  unsigned int v8 = *(unsigned __int16 *)((char *)v4 - v16);
LABEL_24:
  unint64_t v15 = (char *)this + 88;
  int v14 = *((unsigned __int8 *)this + 88);
  if (v8 < 0xF)
  {
    if (!*((unsigned char *)this + 88)) {
      goto LABEL_29;
    }
    goto LABEL_28;
  }
LABEL_25:
  uint64_t v17 = *(unsigned __int16 *)((char *)v4 + v9 + 14);
  if (*(_WORD *)((char *)v4 + v9 + 14)) {
    LODWORD(v17) = *((unsigned __int8 *)v4 + v17) != 0;
  }
  if (v14 != v17)
  {
LABEL_28:
    LOWORD(data) = 14;
    CC_SHA256_Update(c, &data, 2u);
    CC_SHA256_Update(c, v15, 1u);
    uint64_t v18 = *v4;
    uint64_t v9 = -v18;
    unsigned int v8 = *(unsigned __int16 *)((char *)v4 - v18);
  }
LABEL_29:
  unsigned int v19 = *((_DWORD *)this + 14);
  if (v8 >= 0x11 && *(_WORD *)((char *)v4 + v9 + 16))
  {
    if (((*((_DWORD *)this + 14) & 0x20) == 0) != (*((unsigned char *)v4 + *(unsigned __int16 *)((char *)v4 + v9 + 16)) != 0)) {
      return;
    }
  }
  else if ((v19 & 0x20) == 0)
  {
    return;
  }
  LODWORD(data) = (v19 >> 5) & 1;
  LOWORD(p_data) = 16;
  CC_SHA256_Update(c, &p_data, 2u);
  CC_SHA256_Update(c, &data, 4u);
}

void std::__call_once_proxy[abi:nn180100]<std::tuple<AGX::defaultComputeDescriptor(void)::$_0 &&>>()
{
}

uint64_t AGX::GetSerializedVertexFormat(AGX *this, void *a2, size_t *a3, unint64_t *a4, char **a5)
{
  memset(&v90, 0, sizeof(v90));
  memset(&v89, 0, sizeof(v89));
  *a3 = 0;
  *a2 = 0;
  uint64_t v5 = (unsigned __int16 *)((char *)this - *(int *)this);
  unsigned int v6 = *v5;
  if (v6 < 9 || !v5[4] || (int v7 = *((unsigned __int8 *)this + v5[4]), (v7 - 3) <= 0xFFFFFFFD))
  {
    unsigned int v8 = "Error: pipeline must be render or compute";
LABEL_5:
    std::string::append(&v90, v8);
    goto LABEL_6;
  }
  if (v7 != 1)
  {
    if (v6 < 0xB)
    {
      int v14 = 0;
    }
    else
    {
      int v14 = (int *)v5[5];
      if (v14) {
        int v14 = (int *)((char *)v14 + (void)this + *(unsigned int *)((char *)v14 + (void)this));
      }
    }
    uint64_t v24 = (unsigned __int16 *)((char *)v14 - *v14);
    if (*v24 >= 7u && (uint64_t v25 = v24[3]) != 0) {
      uint64_t v26 = (int *)((char *)v14 + v25 + *(unsigned int *)((char *)v14 + v25));
    }
    else {
      uint64_t v26 = 0;
    }
    uint64_t v27 = (unsigned __int16 *)((char *)v26 - *v26);
    if (*v27 >= 0xBu)
    {
      uint64_t v28 = v27[5];
      if (v28)
      {
        uint64_t v29 = (int *)((char *)v26 + v28 + *(unsigned int *)((char *)v26 + v28));
        unsigned int v30 = (unsigned __int16 *)((char *)v29 - *v29);
        unsigned int v31 = *v30;
        if (v30[2]) {
          uint64_t v23 = (int *)((char *)v29 + v30[2] + *(unsigned int *)((char *)v29 + v30[2]));
        }
        else {
          uint64_t v23 = 0;
        }
        if (v31 >= 7)
        {
          if (v30[3]) {
            uint64_t v32 = (unsigned int *)((char *)v29 + v30[3] + *(unsigned int *)((char *)v29 + v30[3]));
          }
          else {
            uint64_t v32 = 0;
          }
          if (v31 < 0xB)
          {
            int v37 = 0;
            if (v31 < 9)
            {
              int v33 = 0;
              int v36 = 0;
              goto LABEL_51;
            }
          }
          else if (v30[5])
          {
            int v37 = *((unsigned __int8 *)v29 + v30[5]);
          }
          else
          {
            int v37 = 0;
          }
          uint64_t v87 = v30[4];
          int v33 = 0;
          if (v87) {
            int v36 = *(unsigned __int16 *)((char *)v29 + v87);
          }
          else {
            int v36 = 0;
          }
          goto LABEL_51;
        }
        int v33 = 0;
        uint64_t v32 = 0;
        goto LABEL_50;
      }
    }
LABEL_6:
    uint64_t v9 = 0;
    if (SHIBYTE(v89.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_133;
    }
    goto LABEL_7;
  }
  if (v6 < 0xB)
  {
    uint64_t v13 = 0;
  }
  else
  {
    uint64_t v13 = (int *)v5[5];
    if (v13) {
      uint64_t v13 = (int *)((char *)v13 + (void)this + *(unsigned int *)((char *)v13 + (void)this));
    }
  }
  unint64_t v15 = (unsigned __int16 *)((char *)v13 - *v13);
  if (*v15 >= 9u && (uint64_t v16 = v15[4]) != 0) {
    uint64_t v17 = (int *)((char *)v13 + v16 + *(unsigned int *)((char *)v13 + v16));
  }
  else {
    uint64_t v17 = 0;
  }
  uint64_t v18 = (unsigned __int16 *)((char *)v17 - *v17);
  unsigned int v19 = *v18;
  if (v19 < 7 || !v18[3]) {
    goto LABEL_6;
  }
  char v20 = (int *)((char *)v17 + v18[3] + *(unsigned int *)((char *)v17 + v18[3]));
  uint64_t v21 = (unsigned __int16 *)((char *)v20 - *v20);
  unsigned int v22 = *v21;
  if (v22 < 5)
  {
    uint64_t v23 = 0;
LABEL_45:
    uint64_t v32 = 0;
    goto LABEL_46;
  }
  if (v21[2]) {
    uint64_t v23 = (int *)((char *)v20 + v21[2] + *(unsigned int *)((char *)v20 + v21[2]));
  }
  else {
    uint64_t v23 = 0;
  }
  if (v22 < 7) {
    goto LABEL_45;
  }
  uint64_t v34 = v21[3];
  if (!v34) {
    goto LABEL_45;
  }
  uint64_t v32 = (unsigned int *)((char *)v20 + v34 + *(unsigned int *)((char *)v20 + v34));
LABEL_46:
  if (v19 < 0x13 || (uint64_t v35 = v18[9]) == 0)
  {
    int v33 = 0;
LABEL_50:
    int v36 = 0;
    int v37 = 0;
    goto LABEL_51;
  }
  int v36 = 0;
  int v37 = 0;
  int v33 = *((unsigned __int8 *)v17 + v35);
LABEL_51:
  uint64_t v38 = *v23;
  *(_WORD *)uint64_t v97 = v33;
  *(_WORD *)unsigned int v96 = v37;
  *(_WORD *)unsigned int v95 = v36;
  if (!v38)
  {
LABEL_103:
    unsigned int v8 = "No active buffer found ";
    goto LABEL_5;
  }
  char v39 = v23 + 1;
  BOOL v41 = v32 + 1;
  uint64_t v40 = *v32;
  if (v40)
  {
    uint64_t v42 = 0;
    unint64_t v43 = 0;
    while (1)
    {
      char v44 = (_DWORD *)((char *)&v39[v42] + v39[v42]);
      int v45 = (unsigned __int16 *)((char *)v44 - *v44);
      unsigned int v46 = *v45;
      if (v46 > 4 && v45[2] && *((unsigned char *)v44 + v45[2]))
      {
        if (v46 < 9 || (uint64_t v47 = v45[4]) == 0)
        {
          LOBYTE(v48) = 0;
LABEL_63:
          v43 |= 1 << v48;
          goto LABEL_64;
        }
        unsigned int v48 = *(int *)((char *)v44 + v47);
        if (v48 <= 0x1E) {
          goto LABEL_63;
        }
      }
LABEL_64:
      for (unint64_t i = 0; i != v40; ++i)
      {
        unsigned int v50 = (int *)((char *)&v41[i] + v41[i]);
        char v51 = (unsigned __int16 *)((char *)v50 - *v50);
        if (*v51 >= 9u)
        {
          uint64_t v52 = v51[4];
          if (v52)
          {
            if (*(void *)((char *)v50 + v52)) {
              continue;
            }
          }
        }
        if (i >= 0x1F) {
LABEL_145:
        }
          abort();
        v43 &= ~(1 << i);
      }
      if (++v42 == v38) {
        goto LABEL_82;
      }
    }
  }
  uint64_t v53 = 0;
  unint64_t v43 = 0;
  do
  {
    uint64_t v55 = v23[v53 + 1];
    uint64_t v56 = v55 - *(int *)((char *)&v23[v53 + 1] + v55);
    unsigned int v57 = (char *)&v23[v53] + v56;
    unsigned int v58 = *((unsigned __int16 *)v57 + 2);
    if (v58 >= 5)
    {
      uint64_t v59 = *((unsigned __int16 *)v57 + 4);
      if (v59)
      {
        if (*((unsigned char *)&v23[v53 + 1] + v55 + v59))
        {
          if (v58 < 9 || (uint64_t v60 = *(unsigned __int16 *)((char *)&v23[v53 + 3] + v56)) == 0)
          {
            LOBYTE(v54) = 0;
LABEL_73:
            v43 |= 1 << v54;
            goto LABEL_74;
          }
          unsigned int v54 = *(_DWORD *)((char *)&v23[v53 + 1] + v55 + v60);
          if (v54 <= 0x1E) {
            goto LABEL_73;
          }
        }
      }
    }
LABEL_74:
    ++v53;
  }
  while (v38 != v53);
LABEL_82:
  if ((v43 & 0x7FFFFFFF) == 0) {
    goto LABEL_103;
  }
  int v88 = v33;
  unsigned int v61 = 0;
  *(_DWORD *)unsigned int v91 = 0;
  while (2)
  {
    unsigned int v63 = (_DWORD *)((char *)&v39[v61] + v39[v61]);
    unsigned int v64 = (unsigned __int16 *)((char *)v63 - *v63);
    unsigned int v65 = *v64;
    if (v65 >= 5)
    {
      if (v64[2])
      {
        int v66 = *((unsigned __int8 *)v63 + v64[2]);
        if (*((unsigned char *)v63 + v64[2]))
        {
          if (v65 < 9)
          {
            LOBYTE(v67) = 0;
LABEL_95:
            if ((v43 >> v67))
            {
              *(_DWORD *)unsigned int v94 = v66;
              std::string::append(&v89, v91, 4uLL);
              std::string::append(&v89, v94, 4uLL);
              unsigned int v68 = (unsigned __int16 *)((char *)v63 - *v63);
              if (*v68 < 9u)
              {
                LODWORD(v69) = 0;
              }
              else
              {
                uint64_t v69 = v68[4];
                if (v69) {
                  LODWORD(v69) = *(int *)((char *)v63 + v69);
                }
              }
              *(_DWORD *)unsigned int v93 = v69;
              std::string::append(&v89, v93, 4uLL);
              char v70 = (unsigned __int16 *)((char *)v63 - *v63);
              if (*v70 < 7u)
              {
                uint64_t v62 = 0;
              }
              else
              {
                uint64_t v62 = v70[3];
                if (v62) {
                  uint64_t v62 = *(void *)((char *)v63 + v62);
                }
              }
              *(void *)__s = v62;
              std::string::append(&v89, __s, 8uLL);
              unsigned int v61 = *(_DWORD *)v91;
              LODWORD(v38) = *v23;
            }
          }
          else
          {
            uint64_t v67 = v64[4];
            if (!v67) {
              goto LABEL_95;
            }
            LODWORD(v67) = *(int *)((char *)v63 + v67);
            if (v67 <= 0x1E) {
              goto LABEL_95;
            }
          }
        }
      }
    }
    *(_DWORD *)unsigned int v91 = ++v61;
    if (v61 < v38) {
      continue;
    }
    break;
  }
  *(_DWORD *)unsigned int v94 = 0;
  unsigned int v71 = *v32;
  if (*v32)
  {
    unsigned __int8 v72 = 0;
    unsigned int v73 = 0;
    do
    {
      BOOL v75 = (int *)((char *)&v41[v73] + v41[v73]);
      int v76 = (unsigned __int16 *)((char *)v75 - *v75);
      if (*v76 >= 9u)
      {
        uint64_t v77 = v76[4];
        if (v77)
        {
          if ((int)v73 <= 30)
          {
            uint64_t v78 = *(void *)((char *)v75 + v77);
            if (v78)
            {
              if (v73 >= 0x1F) {
                goto LABEL_145;
              }
              if ((v43 >> v73))
              {
                *(void *)__s = v78;
                std::string::append(&v89, v94, 4uLL);
                std::string::append(&v89, __s, 8uLL);
                int v79 = (unsigned __int16 *)((char *)v75 - *v75);
                if (*v79 >= 5u && (uint64_t v80 = v79[2]) != 0) {
                  int v81 = *((unsigned __int8 *)v75 + v80);
                }
                else {
                  int v81 = 1;
                }
                *(_DWORD *)unsigned int v93 = v81;
                std::string::append(&v89, v93, 4uLL);
                unsigned int v82 = (unsigned __int16 *)((char *)v75 - *v75);
                if (*v82 >= 7u && (uint64_t v83 = v82[3]) != 0) {
                  uint64_t v74 = *(void *)((char *)v75 + v83);
                }
                else {
                  uint64_t v74 = 1;
                }
                v72 |= *(_DWORD *)v93 == 4;
                *(void *)unsigned int v91 = v74;
                std::string::append(&v89, v91, 8uLL);
                unsigned int v73 = *(_DWORD *)v94;
                unsigned int v71 = *v32;
              }
            }
          }
        }
      }
      *(_DWORD *)unsigned int v94 = ++v73;
    }
    while (v73 < v71);
    if (((v88 != 0) & v72) != 0) {
      std::string::append(&v89, v97, 2uLL);
    }
  }
  if (v37 | v36)
  {
    std::string::append(&v89, v96, 2uLL);
    std::string::append(&v89, v95, 2uLL);
  }
  if ((v89.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    std::string::size_type size = HIBYTE(v89.__r_.__value_.__r.__words[2]);
  }
  else {
    std::string::size_type size = v89.__r_.__value_.__l.__size_;
  }
  *a3 = size;
  unsigned int v85 = malloc_type_malloc(size, 0x137A706DuLL);
  *a2 = v85;
  if ((v89.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0) {
    uint64_t v86 = &v89;
  }
  else {
    uint64_t v86 = (std::string *)v89.__r_.__value_.__r.__words[0];
  }
  memcpy(v85, v86, *a3);
  uint64_t v9 = 1;
  if ((SHIBYTE(v89.__r_.__value_.__r.__words[2]) & 0x80000000) == 0)
  {
LABEL_7:
    if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0) {
      goto LABEL_134;
    }
    return v9;
  }
LABEL_133:
  operator delete(v89.__r_.__value_.__l.__data_);
  if (SHIBYTE(v90.__r_.__value_.__r.__words[2]) < 0) {
LABEL_134:
  }
    operator delete(v90.__r_.__value_.__l.__data_);
  return v9;
}

char **ProgramKeyDynamicLibrariesImpl<true>::ProgramKeyDynamicLibrariesImpl(char **a1, void *a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  unint64_t v4 = [a2 count];
  unint64_t v5 = v4;
  unsigned int v6 = *a1;
  if (v4 > (a1[2] - *a1) >> 5)
  {
    if (v4 >> 59) {
      abort();
    }
    int v7 = a1[1];
    unsigned int v8 = (char *)operator new(32 * v4);
    uint64_t v9 = &v8[(v7 - v6) & 0xFFFFFFFFFFFFFFE0];
    uint64_t v10 = v9;
    if (v7 != v6)
    {
      unsigned int v11 = &v8[(v7 - v6) & 0xFFFFFFFFFFFFFFE0];
      do
      {
        long long v12 = *((_OWORD *)v7 - 1);
        uint64_t v10 = v11 - 32;
        *((_OWORD *)v11 - 2) = *((_OWORD *)v7 - 2);
        *((_OWORD *)v11 - 1) = v12;
        v7 -= 32;
        v11 -= 32;
      }
      while (v7 != v6);
    }
    *a1 = v10;
    a1[1] = v9;
    a1[2] = &v8[32 * v5];
    if (v6) {
      operator delete(v6);
    }
  }
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v16 = (long long *)objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", i, v29, v30), "libraryUUID");
      long long v29 = *v16;
      long long v30 = v16[1];
      uint64_t v18 = a1[1];
      unint64_t v17 = (unint64_t)a1[2];
      if ((unint64_t)v18 < v17)
      {
        long long v14 = v16[1];
        *(_OWORD *)uint64_t v18 = *v16;
        *((_OWORD *)v18 + 1) = v14;
        unint64_t v15 = v18 + 32;
      }
      else
      {
        unsigned int v19 = *a1;
        uint64_t v20 = (v18 - *a1) >> 5;
        unint64_t v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 59) {
          abort();
        }
        uint64_t v22 = v17 - (void)v19;
        if (v22 >> 4 > v21) {
          unint64_t v21 = v22 >> 4;
        }
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v23 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v21;
        }
        if (v23)
        {
          if (v23 >> 59) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v24 = (char *)operator new(32 * v23);
        }
        else
        {
          uint64_t v24 = 0;
        }
        uint64_t v25 = &v24[32 * v20];
        *(_OWORD *)uint64_t v25 = v29;
        *((_OWORD *)v25 + 1) = v30;
        uint64_t v26 = v25;
        if (v18 != v19)
        {
          do
          {
            long long v27 = *((_OWORD *)v18 - 1);
            *((_OWORD *)v26 - 2) = *((_OWORD *)v18 - 2);
            *((_OWORD *)v26 - 1) = v27;
            v26 -= 32;
            v18 -= 32;
          }
          while (v18 != v19);
          uint64_t v18 = *a1;
        }
        unint64_t v15 = v25 + 32;
        *a1 = v26;
        a1[1] = v25 + 32;
        a1[2] = &v24[32 * v23];
        if (v18) {
          operator delete(v18);
        }
      }
      a1[1] = v15;
    }
  }
  return a1;
}

void sub_242E9DB64(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

char **ProgramKeyDynamicLibrariesImpl<false>::ProgramKeyDynamicLibrariesImpl(char **a1, void *a2)
{
  *a1 = 0;
  a1[1] = 0;
  a1[2] = 0;
  unint64_t v4 = [a2 count];
  unint64_t v5 = v4;
  unsigned int v6 = *a1;
  if (v4 > (a1[2] - *a1) >> 5)
  {
    if (v4 >> 59) {
      abort();
    }
    int v7 = a1[1];
    unsigned int v8 = (char *)operator new(32 * v4);
    uint64_t v9 = &v8[(v7 - v6) & 0xFFFFFFFFFFFFFFE0];
    uint64_t v10 = v9;
    if (v7 != v6)
    {
      unsigned int v11 = &v8[(v7 - v6) & 0xFFFFFFFFFFFFFFE0];
      do
      {
        long long v12 = *((_OWORD *)v7 - 1);
        uint64_t v10 = v11 - 32;
        *((_OWORD *)v11 - 2) = *((_OWORD *)v7 - 2);
        *((_OWORD *)v11 - 1) = v12;
        v7 -= 32;
        v11 -= 32;
      }
      while (v7 != v6);
    }
    *a1 = v10;
    a1[1] = v9;
    a1[2] = &v8[32 * v5];
    if (v6) {
      operator delete(v6);
    }
  }
  if (v5)
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      uint64_t v16 = (long long *)objc_msgSend((id)objc_msgSend(a2, "objectAtIndex:", i, v29, v30), "libraryUUID");
      long long v29 = *v16;
      long long v30 = v16[1];
      uint64_t v18 = a1[1];
      unint64_t v17 = (unint64_t)a1[2];
      if ((unint64_t)v18 < v17)
      {
        long long v14 = v16[1];
        *(_OWORD *)uint64_t v18 = *v16;
        *((_OWORD *)v18 + 1) = v14;
        unint64_t v15 = v18 + 32;
      }
      else
      {
        unsigned int v19 = *a1;
        uint64_t v20 = (v18 - *a1) >> 5;
        unint64_t v21 = v20 + 1;
        if ((unint64_t)(v20 + 1) >> 59) {
          abort();
        }
        uint64_t v22 = v17 - (void)v19;
        if (v22 >> 4 > v21) {
          unint64_t v21 = v22 >> 4;
        }
        if ((unint64_t)v22 >= 0x7FFFFFFFFFFFFFE0) {
          unint64_t v23 = 0x7FFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v23 = v21;
        }
        if (v23)
        {
          if (v23 >> 59) {
            std::__throw_bad_array_new_length[abi:nn180100]();
          }
          uint64_t v24 = (char *)operator new(32 * v23);
        }
        else
        {
          uint64_t v24 = 0;
        }
        uint64_t v25 = &v24[32 * v20];
        *(_OWORD *)uint64_t v25 = v29;
        *((_OWORD *)v25 + 1) = v30;
        uint64_t v26 = v25;
        if (v18 != v19)
        {
          do
          {
            long long v27 = *((_OWORD *)v18 - 1);
            *((_OWORD *)v26 - 2) = *((_OWORD *)v18 - 2);
            *((_OWORD *)v26 - 1) = v27;
            v26 -= 32;
            v18 -= 32;
          }
          while (v18 != v19);
          uint64_t v18 = *a1;
        }
        unint64_t v15 = v25 + 32;
        *a1 = v26;
        a1[1] = v25 + 32;
        a1[2] = &v24[32 * v23];
        if (v18) {
          operator delete(v18);
        }
      }
      a1[1] = v15;
    }
  }
  return a1;
}

void sub_242E9DDA0(_Unwind_Exception *exception_object)
{
  uint64_t v3 = *(void **)v1;
  if (*(void *)v1)
  {
    *(void *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void ProgramKeyVisibleFunctionTableImpl<false>::ProgramKeyVisibleFunctionTableImpl(MTLLinkedFunctions *)::{lambda(NSArray *,unsigned char)#1}::operator()(int8x16_t **a1, void *a2, unsigned int a3)
{
  if ([a2 count])
  {
    unsigned int v6 = (uint64_t *)objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", 0), "bitCodeHash");
    uint64_t v8 = *v6;
    uint64_t v7 = v6[1];
    uint64_t v9 = v6[2];
    uint64_t v10 = v6[3];
    if ((unint64_t)[a2 count] >= 2)
    {
      unint64_t v11 = 1;
      do
      {
        long long v12 = objc_msgSend((id)objc_msgSend(a2, "objectAtIndexedSubscript:", v11), "bitCodeHash");
        v8 ^= *v12;
        v7 ^= v12[1];
        v9 ^= v12[2];
        v10 ^= v12[3];
        ++v11;
      }
      while (v11 < [a2 count]);
    }
    long long v14 = a1[1];
    unint64_t v13 = (unint64_t)a1[2];
    if ((unint64_t)v14 >= v13)
    {
      uint64_t v16 = *a1;
      uint64_t v17 = ((char *)v14 - (char *)*a1) >> 5;
      unint64_t v18 = v17 + 1;
      if ((unint64_t)(v17 + 1) >> 59) {
        goto LABEL_42;
      }
      uint64_t v19 = v13 - (void)v16;
      if (v19 >> 4 > v18) {
        unint64_t v18 = v19 >> 4;
      }
      if ((unint64_t)v19 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v20 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v20 = v18;
      }
      if (v20)
      {
        if (v20 >> 59) {
          goto LABEL_43;
        }
        unint64_t v21 = (char *)operator new(32 * v20);
      }
      else
      {
        unint64_t v21 = 0;
      }
      uint64_t v22 = &v21[32 * v17];
      *(void *)uint64_t v22 = v8;
      *((void *)v22 + 1) = v7;
      *((void *)v22 + 2) = v9;
      *((void *)v22 + 3) = v10;
      unint64_t v15 = (int8x16_t *)(v22 + 32);
      if (v14 != v16)
      {
        do
        {
          int8x16_t v23 = v14[-1];
          *((int8x16_t *)v22 - 2) = v14[-2];
          *((int8x16_t *)v22 - 1) = v23;
          v22 -= 32;
          v14 -= 2;
        }
        while (v14 != v16);
        long long v14 = *a1;
      }
      *a1 = (int8x16_t *)v22;
      a1[1] = v15;
      a1[2] = (int8x16_t *)&v21[32 * v20];
      if (v14) {
        operator delete(v14);
      }
    }
    else
    {
      v14->i64[0] = v8;
      v14->i64[1] = v7;
      unint64_t v15 = v14 + 2;
      v14[1].i64[0] = v9;
      v14[1].i64[1] = v10;
    }
    a1[1] = v15;
    unint64_t v24 = (unint64_t)a1[2];
    if ((unint64_t)v15 < v24)
    {
      int8x16_t v25 = vdupq_n_s8(a3);
      int8x16_t *v15 = v25;
      v15[1] = v25;
      uint64_t v26 = v15 + 2;
      goto LABEL_40;
    }
    long long v27 = *a1;
    uint64_t v28 = ((char *)v15 - (char *)*a1) >> 5;
    unint64_t v29 = v28 + 1;
    if (!((unint64_t)(v28 + 1) >> 59))
    {
      uint64_t v30 = v24 - (void)v27;
      if (v30 >> 4 > v29) {
        unint64_t v29 = v30 >> 4;
      }
      if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFE0) {
        unint64_t v31 = 0x7FFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v31 = v29;
      }
      if (!v31)
      {
        uint64_t v32 = 0;
        goto LABEL_34;
      }
      if (!(v31 >> 59))
      {
        uint64_t v32 = (char *)operator new(32 * v31);
LABEL_34:
        int8x16_t v33 = vdupq_n_s8(a3);
        uint64_t v34 = (int8x16_t *)&v32[32 * v28];
        uint64_t v35 = (int8x16_t *)&v32[32 * v31];
        *uint64_t v34 = v33;
        v34[1] = v33;
        uint64_t v26 = v34 + 2;
        if (v15 == v27)
        {
          *a1 = v34;
          a1[1] = v26;
          a1[2] = v35;
        }
        else
        {
          do
          {
            int8x16_t v36 = v15[-1];
            v34[-2] = v15[-2];
            v34[-1] = v36;
            v34 -= 2;
            v15 -= 2;
          }
          while (v15 != v27);
          unint64_t v15 = *a1;
          *a1 = v34;
          a1[1] = v26;
          a1[2] = v35;
          if (!v15) {
            goto LABEL_40;
          }
        }
        operator delete(v15);
LABEL_40:
        a1[1] = v26;
        return;
      }
LABEL_43:
      std::__throw_bad_array_new_length[abi:nn180100]();
    }
LABEL_42:
    abort();
  }
}

uint64_t AGX::MeshProgramKey::initCommon<MTLRenderPipelineDescriptor>(uint64_t a1, void *a2)
{
  unint64_t v4 = (void *)[a2 driverCompilerOptions];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "meshLinkedFunctions"), "binaryFunctions"), "count");
  int v6 = [a2 supportAddingMeshBinaryFunctions];
  if (objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"disableTextureRWBoundsCheck"), "BOOLValue"))int v7 = 4; {
  else
  }
    int v7 = 0;
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a1 + 52) & 0xFFFFFFFB | v7;
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a1 + 52) & 0xFC0003FF | ((unsigned __int16)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"maxNumRegisters"), "unsignedIntValue") << 10);
  if (objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"agx_enable_stack_shadow"), "BOOLValue"))int v8 = 0x8000000; {
  else
  }
    int v8 = 0;
  unsigned int v9 = *(_DWORD *)(a1 + 52) & 0xF7FFFDFF;
  if (v5) {
    int v10 = 1;
  }
  else {
    int v10 = v6;
  }
  if (v10) {
    int v11 = 512;
  }
  else {
    int v11 = 0;
  }
  *(_DWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 52) = v8 | v9 | v11;
  long long v12 = (void *)[a2 meshBuffers];
  uint64_t v13 = 0;
  for (uint64_t i = 0; i != 31; ++i)
  {
    uint64_t v15 = objc_msgSend((id)objc_msgSend(v12, "_descriptorAtIndex:", i), "mutability");
    uint64_t v16 = 1 << i;
    if (v15 != 1) {
      uint64_t v16 = 0;
    }
    v13 |= v16;
  }
  *(void *)(a1 + 40) = v13;
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a1 + 96) & 0xFFFFFFFE | [a2 supportIndirectCommandBuffers];
  *(_DWORD *)(a1 + 60) = [a2 maxTotalThreadsPerMeshThreadgroup];
  *(_DWORD *)(a1 + 64) = 0;
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a1 + 56) & 0xFFFFFFF0 | [a2 maxVertexAmplificationCount] & 0xF;
  uint64_t result = [a2 needsCustomBorderColorSamplers];
  if (result) {
    int v18 = 32;
  }
  else {
    int v18 = 0;
  }
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a1 + 56) & 0xFFFFFFDF | v18;
  return result;
}

uint64_t AGX::MeshProgramKey::initCommon<MTLMeshRenderPipelineDescriptor>(uint64_t a1, void *a2)
{
  unint64_t v4 = (void *)[a2 driverCompilerOptions];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "meshLinkedFunctions"), "binaryFunctions"), "count");
  int v6 = [a2 supportAddingMeshBinaryFunctions];
  if (objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"disableTextureRWBoundsCheck"), "BOOLValue"))int v7 = 4; {
  else
  }
    int v7 = 0;
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a1 + 52) & 0xFFFFFFFB | v7;
  *(_DWORD *)(a1 + 52) = *(_DWORD *)(a1 + 52) & 0xFC0003FF | ((unsigned __int16)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"maxNumRegisters"), "unsignedIntValue") << 10);
  if (objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"agx_enable_stack_shadow"), "BOOLValue"))int v8 = 0x8000000; {
  else
  }
    int v8 = 0;
  unsigned int v9 = *(_DWORD *)(a1 + 52) & 0xF7FFFDFF;
  if (v5) {
    int v10 = 1;
  }
  else {
    int v10 = v6;
  }
  if (v10) {
    int v11 = 512;
  }
  else {
    int v11 = 0;
  }
  *(_DWORD *)(a1 + 48) = 0;
  *(_DWORD *)(a1 + 52) = v8 | v9 | v11;
  long long v12 = (void *)[a2 meshBuffers];
  uint64_t v13 = 0;
  for (uint64_t i = 0; i != 31; ++i)
  {
    uint64_t v15 = objc_msgSend((id)objc_msgSend(v12, "_descriptorAtIndex:", i), "mutability");
    uint64_t v16 = 1 << i;
    if (v15 != 1) {
      uint64_t v16 = 0;
    }
    v13 |= v16;
  }
  *(void *)(a1 + 40) = v13;
  *(_DWORD *)(a1 + 96) = *(_DWORD *)(a1 + 96) & 0xFFFFFFFE | [a2 supportIndirectCommandBuffers];
  int v17 = [a2 maxTotalThreadsPerMeshThreadgroup];
  int v18 = [a2 payloadMemoryLength];
  *(_DWORD *)(a1 + 60) = v17;
  *(_DWORD *)(a1 + 64) = v18;
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a1 + 56) & 0xFFFFFFF0 | [a2 maxVertexAmplificationCount] & 0xF;
  uint64_t result = [a2 needsCustomBorderColorSamplers];
  if (result) {
    int v20 = 32;
  }
  else {
    int v20 = 0;
  }
  *(_DWORD *)(a1 + 56) = *(_DWORD *)(a1 + 56) & 0xFFFFFFDF | v20;
  return result;
}

NSUInteger AGX::VertexProgramKey::initCommon(AGX::VertexProgramKey *this, MTLRenderPipelineDescriptor *a2)
{
  unint64_t v4 = (void *)[(MTLRenderPipelineDescriptor *)a2 driverCompilerOptions];
  NSUInteger v5 = [(NSArray *)[(MTLLinkedFunctions *)[(MTLRenderPipelineDescriptor *)a2 vertexLinkedFunctions] binaryFunctions] count];
  BOOL v6 = [(MTLRenderPipelineDescriptor *)a2 supportAddingVertexBinaryFunctions];
  if (objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"disableTextureRWBoundsCheck"), "BOOLValue"))int v7 = 4; {
  else
  }
    int v7 = 0;
  *((_DWORD *)this + 13) = *((_DWORD *)this + 13) & 0xFFFFFFFB | v7;
  *((_DWORD *)this + 13) = *((_DWORD *)this + 13) & 0xFC0003FF | ((unsigned __int16)objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"maxNumRegisters"), "unsignedIntValue") << 10);
  if (objc_msgSend((id)objc_msgSend(v4, "objectForKeyedSubscript:", @"agx_enable_stack_shadow"), "BOOLValue"))int v8 = 0x8000000; {
  else
  }
    int v8 = 0;
  if (v5) {
    int v9 = 1;
  }
  else {
    int v9 = v6;
  }
  if (v9) {
    int v10 = 512;
  }
  else {
    int v10 = 0;
  }
  *((_DWORD *)this + 13) = v8 | *((_DWORD *)this + 13) & 0xF7FFFDFF | v10;
  *((unsigned char *)this + 56) = [(MTLRenderPipelineDescriptor *)a2 clipDistanceEnableMask];
  *((_DWORD *)this + 12) = [(MTLRenderPipelineDescriptor *)a2 vertexDepthCompareClampMask];
  *((void *)this + 7) = *((void *)this + 7) & 0xFFFFFFFFFFFFF3FFLL | (([(MTLRenderPipelineDescriptor *)a2 tessellationFactorStepFunction] & 3) << 10);
  *((void *)this + 7) = *((void *)this + 7) & 0xFFFFFFFFFFFFFCFFLL | (([(MTLRenderPipelineDescriptor *)a2 tessellationPartitionMode] & 3) << 8);
  int v11 = [(MTLRenderPipelineDescriptor *)a2 vertexBuffers];
  uint64_t v12 = 0;
  for (uint64_t i = 0; i != 31; ++i)
  {
    uint64_t v14 = objc_msgSend((id)-[MTLPipelineBufferDescriptorArray _descriptorAtIndex:](v11, "_descriptorAtIndex:", i), "mutability");
    uint64_t v15 = 1 << i;
    if (v14 != 1) {
      uint64_t v15 = 0;
    }
    v12 |= v15;
  }
  *((void *)this + 5) = v12;
  *((_DWORD *)this + 22) = *((_DWORD *)this + 22) & 0xFFFFFFFE | [(MTLRenderPipelineDescriptor *)a2 supportIndirectCommandBuffers];
  *((void *)this + 7) = *((void *)this + 7) & 0xFFFFFFFFFFFFCFFFLL | (([(MTLRenderPipelineDescriptor *)a2 vertexAmplificationMode] & 3) << 12);
  *((void *)this + 7) = *((void *)this + 7) & 0xFFFFFFFFFFFC3FFFLL | (([(MTLRenderPipelineDescriptor *)a2 maxVertexAmplificationCount] & 0xF) << 14);
  int v16 = [(MTLRenderPipelineDescriptor *)a2 needsCustomBorderColorSamplers];
  uint64_t v17 = 0x80000;
  if (!v16) {
    uint64_t v17 = 0;
  }
  *((void *)this + 7) = *((void *)this + 7) & 0xFFFFFFFFFFF7FFFFLL | v17;
  BOOL v18 = [(MTLRenderPipelineDescriptor *)a2 isRasterizationEnabled];
  unint64_t v19 = 0;
  if (v18) {
    unint64_t v19 = (unint64_t)([(MTLRenderPipelineDescriptor *)a2 inputPrimitiveTopology] == MTLPrimitiveTopologyClassPoint) << 20;
  }
  *((void *)this + 7) = *((void *)this + 7) & 0xFFFFFFFFFFEFFFFFLL | v19;
  *((void *)this + 7) = *((void *)this + 7) & 0xFFFFFFFFFFBFFFFFLL | (([(MTLRenderPipelineDescriptor *)a2 tessellationFactorFormat] & 1) << 22);
  NSUInteger result = [(MTLRenderPipelineDescriptor *)a2 supportAddingVertexBinaryFunctions];
  if (result)
  {
    unint64_t v21 = 0x2000000;
  }
  else
  {
    NSUInteger result = [(NSArray *)[(MTLLinkedFunctions *)[(MTLRenderPipelineDescriptor *)a2 vertexLinkedFunctions] binaryFunctions] count];
    unint64_t v21 = (unint64_t)(result != 0) << 25;
  }
  *((void *)this + 7) = *((void *)this + 7) & 0xFFFFFFFFFDFFFFFFLL | v21;
  return result;
}

uint64_t AGX::SamplerDescriptor::SamplerDescriptor(uint64_t result, int *a2)
{
  unsigned int v2 = (unsigned __int16 *)((char *)a2 - *a2);
  unsigned int v3 = *v2;
  if (v3 < 0xD)
  {
    if (v3 < 0xB)
    {
      if (v3 <= 4)
      {
        __int16 v21 = 0;
        LOBYTE(v17) = 0;
        LOBYTE(v12) = 0;
        LOBYTE(v9) = 0;
        LOBYTE(v4) = 0;
        LODWORD(v6) = 0;
        LODWORD(v8) = 0;
        LOBYTE(v11) = 0;
        LODWORD(v13) = 0;
        char v16 = 0;
        __int16 v20 = 0;
        __int16 v22 = 0;
        *(void *)(result + 48) = 0;
        *(void *)(result + 56) = 0;
        *(void *)(result + 64) = 0;
        int v15 = 0;
        int v14 = 0;
        int v10 = 0;
        goto LABEL_53;
      }
      LODWORD(v8) = 0;
      LODWORD(v6) = 0;
      LOBYTE(v4) = 0;
      uint64_t v5 = 0;
      goto LABEL_18;
    }
    uint64_t v5 = 0;
    LOBYTE(v4) = 0;
    uint64_t v6 = v2[5];
    if (v2[5]) {
      goto LABEL_5;
    }
  }
  else
  {
    uint64_t v4 = v2[6];
    if (v2[6]) {
      LODWORD(v4) = *((char *)a2 + v4);
    }
    uint64_t v5 = v4;
    uint64_t v6 = v2[5];
    if (v2[5]) {
LABEL_5:
    }
      LODWORD(v6) = *((char *)a2 + v6);
  }
  if (v3 < 0xF)
  {
    LODWORD(v8) = 0;
LABEL_18:
    int v7 = 0;
    goto LABEL_19;
  }
  if (v2[7])
  {
    int v7 = *((char *)a2 + v2[7]);
    if (v3 >= 0x15) {
      goto LABEL_9;
    }
  }
  else
  {
    int v7 = 0;
    if (v3 >= 0x15)
    {
LABEL_9:
      uint64_t v8 = v2[10];
      if (v2[10])
      {
        LODWORD(v8) = *((unsigned __int8 *)a2 + v8);
        uint64_t v9 = v2[2];
        if (!v2[2]) {
          goto LABEL_21;
        }
LABEL_20:
        LOBYTE(v9) = *((unsigned char *)a2 + v9);
        goto LABEL_21;
      }
LABEL_19:
      uint64_t v9 = v2[2];
      if (!v2[2]) {
        goto LABEL_21;
      }
      goto LABEL_20;
    }
  }
  LODWORD(v8) = 0;
  uint64_t v9 = v2[2];
  if (v2[2]) {
    goto LABEL_20;
  }
LABEL_21:
  int v10 = 0;
  if (v3 < 7)
  {
    char v16 = 0;
    LODWORD(v13) = 0;
    LOBYTE(v11) = 0;
LABEL_41:
    LOBYTE(v12) = 0;
LABEL_42:
    LOBYTE(v17) = 0;
    int v14 = 0;
    int v15 = 0;
    goto LABEL_43;
  }
  uint64_t v11 = v2[3];
  if (v2[3]) {
    LOBYTE(v11) = *((unsigned char *)a2 + v11);
  }
  if (v3 < 9)
  {
    char v16 = 0;
    LODWORD(v13) = 0;
    goto LABEL_41;
  }
  uint64_t v12 = v2[4];
  if (v2[4]) {
    LOBYTE(v12) = *((unsigned char *)a2 + v12);
  }
  if (v3 < 0x11)
  {
    char v16 = 0;
    LODWORD(v13) = 0;
    goto LABEL_42;
  }
  uint64_t v13 = v2[8];
  if (v2[8]) {
    LODWORD(v13) = *((unsigned __int8 *)a2 + v13) != 0;
  }
  if (v3 >= 0x17)
  {
    int v14 = 0;
    if (v2[11]) {
      int v14 = *(int *)((char *)a2 + v2[11]);
    }
    if (v3 < 0x19)
    {
      char v16 = 0;
      int v15 = 0;
      goto LABEL_71;
    }
    if (v2[12]) {
      int v10 = *(int *)((char *)a2 + v2[12]);
    }
    if (v3 < 0x1F)
    {
      int v15 = 0;
      if (v3 < 0x1B) {
        goto LABEL_70;
      }
    }
    else if (v2[15])
    {
      int v15 = *(int *)((char *)a2 + v2[15]);
    }
    else
    {
      int v15 = 0;
    }
    if (v2[13])
    {
      char v16 = *((unsigned char *)a2 + v2[13]);
      goto LABEL_71;
    }
LABEL_70:
    char v16 = 0;
LABEL_71:
    uint64_t v17 = v2[9];
    if (v17) {
      LOBYTE(v17) = *((unsigned char *)a2 + v17);
    }
    goto LABEL_43;
  }
  char v16 = 0;
  int v14 = 0;
  int v15 = 0;
  if (v3 >= 0x13) {
    goto LABEL_71;
  }
  LOBYTE(v17) = 0;
LABEL_43:
  *(void *)(result + 48) = 0;
  *(void *)(result + 56) = 0;
  *(void *)(result + 64) = 0;
  if (v7 == 2) {
    __int16 v18 = 64;
  }
  else {
    __int16 v18 = 0;
  }
  BOOL v19 = v7 == 0;
  if (v7) {
    __int16 v20 = 32;
  }
  else {
    __int16 v20 = 0;
  }
  if (v19) {
    __int16 v21 = 0;
  }
  else {
    __int16 v21 = v18;
  }
  __int16 v22 = (v5 == 1) << 7;
LABEL_53:
  *(_WORD *)NSUInteger result = v21 | v22 | v17 & 0xF | ((v6 == 1) << 8) | v20;
  unsigned int v23 = (float)((float)v8 + 0.5);
  if (v13) {
    int v24 = 0x4000;
  }
  else {
    int v24 = 0;
  }
  *(_DWORD *)(result + 8) = v14;
  *(_DWORD *)(result + 12) = v10;
  *(_DWORD *)(result + 16) = v15;
  *(_DWORD *)(result + 4) = ((v12 & 7) << 11) | (32 * (v9 & 7)) | ((v4 & 3) << 16) & 0xFFF3F8E0 | ((v6 & 3) << 18) | ((v11 & 7) << 8) | v23 & 0x1F | v24 | ((v16 & 3) << 21);
  *(void *)(result + 40) = 0;
  *(void *)(result + 28) = 0;
  *(void *)(result + 20) = 0;
  return result;
}

BOOL AGX::SamplerDescriptor::operator<(unsigned __int16 *a1, unsigned __int16 *a2)
{
  unsigned int v2 = *a1;
  unsigned int v3 = *a2;
  BOOL v4 = v2 >= v3;
  if (v2 != v3) {
    return !v4;
  }
  unsigned int v5 = *((_DWORD *)a1 + 1);
  unsigned int v6 = *((_DWORD *)a2 + 1);
  BOOL v4 = v5 >= v6;
  if (v5 != v6) {
    return !v4;
  }
  float v7 = *((float *)a1 + 2);
  float v8 = *((float *)a2 + 2);
  BOOL v9 = v7 < v8;
  if (v7 == v8)
  {
    float v10 = *((float *)a1 + 3);
    float v11 = *((float *)a2 + 3);
    BOOL v9 = v10 < v11;
    if (v10 == v11)
    {
      float v12 = *((float *)a1 + 4);
      float v13 = *((float *)a2 + 4);
      BOOL v9 = v12 < v13;
      if (v12 == v13)
      {
        unsigned int v14 = *((_DWORD *)a1 + 5);
        unsigned int v15 = *((_DWORD *)a2 + 5);
        BOOL v4 = v14 >= v15;
        if (v14 == v15)
        {
          unsigned int v16 = *((_DWORD *)a1 + 6);
          unsigned int v17 = *((_DWORD *)a2 + 6);
          BOOL v4 = v16 >= v17;
          if (v16 == v17)
          {
            unsigned int v18 = *((_DWORD *)a1 + 7);
            unsigned int v19 = *((_DWORD *)a2 + 7);
            BOOL v4 = v18 >= v19;
            if (v18 == v19)
            {
              unsigned int v20 = *((_DWORD *)a1 + 8);
              unsigned int v21 = *((_DWORD *)a2 + 8);
              BOOL v4 = v20 >= v21;
              if (v20 == v21)
              {
                unint64_t v22 = *((void *)a1 + 5);
                unint64_t v23 = *((void *)a2 + 5);
                BOOL v4 = v22 >= v23;
                if (v22 == v23) {
                  return std::operator<[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>((void *)a1 + 6, (void *)a2 + 6);
                }
              }
            }
          }
        }
        return !v4;
      }
    }
  }
  return v9;
}

BOOL std::operator<[abi:nn180100]<char,std::char_traits<char>,std::allocator<char>>(void *a1, void *a2)
{
  int v2 = *((char *)a2 + 23);
  int v3 = *((char *)a1 + 23);
  if (v3 >= 0) {
    size_t v4 = *((unsigned __int8 *)a1 + 23);
  }
  else {
    size_t v4 = a1[1];
  }
  if (v3 < 0) {
    a1 = (void *)*a1;
  }
  if (v2 >= 0) {
    size_t v5 = *((unsigned __int8 *)a2 + 23);
  }
  else {
    size_t v5 = a2[1];
  }
  if (v2 < 0) {
    a2 = (void *)*a2;
  }
  if (v5 >= v4) {
    size_t v6 = v4;
  }
  else {
    size_t v6 = v5;
  }
  int v7 = memcmp(a1, a2, v6);
  if (v7) {
    return v7 < 0;
  }
  else {
    return v4 < v5;
  }
}

uint64_t ___ZN13AGXATelemetry15collectAndResetEP19NSMutableDictionaryIP8NSStringP8NSObjectE_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t program_sdk_version = dyld_get_program_sdk_version();
  int v3 = (void *)[MEMORY[0x263F086E0] mainBundle];
  uint64_t v4 = [v3 bundleIdentifier];
  if (!v4) {
    uint64_t v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F08AB0], "processInfo"), "processName");
  }
  uint64_t v5 = [v3 objectForInfoDictionaryKey:@"CFBundleVersion"];
  if (v5) {
    [*(id *)(v1 + 104) setObject:v5 forKey:@"BundleVersion"];
  }
  [*(id *)(v1 + 104) setObject:v4 forKey:@"BundleIdentifier"];
  objc_msgSend(*(id *)(v1 + 104), "setObject:forKey:", objc_msgSend((id)objc_msgSend(NSNumber, "numberWithUnsignedInt:", program_sdk_version), "stringValue"), @"SDK");
  size_t v6 = *(void **)(v1 + 104);
  uint64_t v7 = *(void *)(v1 + 80);

  return [v6 setObject:v7 forKey:@"SOC"];
}

void ___ZN13AGXATelemetry5setupEP8NSStringP13__IOGPUDevice_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(uint64_t **)(a1 + 32);
  int v2 = (void *)MEMORY[0x24566F2C0]();
  int v3 = (void *)v1[14];
  uint64_t v4 = (void *)MEMORY[0x24566F2C0]();
  int v5 = *((_DWORD *)v1 + 12);
  *((_DWORD *)v1 + 13) = v5;
  blocuint64_t k = MEMORY[0x263EF8330];
  uint64_t v37 = 3221225472;
  uint64_t v38 = ___ZN13AGXATelemetry15collectAndResetEP19NSMutableDictionaryIP8NSStringP8NSObjectE_block_invoke;
  char v39 = &__block_descriptor_40_e5_v8__0l;
  uint64_t v40 = v1;
  if (AGXATelemetry::collectAndReset(NSMutableDictionary<NSString *,NSObject *> *)::sdkPred != -1) {
    dispatch_once(&AGXATelemetry::collectAndReset(NSMutableDictionary<NSString *,NSObject *> *)::sdkPred, &block);
  }
  if (AGXATelemetry::collectAndReset(NSMutableDictionary<NSString *,NSObject *> *)::lastCommandQsInFlight != *((_WORD *)v1 + 16))
  {
    AGXATelemetry::collectAndReset(NSMutableDictionary<NSString *,NSObject *> *)::lastCommandQsInFlight = *((_WORD *)v1 + 16);
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedShort:"), @"CommandQueuesInFlight");
  }
  long long outputStruct = 0u;
  long long v43 = 0u;
  size_t outputStructCnt = 32;
  if (!IOConnectCallStructMethod(*(_DWORD *)(v1[11] + 20), 0x10Fu, 0, 0, &outputStruct, &outputStructCnt))
  {
    unint64_t v7 = outputStruct;
    unint64_t v8 = v1[35];
    if (v8 < (unint64_t)outputStruct)
    {
      unint64_t v9 = v1[35];
      do
      {
        atomic_compare_exchange_strong_explicit(v1 + 35, &v9, v7, memory_order_relaxed, memory_order_relaxed);
        if (v9 == v8) {
          break;
        }
        unint64_t v8 = v9;
      }
      while (v9 < v7);
    }
    unint64_t v10 = *((void *)&outputStruct + 1);
    unint64_t v11 = v1[36];
    if (v11 < *((void *)&outputStruct + 1))
    {
      unint64_t v12 = v1[36];
      do
      {
        atomic_compare_exchange_strong_explicit(v1 + 36, &v12, v10, memory_order_relaxed, memory_order_relaxed);
        if (v12 == v11) {
          break;
        }
        unint64_t v11 = v12;
      }
      while (v12 < v10);
    }
    unint64_t v13 = v43;
    unint64_t v14 = v1[33];
    if (v14 < (unint64_t)v43)
    {
      unint64_t v15 = v1[33];
      do
      {
        atomic_compare_exchange_strong_explicit(v1 + 33, &v15, v13, memory_order_relaxed, memory_order_relaxed);
        if (v15 == v14) {
          break;
        }
        unint64_t v14 = v15;
      }
      while (v15 < v13);
    }
    unint64_t v16 = *((void *)&v43 + 1);
    unint64_t v17 = v1[34];
    if (v17 < *((void *)&v43 + 1))
    {
      unint64_t v18 = v1[34];
      do
      {
        atomic_compare_exchange_strong_explicit(v1 + 34, &v18, v16, memory_order_relaxed, memory_order_relaxed);
        if (v18 == v17) {
          break;
        }
        unint64_t v17 = v18;
      }
      while (v18 < v16);
    }
  }
  if (v5)
  {
    uint64_t v34 = v4;
    uint64_t v35 = v2;
    uint64_t v19 = *v1;
    for (unint64_t i = (v1[2] ^ *v1) & 0xFFFFFFFFFFFFFFFELL; i; i &= ~(1 << v21))
    {
      unint64_t v21 = __clz(__rbit64(i));
      unint64_t v22 = &stru_26F8544F8;
      if (v21 - 1 <= 0x3E) {
        unint64_t v22 = off_265170E48[v21 - 1];
      }
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 1, v34, v35, block, v37, v38, v39, v40), v22);
    }
    v1[2] = v19;
    uint64_t v23 = v1[1];
    for (unint64_t j = v1[3] ^ v23; j; j &= ~(1 << v25))
    {
      unint64_t v25 = __clz(__rbit64(j));
      uint64_t v26 = &stru_26F8544F8;
      if (v25 <= 0x17) {
        uint64_t v26 = off_265171040[v25];
      }
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 1, v34, v35), v26);
    }
    uint64_t v27 = 0;
    v1[3] = v23;
    do
    {
      __swp(v6, (unsigned int *)&v1[v27 + 37]);
      if (v6) {
        objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:"), off_265171100[v27]);
      }
      ++v27;
    }
    while (v27 != 81);
    __swp(v6, (unsigned int *)v1 + 64);
    if (v6) {
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:"), @"MaxConcurrentComputeDispatchCount");
    }
    __swp(v6, (unsigned int *)v1 + 66);
    uint64_t v4 = v34;
    int v2 = v35;
    if (v6) {
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:"), @"MaxComputeUMAPoolSize");
    }
    __swp(v6, (unsigned int *)v1 + 68);
    if (v6) {
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:"), @"MaxComputeUMAPoolRequest");
    }
    __swp(v6, (unsigned int *)v1 + 70);
    if (v6) {
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:"), @"MaxRenderUMAPoolSize");
    }
    __swp(v6, (unsigned int *)v1 + 72);
    if (v6) {
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:"), @"MaxRenderUMAPoolRequest");
    }
  }
  for (uint64_t k = 0; k != 16; ++k)
  {
    __swp(v6, (unsigned int *)&v1[k + 16]);
    if (v6) {
      objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:"), off_265171388[k]);
    }
  }
  if ([(id)v1[14] count])
  {
    [(id)v1[14] addEntriesFromDictionary:v1[13]];
    unint64_t v29 = (uint64_t *)v1[14];
    blocuint64_t k = MEMORY[0x263EF8330];
    uint64_t v37 = 3221225472;
    uint64_t v38 = ___ZN13AGXATelemetry9sendEventEP8NSStringP19NSMutableDictionaryIS1_P8NSObjectE_block_invoke;
    char v39 = &unk_265170E28;
    uint64_t v40 = v29;
    AnalyticsSendEventLazy();
    [(id)v1[14] removeAllObjects];
  }
  double v30 = *(double *)&AGXATelemetry::setup(NSString *,__IOGPUDevice *)::intervalSeconds;
  if (*(double *)&AGXATelemetry::setup(NSString *,__IOGPUDevice *)::intervalSeconds <= 3840.0)
  {
    double v30 = *(double *)&AGXATelemetry::setup(NSString *,__IOGPUDevice *)::intervalSeconds
        + *(double *)&AGXATelemetry::setup(NSString *,__IOGPUDevice *)::intervalSeconds;
    *(double *)&AGXATelemetry::setup(NSString *,__IOGPUDevice *)::intervalSeconds = *(double *)&AGXATelemetry::setup(NSString *,__IOGPUDevice *)::intervalSeconds
                                                                                  + *(double *)&AGXATelemetry::setup(NSString *,__IOGPUDevice *)::intervalSeconds;
  }
  unint64_t v31 = v1[8];
  double v32 = v30 * 1000000000.0;
  dispatch_time_t v33 = dispatch_time(0, (uint64_t)(v30 * 1000000000.0));
  dispatch_source_set_timer(v31, v33, (unint64_t)v32, 0x5F5E100uLL);
}

uint64_t ___ZN13AGXATelemetry9sendEventEP8NSStringP19NSMutableDictionaryIS1_P8NSObjectE_block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t ___ZN13AGXATelemetry26shouldCaptureTelemetryDataEv_block_invoke()
{
  uint64_t result = objc_msgSend((id)objc_msgSend(MEMORY[0x263F086E0], "mainBundle"), "bundlePath");
  BOOL v1 = 0;
  if (result)
  {
    uint64_t result = [(id)result containsString:@"Application"];
    if (result) {
      BOOL v1 = 1;
    }
  }
  AGXATelemetry::shouldCaptureTelemetryData(void)::shouldCapture = v1;
  return result;
}

void ___ZN13AGXATelemetry16disableTelemetryEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_source_cancel(*(dispatch_source_t *)(v1 + 64));
  *(unsigned char *)(v1 + 120) = 0;
}

dispatch_queue_t ___ZN13AGXATelemetry26telemetryEmitBacktraceInfoEPK26AGXATelemetryBacktraceInfo_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  *(void *)(v1 + 96) = (id)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  int v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t result = dispatch_queue_create("com.apple.metal.telemetryBacktraceQueue", v2);
  *(void *)(v1 + 72) = result;
  return result;
}

void ___ZN13AGXATelemetry26telemetryEmitBacktraceInfoEPK26AGXATelemetryBacktraceInfo_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = a1;
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 32);
  atomic_fetch_add(AGXATelemetry::backtracesCaptured, 1u);
  int v3 = (void *)MEMORY[0x24566F2C0]();
  uint64_t v4 = (void *)[MEMORY[0x263F086E0] mainBundle];
  uint64_t v5 = [v4 bundleIdentifier];
  uint64_t v6 = [v4 objectForInfoDictionaryKey:@"CFBundleVersion"];
  if (v5)
  {
    uint64_t v22 = v5;
    uint64_t v23 = v6;
    uint64_t v24 = v2;
    unint64_t v25 = v3;
    uint64_t v26 = v1;
    uint64_t v7 = **(unsigned int **)(v1 + 40);
    __s1 = (char *)getprogname();
    uint64_t v27 = (void *)[MEMORY[0x263EFF980] array];
    if ((int)v7 >= 1)
    {
      uint64_t v8 = 0;
      do
      {
        unint64_t v9 = (const char *)dyld_image_path_containing_address();
        if (v9) {
          unint64_t v10 = basename_r(v9, v33);
        }
        else {
          unint64_t v10 = "<Unknown>";
        }
        if (v10) {
          unint64_t v11 = v10;
        }
        else {
          unint64_t v11 = "<Unknown>";
        }
        if (!strcmp(__s1, v11)) {
          unint64_t v12 = @"Direct";
        }
        else {
          unint64_t v12 = (__CFString *)[NSString stringWithUTF8String:v11];
        }
        if (isGLESOnMetalFramework(NSString *)::onceToken != -1) {
          dispatch_once(&isGLESOnMetalFramework(NSString *)::onceToken, &__block_literal_global_649);
        }
        if ([(id)isGLESOnMetalFramework(NSString *)::glesFrameworksLists containsObject:v12]) {
          goto LABEL_37;
        }
        if (isIgnoredFramework(NSString *)::onceToken != -1) {
          dispatch_once(&isIgnoredFramework(NSString *)::onceToken, &__block_literal_global_661);
        }
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        unint64_t v13 = (void *)isIgnoredFramework(NSString *)::ignoredFrameworksList;
        uint64_t v14 = [(id)isIgnoredFramework(NSString *)::ignoredFrameworksList countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v30;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v30 != v16) {
                objc_enumerationMutation(v13);
              }
              unint64_t v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
              if (objc_msgSend(v18, "characterAtIndex:", objc_msgSend(v18, "length") - 1) == 42)
              {
                if (-[__CFString hasPrefix:](v12, "hasPrefix:", objc_msgSend(v18, "substringToIndex:", objc_msgSend(v18, "length") - 1)))goto LABEL_4; {
              }
                }
              else if ([v18 isEqualToString:v12])
              {
                goto LABEL_4;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v38 count:16];
          }
          while (v15);
        }
        if (([v27 containsObject:v12] & 1) == 0) {
          [v27 addObject:v12];
        }
LABEL_4:
        ;
      }
      while (++v8 != v7);
    }
    if (![v27 count])
    {
LABEL_37:
      int v3 = v25;
      uint64_t v1 = v26;
      goto LABEL_38;
    }
    uint64_t v19 = [v27 componentsJoinedByString:@","];
    int v3 = v25;
    uint64_t v1 = v26;
    if (v19)
    {
      uint64_t v20 = v19;
      [*(id *)(v24 + 96) setObject:v22 forKey:@"BundleIdentifier"];
      if (v23) {
        [*(id *)(v24 + 96) setObject:v23 forKey:@"BundleVersion"];
      }
      [*(id *)(v24 + 96) setObject:v20 forKey:@"Frameworks"];
      uint64_t v21 = *(void *)(v24 + 96);
      *(void *)dispatch_time_t v33 = MEMORY[0x263EF8330];
      uint64_t v34 = 3221225472;
      uint64_t v35 = ___ZN13AGXATelemetry9sendEventEP8NSStringP19NSMutableDictionaryIS1_P8NSObjectE_block_invoke;
      int8x16_t v36 = &unk_265170E28;
      uint64_t v37 = v21;
      AnalyticsSendEventLazy();
      [*(id *)(v24 + 96) removeAllObjects];
    }
  }
LABEL_38:
  free(*(void **)(v1 + 40));
}

uint64_t ___ZL18isIgnoredFrameworkP8NSString_block_invoke()
{
  uint64_t result = objc_msgSend(objc_alloc(MEMORY[0x263EFF8C0]), "initWithObjects:", @"AGXMetal*", @"Metal", @"MetalTools", @"libMTLCapture.dylib", @"libMTLInterpose.dylib", @"UIKit", @"UIKitCore", @"Foundation", @"CoreFoundation", @"FrontBoardServices", @"GraphicsServices", @"FrontBoard", @"BaseBoard", @"libdispatch.dylib", @"libdyld.dylib", @"libsystem_pthread.dylib", @"libobjc.A.dylib",
             @"libswiftCore.dylib",
             @"libc++.1.dylib",
             @"libxpc.dylib",
             @"libswiftUIKit.dylib",
             @"libsystem_notify.dylib",
             0);
  isIgnoredFramework(NSString *)::ignoredFrameworksList = result;
  return result;
}

uint64_t ___ZL22isGLESOnMetalFrameworkP8NSString_block_invoke()
{
  uint64_t result = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26F86C7D0];
  isGLESOnMetalFramework(NSString *)::glesFrameworksLists = result;
  return result;
}

uint64_t TiledMemory<(TwiddleOrder)1>::convertTiles2D<false>(uint64_t result, uint64_t a2, int a3, char a4, unsigned int a5, unsigned int a6, int a7, int a8, uint64_t a9, unsigned int a10, unsigned int a11, uint64_t a12, uint64_t (*a13)(unint64_t, uint64_t), char a14)
{
  uint64_t v57 = result;
  unsigned int v14 = 0;
  uint64_t v15 = 8 * a12;
  if (8 * a12 > 127)
  {
    if (v15 > 511)
    {
      if (v15 == 512)
      {
        unsigned int v14 = 16;
        uint64_t v16 = 16;
      }
      else
      {
        uint64_t v16 = 0;
        if (v15 == 1024)
        {
          uint64_t v16 = 8;
          unsigned int v14 = 16;
        }
      }
    }
    else if (v15 == 128)
    {
      unsigned int v14 = 32;
      uint64_t v16 = 32;
    }
    else
    {
      uint64_t v16 = 0;
      if (v15 == 256)
      {
        uint64_t v16 = 16;
        unsigned int v14 = 32;
      }
    }
  }
  else if (v15 > 31)
  {
    if (v15 == 32)
    {
      unsigned int v14 = 64;
      uint64_t v16 = 64;
    }
    else
    {
      uint64_t v16 = 0;
      if (v15 == 64)
      {
        uint64_t v16 = 32;
        unsigned int v14 = 64;
      }
    }
  }
  else if (v15 == 8)
  {
    unsigned int v14 = 128;
    uint64_t v16 = 128;
  }
  else
  {
    uint64_t v16 = 0;
    if (v15 == 16)
    {
      uint64_t v16 = 64;
      unsigned int v14 = 128;
    }
  }
  if (a10 > 1) {
    int v17 = ~(-1 << a4);
  }
  else {
    int v17 = 0;
  }
  unsigned int v18 = ((a10 - 1 + a3) / a10 + v17) >> a4;
  if (v18 <= 1) {
    unsigned int v18 = 1;
  }
  unsigned int v19 = (a8 + a11 - 1) / a11;
  unsigned int v51 = v19 - 1 + a6 / a11;
  unsigned int v52 = a6 / a11;
  unsigned int v20 = a6 / a11 / v16;
  unsigned int v50 = v51 / v16;
  if (v20 <= v51 / v16)
  {
    unsigned int v21 = a5 / a10;
    unsigned int v22 = (a10 - 1 + a7) / a10;
    unsigned int v23 = v22 - 1 + a5 / a10;
    unsigned int v24 = 32 - __clz(v22 - 1);
    if (v22 < 2) {
      unsigned int v24 = 0;
    }
    unsigned int v25 = 32 - __clz(v19 - 1);
    if (v19 < 2) {
      unsigned int v25 = 0;
    }
    unsigned int v26 = v25;
    BOOL v59 = v25 != 0;
    BOOL v56 = v24 != 0;
    unsigned int v49 = a5 / a10 / v14;
    if (v49 <= v23 / v14)
    {
      uint64_t v27 = a9;
      unsigned int v48 = (v14 + v18 - 1) / v14;
      unsigned int v65 = v23 / v14;
      if (a14)
      {
        unsigned int v28 = v24;
        if (v25 | v24)
        {
          do
          {
            unsigned int v29 = v20 * v16;
            int v61 = v20 * v48;
            unsigned int v53 = v20 + 1;
            unsigned int v30 = v49;
            do
            {
              int v31 = 0;
              uint64_t v32 = 0;
              unsigned int v33 = v30 + 1;
              int v34 = 1;
              BOOL v35 = v59;
              BOOL v36 = v56;
              unsigned int v37 = v26;
              unsigned int v38 = v28;
              do
              {
                --v37;
                if (v35) {
                  v32 |= (unint64_t)(v34 & v29) << v31++;
                }
                else {
                  unsigned int v37 = 0;
                }
                --v38;
                if (v36) {
                  v32 |= (unint64_t)(v34 & (v30 * v14)) << v31++;
                }
                else {
                  unsigned int v38 = 0;
                }
                v34 *= 2;
                --v31;
                BOOL v36 = v38 != 0;
                BOOL v35 = v37 != 0;
              }
              while (v38 | v37);
              uint64_t result = a13(v57 + ((unint64_t)(v30 + v61) << 14), a2 + v32 * a12);
              unsigned int v30 = v33;
            }
            while (v33 <= v65);
            unsigned int v20 = v53;
          }
          while (v53 <= v50);
        }
        else
        {
          do
          {
            int v63 = v20 * v48;
            unsigned int v55 = v20 + 1;
            unsigned int v45 = v49;
            uint64_t v46 = v16;
            do
            {
              unsigned int v47 = v45 + 1;
              uint64_t result = a13(v57 + ((unint64_t)(v45 + v63) << 14), a2);
              unsigned int v45 = v47;
            }
            while (v47 <= v65);
            unsigned int v20 = v55;
            uint64_t v16 = v46;
          }
          while (v55 <= v50);
        }
      }
      else
      {
        uint64_t v39 = 0xFFFFFFFFLL;
        int v64 = v16;
        do
        {
          int v62 = v20 * v48;
          unsigned int v54 = v20 + 1;
          if (v52 <= v20 * v16) {
            unsigned int v40 = v20 * v16;
          }
          else {
            unsigned int v40 = v52;
          }
          uint64_t v60 = (v40 - v52) * v27;
          unsigned int v41 = v49;
          do
          {
            unsigned int v42 = v41 + 1;
            if (v21 <= v41 * v14) {
              int v43 = v41 * v14;
            }
            else {
              int v43 = v21;
            }
            uint64_t v44 = v39;
            uint64_t result = a13(v57 + ((unint64_t)(v41 + v62) << 14), a2 + v60 + (v43 - v21) * a12);
            uint64_t v39 = v44;
            uint64_t v27 = a9;
            unsigned int v41 = v42;
          }
          while (v42 <= v65);
          unsigned int v20 = v54;
          LODWORD(v16) = v64;
        }
        while (v54 <= v50);
      }
    }
  }
  return result;
}

uint64_t TiledMemory<(TwiddleOrder)1>::convertTiles2D<true>(uint64_t result, uint64_t a2, int a3, char a4, unsigned int a5, unsigned int a6, int a7, int a8, uint64_t a9, unsigned int a10, unsigned int a11, uint64_t a12, uint64_t (*a13)(unint64_t, uint64_t), char a14)
{
  uint64_t v57 = result;
  unsigned int v14 = 0;
  uint64_t v15 = 8 * a12;
  if (8 * a12 > 127)
  {
    if (v15 > 511)
    {
      if (v15 == 512)
      {
        unsigned int v14 = 16;
        uint64_t v16 = 16;
      }
      else
      {
        uint64_t v16 = 0;
        if (v15 == 1024)
        {
          uint64_t v16 = 8;
          unsigned int v14 = 16;
        }
      }
    }
    else if (v15 == 128)
    {
      unsigned int v14 = 32;
      uint64_t v16 = 32;
    }
    else
    {
      uint64_t v16 = 0;
      if (v15 == 256)
      {
        uint64_t v16 = 16;
        unsigned int v14 = 32;
      }
    }
  }
  else if (v15 > 31)
  {
    if (v15 == 32)
    {
      unsigned int v14 = 64;
      uint64_t v16 = 64;
    }
    else
    {
      uint64_t v16 = 0;
      if (v15 == 64)
      {
        uint64_t v16 = 32;
        unsigned int v14 = 64;
      }
    }
  }
  else if (v15 == 8)
  {
    unsigned int v14 = 128;
    uint64_t v16 = 128;
  }
  else
  {
    uint64_t v16 = 0;
    if (v15 == 16)
    {
      uint64_t v16 = 64;
      unsigned int v14 = 128;
    }
  }
  if (a10 > 1) {
    int v17 = ~(-1 << a4);
  }
  else {
    int v17 = 0;
  }
  unsigned int v18 = ((a10 - 1 + a3) / a10 + v17) >> a4;
  if (v18 <= 1) {
    unsigned int v18 = 1;
  }
  unsigned int v19 = (a8 + a11 - 1) / a11;
  unsigned int v51 = v19 - 1 + a6 / a11;
  unsigned int v52 = a6 / a11;
  unsigned int v20 = a6 / a11 / v16;
  unsigned int v50 = v51 / v16;
  if (v20 <= v51 / v16)
  {
    unsigned int v21 = a5 / a10;
    unsigned int v22 = (a10 - 1 + a7) / a10;
    unsigned int v23 = v22 - 1 + a5 / a10;
    unsigned int v24 = 32 - __clz(v22 - 1);
    if (v22 < 2) {
      unsigned int v24 = 0;
    }
    unsigned int v25 = 32 - __clz(v19 - 1);
    if (v19 < 2) {
      unsigned int v25 = 0;
    }
    unsigned int v26 = v25;
    BOOL v59 = v25 != 0;
    BOOL v56 = v24 != 0;
    unsigned int v49 = a5 / a10 / v14;
    if (v49 <= v23 / v14)
    {
      uint64_t v27 = a9;
      unsigned int v48 = (v14 + v18 - 1) / v14;
      unsigned int v65 = v23 / v14;
      if (a14)
      {
        unsigned int v28 = v24;
        if (v25 | v24)
        {
          do
          {
            unsigned int v29 = v20 * v16;
            int v61 = v20 * v48;
            unsigned int v53 = v20 + 1;
            unsigned int v30 = v49;
            do
            {
              int v31 = 0;
              uint64_t v32 = 0;
              unsigned int v33 = v30 + 1;
              int v34 = 1;
              BOOL v35 = v59;
              BOOL v36 = v56;
              unsigned int v37 = v26;
              unsigned int v38 = v28;
              do
              {
                --v37;
                if (v35) {
                  v32 |= (unint64_t)(v34 & v29) << v31++;
                }
                else {
                  unsigned int v37 = 0;
                }
                --v38;
                if (v36) {
                  v32 |= (unint64_t)(v34 & (v30 * v14)) << v31++;
                }
                else {
                  unsigned int v38 = 0;
                }
                v34 *= 2;
                --v31;
                BOOL v36 = v38 != 0;
                BOOL v35 = v37 != 0;
              }
              while (v38 | v37);
              uint64_t result = a13(a2 + ((unint64_t)(v30 + v61) << 14), v57 + v32 * a12);
              unsigned int v30 = v33;
            }
            while (v33 <= v65);
            unsigned int v20 = v53;
          }
          while (v53 <= v50);
        }
        else
        {
          do
          {
            int v63 = v20 * v48;
            unsigned int v55 = v20 + 1;
            unsigned int v45 = v49;
            uint64_t v46 = v16;
            do
            {
              unsigned int v47 = v45 + 1;
              uint64_t result = a13(a2 + ((unint64_t)(v45 + v63) << 14), v57);
              unsigned int v45 = v47;
            }
            while (v47 <= v65);
            unsigned int v20 = v55;
            uint64_t v16 = v46;
          }
          while (v55 <= v50);
        }
      }
      else
      {
        uint64_t v39 = 0xFFFFFFFFLL;
        int v64 = v16;
        do
        {
          int v62 = v20 * v48;
          unsigned int v54 = v20 + 1;
          if (v52 <= v20 * v16) {
            unsigned int v40 = v20 * v16;
          }
          else {
            unsigned int v40 = v52;
          }
          uint64_t v60 = (v40 - v52) * v27;
          unsigned int v41 = v49;
          do
          {
            unsigned int v42 = v41 + 1;
            if (v21 <= v41 * v14) {
              int v43 = v41 * v14;
            }
            else {
              int v43 = v21;
            }
            uint64_t v44 = v39;
            uint64_t result = a13(a2 + ((unint64_t)(v41 + v62) << 14), v57 + v60 + (v43 - v21) * a12);
            uint64_t v39 = v44;
            uint64_t v27 = a9;
            unsigned int v41 = v42;
          }
          while (v42 <= v65);
          unsigned int v20 = v54;
          LODWORD(v16) = v64;
        }
        while (v54 <= v50);
      }
    }
  }
  return result;
}

void ___ZN3AGX22agxaSignpostInitializeEv_block_invoke()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  if (dispatch_queue_create("com.apple.Metal.AGXSignpostEnablementQueue", v0)) {
    operator new();
  }
  fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** fail to allocate enablement notifications queue!\n", "agxa_trace_event.cpp", 44, "agxaSignpostInitialize_block_invoke");
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    state64[0] = 136315650;
    *(void *)&state64[1] = "agxa_trace_event.cpp";
    __int16 v2 = 1024;
    int v3 = 44;
    __int16 v4 = 2080;
    uint64_t v5 = "agxaSignpostInitialize_block_invoke";
    _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** fail to allocate enablement notifications queue!\n", (uint8_t *)state64, 0x1Cu);
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    state64[0] = 136315650;
    *(void *)&state64[1] = "agxa_trace_event.cpp";
    __int16 v2 = 1024;
    int v3 = 44;
    __int16 v4 = 2080;
    uint64_t v5 = "agxaSignpostInitialize_block_invoke";
    _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** fail to allocate enablement notifications queue!\n", (uint8_t *)state64, 0x1Cu);
  }
}

uint64_t ___ZN3AGX22agxaSignpostInitializeEv_block_invoke_12(int a1, int token)
{
  uint64_t state64 = 0;
  uint64_t result = notify_get_state(token, &state64);
  if (!result)
  {
    {
      do
      {
        uint64_t v5 = *v3++;
        uint64_t result = (*(uint64_t (**)(void))(v5 + 16))();
      }
      while (v3 != v4);
    }
  }
  return result;
}

void AGX::agxaSignpostRegisterForEnablement(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 0x40000000;
    block[2] = ___ZN3AGX33agxaSignpostRegisterForEnablementEU13block_pointerFvbE_block_invoke;
    block[3] = &unk_265171430;
    block[4] = a1;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** signpost enablement notifications queue is uninitialized\n", "agxa_trace_event.cpp", 89, "agxaSignpostRegisterForEnablement");
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      int v3 = "agxa_trace_event.cpp";
      __int16 v4 = 1024;
      int v5 = 89;
      __int16 v6 = 2080;
      uint64_t v7 = "agxaSignpostRegisterForEnablement";
      _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** signpost enablement notifications queue is uninitialized\n", buf, 0x1Cu);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315650;
      int v3 = "agxa_trace_event.cpp";
      __int16 v4 = 1024;
      int v5 = 89;
      __int16 v6 = 2080;
      uint64_t v7 = "agxaSignpostRegisterForEnablement";
      _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** signpost enablement notifications queue is uninitialized\n", buf, 0x1Cu);
    }
  }
}

void ___ZN3AGX33agxaSignpostRegisterForEnablementEU13block_pointerFvbE_block_invoke(uint64_t a1)
{
  int v5 = v4;
  if ((unint64_t)v4 >= v3)
  {
    uint64_t v9 = v8 >> 3;
    unint64_t v10 = (v8 >> 3) + 1;
    if (v10 >> 61) {
      abort();
    }
    uint64_t v11 = v3 - (void)v7;
    if (v11 >> 2 > v10) {
      unint64_t v10 = v11 >> 2;
    }
    if ((unint64_t)v11 >= 0x7FFFFFFFFFFFFFF8) {
      unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v12 = v10;
    }
    if (v12)
    {
      if (v12 >> 61) {
        std::__throw_bad_array_new_length[abi:nn180100]();
      }
      unint64_t v13 = operator new(8 * v12);
    }
    else
    {
      unint64_t v13 = 0;
    }
    unsigned int v14 = &v13[8 * v9];
    void *v14 = *(void *)(a1 + 32);
    __int16 v6 = v14 + 1;
    if (v4 == (void *)v7)
    {
      uint64_t v7 = v4;
    }
    else
    {
      unint64_t v15 = (char *)v4 - v7 - 8;
      if (v15 < 0x58) {
        goto LABEL_29;
      }
      if ((unint64_t)((char *)v4 - v13 - v8) < 0x20) {
        goto LABEL_29;
      }
      uint64_t v16 = (v15 >> 3) + 1;
      int v5 = &v4[-(v16 & 0x3FFFFFFFFFFFFFFCLL)];
      int v17 = &v13[8 * v9 - 16];
      unsigned int v18 = (long long *)(v4 - 2);
      uint64_t v19 = v16 & 0x3FFFFFFFFFFFFFFCLL;
      do
      {
        long long v20 = *v18;
        *(v17 - 1) = *(v18 - 1);
        *int v17 = v20;
        v17 -= 2;
        v18 -= 2;
        v19 -= 4;
      }
      while (v19);
      v14 -= v16 & 0x3FFFFFFFFFFFFFFCLL;
      if (v16 != (v16 & 0x3FFFFFFFFFFFFFFCLL))
      {
LABEL_29:
        do
        {
          uint64_t v21 = *--v5;
          *--unsigned int v14 = v21;
        }
        while (v5 != (void *)v7);
        uint64_t v7 = *(unsigned char **)v2;
      }
    }
    *(void *)uint64_t v2 = v14;
    *(void *)(v2 + 8) = v6;
    *(void *)(v2 + 16) = &v13[8 * v12];
    if (v7) {
      operator delete(v7);
    }
  }
  else
  {
    void *v4 = *(void *)(a1 + 32);
    __int16 v6 = v4 + 1;
  }
  *(void *)(v2 + 8) = v6;
}

void *___ZN3AGX35agxaSignpostDeregisterForEnablementEU13block_pointerFvbE_block_invoke(void *result)
{
  {
    while (*(void *)v3 != result[4])
    {
      v3 += 8;
      if (v3 == v2)
      {
        break;
      }
    }
  }
  if (v3 != v2)
  {
    int64_t v4 = v2 - (v3 + 8);
    if (v2 != v3 + 8) {
      uint64_t result = memmove(v3, v3 + 8, v2 - (v3 + 8));
    }
    *(void *)(v1 + 8) = &v3[v4];
  }
  return result;
}

uint64_t ___ZN3AGX20DeviceInternalBufferINS_23DepthBiasBitsBufferInfoEE13getBufferInfoEjP15MTLResourceList_block_invoke()
{
  return MTLResourceListAddResource();
}

uint64_t ___ZN3AGX20DeviceInternalBufferINS_21ScissorBitsBufferInfoEE13getBufferInfoEjP15MTLResourceList_block_invoke()
{
  return MTLResourceListAddResource();
}

uint64_t findEnvVarNum<unsigned long long>(const char *a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int64_t v4 = getenv(a1);
  if (!v4 || (int v5 = v4, !*v4))
  {
LABEL_9:
    uint64_t result = 0;
    *a2 = 0;
    return result;
  }
  uint64_t result = sscanf(v4, "0x%llx", a2);
  if (result != 1)
  {
    uint64_t result = sscanf(v5, "%llu", a2);
    if (result != 1)
    {
      fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** Unsupported value for EV %s (%s)\n", "agxs_util.cpp", 314, "findEnvVarNum", a1, v5);
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v8 = "agxs_util.cpp";
        __int16 v9 = 1024;
        int v10 = 314;
        __int16 v11 = 2080;
        unint64_t v12 = "findEnvVarNum";
        __int16 v13 = 2080;
        unsigned int v14 = a1;
        __int16 v15 = 2080;
        uint64_t v16 = v5;
        _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Unsupported value for EV %s (%s)\n", buf, 0x30u);
      }
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136316162;
        uint64_t v8 = "agxs_util.cpp";
        __int16 v9 = 1024;
        int v10 = 314;
        __int16 v11 = 2080;
        unint64_t v12 = "findEnvVarNum";
        __int16 v13 = 2080;
        unsigned int v14 = a1;
        __int16 v15 = 2080;
        uint64_t v16 = v5;
        _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Unsupported value for EV %s (%s)\n", buf, 0x30u);
      }
      goto LABEL_9;
    }
  }
  return result;
}

void findEnvVarNum<BOOL>(const char *a1, unsigned char *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  int64_t v4 = getenv(a1);
  if (!v4) {
    goto LABEL_12;
  }
  int v5 = *v4;
  if (*v4)
  {
    if (v5 == 48)
    {
      LOBYTE(v5) = v4[1];
      if (!(_BYTE)v5) {
        goto LABEL_13;
      }
    }
    else if (v5 == 49 && !v4[1])
    {
      LOBYTE(v5) = 1;
      goto LABEL_13;
    }
    __int16 v6 = v4;
    fprintf((FILE *)*MEMORY[0x263EF8348], "AGX: %s:%d:%s: *** Unsupported value for EV %s (%s)\n", "agxs_util.cpp", 314, "findEnvVarNum", a1, v4);
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v8 = "agxs_util.cpp";
      __int16 v9 = 1024;
      int v10 = 314;
      __int16 v11 = 2080;
      unint64_t v12 = "findEnvVarNum";
      __int16 v13 = 2080;
      unsigned int v14 = a1;
      __int16 v15 = 2080;
      uint64_t v16 = v6;
      _os_log_error_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_ERROR, "AGX: AGX: %s:%d:%s: *** Unsupported value for EV %s (%s)\n", buf, 0x30u);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136316162;
      uint64_t v8 = "agxs_util.cpp";
      __int16 v9 = 1024;
      int v10 = 314;
      __int16 v11 = 2080;
      unint64_t v12 = "findEnvVarNum";
      __int16 v13 = 2080;
      unsigned int v14 = a1;
      __int16 v15 = 2080;
      uint64_t v16 = v6;
      _os_log_impl(&dword_2427AD000, &_os_log_internal, OS_LOG_TYPE_INFO, "AGX: AGX: %s:%d:%s: *** Unsupported value for EV %s (%s)\n", buf, 0x30u);
    }
LABEL_12:
    LOBYTE(v5) = 0;
  }
LABEL_13:
  *a2 = v5;
}

uint64_t ___ZL15getTimebaseInfov_block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&getTimebaseInfo(void)::sTimebaseInfo);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7AF8](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x270ED7B00](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B08](c, data, *(void *)&len);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B30](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x270ED7B38](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x270ED7B40](c, data, *(void *)&len);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CC0](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CE0](key, applicationID, keyExistsAndHasValidFormat);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x270EE4D08](applicationID, userName, hostName);
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

uint64_t GRCCopyAllCounterSourceGroup()
{
  return MEMORY[0x270F2DB90]();
}

uint64_t GRCReleaseAllCounterSourceGroup()
{
  return MEMORY[0x270F2DB98]();
}

kern_return_t IOConnectCallAsyncScalarMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F20](*(void *)&connection, *(void *)&selector, *(void *)&wake_port, reference, *(void *)&referenceCnt, input, *(void *)&inputCnt, output);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x270EF3F38](*(void *)&connection, *(void *)&selector, input, *(void *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x270EF3F40](*(void *)&connection, *(void *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

uint64_t IOGPUCommandQueueGetConnect()
{
  return MEMORY[0x270F3D318]();
}

uint64_t IOGPUCommandQueueGetID()
{
  return MEMORY[0x270F3D320]();
}

uint64_t IOGPUDeviceGetConnect()
{
  return MEMORY[0x270F3D338]();
}

uint64_t IOGPUDeviceGetNextGlobalTraceID()
{
  return MEMORY[0x270F3D348]();
}

uint64_t IOGPUDeviceTraceEvent()
{
  return MEMORY[0x270F3D360]();
}

uint64_t IOGPUMetalCommandBufferStorageAllocResourceAtIndex()
{
  return MEMORY[0x270F3D368]();
}

uint64_t IOGPUMetalCommandBufferStorageAllocSidebandBuffer()
{
  return MEMORY[0x270F3D370]();
}

uint64_t IOGPUMetalCommandBufferStorageBeginKernelCommands()
{
  return MEMORY[0x270F3D378]();
}

uint64_t IOGPUMetalCommandBufferStorageBeginSegment()
{
  return MEMORY[0x270F3D380]();
}

uint64_t IOGPUMetalCommandBufferStorageEndKernelCommands()
{
  return MEMORY[0x270F3D388]();
}

uint64_t IOGPUMetalCommandBufferStorageEndSegment()
{
  return MEMORY[0x270F3D390]();
}

uint64_t IOGPUMetalCommandBufferStorageGrowKernelCommandBuffer()
{
  return MEMORY[0x270F3D398]();
}

uint64_t IOGPUMetalCommandBufferStorageGrowSidebandBuffer()
{
  return MEMORY[0x270F3D3A0]();
}

uint64_t IOGPUResourceGroupUpdateResources()
{
  return MEMORY[0x270F3D3A8]();
}

uint64_t IOGPUResourceListAddResource()
{
  return MEMORY[0x270F3D3B0]();
}

uint64_t IOGPUResourceListMerge()
{
  return MEMORY[0x270F3D3B8]();
}

uint64_t IOGPUResourceListMergeLists()
{
  return MEMORY[0x270F3D3C0]();
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x270EF47C8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

size_t IOSurfaceAlignProperty(CFStringRef property, size_t value)
{
  return MEMORY[0x270EF4C00](property, value);
}

CFTypeRef IOSurfaceCopyValue(IOSurfaceRef buffer, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4C20](buffer, key);
}

uint64_t IOSurfaceGetAddressFormatOfPlane()
{
  return MEMORY[0x270EF4C48]();
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane()
{
  return MEMORY[0x270EF4C68]();
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane()
{
  return MEMORY[0x270EF4C70]();
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane()
{
  return MEMORY[0x270EF4C78]();
}

void *__cdecl IOSurfaceGetBaseAddressOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return (void *)MEMORY[0x270EF4C80](buffer, planeIndex);
}

uint64_t IOSurfaceGetBulkAttachments()
{
  return MEMORY[0x270EF4C90]();
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4CC0](buffer, planeIndex);
}

uint64_t IOSurfaceGetBytesPerTileDataOfPlane()
{
  return MEMORY[0x270EF4CD0]();
}

uint64_t IOSurfaceGetCacheMode()
{
  return MEMORY[0x270EF4CD8]();
}

uint64_t IOSurfaceGetCompressedTileHeightOfPlane()
{
  return MEMORY[0x270EF4CE0]();
}

uint64_t IOSurfaceGetCompressedTileWidthOfPlane()
{
  return MEMORY[0x270EF4CE8]();
}

uint64_t IOSurfaceGetCompressionFootprintOfPlane()
{
  return MEMORY[0x270EF4CF0]();
}

uint64_t IOSurfaceGetCompressionTypeOfPlane()
{
  return MEMORY[0x270EF4CF8]();
}

uint64_t IOSurfaceGetHeightInCompressedTilesOfPlane()
{
  return MEMORY[0x270EF4D50]();
}

size_t IOSurfaceGetHeightOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4D58](buffer, planeIndex);
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D80](buffer);
}

uint64_t IOSurfaceGetSliceCount()
{
  return MEMORY[0x270EF4DB8]();
}

uint64_t IOSurfaceGetWidthInCompressedTilesOfPlane()
{
  return MEMORY[0x270EF4DE8]();
}

uint64_t IOSurfaceGetYCbCrMatrix()
{
  return MEMORY[0x270EF4DF8]();
}

uint64_t IOSurfaceIsTiled()
{
  return MEMORY[0x270EF4E10]();
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E18](buffer, *(void *)&options, seed);
}

uint64_t IOSurfaceLockPlane()
{
  return MEMORY[0x270EF4E20]();
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  return MEMORY[0x270EF4E88](buffer, *(void *)&options, seed);
}

uint64_t IOSurfaceUnlockPlane()
{
  return MEMORY[0x270EF4E90]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MTLGetOverridenDeviceCreationFlags()
{
  return MEMORY[0x270EF5E88]();
}

uint64_t MTLPackColor()
{
  return MEMORY[0x270EF5EC0]();
}

uint64_t MTLReleaseAssertionFailure()
{
  return MEMORY[0x270EF5F50]();
}

uint64_t MTLReportFailure()
{
  return MEMORY[0x270EF5F58]();
}

uint64_t MTLResourceListAddResource()
{
  return MEMORY[0x270EF5F68]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x270ED7CD8](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _MTLAddCompilePipelinePerformanceStatistics()
{
  return MEMORY[0x270EF5FE8]();
}

uint64_t _MTLAddCompilerServiceCompileTimeStats()
{
  return MEMORY[0x270EF5FF0]();
}

uint64_t _MTLCompilePerformanceStatisticsEnabled()
{
  return MEMORY[0x270EF6008]();
}

uint64_t _MTLHashState()
{
  return MEMORY[0x270EF6028]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t MTLAttributeFormatSize(MTLAttributeFormat a1)
{
  return MEMORY[0x270EF6048](a1);
}

int std::string::compare(const std::string *this, const std::string::value_type *__s)
{
  return MEMORY[0x270F98248](this, __s);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x270F98268]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x270F982E8](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x270F982F8](this);
}

void std::__call_once(std::once_flag::_State_type *a1, void *a2, void (__cdecl *a3)(void *))
{
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

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984C0](this, __s, __n);
}

std::string *__cdecl std::string::insert(std::string *this, std::string::size_type __pos, const std::string::value_type *__s, std::string::size_type __n)
{
  return (std::string *)MEMORY[0x270F984E8](this, __pos, __s, __n);
}

void std::string::resize(std::string *this, std::string::size_type __n, std::string::value_type __c)
{
}

void std::string::push_back(std::string *this, std::string::value_type __c)
{
}

std::string *__cdecl std::string::operator=(std::string *this, const std::string *__str)
{
  return (std::string *)MEMORY[0x270F98560](this, __str);
}

uint64_t std::filebuf::open()
{
  return MEMORY[0x270F98638]();
}

uint64_t std::filebuf::basic_filebuf()
{
  return MEMORY[0x270F98650]();
}

uint64_t std::filebuf::~filebuf()
{
  return MEMORY[0x270F98658]();
}

uint64_t std::istream::~istream()
{
  return MEMORY[0x270F986D0]();
}

uint64_t std::istream::operator>>()
{
  return MEMORY[0x270F98718]();
}

uint64_t std::ostream::put()
{
  return MEMORY[0x270F98740]();
}

uint64_t std::ostream::flush()
{
  return MEMORY[0x270F98748]();
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x270F98758]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x270F98760]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x270F987A8]();
}

{
  return MEMORY[0x270F987B0]();
}

{
  return MEMORY[0x270F987E0]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x270F98870]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x270F988A8]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x270F988B0]();
}

void std::__shared_weak_count::__release_weak(std::__shared_weak_count *this)
{
}

std::__shared_weak_count *__cdecl std::__shared_weak_count::lock(std::__shared_weak_count *this)
{
  return (std::__shared_weak_count *)MEMORY[0x270F989E8](this);
}

void std::__shared_weak_count::~__shared_weak_count(std::__shared_weak_count *this)
{
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
}

void std::mutex::lock(std::mutex *this)
{
}

void std::mutex::unlock(std::mutex *this)
{
}

void std::mutex::~mutex(std::mutex *this)
{
}

uint64_t std::__sort<std::__less<unsigned long long,unsigned long long> &,unsigned long long *>()
{
  return MEMORY[0x270F98C10]();
}

std::chrono::system_clock::time_point std::chrono::system_clock::now(void)
{
  return (std::chrono::system_clock::time_point)MEMORY[0x270F98C28]();
}

void std::locale::~locale(std::locale *this)
{
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x270F98DE8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x270F98E10](retstr, *(void *)&__val);
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, uint64_t __val)
{
  return (std::string *)MEMORY[0x270F98E28](retstr, __val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x270F98E38]();
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

void operator delete(void *__p, size_t __sz, std::align_val_t a3)
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

void *__cdecl operator new(size_t __sz, std::align_val_t a2)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}

int __cxa_atexit(void (*lpfunc)(void *), void *obj, void *lpdso_handle)
{
  return MEMORY[0x270ED7DA0](lpfunc, obj, lpdso_handle);
}

void __cxa_guard_abort(__guard *a1)
{
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x270ED7E28](*(void *)&a1, a2);
}

uint64_t _os_crash()
{
  return MEMORY[0x270ED8060]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x270ED8068]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x270ED80B0]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x270ED8718](a1, *(void *)&a2);
}

char *__cdecl basename_r(const char *a1, char *a2)
{
  return (char *)MEMORY[0x270ED8748](a1, a2);
}

void bzero(void *a1, size_t a2)
{
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

dispatch_data_t dispatch_data_create_map(dispatch_data_t data, const void **buffer_ptr, size_t *size_ptr)
{
  return (dispatch_data_t)MEMORY[0x270ED92E8](data, buffer_ptr, size_ptr);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_retain(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x270ED9518](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t dyld_get_active_platform()
{
  return MEMORY[0x270ED9698]();
}

uint64_t dyld_get_program_sdk_version()
{
  return MEMORY[0x270ED96A8]();
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x270ED96D8]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x270ED9718]();
}

float exp2f(float a1)
{
  MEMORY[0x270ED9868](a1);
  return result;
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x270ED9A20](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

int getpagesize(void)
{
  return MEMORY[0x270ED9CC8]();
}

pid_t getpid(void)
{
  return MEMORY[0x270ED9CE0]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x270ED9F50]();
}

long double log(long double __x)
{
  MEMORY[0x270EDA0A8](__x);
  return result;
}

long double log2(long double __x)
{
  MEMORY[0x270EDA0D8](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x270EDA168](*(void *)&error_value);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x270EDA288](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA388](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memchr(void *__s, int __c, size_t __n)
{
  return (void *)MEMORY[0x270EDA458](__s, *(void *)&__c, __n);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x270EDA488](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
}

void memset_pattern4(void *__b, const void *__pattern4, size_t __len)
{
}

void memset_pattern8(void *__b, const void *__pattern8, size_t __len)
{
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_parse_boot_arg_int()
{
  return MEMORY[0x270EDAA30]();
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x270EDAA58](log);
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

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD60](*(void *)&pid, buffer, *(void *)&buffersize);
}

uint64_t random(void)
{
  return MEMORY[0x270EDB0E8]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x270EDB510](__str, __size, __format);
}

int sscanf(const char *a1, const char *a2, ...)
{
  return MEMORY[0x270EDB560](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x270EDB610](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x270EDB638](__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x270EDB7D8](a1, a2, a3, a4, a5);
}