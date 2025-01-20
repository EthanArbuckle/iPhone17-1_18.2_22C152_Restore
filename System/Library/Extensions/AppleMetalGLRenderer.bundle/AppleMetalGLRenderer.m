void ___ZN12GLDDeviceRec29getRenderPipelineStateFromKeyEPK20GLRRenderPipelineKey_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *Value;
  const void *v4;
  void *v5;
  uint64_t vars8;

  v2 = *(void *)(a1 + 56);
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(v2 + 456), *(const void **)(a1 + 64));
  if (Value)
  {
    v4 = Value;

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = v4;
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) = [[GLRRenderPipelineStateES alloc] initWithPipelineState:*(void *)(a1 + 32) reflection:*(void *)(a1 + 40)];
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v2 + 456), *(const void **)(a1 + 64), *(const void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40));

    v5 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  }
}

uint64_t gldWaitForContext(uint64_t a1)
{
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 5264), 0xFFFFFFFFFFFFFFFFLL);
  v2 = *(uint64_t (**)(void))(**(void **)(a1 + 72) + 40);

  return v2();
}

void GLDPipelineProgramRec::~GLDPipelineProgramRec(GLDPipelineProgramRec *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

intptr_t gldUnbindBuffer(id *a1, GLDBufferRec *this)
{
  intptr_t result = GLDBufferRec::getMemoryPlugin(this);
  if (result)
  {
    uint64_t v4 = *(void *)(result + 24);
    if (v4)
    {
      if (*(_DWORD *)(v4 + 12))
      {
        return GLDContextRec::flushContext(a1);
      }
    }
  }
  return result;
}

void GLRPixelFormat::~GLRPixelFormat(GLRPixelFormat *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

void _depthStencilKeyRetain(const __CFAllocator *a1, const void *a2)
{
}

uint64_t gldGetVersion(_DWORD *a1, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  if (!*(_DWORD *)g_Library) {
    return 0;
  }
  *a1 = 4;
  uint64_t result = 1;
  *a2 = 1;
  *a3 = 16;
  *a4 = 32512;
  return result;
}

uint64_t gldCreateDevice(GLDObject **a1, uint64_t a2, uint64_t a3)
{
  GLDObject::operator new((GLDObject *)0x3D8);
  v6 = v5;
  GLDObject::GLDObject(v5);
  *(void *)v6 = &unk_26F4D6528;
  *((void *)v6 + 68) = 0;
  *((_DWORD *)v6 + 241) = 0;
  *((void *)v6 + 61) = 0;
  *((void *)v6 + 62) = 0;
  if (GLDDeviceRec::init(v6))
  {
    uint64_t result = 0;
    *a1 = v6;
  }
  else
  {
    GLDObject::release((atomic_uint *)v6);
    uint64_t result = 10017;
  }
  *(_DWORD *)a3 = 0;
  *(unsigned char *)(a3 + 4) = 1;
  return result;
}

void sub_2406DC17C(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLRPixelFormat::GLRPixelFormat(uint64_t a1, long long *a2)
{
  GLDObject::GLDObject((GLDObject *)a1);
  *(void *)uint64_t v4 = &unk_26F4D6CC0;
  long long v6 = a2[1];
  long long v5 = a2[2];
  long long v7 = *a2;
  *(void *)(v4 + 112) = *((void *)a2 + 6);
  *(_OWORD *)(v4 + 80) = v6;
  *(_OWORD *)(v4 + 96) = v5;
  *(_OWORD *)(v4 + 64) = v7;
  *(_OWORD *)(v4 + 44) = 0u;
  *(_OWORD *)(v4 + 12) = 0u;
  *(_OWORD *)(v4 + 28) = 0u;
  *(_DWORD *)(v4 + 60) = 0;
  unsigned int v8 = *(_DWORD *)(v4 + 84);
  *(unsigned char *)(v4 + 44) = (v8 & 0x3FFFFFFC) != 0;
  *(unsigned char *)(v4 + 45) = (*(unsigned char *)(v4 + 80) & 8) != 0;
  if ((v8 & 0x3FC0) != 0)
  {
    uint64_t v9 = 0x8366000080E1;
    int v10 = 16;
  }
  else if ((v8 & 0xFC000) != 0)
  {
    uint64_t v9 = 0x8367000080E1;
    int v10 = 32;
  }
  else if ((v8 & 0x3F00000) != 0)
  {
    uint64_t v9 = 0x140300001908;
    int v10 = 64;
  }
  else
  {
    if ((v8 & 0xC000000) == 0)
    {
      uint64_t result = MTLReleaseAssertionFailure();
      __break(1u);
      return result;
    }
    uint64_t v9 = 0x140600001908;
    int v10 = 128;
  }
  *(void *)(a1 + 32) = v9;
  *(_DWORD *)(a1 + 40) = 6408;
  *(_DWORD *)(a1 + 12) = v10;
  if ((v8 & 0x400) != 0)
  {
    int v11 = 1;
  }
  else if ((v8 & 0x40000) != 0)
  {
    int v11 = 2;
  }
  else if ((v8 & 0x80) != 0)
  {
    int v11 = 4;
  }
  else if ((v8 & 0x9A928) != 0)
  {
    int v11 = 8;
  }
  else if ((v8 & 0x200000) != 0)
  {
    int v11 = 12;
  }
  else if ((v8 & 0x2800000) != 0)
  {
    int v11 = 16;
  }
  else if ((v8 & 0x8000000) != 0)
  {
    int v11 = 32;
  }
  else
  {
    int v11 = (v8 >> 23) & 0x40;
  }
  *(_DWORD *)(a1 + 16) = v11;
  unsigned int v12 = *(_DWORD *)(a1 + 92);
  if ((v12 & 0x1000) != 0)
  {
    int v13 = 32;
  }
  else if ((v12 & 0x800) != 0)
  {
    int v13 = 24;
  }
  else if ((v12 & 0x400) != 0)
  {
    int v13 = 16;
  }
  else
  {
    int v13 = (v12 >> 4) & 8;
  }
  *(_DWORD *)(a1 + 20) = v13;
  unsigned int v14 = *(_DWORD *)(a1 + 96);
  if ((v14 & 0x1000) != 0)
  {
    int v15 = 32;
  }
  else if ((v14 & 0x800) != 0)
  {
    int v15 = 24;
  }
  else if ((v14 & 0x400) != 0)
  {
    int v15 = 16;
  }
  else
  {
    int v15 = (v14 >> 4) & 8;
  }
  *(_DWORD *)(a1 + 24) = v15;
  int v16 = *(unsigned __int16 *)(a1 + 104);
  int v17 = 1;
  *(_DWORD *)(a1 + 52) = *(_WORD *)(a1 + 104) != 0;
  *(_DWORD *)(a1 + 56) = 1;
  if (v16)
  {
    if (*(__int16 *)(a1 + 106) < 1)
    {
      int v17 = 1;
    }
    else
    {
      unsigned int v18 = *(unsigned __int16 *)(a1 + 106);
      if (v18 >= 5)
      {
        if (v18 < 0xA) {
          int v17 = 3;
        }
        else {
          int v17 = 4;
        }
      }
      else
      {
        int v17 = 2;
      }
    }
  }
  *(_DWORD *)(a1 + 60) = v17;
  *(_DWORD *)(a1 + 28) = *(__int16 *)(a1 + 102);
  *(unsigned char *)(a1 + 46) = 0;
  *(unsigned char *)(a1 + 48) = 0;
  return a1;
}

void sub_2406DC3FC(_Unwind_Exception *a1)
{
  GLDObject::~GLDObject(v1);
  _Unwind_Resume(a1);
}

uint64_t GLRFunctionCache::registerBuiltInFunction(uint64_t a1, void *a2)
{
  pthread_rwlock_wrlock((pthread_rwlock_t *)a1);
  CFIndex Count = CFArrayGetCount(*(CFArrayRef *)(a1 + 216));
  if (Count > 16777214)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = (Count + 1);
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 216), a2);
  }
  pthread_rwlock_unlock((pthread_rwlock_t *)a1);

  return v5;
}

void gldInitializeLibrary(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5)
{
  gldInitializeLibrary::space = a3;
  qword_26AFC8358 = a4;
  unk_26AFC8360 = a5;
  g_Library = (uint64_t)&gldInitializeLibrary::space;
}

uint64_t GLDLibrary::getAllDisplayMask(GLDLibrary *this)
{
  return 1;
}

BOOL GLDContextRec::drawableInvert(GLDContextRec *this)
{
  uint64_t v1 = *((void *)this + 50);
  if (!v1) {
    return 0;
  }
  if (*(_DWORD *)(*(void *)(v1 + 32) + 192)) {
    int v2 = 16;
  }
  else {
    int v2 = 32;
  }
  return (**((_DWORD **)this + 16) & v2) != 0;
}

_DWORD *GLDContextRec::bindTexture(_DWORD *this, GLDTextureRec *a2, int a3, char a4)
{
  uint64_t v4 = this;
  uint64_t v5 = (uint64_t *)&this[2 * a3 + 894];
  uint64_t v6 = *v5;
  int v7 = 1 << a3;
  this[662] &= ~(1 << a3);
  if (!a2)
  {
    uint64_t *v5 = 0;
    if (!v6) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
  uint64_t TextureResource = GLDTextureRec::getTextureResource(a2, 0);
  uint64_t *v5 = TextureResource;
  this = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)TextureResource + 16))(TextureResource);
  if (a4 < 0)
  {
    unsigned int v12 = *(unsigned __int8 *)(*((void *)a2 + 6) + 214);
    int v13 = (v12 >> 4) - (v12 & 0xF);
    unsigned int v14 = (char *)v4 + a3;
    if (v14[1816] != v13)
    {
      v14[1816] = v13;
      v4[661] |= v7;
    }
  }
  if (*((unsigned char *)&glrTextureFormats + 40 * *((unsigned int *)a2 + 16) + 37)) {
    v4[662] |= v7;
  }
  if (v6) {
LABEL_8:
  }
    this = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(void *)v6 + 24))(v6);
LABEL_9:
  v4[618] |= 4u;
  v4[660] |= v7;
  return this;
}

uint64_t gldCreatePipelineProgram(uint64_t a1, GLDLibrary **a2, uint64_t a3, uint64_t a4)
{
  GLDObject::operator new((GLDObject *)0x38);
  uint64_t v9 = v8;
  GLDObject::GLDObject(v8);
  *(void *)uint64_t v9 = &unk_26F4D6690;
  GLDLibrary::getAllDisplayMask(v9);
  *((void *)v9 + 2) = a1;
  *((void *)v9 + 3) = a3;
  *((void *)v9 + 4) = a4;
  *a2 = v9;
  return 0;
}

void sub_2406DC6B0(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t gldCreateProgram(uint64_t a1, GLDLibrary **a2, uint64_t a3, uint64_t a4)
{
  GLDObject::operator new((GLDObject *)0x28);
  uint64_t v9 = v8;
  GLDObject::GLDObject(v8);
  *(void *)uint64_t v9 = &unk_26F4D66C8;
  GLDLibrary::getAllDisplayMask(v9);
  *((void *)v9 + 2) = a1;
  *((void *)v9 + 3) = a3;
  *((void *)v9 + 4) = a4;
  *a2 = v9;
  return 0;
}

void sub_2406DC748(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLDTextureRec::ensureResource(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 48);
  if ((*(unsigned char *)(v1 + 24) & 8) == 0)
  {
    int v2 = (GLDTextureRec *)this;
    if (*(unsigned char *)(*(void *)(this + 40) + 440))
    {
      uint64_t v3 = mach_absolute_time();
      int v4 = (*(uint64_t (**)(void))(g_Library + 16))(*(void *)(*((void *)v2 + 6) + 32));
      this = mach_absolute_time();
      *((void *)v2 + 18) += this - v3;
      if (v4) {
        return this;
      }
    }
    else
    {
      this = (*(uint64_t (**)(void))(g_Library + 16))(*(void *)(v1 + 32));
      if (this) {
        return this;
      }
    }
    return GLDTextureRec::getIOSurfaceResource(v2);
  }
  return this;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void GLDContextRec::~GLDContextRec(GLDContextRec *this)
{
  int v2 = (void *)*((void *)this + 423);
  if (v2)
  {
    *((void *)this + 424) = v2;
    operator delete(v2);
  }
  uint64_t v3 = (void *)*((void *)this + 284);
  if (v3)
  {
    *((void *)this + 285) = v3;
    operator delete(v3);
  }

  GLDObject::~GLDObject(this);
}

uint64_t gldDestroyPipelineProgram(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 248)) {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  }
  if (a2) {
    (*(void (**)(uint64_t))(*(void *)a2 + 24))(a2);
  }
  if (*(_DWORD *)(a1 + 248)) {
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 256));
  }
  return 0;
}

uint64_t GLDObject::dealloc(uint64_t this)
{
  if (this) {
    return (*(uint64_t (**)(void))(*(void *)this + 8))();
  }
  return this;
}

uint64_t GLRResourceListPool::dealloc(GLRResourceListPool *this)
{
  int v2 = (void *)*((void *)this + 2);
  if (v2)
  {
    do
    {
      uint64_t v3 = (void *)v2[24];
      (*(void (**)(void *))(*v2 + 24))(v2);
      int v2 = v3;
    }
    while (v3);
  }

  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLRTextureResource::dealloc(id *this)
{
  id v2 = this[5];
  if (v2) {
    (*(void (**)(id))(*(void *)v2 + 24))(v2);
  }

  return GLDObject::dealloc((uint64_t)this);
}

void GLRTextureResource::~GLRTextureResource(GLRTextureResource *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t gldModifyPipelineProgram()
{
  return 0;
}

uint64_t GLRResourceList::dealloc(void **this)
{
  GLRResourceList::releaseAllResources((uint64_t)this);
  free(this[20]);
  free(this[21]);

  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLRResource::incrementUsage(uint64_t this)
{
  return this;
}

atomic_uint *GLDObject::release(atomic_uint *this)
{
  if (atomic_fetch_add_explicit(this + 2, 0xFFFFFFFF, memory_order_relaxed) == 1) {
    return (atomic_uint *)(*(uint64_t (**)(void))(*(void *)this + 32))();
  }
  return this;
}

uint64_t gldCreateSampler(uint64_t a1, GLDObject **a2, uint64_t a3, uint64_t a4)
{
  GLDObject::operator new((GLDObject *)0x38);
  uint64_t v9 = v8;
  GLDObject::GLDObject(v8);
  *(void *)uint64_t v9 = &unk_26F4D69B0;
  GLDSamplerRec::initWithShareGroup((uint64_t)v9, a1, a3, a4);
  *a2 = v9;
  return 0;
}

void sub_2406DCB5C(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

__n128 _renderPipelineKeyRetain(const __CFAllocator *a1, __n128 *a2)
{
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x40uLL, 0x80uLL, 0x1000040AE2C30F4uLL);
  uint64_t v3 = memptr;
  __n128 v4 = a2[3];
  __n128 v6 = *a2;
  __n128 v5 = a2[1];
  *((__n128 *)memptr + 2) = a2[2];
  v3[3] = v4;
  *uint64_t v3 = v6;
  v3[1] = v5;
  __n128 result = a2[6];
  __n128 v8 = a2[7];
  __n128 v10 = a2[4];
  __n128 v9 = a2[5];
  v3[6] = result;
  v3[7] = v8;
  v3[4] = v10;
  v3[5] = v9;
  return result;
}

uint64_t GLRResource::incrementBusy(uint64_t this)
{
  return this;
}

uint64_t GLDContextRec::setRenderViewport(id *this, double a2, double a3, double a4, double a5, float a6)
{
  GLDContextRec::updateRenderViewport((GLDContextRec *)this, a2, a3, a4, a5, a6);
  id v7 = this[2];
  long long v8 = *((_OWORD *)this + 321);
  v10[0] = *((_OWORD *)this + 320);
  v10[1] = v8;
  v10[2] = *((_OWORD *)this + 322);
  [v7 setViewport:v10];
  return [this[2] setViewportTransformEnabled:*((_WORD *)this[13] + 2) == 0];
}

uint64_t GLDContextRec::setRenderUniformBuffers(GLDContextRec *this)
{
  GLDContextRec::setRenderUniformBuffersInternal((uint64_t)this, (uint64_t)this + 2872, (uint64_t)this + 3096, 12, (uint64_t)this + 3448);

  return GLDContextRec::setRenderUniformBuffersInternal((uint64_t)this, (uint64_t)this + 2968, (uint64_t)this + 3192, 12, (uint64_t)this + 3464);
}

uint64_t GLDContextRec::isTransformFeedbackActive(GLDContextRec *this)
{
  uint64_t v1 = 0;
  while (!*(void *)(*((void *)this + 14) + 376 + v1))
  {
    v1 += 8;
    if (v1 == 32) {
      return 0;
    }
  }
  if (*(unsigned char *)(*((void *)this + 13) + 15713) || *(__int16 *)(*((void *)this + 13) + 15714) == -1) {
    return 0;
  }
  *((void *)this + 53) |= 0x2000uLL;
  return 1;
}

BOOL _cachedFunctionEqual(void *a1, void *a2)
{
  uint64_t v3 = (void *)[a1 bitCodeHash];
  __n128 v4 = (void *)[a2 bitCodeHash];
  return *v3 == *v4 && v3[1] == v4[1] && v3[2] == v4[2] && v3[3] == v4[3];
}

uint64_t gldDestroyDevice(atomic_uint *a1)
{
  if (a1) {
    GLDObject::release(a1);
  }
  return 0;
}

uint64_t GLRTextureResource::setForceASTC_LP(uint64_t this, int a2)
{
  if (*(unsigned __int8 *)(this + 57) != a2)
  {
    *(unsigned char *)(this + 57) = a2;
    *(unsigned char *)(this + 56) = 1;
  }
  return this;
}

id GLRRenderPipelineKey::copyDescriptor(GLRRenderPipelineKey *this, const GLRFunctionCache *a2)
{
  id v27 = objc_alloc_init(MEMORY[0x263F129C0]);
  __n128 v4 = (void *)[v27 colorAttachments];
  uint64_t v5 = 0;
  __n128 v6 = (char *)this + 104;
  do
  {
    id v7 = (void *)[v4 objectAtIndexedSubscript:v5];
    uint64_t v8 = *(unsigned __int16 *)&v6[2 * v5];
    [v7 setPixelFormat:v8];
    if (v8)
    {
      __n128 v9 = &v6[4 * v5];
      [v7 setBlendingEnabled:*((_DWORD *)v9 - 4) & 1];
      [v7 setRgbBlendOperation:((unint64_t)*((unsigned int *)v9 - 4) >> 1) & 7];
      [v7 setAlphaBlendOperation:((unint64_t)*((unsigned int *)v9 - 4) >> 4) & 7];
      [v7 setSourceRGBBlendFactor:((unint64_t)*((unsigned int *)v9 - 4) >> 7) & 0xF];
      [v7 setSourceAlphaBlendFactor:((unint64_t)*((unsigned int *)v9 - 4) >> 11) & 0xF];
      [v7 setDestinationRGBBlendFactor:((unint64_t)*((unsigned int *)v9 - 4) >> 15) & 0xF];
      [v7 setDestinationAlphaBlendFactor:((unint64_t)*((unsigned int *)v9 - 4) >> 19) & 0xF];
      [v7 setWriteMask:((unint64_t)*((unsigned int *)v9 - 4) >> 23) & 0xF];
    }
    ++v5;
  }
  while (v5 != 4);
  [v27 setDepthStencilWriteDisabled:(*((void *)this + 14) >> 40) & 1];
  if ((*((void *)this + 14) & 0xE0000000000) != 0) {
    uint64_t v10 = 252;
  }
  else {
    uint64_t v10 = 0;
  }
  [v27 setDepthAttachmentPixelFormat:v10];
  [v27 setStencilAttachmentPixelFormat:((uint64_t)(*((void *)this + 14) << 17) >> 63) & 0xFD];
  [v27 setSampleCoverageInvert:(*((void *)this + 14) >> 45) & 1];
  [v27 setLogicOperationEnabled:HIBYTE(*((void *)this + 14)) & 1];
  [v27 setLogicOperation:(*((void *)this + 14) >> 52) & 0xFLL];
  [v27 setAlphaTestEnabled:(*((void *)this + 14) >> 60) & 1];
  [v27 setAlphaTestFunction:(*((void *)this + 14) >> 57) & 7];
  [v27 setPointSmoothEnabled:(*((void *)this + 14) >> 61) & 1];
  [v27 setClipDistanceEnableMask:*((unsigned __int8 *)this + 116)];
  [v27 setSampleCount:*((_WORD *)this + 59) & 0xFLL];
  [v27 setSampleMask:*((unsigned int *)this + 20)];
  LODWORD(v11) = *((_DWORD *)this + 28);
  [v27 setSampleCoverage:v11];
  [v27 setAlphaToOneEnabled:(*((void *)this + 14) >> 62) & 1];
  [v27 setAlphaToCoverageEnabled:*((void *)this + 14) >> 63];
  [v27 setVertexDepthCompareClampMask:*((unsigned int *)this + 30)];
  [v27 setFragmentDepthCompareClampMask:*((unsigned int *)this + 31)];
  objc_msgSend(v27, "setVertexFunction:", GLRFunctionCache::getFunction(a2, *((_DWORD *)this + 18) & 0xFFFFFF));
  objc_msgSend(v27, "setFragmentFunction:", GLRFunctionCache::getFunction(a2, *(_DWORD *)((unsigned char *)this + 75) & 0xFFFFFF));
  [v27 setRasterizationEnabled:(*((void *)this + 14) >> 47) & 1];
  [v27 setOpenGLModeEnabled:1];
  id v12 = objc_alloc_init(MEMORY[0x263F12A80]);
  int v13 = (void *)[v12 layouts];
  unsigned int v14 = (void *)[v12 attributes];
  uint64_t v15 = 0;
  LODWORD(v16) = 0;
  int v17 = 0;
  do
  {
    unsigned int v18 = (void *)[v14 objectAtIndexedSubscript:v15];
    v19 = v18;
    int v20 = *((_DWORD *)this + v15);
    if ((~v20 & 3) != 0)
    {
      if ((v20 & 0xFC) != 0)
      {
        v24 = (void *)[v13 objectAtIndexedSubscript:(v17 + 15)];
        [v19 setFormat:*((_DWORD *)this + v15) >> 2];
        [v19 setBufferIndex:(v17 + 15)];
        [v19 setOffset:(unint64_t)*((unsigned int *)this + v15) >> 30];
        [v24 setStride:((unint64_t)*((unsigned int *)this + v15) >> 8) & 0xFFF];
        [v24 setStepFunction:*((_DWORD *)this + v15) & 3];
        [v24 setStepRate:((unint64_t)*((unsigned int *)this + v15) >> 20) & 0x3FF];
        ++v17;
      }
    }
    else if (v20 >> 2)
    {
      objc_msgSend(v18, "setFormat:");
      [v19 setOffset:((unint64_t)*((unsigned int *)this + v15) >> 20) & 0x3FF];
      if ((*((_DWORD *)this + v15) & 0xFFF00) != 0)
      {
        v21 = (void *)[v13 objectAtIndexedSubscript:15];
        [v19 setBufferIndex:15];
        [v21 setStride:((unint64_t)*((unsigned int *)this + v15) >> 8) & 0xFFF];
        [v21 setStepFunction:1];
        v22 = v21;
        uint64_t v23 = 1;
      }
      else
      {
        v25 = (void *)[v13 objectAtIndexedSubscript:14];
        [v19 setBufferIndex:14];
        uint64_t v16 = (v16 + 16);
        [v25 setStride:v16];
        [v25 setStepFunction:0];
        v22 = v25;
        uint64_t v23 = 0;
      }
      [v22 setStepRate:v23];
    }
    ++v15;
  }
  while (v15 != 18);
  [v27 attachVertexDescriptor:v12];
  [v27 setLabel:*MEMORY[0x263F12C98]];

  return v27;
}

uint64_t GLRTextureResource::initWithMetalTexture(GLDLibrary *a1, void *a2, uint64_t a3)
{
  *((void *)a1 + 3) = a3;
  *((void *)a1 + 4) = a2;
  return 1;
}

uint64_t gldDestroyBuffer(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 248)) {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  }
  if (a2) {
    (*(void (**)(uint64_t))(*(void *)a2 + 24))(a2);
  }
  if (*(_DWORD *)(a1 + 248)) {
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 256));
  }
  return 0;
}

uint64_t GLDBufferRec::getMemoryPlugin(GLDBufferRec *this)
{
  return *((void *)this + 5);
}

uint64_t GLRTextureViewResource::dealloc(id *this)
{
  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLDDeviceRec::getRenderPipelineStateFromKey(GLDDeviceRec *this, const GLRRenderPipelineKey *a2)
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3052000000;
  int v17 = __Block_byref_object_copy_;
  unsigned int v18 = __Block_byref_object_dispose_;
  uint64_t v19 = 0;
  context[0] = (char *)this + 456;
  context[1] = a2;
  context[2] = &v19;
  dispatch_sync_f(*((dispatch_queue_t *)this + 56), context, (dispatch_function_t)_getRenderPipelineState);
  uint64_t v4 = v15[5];
  if (!v4)
  {
    uint64_t v5 = (void *)MEMORY[0x2455F59C0]();
    id v12 = 0;
    id v6 = GLRRenderPipelineKey::copyDescriptor(a2, (GLDDeviceRec *)((char *)this + 216));
    uint64_t v11 = 0;
    uint64_t v7 = [*((id *)this + 3) newRenderPipelineStateWithDescriptor:v6 options:1 reflection:&v11 error:&v12];
    if (v7)
    {
      *((_DWORD *)this + 3) |= 0x300000u;
      uint64_t v8 = *((void *)this + 56);
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = ___ZN12GLDDeviceRec29getRenderPipelineStateFromKeyEPK20GLRRenderPipelineKey_block_invoke;
      _OWORD v10[3] = &unk_2650D0BA8;
      v10[7] = this;
      v10[8] = a2;
      v10[6] = &v14;
      v10[4] = v7;
      v10[5] = v11;
      dispatch_barrier_sync(v8, v10);
    }
    else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
    {
      GLDDeviceRec::getRenderPipelineStateFromKey([v12 localizedDescription], buf);
    }

    uint64_t v4 = v15[5];
  }
  _Block_object_dispose(&v14, 8);
  return v4;
}

void sub_2406DD4FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *GLRDataBufferManager::allocDataBuffer(GLRDataBufferManager *this, unint64_t a2, unint64_t *a3)
{
  _os_nospin_lock_lock();
  unint64_t v6 = *((void *)this + 33);
  if (v6 >= a2 && v6 == *((void *)this + 34))
  {
    uint64_t v7 = *((void *)this + 32);
    if (v7)
    {
      uint64_t v8 = v7 - 1;
      *((void *)this + 32) = v8;
      __n128 v9 = (void *)*((void *)this + v8);
      *a3 = v6;
      _os_nospin_lock_unlock();
      if (v9) {
        goto LABEL_17;
      }
      goto LABEL_14;
    }
  }
  else
  {
    if (*((void *)this + 32))
    {
      unint64_t v10 = 0;
      do
      {

        *((void *)this + v10++) = 0;
      }
      while (v10 < *((void *)this + 32));
    }
    *((void *)this + 32) = 0;
    unint64_t v6 = *((void *)this + 34);
  }
  for (; v6 < a2; v6 *= 2)
  {
    if (v6 >= *((void *)this + 36)) {
      break;
    }
  }
  *((void *)this + 33) = v6;
  *((void *)this + 34) = v6;
  _os_nospin_lock_unlock();
LABEL_14:
  if (*((void *)this + 33) >= a2)
  {
    __n128 v9 = objc_msgSend(*(id *)(*(void *)(*((void *)this + 43) + 96) + 24), "newBufferWithLength:options:");
    [v9 setLabel:*MEMORY[0x263F12C98]];
  }
  else
  {
    __n128 v9 = 0;
  }
LABEL_17:
  *a3 = *((void *)this + 33);
  return v9;
}

uint64_t GLDContextRec::updateRenderPolygonMode(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 104);
  id v2 = (_WORD *)(v1 + 13256);
  if (*(unsigned char *)(v1 + 13265))
  {
    *(void *)(this + 424) |= 0x20uLL;
    int v3 = *(_DWORD *)(v1 + 13248);
    int v4 = *(_DWORD *)(v1 + 13244);
  }
  else
  {
    int v3 = 0;
    int v4 = 0;
  }
  *(_DWORD *)(this + 5200) = v3;
  *(_DWORD *)(this + 5204) = v4;
  *(void *)(this + 5112) = 0;
  if (!*(unsigned char *)(v1 + 13262))
  {
    uint64_t v6 = 0;
    goto LABEL_10;
  }
  *(void *)(this + 424) |= 4uLL;
  int v5 = *(unsigned __int16 *)(v1 + 13258);
  uint64_t v6 = 1;
  switch(v5)
  {
    case 1028:
LABEL_10:
      *(void *)(this + 5104) = v6;
      LOBYTE(v6) = 0;
      goto LABEL_11;
    case 1032:
LABEL_11:
      *(unsigned char *)(this + 5081) = v6;
      break;
    case 1029:
      uint64_t v6 = 2;
      goto LABEL_10;
  }
  *(void *)(this + 5096) = *(unsigned __int8 *)(this + 5080) != (*v2 == 2304);
  *(_DWORD *)(this + 2472) |= 0x100u;
  return this;
}

double GLRDataBufferManager::reset(GLRDataBufferManager *this)
{
  *((void *)this + 37) = 0;
  double result = 0.0;
  *(_OWORD *)((char *)this + 312) = 0u;
  *(_OWORD *)((char *)this + 328) = 0u;
  return result;
}

double GLDContextRec::beginRenderPass(GLDContextRec *this)
{
  if (!*((void *)this + 5)) {
    GLDContextRec::getCommandBuffer(this);
  }
  uint64_t v2 = *((void *)this + 595);
  if ((*(_DWORD *)(v2 + 40) - *(_DWORD *)(v2 + 36)) <= 0x1FF)
  {
    int v3 = (void *)*((void *)this + 5);
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = ___ZN13GLDContextRec15beginRenderPassEv_block_invoke;
    v27[3] = &__block_descriptor_48_e28_v16__0___MTLCommandBuffer__8l;
    v27[4] = this;
    v27[5] = v2;
    [v3 addCompletedHandler:v27];
    *((void *)this + 595) = GLDContextRec::allocQueryStagingBuffer(this);
  }
  uint64_t v4 = **(void **)(*((void *)this + 50) + 40);
  int v5 = (void *)MEMORY[0x263F12C98];
  if (v4 && *(void *)(v4 + 184))
  {
    uint64_t v6 = (void *)MEMORY[0x2455F59C0]();
    id v7 = (id)[*((id *)this + 5) blitCommandEncoder];
    [v7 setLabel:*v5];
    GLDTextureRec::blitAccum(v4, v7, *((void *)this + 8));
    [v7 endEncoding];
  }
  uint64_t v8 = GLDContextRec::buildRenderPassDescriptor(this);
  __n128 v9 = (void *)MEMORY[0x2455F59C0](v8);
  unint64_t v10 = (void *)*((void *)this + 5);
  uint64_t v11 = *((void *)this + 231);
  if (*((unsigned char *)this + 2232))
  {
    id v12 = (id)[v10 sampledRenderCommandEncoderWithDescriptor:v11 programInfoBuffer:*((void *)this + 287) capacity:*((void *)this + 288)];
    *((void *)this + 285) = *((void *)this + 284);
  }
  else
  {
    id v12 = (id)[v10 renderCommandEncoderWithDescriptor:v11];
  }
  *((void *)this + 2) = v12;
  [*((id *)this + 2) setLabel:*v5];
  ++*((_DWORD *)this + 1257);
  int v13 = (void *)*((void *)this + 2);
  *((void *)this + 427) = sel_setVertexBytes_length_atIndex_;
  *((void *)this + 428) = objc_msgSend(v13, "methodForSelector:");
  uint64_t v14 = (void *)*((void *)this + 2);
  *((void *)this + 429) = sel_setFragmentBytes_length_atIndex_;
  *((void *)this + 430) = objc_msgSend(v14, "methodForSelector:");
  uint64_t v15 = (void *)*((void *)this + 2);
  *((void *)this + 431) = sel_setVertexBuffer_offset_atIndex_;
  *((void *)this + 432) = objc_msgSend(v15, "methodForSelector:");
  uint64_t v16 = (void *)*((void *)this + 2);
  *((void *)this + 433) = sel_setFragmentBuffer_offset_atIndex_;
  *((void *)this + 434) = objc_msgSend(v16, "methodForSelector:");
  int v17 = (void *)*((void *)this + 2);
  *((void *)this + 435) = sel_setVertexTexture_atIndex_;
  *((void *)this + 436) = objc_msgSend(v17, "methodForSelector:");
  unsigned int v18 = (void *)*((void *)this + 2);
  *((void *)this + 437) = sel_setFragmentTexture_atIndex_;
  *((void *)this + 438) = objc_msgSend(v18, "methodForSelector:");
  uint64_t v19 = (void *)*((void *)this + 2);
  *((void *)this + 439) = sel_setVertexSamplerState_lodMinClamp_lodMaxClamp_atIndex_;
  *((void *)this + 440) = objc_msgSend(v19, "methodForSelector:");
  int v20 = (void *)*((void *)this + 2);
  *((void *)this + 441) = sel_setFragmentSamplerState_lodMinClamp_lodMaxClamp_atIndex_;
  *((void *)this + 442) = objc_msgSend(v20, "methodForSelector:");
  uint64_t v21 = (void *)*((void *)this + 2);
  *((void *)this + 443) = sel_setVertexBufferOffset_atIndex_;
  *((void *)this + 444) = objc_msgSend(v21, "methodForSelector:");
  v22 = (void *)*((void *)this + 2);
  *((void *)this + 445) = sel_drawIndexedPrimitives_indexCount_indexType_indexBuffer_indexBufferOffset_instanceCount_;
  *((void *)this + 446) = objc_msgSend(v22, "methodForSelector:");
  *((unsigned char *)this + 5086) = objc_opt_respondsToSelector() & 1;
  *((_DWORD *)this + 1263) |= *((_DWORD *)this + 1312) | 0x10;
  GLDContextRec::addRenderPassResources(this);
  uint64_t v23 = *((void *)this + 599);
  if (v23)
  {
    int v24 = *(_DWORD *)(v23 + 40);
    unsigned int v26 = 0;
    *(void *)(v23 + 48) = *((void *)this + 596);
    *((unsigned char *)this + 5088) = 1;
    GLDQueryStagingBuffer::allocateResultOffset(*((GLDQueryStagingBuffer **)this + 595), &v26, v24);
    [*((id *)this + 2) setVisibilityResultMode:1 offset:v26];
    *((void *)this + 53) |= 0x1000uLL;
  }
  [*((id *)this + 2) setProvokingVertexMode:1];
  *((_DWORD *)this + 618) |= 0x1FFFFu;
  double result = NAN;
  *((void *)this + 330) = -1;
  *((_DWORD *)this + 667) = -1;
  return result;
}

void GLDObject::operator new(GLDObject *this)
{
  uint64_t v2 = malloc_type_malloc((size_t)this, 0xAF26814AuLL);

  bzero(v2, (size_t)this);
}

uint64_t gldChoosePixelFormat(void *a1, unsigned int *a2, const int *a3)
{
  unsigned int v6 = 0;
  uint64_t v4 = GLRPixelFormat::create((GLRPixelFormat *)&v6, a2, a3);
  if (v4) {
    *a1 = v4 + 64;
  }
  return v6;
}

BOOL GLRResource::decrementUsage(atomic_uint *this)
{
  return atomic_fetch_add_explicit(this + 3, 0xFFFFFFFF, memory_order_relaxed) == 1;
}

intptr_t GLDContextRec::flushContext(id *this)
{
  if (*((_DWORD *)this + 1151)) {
    GLDContextRec::beginRenderPass((GLDContextRec *)this);
  }
  if (this[2]) {
    GLDContextRec::endRenderPass((GLDContextRec *)this);
  }
  id v2 = this[4];
  if (v2)
  {
    [v2 endEncoding];

    this[4] = 0;
  }

  return GLDContextRec::flushContextInternal((GLDContextRec *)this);
}

uint64_t GLDQueryStagingBuffer::dealloc(GLDQueryStagingBuffer *this)
{
  (*(void (**)(void))(**((void **)this + 3) + 24))(*((void *)this + 3));
  free(*((void **)this + 7));
  GLDObject::release(*((atomic_uint **)this + 2));

  return GLDObject::dealloc((uint64_t)this);
}

void GLDSamplerRec::~GLDSamplerRec(GLDSamplerRec *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t GLDTextureRec::update(GLDTextureRec *this, unsigned int a2, unsigned __int16 *a3)
{
  if ((a2 & 2) != 0) {
    GLDTextureRec::updatePixelFormat(this);
  }
  int v5 = *((_DWORD *)this + 16);
  if (!v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      GLDTextureRec::update((uint64_t)this);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      GLDTextureRec::update((uint64_t)this);
    }
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_FAULT)) {
      GLDTextureRec::update(a2, (a2 & 2) == 0);
    }
    MTLReleaseAssertionFailure();
    goto LABEL_27;
  }
  if (a2)
  {
    GLDTextureRec::updateDescriptor(this);
    int v5 = *((_DWORD *)this + 16);
  }
  unsigned int v6 = (_WORD *)*((void *)this + 6);
  BOOL v7 = v5 == 52 && (unsigned __int16)(v6[96] + 29522) != 65534 && (unsigned __int16)(v6[96] + 29522) != 0xFFFF;
  *((unsigned char *)this + 74) = v7;
  int v8 = *v6 & 0x1C00;
  if (v8 == 2048)
  {
    uint64_t result = GLDTextureRec::loadIOSurfaceTexture(this, a2);
    if (!result) {
      return result;
    }
    goto LABEL_16;
  }
  if (v8 != 4096)
  {
LABEL_27:
    unint64_t v10 = (GLDContextRec *)MTLReleaseAssertionFailure();
    return gldSetInteger(v10, v11, v12);
  }
  if ((GLDTextureRec::loadPrivateTexture(this, a2, a3) & 1) == 0) {
    return 0;
  }
LABEL_16:
  if ((*(unsigned char *)(*((void *)this + 6) + 24) & 8) != 0) {
    GLDTextureRec::updateSamplerState((MTLTextureType *)this, a2);
  }
  return 1;
}

uint64_t gldSetInteger(GLDContextRec *this, int a2, int *aBlock)
{
  uint64_t result = 0;
  if (a2 > 702)
  {
    if (a2 > 1410)
    {
      if (a2 != 1411)
      {
        if (a2 == 1412)
        {
          if (*((_DWORD *)this + 1151)) {
            GLDContextRec::beginRenderPass(this);
          }
          if (*((void *)this + 2)) {
            GLDContextRec::endRenderPass(this);
          }
          uint64_t result = 0;
          *((unsigned char *)this + 2232) = 1;
        }
        else if (a2 == 1413)
        {
          if (*((_DWORD *)this + 1151)) {
            GLDContextRec::beginRenderPass(this);
          }
          if (*((void *)this + 2)) {
            GLDContextRec::endRenderPass(this);
          }
          uint64_t result = 0;
          *((unsigned char *)this + 2232) = 0;
        }
        return result;
      }
      uint64_t v14 = *(void **)(*((void *)this + 12) + 24);
      uint64_t v15 = *(void **)aBlock;
      *((unsigned char *)this + 2232) = 0;
      if (v15)
      {
        [v14 setShaderDebugInfoCaching:1];
        memset(*((void **)aBlock + 2), 255, *((void *)aBlock + 4));
        memset(*(void **)aBlock, 255, 40 * *((void *)aBlock + 1));
        *((void *)this + 280) = *(void *)aBlock;
        uint64_t v16 = *((void *)aBlock + 1);
        *((void *)this + 281) = v16;
        *((void *)this + 282) = 0;
        *((_DWORD *)this + 566) = 0;
        *((void *)this + 285) = *((void *)this + 284);
        *((void *)this + 288) = 2 * v16;
        operator new[]();
      }
      *((_DWORD *)this + 566) = 0;
      *((void *)this + 282) = 0;
      *((_OWORD *)this + 140) = 0u;
      uint64_t v18 = *((void *)this + 287);
      if (v18) {
        MEMORY[0x2455F5600](v18, 0x1000C80504FFAC1);
      }
      *((void *)this + 287) = 0;
      *((void *)this + 288) = 0;
      [v14 unmapShaderSampleBuffer];
    }
    else
    {
      if (a2 == 703)
      {
        uint64_t result = 0;
        atomic_fetch_or_explicit((atomic_uint *volatile)(*((void *)this + 12) + 960), 1 << *aBlock, memory_order_relaxed);
        return result;
      }
      if (a2 != 707)
      {
        if (a2 == 1402)
        {
          uint64_t result = 0;
          *(unsigned char *)(*((void *)this + 11) + 440) = *aBlock != 0;
        }
        return result;
      }
      if (*((void *)aBlock + 23))
      {
        if (*((_DWORD *)this + 1151)) {
          GLDContextRec::beginRenderPass(this);
        }
        if (*((void *)this + 2)) {
          GLDContextRec::endRenderPass(this);
        }
        if (!*((void *)this + 5)) {
          GLDContextRec::getCommandBuffer(this);
        }
        id v12 = (void *)MEMORY[0x2455F59C0](result);
        id v13 = (id)[*((id *)this + 5) blitCommandEncoder];
        [v13 setLabel:*MEMORY[0x263F12C98]];
        GLDTextureRec::blitAccum((uint64_t)aBlock, v13, *((void *)this + 8));
        [v13 endEncoding];
      }
    }
    return 0;
  }
  if (a2 <= 665)
  {
    switch(a2)
    {
      case 607:
        int v6 = *aBlock;
        if (*aBlock == 2)
        {
          uint64_t v19 = (void *)*((void *)this + 2);
          uint64_t v20 = 2;
        }
        else
        {
          if (v6 != 1)
          {
            if (v6) {
              return 0;
            }
            uint64_t result = 0;
            *(_DWORD *)(*((void *)this + 12) + 16) = 1;
            return result;
          }
          uint64_t v19 = (void *)*((void *)this + 2);
          uint64_t v20 = 1;
        }
        [v19 setCommandDataCorruptModeSPI:v20];
        return 0;
      case 608:
        GLDContextRec::flushContext((id *)this);
        uint64_t v9 = *aBlock;
        if (v9 > 4) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = qword_2406F5870[v9];
        }
        [*((id *)this + 10) setGPUPriority:v10];
        return 0;
      case 609:
      case 610:
        return result;
      case 611:
        uint64_t result = 0;
        *((void *)this + 655) = aBlock;
        return result;
      case 612:
        if (!*((void *)this + 655)) {
          return 10007;
        }
        v24[0] = 0;
        v24[1] = v24;
        v24[2] = 0x3052000000;
        v24[3] = __Block_byref_object_copy__0;
        v24[4] = __Block_byref_object_dispose__0;
        v25 = 0;
        v25 = _Block_copy(aBlock);
        v22[0] = 0;
        v22[1] = v22;
        v22[2] = 0x3052000000;
        v22[3] = __Block_byref_object_copy__8;
        v22[4] = __Block_byref_object_dispose__9;
        id v23 = 0;
        id v23 = *((id *)this + 655);
        GLDContextRec::flushContext((id *)this);
        int v11 = (void *)*((void *)this + 5);
        if (!v11)
        {
          GLDContextRec::getCommandBuffer(this);
          int v11 = (void *)*((void *)this + 5);
        }
        v21[0] = MEMORY[0x263EF8330];
        v21[1] = 3221225472;
        v21[2] = ___ZN13GLDContextRec10setIntegerEjPKi_block_invoke;
        v21[3] = &unk_2650D2888;
        v21[4] = v22;
        v21[5] = v24;
        [v11 addCompletedHandler:v21];
        _Block_object_dispose(v22, 8);
        _Block_object_dispose(v24, 8);
        return 0;
      default:
        if (a2 == 318)
        {
          uint64_t result = 0;
          *((unsigned char *)this + 6277) = *aBlock == 0;
        }
        return result;
    }
  }
  if (a2 == 666)
  {
    int v17 = *((_DWORD *)this + 95);
    uint64_t result = 0;
    if (*aBlock) {
      unsigned int v8 = v17 & 0xFFFFFDFF;
    }
    else {
      unsigned int v8 = v17 | 0x200;
    }
  }
  else
  {
    if (a2 != 667) {
      return result;
    }
    int v7 = *((_DWORD *)this + 95);
    uint64_t result = 0;
    if (*aBlock) {
      unsigned int v8 = v7 & 0xFFDFFFFF;
    }
    else {
      unsigned int v8 = v7 | 0x200000;
    }
  }
  *((_DWORD *)this + 95) = v8;
  return result;
}

void sub_2406DE260(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t GLRResourceList::addFence(GLRResourceList *this, GLRResource *a2)
{
  int v4 = *((_DWORD *)this + 44);
  if (v4 == *((_DWORD *)this + 45))
  {
    unsigned int v5 = 2 * v4;
    *((_DWORD *)this + 45) = v5;
    int v6 = malloc_type_realloc(*((void **)this + 21), 8 * v5, 0x2004093837F09uLL);
    *((void *)this + 21) = v6;
    int v4 = *((_DWORD *)this + 44);
  }
  else
  {
    int v6 = (void *)*((void *)this + 21);
  }
  *((_DWORD *)this + 44) = v4 + 1;
  v6[v4] = a2;
  (*(void (**)(GLRResource *))(*(void *)a2 + 16))(a2);

  return GLRResource::incrementUsage((uint64_t)a2);
}

uint64_t GLDContextRec::addRenderPassResources(GLDContextRec *this)
{
  uint64_t v2 = -80;
  do
  {
    int v3 = *(GLDTextureRec **)((char *)this + v2 + 4216);
    if (v3)
    {
      uint64_t TextureResource = GLDTextureRec::getTextureResource(v3, 0);
      if (!TextureResource) {
        goto LABEL_5;
      }
LABEL_4:
      GLRResourceList::addResource(*((void *)this + 8), TextureResource);
      goto LABEL_5;
    }
    uint64_t TextureResource = *(void *)((char *)this + v2 + 4296);
    if (TextureResource) {
      goto LABEL_4;
    }
LABEL_5:
    v2 += 8;
  }
  while (v2);
  uint64_t v5 = *((void *)this + 8);
  uint64_t v6 = *(void *)(*((void *)this + 595) + 24);

  return GLRResourceList::addResource(v5, v6);
}

uint64_t GLRResource::waitIdle(uint64_t this, GLDShareGroupRec *a2)
{
  if (*(_DWORD *)(this + 16)) {
    return GLDShareGroupRec::waitUsage(a2, (volatile int *)(this + 16));
  }
  return this;
}

intptr_t GLDContextRec::flushContextInternal(GLDContextRec *this)
{
  uint64_t v2 = (char *)this + 5087;
  *((_DWORD *)this + 1256) = 0;
  *((unsigned char *)this + 5087) = 0;
  if (*((void *)this + 5))
  {
    atomic_fetch_or((atomic_ullong *volatile)(*((void *)this + 12) + 536), *((void *)this + 53));
    *((void *)this + 53) = 0;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN13GLDContextRec20flushContextInternalEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    if (GLDContextRec::flushContextInternal(void)::once != -1) {
      dispatch_once(&GLDContextRec::flushContextInternal(void)::once, block);
    }
    *((_DWORD *)this + 1263) |= 0x4000u;
    int v3 = *((void *)this + 657);
    if (v3) {
      dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    }
    GLRResourceList::addFence(*((GLRResourceList **)this + 8), *((GLRResource **)this + 9));
    v18[0] = 0;
    v18[1] = v18;
    v18[2] = 0x3052000000;
    v18[3] = __Block_byref_object_copy__1;
    uint64_t v4 = *((void *)this + 698);
    v18[4] = __Block_byref_object_dispose__1;
    v18[5] = v4;
    v17[0] = 0;
    v17[1] = v17;
    v17[2] = 0x3052000000;
    v17[3] = __Block_byref_object_copy__1;
    uint64_t v5 = *((void *)this + 743);
    v17[4] = __Block_byref_object_dispose__1;
    v17[5] = v5;
    *((void *)this + 628) = 0;
    GLRDataBufferManager::reset((GLDContextRec *)((char *)this + 5272));
    GLRDataBufferManager::reset((GLDContextRec *)((char *)this + 5632));
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = *((void *)this + 8);
    v15[0] = 0;
    v15[1] = v15;
    v15[2] = 0x2020000000;
    v15[3] = *((void *)this + 11);
    *((void *)this + 8) = 0;
    dispatch_group_enter(*((dispatch_group_t *)this + 658));
    uint64_t v6 = (void *)*((void *)this + 5);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = ___ZN13GLDContextRec20flushContextInternalEv_block_invoke_1;
    v14[3] = &unk_2650D28D8;
    v14[4] = v16;
    v14[5] = this;
    [v6 addScheduledHandler:v14];
    char v7 = v2[1];
    if (v7)
    {
      uint64_t v8 = *((void *)this + 596);
      *((void *)this + 596) = v8 + 1;
      *((void *)this + 597) = v8;
      v2[1] = 0;
    }
    else
    {
      uint64_t v8 = 0;
    }
    uint64_t v9 = (void *)*((void *)this + 5);
    uint64_t v10 = *((void *)this + 6);
    *((void *)this + 6) = 0;
    *((void *)this + 7) = 0;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = ___ZN13GLDContextRec20flushContextInternalEv_block_invoke_2;
    v12[3] = &unk_2650D2900;
    v12[4] = v18;
    v12[5] = v17;
    v12[8] = this;
    v12[9] = v10;
    char v13 = v7;
    v12[10] = v8;
    v12[6] = v16;
    v12[7] = v15;
    [v9 addCompletedHandler:v12];
    [*((id *)this + 5) commit];

    *((void *)this + 5) = 0;
    _Block_object_dispose(v15, 8);
    _Block_object_dispose(v16, 8);
    _Block_object_dispose(v17, 8);
    _Block_object_dispose(v18, 8);
  }
  intptr_t result = dispatch_group_wait(*((dispatch_group_t *)this + 658), 0xFFFFFFFFFFFFFFFFLL);
  if (*((void *)this + 783) == 4 && !*(_DWORD *)(*((void *)this + 12) + 16) && !v2[1190])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
      GLDContextRec::flushContextInternal();
    }
    abort();
  }
  return result;
}

void sub_2406DE704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v32 - 184), 8);
  _Block_object_dispose((const void *)(v32 - 136), 8);
  _Unwind_Resume(a1);
}

void GLRDataBufferManager::dealloc(id *this)
{
  if (this[32])
  {
    unint64_t v2 = 0;
    do
    {

      this[v2++] = 0;
    }
    while (v2 < (unint64_t)this[32]);
  }
  this[32] = 0;
}

uint64_t gldDestroyTexture(uint64_t a1, GLDTextureRec *this)
{
  if (*(_DWORD *)(a1 + 248)) {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  }
  if (this)
  {
    *((void *)this + 6) = 0;
    GLDObject::release((atomic_uint *)this);
  }
  if (*(_DWORD *)(a1 + 248)) {
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 256));
  }
  return 0;
}

uint64_t gldDestroyVertexArray(uint64_t a1, atomic_uint *this)
{
  if (*(_DWORD *)(a1 + 248)) {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  }
  if (this) {
    GLDObject::release(this);
  }
  if (*(_DWORD *)(a1 + 248)) {
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 256));
  }
  return 0;
}

void GLDObject::GLDObject(GLDObject *this)
{
  *(void *)this = &unk_26F4D6648;
  *((_DWORD *)this + 2) = 1;
}

uint64_t gldCreateContext(pthread_mutex_t *a1, void **a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (!a3) {
    return 10002;
  }
  uint64_t v11 = a3 - 64;
  if (!GLRPixelFormat::validate((GLRPixelFormat *)(a3 - 64))) {
    return 10002;
  }
  memptr = 0;
  malloc_type_posix_memalign(&memptr, 0x40uLL, 0x18C0uLL, 0x10F1040CC762082uLL);
  id v12 = (GLDContextRec *)memptr;
  bzero(memptr, 0x18C0uLL);
  GLDContextRec::GLDContextRec(v12);
  if (GLDContextRec::initWithShareGroup((uint64_t)memptr, a1, a5, a6, v11, a4))
  {
    uint64_t result = 0;
    if (memptr) {
      *a2 = memptr;
    }
  }
  else
  {
    GLDObject::release((atomic_uint *)memptr);
    return 10016;
  }
  return result;
}

CFMutableArrayRef GLRFunctionCache::init(pthread_rwlock_t *this)
{
  pthread_rwlock_init(this, 0);
  this[1].__sig = (uint64_t)CFDictionaryCreateMutable(0, 0, &_cachedFunctionKeyCallbacks, &_cachedFunctionValueCallbacks);
  *(void *)this[1].__opaque = CFDictionaryCreateMutable(0, 0, &_cachedFunctionKeyCallbacks, &_cachedFunctionValueCallbacks);
  CFMutableArrayRef result = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  *(void *)&this[1].__opaque[8] = result;
  return result;
}

CFMutableDictionaryRef GLRDepthStencilCache::init(GLRDepthStencilCache *this)
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0, 0, &_depthStencilKeyCallbacks, MEMORY[0x263EFFF90]);
  *(void *)this = result;
  return result;
}

void GLDContextRec::updateDrawBufferState(GLDContextRec *this, int a2)
{
  if ((a2 & 0x400) != 0 && *((unsigned __int8 *)this + 5085) != *(unsigned __int8 *)(*((void *)this + 13) + 12952))
  {
    if (*((_DWORD *)this + 1151)) {
      GLDContextRec::beginRenderPass(this);
    }
    if (*((void *)this + 2)) {
      GLDContextRec::endRenderPass(this);
    }
    *((unsigned char *)this + 5085) = *(unsigned char *)(*((void *)this + 13) + 12952) != 0;
  }
  if ((a2 & 0x44000000) != 0)
  {
    GLDContextRec::updateRenderScissor((uint64_t)this);
    *((_DWORD *)this + 453) |= 0x10804202u;
  }
  if ((a2 & 0x40000) != 0)
  {
    GLDContextRec::updateRenderColorMaskMode((uint64_t)this);
    if ((a2 & 0x80000) == 0)
    {
LABEL_12:
      if ((a2 & 0x100000) == 0) {
        return;
      }
      goto LABEL_13;
    }
  }
  else if ((a2 & 0x80000) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)this + 453) |= 0x200u;
  if ((a2 & 0x100000) == 0) {
    return;
  }
LABEL_13:
  *((_DWORD *)this + 453) |= 0x10000000u;
}

uint64_t gldUpdateDrawFramebuffer(GLDContextRec *this, int a2)
{
  if ((a2 & 0x40000000) == 0)
  {
    int v4 = a2 & 0x43C0478;
    goto LABEL_9;
  }
  uint64_t v5 = *(GLDFramebufferRec **)(*((void *)this + 14) + 416);
  if (!v5)
  {
    *((_DWORD *)this + 450) = 0;
    char v7 = 0;
    goto LABEL_7;
  }
  int v6 = *((_DWORD *)v5 + 6);
  if (*((_DWORD *)this + 450) != v6)
  {
    *((_DWORD *)this + 450) = v6;
    char v7 = v5;
LABEL_7:
    GLDContextRec::bindDrawFramebuffer(this, v7);
  }
  *((void *)this + 50) = v5;
  int v4 = *((_DWORD *)this + 452) | a2 & 0x43C0478;
  *((_DWORD *)this + 452) = 0;
LABEL_9:
  *((unsigned char *)this + 5080) = GLDContextRec::drawableInvert(this);
  if (v4) {
    GLDContextRec::updateDrawBufferState(this, v4);
  }
  if (*((_DWORD *)this + 453)) {
    return 2;
  }
  else {
    return 1;
  }
}

uint64_t gldCreateTexture(uint64_t a1, GLDObject **a2, uint64_t a3, uint64_t a4)
{
  GLDObject::operator new((GLDObject *)0xC8);
  uint64_t v9 = v8;
  GLDObject::GLDObject(v8);
  *(void *)uint64_t v9 = &unk_26F4D6A50;
  GLDLibrary::getAllDisplayMask(v9);
  *((void *)v9 + 5) = a1;
  *((void *)v9 + 6) = a3;
  *((void *)v9 + 7) = a4;
  int v10 = *(_DWORD *)(a1 + 24) + 1;
  *(_DWORD *)(a1 + 24) = v10;
  *((_DWORD *)v9 + 3) = v10;
  *a2 = v9;
  return 0;
}

void sub_2406DEC70(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLDPipelineProgramRec::dealloc(id *this)
{
  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLRResourceList::makeResourcesNotBusyAndReset(GLRResourceList *this)
{
  uint64_t v2 = *((unsigned int *)this + 35);
  if (v2)
  {
    uint64_t v3 = 0;
    for (uint64_t i = 0; i != v2; ++i)
    {
      uint64_t v5 = *((void *)this + 20);
      uint64_t v6 = v5 + (i << 6);
      uint64_t v7 = *(unsigned __int16 *)(v6 + 60);
      *(_WORD *)(v6 + 60) = 0;
      if (v7)
      {
        uint64_t v8 = (uint64_t *)(v5 + v3);
        do
        {
          uint64_t v9 = *v8++;
          (*(void (**)(uint64_t))(*(void *)v9 + 24))(v9);
          --v7;
        }
        while (v7);
      }
      v3 += 64;
    }
  }
  uint64_t v10 = *((unsigned int *)this + 44);
  if (v10)
  {
    uint64_t v11 = 0;
    int v12 = 0;
    uint64_t v13 = 8 * v10;
    do
    {
      v12 |= GLRResource::decrementBusy(*(atomic_uint **)(*((void *)this + 21) + v11));
      (*(void (**)(void))(**(void **)(*((void *)this + 21) + v11) + 24))(*(void *)(*((void *)this + 21) + v11));
      v11 += 8;
    }
    while (v13 != v11);
  }
  else
  {
    LOBYTE(v12) = 0;
  }
  *(void *)&long long v14 = -1;
  *((void *)&v14 + 1) = -1;
  *(_OWORD *)((char *)this + 124) = v14;
  *(_OWORD *)((char *)this + 108) = v14;
  *(_OWORD *)((char *)this + 92) = v14;
  *(_OWORD *)((char *)this + 76) = v14;
  *(_OWORD *)((char *)this + 60) = v14;
  *(_OWORD *)((char *)this + 44) = v14;
  *(_OWORD *)((char *)this + 28) = v14;
  *(_OWORD *)((char *)this + 12) = v14;
  *((_DWORD *)this + 35) = 0;
  *((_DWORD *)this + 44) = 0;
  uint64_t result = v12 & 1;
  *((void *)this + 19) = 0;
  return result;
}

void GLDObject::~GLDObject(GLDObject *this)
{
  *(void *)this = &unk_26F4D6648;
  *((_DWORD *)this + 2) = -1;
}

{
  *(void *)this = &unk_26F4D6648;
  *((_DWORD *)this + 2) = -1;
}

void *GLRFunctionCache::newFunctionWithGLIR(CFArrayRef *this, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a5 == 2)
  {
    uint64_t v6 = this + 26;
  }
  else
  {
    if (a5 != 1)
    {
      LODWORD(v7) = 0;
      return (void *)(id)GLRFunctionCache::getFunction((GLRFunctionCache *)this, (int)v7);
    }
    uint64_t v6 = this + 25;
  }
  CFDictionaryRef v7 = *v6;
  if (!*v6) {
    return (void *)(id)GLRFunctionCache::getFunction((GLRFunctionCache *)this, (int)v7);
  }
  uint64_t v8 = objc_msgSend(a2, "newFunctionWithGLESIR:inputsDescription:functionType:");
  if (!v8)
  {
    LODWORD(v7) = 0;
LABEL_15:

    return (void *)(id)GLRFunctionCache::getFunction((GLRFunctionCache *)this, (int)v7);
  }
  value = 0;
  pthread_rwlock_wrlock((pthread_rwlock_t *)this);
  if (CFDictionaryGetValueIfPresent(v7, v8, (const void **)&value))
  {
    LODWORD(v7) = value;
LABEL_14:
    pthread_rwlock_unlock((pthread_rwlock_t *)this);
    goto LABEL_15;
  }
  CFIndex Count = CFArrayGetCount(this[27]);
  if (Count >= 0xFFFFFF)
  {
    LODWORD(v7) = 0;
    goto LABEL_14;
  }
  unint64_t v10 = (Count + 1);
  CFArrayAppendValue(this[27], v8);
  CFDictionarySetValue(v7, v8, (const void *)v10);
  pthread_rwlock_unlock((pthread_rwlock_t *)this);
  return v8;
}

void ___ZN13GLDContextRec20flushContextInternalEv_block_invoke_1(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  GLRResourceList::makeResourcesBusy(*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24));
  if ([a2 error])
  {
    *(unsigned char *)(v3 + 6276) = 1;
  }
  else
  {
    int v4 = *(NSObject **)(v3 + 5264);
    dispatch_group_leave(v4);
  }
}

uint64_t gldDestroyPixelFormat(uint64_t a1)
{
  if (a1) {
    GLDObject::release((atomic_uint *)(a1 - 64));
  }
  return 0;
}

uint64_t GLDContextRec::buildRenderPassDescriptor(GLDContextRec *this)
{
  id v2 = (id)*((void *)this + 231);
  if (!v2)
  {
    id v2 = objc_alloc_init(MEMORY[0x263F129A0]);
    *((void *)this + 231) = v2;
  }
  uint64_t v3 = (void *)[v2 colorAttachments];
  [*((id *)this + 231) setOpenGLModeEnabled:1];
  [*((id *)this + 231) setPointCoordYFlipEnabled:1];
  [*((id *)this + 231) setDitherEnabled:*((unsigned __int8 *)this + 5085)];
  uint64_t v4 = 0;
  *((_DWORD *)this + 1312) = 0;
  *((_DWORD *)this + 1187) = 0;
  uint64_t v5 = (char *)this + 4136;
  uint64_t v6 = (char *)this + 4632;
  CFDictionaryRef v7 = (unsigned int *)((char *)this + 4376);
  uint64_t v8 = (double *)((char *)this + 4632);
  do
  {
    uint64_t v9 = (void *)[v3 objectAtIndexedSubscript:v4];
    if (*(void *)v5)
    {
      uint64_t TextureResource = GLDTextureRec::getTextureResource(*(GLDTextureRec **)v5, 0);
      if (!TextureResource) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t TextureResource = *((void *)v5 + 10);
      if (!TextureResource)
      {
LABEL_9:
        [v9 setTexture:0];
        [v9 setResolveTexture:0];
        [v9 setStoreAction:0];
        *(void *)&v6[8 * v4 - 136] = 0;
        goto LABEL_15;
      }
    }
    [v9 setTexture:*(void *)(TextureResource + 32)];
    [v9 setResolveTexture:0];
    [v9 setLevel:*(v7 - 10)];
    [v9 setSlice:*(v7 - 20)];
    [v9 setDepthPlane:*v7];
    [v9 setStoreAction:4];
    *(void *)&v6[8 * v4 - 136] = 1;
    *((_DWORD *)this + 1187) |= 1 << v4;
    [v9 setYInvert:v6[v4 - 56]];
    if ((*((_DWORD *)this + 1151) & (1 << v4)) != 0)
    {
      objc_msgSend(v9, "setClearColor:", *(v8 - 3), *(v8 - 2), *(v8 - 1), *v8);
      uint64_t v11 = v9;
      uint64_t v12 = 2;
    }
    else
    {
      if (*((_DWORD *)this + 1149) <= 1u) {
        int v13 = *((_DWORD *)this + 1312);
      }
      else {
        int v13 = *((_DWORD *)this + 1312) | 0x100;
      }
      *((_DWORD *)this + 1312) = v13 | 0x20;
      uint64_t v11 = v9;
      uint64_t v12 = 1;
    }
    [v11 setLoadAction:v12];
LABEL_15:
    ++v4;
    v5 += 8;
    v8 += 4;
    ++v7;
  }
  while (v4 != 4);
  long long v14 = (void *)[*((id *)this + 231) depthAttachment];
  uint64_t v15 = v14;
  uint64_t v16 = *((void *)this + 535);
  if (v16)
  {
    [v14 setTexture:*(void *)(v16 + 32)];
    [v15 setLevel:*((unsigned int *)this + 1092)];
    [v15 setSlice:*((unsigned int *)this + 1082)];
    [v15 setDepthPlane:*((unsigned int *)this + 1102)];
    [v15 setStoreAction:4];
    *((void *)this + 570) = 1;
    *((_DWORD *)this + 1187) |= 0x100u;
    if (*((unsigned char *)this + 4605))
    {
      [v15 setClearDepth:*((double *)this + 592)];
      int v17 = v15;
      uint64_t v18 = 2;
    }
    else
    {
      int v17 = v15;
      uint64_t v18 = 1;
    }
    [v17 setLoadAction:v18];
  }
  else
  {
    [v14 setTexture:0];
    [v15 setStoreAction:0];
    *((void *)this + 570) = 0;
  }
  uint64_t v19 = (void *)[*((id *)this + 231) stencilAttachment];
  uint64_t v20 = v19;
  uint64_t v21 = *((void *)this + 536);
  if (v21)
  {
    [v19 setTexture:*(void *)(v21 + 32)];
    [v20 setLevel:*((unsigned int *)this + 1093)];
    [v20 setSlice:*((unsigned int *)this + 1083)];
    [v20 setDepthPlane:*((unsigned int *)this + 1103)];
    [v20 setStoreAction:4];
    *((void *)this + 571) = 1;
    *((_DWORD *)this + 1187) |= 0x200u;
    if ((*((unsigned char *)this + 4605) & 2) != 0)
    {
      [v20 setClearStencil:*((unsigned int *)this + 1186)];
      v22 = v20;
      uint64_t v23 = 2;
    }
    else
    {
      v22 = v20;
      uint64_t v23 = 1;
    }
    [v22 setLoadAction:v23];
  }
  else
  {
    [v19 setTexture:0];
    [v20 setStoreAction:0];
    *((void *)this + 571) = 0;
  }
  *((_DWORD *)this + 1150) = *((_DWORD *)this + 1149);
  uint64_t result = [*((id *)this + 231) setVisibilityResultBuffer:*(void *)(*(void *)(*((void *)this + 595) + 24) + 40)];
  if (*((_DWORD *)this + 1150) >= 2u) {
    *((void *)this + 53) |= 0x40000uLL;
  }
  *((_DWORD *)this + 1151) = 0;
  *((_DWORD *)this + 620) = 0;
  return result;
}

void gldTerminateLibrary()
{
  *(_DWORD *)g_Library = 0;
  g_Library = 0;
}

void GLRDataBufferManager::releaseDataBuffer(uint64_t a1, void *a2)
{
  _os_nospin_lock_lock();
  if (*(void *)(a1 + 256) <= 0x1FuLL && [a2 length] == *(void *)(a1 + 264))
  {
    uint64_t v3 = *(void *)(a1 + 256);
    *(void *)(a1 + 256) = v3 + 1;
    *(void *)(a1 + 8 * v3) = a2;
    _os_nospin_lock_unlock();
  }
  else
  {
    _os_nospin_lock_unlock();
    if (a2)
    {
    }
  }
}

uint64_t GLRResourceList::makeResourcesBusy(uint64_t this)
{
  uint64_t v1 = this;
  uint64_t v2 = *(unsigned int *)(this + 140);
  if (v2)
  {
    uint64_t v3 = 0;
    for (uint64_t i = 0; i != v2; ++i)
    {
      uint64_t v5 = *(void *)(v1 + 160);
      uint64_t v6 = v5 + (i << 6);
      uint64_t v7 = *(unsigned __int16 *)(v6 + 60);
      if (*(_WORD *)(v6 + 60))
      {
        uint64_t v8 = (atomic_uint **)(v5 + v3);
        do
        {
          uint64_t v9 = *v8++;
          this = GLRResource::decrementUsage(v9);
          --v7;
        }
        while (v7);
      }
      v3 += 64;
    }
  }
  uint64_t v10 = *(unsigned int *)(v1 + 176);
  if (v10)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 8 * v10;
    do
    {
      GLRResource::incrementBusy(*(void *)(*(void *)(v1 + 168) + v11));
      this = GLRResource::decrementUsage(*(atomic_uint **)(*(void *)(v1 + 168) + v11));
      v11 += 8;
    }
    while (v12 != v11);
  }
  return this;
}

void gldUnbindFramebuffer(GLDContextRec *this, uint64_t a2)
{
  if (*((void *)this + 50) == a2)
  {
    if (*((_DWORD *)this + 1151)) {
      GLDContextRec::beginRenderPass(this);
    }
    *((void *)this + 50) = 0;
  }
}

uint64_t GLDContextRec::updateRenderBlendState(uint64_t this)
{
  uint64_t v1 = this;
  uint64_t v2 = 0;
  uint64_t v3 = 0;
  char v4 = 0;
  uint64_t v5 = (unsigned __int16 *)(*(void *)(this + 104) + 12746);
  int v6 = *(unsigned __int8 *)(*(void *)(this + 104) + 12848);
  uint64_t v7 = 4416;
  do
  {
    uint64_t v8 = v1 + v2;
    uint64_t v9 = v1 + 4 * v3;
    if (*(void *)(v1 + v7)) {
      BOOL v10 = ((1 << v3) & v6) == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10 || ((*(_DWORD *)(v1 + 2624) | *(_DWORD *)(v1 + 2620)) & (1 << v3)) != 0)
    {
      if (!*(unsigned char *)(v8 + 2508)) {
        goto LABEL_10;
      }
      *(unsigned char *)(v8 + 2508) = 0;
      *(void *)(v8 + 2496) = 65537;
      *(_DWORD *)(v1 + v2 + 2504) = -2147057658;
      int v11 = *(_DWORD *)(v9 + 2152) & 0xFF800000 | 0x880;
      goto LABEL_9;
    }
    *(void *)(v1 + 424) |= 2uLL;
    if (!*(unsigned char *)(v1 + v2 + 2508))
    {
      char v4 = 1;
      *(unsigned char *)(v1 + v2 + 2508) = 1;
      *(_DWORD *)(v9 + 2152) |= 1u;
    }
    int v12 = *(v5 - 5);
    if (*(unsigned __int16 *)(v8 + 2496) != v12)
    {
      *(_WORD *)(v8 + 2496) = v12;
      *(_DWORD *)(v9 + 2152) = *(_DWORD *)(v9 + 2152) & 0xFFFFF87F | (getMTLBlendFactor(v12) << 7);
      char v4 = 1;
    }
    uint64_t v13 = v1 + v2;
    int v14 = *(v5 - 3);
    if (*(unsigned __int16 *)(v1 + v2 + 2498) != v14)
    {
      *(_WORD *)(v13 + 2498) = v14;
      *(_DWORD *)(v9 + 2152) = *(_DWORD *)(v9 + 2152) & 0xFFFF87FF | (getMTLBlendFactor(v14) << 11);
      char v4 = 1;
    }
    int v15 = *(v5 - 4);
    if (*(unsigned __int16 *)(v13 + 2500) != v15)
    {
      *(_WORD *)(v13 + 2500) = v15;
      *(_DWORD *)(v9 + 2152) = *(_DWORD *)(v9 + 2152) & 0xFFF87FFF | (getMTLBlendFactor(v15) << 15);
      char v4 = 1;
    }
    uint64_t v16 = v1 + v2;
    int v17 = *(v5 - 2);
    if (*(unsigned __int16 *)(v1 + v2 + 2502) != v17)
    {
      *(_WORD *)(v16 + 2502) = v17;
      *(_DWORD *)(v9 + 2152) = *(_DWORD *)(v9 + 2152) & 0xFF87FFFF | (getMTLBlendFactor(v17) << 19);
      char v4 = 1;
    }
    int v18 = *(v5 - 1);
    if (*(unsigned __int16 *)(v16 + 2504) != v18)
    {
      *(_WORD *)(v16 + 2504) = v18;
      *(_DWORD *)(v9 + 2152) = *(_DWORD *)(v9 + 2152) & 0xFFFFFFF1 | (2 * getMTLBlendOperation(v18));
      char v4 = 1;
    }
    this = *v5;
    if (*(unsigned __int16 *)(v1 + v2 + 2506) != this)
    {
      *(_WORD *)(v1 + v2 + 2506) = this;
      this = getMTLBlendOperation(this);
      int v11 = *(_DWORD *)(v9 + 2152) & 0xFFFFFF8F | (16 * this);
LABEL_9:
      *(_DWORD *)(v9 + 2152) = v11;
      char v4 = 1;
    }
LABEL_10:
    ++v3;
    v2 += 14;
    v5 += 6;
    v7 += 8;
  }
  while (v2 != 56);
  if (v4) {
    *(_DWORD *)(v1 + 2472) |= 8u;
  }
  return this;
}

uint64_t GLRResourceList::releaseAllResources(uint64_t this)
{
  uint64_t v1 = this;
  uint64_t v2 = *(unsigned int *)(this + 140);
  if (v2)
  {
    uint64_t v3 = 0;
    for (uint64_t i = 0; i != v2; ++i)
    {
      uint64_t v5 = *(void *)(v1 + 160);
      uint64_t v6 = v5 + (i << 6);
      uint64_t v7 = *(unsigned __int16 *)(v6 + 60);
      *(_WORD *)(v6 + 60) = 0;
      if (v7)
      {
        uint64_t v8 = (atomic_uint **)(v5 + v3);
        do
        {
          GLRResource::decrementUsage(*v8);
          uint64_t v9 = *v8++;
          this = (*(uint64_t (**)(atomic_uint *))(*(void *)v9 + 24))(v9);
          --v7;
        }
        while (v7);
      }
      v3 += 64;
    }
  }
  uint64_t v10 = *(unsigned int *)(v1 + 176);
  if (v10)
  {
    uint64_t v11 = 0;
    uint64_t v12 = 8 * v10;
    do
    {
      GLRResource::decrementUsage(*(atomic_uint **)(*(void *)(v1 + 168) + v11));
      this = (*(uint64_t (**)(void))(**(void **)(*(void *)(v1 + 168) + v11) + 24))(*(void *)(*(void *)(v1 + 168) + v11));
      v11 += 8;
    }
    while (v12 != v11);
  }
  return this;
}

uint64_t GLDContextRec::dealloc(GLDContextRec *this)
{
  GLDContextRec::flushContext((id *)this);
  GLDContextRec::waitContext((dispatch_group_t *)this);
  dispatch_release(*((dispatch_object_t *)this + 658));
  GLRDataBufferManager::dealloc((id *)this + 659);
  GLRDataBufferManager::dealloc((id *)this + 704);

  *((void *)this + 10) = 0;
  *((void *)this + 627) = 0;

  uint64_t v2 = (const void *)*((void *)this + 274);
  if (v2) {
    CFRelease(v2);
  }
  GLDObject::release(*((atomic_uint **)this + 12));
  glgDestroyProcessor();
  GLDObject::release(*((atomic_uint **)this + 594));
  *((void *)this + 594) = 0;
  GLDObject::release(*((atomic_uint **)this + 595));
  *((void *)this + 595) = 0;
  GLDVertexArrayRec::updateSharedState((GLDContextRec *)((char *)this + 2336), v3);
  GLDVertexArrayRec::updateSharedState((GLDContextRec *)((char *)this + 2064), v4);

  for (uint64_t i = 517; i != 527; ++i)
  {
    uint64_t v6 = (atomic_uint *)*((void *)this + i);
    if (v6) {
      GLDObject::release(v6);
    }
  }
  do
  {
    uint64_t v7 = *((void *)this + i);
    if (v7) {
      (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
    }
    ++i;
  }
  while (i != 537);
  for (uint64_t j = 3576; j != 3832; j += 8)
  {
    uint64_t v9 = *(void *)((char *)this + j);
    if (v9) {
      (*(void (**)(uint64_t))(*(void *)v9 + 24))(v9);
    }
  }
  for (uint64_t k = 2672; k != 2800; k += 8)
  {
    uint64_t v11 = *(void *)((char *)this + k);
    if (v11) {
      (*(void (**)(uint64_t))(*(void *)v11 + 24))(v11);
    }
  }
  for (uint64_t m = 2872; m != 2968; m += 8)
  {
    uint64_t v13 = *(void *)((char *)this + m);
    if (v13) {
      (*(void (**)(uint64_t))(*(void *)v13 + 24))(v13);
    }
  }
  do
  {
    uint64_t v14 = *(void *)((char *)this + m);
    if (v14) {
      (*(void (**)(uint64_t))(*(void *)v14 + 24))(v14);
    }
    m += 8;
  }
  while (m != 3064);
  uint64_t v15 = *((void *)this + 358);
  if (v15) {
    (*(void (**)(uint64_t))(*(void *)v15 + 24))(v15);
  }
  (*(void (**)(void))(**((void **)this + 9) + 24))(*((void *)this + 9));
  GLDObject::release(*((atomic_uint **)this + 11));
  *((void *)this + 11) = 0;
  uint64_t v16 = *((void *)this + 657);
  if (v16)
  {
    dispatch_group_wait(v16, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*((dispatch_object_t *)this + 657));
  }
  if (*((void *)this + 781))
  {
    unint64_t v17 = 0;
    int v18 = (char *)this + 5992;
    do
    {
      GLDObject::release(*(atomic_uint **)&v18[8 * v17]);
      *(void *)&v18[8 * v17++] = 0;
    }
    while (v17 < *((void *)this + 781));
  }
  uint64_t v19 = (void *)*((void *)this + 277);
  if (v19) {
    free(v19);
  }
  uint64_t v20 = (void *)*((void *)this + 278);
  if (v20) {
    free(v20);
  }

  return GLDObject::dealloc((uint64_t)this);
}

void GLDTextureRec::finishImageQueue(GLDTextureRec *this)
{
  uint64_t v2 = *((void *)this + 17);
  if (v2)
  {
    dispatch_sync(v2, &__block_literal_global_0);
    dispatch_release(*((dispatch_object_t *)this + 17));
    *((void *)this + 17) = 0;
  }
}

CFMutableDictionaryRef GLRRenderPipelineCache::init(GLRRenderPipelineCache *this)
{
  CFMutableDictionaryRef result = CFDictionaryCreateMutable(0, 128, &_renderPipelineKeyCallbacks, MEMORY[0x263EFFF90]);
  *(void *)this = result;
  return result;
}

uint64_t GLDDeviceRec::getDepthStencilStateFromKey(GLDDeviceRec *this, const GLRDepthStencilKey *a2)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3052000000;
  uint64_t v14 = __Block_byref_object_copy_;
  uint64_t v15 = __Block_byref_object_dispose_;
  uint64_t v16 = 0;
  context[0] = (char *)this + 464;
  context[1] = a2;
  context[2] = &v16;
  dispatch_sync_f(*((dispatch_queue_t *)this + 56), context, (dispatch_function_t)_getDepthStencilState);
  uint64_t v4 = v12[5];
  if (v4) {
    goto LABEL_4;
  }
  id v5 = GLRDepthStencilKey::copyDescriptor(a2);
  uint64_t v6 = [*((id *)this + 3) newDepthStencilStateWithDescriptor:v5];
  v12[5] = v6;
  if (v6)
  {
    uint64_t v7 = *((void *)this + 56);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = ___ZN12GLDDeviceRec27getDepthStencilStateFromKeyEPK18GLRDepthStencilKey_block_invoke;
    v9[3] = &unk_2650D0BD0;
    v9[5] = this;
    v9[6] = a2;
    v9[4] = &v11;
    dispatch_barrier_sync(v7, v9);

    uint64_t v4 = v12[5];
LABEL_4:
    _Block_object_dispose(&v11, 8);
    return v4;
  }
  uint64_t result = MTLReleaseAssertionFailure();
  __break(1u);
  return result;
}

void sub_2406DFD04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _depthStencilKeyRelease(const __CFAllocator *a1, const void *a2)
{
  if (a2) {
    JUMPOUT(0x2455F5620);
  }
}

unint64_t _renderPipelineKeyHash(char *a1)
{
  uint64_t v1 = 0;
  unint64_t v2 = 0;
  unint64_t v3 = 0x61C8864E7A143579;
  unint64_t v4 = 0x60EA27EEADC0B5D6;
  unint64_t v5 = 0xC2B2AE3D27D4EB4FLL;
  do
  {
    uint64_t v6 = __ROR8__(v4 - 0x3D4D51C2D82B14B1 * *(void *)&a1[v1], 33);
    unint64_t v4 = 0x9E3779B185EBCA87 * v6;
    uint64_t v7 = __ROR8__(v5 - 0x3D4D51C2D82B14B1 * *(void *)&a1[v1 + 8], 33);
    unint64_t v5 = 0x9E3779B185EBCA87 * v7;
    uint64_t v8 = __ROR8__(v2 - 0x3D4D51C2D82B14B1 * *(void *)&a1[v1 + 16], 33);
    unint64_t v2 = 0x9E3779B185EBCA87 * v8;
    uint64_t v9 = __ROR8__(v3 - 0x3D4D51C2D82B14B1 * *(void *)&a1[v1 + 24], 33);
    unint64_t v3 = 0x9E3779B185EBCA87 * v9;
    v1 += 32;
  }
  while (v1 != 128);
  unint64_t v10 = (0x9E3779B185EBCA87
       * ((0x9E3779B185EBCA87
         * ((0x9E3779B185EBCA87
           * ((((0x3C6EF3630BD7950ELL * v6) | (v4 >> 63))
             + 0x1BBCD8C2F5E54380 * v7
             + (v5 >> 57)
             + 0x779B185EBCA87000 * v8
             + (v2 >> 52)
             - 0x1939E850D5E40000 * v9
             + (v3 >> 46)) ^ (0x9E3779B185EBCA87 * ((0x87BCB65480000000 * v6) | ((0xDEF35B010F796CA9 * v6) >> 33))))
           - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                    * ((0x87BCB65480000000 * v7) | ((0xDEF35B010F796CA9 * v7) >> 33))))
         - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                  * ((0x87BCB65480000000 * v8) | ((0xDEF35B010F796CA9 * v8) >> 33))))
       - 0x7A1435883D4D519DLL) ^ (0x9E3779B185EBCA87
                                * ((0x87BCB65480000000 * v9) | ((0xDEF35B010F796CA9 * v9) >> 33)));
  unint64_t v11 = 0xC2B2AE3D27D4EB4FLL
      * ((0x9E3779B185EBCA87 * v10 - 0x7A1435883D4D511DLL) ^ ((0x9E3779B185EBCA87 * v10 - 0x7A1435883D4D511DLL) >> 33));
  return (0x165667B19E3779F9 * (v11 ^ (v11 >> 29))) ^ ((0x165667B19E3779F9 * (v11 ^ (v11 >> 29))) >> 32);
}

uint64_t GLDObject::retain(uint64_t this)
{
  return this;
}

__n128 gldPopulateContextDispatch(uint64_t a1, uint64_t a2)
{
  long long v2 = *(_OWORD *)&off_26F4D6DB0;
  *(_OWORD *)(a2 + 160) = xmmword_26F4D6DA0;
  *(_OWORD *)(a2 + 176) = v2;
  *(void *)(a2 + 192) = off_26F4D6DC0;
  long long v3 = *(_OWORD *)&off_26F4D6D70;
  *(_OWORD *)(a2 + 96) = xmmword_26F4D6D60;
  *(_OWORD *)(a2 + 112) = v3;
  long long v4 = *(_OWORD *)&off_26F4D6D90;
  *(_OWORD *)(a2 + 128) = xmmword_26F4D6D80;
  *(_OWORD *)(a2 + 144) = v4;
  long long v5 = *(_OWORD *)&off_26F4D6D30;
  *(_OWORD *)(a2 + 32) = xmmword_26F4D6D20;
  *(_OWORD *)(a2 + 48) = v5;
  long long v6 = *(_OWORD *)&off_26F4D6D50;
  *(_OWORD *)(a2 + 64) = xmmword_26F4D6D40;
  *(_OWORD *)(a2 + 80) = v6;
  __n128 result = *(__n128 *)&off_26F4D6D10;
  *(_OWORD *)a2 = s_renderDispatchTable;
  *(__n128 *)(a2 + 16) = result;
  return result;
}

id GLRDepthStencilKey::copyDescriptor(GLRDepthStencilKey *this)
{
  id v2 = objc_alloc_init(MEMORY[0x263F128A0]);
  long long v3 = (void *)[v2 frontFaceStencil];
  long long v4 = (void *)[v2 backFaceStencil];
  [v3 setReadMask:*(unsigned __int8 *)this];
  [v3 setWriteMask:*((unsigned __int8 *)this + 1)];
  [v3 setStencilCompareFunction:*((_DWORD *)this + 1) & 7];
  [v3 setStencilFailureOperation:(*(void *)this >> 35) & 7];
  [v3 setDepthFailureOperation:(*(void *)this >> 38) & 7];
  [v3 setDepthStencilPassOperation:(*(void *)this >> 41) & 7];
  [v4 setReadMask:*((unsigned __int8 *)this + 2)];
  [v4 setWriteMask:*((unsigned __int8 *)this + 3)];
  [v4 setStencilCompareFunction:(*(void *)this >> 44) & 7];
  [v4 setStencilFailureOperation:(*(void *)this >> 47) & 7];
  [v4 setDepthFailureOperation:(*(void *)this >> 50) & 7];
  [v4 setDepthStencilPassOperation:(*(void *)this >> 53) & 7];
  [v2 setDepthWriteEnabled:(*(void *)this >> 59) & 1];
  [v2 setDepthCompareFunction:*((unsigned char *)this + 7) & 7];
  [v2 setLabel:*MEMORY[0x263F12C98]];
  return v2;
}

double GLDContextRec::setRenderPipeline(GLDContextRec *this)
{
  GLDContextRec::buildPipelineStateDescriptor(this);
  Value = CFDictionaryGetValue(*((CFDictionaryRef *)this + 274), (char *)this + 2064);
  if (!Value)
  {
    RenderPipelineStateFromKey = (void *)GLDDeviceRec::getRenderPipelineStateFromKey(*((GLDDeviceRec **)this + 12), (GLDContextRec *)((char *)this + 2064));
    if (!RenderPipelineStateFromKey)
    {
      double result = 0.0;
      *(_OWORD *)((char *)this + 2200) = 0u;
      return result;
    }
    Value = RenderPipelineStateFromKey;
    CFDictionarySetValue(*((CFMutableDictionaryRef *)this + 274), (char *)this + 2064, RenderPipelineStateFromKey);
  }
  *((void *)this + 275) = Value[1];
  *((void *)this + 276) = Value[2];
  objc_msgSend(*((id *)this + 2), "setRenderPipelineState:");
  uint64_t v5 = *((void *)this + 276);
  if ((v5 & 0x40) == 0)
  {
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
LABEL_9:
    *((void *)this + 53) |= 0x800000uLL;
    if ((v5 & 0x10) == 0) {
      return result;
    }
    goto LABEL_10;
  }
  *((_DWORD *)this + 1263) |= 0x20000u;
  if ((v5 & 8) != 0) {
    goto LABEL_9;
  }
LABEL_6:
  if ((v5 & 0x10) != 0) {
LABEL_10:
  }
    *((void *)this + 53) |= 0x1000000uLL;
  return result;
}

void _renderPipelineKeyRelease(const __CFAllocator *a1, void *a2)
{
}

void GLRBufferResource::GLRBufferResource(GLRBufferResource *this)
{
  GLDObject::GLDObject(this);
  void *v1 = &unk_26F4D67C8;
}

void gldClearFramebufferData(GLDContextRec *this, unsigned int a2, uint32x4_t *a3)
{
  if (*((void *)this + 2) && *((_DWORD *)this + 620)) {
    GLDContextRec::endRenderPass(this);
  }
  if (!*((unsigned char *)this + 5083))
  {
    uint64_t v6 = *((void *)this + 50);
    uint64_t v7 = **(void **)(v6 + 40);
    if ((!v7 || !*(void *)(v7 + 184)) && !*((void *)this + 2))
    {
      uint64_t v8 = *((void *)this + 13);
      if (!*(unsigned char *)(v8 + 13284)
        || !*(_DWORD *)(v8 + 13268)
        && !*(_DWORD *)(v8 + 13272)
        && (uint64_t v9 = *(void *)(v6 + 32), *(_DWORD *)(v8 + 13276) == *(unsigned __int16 *)(v9 + 178))
        && *(_DWORD *)(v8 + 13280) == *(unsigned __int16 *)(v9 + 180))
      {
        if (!*((void *)this + 5)) {
          GLDContextRec::getCommandBuffer(this);
        }
        GLDContextRec::addRenderPassResources(this);
        if ((a2 & 0x100) != 0)
        {
          *((_DWORD *)this + 1151) |= 0x100u;
          *((_DWORD *)this + 1258) |= 0x100u;
          if (a3[1].i32[2])
          {
            LODWORD(v10) = a3[1].i32[0];
            double v10 = (double)*(unint64_t *)&v10;
          }
          else
          {
            double v10 = *(float *)a3[1].i32;
          }
          *((double *)this + 592) = v10;
          a2 &= ~0x100u;
        }
        if ((a2 & 0x200) == 0) {
          goto LABEL_24;
        }
        if (*(unsigned __int8 *)(*((void *)this + 13) + 13052) == 0xFF)
        {
          *((_DWORD *)this + 1151) |= 0x200u;
          *((_DWORD *)this + 1258) |= 0x200u;
          *((_DWORD *)this + 1186) = a3[1].i32[1];
          a2 &= ~0x200u;
LABEL_24:
          if (!(_BYTE)a2) {
            return;
          }
          uint64_t v11 = 0;
          uint64_t v12 = (unsigned char *)(*((void *)this + 13) + 13064);
          for (uint64_t i = (double *)((char *)this + 4632); ; i += 4)
          {
            int v14 = 1 << v11;
            if (((1 << v11) & a2) != 0) {
              break;
            }
LABEL_37:
            if (++v11 == 4) {
              return;
            }
          }
          if ((v14 & (v12[1] & *v12 & v12[2] & v12[3])) == 0) {
            goto LABEL_39;
          }
          *((_DWORD *)this + 1151) |= v14;
          *((_DWORD *)this + 1258) |= v14;
          if ((*((_DWORD *)this + 654) & v14) != 0 || (*((_DWORD *)this + 656) & v14) != 0)
          {
            if (a3[1].i32[2])
            {
              LODWORD(v10) = a3->i32[0];
              double v15 = (double)*(unint64_t *)&v10;
              *(i - 3) = v15;
              LODWORD(v15) = a3->i32[1];
              double v16 = (double)*(unint64_t *)&v15;
              *(i - 2) = v16;
              LODWORD(v16) = a3->i32[2];
              double v17 = (double)*(unint64_t *)&v16;
              *(i - 1) = v17;
              LODWORD(v17) = a3->i32[3];
              double v10 = (double)*(unint64_t *)&v17;
LABEL_36:
              *uint64_t i = v10;
              a2 &= ~v14;
              goto LABEL_37;
            }
          }
          else
          {
            if ((*((_DWORD *)this + 655) & v14) == 0)
            {
              int v18 = (GLRQueryResultBuffer *)MTLReleaseAssertionFailure();
              GLRQueryResultBuffer::GLRQueryResultBuffer(v18);
              return;
            }
            if (a3[1].i32[2])
            {
              *(i - 3) = (double)a3->i32[0];
              *(i - 2) = (double)a3->i32[1];
              *(i - 1) = (double)a3->i32[2];
              double v10 = (double)a3->i32[3];
              goto LABEL_36;
            }
          }
          *(i - 3) = *(float *)a3->i32;
          *(i - 2) = *(float *)&a3->i32[1];
          *(i - 1) = *(float *)&a3->i32[2];
          double v10 = *(float *)&a3->i32[3];
          goto LABEL_36;
        }
      }
    }
LABEL_39:
    GLDContextRec::clearBuffers((int8x8_t *)this, a2, a3);
  }
}

void GLRQueryResultBuffer::GLRQueryResultBuffer(GLRQueryResultBuffer *this)
{
  GLDObject::GLDObject(this);
  void *v1 = &unk_26F4D6398;
}

void GLRQueryResultBuffer::~GLRQueryResultBuffer(GLRQueryResultBuffer *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t GLRQueryResultBuffer::initWithShareGroup(uint64_t a1, GLDObject *this)
{
  *(void *)(a1 + 16) = this;
  GLDObject::retain((uint64_t)this);
  *(_DWORD *)(a1 + 52) = 2048;
  *(_DWORD *)(a1 + 24) = 0;
  long long v3 = malloc_type_malloc(0x100uLL, 0x7B340462uLL);
  *(void *)(a1 + 32) = v3;
  bzero(v3, (unint64_t)*(unsigned int *)(a1 + 52) >> 3);
  long long v4 = malloc_type_malloc(8 * *(unsigned int *)(a1 + 52), 0x100004000313F17uLL);
  *(void *)(a1 + 40) = v4;
  bzero(v4, 8 * *(unsigned int *)(a1 + 52));
  return 1;
}

uint64_t GLRQueryResultBuffer::dealloc(GLRQueryResultBuffer *this)
{
  free(*((void **)this + 4));
  free(*((void **)this + 5));
  GLDObject::release(*((atomic_uint **)this + 2));

  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLRQueryResultBuffer::allocateQueryIndex(GLRQueryResultBuffer *this, unsigned int *a2)
{
  _os_nospin_lock_lock();
  unint64_t v5 = *((unsigned int *)this + 12);
  unsigned int v4 = *((_DWORD *)this + 13);
  if (v5 == v4)
  {
    *((_DWORD *)this + 13) = 2 * v5;
    uint64_t v6 = (char *)malloc_type_realloc(*((void **)this + 4), (v5 >> 2) & 0x1FFFFFFF, 0xFB525CB7uLL);
    *((void *)this + 4) = v6;
    bzero(&v6[(v5 >> 3) & 0x1FFFFFFC], (*((unsigned int *)this + 13) - v5) >> 3);
    unsigned int v4 = *((_DWORD *)this + 13);
  }
  if (v4 > 0x1F)
  {
    uint64_t v9 = 0;
    uint64_t v7 = v4 >> 5;
    uint64_t v8 = *((void *)this + 4);
    while (*(_DWORD *)(v8 + 4 * v9) == -1)
    {
      if (v7 == ++v9) {
        goto LABEL_10;
      }
    }
    LODWORD(v7) = v9;
  }
  else
  {
    LODWORD(v7) = 0;
    uint64_t v8 = *((void *)this + 4);
  }
LABEL_10:
  int v10 = *(_DWORD *)(v8 + 4 * v7);
  unsigned int v11 = __clz(__rbit32(~v10));
  *(_DWORD *)(v8 + 4 * v7) = (1 << v11) | v10;
  *a2 = v11 + 32 * v7;

  return _os_nospin_lock_unlock();
}

uint64_t GLRQueryResultBuffer::processResults(GLRQueryResultBuffer *this, uint64_t *a2, unsigned int *a3, int a4, unsigned int a5)
{
  _os_nospin_lock_lock();
  if (a5)
  {
    uint64_t v10 = *((void *)this + 5);
    uint64_t v11 = a5;
    do
    {
      uint64_t v12 = a3[a4];
      *(void *)(v10 + 8 * v12) += a2[a4++];
      --v11;
    }
    while (v11);
  }

  return _os_nospin_lock_unlock();
}

void GLDQueryStagingBuffer::~GLDQueryStagingBuffer(GLDQueryStagingBuffer *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t GLDQueryStagingBuffer::initWithShareGroup(GLDQueryStagingBuffer *this, GLDShareGroupRec *a2)
{
  *((void *)this + 2) = a2;
  GLDObject::retain((uint64_t)a2);
  long long v3 = (void *)[*(id *)(*((void *)this + 2) + 232) newBufferWithLength:0x4000 options:0];
  [v3 setLabel:*MEMORY[0x263F12C98]];
  *((void *)this + 6) = [v3 contents];
  *((_DWORD *)this + 10) = 2048;
  GLDObject::operator new((GLDObject *)0x30);
  unint64_t v5 = v4;
  GLRBufferResource::GLRBufferResource(v4);
  *((void *)this + 3) = v5;
  GLRBufferResource::initWithMetalBuffer(v5, v3, 0x4000);

  *((void *)this + 7) = malloc_type_malloc(0x2000uLL, 0x100004052888210uLL);
  return 1;
}

void sub_2406E0834(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL GLDQueryStagingBuffer::allocateResultOffset(GLDQueryStagingBuffer *this, unsigned int *a2, int a3)
{
  int v3 = *((_DWORD *)this + 9);
  int v4 = *((_DWORD *)this + 10);
  if (v3 != v4)
  {
    *a2 = 8 * v3;
    uint64_t v5 = *((unsigned int *)this + 9);
    uint64_t v6 = *((void *)this + 7);
    *(void *)(*((void *)this + 6) + 8 * v5) = 0;
    *(_DWORD *)(v6 + 4 * v5) = a3;
    ++*((_DWORD *)this + 9);
  }
  return v3 != v4;
}

uint64_t GLDQueryStagingBuffer::deferProcessResults(uint64_t this, GLDContextRec *a2, GLRQueryResultBuffer *a3)
{
  if (*(_DWORD *)(this + 36) > *(_DWORD *)(this + 32)) {
    GLDContextRec::addCompletionBlock();
  }
  return this;
}

uint64_t ___ZN21GLDQueryStagingBuffer19deferProcessResultsEP13GLDContextRecP20GLRQueryResultBuffery_block_invoke(uint64_t a1)
{
  return GLRQueryResultBuffer::processResults(*(GLRQueryResultBuffer **)(a1 + 40), *(uint64_t **)(*(void *)(a1 + 32) + 48), *(unsigned int **)(*(void *)(a1 + 32) + 56), *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 60));
}

void GLDQueryRec::~GLDQueryRec(GLDQueryRec *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t GLDQueryRec::dealloc(GLDQueryRec *this)
{
  uint64_t v2 = *((void *)this + 3);
  unint64_t v3 = *((unsigned int *)this + 10);
  _os_nospin_lock_lock();
  *(_DWORD *)(*(void *)(v2 + 32) + ((v3 >> 3) & 0x1FFFFFFC)) &= ~(1 << v3);
  _os_nospin_lock_unlock();
  GLDObject::release(*((atomic_uint **)this + 3));

  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLDQueryRec::setCounter(GLDQueryRec *this, uint64_t a2)
{
  uint64_t v3 = *((void *)this + 3);
  uint64_t v4 = *((unsigned int *)this + 10);
  _os_nospin_lock_lock();
  *(void *)(*(void *)(v3 + 40) + 8 * v4) = a2;

  return _os_nospin_lock_unlock();
}

uint64_t GLDQueryRec::getCounter(GLDQueryRec *this)
{
  GLDContextRec::waitQueryStamp(*((void *)this + 2), *((void *)this + 6));
  uint64_t v2 = *((void *)this + 3);
  uint64_t v3 = *((unsigned int *)this + 10);
  _os_nospin_lock_lock();
  uint64_t v4 = *(void *)(*(void *)(v2 + 40) + 8 * v3);
  _os_nospin_lock_unlock();
  return v4;
}

intptr_t GLDContextRec::waitQueryStamp(intptr_t this, unint64_t a2)
{
  intptr_t v3 = this;
  if (*(void *)(this + 4776) < a2) {
    this = GLDContextRec::flushContext((id *)this);
  }
  if (*(void *)(v3 + 4784) < a2)
  {
    pthread_mutex_lock((pthread_mutex_t *)(v3 + 4888));
    while (*(void *)(v3 + 4784) < a2)
      pthread_cond_wait((pthread_cond_t *)(v3 + 4952), (pthread_mutex_t *)(v3 + 4888));
    return pthread_mutex_unlock((pthread_mutex_t *)(v3 + 4888));
  }
  return this;
}

uint64_t GLDQueryRec::getQueryInfo(GLDQueryRec *this, unsigned int a2, uint64_t *a3)
{
  GLDContextRec::waitQueryStamp(*((void *)this + 2), *((void *)this + 6));
  uint64_t v5 = *((void *)this + 3);
  uint64_t v6 = *((unsigned int *)this + 10);
  _os_nospin_lock_lock();
  uint64_t v7 = *(void *)(*(void *)(v5 + 40) + 8 * v6);
  _os_nospin_lock_unlock();
  *a3 = v7;
  return 0;
}

uint64_t GLDContextRec::signalQueryStamp(GLDContextRec *this, uint64_t a2)
{
  uint64_t v4 = (pthread_mutex_t *)((char *)this + 4888);
  pthread_mutex_lock((pthread_mutex_t *)((char *)this + 4888));
  *((void *)this + 598) = a2;
  pthread_cond_broadcast((pthread_cond_t *)((char *)this + 4952));

  return pthread_mutex_unlock(v4);
}

atomic_uint *GLDContextRec::releaseQueryStagingBuffer(GLDContextRec *this, atomic_uint *a2)
{
  _os_nospin_lock_lock();
  unint64_t v4 = *((void *)this + 781);
  if (v4 > 0x1F)
  {
    double result = (atomic_uint *)_os_nospin_lock_unlock();
    if (a2)
    {
      return GLDObject::release(a2);
    }
  }
  else
  {
    *((void *)a2 + 4) = 0;
    *((void *)this + 781) = v4 + 1;
    *((void *)this + v4 + 749) = a2;
    return (atomic_uint *)_os_nospin_lock_unlock();
  }
  return result;
}

GLDQueryStagingBuffer *GLDContextRec::allocQueryStagingBuffer(GLDContextRec *this)
{
  _os_nospin_lock_lock();
  uint64_t v2 = *((void *)this + 781);
  if (!v2)
  {
    _os_nospin_lock_unlock();
LABEL_5:
    GLDObject::operator new((GLDObject *)0x40);
    unint64_t v4 = v5;
    GLDObject::GLDObject(v5);
    *(void *)unint64_t v4 = &unk_26F4D63D0;
    GLDQueryStagingBuffer::initWithShareGroup(v4, *((GLDShareGroupRec **)this + 11));
    return v4;
  }
  uint64_t v3 = v2 - 1;
  *((void *)this + 781) = v3;
  unint64_t v4 = (GLDQueryStagingBuffer *)*((void *)this + v3 + 749);
  _os_nospin_lock_unlock();
  if (!v4) {
    goto LABEL_5;
  }
  return v4;
}

void sub_2406E0D60(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLDContextRec::endQuery(uint64_t this, GLDQueryRec *a2, int a3)
{
  if (a3 == 6)
  {
    *(void *)(this + 3368) = 0;
  }
  else if (a3)
  {
    unint64_t v4 = (GLDContextRec *)MTLReleaseAssertionFailure();
    return GLDContextRec::beginQuery(v4, v5, v6);
  }
  else
  {
    *((_DWORD *)a2 + 8) = 0;
    uint64_t v3 = *(void **)(this + 16);
    return [v3 setVisibilityResultMode:0 offset:0];
  }
  return this;
}

void *GLDContextRec::beginQuery(GLDContextRec *this, GLDQueryRec *a2, int a3)
{
  if (a3 == 6)
  {
    *((_DWORD *)a2 + 8) = 6;
    uint64_t v8 = (GLDContextRec *)((char *)this + 3352);
    return (void *)GLDTransformFeedbackMachine::beginQuery(v8, a2);
  }
  else if (a3)
  {
    uint64_t v12 = (GLDContextRec *)MTLReleaseAssertionFailure();
    return (void *)GLDContextRec::loadCurrentQueries(v12);
  }
  else
  {
    *((_DWORD *)a2 + 8) = 0;
    uint64_t v5 = *((void *)this + 595);
    uint64_t v6 = *(unsigned int *)(v5 + 36);
    if (v6 == *(_DWORD *)(v5 + 40))
    {
      if (*((_DWORD *)this + 1151)) {
        GLDContextRec::beginRenderPass(this);
      }
      if (*((void *)this + 2)) {
        GLDContextRec::endRenderPass(this);
      }
      uint64_t v7 = 0;
    }
    else
    {
      int v10 = *((_DWORD *)a2 + 10);
      uint64_t v11 = *(void *)(v5 + 56);
      *(void *)(*(void *)(v5 + 48) + 8 * v6) = 0;
      uint64_t v7 = (8 * v6);
      *(_DWORD *)(v11 + 4 * v6) = v10;
      ++*(_DWORD *)(v5 + 36);
    }
    double result = (void *)*((void *)this + 2);
    if (result)
    {
      *((void *)a2 + 6) = *((void *)this + 596);
      *((unsigned char *)this + 5088) = 1;
      double result = (void *)[result setVisibilityResultMode:1 offset:v7];
      *((void *)this + 53) |= 0x1000uLL;
    }
  }
  return result;
}

GLDContextRec *GLDContextRec::loadCurrentQueries(GLDContextRec *this)
{
  uint64_t v1 = this;
  uint64_t v2 = 0;
  uint64_t v3 = (void *)((char *)this + 4792);
  do
  {
    uint64_t v4 = *((void *)v1 + 14) + 8 * v2;
    uint64_t v5 = *(int **)(v4 + 432);
    uint64_t v6 = (int *)v3[v2];
    if (v5 != v6)
    {
      if (v5)
      {
        uint64_t v7 = v5[9];
        if (v7 != 12)
        {
          this = (GLDContextRec *)GLDContextRec::endQuery((uint64_t)v1, *(GLDQueryRec **)(v4 + 432), v5[9]);
          v5[9] = 12;
          *((void *)v1 + v7 + 599) = 0;
          uint64_t v6 = (int *)v3[v2];
        }
      }
      if (v6)
      {
        uint64_t v8 = v6[9];
        this = (GLDContextRec *)GLDContextRec::endQuery((uint64_t)v1, (GLDQueryRec *)v6, v6[9]);
        v6[9] = 12;
        *((void *)v1 + v8 + 599) = 0;
      }
      if (v5)
      {
        this = (GLDContextRec *)GLDContextRec::beginQuery(v1, (GLDQueryRec *)v5, v2);
        v5[9] = v2;
        v3[v2] = v5;
      }
    }
    ++v2;
  }
  while (v2 != 11);
  return this;
}

uint64_t gldCreateQuery(uint64_t a1, GLDObject **a2)
{
  GLDObject::operator new((GLDObject *)0x38);
  uint64_t v5 = v4;
  GLDObject::GLDObject(v4);
  *(void *)uint64_t v5 = &unk_26F4D6408;
  *((void *)v5 + 2) = a1;
  GLRQueryResultBuffer::allocateQueryIndex(*(GLRQueryResultBuffer **)(a1 + 4752), (unsigned int *)v5 + 10);
  uint64_t v6 = *(void *)(a1 + 4752);
  *((void *)v5 + 3) = v6;
  GLDObject::retain(v6);
  *((void *)v5 + 4) = 0xCFFFFFFFFLL;
  *a2 = v5;
  return 0;
}

void sub_2406E1050(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t gldDestroyQuery(uint64_t a1, GLDQueryRec *a2)
{
  uint64_t v3 = *((int *)a2 + 9);
  if (v3 != 12)
  {
    GLDContextRec::endQuery(a1, a2, *((_DWORD *)a2 + 9));
    *((_DWORD *)a2 + 9) = 12;
    *(void *)(a1 + 8 * v3 + 4792) = 0;
  }
  GLDObject::release((atomic_uint *)a2);
  return 0;
}

uint64_t gldGetQueryInfo(uint64_t a1, GLDQueryRec *this, int a3, uint64_t *a4)
{
  if (!a3) {
    return 0;
  }
  if (*((_DWORD *)this + 8) == -1)
  {
    if (a3 == 34918)
    {
      uint64_t result = 0;
      *a4 = 0;
    }
    else if (a3 == 34919)
    {
      uint64_t result = 0;
      *a4 = 1;
    }
    else
    {
      return 10010;
    }
  }
  else
  {
    uint64_t v6 = *((int *)this + 9);
    if ((int)v6 <= 9)
    {
      GLDContextRec::endQuery(a1, this, *((_DWORD *)this + 9));
      *((_DWORD *)this + 9) = 12;
      *(void *)(a1 + 8 * v6 + 4792) = 0;
    }
    GLDQueryRec::getQueryInfo(this, this, a4);
    return 0;
  }
  return result;
}

uint64_t gldModifyQuery(uint64_t a1, GLDQueryRec *a2, int a3, uint64_t *a4)
{
  uint64_t v7 = *((int *)a2 + 9);
  if (v7 != 12)
  {
    GLDContextRec::endQuery(a1, a2, *((_DWORD *)a2 + 9));
    *((_DWORD *)a2 + 9) = 12;
    *(void *)(a1 + 8 * v7 + 4792) = 0;
  }
  if (a3) {
    return 10010;
  }
  uint64_t v10 = *a4;
  uint64_t v11 = *((void *)a2 + 3);
  uint64_t v12 = *((unsigned int *)a2 + 10);
  _os_nospin_lock_lock();
  *(void *)(*(void *)(v11 + 40) + 8 * v12) = v10;
  _os_nospin_lock_unlock();
  return 0;
}

void GLDMemoryPluginRec::~GLDMemoryPluginRec(GLDMemoryPluginRec *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t GLDMemoryPluginRec::dealloc(GLDMemoryPluginRec *this)
{
  uint64_t v2 = *((void *)this + 3);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }

  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLDMemoryPluginRec::setBufferResource(GLDMemoryPluginRec *this, GLRBufferResource *a2)
{
  uint64_t result = *((void *)this + 3);
  if (result) {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 24))(result);
  }
  if (a2)
  {
    *((void *)this + 3) = a2;
    uint64_t v5 = *(uint64_t (**)(GLRBufferResource *))(*(void *)a2 + 16);
    return v5(a2);
  }
  return result;
}

void GLDBufferRec::~GLDBufferRec(GLDBufferRec *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t GLDBufferRec::dealloc(GLDBufferRec *this)
{
  uint64_t v2 = *((void *)this + 5);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }
  uint64_t v3 = *((void *)this + 6);
  if (v3)
  {
    dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(*((dispatch_object_t *)this + 6));
  }

  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLDBufferRec::update(GLDBufferRec *this, char a2)
{
  if (!**((void **)this + 3)) {
    return 0;
  }
  if ((a2 & 1) == 0) {
    return 1;
  }
  uint64_t v3 = *(void **)(*((void *)this + 2) + 232);
  if (!*((void *)this + 5))
  {
    GLDObject::operator new((GLDObject *)0x20);
    uint64_t v5 = v4;
    GLDObject::GLDObject(v4);
    *(void *)uint64_t v5 = &unk_26F4D6488;
    *((void *)this + 5) = v5;
    uint64_t v6 = *((void *)this + 2);
    GLDLibrary::getAllDisplayMask(v5);
    *((void *)v5 + 2) = v6;
  }
  uint64_t result = objc_msgSend(v3, "newBufferWithBytesNoCopy:length:options:deallocator:");
  if (result)
  {
    uint64_t v8 = (void *)result;
    [(id)result setLabel:*MEMORY[0x263F12C98]];
    GLDObject::operator new((GLDObject *)0x30);
    uint64_t v10 = v9;
    GLRBufferResource::GLRBufferResource(v9);
    GLRBufferResource::initWithMetalBuffer(v10, v8, *(void *)(*((void *)this + 3) + 8));

    GLDMemoryPluginRec::setBufferResource(*((GLDMemoryPluginRec **)this + 5), v10);
    (*(void (**)(GLDLibrary *))(*(void *)v10 + 24))(v10);
    return 1;
  }
  return result;
}

void sub_2406E1518(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL GLDBufferRec::load(GLDBufferRec *this)
{
  int v1 = **((_DWORD **)this + 4);
  if (v1)
  {
    uint64_t v3 = *((void *)this + 2);
    if (!*(_DWORD *)(v3 + 248)
      || (pthread_mutex_lock((pthread_mutex_t *)(v3 + 256)), (int v1 = **((_DWORD **)this + 4)) != 0))
    {
      if (GLDBufferRec::update(this, v1))
      {
        int v1 = 0;
        **((_DWORD **)this + 4) = 0;
      }
    }
    uint64_t v4 = *((void *)this + 2);
    if (*(_DWORD *)(v4 + 248)) {
      pthread_mutex_unlock((pthread_mutex_t *)(v4 + 256));
    }
  }
  return v1 == 0;
}

uint64_t GLDBufferRec::loadUnlocked(GLDBufferRec *this)
{
  int v1 = **((_DWORD **)this + 4);
  if (v1)
  {
    uint64_t result = GLDBufferRec::update(this, v1);
    if (!result) {
      return result;
    }
    **((_DWORD **)this + 4) = 0;
  }
  return 1;
}

void GLDBufferRec::dispatchGroupAsync(uint64_t a1, dispatch_queue_t queue, dispatch_block_t block)
{
  uint64_t v6 = *(NSObject **)(a1 + 48);
  if (!v6)
  {
    uint64_t v6 = dispatch_group_create();
    *(void *)(a1 + 48) = v6;
  }

  dispatch_group_async(v6, queue, block);
}

NSObject *GLDBufferRec::finishCPUAccess(GLDBufferRec *this)
{
  uint64_t result = *((void *)this + 6);
  if (result) {
    return dispatch_group_wait(result, 0xFFFFFFFFFFFFFFFFLL);
  }
  return result;
}

uint64_t GLDBufferRec::restoreData(uint64_t this)
{
  int v1 = (void *)this;
  uint64_t v2 = *(void *)(this + 16);
  if (*(_DWORD *)(v2 + 248)) {
    this = pthread_mutex_lock((pthread_mutex_t *)(v2 + 256));
  }
  uint64_t v3 = v1[5];
  if (v3)
  {
    uint64_t v4 = *(void *)(v3 + 24);
    if (v4) {
      this = (*(uint64_t (**)(uint64_t))(*(void *)v4 + 16))(v4);
    }
  }
  else
  {
    uint64_t v4 = 0;
  }
  uint64_t v5 = v1[2];
  if (*(_DWORD *)(v5 + 248)) {
    this = pthread_mutex_unlock((pthread_mutex_t *)(v5 + 256));
  }
  if (v4)
  {
    if (*(unsigned char *)(v1[3] + 29)) {
      (*(void (**)(uint64_t, void))(*(void *)v4 + 40))(v4, v1[2]);
    }
    uint64_t v6 = *(uint64_t (**)(uint64_t))(*(void *)v4 + 24);
    return v6(v4);
  }
  return this;
}

uint64_t gldCreateBuffer(uint64_t a1, GLDLibrary **a2, uint64_t a3, uint64_t a4)
{
  GLDObject::operator new((GLDObject *)0x38);
  uint64_t v9 = v8;
  GLDObject::GLDObject(v8);
  *(void *)uint64_t v9 = &unk_26F4D64C0;
  GLDLibrary::getAllDisplayMask(v9);
  *((void *)v9 + 2) = a1;
  *((void *)v9 + 3) = a3;
  *((void *)v9 + 4) = a4;
  *a2 = v9;
  return 0;
}

void sub_2406E1800(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

BOOL gldLoadBuffer(int a1, GLDBufferRec *this)
{
  return GLDBufferRec::load(this);
}

uint64_t gldReclaimBuffer()
{
  int v0 = MTLReleaseAssertionFailure();
  return gldRestoreBufferData(v0, v1);
}

uint64_t gldRestoreBufferData(int a1, GLDBufferRec *this)
{
  return GLDBufferRec::restoreData((uint64_t)this);
}

void gldGetBufferAllocationIdentifiers(uint64_t a1, _DWORD *a2)
{
  *a2 = 0;
}

void gldGetMemoryPlugin(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3 = *(void *)(a2 + 40);
  if (v3)
  {
    *(void *)(a2 + 40) = 0;
    **(_DWORD **)(a2 + 32) |= 1u;
  }
  *a3 = v3;
}

void gldSetMemoryPlugin(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a2 + 40) = a3;
  **(_DWORD **)(a2 + 32) &= ~1u;
}

BOOL gldTestMemoryPlugin(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(_DWORD **)(a2 + 24);
  return !v2[3] && ((*(uint64_t (**)(_DWORD *))(*(void *)v2 + 48))(v2) & 1) != 0;
}

uint64_t gldDestroyMemoryPlugin(uint64_t a1, void **a2)
{
  if (a2)
  {
    (*(void (**)(void *, uint64_t))(*a2[3] + 40))(a2[3], a1);
    ((void (*)(void **))(*a2)[3])(a2);
  }
  return 0;
}

void GLDDeviceRec::~GLDDeviceRec(GLDDeviceRec *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

BOOL GLDDeviceRec::init(GLDDeviceRec *this)
{
  GLDLibrary::getAllDisplayMask(this);
  id v2 = MTLCreateSystemDefaultDevice();
  *((void *)this + 3) = v2;
  if (v2)
  {
    if (GLDDeviceRec::init(void)::onceToken != -1) {
      goto LABEL_22;
    }
    while (1)
    {
      uint64_t v3 = (void *)*((void *)this + 3);
      if (!GLDDeviceRec::init(void)::enableMetalCapture)
      {
        if (objc_opt_respondsToSelector()) {
          uint64_t v3 = (void *)[v3 originalObject];
        }
        id v4 = v3;

        *((void *)this + 3) = v3;
      }
      uint64_t v5 = (const char *)objc_msgSend((id)objc_msgSend(v3, "name"), "cStringUsingEncoding:", 1);
      size_t v6 = strlen(v5) + 1;
      uint64_t v7 = (char *)malloc_type_malloc(v6, 0xB4C3F624uLL);
      *((void *)this + 121) = v7;
      strncpy(v7, v5, v6);
      uint64_t v8 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"Metal%@GLDriver", objc_msgSend(*((id *)this + 3), "familyName")), "cStringUsingEncoding:", 1];
      size_t v9 = strlen(v8) + 1;
      uint64_t v10 = (char *)malloc_type_malloc(v9, 0xD075EFC9uLL);
      *((void *)this + 122) = v10;
      strncpy(v10, v8, v9);
      *((void *)this + 4) = 850045863;
      *(_OWORD *)((char *)this + 40) = 0u;
      *(_OWORD *)((char *)this + 56) = 0u;
      *(_OWORD *)((char *)this + 72) = 0u;
      *((void *)this + 11) = 0;
      uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263F086E0]) initWithPath:@"/System/Library/Extensions/AppleMetalGLRenderer.bundle"];
      uint64_t v12 = [v11 pathForResource:@"default" ofType:@"metallib"];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = ___ZN12GLDDeviceRec4initEv_block_invoke_2;
      block[3] = &unk_2650D0AD8;
      block[4] = v12;
      void block[5] = this;
      if (GLDDeviceRec::init(void)::once != -1) {
        dispatch_once(&GLDDeviceRec::init(void)::once, block);
      }
      id v13 = (id)GLDDeviceRec::init(void)::defaultLibrary;
      *((void *)this + 12) = v13;
      if (v13) {
        break;
      }
LABEL_21:
      MTLReleaseAssertionFailure();
LABEL_22:
      dispatch_once(&GLDDeviceRec::init(void)::onceToken, &__block_literal_global);
    }

    *((void *)this + 55) = objc_alloc_init(MEMORY[0x263EFF9A0]);
    *((void *)this + 26) = objc_alloc_init(MEMORY[0x263EFF9A0]);
    GLRFunctionCache::init((pthread_rwlock_t *)((char *)this + 216));
    *((void *)this + 56) = dispatch_queue_create("glmtl.pipelinecache", MEMORY[0x263EF83A8]);
    GLRRenderPipelineCache::init((GLDDeviceRec *)((char *)this + 456));
    GLRDepthStencilCache::init((GLDDeviceRec *)((char *)this + 464));
    *((_DWORD *)this + 26) = GLRFunctionCache::registerBuiltInFunction((uint64_t)this + 216, (void *)[*((id *)this + 12) newFunctionWithName:@"clearVertex"]);
    uint64_t v14 = 0;
    *((void *)this + 14) = malloc_type_calloc(0x100uLL, 4uLL, 0x100004052888210uLL);
    do
    {
      int v15 = GLRFunctionCache::registerBuiltInFunction((uint64_t)this + 216, (void *)[*((id *)this + 12) newFunctionWithName:off_2650D0AF8[v14]]);
      *((_DWORD *)this + v14 + 30) = v15;
      if (!v15) {
        goto LABEL_21;
      }
      ++v14;
    }
    while (v14 != 17);
    GLDObject::operator new((GLDObject *)0x30);
    double v17 = v16;
    GLRResourceListPool::GLRResourceListPool(v16);
    *((void *)this + 59) = v17;
    GLRResourceListPool::initWithResourceListCapacity(v17, 4096);
    int v18 = (void *)[MEMORY[0x263F086E0] mainBundle];
    if (v18
      && objc_msgSend((id)objc_msgSend(v18, "bundlePath"), "rangeOfString:", @"Application") != 0x7FFFFFFFFFFFFFFFLL)
    {
      *((void *)this + 61) = (id)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:4];
      *((void *)this + 62) = (id)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:64];
      *((void *)this + 64) = dispatch_queue_create("glmtl.telemetry", 0);
      GLDDeviceRec::telemetryStartTimer(this, 60.0);
    }
    *((unsigned char *)this + 480) = 0;
    {
      GLDDeviceRec::init(void)::useMaxDataBufferSizeEV = (uint64_t)getenv("GLMTL_SET_MAX_DATA_BUFFER_SIZE");
    }
    if (GLDDeviceRec::init(void)::useMaxDataBufferSizeEV
      && *(unsigned char *)GLDDeviceRec::init(void)::useMaxDataBufferSizeEV == 49)
    {
      *((unsigned char *)this + 480) = 1;
    }
  }
  return v2 != 0;
}

void sub_2406E1DCC(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t ___ZN12GLDDeviceRec4initEv_block_invoke()
{
  Boolean keyExistsAndHasValidFormat = 0;
  uint64_t result = CFPreferencesGetAppBooleanValue(@"MetalCaptureEnabled", @"com.apple.opengl", &keyExistsAndHasValidFormat);
  GLDDeviceRec::init(void)::enableMetalCapture = result != 0;
  return result;
}

void ___ZN12GLDDeviceRec4initEv_block_invoke_2(uint64_t a1)
{
  uint64_t v1 = 0;
  GLDDeviceRec::init(void)::defaultLibrary = [*(id *)(*(void *)(a1 + 40) + 24) newLibraryWithFile:*(void *)(a1 + 32) error:&v1];
  if (v1) {
    NSLog(&cfstr_ErrorLoadingBu.isa, v1);
  }
}

uint64_t GLDDeviceRec::dealloc(GLDDeviceRec *this)
{
  id v2 = *((void *)this + 64);
  if (v2)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN12GLDDeviceRec7deallocEv_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = this;
    dispatch_sync(v2, block);
    dispatch_release(*((dispatch_object_t *)this + 64));
  }
  uint64_t v3 = *((void *)this + 63);
  if (v3) {
    dispatch_release(v3);
  }

  GLRFunctionCache::destroy((pthread_rwlock_t *)((char *)this + 216));
  id v4 = (const void *)*((void *)this + 57);
  if (v4) {
    CFRelease(v4);
  }
  uint64_t v5 = (const void *)*((void *)this + 58);
  if (v5) {
    CFRelease(v5);
  }
  size_t v6 = *((void *)this + 56);
  if (v6) {
    dispatch_release(v6);
  }

  free(*((void **)this + 14));
  *((void *)this + 14) = 0;

  uint64_t v7 = *((void *)this + 59);
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
  }

  free(*((void **)this + 121));
  free(*((void **)this + 122));
  return GLDObject::dealloc((uint64_t)this);
}

void ___ZN12GLDDeviceRec7deallocEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  dispatch_source_cancel(*(dispatch_source_t *)(v1 + 520));
  id v2 = *(NSObject **)(v1 + 520);

  dispatch_release(v2);
}

GLRResourceList *GLDDeviceRec::newResourceList(GLRResourceListPool **this)
{
  return GLRResourceListPool::newResourceList(this[59]);
}

void *GLDDeviceRec::getDepthStencilStateFromDescriptor(id *this, MTLDepthStencilDescriptor *a2)
{
  id v4 = (pthread_mutex_t *)(this + 4);
  pthread_mutex_lock((pthread_mutex_t *)(this + 4));
  uint64_t v5 = (void *)[this[55] objectForKey:a2];
  if (!v5)
  {
    uint64_t v5 = (void *)[this[3] newDepthStencilStateWithDescriptor:a2];
    if (v5)
    {
      [this[55] setObject:v5 forKey:a2];
    }
  }
  pthread_mutex_unlock(v4);
  return v5;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

const void *_getRenderPipelineState(uint64_t a1)
{
  uint64_t result = CFDictionaryGetValue(**(CFDictionaryRef **)a1, *(const void **)(a1 + 8));
  **(void **)(a1 + 16) = result;
  return result;
}

const void *_getDepthStencilState(uint64_t a1)
{
  uint64_t result = CFDictionaryGetValue(**(CFDictionaryRef **)a1, *(const void **)(a1 + 8));
  **(void **)(a1 + 16) = result;
  return result;
}

void ___ZN12GLDDeviceRec27getDepthStencilStateFromKeyEPK18GLRDepthStencilKey_block_invoke(uint64_t a1)
{
}

uint64_t GLDDeviceRec::getClearShaderFragmentFunction(GLDDeviceRec *this, uint64_t a2)
{
  id v4 = (pthread_mutex_t *)((char *)this + 32);
  uint64_t v5 = pthread_mutex_lock((pthread_mutex_t *)((char *)this + 32));
  uint64_t v6 = *(unsigned int *)(*((void *)this + 14) + 4 * a2);
  if (v6) {
    goto LABEL_4;
  }
  uint64_t v7 = (void *)MEMORY[0x2455F59C0](v5);
  uint64_t v8 = objc_msgSend([NSString alloc], "initWithFormat:", @"clearFragment%02X", a2);
  uint64_t v6 = GLRFunctionCache::registerBuiltInFunction((uint64_t)this + 216, (void *)[*((id *)this + 12) newFunctionWithName:v8]);

  if (v6)
  {
    *(_DWORD *)(*((void *)this + 14) + 4 * a2) = v6;
LABEL_4:
    pthread_mutex_unlock(v4);
    return v6;
  }
  uint64_t v10 = (GLDDeviceRec *)MTLReleaseAssertionFailure();
  return GLDDeviceRec::getBlitFramebufferSampler(v10, v11);
}

uint64_t GLDDeviceRec::getBlitFramebufferSampler(id *this, int a2)
{
  int v4 = a2 - 9728;
  uint64_t v5 = (pthread_mutex_t *)(this + 4);
  pthread_mutex_lock((pthread_mutex_t *)(this + 4));
  uint64_t v6 = &this[v4];
  uint64_t v9 = (uint64_t)v6[24];
  uint64_t v8 = (uint64_t *)(v6 + 24);
  uint64_t v7 = v9;
  if (!v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x263F129F8]);
    unsigned int v11 = v10;
    if (a2 == 9728)
    {
      uint64_t v12 = 0;
    }
    else
    {
      if (a2 != 9729)
      {
LABEL_7:
        [v11 setMipFilter:0];
        [v11 setMaxAnisotropy:1];
        [v11 setSAddressMode:0];
        [v11 setTAddressMode:0];
        [v11 setRAddressMode:0];
        [v11 setNormalizedCoordinates:0];
        [v11 setLodMinClamp:0.0];
        [v11 setLodMaxClamp:0.0];
        uint64_t v7 = [this[3] newSamplerStateWithDescriptor:v11];
        *uint64_t v8 = v7;
        goto LABEL_8;
      }
      uint64_t v12 = 1;
    }
    [v10 setMinFilter:v12];
    [v11 setMagFilter:v12];
    goto LABEL_7;
  }
LABEL_8:
  pthread_mutex_unlock(v5);
  return v7;
}

const char *GLDDeviceRec::getBlitPipelineStateFromDescriptor(id *this, MTLRenderPipelineDescriptor *a2)
{
  int v4 = (pthread_mutex_t *)(this + 4);
  pthread_mutex_lock((pthread_mutex_t *)(this + 4));
  uint64_t v5 = (void *)[this[26] objectForKey:a2];
  if (v5) {
    goto LABEL_4;
  }
  uint64_t v10 = 0;
  uint64_t v6 = [this[3] newRenderPipelineStateWithDescriptor:a2 error:&v10];
  if (v6)
  {
    uint64_t v5 = (void *)v6;
    [this[26] setObject:v6 forKey:a2];

LABEL_4:
    pthread_mutex_unlock(v4);
    return (const char *)v5;
  }
  uint64_t v8 = MTLReleaseAssertionFailure();
  return gldGetDeviceString(v8, v9);
}

const char *gldGetDeviceString(uint64_t a1, int a2)
{
  uint64_t result = 0;
  switch(a2)
  {
    case 7936:
      uint64_t result = "Apple Inc.";
      break;
    case 7937:
      uint64_t result = *(const char **)(a1 + 968);
      break;
    case 7938:
      uint64_t result = "Metal - 101";
      break;
    case 7940:
      uint64_t result = *(const char **)(a1 + 976);
      break;
    case 7941:
      uint64_t result = (const char *)&gl_device;
      break;
    default:
      return result;
  }
  return result;
}

uint64_t gldPopulateRendererInfo(uint64_t a1, uint64_t a2)
{
  int v2 = *(_DWORD *)g_Library;
  *(void *)a2 = 0;
  *(_OWORD *)(a2 + 8) = xmmword_2406F5200;
  *(void *)(a2 + 24) = 0x100108000000;
  *(_DWORD *)(a2 + 32) = 129;
  *(_DWORD *)(a2 + 36) = v2;
  *(_DWORD *)(a2 + 40) = 0x10000;
  *(_WORD *)(a2 + 44) = 16;
  *(_DWORD *)(a2 + 48) = 1;
  *(unsigned char *)(a2 + 46) = 1;
  *(_OWORD *)(a2 + 60) = 0u;
  *(_OWORD *)(a2 + 76) = 0u;
  *(_OWORD *)(a2 + 92) = 0u;
  *(_OWORD *)(a2 + 108) = 0u;
  *(_OWORD *)(a2 + 120) = 0u;
  return 0;
}

void GLDFenceRec::~GLDFenceRec(GLDFenceRec *this)
{
  GLRResource::~GLRResource(this);

  GLDObject::operator delete(v1);
}

uint64_t GLDFenceRec::getStatus(GLDFenceRec *this)
{
  if (*((_DWORD *)this + 8)) {
    return 3;
  }
  if (*((_DWORD *)this + 3)) {
    return 0;
  }
  BOOL v2 = *((_DWORD *)this + 4) == 0;
  *((_DWORD *)this + 8) = v2;
  if (v2) {
    return 3;
  }
  else {
    return 1;
  }
}

uint64_t gldCreateFence(uint64_t a1, GLRResource **a2)
{
  GLDObject::operator new((GLDObject *)0x28);
  int v4 = v3;
  GLRResource::GLRResource(v3);
  *(void *)int v4 = &unk_26F4D6598;
  GLDLibrary::getAllDisplayMask(v4);
  *((_DWORD *)v4 + 8) = 1;
  *a2 = v4;
  return 0;
}

void sub_2406E2598(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

void gldClearFence(uint64_t a1, uint64_t a2)
{
  if (a2) {
    *(_DWORD *)(a2 + 32) = 1;
  }
}

uint64_t gldDestroyFence(uint64_t a1, uint64_t a2)
{
  if (a2) {
    (*(void (**)(uint64_t))(*(void *)a2 + 24))(a2);
  }
  return 0;
}

uint64_t gldGetFenceStatus(uint64_t a1, _DWORD *a2)
{
  if (!a2 || a2[8]) {
    return 3;
  }
  if (a2[3]) {
    return 0;
  }
  BOOL v3 = a2[4] == 0;
  a2[8] = v3;
  if (v3) {
    return 3;
  }
  else {
    return 1;
  }
}

BOOL GLRResource::testIdle(GLRResource *this)
{
  return *((_DWORD *)this + 4) == 0;
}

void GLDFramebufferRec::~GLDFramebufferRec(GLDFramebufferRec *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t GLDFramebufferRec::dealloc(uint64_t this)
{
  *(void *)(this + 16) = 0;
  return GLDObject::dealloc(this);
}

BOOL GLDFramebufferRec::load(GLDFramebufferRec *this)
{
  uint64_t v2 = *((void *)this + 2);
  if (*(_DWORD *)(v2 + 248)) {
    pthread_mutex_lock((pthread_mutex_t *)(v2 + 256));
  }
  unsigned int v3 = *(_DWORD *)(*((void *)this + 4) + 200);
  *(unsigned char *)(*((void *)this + 5) + 81) = 1;
  if (!v3)
  {
LABEL_8:
    uint64_t v11 = *((void *)this + 2);
    int v12 = *(_DWORD *)(v11 + 20) + 1;
    *(_DWORD *)(v11 + 20) = v12;
    *((_DWORD *)this + 6) = v12;
    int updated = GLDFramebufferRec::updateState(this);
    uint64_t v14 = *((void *)this + 5);
    int v15 = updated ^ 1;
    *(unsigned char *)(v14 + 81) = updated ^ 1;
    *(unsigned char *)(v14 + 80) = 0;
    goto LABEL_10;
  }
  while (1)
  {
    unsigned int v4 = __clz(__rbit32(v3));
    uint64_t v5 = *(void *)(*((void *)this + 5) + 8 * v4);
    uint64_t v6 = *(void *)(v5 + 56);
    unsigned int v7 = *(unsigned __int8 *)(v6 + 20);
    if (*(unsigned char *)(v6 + 20)) {
      break;
    }
LABEL_7:
    v3 ^= 1 << v4;
    if (!v3) {
      goto LABEL_8;
    }
  }
  uint64_t v8 = *((void *)this + 2);
  int v9 = *(_DWORD *)(v8 + 24) + 1;
  *(_DWORD *)(v8 + 24) = v9;
  *(_DWORD *)(v5 + 12) = v9;
  if (GLDTextureRec::update((GLDTextureRec *)v5, v7, (unsigned __int16 *)(v6 + 8)))
  {
    uint64_t v10 = *(void *)(v5 + 56);
    *(void *)(v10 + 13) = 0;
    *(void *)(v10 + 8) = 0;
    goto LABEL_7;
  }
  int v15 = *(unsigned __int8 *)(*((void *)this + 5) + 81);
LABEL_10:
  uint64_t v16 = *((void *)this + 2);
  if (*(_DWORD *)(v16 + 248)) {
    pthread_mutex_unlock((pthread_mutex_t *)(v16 + 256));
  }
  return v15 == 0;
}

uint64_t GLDFramebufferRec::updateState(GLDFramebufferRec *this)
{
  uint64_t v1 = *((void *)this + 5);
  *(unsigned char *)(v1 + 82) = 0;
  uint64_t v2 = *((void *)this + 4);
  if (*(unsigned __int16 *)(v2 + 178) <= 0x4000u)
  {
    char v4 = 1;
    if (*(unsigned __int16 *)(v2 + 180) > 0x4000u)
    {
      uint64_t result = 0;
      goto LABEL_5;
    }
    unint64_t v6 = 0;
    int v7 = 0;
    unsigned int v8 = 0;
    do
    {
      if ((*(_DWORD *)(v2 + 200) & (1 << v6)) != 0)
      {
        uint64_t v1 = *((void *)this + 5);
        uint64_t v9 = *(void *)(v1 + 8 * v6);
        if (!v9) {
          return 0;
        }
        if (v6 <= 7)
        {
          unsigned int v10 = *(_DWORD *)(v9 + 64);
          if ((*((unsigned char *)&glrTextureFormats + 40 * v10 + 36) & 1) == 0) {
            goto LABEL_2;
          }
          uint64_t v23 = 0;
          long long v22 = 0u;
          MTLPixelFormatGetInfoForDevice();
          if (*(unsigned __int8 *)(*(void *)(v9 + 48) + 212) <= 1u) {
            uint64_t v11 = (int *)&v22 + 2;
          }
          else {
            uint64_t v11 = (int *)&v23;
          }
          int v12 = *v11;
          uint64_t v2 = *((void *)this + 4);
          if (*(_WORD *)(v2 + 176) && v6 == *(unsigned __int16 *)(v2 + 176) - 36064)
          {
            id v13 = &(&glrTextureFormats)[5 * v10];
            uint64_t v14 = *((void *)this + 5);
            *(_WORD *)(v14 + 84) = *((_DWORD *)v13 + 2);
            *(_WORD *)(v14 + 86) = *((_DWORD *)v13 + 3);
          }
          v8 += 8 * v12;
          v7 |= 1 << v6;
        }
      }
      ++v6;
    }
    while (v6 != 10);
    unint64_t v15 = [*(id *)(*((void *)this + 2) + 232) maxFramebufferStorageBits];
    uint64_t v1 = *((void *)this + 5);
    if (v15 >= v8)
    {
      uint64_t v16 = *(void *)(v1 + 64);
      if (!v16 || (*((unsigned char *)&glrTextureFormats + 40 * *(unsigned int *)(v16 + 64) + 36) & 2) != 0)
      {
        uint64_t v17 = *(void *)(v1 + 72);
        if (v17)
        {
          uint64_t result = 0;
          uint64_t v18 = 68;
          if (*(_DWORD *)(v17 + 76) == 1) {
            uint64_t v18 = 64;
          }
          uint64_t v19 = &(&glrTextureFormats)[5 * *(unsigned int *)(v17 + v18)];
          if (v16) {
            BOOL v20 = v17 == v16;
          }
          else {
            BOOL v20 = 1;
          }
          char v21 = !v20;
          char v4 = 1;
          if (*((unsigned char *)v19 + 36) & 4) == 0 || (v21) {
            goto LABEL_5;
          }
          goto LABEL_38;
        }
        if (v7 || v16)
        {
LABEL_38:
          char v4 = 0;
          uint64_t result = 1;
          goto LABEL_5;
        }
      }
    }
  }
LABEL_2:
  uint64_t result = 0;
  char v4 = 1;
LABEL_5:
  *(unsigned char *)(v1 + 81) = v4;
  return result;
}

uint64_t gldCreateFramebuffer(uint64_t a1, GLDLibrary **a2, uint64_t a3, uint64_t a4)
{
  GLDObject::operator new((GLDObject *)0x30);
  uint64_t v9 = v8;
  GLDObject::GLDObject(v8);
  *(void *)uint64_t v9 = &unk_26F4D65F8;
  GLDLibrary::getAllDisplayMask(v9);
  *((void *)v9 + 2) = a1;
  *((void *)v9 + 4) = a3;
  *((void *)v9 + 5) = a4;
  *a2 = v9;
  return 0;
}

void sub_2406E2A24(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t gldDestroyFramebuffer(uint64_t a1, atomic_uint *this)
{
  if (*(_DWORD *)(a1 + 248)) {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  }
  if (this) {
    GLDObject::release(this);
  }
  if (*(_DWORD *)(a1 + 248)) {
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 256));
  }
  return 0;
}

BOOL gldLoadFramebuffer(int a1, GLDFramebufferRec *this)
{
  return GLDFramebufferRec::load(this);
}

uint64_t GLDContextRec::loadCurrentProgram(GLDContextRec *this, GLDProgramRec *a2, GLDPipelineProgramRec *a3, unsigned int *a4, unsigned int a5)
{
  uint64_t v15 = 0;
  if (a3)
  {
    uint64_t result = GLDPipelineProgramRec::update((uint64_t)a3, (uint64_t)a2, a5, &v15);
    if (!result)
    {
      id v13 = (GLDContextRec *)MTLReleaseAssertionFailure();
      return GLDContextRec::loadCurrentPipelinePrograms(v13, v14);
    }
    uint64_t v10 = v15;
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t result = 0;
  }
  uint64_t v11 = (char *)this + 8 * a5;
  if (*((void *)v11 + 511) != result)
  {
    *((void *)v11 + 511) = result;
    *((void *)this + 330) = -1;
    *((_DWORD *)this + 618) |= 0x40Cu;
  }
  if (!a5) {
    *((void *)this + 516) = v10;
  }
  int v12 = (char *)this + 8 * a5;
  *((void *)v12 + 188) = a2;
  *((void *)v12 + 183) = a3;
  return result;
}

uint64_t GLDContextRec::loadCurrentPipelinePrograms(uint64_t this, unsigned int *a2, uint64_t a3, unsigned int *a4)
{
  uint64_t v5 = this;
  unsigned int v6 = a2[3];
  if ((v6 & 0x20000000) != 0)
  {
    this = GLDContextRec::updateUniformBuffers((GLDContextRec *)this);
    char v7 = this;
    unsigned int v6 = a2[3];
  }
  else
  {
    char v7 = 1;
  }
  if ((v6 & 0x90040000) != 0)
  {
    uint64_t v8 = *(void *)(v5 + 112);
    uint64_t v9 = *(void *)(v8 + 328);
    int v10 = *(_DWORD *)(v5 + 384);
    *(_DWORD *)(v5 + 384) = v10 & 0xFFF7FF00;
    if ((v10 & 0x3F03F00) != 0)
    {
      uint64_t v9 = 0;
      uint64_t v11 = 0;
    }
    else
    {
      if (v9 && (**(unsigned char **)(v9 + 24) & 1) != 0)
      {
        if ((v7 & 1) == 0) {
          goto LABEL_30;
        }
        int v12 = *(GLDPipelineProgramRec ***)(v9 + 32);
      }
      else
      {
        uint64_t v9 = 0;
        int v12 = (GLDPipelineProgramRec **)(v8 + 256);
      }
      uint64_t v11 = *v12;
    }
    this = GLDContextRec::loadCurrentProgram((GLDContextRec *)v5, (GLDProgramRec *)v9, v11, a4, 0);
    unsigned int v6 = a2[3];
  }
  if ((v6 & 0x10400000) != 0)
  {
    uint64_t v13 = *(void *)(v5 + 112);
    uint64_t v14 = *(void *)(v13 + 360);
    if (!v14 || (**(unsigned char **)(v14 + 24) & 0x10) == 0)
    {
      uint64_t v14 = 0;
      uint64_t v15 = (GLDPipelineProgramRec **)(v13 + 288);
LABEL_20:
      this = GLDContextRec::loadCurrentProgram((GLDContextRec *)v5, (GLDProgramRec *)v14, *v15, a4, 4u);
      unsigned int v6 = a2[3];
      goto LABEL_21;
    }
    if (v7)
    {
      uint64_t v15 = (GLDPipelineProgramRec **)(*(void *)(v14 + 32) + 32);
      goto LABEL_20;
    }
LABEL_30:
    MTLReleaseAssertionFailure();
    return gldGetPipelineProgramInfo();
  }
LABEL_21:
  if ((v6 & 0x903C0000) != 0)
  {
    if (*(_WORD *)(v5 + 384))
    {
      uint64_t v16 = *(void *)(*(void *)(v5 + 112) + 296);
      if (*(void *)(v5 + 1464) != v16)
      {
        uint64_t v18 = 0;
        this = GLDPipelineProgramRec::update(v16, 0, 0, &v18);
        if (!this)
        {
          uint64_t v16 = 0;
          *(_DWORD *)(v5 + 384) |= 0x80000u;
          a2[3] |= 0x10400000u;
        }
        uint64_t v17 = v18;
        if (*(void *)(v5 + 4088) != this)
        {
          *(void *)(v5 + 4088) = this;
          *(void *)(v5 + 2640) = -1;
          *(_DWORD *)(v5 + 2472) |= 0x40Cu;
        }
        *(void *)(v5 + 4128) = v17;
        *(void *)(v5 + 1504) = 0;
        *(void *)(v5 + 1464) = v16;
      }
    }
  }
  return this;
}

uint64_t gldGetPipelineProgramInfo()
{
  return 0;
}

uint64_t gpusPixelBytes(int a1, int a2)
{
  uint64_t result = 2;
  if (a2 <= 33634)
  {
    if (a2 <= 32818)
    {
      if ((a2 - 5120) <= 0xB)
      {
        if (((1 << a2) & 0x70) != 0) {
          return 4 * gpulComponents(a1);
        }
        if (((1 << a2) & 0x80C) != 0) {
          return 2 * gpulComponents(a1);
        }
        if (((1 << a2) & 3) != 0)
        {
          uint64_t result = 1;
          char v5 = a1 - 101;
          if ((a1 - 35429) > 0xF)
          {
            if ((a1 - 37883) < 3) {
              return result;
            }
            if (a1 != 37902 && (a1 - 37875) >= 6)
            {
              int v7 = a1;
              return gpulComponents(v7);
            }
          }
          else if (((1 << v5) & 0xE2E2) == 0)
          {
            if (((1 << v5) & 0xD0D) == 0) {
              return 4;
            }
            return result;
          }
          return 2;
        }
      }
      if (a2)
      {
LABEL_54:
        MTLReleaseAssertionFailure();
        goto LABEL_55;
      }
      if (a1 > 37839)
      {
        unsigned int v8 = a1 - 37840;
        if (v8 > 0x3D || ((1 << v8) & 0x3FFFC00000003FFFLL) == 0) {
          goto LABEL_55;
        }
      }
      else if (a1 > 37807)
      {
        if ((a1 - 37808) >= 0xE) {
          goto LABEL_55;
        }
      }
      else
      {
        uint64_t result = 8;
        if (a1 > 37487)
        {
          unsigned int v9 = a1 - 37488;
          if (v9 > 9)
          {
LABEL_55:
            int v7 = MTLReleaseAssertionFailure();
            return gpulComponents(v7);
          }
          if (((1 << v9) & 0xF3) != 0) {
            return result;
          }
        }
        else
        {
          if ((a1 - 35412) < 4) {
            return result;
          }
          if ((a1 - 35420) >= 4)
          {
            if ((a1 - 35840) >= 4) {
              goto LABEL_55;
            }
            return result;
          }
        }
      }
      return 16;
    }
    if ((a2 - 32819) < 2) {
      return result;
    }
    int v4 = 32822;
LABEL_24:
    if (a2 == v4) {
      return 4;
    }
    goto LABEL_54;
  }
  if (a2 <= 34233)
  {
    if ((a2 - 33635) <= 5)
    {
      int v6 = 1 << (a2 - 99);
      if ((v6 & 0xD) != 0) {
        return result;
      }
      if ((v6 & 0x30) != 0) {
        return 4;
      }
    }
    int v4 = 34042;
    goto LABEL_24;
  }
  if (a2 > 36192)
  {
    if (a2 != 36193)
    {
      if (a2 == 36269) {
        return 8;
      }
      int v4 = 37882;
      goto LABEL_24;
    }
    return 2 * gpulComponents(a1);
  }
  if ((a2 - 34234) >= 2)
  {
    if (a2 != 35899)
    {
      int v4 = 35902;
      goto LABEL_24;
    }
    return 4;
  }
  return result;
}

uint64_t gpulComponents(int a1)
{
  uint64_t result = 1;
  if (a1 > 35428)
  {
    if ((a1 - 35429) < 0x10 || (a1 - 37875) <= 0x1B && ((1 << (a1 + 13)) & 0x800073F) != 0) {
      return 3;
    }
    unsigned int v3 = a1 - 36244;
    if (v3 > 9) {
      return 4;
    }
    if (((1 << v3) & 0x10F) != 0) {
      return result;
    }
    if (((1 << v3) & 0x50) != 0) {
      return 3;
    }
    if (v3 != 9) {
      return 4;
    }
    return 2;
  }
  if (a1 > 32840)
  {
    if ((a1 - 33319) >= 2)
    {
      if (a1 == 32841) {
        return result;
      }
      if (a1 == 32992) {
        return 3;
      }
      return 4;
    }
    return 2;
  }
  switch(a1)
  {
    case 6400:
    case 6401:
    case 6402:
    case 6403:
    case 6404:
    case 6405:
    case 6406:
    case 6409:
      return result;
    case 6407:
      return 3;
    case 6410:
      return 2;
    default:
      return 4;
  }
  return result;
}

uint64_t glrPixelSettings(unsigned int a1, unsigned int a2, int a3, int a4, int *a5, _DWORD *a6, _DWORD *a7, int *a8, char a9)
{
  uint64_t result = gpusPixelBytes(a1, a2);
  *a6 = result;
  if (a2 && a8)
  {
    int v18 = result;
    int v19 = a8[1];
    if (!v19)
    {
      uint64_t result = *a8 < 1 ? gpusRowBytes(a1, a2, a3) : (*a8 * result);
      int v20 = a8[7];
      int v21 = (int)result % v20;
      int v19 = v20 + result - (int)result % v20;
      if (!v21) {
        int v19 = result;
      }
    }
    *a5 = v19;
    int v22 = a8[3];
    if (!v22)
    {
      int v23 = a8[2];
      if (v23 <= 0) {
        int v23 = a4;
      }
      int v22 = v23 * v19;
    }
    if ((a9 & 4) != 0) {
      int v24 = a8[6];
    }
    else {
      int v24 = 0;
    }
    *a7 = a8[5] * v18 + v24 * v22 + a8[4] * v19;
  }
  else
  {
    *a7 = 0;
    uint64_t result = gpusRowBytes(a1, a2, a3);
    *a5 = result;
  }
  return result;
}

uint64_t GLDPipelineProgramRec::update(uint64_t a1, uint64_t a2, unsigned int a3, void *a4)
{
  int v6 = *(int **)(a1 + 32);
  int v7 = *v6;
  int *v6 = 0;
  if (v7)
  {

    *(void *)(a1 + 40) = GLDPipelineProgramRec::createMetalFunction((GLDPipelineProgramRec *)a1, v9, v10, a3);
    if (!a3)
    {

      uint64_t v11 = *(void *)(*(void *)(a1 + 24) + 80);
      if (v11) {
        int v12 = GLRFunctionCache::newFunctionWithGLIR((CFArrayRef *)(*(void *)(*(void *)(a1 + 16) + 224) + 216), *(void **)(*(void *)(*(void *)(a1 + 16) + 224) + 24), v11, 0, 1);
      }
      else {
        int v12 = 0;
      }
      *(void *)(a1 + 48) = v12;
    }
  }
  *a4 = *(void *)(a1 + 48);
  return *(void *)(a1 + 40);
}

void GLDProgramRec::~GLDProgramRec(GLDProgramRec *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t gldDestroyProgram(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 248)) {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  }
  if (a2) {
    (*(void (**)(uint64_t))(*(void *)a2 + 24))(a2);
  }
  if (*(_DWORD *)(a1 + 248)) {
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 256));
  }
  return 0;
}

void GLRResourceListPool::GLRResourceListPool(GLRResourceListPool *this)
{
  GLDObject::GLDObject(this);
  void *v1 = &unk_26F4D6730;
}

void GLRResourceListPool::~GLRResourceListPool(GLRResourceListPool *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t GLRResourceListPool::initWithResourceListCapacity(GLRResourceListPool *this, int a2)
{
  unsigned int v3 = this;
  GLDLibrary::getAllDisplayMask(this);
  *((void *)v3 + 2) = 0;
  unsigned int v3 = (GLRResourceListPool *)((char *)v3 + 16);
  *((_DWORD *)v3 + 6) = a2;
  *((void *)v3 + 1) = v3;
  *((void *)v3 + 2) = 0;
  return 1;
}

GLRResourceList *GLRResourceListPool::newResourceList(GLRResourceListPool *this)
{
  _os_nospin_lock_lock();
  uint64_t v2 = (GLRResourceList *)*((void *)this + 2);
  if (v2)
  {
    uint64_t v3 = *((void *)v2 + 24);
    int v4 = (void *)*((void *)v2 + 25);
    if (v3)
    {
      *(void *)(v3 + 200) = v4;
      int v4 = (void *)*((void *)v2 + 25);
    }
    else
    {
      *((void *)this + 3) = v4;
    }
    *int v4 = v3;
    --*((_DWORD *)this + 9);
    *((void *)v2 + 24) = 0;
    *((void *)v2 + 25) = 0;
    _os_nospin_lock_unlock();
    goto LABEL_8;
  }
  _os_nospin_lock_unlock();
  GLDObject::operator new((GLDObject *)0xD8);
  uint64_t v2 = v5;
  GLRResourceList::GLRResourceList(v5);
  if (v2)
  {
    GLRResourceList::initWithCapacity(v2, *((_DWORD *)this + 10));
LABEL_8:
    *((void *)v2 + 23) = this;
    (*(void (**)(GLRResourceListPool *))(*(void *)this + 16))(this);
  }
  return v2;
}

void sub_2406E3B30(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

void GLRResource::GLRResource(GLRResource *this)
{
  GLDObject::GLDObject(this);
  void *v1 = &unk_26F4D6780;
}

void GLRResource::~GLRResource(GLRResource *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

BOOL GLRResource::decrementBusy(atomic_uint *this)
{
  return atomic_fetch_add_explicit(this + 4, 0xFFFFFFFF, memory_order_relaxed) == 1;
}

void GLRBufferResource::~GLRBufferResource(GLRBufferResource *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t GLRBufferResource::initWithMetalBuffer(GLDLibrary *a1, void *a2, uint64_t a3)
{
  GLDLibrary::getAllDisplayMask(a1);
  *((void *)a1 + 3) = a3;
  *((void *)a1 + 5) = a2;
  id v6 = a2;
  return 1;
}

uint64_t GLRBufferResource::dealloc(id *this)
{
  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLRBufferResource::testIdle(id *this)
{
  return [this[5] isComplete];
}

uint64_t GLRBufferResource::waitIdle(id *this, GLDShareGroupRec *a2)
{
  return [this[5] waitUntilComplete];
}

void GLRSamplerResource::GLRSamplerResource(GLRSamplerResource *this)
{
  GLDObject::GLDObject(this);
  void *v1 = &unk_26F4D6810;
}

void GLRSamplerResource::~GLRSamplerResource(GLRSamplerResource *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t GLRSamplerResource::initWithMetalSampler(GLDLibrary *a1, void *a2)
{
  *((void *)a1 + 3) = 1;
  *((void *)a1 + 4) = a2;
  return 1;
}

uint64_t GLRSamplerResource::dealloc(id *this)
{
  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLRSamplerResource::testIdle(GLRSamplerResource *this)
{
  return 1;
}

void GLRTextureViewResource::~GLRTextureViewResource(GLRTextureViewResource *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t GLRTextureViewResource::testIdle(id *this)
{
  return [this[4] isComplete];
}

uint64_t GLRTextureViewResource::waitIdle(id *this, GLDShareGroupRec *a2)
{
  return [this[4] waitUntilComplete];
}

void GLRTextureResource::GLRTextureResource(GLRTextureResource *this)
{
  GLDObject::GLDObject(this);
  void *v1 = &unk_26F4D68A0;
}

uint64_t GLRTextureResource::testIdle(id *this)
{
  return [this[4] isComplete];
}

uint64_t GLRTextureResource::waitIdle(id *this, GLDShareGroupRec *a2)
{
  return [this[4] waitUntilComplete];
}

uint64_t GLRTextureResource::setBaseLevelMaxLevel(uint64_t this, int a2, int a3)
{
  if (*(_DWORD *)(this + 48) != a2)
  {
    *(_DWORD *)(this + 48) = a2;
    *(unsigned char *)(this + 56) = 1;
  }
  if (*(_DWORD *)(this + 52) != a3)
  {
    *(_DWORD *)(this + 52) = a3;
    *(unsigned char *)(this + 56) = 1;
  }
  return this;
}

uint64_t GLRTextureResource::setSwizzleKey(uint64_t this, int a2)
{
  if (*(_DWORD *)(this + 60) != a2)
  {
    *(_DWORD *)(this + 60) = a2;
    *(unsigned char *)(this + 56) = 1;
  }
  return this;
}

void GLRTextureResource::updateSampleViewIfNeeded(GLRTextureResource *this, MTLPixelFormat a2, MTLTextureType a3, _NSRange a4)
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = *((void *)this + 5);
  if (v9)
  {
    if (!*((unsigned char *)this + 56)) {
      return;
    }
    (*(void (**)(uint64_t))(*(void *)v9 + 24))(v9);
    *((void *)this + 5) = 0;
  }
  GLDObject::operator new((GLDObject *)0x28);
  uint64_t v11 = v10;
  GLDObject::GLDObject(v10);
  *(void *)uint64_t v11 = &unk_26F4D6858;
  *((void *)this + 5) = v11;
  uint64_t v13 = *((unsigned int *)this + 12);
  unsigned int v12 = *((_DWORD *)this + 13);
  BOOL v14 = v12 >= v13;
  int v15 = v12 - v13;
  if (v14) {
    uint64_t v16 = (v15 + 1);
  }
  else {
    uint64_t v16 = 1;
  }
  if (v16 + v13 > (unint64_t)[*((id *)this + 4) mipmapLevelCount]) {
    uint64_t v16 = [*((id *)this + 4) mipmapLevelCount] - *((unsigned int *)this + 12);
  }
  if (a2 - 221 >= 0x10) {
    MTLPixelFormat v17 = a2;
  }
  else {
    MTLPixelFormat v17 = a2 - 18;
  }
  if (*((unsigned char *)this + 57)) {
    a2 = v17;
  }
  if (!*((_DWORD *)this + 12)
    && v16 == [*((id *)this + 4) mipmapLevelCount]
    && (int v18 = *((_DWORD *)this + 15), v18 == [*((id *)this + 4) swizzleKey])
    && [*((id *)this + 4) pixelFormat] == a2)
  {
    int v20 = (void *)*((void *)this + 4);
    int v19 = (GLDLibrary *)*((void *)this + 5);
    GLDLibrary::getAllDisplayMask(v19);
    *((void *)v19 + 3) = 1;
    *((void *)v19 + 4) = v20;
  }
  else
  {
    int v21 = objc_msgSend(*((id *)this + 4), "newTextureViewWithPixelFormat:textureType:levels:slices:swizzle:", a2, a3, *((unsigned int *)this + 12), v16, location, length, MTLTextureSwizzleKeyToChannels());
    [v21 setLabel:*MEMORY[0x263F12C98]];
    int v22 = (GLDLibrary *)*((void *)this + 5);
    GLDLibrary::getAllDisplayMask(v22);
    *((void *)v22 + 3) = 1;
    *((void *)v22 + 4) = v21;
  }
  *((unsigned char *)this + 56) = 0;
}

void sub_2406E4020(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

void GLRResourceList::GLRResourceList(GLRResourceList *this)
{
  GLDObject::GLDObject(this);
  void *v1 = &unk_26F4D6960;
}

void GLRResourceList::~GLRResourceList(GLRResourceList *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t GLRResourceList::initWithCapacity(GLRResourceList *this, unsigned int a2)
{
  GLDLibrary::getAllDisplayMask(this);
  *(void *)&long long v4 = -1;
  *((void *)&v4 + 1) = -1;
  *(_OWORD *)((char *)this + 12) = v4;
  *(_OWORD *)((char *)this + 28) = v4;
  *(_OWORD *)((char *)this + 44) = v4;
  *(_OWORD *)((char *)this + 60) = v4;
  *(_OWORD *)((char *)this + 76) = v4;
  *(_OWORD *)((char *)this + 92) = v4;
  *(_OWORD *)((char *)this + 108) = v4;
  *(_OWORD *)((char *)this + 124) = v4;
  *((_DWORD *)this + 36) = a2;
  *((void *)this + 20) = malloc_type_malloc((unint64_t)a2 << 6, 0x102004061925B30uLL);
  *((void *)this + 22) = 0x20000000000;
  *((void *)this + 21) = malloc_type_realloc(*((void **)this + 21), 0x1000uLL, 0x2004093837F09uLL);
  return 1;
}

uint64_t GLRResourceList::releaseToPool(GLRResourceList *this)
{
  uint64_t v1 = this;
  uint64_t v2 = *((void *)this + 23);
  if (v2)
  {
    *((void *)this + 23) = 0;
    _os_nospin_lock_lock();
    *((void *)v1 + 24) = 0;
    uint64_t v3 = *(GLRResourceList ***)(v2 + 24);
    *((void *)v1 + 25) = v3;
    *uint64_t v3 = v1;
    *(void *)(v2 + 24) = (char *)v1 + 192;
    ++*(_DWORD *)(v2 + 36);
    _os_nospin_lock_unlock();
    uint64_t v1 = (GLRResourceList *)v2;
  }
  long long v4 = *(uint64_t (**)(GLRResourceList *))(*(void *)v1 + 24);

  return v4(v1);
}

uint64_t GLRResourceList::addResource(uint64_t this, uint64_t a2)
{
  uint64_t v3 = this;
  uint64_t v4 = this + 2 * (((unint64_t)a2 >> 6) & 0x3F);
  unsigned int v7 = *(unsigned __int16 *)(v4 + 12);
  id v6 = (_WORD *)(v4 + 12);
  uint64_t v5 = v7;
  if (v7 == 0xFFFFLL)
  {
LABEL_15:
    unsigned int v19 = *(_DWORD *)(this + 140);
    if (v19 >= 0xFFFE) {
      abort();
    }
    uint64_t v20 = *(unsigned int *)(this + 144);
    if (v19 >= v20)
    {
      *(_DWORD *)(this + 144) = 2 * v20;
      *(void *)(this + 160) = malloc_type_realloc(*(void **)(this + 160), v20 << 7, 0x102004061925B30uLL);
      unsigned int v19 = *(_DWORD *)(v3 + 140);
    }
    *(_DWORD *)(v3 + 140) = v19 + 1;
    (*(void (**)(uint64_t))(*(void *)a2 + 16))(a2);
    this = GLRResource::incrementUsage(a2);
    uint64_t v21 = *(void *)(v3 + 160);
    *(void *)(v3 + 152) += *(void *)(a2 + 24);
    *(void *)(v21 + ((unint64_t)(unsigned __int16)v19 << 6)) = a2;
    unint64_t v22 = *(void *)(v3 + 160) + ((unint64_t)(unsigned __int16)v19 << 6);
    *(_WORD *)(v22 + 60) = 1;
    *(_WORD *)(v22 + 62) = *v6;
    _WORD *v6 = v19;
  }
  else
  {
    uint64_t v8 = *(void *)(this + 160);
    uint64_t v9 = v8 + (v5 << 6);
    uint64_t v10 = *(unsigned __int16 *)(v9 + 60);
    if (*(_WORD *)(v9 + 60))
    {
      uint64_t v11 = *(unsigned __int16 *)(v9 + 60);
      unsigned int v12 = (GLRResource **)(v8 + (v5 << 6));
      while (*v12 != (GLRResource *)a2)
      {
        ++v12;
        if (!--v11) {
          goto LABEL_6;
        }
      }
    }
    else
    {
LABEL_6:
      for (uint64_t i = v8 + (v5 << 6); ; uint64_t i = v8 + ((unint64_t)v14 << 6))
      {
        unsigned int v16 = *(unsigned __int16 *)(i + 62);
        int v15 = (_WORD *)(i + 62);
        unsigned int v14 = v16;
        if (v10 <= 6 && v14 == 0xFFFF)
        {
          (*(void (**)(uint64_t))(*(void *)a2 + 16))(a2);
          this = GLRResource::incrementUsage(a2);
          *(void *)(v3 + 152) += *(void *)(a2 + 24);
          *(void *)(v9 + 8 * v10) = a2;
          *(_WORD *)(v9 + 60) = v10 + 1;
          return this;
        }
        if (v14 == 0xFFFF) {
          goto LABEL_15;
        }
        if (*(_WORD *)(v9 + 60)) {
          break;
        }
LABEL_14:
        ;
      }
      uint64_t v17 = *(unsigned __int16 *)(v9 + 60);
      int v18 = (GLRResource **)(v8 + (v5 << 6));
      while (*v18 != (GLRResource *)a2)
      {
        ++v18;
        if (!--v17) {
          goto LABEL_14;
        }
      }
      uint64_t v23 = v8 + ((unint64_t)v14 << 6);
      *int v15 = *(_WORD *)(v23 + 62);
      *(_WORD *)(v23 + 62) = v5;
      _WORD *v6 = v14;
    }
  }
  return this;
}

uint64_t GLDSamplerRec::initWithShareGroup(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  GLDLibrary::getAllDisplayMask((GLDLibrary *)a1);
  *(void *)(a1 + 16) = a2;
  *(void *)(a1 + 24) = a3;
  *(void *)(a1 + 32) = a4;
  int v8 = *(_DWORD *)(a2 + 28) + 1;
  *(_DWORD *)(a2 + 28) = v8;
  *(_DWORD *)(a1 + 12) = v8;
  id v9 = objc_alloc_init(MEMORY[0x263F129F8]);
  *(void *)(a1 + 48) = v9;
  [v9 setLabel:*MEMORY[0x263F12C98]];
  return 1;
}

uint64_t GLDSamplerRec::dealloc(GLDSamplerRec *this)
{
  uint64_t v2 = *((void *)this + 5);
  if (v2) {
    (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
  }

  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLDSamplerRec::update(GLDSamplerRec *this)
{
  uint64_t v3 = (float *)*((void *)this + 3);
  int v4 = *(unsigned __int16 *)v3;
  int v5 = *((unsigned __int16 *)v3 + 1);
  if (v4 == 35416 || v5 == 35416)
  {
    LOWORD(v5) = -30120;
    LOWORD(v4) = -30120;
  }
  if ((unsigned __int16)v4 <= 0x26FFu)
  {
    if ((unsigned __int16)v4 == 9728)
    {
      uint64_t v1 = 0;
      uint64_t v7 = 0;
    }
    else
    {
      if ((unsigned __int16)v4 != 9729) {
        goto LABEL_50;
      }
      uint64_t v1 = 0;
LABEL_15:
      uint64_t v7 = 1;
    }
  }
  else
  {
    switch((__int16)v4)
    {
      case 9984:
        uint64_t v7 = 0;
        uint64_t v1 = 1;
        break;
      case 9985:
        uint64_t v1 = 1;
        goto LABEL_15;
      case 9986:
        uint64_t v7 = 0;
        goto LABEL_18;
      case 9987:
        uint64_t v7 = 1;
LABEL_18:
        uint64_t v1 = 2;
        break;
      default:
        if ((unsigned __int16)v4 != 35416) {
          goto LABEL_50;
        }
        uint64_t v1 = 0;
        uint64_t v7 = 2;
        break;
    }
  }
  if ((unsigned __int16)v5 == 9728)
  {
    uint64_t v8 = 0;
  }
  else
  {
    if ((unsigned __int16)v5 != 35416)
    {
      if ((unsigned __int16)v5 == 9729)
      {
        uint64_t v8 = 1;
        goto LABEL_26;
      }
      MTLReleaseAssertionFailure();
LABEL_50:
      uint64_t v21 = (_Unwind_Exception *)MTLReleaseAssertionFailure();
      GLDObject::operator delete((void *)v1);
      _Unwind_Resume(v21);
    }
    uint64_t v8 = 2;
  }
LABEL_26:
  [*((id *)this + 6) setMinFilter:v7];
  [*((id *)this + 6) setMagFilter:v8];
  [*((id *)this + 6) setMipFilter:v1];
  uint64_t MetalWrapMode = getMetalWrapMode(*((unsigned __int16 *)v3 + 4));
  uint64_t v10 = getMetalWrapMode(*((unsigned __int16 *)v3 + 5));
  uint64_t v11 = getMetalWrapMode(*((unsigned __int16 *)v3 + 6));
  [*((id *)this + 6) setSAddressMode:MetalWrapMode];
  [*((id *)this + 6) setTAddressMode:v10];
  [*((id *)this + 6) setRAddressMode:v11];
  float v12 = v3[4];
  if (v12 >= 0x10)
  {
    [*((id *)this + 6) setMaxAnisotropy:16];
LABEL_38:
    atomic_fetch_or((atomic_ullong *volatile)(*(void *)(*((void *)this + 2) + 224) + 536), 0x20000uLL);
    goto LABEL_39;
  }
  if (v12 <= 1.0)
  {
    int v14 = 0;
  }
  else if (v12 <= 2.0)
  {
    int v14 = 1;
  }
  else if (v12 <= 4.0)
  {
    int v14 = 2;
  }
  else if (v12 > 8.0)
  {
    int v14 = 4;
  }
  else
  {
    int v14 = 3;
  }
  [*((id *)this + 6) setMaxAnisotropy:(1 << v14)];
  if (v14) {
    goto LABEL_38;
  }
LABEL_39:
  *(float *)&double v13 = v3[5];
  if (*(float *)&v13 < 0.0) {
    *(float *)&double v13 = 0.0;
  }
  [*((id *)this + 6) setLodMinClamp:v13];
  *(float *)&double v15 = v3[6];
  if (*(float *)&v15 < 0.0) {
    *(float *)&double v15 = 0.0;
  }
  [*((id *)this + 6) setLodMaxClamp:v15];
  if (*((unsigned __int16 *)v3 + 3) == 34894)
  {
    [*((id *)this + 6) setCompareFunction:*((unsigned __int16 *)v3 + 2) - 512];
    atomic_fetch_or((atomic_ullong *volatile)(*(void *)(*((void *)this + 2) + 224) + 536), 0x10000uLL);
  }
  else
  {
    [*((id *)this + 6) setCompareFunction:0];
  }
  uint64_t v16 = *((void *)this + 5);
  if (v16)
  {
    (*(void (**)(uint64_t))(*(void *)v16 + 24))(v16);
    *((void *)this + 5) = 0;
  }
  GLDObject::operator new((GLDObject *)0x28);
  int v18 = v17;
  GLRSamplerResource::GLRSamplerResource(v17);
  *((void *)this + 5) = v18;
  unsigned int v19 = (void *)[*(id *)(*((void *)this + 2) + 232) newSamplerStateWithDescriptor:*((void *)this + 6)];
  GLRSamplerResource::initWithMetalSampler(*((GLDLibrary **)this + 5), v19);

  return 1;
}

uint64_t getMetalWrapMode(int a1)
{
  if (a1 > 33647)
  {
    if (a1 == 33648) {
      return 3;
    }
    if (a1 == 37905) {
      return 4;
    }
  }
  else
  {
    if (a1 == 10497) {
      return 2;
    }
    if (a1 == 33071) {
      return 0;
    }
  }
  uint64_t v2 = MTLReleaseAssertionFailure();
  return gldDestroySampler(v2, v3);
}

uint64_t gldDestroySampler(uint64_t a1, atomic_uint *this)
{
  if (*(_DWORD *)(a1 + 248)) {
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 256));
  }
  if (this) {
    GLDObject::release(this);
  }
  if (*(_DWORD *)(a1 + 248)) {
    pthread_mutex_unlock((pthread_mutex_t *)(a1 + 256));
  }
  return 0;
}

void GLDShareGroupRec::~GLDShareGroupRec(GLDShareGroupRec *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t GLDShareGroupRec::initWithDevice(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(void *)(a1 + 224) = a2;
  GLDObject::retain(a2);
  *(void *)(a1 + 216) = a3;
  *(void *)(a1 + 232) = *(id *)(a2 + 24);
  *(void *)(a1 + 256) = 850045863;
  *(_OWORD *)(a1 + 264) = 0u;
  *(_OWORD *)(a1 + 280) = 0u;
  *(_OWORD *)(a1 + 296) = 0u;
  *(void *)(a1 + 312) = 0;
  *(void *)(a1 + 320) = 850045863;
  *(_OWORD *)(a1 + 328) = 0u;
  *(_OWORD *)(a1 + 344) = 0u;
  *(_OWORD *)(a1 + 360) = 0u;
  *(void *)(a1 + 376) = 0;
  *(void *)(a1 + 384) = 1018212795;
  *(_OWORD *)(a1 + 392) = 0u;
  *(_OWORD *)(a1 + 408) = 0u;
  *(void *)(a1 + 424) = 0;
  *(void *)(a1 + 432) = glgCreateProcessor();
  return 1;
}

uint64_t GLDShareGroupRec::dealloc(GLDShareGroupRec *this)
{
  glgDestroyProcessor();

  GLDObject::release(*((atomic_uint **)this + 28));
  uint64_t v2 = 0;
  char v3 = 1;
  do
  {
    char v4 = v3;
    int v5 = (char *)this + 88 * v2;
    for (uint64_t i = 40; i != 128; i += 8)
    {
      uint64_t v7 = *(atomic_uint **)&v5[i];
      if (v7) {
        GLDObject::release(v7);
      }
    }
    char v3 = 0;
    uint64_t v2 = 1;
  }
  while ((v4 & 1) != 0);

  return GLDObject::dealloc((uint64_t)this);
}

uint64_t GLDShareGroupRec::contextRetain(pthread_mutex_t *this)
{
  uint64_t v2 = this + 4;
  pthread_mutex_lock(this + 4);
  GLDObject::retain((uint64_t)this);
  if (*(int *)this->__opaque >= 3) {
    *(_DWORD *)&this[3].__opaque[48] = 1;
  }

  return pthread_mutex_unlock(v2);
}

GLDObject *GLDShareGroupRec::createZeroTexture(GLDShareGroupRec *this, int a2, int a3)
{
  if (a3 == 10)
  {
    unsigned int v11 = 15;
    int v7 = 1;
    unsigned int v9 = 6;
    char v8 = 2;
    BOOL v10 = 1;
  }
  else
  {
    if (a3) {
      int v6 = 1;
    }
    else {
      int v6 = 6;
    }
    if (a3 == 2) {
      int v7 = 1;
    }
    else {
      int v7 = v6;
    }
    char v8 = 0;
    unsigned int v9 = 1;
    BOOL v10 = a3 != 2;
    if (a3 == 2) {
      unsigned int v11 = 1;
    }
    else {
      unsigned int v11 = 15;
    }
  }
  v33 = 0;
  uint64_t v12 = 32 * v7 * v11 + 264;
  double v13 = (char *)malloc_type_calloc(1uLL, v12 + 4 * v9 + 24, 0x18477F53uLL);
  uint64_t v14 = (uint64_t)v13;
  uint64_t v15 = 0;
  uint64_t v16 = (uint64_t)&v13[v12];
  uint64_t v17 = (uint64_t)&v13[v12 + 24];
  do
  {
    *(_DWORD *)(v17 + v15) = -16777216;
    v15 += 4;
  }
  while (4 * v9 != v15);
  *(_WORD *)double v13 = a3 & 0xF | 0x1000;
  *((_WORD *)v13 + 3) = 1028;
  *((_DWORD *)v13 + 2) = 1065353216;
  if (a2) {
    __int16 v18 = 6402;
  }
  else {
    __int16 v18 = 6408;
  }
  *((_WORD *)v13 + 2) = v18;
  char v19 = v13[24] & 0xE3 | 0xC;
  *((void *)v13 + 4) = 0;
  *((void *)v13 + 5) = 0;
  v13[24] = v19;
  *((_DWORD *)v13 + 38) = 687941889;
  *((_WORD *)v13 + 78) = 10497;
  *((_OWORD *)v13 + 10) = xmmword_2406F5340;
  *((void *)v13 + 18) = 0x20326002600;
  *(void *)(v13 + 116) = 0x3E800000000;
  *((_DWORD *)v13 + 31) = 0;
  v13[130] &= 0xFAu;
  *((_DWORD *)v13 + 28) = 420054461;
  *((_DWORD *)v13 + 33) = 0;
  __int16 v20 = *((_WORD *)v13 + 64) & 0xF000;
  *((void *)v13 + 17) = 0;
  *((_WORD *)v13 + 64) = v20 | 0x688;
  switch(a3)
  {
    case 1:
      __int16 v21 = *((_WORD *)v13 + 107);
      char v22 = 20;
      goto LABEL_26;
    case 2:
    case 8:
      __int16 v21 = *((_WORD *)v13 + 107);
      char v22 = 5;
      goto LABEL_26;
    case 4:
      __int16 v23 = *((_WORD *)v13 + 107) & 0xC0FF;
      break;
    case 5:
    case 10:
      __int16 v21 = *((_WORD *)v13 + 107);
      char v22 = 36;
      goto LABEL_26;
    case 6:
      __int16 v23 = *((_WORD *)v13 + 107) & 0xC0FF | 0x2000;
      break;
    case 7:
      __int16 v23 = *((_WORD *)v13 + 107) & 0xC0FF | 0x100;
      break;
    case 9:
      __int16 v21 = *((_WORD *)v13 + 107);
      char v22 = 37;
LABEL_26:
      __int16 v23 = v21 & 0xC0FF | ((v22 & 0x3F) << 8);
      break;
    default:
      __int16 v23 = *((_WORD *)v13 + 107) & 0xC0FF | 0x400;
      break;
  }
  uint64_t v24 = 0;
  v13[211] = v7;
  v13[213] = v11;
  *((_DWORD *)v13 + 50) = -2090368799;
  *((_WORD *)v13 + 98) = 1;
  *((_WORD *)v13 + 99) = v9;
  *((_WORD *)v13 + 107) = v23 & 0xBF00 | 0x4000;
  *((_DWORD *)v13 + 48) = 98392;
  *((_WORD *)v13 + 102) = 0;
  if (v11 <= 2) {
    uint64_t v25 = 2;
  }
  else {
    uint64_t v25 = v11;
  }
  v13[206] = v8;
  *(_DWORD *)(v13 + 207) = 0x10000;
  *(unsigned char *)(v16 + 20) = -113;
  unsigned int v26 = v13 + 314;
  uint64_t v27 = v25 - 1;
  *(void *)(v16 + 8) = -1;
  *(_DWORD *)(v16 + 16) = -1;
  do
  {
    uint64_t v28 = v14 + 480 * v24;
    *(_DWORD *)(v28 + 268) = 65537;
    *(_WORD *)(v28 + 272) = v9;
    *(void *)(v28 + 288) = v17;
    *(void *)(v28 + 276) = 0x836780E100010001;
    *(unsigned char *)(v28 + 275) = 48;
    uint64_t v29 = v14 + 2 * v24;
    *(_WORD *)(v29 + 216) |= 1u;
    *(_WORD *)(v29 + 228) |= 1u;
    if (v10)
    {
      uint64_t v30 = v27;
      v31 = v26;
      do
      {
        *(_DWORD *)(v31 - 2) = 335616264;
        v31 += 32;
        --v30;
      }
      while (v30);
    }
    ++v24;
    v26 += 480;
  }
  while (v24 != v7);
  gldCreateTexture((uint64_t)this, &v33, v14, v16);
  uint64_t result = v33;
  *((void *)v33 + 2) = v14;
  return result;
}

uint64_t gldCreateShareGroup(uint64_t a1, GLDObject **a2, uint64_t a3)
{
  GLDObject::operator new((GLDObject *)0x1C0);
  int v7 = v6;
  GLDObject::GLDObject(v6);
  *(void *)int v7 = &unk_26F4D6A00;
  GLDShareGroupRec::initWithDevice((uint64_t)v7, a1, a3);
  *a2 = v7;
  return 0;
}

void sub_2406E4F00(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t gldDestroyShareGroup(atomic_uint *a1)
{
  if (a1) {
    GLDObject::release(a1);
  }
  return 0;
}

uint64_t GLDShareGroupRec::signalUsage(GLDShareGroupRec *this)
{
  uint64_t v2 = (pthread_mutex_t *)((char *)this + 320);
  pthread_mutex_lock((pthread_mutex_t *)this + 5);
  pthread_cond_broadcast((pthread_cond_t *)this + 8);

  return pthread_mutex_unlock(v2);
}

uint64_t GLDShareGroupRec::waitUsage(GLDShareGroupRec *this, volatile int *a2)
{
  char v4 = (pthread_mutex_t *)((char *)this + 320);
  pthread_mutex_lock((pthread_mutex_t *)this + 5);
  while (*a2)
  {
    *((_DWORD *)this + 8) |= 0x8000u;
    pthread_cond_wait((pthread_cond_t *)this + 8, v4);
  }

  return pthread_mutex_unlock(v4);
}

uint64_t GLDShareGroupRec::waitForObject(GLDShareGroupRec *this, int a2, unsigned int a3, GLDTextureRec *a4)
{
  char v4 = a4;
  if (!a2) {
    goto LABEL_10;
  }
  if (a2 != 1)
  {
    if (a2 != 3) {
      return 0;
    }
    uint64_t MemoryPlugin = GLDBufferRec::getMemoryPlugin(a4);
    if (!MemoryPlugin) {
      return 0;
    }
    char v4 = *(GLDTextureRec **)(MemoryPlugin + 24);
    if (!v4) {
      return 0;
    }
LABEL_10:
    (*(void (**)(GLDTextureRec *, GLDShareGroupRec *))(*(void *)v4 + 40))(v4, this);
    return 0;
  }
  uint64_t TextureResource = GLDTextureRec::getTextureResource(a4, 0);
  if (TextureResource) {
    (*(void (**)(uint64_t, GLDShareGroupRec *))(*(void *)TextureResource + 40))(TextureResource, this);
  }
  char v4 = (GLDTextureRec *)GLDTextureRec::getTextureResource(v4, 1u);
  if (v4) {
    goto LABEL_10;
  }
  return 0;
}

uint64_t gldWaitForObject(GLDShareGroupRec *a1, int a2, unsigned int a3, GLDTextureRec *a4)
{
  return 0;
}

void GLDTextureRec::~GLDTextureRec(GLDTextureRec *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t glrConvertMultisampleCount(unsigned int a1)
{
  if (a1 == 2) {
    unsigned int v1 = 2;
  }
  else {
    unsigned int v1 = 4 * (a1 < 5);
  }
  if (a1 >= 2) {
    return v1;
  }
  else {
    return 1;
  }
}

uint64_t GLDTextureRec::dealloc(GLDTextureRec *this)
{
  uint64_t v2 = *((void *)this + 17);
  if (v2)
  {
    dispatch_release(v2);
    *((void *)this + 17) = 0;
  }
  for (uint64_t i = 152; i != 184; i += 8)
  {
    uint64_t v4 = *(void *)((char *)this + i);
    if (v4)
    {
      [*(id *)(v4 + 32) waitUntilComplete];
      (*(void (**)(void))(**(void **)((char *)this + i) + 24))(*(void *)((char *)this + i));
    }
  }
  uint64_t v5 = *((void *)this + 3);
  if (v5) {
    (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
  }

  uint64_t v6 = *((void *)this + 24);
  if (v6) {
    (*(void (**)(uint64_t))(*(void *)v6 + 24))(v6);
  }
  uint64_t v7 = *((void *)this + 4);
  if (v7) {
    (*(void (**)(uint64_t))(*(void *)v7 + 24))(v7);
  }
  uint64_t v8 = *((void *)this + 23);
  if (v8) {
    (*(void (**)(uint64_t))(*(void *)v8 + 24))(v8);
  }
  unsigned int v9 = (void *)*((void *)this + 2);
  if (v9) {
    free(v9);
  }

  return GLDObject::dealloc((uint64_t)this);
}

BOOL GLDTextureRec::load(GLDTextureRec *this)
{
  uint64_t v1 = *((void *)this + 7);
  unsigned int v2 = *(unsigned __int8 *)(v1 + 20);
  if (!*(unsigned char *)(v1 + 20)) {
    return v2 == 0;
  }
  uint64_t v4 = *((void *)this + 5);
  if (!*(_DWORD *)(v4 + 248))
  {
    int v7 = *(_DWORD *)(v4 + 24) + 1;
    *(_DWORD *)(v4 + 24) = v7;
    *((_DWORD *)this + 3) = v7;
LABEL_6:
    if (GLDTextureRec::update(this, v2, (unsigned __int16 *)(v1 + 8)))
    {
      uint64_t v8 = *((void *)this + 7);
      *(void *)(v8 + 13) = 0;
      *(void *)(v8 + 8) = 0;
      GLDDeviceRec::telemetryTexture(*(void *)(*((void *)this + 5) + 224), this);
      unsigned int v2 = 0;
    }
    goto LABEL_8;
  }
  pthread_mutex_lock((pthread_mutex_t *)(v4 + 256));
  uint64_t v1 = *((void *)this + 7);
  unsigned int v2 = *(unsigned __int8 *)(v1 + 20);
  uint64_t v5 = *((void *)this + 5);
  int v6 = *(_DWORD *)(v5 + 24) + 1;
  *(_DWORD *)(v5 + 24) = v6;
  *((_DWORD *)this + 3) = v6;
  if (v2) {
    goto LABEL_6;
  }
LABEL_8:
  uint64_t v9 = *((void *)this + 5);
  if (*(_DWORD *)(v9 + 248)) {
    pthread_mutex_unlock((pthread_mutex_t *)(v9 + 256));
  }
  return v2 == 0;
}

uint64_t GLDTextureRec::reclaim(GLDTextureRec *this)
{
  uint64_t v2 = *((void *)this + 3);
  if (v2)
  {
    uint64_t v3 = *((void *)this + 5);
    if (!*(_DWORD *)(v3 + 248)
      || (pthread_mutex_lock((pthread_mutex_t *)(v3 + 256)), (uint64_t v2 = *((void *)this + 3)) != 0))
    {
      (*(void (**)(uint64_t))(*(void *)v2 + 24))(v2);
      *((void *)this + 3) = 0;
    }
    uint64_t v4 = *((void *)this + 4);
    if (v4)
    {
      (*(void (**)(uint64_t))(*(void *)v4 + 24))(v4);
      *((void *)this + 4) = 0;
    }
    uint64_t v5 = *((void *)this + 5);
    if (*(_DWORD *)(v5 + 248)) {
      pthread_mutex_unlock((pthread_mutex_t *)(v5 + 256));
    }
  }
  uint64_t result = *((void *)this + 24);
  if (result)
  {
    uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 24))(result);
    *((void *)this + 24) = 0;
  }
  *(unsigned char *)(*((void *)this + 7) + 20) = 15;
  return result;
}

uint64_t GLDTextureRec::modify(GLDTextureRec *this)
{
  *(unsigned char *)(*((void *)this + 7) + 20) |= 2u;
  if (*((void *)this + 3))
  {
    uint64_t v2 = *((void *)this + 5);
    if (!*(_DWORD *)(v2 + 248) || (pthread_mutex_lock((pthread_mutex_t *)(v2 + 256)), *((void *)this + 3)))
    {
      uint64_t v3 = 0;
      uint64_t v4 = (char *)this + 152;
      do
      {
        uint64_t v5 = *(void *)&v4[v3];
        if (v5)
        {
          (*(void (**)(uint64_t))(*(void *)v5 + 24))(v5);
          *(void *)&v4[v3] = 0;
        }
        v3 += 8;
      }
      while (v3 != 32);
      (*(void (**)(void))(**((void **)this + 3) + 24))(*((void *)this + 3));
      *((void *)this + 3) = 0;
    }
    uint64_t v6 = *((void *)this + 4);
    if (v6)
    {
      (*(void (**)(uint64_t))(*(void *)v6 + 24))(v6);
      *((void *)this + 4) = 0;
    }
    uint64_t v7 = *((void *)this + 5);
    if (*(_DWORD *)(v7 + 248)) {
      pthread_mutex_unlock((pthread_mutex_t *)(v7 + 256));
    }
  }
  uint64_t v8 = *((void *)this + 24);
  if (v8)
  {
    (*(void (**)(uint64_t))(*(void *)v8 + 24))(v8);
    *((void *)this + 24) = 0;
  }
  return 0;
}

uint64_t GLDTextureRec::restoreData(GLDTextureRec *this, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  int v14 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN13GLDTextureRec11restoreDataEii_block_invoke;
  block[3] = &unk_2650D0BD0;
  block[4] = &v11;
  void block[5] = this;
  int v9 = a2;
  int v10 = a3;
  uint64_t v5 = *((void *)this + 17);
  if (v5) {
    dispatch_sync(v5, block);
  }
  else {
    ___ZN13GLDTextureRec11restoreDataEii_block_invoke((uint64_t)block, a2, a3, a4, a5);
  }
  uint64_t v6 = *((unsigned int *)v12 + 6);
  _Block_object_dispose(&v11, 8);
  return v6;
}

void sub_2406E5644(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN13GLDTextureRec11restoreDataEii_block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  uint64_t v5 = result;
  uint64_t v6 = *(GLDTextureRec **)(result + 40);
  uint64_t v7 = *((void *)v6 + 5);
  if (*(_DWORD *)(v7 + 248)) {
    uint64_t result = pthread_mutex_lock((pthread_mutex_t *)(v7 + 256));
  }
  if (*((void *)v6 + 3))
  {
    uint64_t result = GLDTextureRec::readTextureDataInternal(v6, *(_DWORD *)(v5 + 48), *(_DWORD *)(v5 + 52), a4, a5, *(void **)(*((void *)v6 + 6) + 480 * *(int *)(v5 + 48) + 32 * *(int *)(v5 + 52) + 288));
    *(_DWORD *)(*(void *)(*(void *)(v5 + 32) + 8) + 24) = 0;
  }
  uint64_t v8 = *((void *)v6 + 5);
  *(_DWORD *)(v8 + 32) |= 1u;
  if (*(_DWORD *)(v8 + 248))
  {
    return pthread_mutex_unlock((pthread_mutex_t *)(v8 + 256));
  }
  return result;
}

uint64_t GLDTextureRec::updatePixelFormat(GLDTextureRec *this)
{
  uint64_t v2 = (_WORD *)*((void *)this + 6);
  unsigned int v3 = (unsigned __int16)v2[96];
  unsigned int v4 = (unsigned __int16)v2[100];
  if (v4 == 5 || v4 == 3)
  {
    unsigned int v4 = (unsigned __int16)v2[140];
    uint64_t v6 = v2 + 141;
  }
  else
  {
    uint64_t v6 = v2 + 101;
  }
  uint64_t v7 = 0;
  unsigned int v8 = *v6;
  BOOL v9 = v3 == 35056 || v3 == 36013;
  if (v9) {
    int v10 = 2;
  }
  else {
    int v10 = 1;
  }
  char v11 = v9;
  *((_DWORD *)this + 19) = v10;
  *((unsigned char *)this + 72) = v11;
  *((unsigned char *)this + 73) = (*v2 & 0x800) != 0;
  *((void *)this + 8) = 0;
  do
  {
    uint64_t result = GLDTextureRec::chooseTextureFormat(this, v4, v8, v3, v7, *((unsigned char *)this + 73));
    *((_DWORD *)this + v7++ + 16) = result;
  }
  while (v7 < *((int *)this + 19));
  *((unsigned char *)this + 75) = 0;
  return result;
}

uint64_t GLDTextureRec::getMetalSwizzleKey(GLDTextureRec *this)
{
  unsigned int v1 = *((_DWORD *)this + 16);
  int v2 = (int)(&glrTextureFormats)[5 * v1 + 1];
  if (v2 == 34041 || v2 == 6402)
  {
    uint64_t v6 = *((void *)this + 6);
    int v4 = *(unsigned __int16 *)(v6 + 114);
    if (v4 == 6409)
    {
      int v5 = 16908802;
    }
    else
    {
      if (v4 != 6403) {
        goto LABEL_11;
      }
      int v5 = 16777218;
    }
    int v9 = v5;
    goto LABEL_11;
  }
  int v9 = (int)(&glrTextureFormats)[5 * v1 + 4];
  uint64_t v6 = *((void *)this + 6);
LABEL_11:
  __int16 v10 = 256;
  unint64_t v7 = *(unsigned __int16 *)(v6 + 128);
  return *((unsigned __int8 *)&v9 + (v7 & 7)) | (*((unsigned __int8 *)&v9 + ((v7 >> 3) & 7)) << 8) | (*((unsigned __int8 *)&v9 + ((v7 >> 6) & 7)) << 16) | (*((unsigned __int8 *)&v9 + ((v7 >> 9) & 7)) << 24);
}

void *GLDTextureRec::updateDescriptor(GLDTextureRec *this)
{
  if (!*((void *)this + 15)) {
    *((void *)this + 15) = objc_alloc_init(MEMORY[0x263F12A50]);
  }
  int v2 = *((_DWORD *)this + 19);
  if (v2 == 2)
  {
    if (!*((void *)this + 16)) {
      *((void *)this + 16) = objc_alloc_init(MEMORY[0x263F12A50]);
    }
  }
  else if (v2 == 1)
  {
    unsigned int v3 = (void *)*((void *)this + 16);
    if (v3)
    {

      *((void *)this + 16) = 0;
    }
  }
  uint64_t v4 = *((void *)this + 6);
  if (*(unsigned __int8 *)(v4 + 211) <= 1u)
  {
    if ((*(_WORD *)(v4 + 214) & 0x1800) != 0)
    {
      int v5 = 0;
      BOOL v6 = 0;
      BOOL v7 = 0;
      int v8 = 1;
      uint64_t v9 = 7;
    }
    else
    {
      unint64_t v10 = *(_WORD *)(v4 + 214) & 0x2000;
      if ((*(_WORD *)(v4 + 214) & 0x600) != 0)
      {
        if ((*(_WORD *)(v4 + 214) & 0x2000) != 0)
        {
          BOOL v6 = 0;
          BOOL v7 = 0;
          int v5 = 1;
          uint64_t v9 = 3;
        }
        else
        {
          int v5 = 0;
          BOOL v6 = 0;
          BOOL v7 = *(unsigned __int8 *)(v4 + 212) > 1u;
          if (*(unsigned __int8 *)(v4 + 212) <= 1u) {
            uint64_t v9 = 2;
          }
          else {
            uint64_t v9 = 4;
          }
        }
      }
      else
      {
        int v5 = 0;
        BOOL v7 = 0;
        BOOL v6 = v10 != 0;
        uint64_t v9 = v10 >> 13;
      }
      int v8 = 1;
    }
  }
  else
  {
    int v5 = 0;
    BOOL v6 = 0;
    BOOL v7 = 0;
    int v8 = 6;
    uint64_t v9 = 5;
  }
  *((void *)this + 11) = v9;
  unint64_t v11 = *(unsigned __int16 *)(v4 + 194);
  char v12 = *(unsigned char *)(v4 + 208);
  int v13 = *((_DWORD *)&glrTextureFormats + 10 * *((unsigned int *)this + 16) + 9);
  if ((v13 & 0x20) != 0) {
    uint64_t v14 = 1;
  }
  else {
    uint64_t v14 = *(unsigned __int8 *)(v4 + 209);
  }
  if (*(unsigned char *)(v4 + 208)) {
    unint64_t v11 = (v11 >> v12) | (v11 >> v12 == 0);
  }
  uint64_t v40 = v11;
  unint64_t v41 = v14;
  if (*(unsigned char *)(v4 + 208)) {
    unint64_t v15 = ((unint64_t)*(unsigned __int16 *)(v4 + 196) >> v12) | ((unint64_t)*(unsigned __int16 *)(v4 + 196) >> v12 == 0);
  }
  else {
    unint64_t v15 = *(unsigned __int16 *)(v4 + 196);
  }
  if (*(unsigned char *)(v4 + 208)) {
    unint64_t v16 = ((unint64_t)*(unsigned __int16 *)(v4 + 198) >> v12) | ((unint64_t)*(unsigned __int16 *)(v4 + 198) >> v12 == 0);
  }
  else {
    unint64_t v16 = *(unsigned __int16 *)(v4 + 198);
  }
  BOOL v17 = v5 == 0;
  if (v5) {
    uint64_t v18 = 1;
  }
  else {
    uint64_t v18 = v16;
  }
  uint64_t v39 = v18;
  if (v17) {
    uint64_t v19 = 1;
  }
  else {
    uint64_t v19 = *(unsigned __int16 *)(v4 + 198);
  }
  BOOL v20 = !v6;
  if (v6) {
    uint64_t v21 = 1;
  }
  else {
    uint64_t v21 = v15;
  }
  uint64_t v38 = v21;
  if (v20) {
    uint64_t v22 = v19;
  }
  else {
    uint64_t v22 = *(unsigned __int16 *)(v4 + 196);
  }
  int v37 = v22 * v8;
  if (v7)
  {
    unsigned int v23 = *(unsigned __int8 *)(v4 + 212);
    BOOL v24 = v23 >= 2;
    if (v23 == 2) {
      uint64_t v25 = 2;
    }
    else {
      uint64_t v25 = 4 * (v23 < 5);
    }
    if (v24) {
      uint64_t v26 = v25;
    }
    else {
      uint64_t v26 = 1;
    }
  }
  else
  {
    uint64_t v26 = 1;
  }
  if ((v13 & 0x100) != 0) {
    uint64_t v27 = 17;
  }
  else {
    uint64_t v27 = 1;
  }
  uint64_t v36 = v9;
  objc_msgSend(*((id *)this + 15), "setTextureType:");
  [*((id *)this + 15) setPixelFormat:(&glrTextureFormats)[5 * *((unsigned int *)this + 16) + 3]];
  [*((id *)this + 15) setWidth:v40];
  [*((id *)this + 15) setHeight:v38];
  [*((id *)this + 15) setDepth:v39];
  [*((id *)this + 15) setSampleCount:v26];
  [*((id *)this + 15) setArrayLength:v22];
  [*((id *)this + 15) setMipmapLevelCount:v41];
  [*((id *)this + 15) setWriteSwizzleEnabled:1];
  uint64_t v28 = &(&glrTextureFormats)[5 * *((unsigned int *)this + 16)];
  if (v28[3] == (char *)253) {
    uint64_t v29 = v27 & 0x10;
  }
  else {
    uint64_t v29 = v27;
  }
  if ((*((_DWORD *)v28 + 9) & 7) != 0) {
    uint64_t v30 = v29 | 4;
  }
  else {
    uint64_t v30 = v29;
  }
  [*((id *)this + 15) setUsage:v30];
  *((_DWORD *)this + 28) = v37;
  MTLGetTextureLevelInfoForDeviceWithOptions();
  *((void *)this + 12) = 0;
  [*((id *)this + 15) setSwizzleKey:GLDTextureRec::getMetalSwizzleKey(this)];
  uint64_t result = (void *)*((void *)this + 16);
  if (result)
  {
    [result setTextureType:v36];
    [*((id *)this + 16) setPixelFormat:(&glrTextureFormats)[5 * *((unsigned int *)this + 17) + 3]];
    [*((id *)this + 16) setWidth:v40];
    [*((id *)this + 16) setHeight:v38];
    [*((id *)this + 16) setDepth:v39];
    [*((id *)this + 16) setSampleCount:v26];
    [*((id *)this + 16) setArrayLength:v22];
    [*((id *)this + 16) setMipmapLevelCount:v41];
    [*((id *)this + 16) setWriteSwizzleEnabled:1];
    uint64_t v32 = &(&glrTextureFormats)[5 * *((unsigned int *)this + 17)];
    uint64_t v33 = v27;
    if (v32[3] == (char *)253) {
      uint64_t v33 = v27 & 0x10;
    }
    if ((*((_DWORD *)v32 + 9) & 7) != 0) {
      uint64_t v34 = v33 | 4;
    }
    else {
      uint64_t v34 = v33;
    }
    [*((id *)this + 16) setUsage:v34];
    uint64_t result = (void *)MTLGetTextureLevelInfoForDeviceWithOptions();
    unint64_t v35 = v42;
    if (v41 >= 2) {
      unint64_t v35 = 4 * v42 / 3;
    }
    *((void *)this + 13) = v35;
  }
  return result;
}

uint64_t GLDTextureRec::getTextureResource(GLDTextureRec *this, unsigned int a2)
{
  GLDTextureRec::ensureResource((uint64_t)this);
  if ((*(unsigned char *)(*((void *)this + 6) + 24) & 8) != 0) {
    return *((void *)this + a2 + 3);
  }
  uint64_t result = *((void *)this + 24);
  if (!result)
  {
    if (*(unsigned char *)(*((void *)this + 7) + 20)) {
      return *((void *)this + a2 + 3);
    }
    long long v20 = 0u;
    objc_msgSend(*((id *)this + 15), "pixelFormat", 0, 0, 0, 0, (unsigned __int128)0, 0);
    MTLPixelFormatGetInfoForDevice();
    uint64_t v5 = [*((id *)this + 15) width];
    unint64_t v6 = [*((id *)this + 15) sampleCount];
    BOOL v7 = (uint64_t *)&v20 + 1;
    if (v6 > 1) {
      BOOL v7 = &v21;
    }
    uint64_t v8 = *v7;
    uint64_t v9 = [*(id *)(*((void *)this + 5) + 232) deviceLinearTextureAlignmentBytes];
    uint64_t v10 = (v9 + v8 * v5 - 1) & -v9;
    uint64_t v11 = v10 * [*((id *)this + 15) height];
    uint64_t v12 = [*(id *)(*((void *)this + 5) + 232) newBufferWithLength:v11 options:32];
    if (v12)
    {
      int v13 = (void *)v12;
      [*((id *)this + 15) setStorageMode:2];
      uint64_t v14 = (void *)MEMORY[0x263F12C98];
      [v13 setLabel:*MEMORY[0x263F12C98]];
      unint64_t v15 = (void *)[v13 newLinearTextureWithDescriptor:*((void *)this + 15) offset:0 bytesPerRow:v10 bytesPerImage:v11];
      if (v15)
      {
        unint64_t v16 = v15;
        [v15 setLabel:*v14];
        GLDObject::operator new((GLDObject *)0x40);
        uint64_t v18 = v17;
        GLRTextureResource::GLRTextureResource(v17);
        if (GLRTextureResource::initWithMetalTexture(v18, v16, *((void *)this + 12)))
        {
          int MetalSwizzleKey = GLDTextureRec::getMetalSwizzleKey(this);
          GLRTextureResource::setSwizzleKey((uint64_t)v18, MetalSwizzleKey);
          GLRTextureResource::setBaseLevelMaxLevel((uint64_t)v18, *(_WORD *)(*((void *)this + 6) + 214) & 0xF, *(_WORD *)(*((void *)this + 6) + 214) >> 4);
          v22.NSUInteger length = *((unsigned int *)this + 28);
          v22.NSUInteger location = 0;
          GLRTextureResource::updateSampleViewIfNeeded(v18, (MTLPixelFormat)(&glrTextureFormats)[5 * *((unsigned int *)this + 16) + 3], *((MTLTextureType *)this + 11), v22);
          *((void *)this + 24) = v18;
        }
        else
        {
          (*(void (**)(GLRTextureResource *))(*(void *)v18 + 24))(v18);
        }
      }
    }
    uint64_t result = *((void *)this + 24);
    if (!result) {
      return *((void *)this + a2 + 3);
    }
  }
  return result;
}

void sub_2406E64E4(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLDTextureRec::getIOSurfaceResource(GLDTextureRec *this)
{
  uint64_t v1 = *((void *)this + 6);
  uint64_t v2 = *(void *)(v1 + 256);
  if (!v2) {
    return 0;
  }
  uint64_t v4 = *((void *)this + 24);
  if (v4)
  {
    (*(void (**)(uint64_t))(*(void *)v4 + 24))(v4);
    *((void *)this + 24) = 0;
    uint64_t v1 = *((void *)this + 6);
    uint64_t v2 = *(void *)(v1 + 256);
  }
  uint64_t v5 = 0;
  uint64_t v6 = v1 + 48;
  unsigned int v7 = -1;
  do
  {
    if (v2 == *(void *)(v6 + 8 * v5)) {
      unsigned int v7 = v5;
    }
    ++v5;
  }
  while (v5 != 4);
  if (*((void *)this + 3))
  {
    uint64_t v8 = 0;
    int v9 = 0;
    uint64_t v10 = (char *)this + 152;
    do
    {
      uint64_t v11 = *(void *)&v10[v8];
      if (v11)
      {
        uint64_t v12 = (__IOSurface *)[*(id *)(v11 + 32) iosurface];
        int v13 = *(__IOSurface **)(*((void *)this + 6) + v8 + 48);
        if (!v13 || (IOSurfaceID ID = IOSurfaceGetID(v13), ID != IOSurfaceGetID(v12)))
        {
          unint64_t v15 = *(id **)&v10[v8];
          if (v15 == *((id **)this + 23))
          {
            int v9 = 1;
          }
          else
          {
            [v15[4] waitUntilComplete];
            (*(void (**)(void))(**(void **)&v10[v8] + 24))(*(void *)&v10[v8]);
            unint64_t v15 = *(id **)&v10[v8];
          }
          if (v15 == *((id **)this + 3))
          {
            (*((void (**)(id *))*v15 + 3))(v15);
            *((void *)this + 3) = 0;
          }
          *(void *)&v10[v8] = 0;
        }
      }
      v8 += 8;
    }
    while (v8 != 32);
    if (([*((id *)this + 15) width] != *(unsigned __int16 *)(*((void *)this + 6) + 194)
       || [*((id *)this + 15) height] != *(unsigned __int16 *)(*((void *)this + 6) + 196))
      && v9)
    {
      (*(void (**)(void))(**((void **)this + 23) + 24))(*((void *)this + 23));
      *((void *)this + 23) = 0;
    }
  }
  int MetalSwizzleKey = GLDTextureRec::getMetalSwizzleKey(this);
  uint64_t v17 = 0;
  uint64_t v18 = (char *)this + 152;
  do
  {
    uint64_t v19 = *((void *)this + 6);
    long long v20 = *(__IOSurface **)(v19 + v17 + 48);
    uint64_t v21 = *(GLDLibrary **)&v18[v17];
    if (!v20) {
      goto LABEL_31;
    }
    if (!v21)
    {
      size_t v22 = *(unsigned __int16 *)(v19 + 248);
      unsigned int v23 = *(void **)(*((void *)this + 5) + 232);
      size_t BytesPerRowOfPlane = IOSurfaceGetBytesPerRowOfPlane(v20, v22);
      if ((([v23 iosurfaceReadOnlyTextureAlignmentBytes] - 1) & BytesPerRowOfPlane) != 0) {
        return 0;
      }
      objc_msgSend(*((id *)this + 15), "setUsage:", ((objc_msgSend(v23, "iosurfaceTextureAlignmentBytes") - 1) & BytesPerRowOfPlane) != 0);
      [*((id *)this + 15) setStorageMode:0];
      uint64_t result = [v23 newTextureWithDescriptor:*((void *)this + 15) iosurface:v20 plane:v22];
      if (!result) {
        return result;
      }
      uint64_t v26 = (void *)result;
      [(id)result setLabel:*MEMORY[0x263F12C98]];
      GLDObject::operator new((GLDObject *)0x40);
      uint64_t v21 = v27;
      GLRTextureResource::GLRTextureResource(v27);
      size_t AllocSize = IOSurfaceGetAllocSize(v20);
      if ((GLRTextureResource::initWithMetalTexture(v21, v26, AllocSize) & 1) == 0)
      {
        (*(void (**)(GLDLibrary *))(*(void *)v21 + 24))(v21);
        return 0;
      }

      *(void *)&v18[v17] = v21;
LABEL_31:
      if (!v21) {
        goto LABEL_33;
      }
    }
    GLRTextureResource::setSwizzleKey((uint64_t)v21, MetalSwizzleKey);
    GLRTextureResource::setBaseLevelMaxLevel(*(void *)&v18[v17], *(_WORD *)(*((void *)this + 6) + 214) & 0xF, *(_WORD *)(*((void *)this + 6) + 214) >> 4);
    v31.NSUInteger length = *((unsigned int *)this + 28);
    v31.NSUInteger location = 0;
    GLRTextureResource::updateSampleViewIfNeeded(*(GLRTextureResource **)&v18[v17], (MTLPixelFormat)(&glrTextureFormats)[5 * *((unsigned int *)this + 16) + 3], *((MTLTextureType *)this + 11), v31);
LABEL_33:
    v17 += 8;
  }
  while (v17 != 32);
  uint64_t v29 = *((void *)this + 3);
  if (v29) {
    (*(void (**)(uint64_t))(*(void *)v29 + 24))(v29);
  }
  uint64_t v30 = *((void *)this + v7 + 19);
  *((void *)this + 3) = v30;
  (*(void (**)(uint64_t))(*(void *)v30 + 16))(v30);
  *((_DWORD *)this + 20) = v7;
  return 1;
}

void sub_2406E68D0(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLDTextureRec::blitAccum(uint64_t a1, void *a2, uint64_t a3)
{
  GLDTextureRec::ensureResource(a1);
  uint64_t v6 = *(void **)(*(void *)(a1 + 184) + 32);
  uint64_t v7 = *(void *)(*(void *)(a1 + 24) + 32);
  memset(v11, 0, sizeof(v11));
  v10[0] = [v6 width];
  v10[1] = [v6 height];
  v10[2] = 1;
  memset(v9, 0, sizeof(v9));
  [a2 copyFromTexture:v6 sourceSlice:0 sourceLevel:0 sourceOrigin:v11 sourceSize:v10 toTexture:v7 destinationSlice:0 destinationLevel:0 destinationOrigin:v9];
  GLRResourceList::addResource(a3, *(void *)(a1 + 184));
  GLRResourceList::addResource(a3, *(void *)(a1 + 24));
  uint64_t result = (*(uint64_t (**)(void))(**(void **)(a1 + 184) + 24))(*(void *)(a1 + 184));
  *(void *)(a1 + 184) = 0;
  return result;
}

uint64_t GLDTextureRec::loadIOSurfaceTexture(GLDTextureRec *this, char a2)
{
  uint64_t v4 = *((void *)this + 6);
  if ((*(unsigned char *)(v4 + 24) & 8) == 0)
  {
    if ((*(unsigned char *)(v4 + 24) & 2) != 0 && !*((void *)this + 23))
    {
      uint64_t v5 = *((void *)this + *((unsigned int *)this + 20) + 19);
      if (v5)
      {
        *((void *)this + 23) = v5;
        (*(void (**)(uint64_t))(*(void *)v5 + 16))(v5);
        uint64_t v4 = *((void *)this + 6);
      }
    }
    if ((*(unsigned int (**)(void))(g_Library + 8))(*(void *)(v4 + 32))) {
      return 0;
    }
    if ((a2 & 0xF) == 4) {
      return 1;
    }
    if ((*(unsigned int (**)(void))(g_Library + 16))(*(void *)(*((void *)this + 6) + 32))) {
      return 0;
    }
    a2 |= 1u;
  }
  if ((a2 & 0xF) == 0) {
    return 1;
  }
  uint64_t result = GLDTextureRec::getIOSurfaceResource(this);
  if (result) {
    return 1;
  }
  return result;
}

BOOL GLDTextureRec::allocMetalTexture(GLDTextureRec *this)
{
  uint64_t v2 = 0;
  char v3 = 1;
  do
  {
    char v4 = v3;
    uint64_t v5 = (char *)this + 8 * v2;
    uint64_t v8 = *((void *)v5 + 3);
    uint64_t v7 = v5 + 24;
    uint64_t v6 = v8;
    if (v8)
    {
      (*(void (**)(uint64_t))(*(void *)v6 + 24))(v6);
      *uint64_t v7 = 0;
    }
    char v3 = 0;
    uint64_t v2 = 1;
  }
  while ((v4 & 1) != 0);
  if (*((int *)this + 19) < 1) {
    return 1;
  }
  uint64_t v9 = 0;
  uint64_t v10 = (void *)MEMORY[0x263F12C98];
  do
  {
    uint64_t v11 = *(void **)(*((void *)this + 5) + 232);
    uint64_t v12 = (id *)((char *)this + 8 * v9);
    [v12[15] setCpuCacheMode:1];
    int v13 = (void *)[v11 newTextureWithDescriptor:v12[15]];
    BOOL v14 = v13 != 0;
    if (!v13) {
      break;
    }
    unint64_t v15 = v13;
    [v13 setLabel:*v10];
    GLDObject::operator new((GLDObject *)0x40);
    uint64_t v17 = v16;
    GLRTextureResource::GLRTextureResource(v16);
    uint64_t v18 = (char *)this + 8 * v9;
    GLRTextureResource::initWithMetalTexture(v17, v15, *((void *)v18 + 12));

    *((void *)v18 + 3) = v17;
    ++v9;
  }
  while (v9 < *((int *)this + 19));
  return v14;
}

void sub_2406E6BDC(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

void *GLDTextureRec::newCubeView(GLDTextureRec *this, int a2)
{
  char v4 = *(void **)(*(void *)(GLDTextureRec::getTextureResource(this, 0) + 40) + 32);
  uint64_t v5 = objc_msgSend(v4, "newTextureViewWithPixelFormat:textureType:levels:slices:", (&glrTextureFormats)[5 * *((unsigned int *)this + 16) + 3], 2, 0, objc_msgSend(v4, "mipmapLevelCount"), a2, 1);
  [v5 setLabel:*MEMORY[0x263F12C98]];
  return v5;
}

uint64_t ___ZN13GLDTextureRec18loadPrivateTextureEjPt_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  uint64_t v4 = *(void *)(a1 + 64);
  if (*(void *)(a1 + 72))
  {
    unint64_t v5 = 0;
    uint64_t v6 = 100;
    if (*(void *)(*(void *)(a1 + 40) + 88) == 1) {
      uint64_t v6 = 96;
    }
    uint64_t v7 = *(int *)(a1 + v6);
    uint64_t v8 = *(void *)(a1 + 80);
    do
    {
      uint64_t v9 = *(void **)(a1 + 32);
      memset(v12, 0, 24);
      v12[3] = v2;
      v12[4] = v3;
      v12[5] = v4;
      uint64_t result = [v9 replaceRegion:v12 mipmapLevel:*(unsigned int *)(a1 + 88) slice:v5 withBytes:v8 bytesPerRow:*(int *)(a1 + 96) bytesPerImage:*(int *)(a1 + 100)];
      v8 += v7;
      ++v5;
    }
    while (v5 < *(void *)(a1 + 72));
  }
  else
  {
    uint64_t v11 = *(void **)(a1 + 32);
    memset(v13, 0, 24);
    v13[3] = v2;
    v13[4] = v3;
    v13[5] = v4;
    return [v11 replaceRegion:v13 mipmapLevel:*(unsigned int *)(a1 + 88) slice:*(unsigned int *)(a1 + 92) withBytes:*(void *)(a1 + 80) bytesPerRow:*(int *)(a1 + 96) bytesPerImage:*(int *)(a1 + 100)];
  }
  return result;
}

void GLDTextureRec::setForceASTC_LP(GLDTextureRec *this, char a2)
{
  *((unsigned char *)this + 75) = a2;
  GLDTextureRec::updateSamplerState((MTLTextureType *)this, 128);
}

void GLDTextureRec::updateSamplerState(MTLTextureType *this, char a2)
{
  if ((a2 & 0x81) != 0)
  {
    int MetalSwizzleKey = GLDTextureRec::getMetalSwizzleKey((GLDTextureRec *)this);
    uint64_t v4 = 0;
    char v5 = 1;
    do
    {
      char v6 = v5;
      uint64_t v7 = &this[v4];
      uint64_t v10 = *((void *)v7 + 3);
      uint64_t v9 = (uint64_t *)(v7 + 3);
      uint64_t v8 = v10;
      if (v10)
      {
        GLRTextureResource::setForceASTC_LP(v8, *((unsigned __int8 *)this + 75));
        GLRTextureResource::setSwizzleKey(*v9, MetalSwizzleKey);
        GLRTextureResource::setBaseLevelMaxLevel(*v9, *(_WORD *)(*((void *)this + 6) + 214) & 0xF, *(_WORD *)(*((void *)this + 6) + 214) >> 4);
        v11.NSUInteger length = *((unsigned int *)this + 28);
        v11.NSUInteger location = 0;
        GLRTextureResource::updateSampleViewIfNeeded((GLRTextureResource *)*v9, (MTLPixelFormat)(&glrTextureFormats)[5 * *((unsigned int *)this + v4 + 16) + 3], this[11], v11);
      }
      char v5 = 0;
      uint64_t v4 = 1;
    }
    while ((v6 & 1) != 0);
  }
}

uint64_t GLDTextureRec::readTextureData(GLDTextureRec *this, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, void *a6)
{
  uint64_t v14 = 0;
  unint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  int v17 = 0;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN13GLDTextureRec15readTextureDataEiijjPvj_block_invoke;
  block[3] = &unk_2650D0C20;
  block[4] = &v14;
  void block[5] = this;
  int v10 = a2;
  int v11 = a3;
  unsigned int v12 = a4;
  unsigned int v13 = a5;
  void block[6] = a6;
  char v6 = *((void *)this + 17);
  if (v6) {
    dispatch_sync(v6, block);
  }
  else {
    ___ZN13GLDTextureRec15readTextureDataEiijjPvj_block_invoke((uint64_t)block, a2, a3, a4, a5);
  }
  uint64_t v7 = *((unsigned int *)v15 + 6);
  _Block_object_dispose(&v14, 8);
  return v7;
}

void sub_2406E7478(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t ___ZN13GLDTextureRec15readTextureDataEiijjPvj_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  char v6 = *(GLDTextureRec **)(a1 + 40);
  uint64_t v7 = *((void *)v6 + 5);
  if (*(_DWORD *)(v7 + 248)) {
    pthread_mutex_lock((pthread_mutex_t *)(v7 + 256));
  }
  uint64_t result = GLDTextureRec::readTextureDataInternal(v6, *(_DWORD *)(a1 + 56), *(_DWORD *)(a1 + 60), a4, a5, *(void **)(a1 + 48));
  *(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v9 = *((void *)v6 + 5);
  if (*(_DWORD *)(v9 + 248))
  {
    return pthread_mutex_unlock((pthread_mutex_t *)(v9 + 256));
  }
  return result;
}

dispatch_queue_t GLDTextureRec::createTextureImageQueue(GLDTextureRec *this)
{
  dispatch_queue_t result = dispatch_queue_create("com.apple.GLDRendererMetal.TexImage", 0);
  *((void *)this + 17) = result;
  return result;
}

uint64_t GLDTextureRec::canGenerateMipmapsWithCPU(GLDTextureRec *this, int8x8_t a2)
{
  uint64_t v2 = (_WORD *)*((void *)this + 6);
  if (!v2[97]) {
    return 0;
  }
  a2.i32[0] = (unsigned __int16)v2[98];
  unsigned __int16 v3 = vaddlv_u8((uint8x8_t)vcnt_s8(a2));
  BOOL v4 = ((unsigned __int16)v2[97] & ((unsigned __int16)v2[97] - 1)) != 0 || v2[98] == 0;
  if (v4 || v3 > 1u) {
    return 0;
  }
  if ((v2[107] & 0x1800) != 0) {
    return 0;
  }
  uint64_t v6 = *((void *)this + 3);
  if (*(void *)(v6 + 24) > 0x100000uLL) {
    return 0;
  }
  else {
    return [*(id *)(v6 + 32) canGenerateMipmapLevels];
  }
}

uint64_t GLDTextureRec::generateMipmapsWithCPU(uint64_t this, uint64_t a2)
{
  uint64_t v3 = this;
  uint64_t v4 = *(void *)(this + 48);
  if (*(unsigned char *)(v4 + 130))
  {
    unsigned int v6 = *(unsigned __int8 *)(v4 + 210);
    __int16 v5 = *(_WORD *)(v4 + 214);
  }
  else
  {
    __int16 v5 = *(_WORD *)(v4 + 214);
    unsigned int v6 = v5 >> 4;
  }
  unsigned int v7 = v5 & 0xF;
  if (v7 < v6)
  {
    unint64_t v8 = v7 + 1;
    unint64_t v9 = v6;
    do
    {
      int v10 = *(void **)(*(void *)(v3 + 24) + 32);
      this = [v10 arrayLength];
      if (this)
      {
        uint64_t v11 = this;
        uint64_t v12 = this * a2;
        do
        {
          this = [v10 generateMipmapLevel:v8 slice:v12++];
          --v11;
        }
        while (v11);
      }
    }
    while (v8++ < v9);
  }
  return this;
}

BOOL gldLoadTexture(int a1, GLDTextureRec *this)
{
  return GLDTextureRec::load(this);
}

uint64_t gldReclaimTexture(int a1, GLDTextureRec *this)
{
  return GLDTextureRec::reclaim(this);
}

uint64_t gldModifyTexture(int a1, GLDTextureRec *this)
{
  return 0;
}

uint64_t gldRestoreTextureData(int a1, GLDTextureRec *this, uint64_t a3, uint64_t a4, unsigned int a5)
{
  return GLDTextureRec::restoreData(this, a3, a4, a4, a5);
}

uint64_t gldReadTextureData(int a1, GLDTextureRec *this, uint64_t a3, uint64_t a4, unsigned int a5, unsigned int a6, void *a7)
{
  return GLDTextureRec::readTextureData(this, a3, a4, a5, a6, a7);
}

void gldGetTextureAllocationIdentifiers(uint64_t a1, _DWORD *a2)
{
  *a2 = 0;
}

void GLDDeviceRec::telemetryEmitAPI(GLDDeviceRec *this)
{
  uint64_t v11 = MEMORY[0x2455F59C0]();
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN12GLDDeviceRec16telemetryEmitAPIEv_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = this;
  if (GLDDeviceRec::telemetryEmitAPI(void)::dimensionsOnce != -1) {
    dispatch_once(&GLDDeviceRec::telemetryEmitAPI(void)::dimensionsOnce, block);
  }
  int v10 = (unsigned int *)((char *)this + 960);
  unsigned int v2 = atomic_load((unsigned int *)this + 240);
  for (unsigned int i = *((_DWORD *)this + 241) ^ v2; i; i &= ~(1 << v4))
  {
    uint64_t v4 = __clz(__rbit32(i));
    __int16 v5 = &stru_26F4D7228;
    if ((v4 - 1) <= 7) {
      __int16 v5 = (__CFString *)*((void *)&off_2650D0CB0 + v4 - 1);
    }
    int v6 = *((_DWORD *)this + 132) - 2;
    unsigned int v7 = &stru_26F4D7228;
    if (v6 <= 2) {
      unsigned int v7 = (__CFString *)*((void *)&off_2650D0CF0 + v6);
    }
    GLDDeviceRec::setMeasure<BOOL,0>(*((void *)this + 62), @"Unused", 1, 1, [NSString stringWithFormat:@"com.apple.opengl.%@%@.%@", v5, v7, GLDDeviceRec::telemetryEmitAPI(void)::bundleIdentifier, v10]);
  }
  unint64_t v8 = (void *)v11;
  unsigned int v9 = atomic_load(v10);
  *((_DWORD *)this + 241) = v9;
}

CFStringRef ___ZN12GLDDeviceRec16telemetryEmitAPIEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  MainBundle = CFBundleGetMainBundle();
  CFTypeRef ValueForInfoDictionaryKey = CFBundleGetValueForInfoDictionaryKey(MainBundle, (CFStringRef)*MEMORY[0x263EFFB70]);
  CFStringRef result = CFBundleGetIdentifier(MainBundle);
  GLDDeviceRec::telemetryEmitAPI(void)::bundleIdentifier = (uint64_t)result;
  if (result)
  {
    [*(id *)(v1 + 488) setObject:result forKey:@"BundleIdentifier"];
    int v5 = *(_DWORD *)(v1 + 528) - 2;
    int v6 = v5 > 2 ? &stru_26F4D7228 : (__CFString *)*((void *)&off_2650D0CF0 + v5);
    CFStringRef result = (CFStringRef)[*(id *)(v1 + 488) setObject:v6 forKey:@"API"];
    if (ValueForInfoDictionaryKey)
    {
      unsigned int v7 = *(void **)(v1 + 488);
      return (CFStringRef)[v7 setObject:ValueForInfoDictionaryKey forKey:@"BundleVersion"];
    }
  }
  return result;
}

uint64_t GLDDeviceRec::setMeasure<BOOL,0>(uint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  unint64_t v8 = (void *)result;
  if ((a4 & 1) == 0)
  {
    if ((a4 & 2) == 0) {
      return result;
    }
    goto LABEL_7;
  }
  if (!a5) {
    [NSString stringWithFormat:@"com.apple.opengl.%@", a2];
  }
  objc_msgSend((id)objc_msgSend(NSNumber, "numberWithBool:", a3), "intValue");
  CFStringRef result = ADClientSetValueForScalarKey();
  if ((a4 & 2) != 0)
  {
LABEL_7:
    uint64_t v9 = [NSNumber numberWithBool:a3];
    return [v8 setObject:v9 forKey:a2];
  }
  return result;
}

void GLDDeviceRec::telemetryEmitBacktraceInfo(uint64_t a1, const void *a2)
{
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = ___ZN12GLDDeviceRec26telemetryEmitBacktraceInfoEPK25GLRTelemetryBacktraceInfo_block_invoke;
  void v10[3] = &__block_descriptor_40_e5_v8__0l;
  v10[4] = a1;
  if (GLDDeviceRec::telemetryEmitBacktraceInfo(GLRTelemetryBacktraceInfo const*)::onceToken != -1) {
    dispatch_once(&GLDDeviceRec::telemetryEmitBacktraceInfo(GLRTelemetryBacktraceInfo const*)::onceToken, v10);
  }
  uint64_t v4 = malloc_type_malloc(0x208uLL, 0x1080040751F5E6CuLL);
  if (v4)
  {
    int v5 = v4;
    memcpy(v4, a2, 0x208uLL);
    int v6 = *(_DWORD *)(a1 + 528);
    unsigned int v7 = *(NSObject **)(a1 + 504);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = ___ZN12GLDDeviceRec26telemetryEmitBacktraceInfoEPK25GLRTelemetryBacktraceInfo_block_invoke_2;
    block[3] = &__block_descriptor_44_e5_v8__0l;
    block[4] = v5;
    int v9 = v6;
    dispatch_async(v7, block);
  }
}

dispatch_queue_t ___ZN12GLDDeviceRec26telemetryEmitBacktraceInfoEPK25GLRTelemetryBacktraceInfo_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  unsigned int v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  dispatch_queue_t result = dispatch_queue_create("glmtl.telemetry.backtrace", v2);
  *(void *)(v1 + 504) = result;
  return result;
}

void ___ZN12GLDDeviceRec26telemetryEmitBacktraceInfoEPK25GLRTelemetryBacktraceInfo_block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  unsigned int v2 = (void *)MEMORY[0x2455F59C0]();
  uint64_t v3 = (void *)[MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
  uint64_t v4 = (void *)[MEMORY[0x263F086E0] mainBundle];
  uint64_t v5 = [v4 bundleIdentifier];
  uint64_t v6 = [v4 objectForInfoDictionaryKey:@"CFBundleVersion"];
  if (v5)
  {
    uint64_t v23 = v6;
    unsigned int v7 = *(int **)(a1 + 32);
    int v10 = *v7;
    unint64_t v8 = v7 + 2;
    uint64_t v9 = v10;
    uint64_t v11 = getprogname();
    uint64_t v12 = (void *)[MEMORY[0x263EFF980] array];
    if (v10 >= 1)
    {
      do
      {
        unsigned int v13 = (const char *)dyld_image_path_containing_address();
        if (v13) {
          uint64_t v14 = basename_r(v13, v24);
        }
        else {
          uint64_t v14 = "<Unknown>";
        }
        if (v14) {
          unint64_t v15 = v14;
        }
        else {
          unint64_t v15 = "<Unknown>";
        }
        if (!strcmp(v11, v15)) {
          uint64_t v16 = @"Direct";
        }
        else {
          uint64_t v16 = (__CFString *)[NSString stringWithUTF8String:v15];
        }
        if (isIgnoredFramework(NSString *)::onceToken != -1) {
          dispatch_once(&isIgnoredFramework(NSString *)::onceToken, &__block_literal_global_1);
        }
        if (([(id)isIgnoredFramework(NSString *)::ignoredFrameworks containsObject:v16] & 1) == 0
          && ([v12 containsObject:v16] & 1) == 0)
        {
          [v12 addObject:v16];
        }
        v8 += 2;
        --v9;
      }
      while (v9);
    }
    if ([v12 count])
    {
      uint64_t v17 = [v12 componentsJoinedByString:@","];
      if (v17)
      {
        uint64_t v18 = v17;
        int v19 = *(_DWORD *)(a1 + 40) - 2;
        if (v19 > 2) {
          long long v20 = &stru_26F4D7228;
        }
        else {
          long long v20 = (__CFString *)*((void *)&off_2650D0CF0 + v19);
        }
        GLDDeviceRec::setMeasure<int,0>(0, @"Unused", 1, 1, [NSString stringWithFormat:@"com.apple.opengl.%@.Backtrace{%@}.%@", v20, v17, v5]);
        [v3 setObject:v5 forKey:@"BundleIdentifier"];
        int v21 = *(_DWORD *)(a1 + 40) - 2;
        if (v21 > 2) {
          size_t v22 = &stru_26F4D7228;
        }
        else {
          size_t v22 = (__CFString *)*((void *)&off_2650D0CF0 + v21);
        }
        [v3 setObject:v22 forKey:@"API"];
        if (v23) {
          [v3 setObject:v23 forKey:@"BundleVersion"];
        }
        [v3 setObject:v18 forKey:@"Frameworks"];
        *(void *)BOOL v24 = MEMORY[0x263EF8330];
        uint64_t v25 = 3221225472;
        uint64_t v26 = ___ZN12GLDDeviceRec9sendEventEP8NSStringP19NSMutableDictionaryIS1_P8NSObjectE_block_invoke;
        uint64_t v27 = &unk_2650D0C90;
        uint64_t v28 = v3;
        AnalyticsSendEventLazy();
      }
    }
  }
  free(*(void **)(a1 + 32));
}

uint64_t GLDDeviceRec::setMeasure<int,0>(uint64_t result, uint64_t a2, uint64_t a3, char a4, uint64_t a5)
{
  unint64_t v8 = (void *)result;
  if ((a4 & 1) == 0)
  {
    if ((a4 & 2) == 0) {
      return result;
    }
    goto LABEL_7;
  }
  if (!a5) {
    [NSString stringWithFormat:@"com.apple.opengl.%@", a2];
  }
  objc_msgSend((id)objc_msgSend(NSNumber, "numberWithInt:", a3), "intValue");
  dispatch_queue_t result = ADClientSetValueForScalarKey();
  if ((a4 & 2) != 0)
  {
LABEL_7:
    uint64_t v9 = [NSNumber numberWithInt:a3];
    return [v8 setObject:v9 forKey:a2];
  }
  return result;
}

uint64_t GLDDeviceRec::telemetryEmitGPUWorkSubmitted(id *this)
{
  return [this[61] setObject:MEMORY[0x263EFFA88] forKey:@"GPUWorkSubmitted"];
}

uint64_t GLDDeviceRec::telemetryTexture(uint64_t this, GLDTextureRec *a2)
{
  int v2 = *((_DWORD *)&glrTextureFormats + 10 * *((unsigned int *)a2 + 16) + 9);
  if ((v2 & 0x1000) != 0)
  {
    uint64_t v4 = 45;
    goto LABEL_18;
  }
  if ((v2 & 0x2000) != 0)
  {
    uint64_t v4 = 48;
    goto LABEL_18;
  }
  if ((v2 & 0x4000) != 0)
  {
    uint64_t v4 = 44;
    goto LABEL_18;
  }
  if ((v2 & 0x8000) != 0)
  {
    uint64_t v4 = 46;
    goto LABEL_18;
  }
  if ((v2 & 0x10000) != 0)
  {
    uint64_t v4 = 47;
    goto LABEL_18;
  }
  if ((v2 & 0x20000) != 0)
  {
    uint64_t v4 = 49;
    goto LABEL_18;
  }
  unsigned int v3 = *(unsigned __int16 *)(*((void *)a2 + 6) + 192);
  uint64_t v4 = 50;
  if (v3 <= 0x8813)
  {
    if (*(unsigned __int16 *)(*((void *)a2 + 6) + 192) > 0x81A5u)
    {
      switch(*(_WORD *)(*((void *)a2 + 6) + 192))
      {
        case 0x8229:
          goto LABEL_55;
        case 0x822A:
        case 0x822C:
          goto LABEL_18;
        case 0x822B:
          goto LABEL_42;
        case 0x822D:
LABEL_21:
          uint64_t v4 = 11;
          goto LABEL_18;
        case 0x822E:
LABEL_48:
          uint64_t v4 = 14;
          goto LABEL_18;
        case 0x822F:
LABEL_62:
          uint64_t v4 = 12;
          goto LABEL_18;
        case 0x8230:
LABEL_63:
          uint64_t v4 = 15;
          goto LABEL_18;
        case 0x8231:
          uint64_t v4 = 34;
          goto LABEL_18;
        case 0x8232:
          uint64_t v4 = 24;
          goto LABEL_18;
        case 0x8233:
          uint64_t v4 = 38;
          goto LABEL_18;
        case 0x8234:
          uint64_t v4 = 28;
          goto LABEL_18;
        case 0x8235:
          uint64_t v4 = 41;
          goto LABEL_18;
        case 0x8236:
          uint64_t v4 = 31;
          goto LABEL_18;
        case 0x8237:
          uint64_t v4 = 35;
          goto LABEL_18;
        case 0x8238:
          uint64_t v4 = 25;
          goto LABEL_18;
        case 0x8239:
          uint64_t v4 = 39;
          goto LABEL_18;
        case 0x823A:
          uint64_t v4 = 29;
          goto LABEL_18;
        case 0x823B:
          uint64_t v4 = 42;
          goto LABEL_18;
        case 0x823C:
          uint64_t v4 = 32;
          goto LABEL_18;
        default:
          if (v3 == 33190)
          {
            uint64_t v4 = 20;
            goto LABEL_18;
          }
          if (v3 != 33191) {
            goto LABEL_18;
          }
          break;
      }
      goto LABEL_61;
    }
    if (*(unsigned __int16 *)(*((void *)a2 + 6) + 192) <= 0x804Fu)
    {
      if (v3 == 32828 || v3 == 32832) {
        goto LABEL_55;
      }
      if (v3 == 32837) {
LABEL_42:
      }
        uint64_t v4 = 1;
    }
    else
    {
      switch(*(_WORD *)(*((void *)a2 + 6) + 192))
      {
        case 0x8050:
        case 0x8056:
        case 0x8057:
          goto LABEL_52;
        case 0x8051:
LABEL_31:
          uint64_t v4 = 2;
          break;
        case 0x8052:
        case 0x8053:
        case 0x8054:
        case 0x8055:
          break;
        case 0x8058:
LABEL_43:
          uint64_t v4 = 3;
          break;
        case 0x8059:
LABEL_70:
          uint64_t v4 = 9;
          break;
        default:
          if (v3 == 33189) {
            uint64_t v4 = 19;
          }
          break;
      }
    }
  }
  else
  {
    if (*(unsigned __int16 *)(*((void *)a2 + 6) + 192) <= 0x8CABu)
    {
      if (*(unsigned __int16 *)(*((void *)a2 + 6) + 192) <= 0x88EFu)
      {
        switch(*(_WORD *)(*((void *)a2 + 6) + 192))
        {
          case 0x8814:
            uint64_t v4 = 16;
            break;
          case 0x8816:
          case 0x8818:
            goto LABEL_48;
          case 0x8819:
            goto LABEL_63;
          case 0x881A:
            uint64_t v4 = 13;
            break;
          case 0x881C:
          case 0x881E:
            goto LABEL_21;
          case 0x881F:
            goto LABEL_62;
          default:
            goto LABEL_18;
        }
        goto LABEL_18;
      }
      switch(*(_WORD *)(*((void *)a2 + 6) + 192))
      {
        case 0x8C3A:
          uint64_t v4 = 18;
          goto LABEL_18;
        case 0x8C3B:
        case 0x8C3C:
        case 0x8C3E:
        case 0x8C3F:
          goto LABEL_18;
        case 0x8C3D:
          uint64_t v4 = 17;
          goto LABEL_18;
        case 0x8C40:
        case 0x8C41:
          goto LABEL_31;
        case 0x8C42:
        case 0x8C43:
          goto LABEL_43;
        default:
          if (v3 == 35056)
          {
            uint64_t v4 = 21;
            goto LABEL_18;
          }
          if (v3 != 35448) {
            goto LABEL_18;
          }
          break;
      }
LABEL_55:
      uint64_t v4 = 0;
      goto LABEL_18;
    }
    if (*(unsigned __int16 *)(*((void *)a2 + 6) + 192) > 0x8D87u)
    {
      if (*(unsigned __int16 *)(*((void *)a2 + 6) + 192) <= 0x8F93u)
      {
        switch(v3)
        {
          case 0x8D88u:
            uint64_t v4 = 40;
            break;
          case 0x8D8Eu:
            uint64_t v4 = 37;
            break;
          case 0x8D8Fu:
            uint64_t v4 = 36;
            break;
        }
      }
      else
      {
        switch(*(_WORD *)(*((void *)a2 + 6) + 192))
        {
          case 0x8F94:
            uint64_t v4 = 4;
            break;
          case 0x8F95:
            uint64_t v4 = 5;
            break;
          case 0x8F96:
            uint64_t v4 = 6;
            break;
          case 0x8F97:
            uint64_t v4 = 7;
            break;
          default:
            if (v3 == 36975) {
              goto LABEL_70;
            }
            break;
        }
      }
    }
    else if (*(unsigned __int16 *)(*((void *)a2 + 6) + 192) > 0x8D75u)
    {
      if (*(unsigned __int16 *)(*((void *)a2 + 6) + 192) > 0x8D7Cu)
      {
        if (v3 == 36221)
        {
          uint64_t v4 = 26;
        }
        else if (v3 == 36226)
        {
          uint64_t v4 = 43;
        }
      }
      else if (v3 == 36214)
      {
        uint64_t v4 = 30;
      }
      else if (v3 == 36220)
      {
        uint64_t v4 = 27;
      }
    }
    else
    {
      if (*(unsigned __int16 *)(*((void *)a2 + 6) + 192) <= 0x8D61u)
      {
        if (v3 != 36012)
        {
          if (v3 == 36168) {
            uint64_t v4 = 23;
          }
          goto LABEL_18;
        }
LABEL_61:
        uint64_t v4 = 22;
        goto LABEL_18;
      }
      if (v3 == 36194)
      {
LABEL_52:
        uint64_t v4 = 8;
      }
      else if (v3 == 36208)
      {
        uint64_t v4 = 33;
      }
    }
  }
LABEL_18:
  atomic_fetch_add((atomic_ullong *volatile)(this + 8 * v4 + 552), 1uLL);
  return this;
}

uint64_t GLDDeviceRec::telemetryEmitUsage(uint64_t this)
{
  uint64_t v1 = this;
  uint64_t v2 = *(void *)(this + 536);
  for (uint64_t i = *(void *)(this + 544) ^ v2; i; i ^= v4)
  {
    uint64_t v4 = i & -i;
    if (v4 >= 0x2000)
    {
      if (v4 < 0x80000)
      {
        if (v4 >= 0x10000)
        {
          switch(v4)
          {
            case 0x10000:
              uint64_t v5 = @"PCF";
              break;
            case 0x20000:
              uint64_t v5 = @"Aniso";
              break;
            case 0x40000:
              uint64_t v5 = @"MSAA";
              break;
            default:
              goto LABEL_58;
          }
        }
        else
        {
          switch(v4)
          {
            case 0x2000:
              uint64_t v5 = @"TF";
              break;
            case 0x4000:
              uint64_t v5 = @"Readback";
              break;
            case 0x8000:
              uint64_t v5 = @"Blit";
              break;
            default:
              goto LABEL_58;
          }
        }
      }
      else if (v4 <= 0xFFFFFF)
      {
        switch(v4)
        {
          case 0x80000:
            uint64_t v5 = @"ColorConversion";
            break;
          case 0x100000:
            uint64_t v5 = @"MipmapGen";
            break;
          case 0x800000:
            uint64_t v5 = @"VertexSpill";
            break;
          default:
            goto LABEL_58;
        }
      }
      else if (v4 > 0x3FFFFFF)
      {
        if (v4 == 0x4000000)
        {
          uint64_t v5 = @"MSAACombinedResolve";
        }
        else
        {
          if (v4 != 0x40000000)
          {
LABEL_58:
            uint64_t v5 = &stru_26F4D7228;
            goto LABEL_59;
          }
          uint64_t v5 = @"MRTSpill";
        }
      }
      else if (v4 == 0x1000000)
      {
        uint64_t v5 = @"FragmentSpill";
      }
      else
      {
        if (v4 != 0x2000000) {
          goto LABEL_58;
        }
        uint64_t v5 = @"SWRender";
      }
    }
    else if (v4 > 127)
    {
      if (v4 > 1023)
      {
        switch(v4)
        {
          case 1024:
            uint64_t v5 = @"Scissor";
            break;
          case 2048:
            uint64_t v5 = @"StencilTest";
            break;
          case 4096:
            uint64_t v5 = @"OQ";
            break;
          default:
            goto LABEL_58;
        }
      }
      else
      {
        switch(v4)
        {
          case 128:
            uint64_t v5 = @"AlphaToOne";
            break;
          case 256:
            uint64_t v5 = @"AlphaToCoverage";
            break;
          case 512:
            uint64_t v5 = @"SampleCoverage";
            break;
          default:
            goto LABEL_58;
        }
      }
    }
    else
    {
      if (v4 <= 15)
      {
        uint64_t v5 = @"AlphaTest";
        switch(v4)
        {
          case 1:
            goto LABEL_59;
          case 2:
            uint64_t v5 = @"Blending";
            break;
          case 4:
            uint64_t v5 = @"Cull";
            break;
          case 8:
            uint64_t v5 = @"DepthTest";
            break;
          default:
            goto LABEL_58;
        }
        goto LABEL_59;
      }
      switch(v4)
      {
        case 16:
          uint64_t v5 = @"Dither";
          break;
        case 32:
          uint64_t v5 = @"PolygonOffset";
          break;
        case 64:
          uint64_t v5 = @"RasterDiscard";
          break;
        default:
          goto LABEL_58;
      }
    }
LABEL_59:
    this = objc_msgSend(*(id *)(v1 + 496), "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", 1), v5);
  }
  *(void *)(v1 + 544) = v2;
  return this;
}

uint64_t GLDDeviceRec::telemetryEmitTexture(uint64_t this)
{
  uint64_t v1 = this;
  unint64_t v2 = 0;
  uint64_t v3 = this + 552;
  do
  {
    if (atomic_load((unint64_t *)(v3 + 8 * v2)))
    {
      uint64_t v5 = &stru_26F4D7228;
      if (v2 <= 0x31) {
        uint64_t v5 = (__CFString *)*((void *)&off_2650D0D08 + v2);
      }
      uint64_t v6 = *(void **)(v1 + 496);
      unsigned int v7 = (unint64_t *)(v3 + 8 * v2);
      unint64_t v8 = atomic_load(v7);
      this = objc_msgSend(v6, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", v8), v5);
      atomic_store(0, v7);
    }
    ++v2;
  }
  while (v2 != 50);
  return this;
}

uint64_t GLDDeviceRec::emitTelemetry(id *this)
{
  GLDDeviceRec::telemetryEmitAPI((GLDDeviceRec *)this);
  GLDDeviceRec::telemetryEmitUsage((uint64_t)this);
  GLDDeviceRec::telemetryEmitTexture((uint64_t)this);
  uint64_t result = [this[62] count];
  if (result)
  {
    [this[62] addEntriesFromDictionary:this[61]];
    AnalyticsSendEventLazy();
    return [this[62] removeAllObjects];
  }
  return result;
}

NSObject *GLDDeviceRec::telemetryCreateTimerWithInterval(int a1, dispatch_queue_t queue, double a3, void *a4)
{
  uint64_t v6 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, queue);
  if (v6)
  {
    double v7 = a3 * 1000000000.0;
    dispatch_time_t v8 = dispatch_time(0, (uint64_t)v7);
    dispatch_source_set_timer(v6, v8, (unint64_t)v7, 0x5F5E100uLL);
    dispatch_source_set_event_handler(v6, a4);
    dispatch_resume(v6);
  }
  return v6;
}

void GLDDeviceRec::telemetryStartTimer(GLDDeviceRec *this, double a2)
{
  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  *(double *)&v4[3] = a2;
  unint64_t v2 = *((void *)this + 64);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = ___ZN12GLDDeviceRec19telemetryStartTimerEd_block_invoke;
  v3[3] = &unk_2650D0C68;
  v3[4] = v4;
  v3[5] = this;
  *((void *)this + 65) = GLDDeviceRec::telemetryCreateTimerWithInterval((int)this, v2, a2, v3);
  _Block_object_dispose(v4, 8);
}

uint64_t ___ZN12GLDDeviceRec19telemetryStartTimerEd_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  GLDDeviceRec::emitTelemetry((id *)v2);
  dispatch_source_cancel(*(dispatch_source_t *)(v2 + 520));
  dispatch_release(*(dispatch_object_t *)(v2 + 520));
  uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 8);
  double v4 = *(double *)(v3 + 24);
  if (v4 <= 3840.0)
  {
    *(double *)(v3 + 24) = v4 + v4;
    double v4 = *(double *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }

  return GLDDeviceRec::telemetryStartTimer((GLDDeviceRec *)v2, v4);
}

uint64_t ___ZN12GLDDeviceRec9sendEventEP8NSStringP19NSMutableDictionaryIS1_P8NSObjectE_block_invoke(uint64_t a1)
{
  return *(void *)(a1 + 32);
}

uint64_t ___ZL18isIgnoredFrameworkP8NSString_block_invoke()
{
  uint64_t result = [objc_alloc(MEMORY[0x263EFFA08]) initWithArray:&unk_26F4D8220];
  isIgnoredFramework(NSString *)::ignoredFrameworks = result;
  return result;
}

BOOL _depthStencilKeyEqual(void *a1, void *a2)
{
  return *a1 == *a2;
}

unint64_t _depthStencilKeyHash(void *a1)
{
  uint64_t v1 = __ROR8__((0x9E3779B185EBCA87 * ((0x93EA75A780000000 * *a1) | ((0xC2B2AE3D27D4EB4FLL * *a1) >> 33))) ^ 0x27D4EB2F165667CDLL, 37);
  unint64_t v2 = 0xC2B2AE3D27D4EB4FLL
     * ((0x9E3779B185EBCA87 * v1 - 0x7A1435883D4D519DLL) ^ ((0x9E3779B185EBCA87 * v1 - 0x7A1435883D4D519DLL) >> 33));
  return (0x165667B19E3779F9 * (v2 ^ (v2 >> 29))) ^ ((0x165667B19E3779F9 * (v2 ^ (v2 >> 29))) >> 32);
}

void GLDContextRec::getCommandBuffer(GLDContextRec *this)
{
  unint64_t v2 = (void *)MEMORY[0x2455F59C0]();
  id v3 = (id)[*((id *)this + 10) commandBufferWithUnretainedReferences];
  *((void *)this + 5) = v3;
  [v3 setLabel:*MEMORY[0x263F12C98]];
  *((void *)this + 8) = GLDDeviceRec::newResourceList(*((GLRResourceListPool ***)this + 12));
}

atomic_uint *___ZN13GLDContextRec15beginRenderPassEv_block_invoke(uint64_t a1)
{
  return GLDContextRec::releaseQueryStagingBuffer(*(GLDContextRec **)(a1 + 32), *(atomic_uint **)(a1 + 40));
}

void GLDContextRec::endRenderPass(GLDContextRec *this)
{
  uint64_t v2 = *((void *)this + 423);
  uint64_t v3 = *((void *)this + 424) - v2;
  if (v3)
  {
    unint64_t v4 = v3 >> 3;
    if (v4 <= 1) {
      unint64_t v4 = 1;
    }
    uint64_t v5 = (uint64_t *)*((void *)this + 423);
    do
    {
      uint64_t v6 = *v5++;
      *(unsigned char *)(v6 + 32) = 0;
      --v4;
    }
    while (v4);
  }
  *((void *)this + 424) = v2;
  BOOL v7 = (*((unsigned __int8 *)this + 5040) | *((unsigned __int8 *)this + 5032)) == 0;
  for (uint64_t i = 562; i != 566; ++i)
  {
    int v9 = 1 << (i - 50);
    if ((*((_DWORD *)this + 1187) & v9) != 0)
    {
      int v10 = *((_DWORD *)this + 1258);
      if (v7)
      {
        v10 |= v9;
        *((_DWORD *)this + 1258) = v10;
      }
      uint64_t v11 = *((void *)this + i);
      if ((v10 & v9) != 0)
      {
        if ((v11 | 2) == 3)
        {
          if (*((_DWORD *)this + 1150) <= 1u) {
            int v12 = *((_DWORD *)this + 1263);
          }
          else {
            int v12 = *((_DWORD *)this + 1263) | 0x2000;
          }
          *((_DWORD *)this + 1263) = v12 | 0x400;
        }
      }
      else if (v11 == 3)
      {
        *((_DWORD *)this + 1263) |= 0x4000400u;
        *((void *)this + 53) |= 0x4000000uLL;
        *((void *)this + i) = 2;
        uint64_t v11 = 2;
      }
      else if (v11 == 1)
      {
        uint64_t v11 = 0;
        *((void *)this + i) = 0;
      }
      objc_msgSend(*((id *)this + 2), "setColorStoreAction:atIndex:", v11);
      BOOL v7 = 0;
    }
  }
  int v13 = *((_DWORD *)this + 1187);
  if ((v13 & 0x100) != 0)
  {
    uint64_t v14 = *((void *)this + 570);
    if (*((unsigned char *)this + 5033))
    {
      if ((v14 | 2) == 3)
      {
        if (*((_DWORD *)this + 1150) <= 1u) {
          int v15 = *((_DWORD *)this + 1263);
        }
        else {
          int v15 = *((_DWORD *)this + 1263) | 0x2000;
        }
        *((_DWORD *)this + 1263) = v15 | 0x800;
      }
    }
    else if (v14 == 3)
    {
      *((_DWORD *)this + 1263) |= 0x4000800u;
      *((void *)this + 53) |= 0x4000000uLL;
      uint64_t v14 = 2;
      *((void *)this + 570) = 2;
    }
    else if (v14 == 1)
    {
      uint64_t v14 = 0;
      *((void *)this + 570) = 0;
    }
    [*((id *)this + 2) setDepthStoreAction:v14];
    int v13 = *((_DWORD *)this + 1187);
  }
  if ((v13 & 0x200) != 0)
  {
    uint64_t v16 = *((void *)this + 571);
    if ((*((unsigned char *)this + 5033) & 2) != 0)
    {
      if ((v16 | 2) == 3)
      {
        if (*((_DWORD *)this + 1150) <= 1u) {
          int v17 = *((_DWORD *)this + 1263);
        }
        else {
          int v17 = *((_DWORD *)this + 1263) | 0x2000;
        }
        *((_DWORD *)this + 1263) = v17 | 0x1000;
      }
    }
    else if (v16 == 3)
    {
      *((_DWORD *)this + 1263) |= 0x4001000u;
      *((void *)this + 53) |= 0x4000000uLL;
      uint64_t v16 = 2;
      *((void *)this + 571) = 2;
    }
    else if (v16 == 1)
    {
      uint64_t v16 = 0;
      *((void *)this + 571) = 0;
    }
    [*((id *)this + 2) setStencilStoreAction:v16];
  }
  GLDQueryStagingBuffer::deferProcessResults(*((void *)this + 595), this, *((GLRQueryResultBuffer **)this + 594));
  [*((id *)this + 2) endEncoding];
  if (!*((unsigned char *)this + 2232)) {
    goto LABEL_61;
  }
  unint64_t v18 = *((void *)this + 282);
  unint64_t v19 = *((void *)this + 288);
  if (!v19)
  {
    unint64_t v24 = 0;
    goto LABEL_60;
  }
  unint64_t v20 = 0;
  *(void *)&long long v21 = -1;
  *((void *)&v21 + 1) = -1;
  while (1)
  {
    size_t v22 = (unsigned __int8 *)(*((void *)this + 287) + 24 * v20);
    int v23 = *v22;
    if (v23 == 1)
    {
      uint64_t v25 = *((void *)this + 280);
      uint64_t v26 = v25 + 40 * v18;
      *(void *)(v26 + 32) = -1;
      *(_OWORD *)uint64_t v26 = v21;
      *(_OWORD *)(v26 + 16) = v21;
      unint64_t v27 = (*((void *)v22 + 2) - *((void *)v22 + 1) + 3) & 0xFFFFFFFFFFFFFFFCLL;
      *(_DWORD *)uint64_t v26 = *(_DWORD *)v22 >> 8;
      *(_DWORD *)(v26 + 4) = *(_DWORD *)(*((void *)this + 284) + 4 * *((unsigned int *)v22 + 1));
      *(void *)(v26 + 8) = *((void *)v22 + 1);
      *(void *)(v26 + 16) = *((void *)v22 + 1) + v27;
      unint64_t v24 = v20 + 1;
      unint64_t v19 = *((void *)this + 288);
      if (v20 + 1 < v19)
      {
        uint64_t v28 = *((void *)this + 287) + 24 * v24;
        if (*(unsigned char *)v28 == 2)
        {
          uint64_t v29 = *(void *)(v28 + 8);
          unint64_t v30 = (*(void *)(v28 + 16) - v29 + 3) & 0xFFFFFFFFFFFFFFFCLL;
          uint64_t v31 = v25 + 40 * v18;
          *(void *)(v31 + 24) = v29;
          *(void *)(v31 + 32) = *(void *)(v28 + 8) + v30;
          unint64_t v24 = v20 + 2;
        }
      }
      unint64_t v18 = (v18 + 1) % *((void *)this + 281);
      goto LABEL_56;
    }
    if (v23 == 255) {
      break;
    }
    unint64_t v24 = v20 + 1;
LABEL_56:
    unint64_t v20 = v24;
    if (v24 >= v19) {
      goto LABEL_60;
    }
  }
  unint64_t v24 = v20;
LABEL_60:
  *((void *)this + 282) = v18;
  memset(*((void **)this + 287), 255, 24 * v24);
  *((void *)this + 285) = *((void *)this + 284);
LABEL_61:
  int v32 = *((_DWORD *)this + 1259);
  if ((v32 & 0x100) != 0) {
    *((_DWORD *)this + 1263) |= 0x40u;
  }
  if ((v32 & 0x200) != 0) {
    *((_DWORD *)this + 1263) |= 0x80u;
  }

  *((void *)this + 2) = 0;
  *((void *)this + 629) = 0;
  *((_DWORD *)this + 1260) = 0;
  *((_DWORD *)this + 1263) |= 0x200u;
  if (*((unsigned char *)this + 5087) || *((_DWORD *)this + 1257) >= 0x10u)
  {
    GLDContextRec::flushContext(this);
  }
}

unint64_t GLDContextRec::buildPipelineStateDescriptor(GLDContextRec *this)
{
  uint64_t v2 = *((void *)this + 13);
  uint64_t v3 = (unsigned char *)(v2 + 15712);
  if ((*((unsigned char *)this + 2484) & 2) != 0)
  {
    for (uint64_t i = 0; i != 4; ++i)
      *((_WORD *)this + i + 1084) = *((void *)this + i + 552);
    unint64_t v4 = *((void *)this + 272) & 0xFFF0B1FFFFFFFFFFLL | ((unint64_t)(*((void *)this + 560) == 252) << 41) & 0xFFF0FFFFFFFFFFFFLL | ((unint64_t)(*((void *)this + 561) == 253) << 46) & 0xFFF0FFFFFFFFFFFFLL | ((*((_DWORD *)this + 1149) & 0xFLL) << 48);
    *((void *)this + 272) = v4;
  }
  else
  {
    unint64_t v4 = *((void *)this + 272);
  }
  if (*(unsigned char *)(v2 + 13104)) {
    BOOL v6 = *(unsigned char *)(v2 + 13105) == 0;
  }
  else {
    BOOL v6 = 0;
  }
  char v7 = v6;
  uint64_t v8 = *((_DWORD *)this + 94) & 1;
  BOOL v6 = (*((unsigned char *)this + 376) & 1 & v7) == 0;
  uint64_t v9 = 0x2000000000000000;
  if (v6) {
    uint64_t v9 = 0;
  }
  unint64_t v10 = v9 | v4 & 0xDFFFFFFFFFFFFFFFLL;
  *((void *)this + 272) = v10;
  int v11 = *((unsigned __int8 *)this + 2652);
  if (*((unsigned char *)this + 2652)) {
    unint64_t v12 = v10 & 0xFFFF7FFFFFFFFFFFLL;
  }
  else {
    unint64_t v12 = v10 & 0xFFFF7FFFFFFFFFFFLL | ((unint64_t)(*v3 == 0) << 47);
  }
  int v13 = (unint64_t *)((char *)this + 2136);
  *((void *)this + 272) = v12;
  if ((v12 & 0xE000000000000) == 0)
  {
    *((void *)this + 268) |= 0xFFFFFFFFuLL;
    unint64_t v17 = v12 & 0x3FFFDFFF00000000 | 0x3F800000;
LABEL_28:
    *((void *)this + 272) = v17;
    goto LABEL_29;
  }
  unint64_t v14 = v12 & 0xBFFFFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v2 + 15410) != 0) << 62);
  *((void *)this + 272) = v14;
  unint64_t v15 = v14 & 0x7FFFFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v2 + 15409) != 0) << 63);
  *((void *)this + 272) = v15;
  if (*(unsigned char *)(v2 + 15411)) {
    uint64_t v16 = *(unsigned int *)(v2 + 15400);
  }
  else {
    uint64_t v16 = 1065353216;
  }
  unint64_t v18 = v16 | v15 & 0xFFFFFFFF00000000;
  *((void *)this + 272) = v18;
  *((_DWORD *)this + 536) = *(_DWORD *)(v2 + 15404);
  unint64_t v19 = v18 & 0xFFFFDFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(v2 + 15412) != 0) << 45);
  *((void *)this + 272) = v19;
  if ((v12 & 0x2000000000000000) == 0)
  {
    if (*(unsigned char *)(v2 + 13105)) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = v8 << 61;
    }
    unint64_t v17 = v20 | v19 & 0xDFFFFFFFFFFFFFFFLL;
    goto LABEL_28;
  }
LABEL_29:
  if (*((unsigned char *)this + 2484))
  {
    if (*((void *)this + 49) && *((unsigned char *)this + 5082))
    {
      long long v21 = (char *)this + 1856;
    }
    else
    {
      *((unsigned char *)this + 5082) = 0;
      long long v21 = (char *)this + 1984;
    }
    long long v22 = *((_OWORD *)v21 + 3);
    *((_OWORD *)this + 131) = *((_OWORD *)v21 + 2);
    *((_OWORD *)this + 132) = v22;
    *((void *)this + 266) = *((void *)v21 + 8);
    long long v23 = *((_OWORD *)v21 + 1);
    *((_OWORD *)this + 129) = *(_OWORD *)v21;
    *((_OWORD *)this + 130) = v23;
  }
  unint64_t v24 = (pthread_rwlock_t *)(*((void *)this + 12) + 216);
  if (v11)
  {
    unint64_t result = GLRFunctionCache::getKey(v24, *((void **)this + 516));
    uint64_t v26 = *((void *)this + 268);
    unint64_t v27 = result & 0xFFFFFF | ((unint64_t)*((unsigned __int16 *)this + 1071) << 48);
  }
  else
  {
    unint64_t result = GLRFunctionCache::getKey(v24, *((void **)this + 511));
    uint64_t v26 = *((void *)this + 268);
    unint64_t v28 = *v13 & 0xFFFFFFFFFF000000 | result & 0xFFFFFF;
    *int v13 = v28;
    if (*v3)
    {
      unint64_t v27 = v28 & 0xFFFF000000FFFFFFLL;
    }
    else
    {
      unint64_t result = GLRFunctionCache::getKey((pthread_rwlock_t *)(*((void *)this + 12) + 216), *((void **)this + 515));
      uint64_t v26 = *((void *)this + 268);
      unint64_t v27 = *v13 & 0xFFFF000000FFFFFFLL | ((result & 0xFFFFFF) << 24);
    }
  }
  *int v13 = v27;
  *((void *)this + 268) = v26;
  *((_DWORD *)this + 621) = 0;
  return result;
}

BOOL GLDContextRec::setRenderTexturesAndSamplersInternal(GLDContextRec *this, unsigned int a2, int *a3, void *a4, void *a5, float a6)
{
  int v41 = *a3;
  uint64_t v10 = *((void *)this + a2 + 188);
  if (v10)
  {
    int v11 = *(unsigned int **)(*(void *)(*((void *)this + a2 + 183) + 24) + 72);
    if (v11)
    {
      unsigned int v14 = *v11;
      unint64_t v12 = v11 + 1;
      uint64_t v13 = v14;
      if (v14)
      {
        uint64_t v15 = 0;
        uint64_t v42 = *(void *)(*(void *)(v10 + 24) + 48);
        do
        {
          uint64_t v16 = *(unsigned int *)(v42 + 4 * v12[v15]);
          if ((*((_DWORD *)this + 661) & (1 << v16)) != 0)
          {
            uint64_t v17 = *((void *)this + v16 + 151);
            if (v17)
            {
              uint64_t v18 = *(void *)(v17 + 24);
              LOBYTE(a6) = *((unsigned char *)this + v16 + 1816);
              float v19 = (float)LODWORD(a6);
              if (*(float *)(v18 + 20) >= v19) {
                float v20 = v19;
              }
              else {
                float v20 = *(float *)(v18 + 20);
              }
              if (*(float *)(v18 + 24) >= v19) {
                float v21 = v19;
              }
              else {
                float v21 = *(float *)(v18 + 24);
              }
              uint64_t v22 = *(void *)(v17 + 40);
              GLRResourceList::addResource(*((void *)this + 8), v22);
              ((void (*)(void, void, void, uint64_t, float, float))a4[1])(*((void *)this + 2), *a4, *(void *)(v22 + 32), v15, v20, v21);
            }
          }
          if ((*((_DWORD *)this + 660) & (1 << v16)) != 0)
          {
            long long v23 = (char *)this + 8 * v16;
            uint64_t v24 = *((void *)v23 + 447);
            *a3 &= ~(1 << v15);
            if (v24)
            {
              uint64_t v25 = *((void *)v23 + 119);
              if (*(void *)(v25 + 136))
              {
                uint64_t v26 = (uint64_t *)(v23 + 952);
                GLDContextRec::dispatchImageQueueEvent(this, (GLDTextureRec *)v25);
                uint64_t v25 = *v26;
              }
              if (*(unsigned char *)(v25 + 74)) {
                *a3 |= 1 << v15;
              }
              uint64_t v27 = *(void *)(v24 + 40);
              GLRResourceList::addResource(*((void *)this + 8), v24);
              GLRResourceList::addResource(*((void *)this + 8), v27);
              ((void (*)(void, void, void, uint64_t))a5[1])(*((void *)this + 2), *a5, *(void *)(v27 + 32), v15);
            }
          }
          ++v15;
        }
        while (v13 != v15);
      }
    }
  }
  else
  {
    for (uint64_t i = 0; i != 16; ++i)
    {
      int v29 = 1 << i;
      if ((*((_DWORD *)this + 661) & (1 << i)) != 0)
      {
        uint64_t v30 = *((void *)this + i + 151);
        if (v30)
        {
          uint64_t v31 = *(void *)(v30 + 24);
          LOBYTE(a6) = *((unsigned char *)this + i + 1816);
          float v32 = (float)LODWORD(a6);
          if (*(float *)(v31 + 20) >= v32) {
            float v33 = v32;
          }
          else {
            float v33 = *(float *)(v31 + 20);
          }
          if (*(float *)(v31 + 24) >= v32) {
            float v34 = v32;
          }
          else {
            float v34 = *(float *)(v31 + 24);
          }
          uint64_t v35 = *(void *)(v30 + 40);
          GLRResourceList::addResource(*((void *)this + 8), v35);
          ((void (*)(void, void, void, uint64_t, float, float))a4[1])(*((void *)this + 2), *a4, *(void *)(v35 + 32), i, v33, v34);
        }
      }
      if ((*((_DWORD *)this + 660) & v29) != 0)
      {
        uint64_t v36 = (char *)this + 8 * i;
        uint64_t v37 = *((void *)v36 + 447);
        *a3 &= ~v29;
        if (v37)
        {
          uint64_t v38 = *((void *)v36 + 119);
          if (*(void *)(v38 + 136))
          {
            GLDContextRec::dispatchImageQueueEvent(this, (GLDTextureRec *)v38);
            uint64_t v38 = *((void *)v36 + 119);
          }
          if (*(unsigned char *)(v38 + 74)) {
            *a3 |= v29;
          }
          uint64_t v39 = *(void *)(v37 + 40);
          GLRResourceList::addResource(*((void *)this + 8), v37);
          GLRResourceList::addResource(*((void *)this + 8), v39);
          ((void (*)(void, void, void, uint64_t))a5[1])(*((void *)this + 2), *a5, *(void *)(v39 + 32), i);
        }
      }
    }
  }
  return v41 != *a3;
}

BOOL GLDContextRec::setRenderSamplersAndTextures(GLDContextRec *this, float a2)
{
  if (GLDContextRec::setRenderTexturesAndSamplersInternal(this, 0, (int *)this + 664, (void *)this + 439, (void *)this + 435, a2))
  {
    *((_DWORD *)this + 546) = *((_DWORD *)this + 664);
    *((_DWORD *)this + 618) |= 8u;
  }
  BOOL result = GLDContextRec::setRenderTexturesAndSamplersInternal(this, 4u, (int *)this + 665, (void *)this + 441, (void *)this + 437, v3);
  if (result)
  {
    *((_DWORD *)this + 547) = *((_DWORD *)this + 665);
    *((_DWORD *)this + 618) |= 8u;
  }
  return result;
}

uint64_t GLDContextRec::setRenderVertexBuffers(uint64_t this)
{
  uint64_t v1 = this;
  uint64_t v2 = *(unsigned int *)(this + 316);
  if (v2)
  {
    for (uint64_t i = 0; i != v2; ++i)
    {
      uint64_t v4 = *(unsigned __int8 *)(v1 + *(unsigned __int8 *)(v1 + 320 + i) + 336);
      int v5 = *(_DWORD *)(v1 + 2668);
      if (((1 << v4) & v5) != 0)
      {
        *(_DWORD *)(v1 + 2668) = (1 << v4) ^ v5;
        uint64_t v6 = *(void *)(v1 + 8 * v4 + 2672);
        uint64_t v7 = *(unsigned int *)(v1 + 4 * v4 + 2800);
        uint64_t v8 = *(void *)(v6 + 40);
        GLRResourceList::addResource(*(void *)(v1 + 64), v6);
        this = (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t))(v1 + 3456))(*(void *)(v1 + 16), *(void *)(v1 + 3448), v8, v7, i + 15);
      }
      else
      {
        this = (*(uint64_t (**)(void, void, void, uint64_t))(v1 + 3552))(*(void *)(v1 + 16), *(void *)(v1 + 3544), *(unsigned int *)(v1 + 4 * v4 + 2800), i + 15);
      }
    }
  }
  uint64_t v9 = *(void *)(v1 + 2864);
  if (v9)
  {
    uint64_t v10 = *(void *)(v1 + 64);
    return GLRResourceList::addResource(v10, v9);
  }
  return this;
}

uint64_t GLDContextRec::setRenderVertexCurrents(GLDContextRec *this)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v1 = *((unsigned int *)this + 69);
  if (v1)
  {
    uint64_t v2 = *((void *)this + 13);
    float v3 = (unsigned __int8 *)this + 280;
    uint64_t v4 = v10;
    uint64_t v5 = *((unsigned int *)this + 69);
    do
    {
      unsigned int v6 = *v3++;
      uint64_t v7 = v2 + 32 * (v6 - 16) + 6416;
      uint64_t v8 = (_OWORD *)(v2 + 6160 + 16 * v6);
      if (v6 >= 0x10) {
        uint64_t v8 = (_OWORD *)v7;
      }
      *v4++ = *v8;
      --v5;
    }
    while (v5);
  }
  return (*((uint64_t (**)(void, void, unsigned char *, uint64_t, uint64_t))this + 428))(*((void *)this + 2), *((void *)this + 427), v10, 16 * v1, 14);
}

uint64_t GLDContextRec::setRenderPrimitiveCurrents(GLDContextRec *this)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  uint64_t v1 = *((unsigned int *)this + 74);
  if (v1)
  {
    uint64_t v2 = *((void *)this + 13);
    float v3 = (unsigned __int8 *)this + 300;
    uint64_t v4 = v10;
    uint64_t v5 = *((unsigned int *)this + 74);
    do
    {
      unsigned int v6 = *v3++;
      uint64_t v7 = v2 + 32 * (v6 - 16) + 6416;
      uint64_t v8 = (_OWORD *)(v2 + 6160 + 16 * v6);
      if (v6 >= 0x10) {
        uint64_t v8 = (_OWORD *)v7;
      }
      *v4++ = *v8;
      --v5;
    }
    while (v5);
  }
  return (*((uint64_t (**)(void, void, unsigned char *, uint64_t, uint64_t))this + 428))(*((void *)this + 2), *((void *)this + 427), v10, 16 * v1, 14);
}

uint64_t GLDContextRec::setRenderUniformBuffersInternal(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a4)
  {
    uint64_t v9 = result;
    for (uint64_t i = 0; i != a4; ++i)
    {
      uint64_t v11 = *(void *)(a2 + 8 * i);
      if (v11)
      {
        GLRResourceList::addResource(*(void *)(v9 + 64), *(void *)(a2 + 8 * i));
        BOOL result = (*(uint64_t (**)(void, void, void, void, uint64_t))(a5 + 8))(*(void *)(v9 + 16), *(void *)a5, *(void *)(v11 + 40), *(void *)(a3 + 8 * i), i);
      }
    }
  }
  return result;
}

uint64_t GLDContextRec::setRenderProgramUniformsInternal(uint64_t this, unsigned int a2, uint64_t *a3, uint64_t a4)
{
  uint64_t v4 = this;
  uint64_t v5 = *(void *)(this + 8 * a2 + 1504);
  if (v5)
  {
    uint64_t v6 = *(void *)(v5 + 24);
    uint64_t v7 = *(unsigned int *)(v6 + 40);
    if (!v7) {
      return this;
    }
    size_t v8 = 16 * v7;
    if (v7 >= 0x101)
    {
      __dst = 0;
      unint64_t v19 = 0;
      VertexBuffer = GLDContextRec::getVertexBuffer((void **)this, 16 * v7, &__dst, &v19);
      memcpy(__dst, *(const void **)(v6 + 32), v8);
      return (*(uint64_t (**)(void, void, void *, unint64_t, uint64_t))(a4 + 8))(*(void *)(v4 + 16), *(void *)a4, VertexBuffer, v19, 12);
    }
    uint64_t v13 = *(void *)(this + 16);
    uint64_t v15 = *a3;
    uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))a3[1];
    uint64_t v17 = *(void *)(v6 + 32);
    uint64_t v14 = 16 * v7;
  }
  else
  {
    if (!*(void *)(this + 8 * a2 + 1464)) {
      return this;
    }
    uint64_t v11 = *(void *)(this + 104) + 16 * a2;
    uint64_t v12 = *(unsigned int *)(v11 + 15636);
    if (!v12) {
      return this;
    }
    uint64_t v13 = *(void *)(this + 16);
    uint64_t v14 = 16 * v12;
    uint64_t v15 = *a3;
    uint64_t v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))a3[1];
    uint64_t v17 = *(void *)(v11 + 15640);
  }

  return v16(v13, v15, v17, v14, 12);
}

uint64_t GLDContextRec::setRenderProgramUniforms(GLDContextRec *this)
{
  GLDContextRec::setRenderProgramUniformsInternal((uint64_t)this, 0, (uint64_t *)this + 427, (uint64_t)this + 3448);

  return GLDContextRec::setRenderProgramUniformsInternal((uint64_t)this, 4u, (uint64_t *)this + 429, (uint64_t)this + 3464);
}

uint64_t getMTLBlendOperation(__int16 a1)
{
  if (unsigned __int16)(a1 + 32762) < 6u && ((0x37u >> (a1 - 6))) {
    return qword_2406F53F8[(__int16)(a1 + 32762)];
  }
  uint64_t v2 = MTLReleaseAssertionFailure();
  return GLDContextRec::updateRenderColorMaskMode(v2);
}

uint64_t GLDContextRec::updateRenderColorMaskMode(uint64_t this)
{
  uint64_t v1 = 0;
  uint64_t v2 = (unsigned __int8 *)(*(void *)(this + 104) + 13064);
  do
  {
    uint64_t v3 = *(void *)(this + 4416 + 8 * v1);
    if (v3)
    {
      int v4 = 1 << v1;
      if (((1 << v1) & v2[1]) != 0) {
        uint64_t v5 = (8 * (((1 << v1) & *v2) != 0)) | 4;
      }
      else {
        uint64_t v5 = 8 * (((1 << v1) & *v2) != 0);
      }
      if ((v4 & v2[2]) != 0) {
        v5 |= 2uLL;
      }
      uint64_t v3 = v5 | ((v4 & v2[3]) != 0);
    }
    if (v3 != *(unsigned __int8 *)(this + v1 + 2608))
    {
      *(unsigned char *)(this + v1 + 2608) = v3;
      *(_DWORD *)(this + 4 * v1 + 2152) = *(_DWORD *)(this + 4 * v1 + 2152) & 0xF87FFFFF | ((v3 & 0xF) << 23);
      *(_DWORD *)(this + 2472) |= 8u;
      int v6 = 1 << v1;
      if (v3) {
        int v7 = *(_DWORD *)(this + 5044) | v6;
      }
      else {
        int v7 = *(_DWORD *)(this + 5044) & ~v6;
      }
      *(_DWORD *)(this + 5044) = v7;
    }
    ++v1;
  }
  while (v1 != 4);
  return this;
}

uint64_t GLDContextRec::updateRenderClipPlanes(uint64_t this)
{
  *(unsigned char *)(this + 2180) = *(_DWORD *)(*(void *)(this + 104) + 15300);
  *(_DWORD *)(this + 2472) |= 8u;
  return this;
}

uint64_t GLDContextRec::updateRenderLineMode(uint64_t this)
{
  if (*(float *)(*(void *)(this + 104) + 13032) >= 1.0) {
    float v1 = *(float *)(*(void *)(this + 104) + 13032);
  }
  else {
    float v1 = 1.0;
  }
  float v2 = roundf(v1);
  if (*(_DWORD *)(this + 4596) > 1u) {
    float v2 = *(float *)(*(void *)(this + 104) + 13032);
  }
  *(float *)(this + 5208) = v2;
  float v3 = 16.0;
  if (v2 > 16.0 || (float v3 = 1.0, v2 < 1.0)) {
    *(float *)(this + 5208) = v3;
  }
  *(_DWORD *)(this + 2472) |= 0x2000u;
  return this;
}

uint64_t GLDContextRec::setRenderLineMode(GLDContextRec *this, double a2)
{
  LODWORD(a2) = *((_DWORD *)this + 1302);
  return [*((id *)this + 2) setLineWidth:a2];
}

uint64_t GLDContextRec::setRenderPolygonMode(id *this)
{
  [this[2] setFrontFacingWinding:this[637]];
  [this[2] setCullMode:this[638]];
  LODWORD(v2) = *((_DWORD *)this + 1300);
  LODWORD(v3) = *((_DWORD *)this + 1301);
  [this[2] setDepthBias:v2 slopeScale:v3 clamp:0.0];
  id v4 = this[2];
  id v5 = this[639];

  return [v4 setTriangleFillMode:v5];
}

uint64_t GLDContextRec::updateRenderPrimitiveRestart(uint64_t this)
{
  *(unsigned char *)(this + 5084) = *(unsigned char *)(*(void *)(this + 104) + 15444) != 0;
  *(_DWORD *)(this + 2472) |= 0x8000u;
  return this;
}

uint64_t GLDContextRec::setRenderPrimitiveRestart(id *this)
{
  return [this[2] setPrimitiveRestartEnabled:*((unsigned __int8 *)this + 5084)];
}

uint64_t GLDContextRec::updateRenderDepthStencil(uint64_t this)
{
  uint64_t v1 = this;
  unint64_t v2 = 0x700700700000000;
  uint64_t v24 = 0x700700700000000;
  uint64_t v3 = *(void *)(this + 104);
  uint64_t v4 = v3 + 13068;
  if ((*(unsigned char *)(v3 + 13372) & 1) != 0 && *(void *)(this + 4488))
  {
    *(void *)(this + 424) |= 0x800uLL;
    int v5 = *(_DWORD *)(v3 + 13328);
    if (*(_DWORD *)(this + 5212) == v5)
    {
      int v6 = *(_DWORD *)(v3 + 13360);
      if (*(_DWORD *)(this + 5216) == v6) {
        goto LABEL_8;
      }
    }
    else
    {
      int v6 = *(_DWORD *)(v3 + 13360);
    }
    *(_DWORD *)(this + 5212) = v5;
    *(_DWORD *)(this + 5216) = v6;
    *(_DWORD *)(this + 2472) |= 0x80u;
LABEL_8:
    int v7 = *(unsigned __int8 *)(v3 + 13324);
    int v8 = *(_DWORD *)(v3 + 13052);
    __int16 v9 = *(_WORD *)(v3 + 13332);
    uint64_t MTLStencilOperation = getMTLStencilOperation(*(_WORD *)(v3 + 13334));
    uint64_t v11 = getMTLStencilOperation(*(_WORD *)(v3 + 13336));
    uint64_t v12 = getMTLStencilOperation(*(_WORD *)(v3 + 13338));
    unint64_t v13 = v7 & 0xFFFF00FF | (v8 << 8) | ((unint64_t)(v9 & 7) << 32) | (MTLStencilOperation << 35) | (v11 << 38);
    int v14 = *(_DWORD *)(v3 + 13356);
    int v15 = *(_DWORD *)(v3 + 13060);
    __int16 v16 = *(_WORD *)(v4 + 296);
    uint64_t v17 = getMTLStencilOperation(*(_WORD *)(v4 + 298));
    uint64_t v18 = getMTLStencilOperation(*(_WORD *)(v4 + 300));
    this = getMTLStencilOperation(*(_WORD *)(v4 + 302));
    unint64_t v2 = ((v14 << 16) | (v15 << 24) | ((unint64_t)(v16 & 7) << 44) | (v17 << 47) | (v18 << 50) | (this << 53))
       + (v13 | (v12 << 41) | 0x700000000000000);
    uint64_t v24 = v2;
    uint64_t v3 = *(void *)(v1 + 104);
  }
  if (*(unsigned char *)(v3 + 12932) && *(void *)(v1 + 4480))
  {
    unint64_t v2 = v2 & 0xF0FFFFFFFFFFFFFFLL | ((unint64_t)(*(_WORD *)(v3 + 12928) & 7) << 56) | ((unint64_t)(*(unsigned char *)v4 != 0) << 59);
    uint64_t v24 = v2;
  }
  if (v2 != *(void *)(v1 + 2312))
  {
    *(void *)(v1 + 2312) = v2;
    DepthStencilStateFromKey = (void *)GLDDeviceRec::getDepthStencilStateFromKey(*(GLDDeviceRec **)(v1 + 96), (const GLRDepthStencilKey *)&v24);
    *(void *)(v1 + 2464) = DepthStencilStateFromKey;
    *(_DWORD *)(v1 + 2472) |= 0x40u;
    if ([DepthStencilStateFromKey writesStencil]) {
      int v20 = 512;
    }
    else {
      int v20 = 0;
    }
    *(_DWORD *)(v1 + 5044) = *(_DWORD *)(v1 + 5044) & 0xFFFFFDFF | v20;
    if ([*(id *)(v1 + 2464) readsStencil]) {
      int v21 = 512;
    }
    else {
      int v21 = 0;
    }
    *(_DWORD *)(v1 + 5048) = *(_DWORD *)(v1 + 5048) & 0xFFFFFDFF | v21;
    if ([*(id *)(v1 + 2464) writesDepth]) {
      int v22 = 256;
    }
    else {
      int v22 = 0;
    }
    *(_DWORD *)(v1 + 5044) = *(_DWORD *)(v1 + 5044) & 0xFFFFFEFF | v22;
    this = [*(id *)(v1 + 2464) readsDepth];
    if (this) {
      int v23 = 256;
    }
    else {
      int v23 = 0;
    }
    *(_DWORD *)(v1 + 5048) = *(_DWORD *)(v1 + 5048) & 0xFFFFFEFF | v23;
  }
  return this;
}

uint64_t GLDContextRec::setRenderDepthStencilState(id *this)
{
  return [this[2] setDepthStencilState:this[308]];
}

uint64_t GLDContextRec::setRenderDepthStencilRef(id *this)
{
  return [this[2] setStencilFrontReferenceValue:*((unsigned int *)this + 1303) backReferenceValue:*((unsigned int *)this + 1304)];
}

uint64_t GLDContextRec::setRenderState(uint64_t this, int a2)
{
  unsigned int v2 = *(_DWORD *)(this + 2472) & a2;
  *(_DWORD *)(this + 2476) = v2;
  if (v2)
  {
    uint64_t v4 = this;
    do
    {
      unsigned int v5 = __clz(__rbit32(v2));
      uint64_t v6 = *(void *)(v4 + 2488) + 16 * v5;
      int v7 = *(uint64_t (**)(void *))v6;
      uint64_t v8 = *(void *)(v6 + 8);
      __int16 v9 = (void *)(v4 + (v8 >> 1));
      if (v8) {
        int v7 = *(uint64_t (**)(void *))(*v9 + v7);
      }
      this = v7(v9);
      int v10 = *(_DWORD *)(v4 + 2472) ^ (1 << v5);
      *(_DWORD *)(v4 + 2472) = v10;
      unsigned int v2 = v10 & a2;
    }
    while (v2);
  }
  return this;
}

__n128 GLDContextRec::setRenderVertexArrayState(GLDContextRec *this)
{
  unsigned int v2 = (GLDVertexArrayRec *)*((void *)this + 49);
  if (v2) {
    GLDContextRec::buildVertexArrayDescriptor((uint64_t)this, *((GLDPipelineProgramRec **)this + 183), v2);
  }
  uint32x2_t v4 = (uint32x2_t)veor_s8(*(int8x8_t *)((char *)this + 1920), *(int8x8_t *)((char *)this + 2128));
  result.n128_u64[0] = (unint64_t)vpmax_u32(v4, v4);
  if (vmaxvq_u32((uint32x4_t)vorrq_s8(vorrq_s8(veorq_s8(*((int8x16_t *)this + 117), *((int8x16_t *)this + 130)), veorq_s8(*((int8x16_t *)this + 116), *((int8x16_t *)this + 129))), vorrq_s8(veorq_s8(*((int8x16_t *)this + 118), *((int8x16_t *)this + 131)), veorq_s8(*((int8x16_t *)this + 119), *((int8x16_t *)this + 132)))))+ result.n128_u32[0])
  {
    long long v5 = *((_OWORD *)this + 119);
    *((_OWORD *)this + 131) = *((_OWORD *)this + 118);
    *((_OWORD *)this + 132) = v5;
    *((void *)this + 266) = *((void *)this + 240);
    __n128 result = *((__n128 *)this + 117);
    *((_OWORD *)this + 129) = *((_OWORD *)this + 116);
    *((__n128 *)this + 130) = result;
    *((_DWORD *)this + 618) |= 8u;
    *((_DWORD *)this + 621) |= 1u;
  }
  return result;
}

__n128 GLDContextRec::setRenderPrimitiveBufferState(GLDContextRec *this)
{
  uint32x2_t v1 = (uint32x2_t)veor_s8(*(int8x8_t *)((char *)this + 2048), *(int8x8_t *)((char *)this + 2128));
  result.n128_u64[0] = (unint64_t)vpmax_u32(v1, v1);
  if (vmaxvq_u32((uint32x4_t)vorrq_s8(vorrq_s8(veorq_s8(*((int8x16_t *)this + 125), *((int8x16_t *)this + 130)), veorq_s8(*((int8x16_t *)this + 124), *((int8x16_t *)this + 129))), vorrq_s8(veorq_s8(*((int8x16_t *)this + 126), *((int8x16_t *)this + 131)), veorq_s8(*((int8x16_t *)this + 127), *((int8x16_t *)this + 132)))))+ result.n128_u32[0])
  {
    long long v3 = *((_OWORD *)this + 127);
    *((_OWORD *)this + 131) = *((_OWORD *)this + 126);
    *((_OWORD *)this + 132) = v3;
    *((void *)this + 266) = *((void *)this + 256);
    __n128 result = *((__n128 *)this + 125);
    *((_OWORD *)this + 129) = *((_OWORD *)this + 124);
    *((__n128 *)this + 130) = result;
    *((_DWORD *)this + 618) |= 8u;
    *((_DWORD *)this + 621) |= 1u;
  }
  return result;
}

double GLDContextRec::updateRenderViewport(GLDContextRec *this, double a2, double a3, double a4, double a5, float a6)
{
  uint64_t v6 = (float *)*((void *)this + 13);
  float v7 = v6[1736];
  float v8 = v6[1742];
  if (*((unsigned char *)this + 5080))
  {
    LOWORD(a6) = *(_WORD *)(*(void *)(*((void *)this + 50) + 32) + 180);
    float v9 = (float)LODWORD(a6);
    float v10 = v6[1737];
    float v11 = v9 - (float)(v6[1741] + v10);
    double v12 = 2.0;
  }
  else
  {
    float v10 = v6[1737];
    float v11 = v6[1741] + v10;
    double v12 = -2.0;
  }
  double v13 = (float)(v8 + v6[1738]);
  double result = (float)(v6[1740] - v7);
  *((double *)this + 640) = result;
  *((double *)this + 641) = v11;
  *((double *)this + 642) = v7 + v7;
  *((double *)this + 643) = v12 * v10;
  *((double *)this + 644) = v8;
  *((double *)this + 645) = v13;
  *((_DWORD *)this + 618) |= 0x10u;
  return result;
}

uint64_t GLDContextRec::updateRenderScissor(uint64_t this)
{
  uint64_t v1 = *(void *)(*(void *)(this + 400) + 32);
  int v2 = *(unsigned __int16 *)(v1 + 178);
  int v3 = *(unsigned __int16 *)(v1 + 180);
  uint64_t v4 = *(void *)(this + 104);
  int v5 = *(unsigned __int8 *)(v4 + 13284);
  if (*(unsigned char *)(v4 + 13284))
  {
    *(void *)(this + 424) |= 0x400uLL;
    int v6 = *(_DWORD *)(v4 + 13268);
    int v7 = *(_DWORD *)(v4 + 13272);
    int v8 = *(_DWORD *)(v4 + 13276);
    int v9 = *(_DWORD *)(v4 + 13280);
    unsigned int v10 = v6 & ~(v6 >> 31);
    int v11 = v8 + (v6 & (v6 >> 31));
    if ((int)(v11 + v10) <= v2) {
      int v2 = v11;
    }
    else {
      v2 -= v10;
    }
    int v5 = v7 & ~(v7 >> 31);
    int v12 = v9 + (v7 & (v7 >> 31));
    int v13 = v3 - v5;
    BOOL v16 = v12 + v5 <= v3;
    int v14 = v3 - v5;
    if (!v16) {
      int v12 = v13;
    }
    int v15 = v14 - v12;
    if (*(unsigned char *)(this + 5080)) {
      int v5 = v15;
    }
    int v3 = v12;
  }
  else
  {
    unsigned int v10 = 0;
  }
  BOOL v16 = v2 < 1 || v3 < 1;
  if (v16)
  {
    unsigned int v10 = 0;
    int v5 = 0;
    char v17 = 1;
    int v2 = 1;
    int v3 = 1;
  }
  else
  {
    char v17 = 0;
  }
  *(unsigned char *)(this + 5083) = v17;
  *(void *)(this + 5168) = v10;
  *(void *)(this + 5176) = v5;
  *(void *)(this + 5184) = v2;
  *(void *)(this + 5192) = v3;
  *(_DWORD *)(this + 2472) |= 0x20u;
  return this;
}

uint64_t GLDContextRec::setRenderScissor(GLDContextRec *this)
{
  uint64_t v1 = (void *)*((void *)this + 2);
  long long v2 = *((_OWORD *)this + 324);
  v4[0] = *((_OWORD *)this + 323);
  v4[1] = v2;
  return [v1 setScissorRect:v4];
}

uint64_t GLDContextRec::setRenderBlendColors(GLDContextRec *this, double a2, double a3, double a4, double a5)
{
  int v5 = (_DWORD *)*((void *)this + 13);
  LODWORD(a2) = v5[3208];
  LODWORD(a3) = v5[3209];
  LODWORD(a4) = v5[3210];
  LODWORD(a5) = v5[3211];
  return [*((id *)this + 2) setBlendColorRed:a2 green:a3 blue:a4 alpha:a5];
}

uint64_t GLDContextRec::updateRenderAlphaTestState(uint64_t this)
{
  uint64_t v1 = *(void *)(this + 104);
  int v2 = *(unsigned __int16 *)(v1 + 12732);
  int v3 = *(unsigned __int8 *)(v1 + 12734);
  if (v2 != *(unsigned __int16 *)(this + 5220) || v3 != *(unsigned __int8 *)(this + 5222))
  {
    *(_WORD *)(this + 5220) = v2;
    uint64_t v4 = v3 != 0;
    *(unsigned char *)(this + 5222) = v4;
    *(void *)(this + 2176) = ((unint64_t)(v2 & 7) << 57) | (v4 << 60) | *(void *)(this + 2176) & 0xE1FFFFFFFFFFFFFFLL;
    *(_DWORD *)(this + 2472) |= 8u;
    if (v3) {
      *(void *)(this + 424) |= 1uLL;
    }
  }
  float v5 = *(float *)(v1 + 12728);
  if (v5 != *(float *)(this + 5224))
  {
    *(float *)(this + 5224) = v5;
    *(_DWORD *)(this + 2472) |= 0x4000u;
  }
  return this;
}

uint64_t GLDContextRec::updateRenderLogicOpState(uint64_t this)
{
  uint64_t v1 = (unsigned __int16 *)(*(void *)(this + 104) + 13044);
  unint64_t v2 = *(void *)(this + 2176) & 0xFEFFFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned char *)(*(void *)(this + 104) + 13047) != 0) << 56);
  *(void *)(this + 2176) = v2;
  *(void *)(this + 2176) = v2 & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(_glLogicOpTable[*v1 - 5376] & 0xF) << 52);
  *(_DWORD *)(this + 2472) |= 8u;
  return this;
}

uint64_t GLDContextRec::setRenderAlphaTestReferenceValue(GLDContextRec *this, double a2)
{
  LODWORD(a2) = *((_DWORD *)this + 1306);
  return [*((id *)this + 2) setAlphaTestReferenceValue:a2];
}

void GLDVertexArrayRec::~GLDVertexArrayRec(GLDVertexArrayRec *this)
{
  GLDObject::~GLDObject(this);

  GLDObject::operator delete(v1);
}

uint64_t GLDVertexArrayRec::dealloc(id *this)
{
  return GLDObject::dealloc((uint64_t)this);
}

BOOL GLDVertexArrayRec::updateBuffers(GLDVertexArrayRec *this, uint64_t a2)
{
  uint64_t v2 = a2;
  if ((a2 & 4) != 0)
  {
    uint64_t v4 = *(GLDBufferRec **)(*((void *)this + 7) + 256);
    if (v4) {
      LOBYTE(v4) = GLDBufferRec::loadUnlocked(v4);
    }
    *((unsigned char *)this + 64) = (_BYTE)v4;
  }
  unint64_t v5 = *(void *)(*((void *)this + 6) + 768) & v2;
  if (v5)
  {
    do
    {
      unint64_t v6 = __clz(__rbit64(v5));
      v5 ^= 1 << v6;
      if (GLDBufferRec::loadUnlocked(*(GLDBufferRec **)(*((void *)this + 7) + 8 * v6 - 128)))
      {
        BOOL v7 = v5 == 0;
      }
      else
      {
        uint64_t v2 = 0;
        BOOL v7 = 1;
      }
    }
    while (!v7);
  }
  return v2 != 0;
}

uint64_t glrVertexFormatComponentAttribSizeTypeAlignment(MTLVertexFormat a1, unsigned __int8 *a2, unsigned __int8 *a3)
{
  int v3 = (unsigned __int8 *)&glrSupportedVertexFormatTableData + 16 * a1;
  *a2 = v3[11];
  *a3 = v3[10];
  return v3[9];
}

uint64_t glrConvertVertexElementType(int a1, int a2)
{
  if ((a1 & 0x2000) != 0)
  {
    unsigned int v3 = a1 & 0xFFFF9FFF;
    switch(a1 & 0xFFFF9FFF)
    {
      case 0x1400u:
        if (a2 == 1)
        {
          uint64_t result = 48;
        }
        else
        {
          if (a2 < 2) {
            goto LABEL_52;
          }
          uint64_t result = a2 + 8;
        }
        break;
      case 0x1401u:
        if (a2 == 1)
        {
          uint64_t result = 47;
        }
        else
        {
          if (a2 < 2) {
            goto LABEL_52;
          }
          uint64_t result = a2 + 5;
        }
        break;
      case 0x1402u:
        if (a2 == 1)
        {
          uint64_t result = 52;
        }
        else
        {
          if (a2 < 2) {
            goto LABEL_52;
          }
          uint64_t result = a2 + 20;
        }
        break;
      case 0x1403u:
        if (a2 == 1)
        {
          uint64_t result = 51;
        }
        else
        {
          if (a2 < 2) {
            goto LABEL_52;
          }
          uint64_t result = a2 + 17;
        }
        break;
      default:
        if (v3 == 33640)
        {
          if (a2 == 4) {
            return 41;
          }
        }
        else if (v3 == 36255 && a2 == 4)
        {
          return 40;
        }
LABEL_52:
        uint64_t result = 0;
        break;
    }
  }
  else
  {
    switch(a1 & 0xFFFFBFFF)
    {
      case 0x1400u:
        if (a2 == 1) {
          return 46;
        }
        if (a2 < 2) {
          goto LABEL_52;
        }
        return a2 + 2;
      case 0x1401u:
        if (a2 == 1) {
          return 45;
        }
        if (a2 < 2) {
          goto LABEL_52;
        }
        return a2 - 1;
      case 0x1402u:
        if (a2 == 1) {
          return 50;
        }
        if (a2 < 2) {
          goto LABEL_52;
        }
        return a2 + 14;
      case 0x1403u:
        if (a2 == 1) {
          return 49;
        }
        if (a2 < 2) {
          goto LABEL_52;
        }
        return a2 + 11;
      case 0x1404u:
        if (a2 < 1) {
          goto LABEL_52;
        }
        return a2 + 31;
      case 0x1405u:
        if (a2 < 1) {
          goto LABEL_52;
        }
        return a2 + 35;
      case 0x1406u:
        if (a2 < 1) {
          goto LABEL_52;
        }
        return a2 + 27;
      case 0x140Bu:
        if (a2 == 1) {
          return 53;
        }
        if (a2 < 2) {
          goto LABEL_52;
        }
        uint64_t result = a2 + 23;
        break;
      default:
        goto LABEL_52;
    }
  }
  return result;
}

uint64_t GLDVertexArrayRec::updateVertexArrayBuffers(GLDVertexArrayRec *this, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *((void *)this + 6);
  unint64_t v4 = a2 & 0xFFFFFFFF0000;
  if (!a3)
  {
    if (v4)
    {
      uint64_t v13 = *(void *)(v3 + 768);
      while (1)
      {
        int v14 = __clz(__rbit64(v4));
        unsigned int v15 = v14 - 16;
        uint64_t v16 = 0x10000 << (v14 - 16);
        if ((v13 & v16) != 0)
        {
          uint64_t v17 = glrConvertVertexElementType(*(unsigned __int16 *)(v3 + 24 * v15 + 20), *(char *)(v3 + 24 * v15 + 22));
          uint64_t v18 = v17 ? glrSupportedVertexFormatTableData[16 * v17 + 10] : 4;
          if (((v18 - 1) & *(void *)(v3 + 24 * v15)) != 0) {
            break;
          }
        }
        v4 ^= v16;
        if (!v4) {
          return 1;
        }
      }
      return 0;
    }
    return 1;
  }
  if (!v4) {
    return 1;
  }
  uint64_t v5 = *(void *)(v3 + 768);
  while (1)
  {
    int v6 = __clz(__rbit64(v4));
    unsigned int v7 = v6 - 16;
    uint64_t v8 = 0x10000 << (v6 - 16);
    if ((v5 & v8) != 0)
    {
      uint64_t result = glrConvertVertexElementType(*(unsigned __int16 *)(v3 + 24 * v7 + 20), *(char *)(v3 + 24 * v7 + 22));
      if (!result) {
        return result;
      }
      unsigned int v10 = &glrSupportedVertexFormatTableData[16 * result];
      if (((v10[10] - 1) & *(void *)(v3 + 24 * v7)) != 0) {
        break;
      }
      unint64_t v11 = *(int *)(v3 + 24 * v7 + 16);
      BOOL v12 = (int)v11 <= 4095 && (*(_DWORD *)(v3 + 24 * v7 + 16) & 3) == 0;
      if (!v12
        || *(_DWORD *)(v3 + 24 * v7 + 8) > 0x3FFu
        || (*(void *)(v3 + 24 * v7) & 3) + (unint64_t)v10[9] > v11)
      {
        break;
      }
    }
    v4 ^= v8;
    if (!v4) {
      return 1;
    }
  }
  return 0;
}

uint64_t gldCreateVertexArray(uint64_t a1, GLDLibrary **a2, uint64_t a3, uint64_t a4)
{
  GLDObject::operator new((GLDObject *)0x68);
  int v9 = v8;
  GLDObject::GLDObject(v8);
  *(void *)int v9 = &unk_26F4D6B10;
  GLDLibrary::getAllDisplayMask(v9);
  *((void *)v9 + 5) = a1;
  *((void *)v9 + 6) = a3;
  *((void *)v9 + 7) = a4;
  *((void *)v9 + 9) = objc_alloc_init(MEMORY[0x263F12A80]);
  *a2 = v9;
  return 0;
}

void sub_2406EC098(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t gldModifyVertexArray()
{
  return 0;
}

uint64_t gldFlushVertexArray()
{
  return 0;
}

BOOL gldBufferSubData(int a1, GLDBufferRec *this, uint64_t a3, uint64_t a4, uint64_t a5)
{
  BOOL result = GLDBufferRec::load(this);
  if (result)
  {
    if (**((void **)this + 3) + a3 == a5)
    {
      return 1;
    }
    else
    {
      GLDBufferRec::finishCPUAccess(this);
      return 0;
    }
  }
  return result;
}

uint64_t gldCopyBufferSubData()
{
  return 0;
}

NSObject *gldFinishBufferCPUAccess(int a1, GLDBufferRec *this)
{
  return GLDBufferRec::finishCPUAccess(this);
}

id *gldFlushMemoryPlugin(id *this, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 24);
  if (v2)
  {
    if (*(_DWORD *)(v2 + 12)) {
      return (id *)GLDContextRec::flushContext(this);
    }
  }
  return this;
}

uint64_t GLDContextRec::getClearPipelineState(GLDContextRec *this, int a2)
{
  uint64_t v3 = 0;
  unint64_t v4 = (GLDContextRec *)((char *)this + 2336);
  uint64_t v5 = (unsigned char *)(*((void *)this + 13) + 13064);
  int v6 = (char *)this + 2424;
  do
  {
    *((_WORD *)this + v3 + 1220) = *(void *)&v6[8 * v3 + 1992];
    int v7 = 1 << v3;
    if (((1 << v3) & a2) != 0)
    {
      if ((v7 & v5[1]) != 0) {
        char v8 = (8 * ((v7 & *v5) != 0)) | 4;
      }
      else {
        char v8 = 8 * ((v7 & *v5) != 0);
      }
      if ((v7 & v5[2]) != 0) {
        v8 |= 2u;
      }
      unsigned int v9 = *(_DWORD *)&v6[4 * v3] & 0xF87FFFFF | ((v8 & 0xE | (v5[3] >> v3) & 1) << 23);
    }
    else
    {
      unsigned int v9 = *(_DWORD *)&v6[4 * v3] & 0xF87FFFFF;
    }
    *(_DWORD *)&v6[4 * v3++] = v9;
  }
  while (v3 != 4);
  *((void *)this + 306) = *((void *)this + 306) & 0xFFFFB1FFFFFFFFFFLL | ((unint64_t)(*((void *)this + 560) == 252) << 41) | ((unint64_t)(*((void *)this + 561) == 253) << 46);
  *((void *)this + 301) = *((void *)this + 301) & 0xFFFF000000FFFFFFLL | ((GLDDeviceRec::getClearShaderFragmentFunction(*((GLDDeviceRec **)this + 12), *((unsigned int *)this + 657)) & 0xFFFFFF) << 24);
  uint64_t v10 = *((void *)this + 50);
  if (v10 && (unsigned int v11 = *(unsigned __int8 *)(*(void *)(v10 + 32) + 182), v11 >= 2))
  {
    unint64_t v12 = (glrConvertMultisampleCount(v11) & 0xF) << 48;
    unint64_t v13 = *((void *)this + 306) & 0xFFF0FFFFFFFFFFFFLL;
  }
  else
  {
    unint64_t v12 = *((void *)this + 306) & 0xFFF0FFFFFFFFFFFFLL;
    unint64_t v13 = 0x1000000000000;
  }
  *((void *)this + 306) = v12 | v13;
  return *(void *)(GLDDeviceRec::getRenderPipelineStateFromKey(*((GLDDeviceRec **)this + 12), v4) + 8);
}

void *GLDContextRec::getClearDepthStencilState(GLDContextRec *this, unsigned int a2)
{
  unint64_t v4 = (MTLDepthStencilDescriptor *)*((void *)this + 290);
  uint64_t v5 = [(MTLDepthStencilDescriptor *)v4 frontFaceStencil];
  [(MTLStencilDescriptor *)v5 setStencilCompareFunction:7];
  if ((a2 & 0x200) != 0)
  {
    [(MTLStencilDescriptor *)v5 setDepthStencilPassOperation:2];
    [(MTLStencilDescriptor *)v5 setDepthFailureOperation:2];
    [(MTLStencilDescriptor *)v5 setStencilFailureOperation:2];
    uint64_t v6 = *(unsigned int *)(*((void *)this + 13) + 13052);
  }
  else
  {
    [(MTLStencilDescriptor *)v5 setDepthStencilPassOperation:0];
    [(MTLStencilDescriptor *)v5 setDepthFailureOperation:0];
    [(MTLStencilDescriptor *)v5 setStencilFailureOperation:0];
    uint64_t v6 = 0;
  }
  [(MTLStencilDescriptor *)v5 setWriteMask:v6];
  [(MTLStencilDescriptor *)v5 setStencilCompareFunction:7];
  [(MTLDepthStencilDescriptor *)v4 setDepthCompareFunction:7];
  [(MTLDepthStencilDescriptor *)v4 setDepthWriteEnabled:(a2 >> 8) & 1];
  int v7 = (id *)*((void *)this + 12);

  return GLDDeviceRec::getDepthStencilStateFromDescriptor(v7, v4);
}

uint64_t GLDContextRec::clearBuffers(int8x8_t *this, unsigned int a2, uint32x4_t *a3)
{
  uint64_t v86 = *MEMORY[0x263EF8340];
  if (!*(void *)&this[2]
    || this[310].i32[0] && (GLDContextRec::endRenderPass((GLDContextRec *)this), !*(void *)&this[2]))
  {
    GLDContextRec::beginRenderPass((GLDContextRec *)this);
  }
  int8x8_t v6 = this[13];
  if (*(unsigned char *)(*(void *)&v6 + 13284)) {
    BOOL v8 = !*(_DWORD *)(*(void *)&v6 + 13268)
  }
      && !*(_DWORD *)(*(void *)&v6 + 13272)
      && (uint64_t v7 = *(void *)(*(void *)&this[50] + 32),
          *(_DWORD *)(*(void *)&v6 + 13276) == *(unsigned __int16 *)(v7 + 178))
      && *(_DWORD *)(*(void *)&v6 + 13280) == *(unsigned __int16 *)(v7 + 180);
  else {
    BOOL v8 = 1;
  }
  __asm { FMOV            V0.2S, #-1.0 }
  uint64_t v74 = _D0;
  __asm { FMOV            V0.2S, #1.0 }
  uint64_t v76 = _D0;
  unint64_t v79 = 0xBF8000003F800000;
  int v77 = -1082130432;
  int v80 = 1065353216;
  uint64_t v82 = _D0;
  int v83 = 1065353216;
  int v85 = 1065353216;
  float v15 = 0.0;
  if ((a2 & 0x100) != 0)
  {
    if (v8) {
      objc_msgSend(*(id *)&this[2], "setDepthCleared", 0.0);
    }
    if (a3[1].i32[2]) {
      float v15 = (float)a3[1].u32[0];
    }
    else {
      float v15 = *(float *)a3[1].i32;
    }
  }
  float v75 = v15;
  float v78 = v15;
  float v81 = v15;
  float v84 = v15;
  if ((v8 & (a2 >> 9)) == 1 && *(unsigned __int8 *)(*(void *)&this[13] + 13052) == 0xFF) {
    [*(id *)&this[2] setStencilCleared];
  }
  [*(id *)&this[2] setDepthBias:0.0 slopeScale:0.0 clamp:0.0];
  [*(id *)&this[2] setTriangleFillMode:0];
  [*(id *)&this[2] setFrontFacingWinding:1];
  __int32 v18 = this[309].i32[0];
  if ((v18 & 0x20) != 0)
  {
    GLDContextRec::setRenderScissor((GLDContextRec *)this);
    __int32 v18 = this[309].i32[0];
  }
  this[309].i32[0] = v18 & 0xFFFFFFDF;
  v72[0] = 0;
  v72[1] = 0;
  uint64_t v19 = *(void *)(*(void *)&this[50] + 32);
  LOWORD(v16) = *(_WORD *)(v19 + 178);
  LOWORD(v17) = *(_WORD *)(v19 + 180);
  int v20 = (void *)this[2];
  *(double *)&v72[2] = (double)v16;
  *(double *)&v72[3] = (double)v17;
  long long v73 = xmmword_2406F57B0;
  uint64_t result = [v20 setViewport:v72];
  __int32 v22 = this[327].i32[0];
  unsigned int v23 = a2 & 0x300;
  int v24 = v22 & a2;
  if ((v22 & a2) != 0)
  {
    uint64_t ClearPipelineState = GLDContextRec::getClearPipelineState((GLDContextRec *)this, v22 & a2);
    objc_msgSend(*(id *)&this[2], "setDepthStencilState:", GLDContextRec::getClearDepthStencilState((GLDContextRec *)this, a2 & 0x300));
    [*(id *)&this[2] setStencilReferenceValue:a3[1].u32[1]];
    [*(id *)&this[2] setRenderPipelineState:ClearPipelineState];
    [*(id *)&this[2] setCullMode:0];
    if (a3[1].i32[2]) {
      float32x4_t v26 = vcvtq_f32_u32(*a3);
    }
    else {
      float32x4_t v26 = *(float32x4_t *)a3;
    }
    objc_msgSend(*(id *)&this[2], "setVertexBytes:length:atIndex:", &v74, 64, 14, *(_OWORD *)&v26);
    [*(id *)&this[2] setFragmentBytes:v71 length:48 atIndex:14];
    if (this[279].i8[0])
    {
      uint64_t v27 = (char *)this[285];
      unint64_t v28 = (unint64_t)this[286];
      if ((unint64_t)v27 >= v28)
      {
        uint64_t v30 = (char *)this[284];
        uint64_t v31 = (v27 - v30) >> 2;
        unint64_t v32 = v31 + 1;
        if ((unint64_t)(v31 + 1) >> 62) {
          abort();
        }
        uint64_t v33 = v28 - (void)v30;
        if (v33 >> 1 > v32) {
          unint64_t v32 = v33 >> 1;
        }
        if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v34 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v34 = v32;
        }
        if (v34)
        {
          uint64_t v35 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&this[286], v34);
          uint64_t v27 = (char *)this[285];
          uint64_t v30 = (char *)this[284];
        }
        else
        {
          uint64_t v35 = 0;
        }
        uint64_t v36 = &v35[4 * v31];
        uint64_t v37 = &v35[4 * v34];
        *(_DWORD *)uint64_t v36 = -1;
        int v29 = v36 + 4;
        while (v27 != v30)
        {
          int v38 = *((_DWORD *)v27 - 1);
          v27 -= 4;
          *((_DWORD *)v36 - 1) = v38;
          v36 -= 4;
        }
        this[284] = (int8x8_t)v36;
        this[285] = (int8x8_t)v29;
        this[286] = (int8x8_t)v37;
        if (v30) {
          operator delete(v30);
        }
      }
      else
      {
        *(_DWORD *)uint64_t v27 = -1;
        int v29 = v27 + 4;
      }
      this[285] = (int8x8_t)v29;
    }
    uint64_t result = [*(id *)&this[2] drawPrimitives:4 vertexStart:0 vertexCount:4];
    this[629] = vorr_s8(this[629], (int8x8_t)vdup_n_s32(v24 | v23));
    a2 ^= v24 | v23;
    unsigned int v23 = 0;
  }
  __int32 v39 = this[327].i32[1];
  int v40 = v39 & a2;
  if ((v39 & a2) != 0)
  {
    uint64_t v41 = GLDContextRec::getClearPipelineState((GLDContextRec *)this, v39 & a2);
    objc_msgSend(*(id *)&this[2], "setDepthStencilState:", GLDContextRec::getClearDepthStencilState((GLDContextRec *)this, v23));
    [*(id *)&this[2] setStencilReferenceValue:a3[1].u32[1]];
    [*(id *)&this[2] setRenderPipelineState:v41];
    [*(id *)&this[2] setCullMode:0];
    if (a3[1].i32[2]) {
      int32x4_t v42 = *(int32x4_t *)a3;
    }
    else {
      int32x4_t v42 = vcvtq_s32_f32(*(float32x4_t *)a3);
    }
    v71[1] = v42;
    [*(id *)&this[2] setVertexBytes:&v74 length:64 atIndex:14];
    [*(id *)&this[2] setFragmentBytes:v71 length:48 atIndex:14];
    if (this[279].i8[0])
    {
      v43 = (char *)this[285];
      unint64_t v44 = (unint64_t)this[286];
      if ((unint64_t)v43 >= v44)
      {
        v46 = (char *)this[284];
        uint64_t v47 = (v43 - v46) >> 2;
        unint64_t v48 = v47 + 1;
        if ((unint64_t)(v47 + 1) >> 62) {
          abort();
        }
        uint64_t v49 = v44 - (void)v46;
        if (v49 >> 1 > v48) {
          unint64_t v48 = v49 >> 1;
        }
        if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v50 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v50 = v48;
        }
        if (v50)
        {
          v51 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&this[286], v50);
          v43 = (char *)this[285];
          v46 = (char *)this[284];
        }
        else
        {
          v51 = 0;
        }
        v52 = &v51[4 * v47];
        v53 = &v51[4 * v50];
        *(_DWORD *)v52 = -1;
        v45 = v52 + 4;
        while (v43 != v46)
        {
          int v54 = *((_DWORD *)v43 - 1);
          v43 -= 4;
          *((_DWORD *)v52 - 1) = v54;
          v52 -= 4;
        }
        this[284] = (int8x8_t)v52;
        this[285] = (int8x8_t)v45;
        this[286] = (int8x8_t)v53;
        if (v46) {
          operator delete(v46);
        }
      }
      else
      {
        *(_DWORD *)v43 = -1;
        v45 = v43 + 4;
      }
      this[285] = (int8x8_t)v45;
    }
    uint64_t result = [*(id *)&this[2] drawPrimitives:4 vertexStart:0 vertexCount:4];
    this[629] = vorr_s8(this[629], (int8x8_t)vdup_n_s32(v40 | v23));
    a2 &= ~(v40 | v23);
    unsigned int v23 = 0;
  }
  int v55 = this[328].i32[0] & a2;
  unsigned int v56 = v55 | v23;
  if (v55 | v23)
  {
    uint64_t v57 = GLDContextRec::getClearPipelineState((GLDContextRec *)this, v55);
    objc_msgSend(*(id *)&this[2], "setDepthStencilState:", GLDContextRec::getClearDepthStencilState((GLDContextRec *)this, v23));
    [*(id *)&this[2] setStencilReferenceValue:a3[1].u32[1]];
    [*(id *)&this[2] setRenderPipelineState:v57];
    [*(id *)&this[2] setCullMode:0];
    if (a3[1].i32[2]) {
      uint32x4_t v58 = *a3;
    }
    else {
      uint32x4_t v58 = vcvtq_u32_f32(*(float32x4_t *)a3);
    }
    v71[2] = v58;
    [*(id *)&this[2] setVertexBytes:&v74 length:64 atIndex:14];
    [*(id *)&this[2] setFragmentBytes:v71 length:48 atIndex:14];
    if (this[279].i8[0])
    {
      v59 = (char *)this[285];
      unint64_t v60 = (unint64_t)this[286];
      if ((unint64_t)v59 >= v60)
      {
        v62 = (char *)this[284];
        uint64_t v63 = (v59 - v62) >> 2;
        unint64_t v64 = v63 + 1;
        if ((unint64_t)(v63 + 1) >> 62) {
          abort();
        }
        uint64_t v65 = v60 - (void)v62;
        if (v65 >> 1 > v64) {
          unint64_t v64 = v65 >> 1;
        }
        if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v66 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v66 = v64;
        }
        if (v66)
        {
          v67 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&this[286], v66);
          v59 = (char *)this[285];
          v62 = (char *)this[284];
        }
        else
        {
          v67 = 0;
        }
        v68 = &v67[4 * v63];
        v69 = &v67[4 * v66];
        *(_DWORD *)v68 = -1;
        v61 = v68 + 4;
        while (v59 != v62)
        {
          int v70 = *((_DWORD *)v59 - 1);
          v59 -= 4;
          *((_DWORD *)v68 - 1) = v70;
          v68 -= 4;
        }
        this[284] = (int8x8_t)v68;
        this[285] = (int8x8_t)v61;
        this[286] = (int8x8_t)v69;
        if (v62) {
          operator delete(v62);
        }
      }
      else
      {
        *(_DWORD *)v59 = -1;
        v61 = v59 + 4;
      }
      this[285] = (int8x8_t)v61;
    }
    uint64_t result = [*(id *)&this[2] drawPrimitives:4 vertexStart:0 vertexCount:4];
    this[629] = vorr_s8(this[629], (int8x8_t)vdup_n_s32(v56));
  }
  this[309].i32[0] |= 0x1D8u;
  return result;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:nn180100]()
{
}

void GLDContextRec::GLDContextRec(GLDContextRec *this)
{
  GLDObject::GLDObject(this);
  *uint64_t v2 = &unk_26F4D6B60;
  v2[284] = 0;
  v2[286] = 0;
  v2[285] = 0;
  GLDTransformFeedbackMachine::GLDTransformFeedbackMachine((GLDTransformFeedbackMachine *)(v2 + 419));
  *((void *)this + 425) = 0;
  *(_OWORD *)((char *)this + 3384) = 0u;
}

void sub_2406ECB50(_Unwind_Exception *a1)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v3;
  if (*v3)
  {
    *((void *)v1 + 285) = v5;
    operator delete(v5);
  }
  GLDObject::~GLDObject(v1);
  _Unwind_Resume(a1);
}

BOOL GLDContextRec::initWithShareGroup(uint64_t a1, pthread_mutex_t *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  GLDLibrary::getAllDisplayMask((GLDLibrary *)a1);
  *(void *)(a1 + 88) = a2;
  GLDShareGroupRec::contextRetain(a2);
  uint64_t v12 = *(void *)(*(void *)(a1 + 88) + 224);
  *(void *)(a1 + 96) = v12;
  GLDObject::retain(v12);
  *(void *)(a1 + 104) = a3;
  *(void *)(a1 + 112) = a4;
  *(void *)(a1 + 120) = a5;
  *(void *)(a1 + 128) = a6;
  *(void *)(a1 + 4768) = 1;
  *(_DWORD *)(a1 + 6256) = 0;
  *(void *)(a1 + 5016) = 0;
  id v13 = objc_alloc_init(MEMORY[0x263F12818]);
  [v13 setIsOpenGLQueue:1];
  [v13 setMaxCommandBufferCount:8];
  GLDObject::operator new((GLDObject *)0x20);
  float v15 = v14;
  GLRResource::GLRResource(v14);
  *(void *)(a1 + 72) = v15;
  GLDLibrary::getAllDisplayMask(v15);
  *(_OWORD *)(a1 + 1856) = 0u;
  *(_OWORD *)(a1 + 1872) = 0u;
  *(_OWORD *)(a1 + 1888) = 0u;
  *(_OWORD *)(a1 + 1904) = 0u;
  *(void *)(a1 + 1920) = 0;
  *(_OWORD *)(a1 + 1984) = 0u;
  *(_OWORD *)(a1 + 2000) = 0u;
  *(_OWORD *)(a1 + 2016) = 0u;
  *(_OWORD *)(a1 + 2032) = 0u;
  *(void *)(a1 + 2048) = 0;
  GLRRenderPipelineKey::init((GLRRenderPipelineKey *)(a1 + 2064));
  GLRRenderPipelineKey::init((GLRRenderPipelineKey *)(a1 + 2336));
  GLRRenderPipelineCache::init((GLRRenderPipelineCache *)(a1 + 2192));
  *(void *)(a1 + 4888) = 850045863;
  *(_OWORD *)(a1 + 4896) = 0u;
  *(_OWORD *)(a1 + 4912) = 0u;
  *(_OWORD *)(a1 + 4928) = 0u;
  *(void *)(a1 + 4944) = 0;
  *(void *)(a1 + 4952) = 1018212795;
  *(_OWORD *)(a1 + 4960) = 0u;
  *(_OWORD *)(a1 + 4976) = 0u;
  *(void *)(a1 + 4992) = 0;
  *(void *)(a1 + 5264) = dispatch_group_create();
  if (*(unsigned char *)(*(void *)(a1 + 96) + 480)) {
    uint64_t v16 = 0x100000;
  }
  else {
    uint64_t v16 = 0x4000;
  }
  GLRDataBufferManager::init(a1 + 5272, (GLDContextRec *)a1, v16, 0x100000, 1);
  if (*(unsigned char *)(*(void *)(a1 + 96) + 480)) {
    uint64_t v17 = 0x100000;
  }
  else {
    uint64_t v17 = 0x4000;
  }
  GLRDataBufferManager::init(a1 + 5632, (GLDContextRec *)a1, v17, 0x100000, 1);
  mach_timebase_info((mach_timebase_info_t)(a1 + 5072));
  *(void *)(a1 + 2312) = *(void *)(a1 + 2312) & 0xF000000000000000 | 0x700700700000000;
  *(void *)(a1 + 2464) = GLDDeviceRec::getDepthStencilStateFromKey(*(GLDDeviceRec **)(a1 + 96), (const GLRDepthStencilKey *)(a1 + 2312));
  *(void *)(a1 + 2320) = objc_alloc_init(MEMORY[0x263F128A0]);
  *(void *)(a1 + 2408) = *(void *)(a1 + 2408) & 0xFFFFFFFFFF000000 | *(_DWORD *)(*(void *)(a1 + 96) + 104) & 0xFFFFFF;
  *(void *)(a1 + 5232) = glgCreateProcessor();
  GLDObject::operator new((GLDObject *)0x38);
  uint64_t v19 = (uint64_t)v18;
  GLRQueryResultBuffer::GLRQueryResultBuffer(v18);
  *(void *)(a1 + 4752) = v19;
  GLRQueryResultBuffer::initWithShareGroup(v19, *(GLDObject **)(a1 + 88));
  StagingBuffer = GLDContextRec::allocQueryStagingBuffer((GLDContextRec *)a1);
  uint64_t v21 = 0;
  *(void *)(a1 + 4760) = StagingBuffer;
  *(unsigned char *)(a1 + 2652) = 0;
  *(void *)(a1 + 2488) = &GLDContextRec::initWithShareGroup(GLDShareGroupRec *,GLDStateRec const*,GLDPluginStateRec const*,GLRPixelFormat const*,GLDContextConfigRec *)::setRenderDispatch;
  do
  {
    uint64_t v22 = a1 + v21;
    *(unsigned char *)(v22 + 2508) = 0;
    *(void *)(v22 + 2496) = 65537;
    *(_DWORD *)(v22 + 2504) = -2147057658;
    v21 += 14;
  }
  while (v21 != 112);
  *(void *)(a1 + 80) = objc_msgSend(*(id *)(*(void *)(a1 + 96) + 24), "newCommandQueueWithDescriptor:", v13, COERCE_DOUBLE(65537));

  uint64_t v23 = *(void *)(a1 + 80);
  if (v23)
  {
    GLDContextRec::populateConfigData(a1, a6);
    *(_DWORD *)(a1 + 432) = backtrace((void **)(a1 + 440), 64);
  }
  return v23 != 0;
}

void sub_2406ECE28(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLDContextRec::populateConfigData(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 120);
  int v5 = *(_DWORD *)(v4 + 28);
  int v27 = *(_DWORD *)(v4 + 24);
  int v28 = *(_DWORD *)(v4 + 20);
  int v7 = *(_DWORD *)(v4 + 32);
  int v6 = *(_DWORD *)(v4 + 36);
  char v8 = *(unsigned char *)(v4 + 44);
  char v9 = *(unsigned char *)(v4 + 45);
  int v10 = *(_DWORD *)(v4 + 52);
  int v11 = *(_DWORD *)(v4 + 56);
  int v12 = *(_DWORD *)(v4 + 60);
  *(_DWORD *)a2 = 0;
  id v13 = getenv("AGX_GL_VIEWPORT_INVERT_CONFIG");
  if (v13 && !strncmp(v13, "UPPER_LEFT", 0xAuLL)) {
    *(_DWORD *)a2 = 32;
  }
  else {
    *(unsigned char *)(a2 + 616) = 1;
  }
  *(unsigned char *)(a2 + 24) = 64;
  *(_WORD *)(a2 + 26) = 15553;
  *(unsigned char *)(a2 + 25) = *(unsigned char *)(a2 + 25) & 0x80 | 2;
  *(_WORD *)(a2 + 100) = 257;
  char v14 = 1;
  *(unsigned char *)(a2 + 110) = 1;
  *(_DWORD *)(a2 + 104) = 16843009;
  *(void *)(a2 + 32) = 0x6000000010000;
  *(unsigned char *)(a2 + 174) = 1;
  *(void *)(a2 + 124) = 0x8000000080;
  *(unsigned char *)(a2 + 40) = v8;
  *(unsigned char *)(a2 + 41) = v9;
  *(unsigned char *)(a2 + 42) = 0;
  *(unsigned char *)(a2 + 44) = 0;
  *(unsigned char *)(a2 + 43) = v6 == 5126;
  if (v6 == 5126)
  {
    if (v7 == 6408)
    {
      char v14 = 0;
      char v16 = 32;
      char v15 = 32;
      goto LABEL_12;
    }
LABEL_16:
    uint64_t v26 = MTLReleaseAssertionFailure();
    return gldDestroyContext(v26);
  }
  if (v6 == 33639)
  {
    char v16 = 8;
    char v15 = 8;
    goto LABEL_12;
  }
  if (v6 != 33638)
  {
    MTLReleaseAssertionFailure();
    goto LABEL_16;
  }
  char v14 = 0;
  char v15 = 1;
  char v16 = 5;
LABEL_12:
  *(unsigned char *)(a2 + 48) = v16;
  *(unsigned char *)(a2 + 49) = v16;
  *(unsigned char *)(a2 + 50) = v16;
  *(unsigned char *)(a2 + 51) = v15;
  *(unsigned char *)(a2 + 46) = 0;
  *(unsigned char *)(a2 + 45) = v14;
  *(unsigned char *)(a2 + 56) = v28;
  *(unsigned char *)(a2 + 57) = v27;
  *(unsigned char *)(a2 + 47) = v5;
  *(unsigned char *)(a2 + 58) = v10;
  *(unsigned char *)(a2 + 59) = v11 * v10 * v12 * v12;
  *(void *)(a2 + 112) = 0x400000000;
  int v17 = *(_DWORD *)(a2 + 576);
  int v18 = *(_DWORD *)(a2 + 580);
  *(int8x16_t *)(a2 + 560) = vorrq_s8(*(int8x16_t *)(a2 + 560), (int8x16_t)xmmword_2406F5810);
  *(_DWORD *)(a2 + 576) = v17 | 0xDF3F7FFF;
  *(_DWORD *)(a2 + 580) = v18 | 0x1A;
  uint64_t result = [*(id *)(*(void *)(a1 + 96) + 24) supportsFamily:1004];
  int v20 = *(_DWORD *)(a2 + 576);
  if (result) {
    v20 |= 0x20000000u;
  }
  *(_DWORD *)(a2 + 576) = v20 | 0x8000;
  *(_DWORD *)(a2 + 580) |= 1u;
  *(void *)(a2 + 584) = 0x800FC010800FFF0;
  *(_DWORD *)(a2 + 592) = 134282254;
  *(void *)(a2 + 4) = 0x400000004000;
  *(unsigned char *)(a2 + 20) = 4;
  *(_OWORD *)(a2 + 60) = xmmword_2406F5820;
  *(_OWORD *)(a2 + 76) = xmmword_2406F5830;
  *(void *)(a2 + 92) = 0x3F80000041800000;
  *(void *)(a2 + 176) = 4096;
  *(unsigned char *)(a2 + 175) = 16;
  __asm { FMOV            V0.2S, #16.0 }
  *(void *)(a2 + 144) = _D0;
  *(_WORD *)(a2 + 168) = 0x4000;
  *(_OWORD *)(a2 + 152) = xmmword_2406F5840;
  *(_DWORD *)(a2 + 170) = 4;
  *(_WORD *)(a2 + 352) = 12;
  *(void *)(a2 + 344) = 0x4000000800;
  *(_DWORD *)(a2 + 332) = 787328;
  *(_WORD *)(a2 + 446) = 24;
  *(void *)(a2 + 448) = 0x40000000003CLL;
  *(void *)(a2 + 428) = 0x7FFFFFFF8;
  *(_WORD *)(a2 + 504) = 64;
  *(unsigned char *)(a2 + 506) = 24;
  *(void *)(a2 + 464) = 0xF001F000F000FLL;
  *(unsigned char *)(a2 + 476) = 10;
  *(_DWORD *)(a2 + 472) = 8323087;
  *(_WORD *)(a2 + 477) = 5898;
  *(_OWORD *)(a2 + 480) = xmmword_2406F5850;
  *(void *)(a2 + 496) = 0x100000020;
  *(_WORD *)(a2 + 21) = 1028;
  *(void *)(a2 + 536) = a1 + 208;
  *(void *)(a2 + 544) = a1 + 140;
  *(_DWORD *)(a1 + 208) = 196609;
  *(_DWORD *)(a1 + 140) = 196609;
  *(unsigned char *)(a2 + 110) = 1;
  *(_DWORD *)(*(void *)(a1 + 96) + 528) = *(_DWORD *)(a2 + 620);
  return result;
}

uint64_t gldDestroyContext(atomic_uint *a1)
{
  if (a1)
  {
    GLDObject::release(a1);
    free(a1);
  }
  return 0;
}

uint64_t gldGetInteger(uint64_t a1, int a2, unint64_t *a3)
{
  if (a2 > 666)
  {
    switch(a2)
    {
      case 1400:
        goto LABEL_12;
      case 1401:
        uint64_t result = 0;
        uint64_t v6 = *(void *)(a1 + 88);
        uint64_t v7 = *(void *)(a1 + 96);
        *(_DWORD *)a3 = *(_DWORD *)(v6 + 32) | *(_DWORD *)(a1 + 5052) | *(_DWORD *)(v7 + 12);
        *(_DWORD *)(a1 + 5052) = 0;
        *(_DWORD *)(v6 + 32) = 0;
        *(_DWORD *)(v7 + 12) = 0;
        return result;
      case 1402:
        uint64_t result = 0;
        int v8 = *(unsigned __int8 *)(*(void *)(a1 + 88) + 440);
        goto LABEL_37;
      case 1403:
        uint64_t v10 = *(void *)(a1 + 400);
        if (v10)
        {
          uint64_t v11 = **(void **)(v10 + 40);
          if (v11)
          {
            uint64_t result = 0;
            uint64_t v12 = *(void *)(v11 + 144);
            *(void *)(v11 + 144) = 0;
            unint64_t v9 = (*(unsigned int *)(a1 + 5076) + v12 * (unint64_t)*(unsigned int *)(a1 + 5072) - 1)
               / *(unsigned int *)(a1 + 5076);
            goto LABEL_28;
          }
        }
        uint64_t result = 0;
        *a3 = 0;
        return result;
      case 1404:
        uint64_t result = 0;
        *a3 = (*(unsigned int *)(a1 + 5076) + *(void *)(a1 + 5056) * (unint64_t)*(unsigned int *)(a1 + 5072) - 1)
            / *(unsigned int *)(a1 + 5076);
        *(void *)(a1 + 5056) = 0;
        return result;
      case 1405:
      case 1406:
        goto LABEL_23;
      case 1407:
        uint64_t result = *(void *)(a1 + 2200);
        if (result)
        {
          id v13 = (void *)[(id)result newVertexShaderDebugInfo];
          size_t v14 = [v13 length];
          char v15 = *(void **)(a1 + 2216);
          if (v15) {
            free(v15);
          }
          char v16 = malloc_type_malloc(v14, 0xF026FC8EuLL);
          *(void *)(a1 + 2216) = v16;
          [v13 getBytes:v16 length:v14];

          *a3 = *(void *)(a1 + 2216);
          a3[1] = v14;
          int v17 = (void *)[*(id *)(a1 + 2200) newFragmentShaderDebugInfo];
          size_t v18 = [v17 length];
          uint64_t v19 = *(void **)(a1 + 2224);
          if (v19) {
            free(v19);
          }
          int v20 = malloc_type_malloc(v18, 0x693C5948uLL);
          *(void *)(a1 + 2224) = v20;
          [v17 getBytes:v20 length:v18];

          uint64_t result = 0;
          a3[8] = *(void *)(a1 + 2224);
          a3[9] = v18;
        }
        return result;
      default:
        if (a2 == 667)
        {
          uint64_t result = 0;
          int v8 = ((*(_DWORD *)(a1 + 380) >> 21) & 1) == 0;
          goto LABEL_37;
        }
        if (a2 != 680) {
          goto LABEL_23;
        }
        unint64_t v9 = [*(id *)(*(void *)(a1 + 96) + 24) getShaderCacheKeys];
        uint64_t result = 0;
        break;
    }
    goto LABEL_28;
  }
  if (a2 > 602)
  {
    if (a2 <= 605)
    {
      if (a2 != 603)
      {
        if (a2 == 604)
        {
          uint64_t result = 0;
          *(_DWORD *)a3 = 0;
          return result;
        }
        goto LABEL_23;
      }
      goto LABEL_16;
    }
    if (a2 == 606)
    {
LABEL_16:
      uint64_t result = 0;
      unint64_t v9 = (unint64_t)"";
LABEL_28:
      *a3 = v9;
      return result;
    }
    if (a2 == 666)
    {
      uint64_t result = 0;
      int v8 = ((*(_DWORD *)(a1 + 380) >> 9) & 1) == 0;
      goto LABEL_37;
    }
    goto LABEL_23;
  }
  if (a2 != 317)
  {
    if (a2 == 318)
    {
      uint64_t result = 0;
      int v8 = *(unsigned char *)(a1 + 6277) == 0;
      goto LABEL_37;
    }
    if (a2 == 319)
    {
LABEL_12:
      uint64_t result = 0;
      int v8 = 1;
LABEL_37:
      *(_DWORD *)a3 = v8;
      return result;
    }
LABEL_23:
    fprintf((FILE *)*MEMORY[0x263EF8348], "%s: Unimplemented - pname 0x%04X, params %p", "enum32_t GLDContextRec::getInteger(enum32_t, int32_t *)", a2, a3);
    return 10010;
  }
  *(_DWORD *)a3 = *(_DWORD *)(a1 + 6272);
  if (*(_DWORD *)(a1 + 6272) != 1) {
    return 0;
  }
  uint64_t result = 0;
  *(_DWORD *)(a1 + 6272) = 0;
  return result;
}

uint64_t gldGetError(uint64_t a1)
{
  uint64_t v1 = *(unsigned int *)(a1 + 136);
  *(_DWORD *)(a1 + 136) = 0;
  return v1;
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_copy__8(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose__9(uint64_t a1)
{
}

void ___ZN13GLDContextRec10setIntegerEjPKi_block_invoke(uint64_t a1)
{
  dispatch_async(*(dispatch_queue_t *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), *(dispatch_block_t *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  _Block_release(*(const void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
}

uint64_t gldCreateComputeContext()
{
  return 0;
}

uint64_t gldDestroyComputeContext()
{
  return 0;
}

uint64_t gldCreateQueue()
{
  return 0;
}

uint64_t gldDestroyQueue()
{
  return 0;
}

uint64_t gldCreateComputeModule()
{
  return 0;
}

uint64_t gldDestroyComputeModule()
{
  return 0;
}

uint64_t gldCompileComputeModule()
{
  return 0;
}

uint64_t gldLinkComputeModules()
{
  return 0;
}

uint64_t gldWriteComputeModuleBinary()
{
  return 0;
}

uint64_t gldCreateComputeProgram()
{
  return 0;
}

uint64_t gldDestroyComputeProgram()
{
  return 0;
}

uint64_t gldLinkComputeProgram()
{
  return 0;
}

uint64_t gldBuildComputeProgram()
{
  return 0;
}

uint64_t gldWriteComputeProgramBinary()
{
  return 0;
}

uint64_t gldCreateKernel()
{
  return 0;
}

uint64_t gldDestroyKernel()
{
  return 0;
}

uint64_t gldExecuteKernel()
{
  return 0;
}

uint64_t gldExecuteNativeKernel()
{
  return 0;
}

uint64_t gldCopyBufferDataWithQueue()
{
  return 0;
}

uint64_t gldCopyTextureDataWithQueue()
{
  return 0;
}

uint64_t gldCopyBufferDataToTextureWithQueue()
{
  return 0;
}

uint64_t gldCopyTextureDataToBufferWithQueue()
{
  return 0;
}

uint64_t gldFinishFenceOnQueue()
{
  return 0;
}

uint64_t gldFinishQueue()
{
  return 0;
}

uint64_t gldCreateDevicePartitionGroup()
{
  return 0;
}

uint64_t gldDestroyDevicePartitionGroup()
{
  return 0;
}

uint64_t gldCreateDevicePartition()
{
  return 0;
}

uint64_t gldDestroyDevicePartition()
{
  return 0;
}

uint64_t gldGetDevicePartitionInfo()
{
  return 0;
}

BOOL GLDContextRec::drawableInvertFramebuffer(GLDContextRec *this, GLDFramebufferRec *a2)
{
  if (*(_DWORD *)(*((void *)a2 + 4) + 192)) {
    int v2 = 16;
  }
  else {
    int v2 = 32;
  }
  return (**((_DWORD **)this + 16) & v2) != 0;
}

uint64_t GLDContextRec::drawablePBEInvert(GLDContextRec *this, GLDFramebufferRec *a2, unsigned int a3)
{
  if (**((_DWORD **)this + 16)) {
    return 0;
  }
  else {
    return *(unsigned char *)(*(void *)(*(void *)(*((void *)a2 + 5) + 8 * a3) + 48) + 24) & 1;
  }
}

uint64_t gldAttachDrawable()
{
  return 0;
}

uint64_t gldUpdateReadFramebuffer(uint64_t a1, int a2)
{
  if (a2 < 0)
  {
    uint64_t v2 = *(void *)(*(void *)(a1 + 112) + 424);
    if (v2)
    {
      int v3 = *(_DWORD *)(v2 + 24);
      if (*(_DWORD *)(a1 + 1804) == v3) {
        goto LABEL_7;
      }
    }
    else
    {
      int v3 = 0;
    }
    *(_DWORD *)(a1 + 1804) = v3;
LABEL_7:
    *(void *)(a1 + 408) = v2;
  }
  return 1;
}

void gldDiscardFramebuffer(int8x8_t *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (this[575].i32[1]) {
    GLDContextRec::beginRenderPass((GLDContextRec *)this);
  }
  if (this[2]) {
    BOOL v8 = a3 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    uint64_t v9 = 0;
    while (1)
    {
      int v10 = *(_DWORD *)(a4 + 4 * v9);
      if ((v10 - 36064) < 8)
      {
        uint64_t v11 = *(GLDTextureRec **)(*(void *)(a2 + 40) + 8 * (v10 - 36064));
        if (v11)
        {
          uint64_t TextureResource = GLDTextureRec::getTextureResource(v11, 0);
          if (TextureResource) {
            uint64_t v13 = *(void *)(TextureResource + 32);
          }
          else {
            uint64_t v13 = 0;
          }
          for (uint64_t i = 0; i != 4; ++i)
          {
            if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)&this[231], "colorAttachments"), "objectAtIndexedSubscript:", i), "texture") == v13)this[629] = vand_s8(this[629], (int8x8_t)vdup_n_s32(~(1 << i))); {
          }
            }
        }
        goto LABEL_23;
      }
      if (v10 == 36096) {
        break;
      }
      if (v10 != 36128)
      {
        uint64_t v22 = (GLDContextRec *)MTLReleaseAssertionFailure();
        gldBlitFramebufferData(v22, v23, v24, v25, v26, v27, v28);
        return;
      }
      size_t v14 = *(GLDTextureRec **)(*(void *)(a2 + 40) + 72);
      if (v14)
      {
        uint64_t v15 = GLDTextureRec::getTextureResource(v14, *((_DWORD *)v14 + 19) == 2);
        uint64_t v16 = v15 ? *(void *)(v15 + 32) : 0;
        if (objc_msgSend((id)objc_msgSend(*(id *)&this[231], "stencilAttachment"), "texture") == v16)
        {
          unsigned int v21 = -513;
LABEL_34:
          this[629] = vand_s8(this[629], (int8x8_t)vdup_n_s32(v21));
        }
      }
LABEL_23:
      if (++v9 == a3) {
        return;
      }
    }
    size_t v18 = *(GLDTextureRec **)(*(void *)(a2 + 40) + 64);
    if (!v18) {
      goto LABEL_23;
    }
    uint64_t v19 = GLDTextureRec::getTextureResource(v18, 0);
    uint64_t v20 = v19 ? *(void *)(v19 + 32) : 0;
    if (objc_msgSend((id)objc_msgSend(*(id *)&this[231], "depthAttachment"), "texture") != v20) {
      goto LABEL_23;
    }
    unsigned int v21 = -257;
    goto LABEL_34;
  }
}

uint64_t gldBlitFramebufferData(GLDContextRec *this, int a2, int a3, int a4, int a5, int a6, int a7, float a8, float a9, float a10, float a11)
{
  uint64_t v216 = *MEMORY[0x263EF8340];
  v154 = (unsigned __int8 *)this + 4584;
  uint64_t v21 = *(void *)(*((void *)this + 51) + 32);
  uint64_t v22 = *(void *)(*((void *)this + 50) + 32);
  *((void *)this + 53) |= 0x8000uLL;
  uint64_t v163 = v21;
  uint64_t v152 = v22;
  if (!*((void *)this + 2)
    || *(unsigned __int8 *)(v21 + 182) < 2u
    || a3 | a2
    || *((_DWORD *)this + 1149) != 1
    || *(unsigned __int16 *)(v21 + 178) != a4
    || *(unsigned __int16 *)(v21 + 180) != a5
    || *(unsigned __int16 *)(v22 + 178) != a4
    || *(unsigned __int16 *)(v22 + 180) != a5)
  {
    goto LABEL_66;
  }
  uint64_t v23 = *((void *)this + 13);
  if (*(unsigned char *)(v23 + 13284))
  {
    if (*(_DWORD *)(v23 + 13268)
      || *(_DWORD *)(v23 + 13272)
      || *(_DWORD *)(v23 + 13276) != a4
      || a9 != 0.0
      || a8 != 0.0
      || a11 != 1.0
      || a10 != 1.0
      || *(_DWORD *)(v23 + 13280) != a5)
    {
      goto LABEL_66;
    }
    goto LABEL_23;
  }
  if (a9 != 0.0 || a8 != 0.0 || a10 != 1.0 || a11 != 1.0)
  {
LABEL_66:
    if (a6) {
      goto LABEL_67;
    }
    return 1;
  }
LABEL_23:
  context = (char *)this + 4496;
  while (1)
  {
    if (!a6) {
      return 1;
    }
    if ((a6 & 0x4000) != 0)
    {
      int v24 = *(unsigned __int16 *)(v163 + 176) - 36064;
      goto LABEL_30;
    }
    if ((a6 & 0x100) != 0) {
      goto LABEL_67;
    }
    if ((a6 & 0x400) == 0) {
      break;
    }
    int v24 = 9;
LABEL_30:
    uint64_t v25 = *(void *)(*(void *)(*((void *)this + 51) + 40) + 8 * v24);
    unsigned int v26 = v24 == 9 && *(_DWORD *)(v25 + 76) == 2;
    int v27 = (_DWORD *)(v163 + 16 * v24);
    int v28 = v27[1];
    int v29 = v27[3];
    v164 = (GLRTextureResource *)v27[2];
    uint64_t v30 = *(void *)(v25 + 48);
    uint64_t TextureResource = GLDTextureRec::getTextureResource((GLDTextureRec *)v25, v26);
    if (TextureResource) {
      v167 = *(void **)(TextureResource + 32);
    }
    else {
      v167 = 0;
    }
    if ((a6 & 0x4000) == 0) {
      goto LABEL_67;
    }
    BOOL v32 = !v28 && v29 == 0;
    if (!v32 || *((_DWORD *)this + 1147) != 1) {
      goto LABEL_67;
    }
    uint64_t v33 = [v167 pixelFormat];
    uint64_t v34 = *((unsigned int *)this + 1148);
    uint64_t v35 = *((void *)this + v34 + 552);
    if (v33 != v35 && (v33 != 80 || v35 != 70) && (v33 != 70 || v35 != 80)) {
      goto LABEL_67;
    }
    if (!v154[502] && *((unsigned char *)this + v34 + 4576) != (*(unsigned char *)(v30 + 24) & 1)) {
      goto LABEL_67;
    }
    uint64_t v36 = (void *)[*((id *)this + 231) colorAttachments];
    uint64_t v37 = 0;
    int v166 = 0x4000;
    do
    {
      int v38 = (void *)[v36 objectAtIndexedSubscript:v37];
      if ((*((_DWORD *)this + 1187) & (1 << v37)) != 0)
      {
        __int32 v39 = v38;
        if ((void *)[v38 texture] == v167 && (GLRTextureResource *)objc_msgSend(v39, "level") == v164)
        {
          *((_DWORD *)this + 1260) |= 1 << v37;
          int v40 = (char *)this + 8 * *((unsigned int *)this + 1148);
          uint64_t v41 = (GLDTextureRec *)*((void *)v40 + 517);
          if (v41) {
            uint64_t v42 = GLDTextureRec::getTextureResource(v41, 0);
          }
          else {
            uint64_t v42 = *((void *)v40 + 527);
          }
          GLRResourceList::addResource(*((void *)this + 8), v42);
          *(void *)&context[8 * v37] = 3;
          v43 = (void *)*((void *)this + 2);
          uint64_t v44 = *(void *)(v42 + 32);
          uint64_t v45 = *((unsigned int *)this + 1148);
          v46 = (unsigned int *)((char *)this + 4 * v45);
          uint64_t v47 = v46[1074];
          uint64_t v48 = v46[1094];
          uint64_t v49 = v46[1084];
          if (v154[502]) {
            [v43 setColorResolveTexture:v44 slice:v47 depthPlane:v48 level:v49 yInvert:*((unsigned __int8 *)this + v45 + 4576) atIndex:v37];
          }
          else {
            [v43 setColorResolveTexture:v44 slice:v47 depthPlane:v48 level:v49 atIndex:v37];
          }
          *((_DWORD *)this + 620) |= 4u;
          uint64_t v50 = *(void *)(*(void *)(*((void *)this + 50) + 40) + 8 * *((int *)this + 1148));
          uint64_t v51 = *(void *)(v50 + 184);
          if (v51) {
            (*(void (**)(uint64_t))(*(void *)v51 + 24))(v51);
          }
          a6 &= ~v166;
          *(void *)(v50 + 184) = 0;
          int v166 = 0;
        }
      }
      ++v37;
    }
    while (v37 != 4);
    if (v166) {
      goto LABEL_66;
    }
  }
  NSLog(&cfstr_BadBitsInBlitM.isa);
LABEL_67:
  if (*((_DWORD *)this + 1151)) {
    GLDContextRec::beginRenderPass(this);
  }
  if (*((void *)this + 2)) {
    GLDContextRec::endRenderPass(this);
  }
  if (!*((void *)this + 5)) {
    GLDContextRec::getCommandBuffer(this);
  }
  float v52 = a8 + (float)((float)a4 * a10);
  float v53 = a9 + (float)((float)a5 * a11);
  *(float *)v199 = a8;
  *(float *)&v199[1] = v53;
  uint64_t v200 = 0x3F80000000000000;
  float v201 = a8;
  float v202 = a9;
  uint64_t v203 = 0x3F80000000000000;
  float v204 = v52;
  float v205 = a9;
  uint64_t v206 = 0x3F80000000000000;
  float v207 = v52;
  float v208 = v53;
  uint64_t v209 = 0x3F80000000000000;
  float v210 = a8;
  float v211 = v53;
  uint64_t v212 = 0x3F80000000000000;
  float v213 = v52;
  float v214 = a9;
  uint64_t v215 = 0x3F80000000000000;
  uint64_t BlitFramebufferSampler = GLDDeviceRec::getBlitFramebufferSampler(*((id **)this + 12), a7);
  float v54 = (float)a2;
  float v55 = (float)a3;
  float v56 = (float)(a4 + a2);
  uint64_t v57 = 2;
  if (a7 == 9729) {
    uint64_t v57 = 3;
  }
  uint64_t v147 = v57;
  float v58 = 0.0;
  if (a8 > 0.0) {
    float v59 = a8;
  }
  else {
    float v59 = 0.0;
  }
  unint64_t v60 = (unint64_t)v59;
  if (a9 > 0.0) {
    float v61 = a9;
  }
  else {
    float v61 = 0.0;
  }
  unint64_t v62 = (unint64_t)v61;
  if (v52 > 0.0) {
    float v63 = v52;
  }
  else {
    float v63 = 0.0;
  }
  unint64_t v64 = (unint64_t)v63;
  if (v53 > 0.0) {
    float v58 = v53;
  }
  unint64_t v65 = (unint64_t)v58;
  unint64_t v66 = v64 - v60;
  unint64_t v68 = v60 - v64;
  BOOL v67 = v60 > v64;
  if (v60 >= v64) {
    unint64_t v60 = (unint64_t)v63;
  }
  unint64_t v151 = v60;
  if (v67) {
    unint64_t v69 = v68;
  }
  else {
    unint64_t v69 = v66;
  }
  unint64_t v150 = v69;
  unint64_t v70 = v65 - v62;
  unint64_t v72 = v62 - v65;
  BOOL v71 = v62 > v65;
  if (v62 >= v65) {
    unint64_t v62 = (unint64_t)v58;
  }
  if (v71) {
    unint64_t v70 = v72;
  }
  unint64_t v148 = v70;
  unint64_t v149 = v62;
  v156 = (_OWORD *)((char *)this + 5168);
  v168 = (char *)this + 4576;
  float v73 = (float)(a5 + a3);
  while (2)
  {
    contexta = (void *)MEMORY[0x2455F59C0]();
    if ((a6 & 0x4000) != 0)
    {
      uint64_t v74 = v163;
      int v75 = *(unsigned __int16 *)(v163 + 176) - 36064;
      int v76 = -16385;
      goto LABEL_102;
    }
    uint64_t v74 = v163;
    if ((a6 & 0x100) != 0)
    {
      int v75 = 8;
      int v76 = -257;
      goto LABEL_102;
    }
    if ((a6 & 0x400) != 0)
    {
      int v75 = 9;
      int v76 = -1025;
LABEL_102:
      int v159 = v76;
      uint64_t v77 = *(void *)(*(void *)(*((void *)this + 51) + 40) + 8 * v75);
      unsigned int v78 = v75 == 9 && *(_DWORD *)(v77 + 76) == 2;
      uint64_t v79 = v74 + 16 * v75;
      uint64_t v81 = *(unsigned int *)(v79 + 4);
      uint64_t v80 = *(unsigned int *)(v79 + 8);
      uint64_t v82 = *(void *)(v77 + 48);
      uint64_t v83 = GLDTextureRec::getTextureResource(*(GLDTextureRec **)(*(void *)(*((void *)this + 51) + 40) + 8 * v75), v78);
      if (v83) {
        float v84 = *(void **)(v83 + 32);
      }
      else {
        float v84 = 0;
      }
      uint64_t v85 = [v84 textureType];
      if ((v85 & 0xFFFFFFFFFFFFFFFDLL) == 1) {
        uint64_t v86 = 2;
      }
      else {
        uint64_t v86 = v85;
      }
      if (v75 == 9)
      {
        id v87 = objc_alloc_init(MEMORY[0x263F12A50]);
        [v87 setWidth:*(unsigned __int16 *)(v163 + 178)];
        [v87 setHeight:*(unsigned __int16 *)(v163 + 180)];
        [v87 setPixelFormat:13];
        [v87 setTextureType:v86];
        objc_msgSend(v87, "setSampleCount:", objc_msgSend(v84, "sampleCount"));
        [v87 setUsage:5];
        v88 = (void *)[*(id *)(*((void *)this + 12) + 24) newTextureWithDescriptor:v87];
      }
      else
      {
        v88 = objc_msgSend(v84, "newTextureViewWithPixelFormat:textureType:levels:slices:", objc_msgSend(v84, "pixelFormat"), v86, v80, 1, v81, 1);
      }
      [v88 setLabel:*MEMORY[0x263F12C98]];
      GLDObject::operator new((GLDObject *)0x40);
      v165 = v89;
      GLRTextureResource::GLRTextureResource(v89);
      uint64_t v90 = GLDTextureRec::getTextureResource((GLDTextureRec *)v77, v78);
      GLRTextureResource::initWithMetalTexture(v165, v88, *(void *)(v90 + 24));

      float v92 = v55;
      float v93 = v73;
      if (*(unsigned char *)(v82 + 24))
      {
        LOWORD(v91) = *(_WORD *)(v163 + 180);
        float v94 = (float)v91;
        float v92 = v94 - v55;
        float v93 = v94 - v73;
      }
      if ((*(_WORD *)(v82 + 214) & 0x1800) != 0)
      {
        unsigned int v95 = *(_DWORD *)(v163 + 16 * v75 + 12);
        float v96 = (float)(unint64_t)[v88 depth];
        float v181 = v54;
        float v182 = v93;
        float v183 = (float)v95 / v96;
        float v184 = v54;
        float v185 = v92;
        float v186 = v183;
        float v187 = v56;
        float v188 = v92;
        float v189 = v183;
        float v190 = v56;
        float v191 = v93;
        float v192 = v183;
        float v193 = v54;
        float v194 = v93;
        float v195 = v183;
        float v196 = v56;
        float v197 = v92;
        float v198 = v183;
        uint64_t v158 = 72;
      }
      else
      {
        float v181 = v54;
        float v182 = v93;
        float v183 = v54;
        float v184 = v92;
        float v185 = v56;
        float v186 = v92;
        float v187 = v56;
        float v188 = v93;
        float v189 = v54;
        float v190 = v93;
        uint64_t v158 = 48;
        float v191 = v56;
        float v192 = v92;
      }
      uint64_t v180 = 0;
      long long v178 = 0u;
      long long v179 = 0u;
      long long v177 = 0u;
      [v84 pixelFormat];
      MTLPixelFormatGetInfo();
      if ((*(_WORD *)(v82 + 214) & 0x1800) != 0)
      {
        if (v75 == 8)
        {
          uint64_t v97 = 12;
          uint64_t v98 = 16;
        }
        else if ((DWORD2(v177) & 0x10000) != 0)
        {
          uint64_t v97 = 12;
          uint64_t v98 = 13;
        }
        else if ((DWORD2(v177) & 0x40000) != 0)
        {
          uint64_t v97 = 12;
          uint64_t v98 = 14;
        }
        else
        {
          if ((DWORD2(v177) & 0x80000) != 0) {
            uint64_t v98 = 15;
          }
          else {
            uint64_t v98 = 13;
          }
          uint64_t v97 = 12;
        }
      }
      else
      {
        unsigned int v99 = v75 & 0xFFFFFFFE;
        if (*(unsigned __int8 *)(v163 + 182) < 2u)
        {
          if (v75 == 8) {
            uint64_t v98 = 8;
          }
          else {
            uint64_t v98 = 10;
          }
          if (v99 != 8)
          {
            if ((DWORD2(v177) & 0x10000) != 0)
            {
              uint64_t v97 = 0;
              uint64_t v98 = 1;
            }
            else
            {
              uint64_t v97 = 0;
              if ((DWORD2(v177) & 0x40000) != 0)
              {
                uint64_t v98 = 4;
              }
              else if ((DWORD2(v177) & 0x80000) != 0)
              {
                uint64_t v98 = 6;
              }
              else
              {
                uint64_t v98 = 1;
              }
            }
            goto LABEL_153;
          }
        }
        else
        {
          if (v75 == 8) {
            uint64_t v98 = 9;
          }
          else {
            uint64_t v98 = 11;
          }
          if (v99 != 8)
          {
            if ((DWORD2(v177) & 0x40000) != 0)
            {
              uint64_t v97 = 0;
              uint64_t v98 = 5;
            }
            else
            {
              uint64_t v97 = 0;
              if ((DWORD2(v177) & 0x80000) != 0) {
                uint64_t v98 = 7;
              }
              else {
                uint64_t v98 = v147;
              }
            }
            goto LABEL_153;
          }
        }
        uint64_t v97 = 0;
      }
LABEL_153:
      v100 = (MTLRenderPipelineDescriptor *)objc_alloc_init(MEMORY[0x263F129C0]);
      [(MTLRenderPipelineDescriptor *)v100 setLabel:@"blitFramebuffer Pipeline"];
      [(MTLRenderPipelineDescriptor *)v100 setVertexFunction:GLRFunctionCache::getFunction((GLRFunctionCache *)(*((void *)this + 12) + 216), *(_DWORD *)(*((void *)this + 12) + 4 * v97 + 120))];
      [(MTLRenderPipelineDescriptor *)v100 setFragmentFunction:GLRFunctionCache::getFunction((GLRFunctionCache *)(*((void *)this + 12) + 216), *(_DWORD *)(*((void *)this + 12) + 4 * v98 + 120))];
      if (v75 == 8)
      {
        [(MTLRenderPipelineDescriptor *)v100 setDepthAttachmentPixelFormat:*((void *)this + 560)];
      }
      else if (v75 == 9)
      {
        [[(MTLRenderPipelineColorAttachmentDescriptorArray *)[(MTLRenderPipelineDescriptor *)v100 colorAttachments] objectAtIndexedSubscript:0] setPixelFormat:13];
      }
      else
      {
        for (uint64_t i = 0; i != 8; ++i)
          [[(MTLRenderPipelineColorAttachmentDescriptorArray *)[(MTLRenderPipelineDescriptor *)v100 colorAttachments] objectAtIndexedSubscript:i] setPixelFormat:*((void *)this + i + 552)];
      }
      [(MTLRenderPipelineDescriptor *)v100 setOpenGLModeEnabled:1];
      BlitPipelineStateFromDescriptor = GLDDeviceRec::getBlitPipelineStateFromDescriptor(*((id **)this + 12), v100);

      if (v75 == 8)
      {
        v102 = (MTLDepthStencilDescriptor *)objc_alloc_init(MEMORY[0x263F128A0]);
        [(MTLDepthStencilDescriptor *)v102 setDepthCompareFunction:7];
        [(MTLDepthStencilDescriptor *)v102 setDepthWriteEnabled:1];
        DepthStencilStateFromDescriptor = GLDDeviceRec::getDepthStencilStateFromDescriptor(*((id **)this + 12), v102);

        v104 = (void *)[MEMORY[0x263F129A0] renderPassDescriptor];
        v105 = (void *)[v104 depthAttachment];
        v106 = v105;
        uint64_t v107 = *((void *)this + 535);
        if (v107)
        {
          GLRResourceList::addResource(*((void *)this + 8), *((void *)this + 535));
          [v106 setTexture:*(void *)(v107 + 32)];
          [v106 setLevel:*((unsigned int *)this + 1092)];
          [v106 setSlice:*((unsigned int *)this + 1082)];
          [v106 setDepthPlane:*((unsigned int *)this + 1102)];
          [v106 setLoadAction:1];
          [v106 setStoreAction:1];
          [v106 setYInvert:*v154];
        }
        else
        {
          [v105 setTexture:0];
        }
LABEL_193:
        GLRResourceList::addResource(*((void *)this + 8), (uint64_t)v165);
        v143 = (void *)[*((id *)this + 5) renderCommandEncoderWithDescriptor:v104];
        *((void *)this + 3) = v143;
        [v143 setLabel:*MEMORY[0x263F12C98]];
        [*((id *)this + 3) setRenderPipelineState:BlitPipelineStateFromDescriptor];
        [*((id *)this + 3) setFragmentTexture:v88 atIndex:0];
        [*((id *)this + 3) setFragmentSamplerState:BlitFramebufferSampler atIndex:0];
        v144 = (void *)*((void *)this + 3);
        long long v145 = *((_OWORD *)this + 324);
        v169[0] = *v156;
        v169[1] = v145;
        [v144 setScissorRect:v169];
        if (v75 == 8) {
          [*((id *)this + 3) setDepthStencilState:DepthStencilStateFromDescriptor];
        }
        [*((id *)this + 3) setViewportTransformEnabled:0];
        [*((id *)this + 3) setVertexBytes:v199 length:96 atIndex:0];
        [*((id *)this + 3) setVertexBytes:&v181 length:v158 atIndex:1];
        [*((id *)this + 3) drawPrimitives:3 vertexStart:0 vertexCount:6];
        [*((id *)this + 3) endEncoding];
LABEL_196:
        (*(void (**)(GLDLibrary *))(*(void *)v165 + 24))(v165);
        a6 &= v159;
        if (!a6) {
          return 1;
        }
        continue;
      }
      v104 = (void *)[MEMORY[0x263F129A0] renderPassDescriptor];
      if (v75 == 9)
      {
        v108 = (void *)[*((id *)this + 5) blitCommandEncoder];
        [v108 setLabel:*MEMORY[0x263F12C98]];
        memset(v176, 0, sizeof(v176));
        uint64_t v109 = *(unsigned __int16 *)(v163 + 180);
        v175[0] = *(unsigned __int16 *)(v163 + 178);
        v175[1] = v109;
        v175[2] = 1;
        memset(v174, 0, sizeof(v174));
        [v108 copyFromTexture:v84 sourceSlice:v81 sourceLevel:v80 sourceOrigin:v176 sourceSize:v175 toTexture:v88 destinationSlice:0 destinationLevel:0 destinationOrigin:v174 options:0x20000000];
        [v108 endEncoding];
        v153 = (GLRResource *)*((void *)this + 536);
        if (v153)
        {
          v110 = (void *)[MEMORY[0x263F12A50] texture2DDescriptorWithPixelFormat:13 width:*(unsigned __int16 *)(v152 + 178) height:*(unsigned __int16 *)(v152 + 180) mipmapped:0];
          [v110 setUsage:5];
          v111 = (void *)[*(id *)(*((void *)this + 11) + 232) newTextureWithDescriptor:v110];
          v112 = v111;
          if (v111
            && ([v111 setLabel:*MEMORY[0x263F12C98]],
                GLDObject::operator new((GLDObject *)0x40),
                v114 = v113,
                GLRTextureResource::GLRTextureResource(v113),
                v114))
          {
            GLRTextureResource::initWithMetalTexture(v114, v112, *((void *)v153 + 3));

            GLRResourceList::addResource(*((void *)this + 8), (uint64_t)v165);
            GLRResourceList::addResource(*((void *)this + 8), (uint64_t)v114);
            v115 = objc_msgSend((id)objc_msgSend(v104, "colorAttachments"), "objectAtIndexedSubscript:", 0);
            [v115 setTexture:*((void *)v114 + 4)];
            [v115 setLevel:0];
            [v115 setSlice:0];
            [v115 setDepthPlane:0];
            [v115 setLoadAction:0];
            [v115 setStoreAction:1];
            [v115 setYInvert:v154[1]];
            unint64_t v116 = *((void *)this + 646);
            if (v151 <= v116) {
              unint64_t v117 = *((void *)this + 646);
            }
            else {
              unint64_t v117 = v151;
            }
            unint64_t v118 = *((void *)this + 648) + v116;
            if (v117 + v150 <= v118) {
              unint64_t v119 = v150;
            }
            else {
              unint64_t v119 = v118 - v117;
            }
            unint64_t v120 = *((void *)this + 647);
            if (v149 <= v120) {
              unint64_t v121 = *((void *)this + 647);
            }
            else {
              unint64_t v121 = v149;
            }
            unint64_t v122 = *((void *)this + 649) + v120;
            if (v121 + v148 <= v122) {
              unint64_t v123 = v148;
            }
            else {
              unint64_t v123 = v122 - v121;
            }
            v124 = (void *)[*((id *)this + 5) renderCommandEncoderWithDescriptor:v104];
            *((void *)this + 3) = v124;
            [v124 setLabel:*MEMORY[0x263F12C98]];
            [*((id *)this + 3) setRenderPipelineState:BlitPipelineStateFromDescriptor];
            [*((id *)this + 3) setFragmentTexture:v88 atIndex:0];
            if ((unint64_t)[v84 sampleCount] <= 1) {
              [*((id *)this + 3) setFragmentSamplerState:BlitFramebufferSampler atIndex:0];
            }
            v125 = (void *)*((void *)this + 3);
            long long v126 = *((_OWORD *)this + 324);
            v173[0] = *v156;
            v173[1] = v126;
            [v125 setScissorRect:v173];
            GLRResourceList::addResource(*((void *)this + 8), (uint64_t)v165);
            [*((id *)this + 3) setViewportTransformEnabled:0];
            [*((id *)this + 3) setVertexBytes:v199 length:96 atIndex:0];
            [*((id *)this + 3) setVertexBytes:&v181 length:v158 atIndex:1];
            [*((id *)this + 3) drawPrimitives:3 vertexStart:0 vertexCount:6];
            [*((id *)this + 3) endEncoding];
            GLRResourceList::addResource(*((void *)this + 8), (uint64_t)v114);
            GLRResourceList::addResource(*((void *)this + 8), (uint64_t)v153);
            uint64_t v127 = *(unsigned int *)(v152 + 148);
            uint64_t v128 = *(unsigned int *)(v152 + 152);
            v129 = (void *)[*((id *)this + 5) blitCommandEncoder];
            [v129 setLabel:*MEMORY[0x263F12C98]];
            uint64_t v130 = *((void *)v114 + 4);
            v172[0] = v117;
            v172[1] = v121;
            v172[2] = 0;
            v171[0] = v119;
            v171[1] = v123;
            v171[2] = 1;
            uint64_t v131 = *((void *)v153 + 4);
            uint64_t v132 = *((unsigned int *)this + 1103);
            v170[0] = v117;
            v170[1] = v121;
            v170[2] = v132;
            [v129 copyFromTexture:v130 sourceSlice:0 sourceLevel:0 sourceOrigin:v172 sourceSize:v171 toTexture:v131 destinationSlice:v127 destinationLevel:v128 destinationOrigin:v170 options:0x20000000];
            [v129 endEncoding];
            (*(void (**)(GLDLibrary *))(*(void *)v114 + 24))(v114);
          }
          else
          {
          }
        }
        goto LABEL_196;
      }
      uint64_t v133 = 0;
      uint64_t v134 = -32;
      v135 = (uint64_t *)((char *)this + 4216);
      while (2)
      {
        v136 = objc_msgSend((id)objc_msgSend(v104, "colorAttachments"), "objectAtIndexedSubscript:", v133);
        v137 = (GLDTextureRec *)*(v135 - 10);
        if (v137)
        {
          uint64_t v138 = GLDTextureRec::getTextureResource(v137, 0);
          if (v138) {
            goto LABEL_184;
          }
LABEL_186:
          uint64_t v139 = [v136 setTexture:0];
        }
        else
        {
          uint64_t v138 = *v135;
          if (!*v135) {
            goto LABEL_186;
          }
LABEL_184:
          GLRResourceList::addResource(*((void *)this + 8), v138);
          [v136 setTexture:*(void *)(v138 + 32)];
          [v136 setLevel:*(unsigned int *)&v168[v134 - 208]];
          [v136 setSlice:*(unsigned int *)&v168[v134 - 248]];
          [v136 setDepthPlane:*(unsigned int *)&v168[v134 - 168]];
          [v136 setLoadAction:1];
          [v136 setStoreAction:1];
          uint64_t v139 = [v136 setYInvert:v168[v133]];
        }
        uint64_t v140 = *(void *)(*(void *)(*((void *)this + 50) + 40) + 8 * v133);
        if (v140 && *(void *)(v140 + 184))
        {
          v141 = (void *)MEMORY[0x2455F59C0](v139);
          id v142 = (id)[*((id *)this + 5) blitCommandEncoder];
          [v142 setLabel:*MEMORY[0x263F12C98]];
          GLDTextureRec::blitAccum(v140, v142, *((void *)this + 8));
          [v142 endEncoding];
        }
        ++v133;
        ++v135;
        v134 += 4;
        if (v133 == 8)
        {
          DepthStencilStateFromDescriptor = 0;
          goto LABEL_193;
        }
        continue;
      }
    }
    break;
  }
  NSLog(&cfstr_BadBitsInBlitM.isa);
  return 1;
}

void sub_2406EEF48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,void *a30)
{
  GLDObject::operator delete(v30);
  _Unwind_Resume(a1);
}

uint64_t gldReadFramebufferData(GLDContextRec *this, int a2, int a3, unsigned int a4, unsigned int a5, int a6, unsigned int a7, uint64_t a8, int a9, GLDBufferRec *a10)
{
  *((void *)this + 53) |= 0x4000uLL;
  if (!a10)
  {
    int v70 = a3;
    uint64_t v64 = a8;
    unsigned int v67 = 0;
    v81[0] = 0;
    int v80 = 0;
    uint64_t v21 = *((void *)this + 13);
    unsigned int v22 = 8;
    if (a6 > 34040)
    {
      if (a6 == 34041) {
        goto LABEL_25;
      }
      int v23 = 35056;
    }
    else
    {
      if (a6 == 6401)
      {
        unsigned int v22 = 9;
        unsigned int v67 = 1;
LABEL_25:
        unsigned int v69 = a6;
        unsigned int v26 = (GLDFramebufferRec *)*((void *)this + 51);
        int v27 = *(GLDTextureRec **)(*((void *)v26 + 5) + 8 * v22);
        unint64_t v28 = *((void *)v27 + 11);
        if (v28 <= 7)
        {
          int v29 = (_DWORD *)(*((void *)v26 + 4) + 16 * v22);
          unsigned int v30 = v29[1];
          uint64_t v68 = v29[2];
          unsigned int v31 = v29[3];
          uint64_t v32 = 1 << v28;
          uint64_t v33 = 1 << v28;
          BOOL v34 = (v33 & 0x4A) == 0;
          if ((v33 & 0x4A) != 0) {
            LODWORD(v35) = 0;
          }
          else {
            LODWORD(v35) = v31;
          }
          if (v34) {
            unsigned int v36 = v30;
          }
          else {
            unsigned int v36 = v31;
          }
          if ((v32 & 0x95) != 0) {
            uint64_t v35 = v31;
          }
          else {
            uint64_t v35 = v35;
          }
          uint64_t v62 = v35;
          if ((v32 & 0x95) != 0) {
            uint64_t v37 = 0;
          }
          else {
            uint64_t v37 = v36;
          }
          uint64_t v63 = v37;
          if (*((void *)v27 + 23))
          {
            uint64_t v61 = v21;
            if (*((_DWORD *)this + 1151)) {
              GLDContextRec::beginRenderPass(this);
            }
            unsigned int v38 = a7;
            if (*((void *)this + 2)) {
              GLDContextRec::endRenderPass(this);
            }
            int v39 = a2;
            if (!*((void *)this + 5)) {
              GLDContextRec::getCommandBuffer(this);
            }
            int v40 = (void *)MEMORY[0x2455F59C0]();
            id v41 = (id)[*((id *)this + 5) blitCommandEncoder];
            [v41 setLabel:*MEMORY[0x263F12C98]];
            GLDTextureRec::blitAccum((uint64_t)v27, v41, *((void *)this + 8));
            [v41 endEncoding];

            unsigned int v26 = (GLDFramebufferRec *)*((void *)this + 51);
            a2 = v39;
            a7 = v38;
            uint64_t v21 = v61;
          }
          if (GLDContextRec::drawableInvertFramebuffer(this, v26)) {
            int v42 = 1;
          }
          else {
            int v42 = GLDContextRec::drawablePBEInvert(this, *((GLDFramebufferRec **)this + 51), v22);
          }
          uint64_t v43 = *((void *)v27 + 6);
          if (a9 == 2) {
            uint64_t v44 = 0;
          }
          else {
            uint64_t v44 = (int *)(v21 + 16176);
          }
          glrPixelSettings(v69, a7, a4, a5, (int *)v81 + 1, v81, &v80, v44, 3);
          uint64_t v45 = v43 + 480 * v30 + 32 * v68;
          signed int v46 = *(unsigned __int16 *)(v45 + 270);
          if ((int)(a5 + v70) <= v46) {
            uint64_t v47 = a5;
          }
          else {
            uint64_t v47 = (v46 - v70);
          }
          signed int v48 = *(unsigned __int16 *)(v45 + 268);
          int v66 = a2;
          if ((int)(a4 + a2) <= v48) {
            uint64_t v49 = a4;
          }
          else {
            uint64_t v49 = (v48 - a2);
          }
          if ((int)v49 < 1 || (int)v47 < 1) {
            return 1;
          }
          int v60 = v42;
          uint64_t v59 = v80;
          GLDContextRec::flushContext((id *)this);
          uint64_t TextureResource = (GLRResource *)GLDTextureRec::getTextureResource(v27, v67);
          GLDContextRec::finishResource((id *)this, TextureResource);
          unsigned int v52 = *((_DWORD *)v27 + v67 + 16);
          uint64_t v79 = 0;
          long long v77 = 0u;
          long long v78 = 0u;
          long long v76 = 0u;
          MTLPixelFormatGetInfo();
          float v53 = malloc_type_malloc(0, 0xC9E9578uLL);
          if (v53)
          {
            float v54 = v53;
            uint64_t v65 = v64 + v59;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            long long v72 = 0u;
            HIDWORD(v74) = v49;
            LODWORD(v75) = v47;
            float v55 = v53;
            if (!v60) {
              float v55 = v53;
            }
            v71[6] = v55;
            DWORD2(v72) = 0;
            glgConvertType();
            DWORD1(v74) = (&glrTextureFormats)[5 * v52 + 2];
            DWORD2(v74) = -1;
            *(void *)&long long v72 = v65;
            DWORD1(v73) = HIDWORD(v81[0]);
            glgConvertType();
            if (v60) {
              int v56 = *(unsigned __int16 *)(v45 + 270) - v70 - v47;
            }
            else {
              int v56 = v70;
            }
            uint64_t v57 = v56;
            float v58 = *(void **)(GLDTextureRec::getTextureResource(v27, v67) + 32);
            v71[0] = v66;
            v71[1] = v57;
            v71[2] = v62;
            _OWORD v71[3] = v49;
            v71[4] = v47;
            v71[5] = 1;
            [v58 getBytes:v54 bytesPerRow:0 bytesPerImage:0 fromRegion:v71 mipmapLevel:v68 slice:v63];
            glgProcessPixelsWithProcessor();
            free(v54);
            return 0;
          }
          GLDTextureRec::getTextureResource(v27, v67);
          MTLReleaseAssertionFailure();
        }
        MTLReleaseAssertionFailure();
        JUMPOUT(0x2406EF504);
      }
      int v23 = 6402;
    }
    if (a6 == v23) {
      goto LABEL_25;
    }
LABEL_23:
    unsigned int v67 = 0;
    unsigned int v22 = *(unsigned __int16 *)(*(void *)(*((void *)this + 51) + 32) + 176) - 36064;
    goto LABEL_25;
  }
  int v18 = **((_DWORD **)a10 + 4);
  if (v18)
  {
    uint64_t v19 = *((void *)this + 11);
    if (!*(_DWORD *)(v19 + 248)
      || (pthread_mutex_lock((pthread_mutex_t *)(v19 + 256)), (int v18 = **((_DWORD **)a10 + 4)) != 0))
    {
      if (!GLDBufferRec::update(a10, v18))
      {
        int v20 = 0;
LABEL_16:
        uint64_t v24 = *((void *)this + 11);
        if (*(_DWORD *)(v24 + 248)) {
          pthread_mutex_unlock((pthread_mutex_t *)(v24 + 256));
        }
        if (!v20) {
          return 0;
        }
        goto LABEL_19;
      }
      **((_DWORD **)a10 + 4) = 0;
    }
    int v20 = 1;
    goto LABEL_16;
  }
LABEL_19:
  v81[0] = 0;
  uint64_t result = 0;
  int v80 = 0;
  if ((a6 - 6401) >= 2 && a6 != 34041 && a6 != 35056)
  {
    int v70 = a3;
    uint64_t v64 = a8;
    uint64_t v21 = *((void *)this + 13);
    goto LABEL_23;
  }
  return result;
}

uint64_t GLRPixelFormat::create(GLRPixelFormat *this, unsigned int *a2, const int *a3)
{
  uint64_t v9 = 0;
  memset(v8, 0, sizeof(v8));
  int v4 = GLRPixelFormat::preflight((uint64_t)v8, (int *)a2);
  uint64_t v5 = 0;
  *(_DWORD *)this = v4;
  if (!v4)
  {
    GLDObject::operator new((GLDObject *)0x78);
    uint64_t v5 = v6;
    GLRPixelFormat::GLRPixelFormat(v6, v8);
  }
  return v5;
}

void sub_2406EF570(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

uint64_t GLRPixelFormat::preflight(uint64_t a1, int *a2)
{
  *(void *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_2406F58D0;
  *(void *)(a1 + 24) = 0x180000000;
  *(_DWORD *)(a1 + 32) = 1;
  *(void *)(a1 + 38) = 0;
  int v4 = (_WORD *)(a1 + 38);
  *(_DWORD *)(a1 + 45) = 0;
  AllDisplayMasuint64_t k = GLDLibrary::getAllDisplayMask((GLDLibrary *)g_Library);
  unsigned int v6 = 0;
  int v7 = 0;
  unsigned int v8 = 0;
  int v9 = 0;
  int v10 = 0;
  int v11 = 0;
  *(_DWORD *)(a1 + 52) = AllDisplayMask;
  uint64_t v12 = a2;
  while (2)
  {
    int v13 = *v12;
    if (*v12)
    {
      uint64_t v14 = 0;
      uint64_t v15 = v12 + 1;
      switch(v13)
      {
        case '3':
        case 'L':
        case 'M':
        case 'P':
        case 'Z':
          goto LABEL_38;
        case '4':
          int v11 = 1;
          goto LABEL_38;
        case '5':
          int v9 = 1;
          goto LABEL_38;
        case '6':
        case '9':
          return v14;
        case '7':
          int v16 = *v15;
          if (*v15 < 0) {
            return 10008;
          }
          uint64_t v15 = v12 + 2;
          *(_WORD *)(a1 + 40) = v16;
          goto LABEL_38;
        case '8':
          int v17 = *v15;
          if (*v15 < 0) {
            return 10008;
          }
          uint64_t v15 = v12 + 2;
          *(_WORD *)(a1 + 42) = v17;
LABEL_38:
          uint64_t v12 = v15;
          if ((char *)v15 - (char *)a2 <= 192) {
            continue;
          }
          uint64_t v14 = 10000;
          break;
        case ':':
          int v7 = 1;
          goto LABEL_38;
        case ';':
          *(_DWORD *)(a1 + 44) = 2;
          goto LABEL_38;
        case '<':
          *(_DWORD *)(a1 + 44) = 1;
          goto LABEL_38;
        case '=':
          *(unsigned char *)(a1 + 48) = 1;
          goto LABEL_38;
        case '>':
        case '?':
        case '@':
        case 'A':
        case 'B':
        case 'C':
        case 'D':
        case 'E':
        case 'F':
        case 'G':
        case 'H':
        case 'I':
        case 'J':
        case 'K':
        case 'N':
        case 'O':
        case 'Q':
        case 'R':
        case 'S':
        case 'U':
        case 'V':
        case 'W':
        case 'X':
        case 'Y':
LABEL_17:
          uint64_t v15 = v12 + 49;
          goto LABEL_38;
        case 'T':
          uint64_t v15 = v12 + 2;
          AllDisplayMask &= v12[1];
          *(_DWORD *)(a1 + 52) = AllDisplayMask;
          goto LABEL_38;
        default:
          switch(v13)
          {
            case 3:
            case 5:
              *(_DWORD *)(a1 + 16) |= 8u;
              goto LABEL_38;
            case 4:
              int v10 = 1;
              goto LABEL_38;
            case 6:
              return v14;
            case 7:
              int v18 = v12[1];
              if (v18 < 0) {
                return 10008;
              }
              if (v18) {
                return 0;
              }
              uint64_t v15 = v12 + 2;
              *int v4 = 0;
              goto LABEL_38;
            case 8:
              unsigned int v6 = *v15;
              if (*v15 < 0) {
                return 10008;
              }
              if (v6 > 0x80) {
                return 0;
              }
              goto LABEL_37;
            case 11:
              if (*v15 < 0) {
                return 10008;
              }
              if (*v15 > 0x20) {
                return 0;
              }
              goto LABEL_37;
            case 12:
              int v19 = v12[1];
              if (v19 < 0) {
                return 10008;
              }
              uint64_t v15 = v12 + 2;
              if (v19) {
                *(_DWORD *)(a1 + 28) = 4096;
              }
              goto LABEL_38;
            case 13:
              unsigned int v20 = v12[1];
              if ((v20 & 0x80000000) != 0) {
                return 10008;
              }
              if (v20 > 8) {
                return 0;
              }
              uint64_t v15 = v12 + 2;
              if (v20) {
                *(_DWORD *)(a1 + 32) = 128;
              }
              goto LABEL_38;
            case 14:
              unsigned int v8 = *v15;
              if (*v15 < 0) {
                return 10008;
              }
              if (v8 > 0x100) {
                return 0;
              }
LABEL_37:
              uint64_t v15 = v12 + 2;
              break;
            default:
              goto LABEL_17;
          }
          goto LABEL_38;
      }
    }
    else
    {
      if (v9)
      {
        if (!v10) {
          return 0;
        }
      }
      else
      {
        uint64_t v14 = 0;
        if (!AllDisplayMask || !v10) {
          return v14;
        }
      }
      do
      {
        unsigned int v21 = AllDisplayMask;
        AllDisplayMask >>= 1;
      }
      while ((v21 & 1) == 0);
      if (v21 != 1) {
        *(_DWORD *)(a1 + 12) |= 0x200u;
      }
      *(void *)a1 = 0;
      if (*(_WORD *)(a1 + 40))
      {
        int v22 = *(__int16 *)(a1 + 42);
        if (v22 < 10)
        {
          if (v22 < 5) {
            __int16 v23 = 4;
          }
          else {
            __int16 v23 = 9;
          }
        }
        else
        {
          __int16 v23 = 16;
        }
        *(_WORD *)(a1 + 42) = v23;
      }
      else
      {
        *(_WORD *)(a1 + 42) = 0;
        *(_DWORD *)(a1 + 44) = 0;
        *(unsigned char *)(a1 + 48) = 0;
      }
      if (v8) {
        unsigned int v24 = 0x8000000;
      }
      else {
        unsigned int v24 = 0x80000000;
      }
      *(_DWORD *)(a1 + 24) = v24;
      if (v7)
      {
        uint64_t v14 = 0;
        *(_DWORD *)(a1 + 20) = 0x8000000;
      }
      else if (v6 == 16 && v9 && !v11)
      {
        uint64_t v14 = 0;
        *(_DWORD *)(a1 + 20) = 1024;
        *(_DWORD *)(a1 + 12) &= 0xFFFFDFFE;
      }
      else
      {
        uint64_t v14 = 0;
        *(_DWORD *)(a1 + 20) = 0x8000;
      }
    }
    return v14;
  }
}

BOOL GLRPixelFormat::validate(GLRPixelFormat *this)
{
  int v1 = *((_DWORD *)this + 21);
  return (v1 == 0x8000000 || v1 == 0x8000 || v1 == 1024 && (*((unsigned char *)this + 76) & 4) != 0)
      && (*((_DWORD *)this + 20) & 0xFFFFFFF2) == 0
      && (*((_DWORD *)this + 24) & 0xFFFFFF7E) == 0
      && *((_WORD *)this + 51) == 0;
}

BOOL GLDContextRec::updateUniformBuffers(GLDContextRec *this)
{
  unint64_t v2 = 0;
  BOOL v3 = 0;
  do
  {
    uint64_t v4 = *(void *)(*((void *)this + 14) + 8 * v2 + 328);
    if (v4)
    {
      uint64_t v5 = *(unsigned int *)(*(void *)(v4 + 24) + 60);
      if (v5)
      {
        uint64_t v6 = 0;
        uint64_t v7 = 4 * v5;
        do
        {
          unsigned int v8 = *(GLDBufferRec **)(*((void *)this + 14) + 8 * *(unsigned int *)(*(void *)(v4 + 24) + v6 + 64) + 528);
          if (v8)
          {
            int v9 = **((_DWORD **)v8 + 4);
            if (v9)
            {
              if (!GLDBufferRec::update(v8, v9)) {
                return v3;
              }
              **((_DWORD **)v8 + 4) = 0;
            }
          }
          v6 += 4;
        }
        while (v7 != v6);
      }
    }
    BOOL v3 = v2++ > 3;
  }
  while (v2 != 5);
  return 1;
}

GLRBufferResource *GLDContextRec::updateUniformBindingsInternal(GLRBufferResource *this, unsigned int a2, unsigned int *a3, GLRBufferResource **a4, unint64_t *a5, unint64_t a6)
{
  uint64_t v6 = *((void *)this + a2 + 188);
  if (v6)
  {
    uint64_t v7 = (uint64_t)this;
    unsigned int v8 = *(unsigned int **)(*(void *)(*((void *)this + a2 + 183) + 24) + 64);
    if (v8)
    {
      unsigned int v13 = *v8;
      uint64_t v12 = v8 + 1;
      unint64_t v11 = v13;
      if (v13)
      {
        uint64_t v15 = 0;
        uint64_t v20 = *((void *)this + 13) + 15784;
        uint64_t v21 = *((void *)this + 14) + 528;
        do
        {
          uint64_t v16 = *(unsigned int *)(*(void *)(v6 + 24) + 4 * v12[v15] + 64);
          uint64_t v17 = *(void *)(v21 + 8 * v16);
          this = a4[v15];
          if (this)
          {
            this = (GLRBufferResource *)(*(uint64_t (**)(GLRBufferResource *))(*(void *)this + 24))(this);
            a4[v15] = 0;
            a5[v15] = 0;
          }
          if (v17)
          {
            uint64_t v18 = *(void *)(v17 + 40);
            if (v18) {
              this = *(GLRBufferResource **)(v18 + 24);
            }
            else {
              this = 0;
            }
            a4[v15] = this;
            if (!*((unsigned char *)this + 32)) {
              goto LABEL_17;
            }
            if (*(_DWORD *)(v7 + 4604)) {
              GLDContextRec::beginRenderPass((GLDContextRec *)v7);
            }
            if (*(void *)(v7 + 16)) {
              GLDContextRec::endRenderPass((GLDContextRec *)v7);
            }
            this = a4[v15];
            if (this) {
LABEL_17:
            }
              this = (GLRBufferResource *)(*(uint64_t (**)(GLRBufferResource *))(*(void *)this + 16))(this);
            *a3 |= 1 << v15;
            a5[v15] = *(void *)(v20 + 16 * v16);
          }
          ++v15;
        }
        while (v11 != v15);
      }
      for (; v11 < a6; unint64_t v11 = (v11 + 1))
      {
        this = a4[v11];
        if (this)
        {
          this = (GLRBufferResource *)(*(uint64_t (**)(GLRBufferResource *))(*(void *)this + 24))(this);
          a4[v11] = 0;
        }
        *a3 |= 1 << v11;
      }
    }
  }
  return this;
}

GLRBufferResource *GLDContextRec::updateUniformBindings(GLDContextRec *this)
{
  GLDContextRec::updateUniformBindingsInternal(this, 0, (unsigned int *)this + 852, (GLRBufferResource **)this + 359, (unint64_t *)this + 387, 0xCuLL);
  uint64_t result = GLDContextRec::updateUniformBindingsInternal(this, 4u, (unsigned int *)this + 853, (GLRBufferResource **)this + 371, (unint64_t *)this + 399, 0xCuLL);
  *((_DWORD *)this + 618) |= 0x200u;
  return result;
}

uint64_t gldObjectPurgeable()
{
  return 35353;
}

uint64_t gldObjectUnpurgeable(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5)
{
  *a5 = 1;
  return 35353;
}

uint64_t GLRDataBufferManager::init(uint64_t this, GLDContextRec *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  *(void *)(this + 272) = a3;
  *(void *)(this + 280) = a3;
  *(void *)(this + 288) = a4;
  *(_DWORD *)(this + 304) = 0;
  *(void *)(this + 344) = a2;
  *(void *)(this + 352) = a5;
  return this;
}

void *GLRDataBufferManager::getDataBufferSpace(GLRDataBufferManager *this, void *a2, unint64_t a3, void *a4, uint64_t *a5)
{
  uint64_t v9 = *((void *)this + 41);
  unint64_t v14 = *((void *)this + 42) - v9;
  uint64_t result = (void *)*((void *)this + 39);
  if (v14 >= a3)
  {
    if (result)
    {
LABEL_8:
      *a5 = v9;
      uint64_t v12 = *((void *)this + 41);
      *a4 = v12 - *((void *)this + 40);
      *((void *)this + 41) = v12 + a3;
      *((void *)this + 37) += a3;
      return result;
    }
  }
  else if (result)
  {
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = ___ZN20GLRDataBufferManager18getDataBufferSpaceEPU27objcproto16MTLCommandBuffer11objc_objectmPmPPv_block_invoke;
    v13[3] = &unk_2650D28B0;
    v13[4] = result;
    v13[5] = this;
    [a2 addCompletedHandler:v13];
    *(_OWORD *)((char *)this + 312) = 0u;
    *(_OWORD *)((char *)this + 328) = 0u;
    unint64_t v11 = *((void *)this + 34);
    if (v11 < *((void *)this + 36)) {
      *((void *)this + 34) = 2 * v11;
    }
  }
  uint64_t result = GLRDataBufferManager::allocDataBuffer(this, a3, &v14);
  *((void *)this + 39) = result;
  if (result)
  {
    uint64_t v9 = [result contents];
    *((void *)this + 40) = v9;
    *((void *)this + 41) = v9;
    *((void *)this + 42) = v14 + v9;
    uint64_t result = (void *)*((void *)this + 39);
    if (result) {
      goto LABEL_8;
    }
  }
  return result;
}

void ___ZN20GLRDataBufferManager18getDataBufferSpaceEPU27objcproto16MTLCommandBuffer11objc_objectmPmPPv_block_invoke(uint64_t a1)
{
}

void *GLDContextRec::getIndexBuffer(void **this, int a2, unsigned int a3, unsigned __int8 *a4, unint64_t *a5, MTLIndexType *a6)
{
  MTLIndexType v10 = MTLIndexTypeUInt16;
  unsigned int v11 = 2;
  if (a2 != 5121 && a2 != 5123)
  {
    if (a2 != 5125)
    {
      MTLReleaseAssertionFailure();
      goto LABEL_23;
    }
    unsigned int v11 = 4;
    MTLIndexType v10 = MTLIndexTypeUInt32;
  }
  *a6 = v10;
  __dst = 0;
  size_t v12 = v11 * (unint64_t)a3;
  DataBufferSpace = GLRDataBufferManager::getDataBufferSpace((GLRDataBufferManager *)(this + 659), this[5], (v12 + 15) & 0xFFFFFFFF0, a5, (uint64_t *)&__dst);
  if (!DataBufferSpace) {
    return DataBufferSpace;
  }
  if (a2 == 5125 || a2 == 5123)
  {
    memcpy(__dst, a4, v12);
    return DataBufferSpace;
  }
  if (a2 == 5121)
  {
    uint64_t v14 = (int)a3;
    if (*((unsigned char *)this[13] + 15444))
    {
      if (a3)
      {
        uint64_t v15 = (__int16 *)__dst;
        do
        {
          int v17 = *a4++;
          __int16 v16 = v17;
          if (v17 == 255) {
            __int16 v16 = -1;
          }
          *v15++ = v16;
          --v14;
        }
        while (v14);
      }
    }
    else if (a3)
    {
      int v19 = __dst;
      do
      {
        __int16 v20 = *a4++;
        *v19++ = v20;
        --v14;
      }
      while (v14);
    }
    return DataBufferSpace;
  }
LABEL_23:
  uint64_t v21 = (GLDContextRec *)MTLReleaseAssertionFailure();
  return (void *)GLDContextRec::getVertexBuffer(v21, v22, v23, v24);
}

void *GLDContextRec::getVertexBuffer(void **this, uint64_t a2, void **a3, unint64_t *a4)
{
  return GLRDataBufferManager::getDataBufferSpace((GLRDataBufferManager *)(this + 659), this[5], (a2 + 15) & 0xFFFFFFFFFFFFFFF0, a4, (uint64_t *)a3);
}

void GLDContextRec::tfDirtyBuffers(GLDContextRec *this)
{
  uint64_t v2 = 0;
  BOOL v3 = (char *)this + 3400;
  do
  {
    uint64_t v4 = *((void *)this + v2 + 383);
    if (v4 && !*(unsigned char *)(v4 + 32))
    {
      *(unsigned char *)(v4 + 32) = 1;
      uint64_t v5 = (void *)*((void *)this + 424);
      unint64_t v6 = *((void *)this + 425);
      if ((unint64_t)v5 >= v6)
      {
        uint64_t v8 = *((void *)this + 423);
        uint64_t v9 = ((uint64_t)v5 - v8) >> 3;
        if ((unint64_t)(v9 + 1) >> 61) {
          abort();
        }
        uint64_t v10 = v6 - v8;
        uint64_t v11 = v10 >> 2;
        if (v10 >> 2 <= (unint64_t)(v9 + 1)) {
          uint64_t v11 = v9 + 1;
        }
        if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFF8) {
          unint64_t v12 = 0x1FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v12 = v11;
        }
        if (v12) {
          unsigned int v13 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<GLRBufferResource *>>((uint64_t)v3, v12);
        }
        else {
          unsigned int v13 = 0;
        }
        uint64_t v14 = &v13[8 * v9];
        *(void *)uint64_t v14 = v4;
        uint64_t v7 = v14 + 8;
        uint64_t v15 = (char *)*((void *)this + 424);
        __int16 v16 = (char *)*((void *)this + 423);
        if (v15 != v16)
        {
          do
          {
            uint64_t v17 = *((void *)v15 - 1);
            v15 -= 8;
            *((void *)v14 - 1) = v17;
            v14 -= 8;
          }
          while (v15 != v16);
          uint64_t v15 = (char *)*((void *)this + 423);
        }
        *((void *)this + 423) = v14;
        *((void *)this + 424) = v7;
        *((void *)this + 425) = &v13[8 * v12];
        if (v15) {
          operator delete(v15);
        }
      }
      else
      {
        void *v5 = v4;
        uint64_t v7 = v5 + 1;
      }
      *((void *)this + 424) = v7;
    }
    ++v2;
  }
  while (v2 != 4);
}

uint64_t gldDrawPixels()
{
  return 1;
}

uint64_t gldBeginPrimitiveBuffer(GLDContextRec *this, unsigned int a2, int *a3)
{
  int v4 = 12 * ((*a3 + 11) / 12);
  if (v4 <= 12) {
    int v4 = 12;
  }
  unint64_t v5 = *((void *)this + 257);
  unsigned int v6 = 0x4000 / v5 - (unsigned __int16)(0x4000 / v5 - 12 * ((unsigned __int16)((10923 * (0x4000 / v5)) >> 16) >> 1));
  signed int v7 = 12 * ((*((void *)this + 701) - *((void *)this + 700)) / v5 / 0xC);
  if (v7 > (int)v6) {
    unsigned int v6 = v7;
  }
  if (v6 >= v4) {
    uint64_t v8 = v4;
  }
  else {
    uint64_t v8 = v6;
  }
  *a3 = v8;
  if (!*((void *)this + 2) || *((_DWORD *)this + 620) && (GLDContextRec::endRenderPass(this), !*((void *)this + 2))) {
    GLDContextRec::beginRenderPass(this);
  }
  if (*((unsigned char *)this + 5082))
  {
    *((unsigned char *)this + 5082) = 0;
    *((_DWORD *)this + 618) |= 8u;
  }
  GLDContextRec::setRenderState((uint64_t)this, 129022);
  *((unsigned char *)this + 3376) = GLDContextRec::isTransformFeedbackActive(this);
  *((void *)this + 625) = GLRDataBufferManager::getDataBufferSpace((GLDContextRec *)((char *)this + 5272), *((void **)this + 5), (*((void *)this + 257) * v8 + 15) & 0xFFFFFFFFFFFFFFF0, (void *)this + 626, (uint64_t *)this + 627);
  return *((void *)this + 627);
}

uint64_t gldEndPrimitiveBuffer(uint64_t result, unsigned int a2, int a3, signed int a4)
{
  unsigned int v6 = (int8x8_t *)result;
  signed int v7 = (int8x8_t *)(result + 5044);
  if (*(unsigned char *)(result + 5083)
    || !*(void *)(result + 2200)
    || (*(unsigned char *)(result + 376) & 0x70) != 0 && *(unsigned char *)(result + 5081))
  {
    if (!*(unsigned char *)(result + 3376))
    {
      ++*(_DWORD *)(result + 2264);
      return result;
    }
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
  }
  uint64_t result = [*(id *)(result + 16) setVertexBuffer:*(void *)(result + 5000) offset:*(void *)(result + 5008) atIndex:15];
  v6[309].i32[0] |= 0x800u;
  v6[333].i32[1] = -1;
  v6[625] = 0;
  if ((v8 & 1) == 0 && ((v6[47].i8[0] & 1) == 0 || v6[276].i8[0] < 0))
  {
    if (v6[279].i8[0])
    {
      __int32 v9 = v6[283].i32[0];
      uint64_t v10 = (char *)v6[285];
      unint64_t v11 = (unint64_t)v6[286];
      if ((unint64_t)v10 >= v11)
      {
        unsigned int v13 = (char *)v6[284];
        uint64_t v14 = (v10 - v13) >> 2;
        unint64_t v15 = v14 + 1;
        if ((unint64_t)(v14 + 1) >> 62) {
          goto LABEL_63;
        }
        uint64_t v16 = v11 - (void)v13;
        if (v16 >> 1 > v15) {
          unint64_t v15 = v16 >> 1;
        }
        if ((unint64_t)v16 >= 0x7FFFFFFFFFFFFFFCLL) {
          unint64_t v17 = 0x3FFFFFFFFFFFFFFFLL;
        }
        else {
          unint64_t v17 = v15;
        }
        if (v17)
        {
          uint64_t v18 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&v6[286], v17);
          uint64_t v10 = (char *)v6[285];
          unsigned int v13 = (char *)v6[284];
        }
        else
        {
          uint64_t v18 = 0;
        }
        int v19 = (__int32 *)&v18[4 * v14];
        __int16 v20 = &v18[4 * v17];
        __int32 *v19 = v9;
        unint64_t v12 = v19 + 1;
        while (v10 != v13)
        {
          __int32 v21 = *((_DWORD *)v10 - 1);
          v10 -= 4;
          *--int v19 = v21;
        }
        v6[284] = (int8x8_t)v19;
        v6[285] = (int8x8_t)v12;
        v6[286] = (int8x8_t)v20;
        if (v13) {
          operator delete(v13);
        }
      }
      else
      {
        *(_DWORD *)uint64_t v10 = v9;
        unint64_t v12 = v10 + 4;
      }
      v6[285] = (int8x8_t)v12;
    }
    if (v6[37].i32[0]) {
      GLDContextRec::setRenderPrimitiveCurrents((GLDContextRec *)v6);
    }
    uint64_t result = [*(id *)&v6[2] drawPrimitives:sPrimType[a3] vertexStart:0 vertexCount:a4];
    v6[629] = vorr_s8(v6[629], *v7);
  }
  if (v6[422].i8[0])
  {
    v6[331].i8[4] = 1;
    v6[309].i32[0] |= 8u;
    GLDContextRec::setRenderState((uint64_t)v6, 129022);
    if (v6[37].i32[0]) {
      GLDContextRec::setRenderPrimitiveCurrents((GLDContextRec *)v6);
    }
    unsigned int v22 = vertexCountPerPrimitive(a3);
    v36[0] = 0;
    v36[1] = a4 / v22 * v22;
    v36[2] = v22 * *(_DWORD *)(*(void *)&v6[420] + 24);
    [*(id *)&v6[2] setVertexBytes:v36 length:12 atIndex:31];
    if (!v6[279].i8[0]) {
      goto LABEL_54;
    }
    __int32 v23 = v6[283].i32[0];
    unsigned int v24 = (char *)v6[285];
    unint64_t v25 = (unint64_t)v6[286];
    if ((unint64_t)v24 < v25)
    {
      *(_DWORD *)unsigned int v24 = v23;
      unsigned int v26 = v24 + 4;
LABEL_53:
      v6[285] = (int8x8_t)v26;
LABEL_54:
      if (v6[275]) {
        [*(id *)&v6[2] drawPrimitives:sPrimType[a3] vertexStart:0 vertexCount:a4];
      }
      GLDContextRec::tfDirtyBuffers((GLDContextRec *)v6);
      uint64_t result = GLDTransformFeedbackMachine::incrementPrimitiveCount((uint64_t)&v6[419], (GLDContextRec *)v6, a4, a3, 1);
      v6[331].i8[4] = 0;
      v6[309].i32[0] |= 8u;
      goto LABEL_57;
    }
    int v27 = (char *)v6[284];
    uint64_t v28 = (v24 - v27) >> 2;
    unint64_t v29 = v28 + 1;
    if (!((unint64_t)(v28 + 1) >> 62))
    {
      uint64_t v30 = v25 - (void)v27;
      if (v30 >> 1 > v29) {
        unint64_t v29 = v30 >> 1;
      }
      if ((unint64_t)v30 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v31 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v31 = v29;
      }
      if (v31)
      {
        uint64_t v32 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&v6[286], v31);
        unsigned int v24 = (char *)v6[285];
        int v27 = (char *)v6[284];
      }
      else
      {
        uint64_t v32 = 0;
      }
      uint64_t v33 = (__int32 *)&v32[4 * v28];
      BOOL v34 = &v32[4 * v31];
      __int32 *v33 = v23;
      unsigned int v26 = v33 + 1;
      while (v24 != v27)
      {
        __int32 v35 = *((_DWORD *)v24 - 1);
        v24 -= 4;
        *--uint64_t v33 = v35;
      }
      v6[284] = (int8x8_t)v33;
      v6[285] = (int8x8_t)v26;
      v6[286] = (int8x8_t)v34;
      if (v27) {
        operator delete(v27);
      }
      goto LABEL_53;
    }
LABEL_63:
    abort();
  }
LABEL_57:
  if (v6[628].i32[0] > 0x7FFu
    || *(void *)(*(void *)&v6[8] + 152) >> 27 > 2uLL
    || *(void *)&v6[696] >= 0x400000uLL)
  {
    uint64_t result = GLDContextRec::flushContext((id *)v6);
  }
  ++v6[283].i32[0];
  v6[631].i32[1] |= 0x2000000u;
  return result;
}

uint64_t gldBeginElementBuffer(GLDContextRec *a1)
{
  return 0;
}

void gldRenderVertexArray(int8x8_t *this, int a2, unsigned int a3, int a4, signed int a5, int a6, unsigned __int8 *a7, int a8, const void *a9)
{
  int8x8_t v9 = this[49];
  if (!*(void *)&v9) {
    return;
  }
  unint64_t v11 = (int8x8_t *)((char *)this + 5044);
  if (this[635].i8[3] || (this[47].i8[0] & 0x70) != 0 && this[635].i8[1]) {
    return;
  }
  if (!a2)
  {
    if (!*(void *)&this[2]
      || this[310].i32[0] && (GLDContextRec::endRenderPass((GLDContextRec *)this), !*(void *)&this[2]))
    {
      GLDContextRec::beginRenderPass((GLDContextRec *)this);
    }
    if (!v11[4].i8[6])
    {
      v11[4].i8[6] = 1;
      this[309].i32[0] |= 8u;
    }
    long long v30 = *(_OWORD *)this[234].i8;
    long long v31 = *(_OWORD *)this[238].i8;
    long long v62 = *(_OWORD *)this[236].i8;
    long long v63 = v31;
    int8x8_t v64 = this[240];
    long long v60 = *(_OWORD *)this[232].i8;
    long long v61 = v30;
    uint64_t v32 = *(unsigned int **)(*(void *)(*(void *)&this[183] + 24) + 56);
    unint64_t v33 = *v32;
    if (v33)
    {
      uint64_t v34 = 0;
      __int32 v35 = v32 + 3;
      BOOL v36 = 1;
      while (1)
      {
        int v37 = (*(v35 - 1) >> 8) & 0x1F;
        if ((v37 - 17) >= 2)
        {
          if (v37 != 28)
          {
LABEL_105:
            MTLReleaseAssertionFailure();
LABEL_106:
            abort();
          }
          if ((*(_DWORD *)(*(void *)(*(void *)&this[49] + 48) + 24 * (*v35 & 0x3F)) & 3) != *((_DWORD *)&v60 + v34) >> 30) {
            goto LABEL_34;
          }
        }
        BOOL v36 = ++v34 < v33;
        v35 += 2;
        if (v33 == v34)
        {
LABEL_34:
          if (v36) {
            this[309].i32[0] |= 1u;
          }
          break;
        }
      }
    }
    if (GLDContextRec::isTransformFeedbackActive((GLDContextRec *)this))
    {
      this[331].i8[4] = 1;
      this[309].i32[0] |= 8u;
      GLDContextRec::setRenderState((uint64_t)this, 131069);
      if (this[34].i32[1]) {
        GLDContextRec::setRenderVertexCurrents((GLDContextRec *)this);
      }
      unsigned int v38 = vertexCountPerPrimitive(a3);
      LODWORD(v58) = a4;
      HIDWORD(v58) = a5 / v38 * v38;
      int v59 = v38 * *(_DWORD *)(*(void *)&this[420] + 24);
      [*(id *)&this[2] setVertexBytes:&v58 length:12 atIndex:31];
      if (this[279].i8[0])
      {
        __int32 v39 = this[283].i32[0];
        int v40 = (char *)this[285];
        unint64_t v41 = (unint64_t)this[286];
        if ((unint64_t)v40 >= v41)
        {
          signed int v46 = (char *)this[284];
          uint64_t v47 = (v40 - v46) >> 2;
          unint64_t v48 = v47 + 1;
          if ((unint64_t)(v47 + 1) >> 62) {
            goto LABEL_106;
          }
          uint64_t v49 = v41 - (void)v46;
          if (v49 >> 1 > v48) {
            unint64_t v48 = v49 >> 1;
          }
          if ((unint64_t)v49 >= 0x7FFFFFFFFFFFFFFCLL) {
            unint64_t v50 = 0x3FFFFFFFFFFFFFFFLL;
          }
          else {
            unint64_t v50 = v48;
          }
          if (v50)
          {
            uint64_t v51 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)&this[286], v50);
            int v40 = (char *)this[285];
            signed int v46 = (char *)this[284];
          }
          else
          {
            uint64_t v51 = 0;
          }
          unsigned int v52 = (__int32 *)&v51[4 * v47];
          float v53 = &v51[4 * v50];
          __int32 *v52 = v39;
          int v42 = v52 + 1;
          while (v40 != v46)
          {
            __int32 v54 = *((_DWORD *)v40 - 1);
            v40 -= 4;
            *--unsigned int v52 = v54;
          }
          this[284] = (int8x8_t)v52;
          this[285] = (int8x8_t)v42;
          this[286] = (int8x8_t)v53;
          if (v46) {
            operator delete(v46);
          }
        }
        else
        {
          *(_DWORD *)int v40 = v39;
          int v42 = v40 + 4;
        }
        this[285] = (int8x8_t)v42;
      }
      if (this[275]) {
        [*(id *)&this[2] drawPrimitives:sPrimType[a3] vertexStart:a4 vertexCount:a5 instanceCount:a8];
      }
      ++this[628].i32[0];
      GLDContextRec::tfDirtyBuffers((GLDContextRec *)this);
      GLDTransformFeedbackMachine::incrementPrimitiveCount((uint64_t)&this[419], (GLDContextRec *)this, a5, a3, a8);
      this[331].i8[4] = 0;
      this[309].i32[0] |= 8u;
    }
    if (*(unsigned char *)(*(void *)&this[13] + 15712)) {
      goto LABEL_100;
    }
    GLDContextRec::setRenderState((uint64_t)this, 131069);
    if (this[34].i32[1]) {
      GLDContextRec::setRenderVertexCurrents((GLDContextRec *)this);
    }
    if (!*(void *)&this[275] || (this[47].i8[0] & 1) != 0 && (this[276].i8[0] & 0x80) == 0) {
      goto LABEL_100;
    }
    GLDContextRec::recordGLDrawCallIndexForMetalDrawCall((GLDContextRec *)this, this[283].i32[0]);
    [*(id *)&this[2] drawPrimitives:sPrimType[a3] vertexStart:a4 vertexCount:a5 instanceCount:a8];
    goto LABEL_99;
  }
  if ((a2 & 0xFFFFFFFD) != 1) {
    return;
  }
  long long v18 = *(_OWORD *)this[234].i8;
  long long v19 = *(_OWORD *)this[238].i8;
  long long v62 = *(_OWORD *)this[236].i8;
  long long v63 = v19;
  int8x8_t v64 = this[240];
  long long v60 = *(_OWORD *)this[232].i8;
  long long v61 = v18;
  __int16 v20 = *(unsigned int **)(*(void *)(*(void *)&this[183] + 24) + 56);
  unint64_t v21 = *v20;
  if (v21)
  {
    uint64_t v22 = 0;
    __int32 v23 = v20 + 3;
    BOOL v24 = 1;
    do
    {
      int v25 = (*(v23 - 1) >> 8) & 0x1F;
      if ((v25 - 17) >= 2)
      {
        if (v25 != 28) {
          goto LABEL_105;
        }
        if ((*(_DWORD *)(*(void *)(*(void *)&v9 + 48) + 24 * (*v23 & 0x3F)) & 3) != *((_DWORD *)&v60 + v22) >> 30) {
          break;
        }
      }
      BOOL v24 = ++v22 < v21;
      v23 += 2;
    }
    while (v21 != v22);
    if (v24) {
      this[309].i32[0] |= 1u;
    }
  }
  if (a6 != 5121 && *(unsigned char *)(*(void *)&v9 + 64))
  {
    uint64_t v26 = *(void *)(*(void *)(*(void *)&v9 + 56) + 256);
    uint64_t v27 = *(void *)(v26 + 40);
    if (v27 && (uint64_t v28 = *(void *)(v27 + 24)) != 0) {
      uint64_t v29 = *(void *)(v28 + 40);
    }
    else {
      uint64_t v29 = 0;
    }
    if (!*(void *)&this[2]
      || this[310].i32[0] && (GLDContextRec::endRenderPass((GLDContextRec *)this), !*(void *)&this[2]))
    {
      GLDContextRec::beginRenderPass((GLDContextRec *)this);
    }
    if (!v11[4].i8[6])
    {
      v11[4].i8[6] = 1;
      this[309].i32[0] |= 8u;
    }
    GLDContextRec::setRenderState((uint64_t)this, 131069);
    if (this[34].i32[1]) {
      GLDContextRec::setRenderVertexCurrents((GLDContextRec *)this);
    }
    if (!*(void *)&this[275]) {
      goto LABEL_100;
    }
    uint64_t v44 = **(void **)(v26 + 24);
    if ((this[47].i8[0] & 1) != 0 && (this[276].i8[0] & 0x80) == 0) {
      goto LABEL_100;
    }
    GLDContextRec::recordGLDrawCallIndexForMetalDrawCall((GLDContextRec *)this, this[283].i32[0]);
    if (a6 == 5123)
    {
      uint64_t v45 = 0;
    }
    else
    {
      if (a6 != 5125)
      {
        float v55 = (GLDContextRec *)MTLReleaseAssertionFailure();
        GLDContextRec::recordGLDrawCallIndexForMetalDrawCall(v55, v56);
        return;
      }
      uint64_t v45 = 1;
    }
    ((void (*)(void, void, void, void, uint64_t, uint64_t, unsigned __int8 *, void))this[446])(*(void *)&this[2], *(void *)&this[445], sPrimType[a3], a5, v45, v29, &a7[-v44], a8);
LABEL_99:
    this[629] = vorr_s8(this[629], *v11);
    ++this[628].i32[0];
LABEL_100:
    if (this[628].i32[0] > 0x7FFu
      || *(void *)(*(void *)&this[8] + 152) >> 27 > 2uLL
      || *(void *)&this[696] >= 0x400000uLL)
    {
      GLDContextRec::flushContext((id *)this);
    }
    ++this[283].i32[0];
    return;
  }
  unint64_t v57 = 0;
  MTLIndexType v58 = MTLIndexTypeUInt16;
  if (!*(void *)&this[2]
    || this[310].i32[0] && (GLDContextRec::endRenderPass((GLDContextRec *)this), !*(void *)&this[2]))
  {
    GLDContextRec::beginRenderPass((GLDContextRec *)this);
  }
  IndexBuffer = GLDContextRec::getIndexBuffer((void **)this, a6, a5, a7, &v57, &v58);
  if (IndexBuffer)
  {
    if (!v11[4].i8[6])
    {
      v11[4].i8[6] = 1;
      this[309].i32[0] |= 8u;
    }
    GLDContextRec::setRenderState((uint64_t)this, 131069);
    if (this[34].i32[1]) {
      GLDContextRec::setRenderVertexCurrents((GLDContextRec *)this);
    }
    if (*(void *)&this[275] && ((this[47].i8[0] & 1) == 0 || this[276].i8[0] < 0))
    {
      GLDContextRec::recordGLDrawCallIndexForMetalDrawCall((GLDContextRec *)this, this[283].i32[0]);
      ((void (*)(void, void, void, void, MTLIndexType, void *, unint64_t, void))this[446])(*(void *)&this[2], *(void *)&this[445], sPrimType[a3], a5, v58, IndexBuffer, v57, a8);
      this[629] = vorr_s8(this[629], *v11);
      ++this[628].i32[0];
    }
    GLDContextRec::flushContextIfNeeded((intptr_t)this);
    ++this[283].i32[0];
  }
}

void GLDContextRec::recordGLDrawCallIndexForMetalDrawCall(GLDContextRec *this, int a2)
{
  if (*((unsigned char *)this + 2232))
  {
    int v4 = (char *)*((void *)this + 285);
    unint64_t v5 = *((void *)this + 286);
    if ((unint64_t)v4 >= v5)
    {
      signed int v7 = (char *)*((void *)this + 284);
      uint64_t v8 = (v4 - v7) >> 2;
      unint64_t v9 = v8 + 1;
      if ((unint64_t)(v8 + 1) >> 62) {
        abort();
      }
      uint64_t v10 = v5 - (void)v7;
      if (v10 >> 1 > v9) {
        unint64_t v9 = v10 >> 1;
      }
      if ((unint64_t)v10 >= 0x7FFFFFFFFFFFFFFCLL) {
        unint64_t v11 = 0x3FFFFFFFFFFFFFFFLL;
      }
      else {
        unint64_t v11 = v9;
      }
      if (v11)
      {
        unint64_t v12 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<unsigned int>>((uint64_t)this + 2288, v11);
        int v4 = (char *)*((void *)this + 285);
        signed int v7 = (char *)*((void *)this + 284);
      }
      else
      {
        unint64_t v12 = 0;
      }
      unsigned int v13 = &v12[4 * v8];
      uint64_t v14 = &v12[4 * v11];
      *(_DWORD *)unsigned int v13 = a2;
      unsigned int v6 = v13 + 4;
      while (v4 != v7)
      {
        int v15 = *((_DWORD *)v4 - 1);
        v4 -= 4;
        *((_DWORD *)v13 - 1) = v15;
        v13 -= 4;
      }
      *((void *)this + 284) = v13;
      *((void *)this + 285) = v6;
      *((void *)this + 286) = v14;
      if (v7) {
        operator delete(v7);
      }
    }
    else
    {
      *(_DWORD *)int v4 = a2;
      unsigned int v6 = v4 + 4;
    }
    *((void *)this + 285) = v6;
  }
}

uint64_t vertexCountPerPrimitive(int a1)
{
  switch(a1)
  {
    case 0:
      return 1;
    case 4:
      return 3;
    case 1:
      return 2;
  }
  uint64_t v2 = (GLDContextRec *)MTLReleaseAssertionFailure();
  return GLDContextRec::flushContextIfNeeded(v2);
}

intptr_t GLDContextRec::flushContextIfNeeded(intptr_t this)
{
  if (*(_DWORD *)(this + 5024) > 0x7FFu
    || *(void *)(*(void *)(this + 64) + 152) >> 27 > 2uLL
    || *(void *)(this + 5568) >= 0x400000uLL)
  {
    return GLDContextRec::flushContext((id *)this);
  }
  return this;
}

void *std::__allocate_at_least[abi:nn180100]<std::allocator<GLRBufferResource *>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61) {
    std::__throw_bad_array_new_length[abi:nn180100]();
  }
  return operator new(8 * a2);
}

uint64_t GLDContextRec::loadCurrentSamplers(uint64_t this, unsigned __int16 a2)
{
  uint64_t v2 = *(void *)(this + 104);
  if (!*(unsigned char *)(v2 + 12724)) {
    return this;
  }
  uint64_t v3 = this;
  unsigned int v4 = 0;
  unsigned int v5 = a2;
  unsigned int v14 = a2;
  do
  {
    if (!v5) {
      goto LABEL_20;
    }
    do
    {
      unsigned int v6 = __clz(__rbit32(v5));
      uint64_t v7 = v6 + 16 * v4;
      uint64_t v8 = *(void *)(*(void *)(v3 + 112) + 8 * v7 + 720);
      if (!v8)
      {
        if (!*(void *)(v3 + 8 * v7 + 1208))
        {
          uint64_t v8 = 0;
          goto LABEL_17;
        }
        uint64_t v8 = 0;
        *(_DWORD *)(v3 + 4 * v7 + 1672) = 0;
        goto LABEL_16;
      }
      unint64_t v9 = (_DWORD *)(v3 + 4 * v7 + 1672);
      int v10 = *(_DWORD *)(v8 + 12);
      if (*v9 == v10) {
        int v11 = **(unsigned __int8 **)(v8 + 32);
      }
      else {
        int v11 = 1;
      }
      if (**(unsigned char **)(v8 + 32))
      {
        uint64_t v12 = *(void *)(v3 + 88);
        int v13 = *(_DWORD *)(v12 + 28) + 1;
        *(_DWORD *)(v12 + 28) = v13;
        *(_DWORD *)(v8 + 12) = v13;
        this = GLDSamplerRec::update((GLDSamplerRec *)v8);
        if (this)
        {
          **(unsigned char **)(v8 + 32) = 0;
          int v10 = *(_DWORD *)(v8 + 12);
          goto LABEL_11;
        }
        uint64_t v8 = 0;
        *unint64_t v9 = 0;
        if (!*(void *)(v3 + 8 * v7 + 1208)) {
          goto LABEL_17;
        }
LABEL_16:
        *(_DWORD *)(v3 + 2472) |= 4u;
        *(_DWORD *)(v3 + 2644) |= 1 << (v6 + 16 * v4);
        goto LABEL_17;
      }
LABEL_11:
      *unint64_t v9 = v10;
      if (v11) {
        goto LABEL_16;
      }
LABEL_17:
      *(void *)(v3 + 8 * v7 + 1208) = v8;
      v5 ^= 1 << v6;
    }
    while (v5);
    uint64_t v2 = *(void *)(v3 + 104);
    unsigned int v5 = v14;
LABEL_20:
    ++v4;
  }
  while (v4 < *(unsigned __int8 *)(v2 + 12724));
  return this;
}

void GLRRenderPipelineKey::init(GLRRenderPipelineKey *this)
{
  *((_OWORD *)this + 6) = 0u;
  *((_OWORD *)this + 7) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 2) = 0u;
  *((_OWORD *)this + 3) = 0u;
  *(_OWORD *)this = 0u;
  *((_OWORD *)this + 1) = 0u;
  memset_pattern16((char *)this + 88, &unk_2406F5960, 0x10uLL);
  *((void *)this + 9) = 0;
  *((void *)this + 10) = 0xFFFFFFFFLL;
  *((void *)this + 14) = 0x180FF3F800000;
}

const void *GLRFunctionCache::getFunction(GLRFunctionCache *this, int a2)
{
  if (!a2) {
    return 0;
  }
  pthread_rwlock_rdlock((pthread_rwlock_t *)this);
  ValueAtIndex = CFArrayGetValueAtIndex(*((CFArrayRef *)this + 27), (a2 - 1));
  pthread_rwlock_unlock((pthread_rwlock_t *)this);
  return ValueAtIndex;
}

uint64_t GLRFunctionCache::destroy(pthread_rwlock_t *this)
{
  sig = (const void *)this[1].__sig;
  if (sig) {
    CFRelease(sig);
  }
  uint64_t v3 = *(const void **)this[1].__opaque;
  if (v3) {
    CFRelease(v3);
  }
  unsigned int v4 = *(const void **)&this[1].__opaque[8];
  if (v4) {
    CFRelease(v4);
  }

  return pthread_rwlock_destroy(this);
}

unint64_t GLRFunctionCache::getKey(pthread_rwlock_t *a1, void *a2)
{
  unint64_t v2 = (unint64_t)a2;
  if (!a2) {
    return v2;
  }
  uint64_t v4 = [a2 functionType];
  if (v4 == 2)
  {
    opaque = (const __CFDictionary **)a1[1].__opaque;
  }
  else
  {
    if (v4 != 1) {
      return 0;
    }
    opaque = (const __CFDictionary **)&a1[1];
  }
  CFDictionaryRef v6 = *opaque;
  if (!*opaque) {
    return 0;
  }
  pthread_rwlock_rdlock(a1);
  value = 0;
  if (CFDictionaryGetValueIfPresent(v6, (const void *)v2, (const void **)&value)) {
    unint64_t v2 = value;
  }
  else {
    unint64_t v2 = 0;
  }
  pthread_rwlock_unlock(a1);
  return v2;
}

uint64_t _cachedFunctionHash(void *a1)
{
  return *(void *)[a1 bitCodeHash];
}

BOOL _renderPipelineKeyEqual(int8x16_t *a1, int8x16_t *a2)
{
  return vmaxvq_u32((uint32x4_t)vorrq_s8(vorrq_s8(vorrq_s8(vorrq_s8(veorq_s8(a2[1], a1[1]), veorq_s8(*a2, *a1)), vorrq_s8(veorq_s8(a2[2], a1[2]), veorq_s8(a2[3], a1[3]))), vorrq_s8(vorrq_s8(veorq_s8(a2[4], a1[4]), veorq_s8(a2[5], a1[5])), veorq_s8(a2[6], a1[6]))), veorq_s8(a2[7], a1[7]))) == 0;
}

BOOL GLDContextRec::handleProcessingModeChange(GLDContextRec *this)
{
  int v1 = *((_DWORD *)this + 95);
  int v2 = v1 | 0x100100;
  if (*(_WORD *)(*((void *)this + 13) + 4) == 1) {
    int v2 = v1 | 0x100;
  }
  if (*(_WORD *)(*((void *)this + 13) + 4)) {
    int v1 = v2;
  }
  int v3 = *((_DWORD *)this + 96);
  if (v1 != (v3 & 0x300300)) {
    *((_DWORD *)this + 96) = v3 & 0xFFCFFCFF | v1;
  }
  return v1 != (v3 & 0x300300);
}

uint64_t gldUpdateDispatch(GLDContextRec *this, int a2, unsigned int *a3, double a4, double a5, double a6, double a7, float a8, unsigned int *a9)
{
  uint64_t v11 = *((void *)this + 11);
  if (*(_DWORD *)(v11 + 248)) {
    pthread_mutex_lock((pthread_mutex_t *)(v11 + 256));
  }
  *a3 |= *((_DWORD *)this + 453);
  *((_DWORD *)this + 453) = 0;
  if ((a3[1] & 0x80000000) != 0)
  {
    int v12 = *(_DWORD *)(*((void *)this + 13) + 8);
    if ((v12 & 0x3FF) == 0) {
      int v12 = *(_DWORD *)(*((void *)this + 16) + 584) & 0x3FF;
    }
    *((_DWORD *)this + 94) = v12;
    *((_DWORD *)this + 618) |= 8u;
  }
  if (*((_WORD *)a3 + 8)) {
    GLDContextRec::loadCurrentSamplers((uint64_t)this, *((_WORD *)a3 + 8));
  }
  unsigned __int16 v13 = *((_WORD *)a3 + 2);
  if (v13)
  {
    if (*(unsigned char *)(*((void *)this + 11) + 440))
    {
      uint64_t v14 = mach_absolute_time();
      GLDContextRec::loadCurrentTextures((uint64_t)this, v13, (const unint64_t *)(*((void *)this + 13) + 12704));
      *((void *)this + 632) += mach_absolute_time() - v14;
    }
    else
    {
      GLDContextRec::loadCurrentTextures((uint64_t)this, *((_WORD *)a3 + 2), (const unint64_t *)(*((void *)this + 13) + 12704));
    }
  }
  if (((*((_DWORD *)this + 660) | *((_DWORD *)this + 661)) & *((_DWORD *)this + 662)) != 0)
  {
    for (uint64_t i = 0; i != 32; ++i)
    {
      if ((*((_DWORD *)this + 662) >> i)) {
        GLDTextureRec::setForceASTC_LP(*((GLDTextureRec **)this + i + 119), **(unsigned __int16 **)(*((void *)this + i + 151) + 24) != 9728);
      }
    }
  }
  unsigned int v16 = a3[3];
  if ((v16 & 0x80000000) != 0)
  {
    BOOL v17 = GLDContextRec::handleProcessingModeChange(this);
    unsigned int v16 = a3[3];
    if (v17)
    {
      a3[3] = v16 | 0x8C40000;
      *((_DWORD *)this + 618) |= 0x10u;
      unsigned int v16 = a3[3];
    }
  }
  if ((v16 & 0x1000) != 0)
  {
    GLDContextRec::loadCurrentVertexArray((uint64_t)this, a3);
    unsigned int v16 = a3[3];
  }
  if ((v16 & 0x30440000) != 0)
  {
    GLDContextRec::loadCurrentPipelinePrograms((uint64_t)this, a3, (uint64_t)a3, a9);
    unsigned int v16 = a3[3];
  }
  if ((v16 & 0x8800000) != 0)
  {
    a4 = NAN;
    *((void *)this + 330) = -1;
    *((_DWORD *)this + 618) |= 0x400u;
    unsigned int v16 = a3[3];
  }
  if (*((unsigned char *)this + 385)) {
    uint64_t v18 = 4;
  }
  else {
    uint64_t v18 = 5;
  }
  if ((v16 & 0x10000000) != 0)
  {
    *((_DWORD *)this + 618) |= 0x400u;
    unsigned int v16 = a3[3];
  }
  if ((v16 & 0x20000000) != 0) {
    GLDContextRec::updateUniformBindings(this);
  }
  int v19 = *a3;
  if ((*a3 & 2) != 0)
  {
    GLDContextRec::updateRenderBlendState((uint64_t)this);
    int v19 = *a3;
  }
  if ((v19 & 0x20400000) != 0)
  {
    *((_DWORD *)this + 618) |= 8u;
    *((_DWORD *)this + 621) |= 2u;
  }
  if (*((unsigned char *)a3 + 11)) {
    GLDContextRec::updateRenderClipPlanes((uint64_t)this);
  }
  int v20 = *a3;
  if ((*a3 & 4) != 0)
  {
    *((_DWORD *)this + 618) |= 0x1000u;
    int v20 = *a3;
    if ((*a3 & 1) == 0)
    {
LABEL_42:
      if ((v20 & 0x20000) == 0) {
        goto LABEL_43;
      }
      goto LABEL_61;
    }
  }
  else if ((v20 & 1) == 0)
  {
    goto LABEL_42;
  }
  GLDContextRec::updateRenderAlphaTestState((uint64_t)this);
  int v20 = *a3;
  if ((*a3 & 0x20000) == 0)
  {
LABEL_43:
    if ((v20 & 0x4000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_62;
  }
LABEL_61:
  GLDContextRec::updateRenderLogicOpState((uint64_t)this);
  int v20 = *a3;
  if ((*a3 & 0x4000) == 0)
  {
LABEL_44:
    if ((v20 & 0x800000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_45;
  }
LABEL_62:
  GLDContextRec::updateRenderLineMode((uint64_t)this);
  int v20 = *a3;
  if ((*a3 & 0x800000) != 0)
  {
LABEL_45:
    GLDContextRec::updateRenderPolygonMode((uint64_t)this);
    int v20 = *a3;
  }
LABEL_46:
  if ((v20 & 0x10800200) != 0) {
    GLDContextRec::updateRenderDepthStencil((uint64_t)this);
  }
  if (a3[2]) {
    GLDContextRec::updateRenderViewport(this, a4, a5, a6, a7, a8);
  }
  unsigned int v21 = a3[1];
  if ((v21 & 0x80000) != 0)
  {
    GLDContextRec::updateRenderPrimitiveRestart((uint64_t)this);
    unsigned int v21 = a3[1];
  }
  if ((v21 & 0x800000) != 0) {
    GLDContextRec::loadCurrentQueries(this);
  }
  int v22 = *((_DWORD *)this + 618);
  if ((v22 & 0x40) != 0 || (*((unsigned char *)a3 + 6) & 0x80) != 0)
  {
    if ((*((unsigned char *)this + 5045) & 3) != 0)
    {
      unint64_t v23 = *((void *)this + 272);
      if ((v23 & 0x10000000000) != 0)
      {
        unint64_t v24 = 0;
LABEL_66:
        *((void *)this + 272) = v23 & 0xFFFFFEFFFFFFFFFFLL | v24;
        v22 |= 8u;
        *((_DWORD *)this + 618) = v22;
      }
    }
    else
    {
      uint64_t v25 = *((void *)this + 599);
      unint64_t v23 = *((void *)this + 272);
      if ((v25 == 0) != ((v23 >> 40) & 1))
      {
        unint64_t v24 = (unint64_t)(v25 == 0) << 40;
        goto LABEL_66;
      }
    }
  }
  if (a3[3] & 0x40000 | v22 & 1 || (a3[1] & 0x80000000) != 0)
  {
    GLDContextRec::buildPrimitiveBufferVertexArrayDescriptor(this);
    *((_DWORD *)this + 618) |= 0x803u;
    uint64_t v18 = v18 | 2;
  }
  uint64_t v26 = *((void *)this + 11);
  if (*(_DWORD *)(v26 + 248)) {
    pthread_mutex_unlock((pthread_mutex_t *)(v26 + 256));
  }
  return v18;
}

uint64_t GLDContextRec::flushResource(id *this, GLRResource *a2)
{
  if (*((_DWORD *)a2 + 3)) {
    GLDContextRec::flushContext(this);
  }
  return 0;
}

uint64_t GLDContextRec::finishResource(id *this, GLRResource *a2)
{
  if (*((_DWORD *)a2 + 3)) {
    GLDContextRec::flushContext(this);
  }
  (*(void (**)(GLRResource *, id))(*(void *)a2 + 40))(a2, this[11]);
  return 0;
}

uint64_t GLDContextRec::testResource(id *this, GLRResource *a2, unsigned int a3, int a4)
{
  if (a4 && *((_DWORD *)a2 + 3)) {
    GLDContextRec::flushContext(this);
  }
  if (*((_DWORD *)a2 + 3)) {
    return 0;
  }
  else {
    return (*(uint64_t (**)(GLRResource *))(*(void *)a2 + 48))(a2);
  }
}

BOOL GLDContextRec::testFence(id *this, GLDFenceRec *a2, int a3)
{
  if (GLDFenceRec::getStatus(a2) == 3) {
    return 1;
  }
  if (a3)
  {
    if (*((_DWORD *)a2 + 3)) {
      GLDContextRec::flushContext(this);
    }
  }
  return GLDFenceRec::getStatus(a2) == 3;
}

uint64_t ___ZN13GLDContextRec20flushContextInternalEv_block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  GLDDeviceRec::telemetryEmitBacktraceInfo(*(void *)(v1 + 96), (const void *)(v1 + 432));
  int v2 = *(id **)(v1 + 96);

  return GLDDeviceRec::telemetryEmitGPUWorkSubmitted(v2);
}

void __Block_byref_object_copy__1(uint64_t a1, uint64_t a2)
{
}

uint64_t ___ZN13GLDContextRec20flushContextInternalEv_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v4 = *(void *)(a1 + 64);
  uint64_t v5 = [a2 error];
  if (v5)
  {
    CFDictionaryRef v6 = (void *)v5;
    NSLog(&cfstr_Gldrenderermet.isa, v5);
    uint64_t v5 = [v6 code];
    *(void *)(v4 + 6264) = v5;
    if (*(unsigned char *)(v4 + 6276))
    {
      *(unsigned char *)(v4 + 6276) = 0;
      dispatch_group_leave(*(dispatch_group_t *)(v4 + 5264));
      uint64_t v5 = *(void *)(v4 + 6264);
    }
    if (v5 == 4) {
      int v7 = 2;
    }
    else {
      int v7 = 1;
    }
    *(_DWORD *)(v4 + 6272) = v7;
  }
  uint64_t v8 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  if (v8) {
    GLRDataBufferManager::releaseDataBuffer(v4 + 5272, v8);
  }
  unint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  if (v9) {
    GLRDataBufferManager::releaseDataBuffer(v4 + 5632, v9);
  }
  int v10 = *(uint64_t **)(a1 + 72);
  if (v10) {
    GLDContextRec::dispatchCompletedBlocks(v5, (uint64_t)a2, v10);
  }
  if (*(unsigned char *)(a1 + 88)) {
    GLDContextRec::signalQueryStamp((GLDContextRec *)v4, *(void *)(a1 + 80));
  }
  if (GLRResourceList::makeResourcesNotBusyAndReset(*(GLRResourceList **)(*(void *)(*(void *)(a1 + 48) + 8)
                                                                                       + 24)))
    GLDShareGroupRec::signalUsage(*(GLDShareGroupRec **)(*(void *)(*(void *)(a1 + 56) + 8) + 24));
  uint64_t v11 = *(GLRResourceList **)(*(void *)(*(void *)(a1 + 48) + 8) + 24);

  return GLRResourceList::releaseToPool(v11);
}

uint64_t GLDContextRec::dispatchCompletedBlocks(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  if (a3)
  {
    int v3 = a3;
    do
    {
      (*(void (**)(void))(v3[1] + 16))();
      _Block_release((const void *)v3[1]);
      uint64_t v4 = (uint64_t *)*v3;
      uint64_t result = MEMORY[0x2455F5620](v3, 0xA0C40AFF93C70);
      int v3 = v4;
    }
    while (v4);
  }
  return result;
}

uint64_t GLDContextRec::waitContext(dispatch_group_t *this)
{
  dispatch_group_wait(this[658], 0xFFFFFFFFFFFFFFFFLL);
  int v2 = (uint64_t (*)(void))*((void *)this[9]->isa + 5);

  return v2();
}

uint64_t GLDContextRec::setFence(GLRResourceList **this, GLDFenceRec *a2)
{
  if (!this[5]) {
    GLDContextRec::getCommandBuffer((GLDContextRec *)this);
  }
  *((_DWORD *)a2 + 8) = 0;
  *((unsigned char *)this + 5087) = 1;
  uint64_t v4 = this[8];

  return GLRResourceList::addFence(v4, a2);
}

void GLDContextRec::addCompletionBlock()
{
}

uint64_t gldTestObject(id *this, int a2, int a3, int a4, GLDFenceRec *a5)
{
  switch(a2)
  {
    case 3:
      uint64_t MemoryPlugin = GLDBufferRec::getMemoryPlugin(a5);
      if (!MemoryPlugin) {
        return 1;
      }
      int v10 = *(GLRResource **)(MemoryPlugin + 24);
      if (!v10) {
        return 1;
      }
      break;
    case 1:
      uint64_t TextureResource = GLDTextureRec::getTextureResource(a5, 0);
      if (!TextureResource) {
        return 1;
      }
      int v10 = (GLRResource *)TextureResource;
      break;
    case 0:
      return GLDContextRec::testFence(this, a5, a4);
    default:
      return 1;
  }

  return GLDContextRec::testResource(this, v10, v9, a4);
}

uint64_t gldFlushObject(id *this, int a2, int a3, GLDTextureRec *a4)
{
  if (a2 == 3)
  {
    uint64_t MemoryPlugin = GLDBufferRec::getMemoryPlugin(a4);
    if (MemoryPlugin)
    {
      uint64_t v7 = *(void *)(MemoryPlugin + 24);
      if (v7)
      {
        if (*(_DWORD *)(v7 + 12)) {
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    if (a2 != 1)
    {
      if (a2 || !*((_DWORD *)a4 + 3)) {
        return 0;
      }
LABEL_15:
      GLDContextRec::flushContext(this);
      return 0;
    }
    uint64_t TextureResource = GLDTextureRec::getTextureResource(a4, 0);
    if (TextureResource && *(_DWORD *)(TextureResource + 12)) {
      GLDContextRec::flushContext(this);
    }
    uint64_t v9 = GLDTextureRec::getTextureResource(a4, 1u);
    if (v9 && *(_DWORD *)(v9 + 12)) {
      goto LABEL_15;
    }
  }
  return 0;
}

uint64_t gldFinishObject(id *a1, int a2, int a3, GLDTextureRec *this)
{
  uint64_t v5 = a1;
  switch(a2)
  {
    case 3:
      uint64_t MemoryPlugin = GLDBufferRec::getMemoryPlugin(this);
      if (!MemoryPlugin) {
        return 0;
      }
      CFDictionaryRef v6 = *(GLRResource **)(MemoryPlugin + 24);
      if (!v6) {
        return 0;
      }
      goto LABEL_12;
    case 1:
      uint64_t TextureResource = (GLRResource *)GLDTextureRec::getTextureResource(this, 0);
      if (TextureResource) {
        GLDContextRec::finishResource(v5, TextureResource);
      }
      uint64_t v9 = GLDTextureRec::getTextureResource(this, 1u);
      if (!v9) {
        return 0;
      }
      CFDictionaryRef v6 = (GLRResource *)v9;
LABEL_12:
      a1 = v5;
      goto LABEL_13;
    case 0:
      CFDictionaryRef v6 = this;
LABEL_13:
      GLDContextRec::finishResource(a1, v6);
      break;
  }
  return 0;
}

uint64_t gldFinishContext(uint64_t a1)
{
  GLDContextRec::flushContext((id *)a1);
  dispatch_group_wait(*(dispatch_group_t *)(a1 + 5264), 0xFFFFFFFFFFFFFFFFLL);
  int v2 = *(uint64_t (**)(void))(**(void **)(a1 + 72) + 40);

  return v2();
}

void GLDContextRec::dispatchImageQueueBlockAsync(id *a1, NSObject **this, uint64_t a3, dispatch_block_t block)
{
  if (*((_DWORD *)this + 19))
  {
    unsigned int v8 = 0;
    do
    {
      uint64_t TextureResource = (GLRResource *)GLDTextureRec::getTextureResource((GLDTextureRec *)this, v8);
      GLDContextRec::flushResource(a1, TextureResource);
      ++v8;
    }
    while (v8 < *((_DWORD *)this + 19));
  }
  TextureImageQueue = this[17];
  if (TextureImageQueue)
  {
    if (a3)
    {
LABEL_6:
      GLDBufferRec::dispatchGroupAsync(a3, TextureImageQueue, block);
      return;
    }
  }
  else
  {
    TextureImageQueue = GLDTextureRec::createTextureImageQueue((GLDTextureRec *)this);
    if (a3) {
      goto LABEL_6;
    }
  }

  dispatch_async(TextureImageQueue, block);
}

void GLDContextRec::dispatchImageQueueEvent(GLDContextRec *this, GLDTextureRec *a2)
{
  int v2 = *((void *)a2 + 17);
  if (v2)
  {
    uint64_t v4 = *((void *)this + 657);
    if (!v4)
    {
      uint64_t v4 = dispatch_group_create();
      *((void *)this + 657) = v4;
    }
    dispatch_group_async(v4, v2, &__block_literal_global_2);
  }
}

uint64_t GLDContextRec::loadCurrentTextures(uint64_t this, unsigned __int16 a2, const unint64_t *a3)
{
  uint64_t v32 = *(void *)(this + 88);
  unsigned int v3 = a2;
  *(_DWORD *)(this + 416) &= ~a2;
  uint64_t v4 = *(void *)(this + 104);
  if (!*(unsigned char *)(v4 + 12724)) {
    return this;
  }
  uint64_t v6 = this;
  unint64_t v7 = 0;
  unsigned int v31 = a2;
  do
  {
    if (!v3) {
      goto LABEL_41;
    }
    int v8 = 16 * v7;
    do
    {
      unsigned int v9 = __clz(__rbit32(v3));
      int v10 = 1 << v9;
      uint64_t v11 = v9 + v8;
      unint64_t v12 = a3[v7] >> (4 * v9);
      unsigned int v13 = v12 & 0xF;
      if (v13 <= 0xA)
      {
        uint64_t v14 = a3;
        uint64_t v15 = *(void *)(*(void *)(v6 + 112) + 8 * v11);
        if (v15)
        {
          uint64_t v16 = *(void *)(v15 + 56);
          unsigned int v17 = *(unsigned __int8 *)(v16 + 20);
          uint64_t v18 = (int *)(v6 + 4 * v11 + 1544);
          int v19 = *v18;
          if (*v18 == *(_DWORD *)(v15 + 12)) {
            char v20 = *(unsigned char *)(v16 + 20);
          }
          else {
            char v20 = -113;
          }
          if (v13 != 7)
          {
            uint64_t v22 = *(void *)(v15 + 48);
            if (((unsigned __int16)v10 & *(_WORD *)(*(void *)(v6 + 104) + 2 * v7 + 12720)) == 0
              || *(unsigned char *)(v22 + 2))
            {
              int v23 = *(unsigned __int16 *)(v22 + 4);
              BOOL v24 = v23 == 6402;
              this = *(void *)(v6 + 88);
              unint64_t v25 = v12 & 0xF;
              uint64_t v15 = *(void *)(this + 88 * (v23 == 6402) + 8 * v25 + 40);
              if (!v15)
              {
                this = (uint64_t)GLDShareGroupRec::createZeroTexture((GLDShareGroupRec *)this, v23 == 6402, v13);
                uint64_t v18 = (int *)(v6 + 4 * v11 + 1544);
                uint64_t v15 = this;
                *(void *)(*(void *)(v6 + 88) + 88 * v24 + 8 * v25 + 40) = this;
                int v19 = *v18;
              }
              uint64_t v16 = *(void *)(v15 + 56);
              unsigned int v17 = *(unsigned __int8 *)(v16 + 20);
              if (v19 == *(_DWORD *)(v15 + 12)) {
                char v20 = *(unsigned char *)(v16 + 20);
              }
              else {
                char v20 = -113;
              }
            }
            if (!v17)
            {
              a3 = v14;
              int v8 = 16 * v7;
              goto LABEL_37;
            }
            uint64_t v33 = (uint64_t)v18;
            uint64_t v26 = *(void *)(v6 + 88);
            int v27 = *(_DWORD *)(v26 + 24) + 1;
            *(_DWORD *)(v26 + 24) = v27;
            *(_DWORD *)(v15 + 12) = v27;
            this = GLDTextureRec::update((GLDTextureRec *)v15, v17, (unsigned __int16 *)(v16 + 8));
            if (this) {
              goto LABEL_27;
            }
            goto LABEL_33;
          }
          uint64_t v33 = v6 + 4 * v11 + 1544;
          if ((v17 & 8) == 0) {
            goto LABEL_12;
          }
          uint64_t v29 = *(GLDBufferRec **)v16;
          if (*(void *)v16)
          {
            int v30 = **((_DWORD **)v29 + 4);
            if (!v30) {
              goto LABEL_12;
            }
            this = GLDBufferRec::update(v29, v30);
            if (this)
            {
              **((_DWORD **)v29 + 4) = 0;
LABEL_12:
              if (!v17) {
                goto LABEL_28;
              }
              int v21 = *(_DWORD *)(v32 + 24) + 1;
              *(_DWORD *)(v32 + 24) = v21;
              *(_DWORD *)(v15 + 12) = v21;
              this = GLDTextureRec::update((GLDTextureRec *)v15, v17, (unsigned __int16 *)(*(void *)(v15 + 56) + 8));
              if (this)
              {
LABEL_27:
                uint64_t v28 = *(void *)(v15 + 56);
                *(void *)(v28 + 13) = 0;
                *(void *)(v28 + 8) = 0;
LABEL_28:
                a3 = v14;
                int v8 = 16 * v7;
                uint64_t v18 = (int *)v33;
LABEL_37:
                *uint64_t v18 = *(_DWORD *)(v15 + 12);
                if (!v20) {
                  goto LABEL_39;
                }
                goto LABEL_38;
              }
            }
          }
        }
LABEL_33:
        uint64_t v15 = 0;
        *(_DWORD *)(v6 + 416) |= 1 << v11;
        *(_DWORD *)(v6 + 4 * v11 + 1544) = 0;
        if (!*(void *)(v6 + 8 * v11 + 952))
        {
          a3 = v14;
          int v8 = 16 * v7;
          goto LABEL_39;
        }
        char v20 = -113;
        a3 = v14;
        int v8 = 16 * v7;
        goto LABEL_38;
      }
      if (!*(void *)(v6 + 8 * v11 + 952))
      {
        uint64_t v15 = 0;
        goto LABEL_39;
      }
      uint64_t v15 = 0;
      *(_DWORD *)(v6 + 4 * v11 + 1544) = 0;
      char v20 = -113;
LABEL_38:
      this = (uint64_t)GLDContextRec::bindTexture((_DWORD *)v6, (GLDTextureRec *)v15, v11, v20);
LABEL_39:
      *(void *)(v6 + 8 * v11 + 952) = v15;
      v3 ^= v10;
    }
    while (v3);
    uint64_t v4 = *(void *)(v6 + 104);
    unsigned int v3 = v31;
LABEL_41:
    ++v7;
  }
  while (v7 < *(unsigned __int8 *)(v4 + 12724));
  return this;
}

void GLDContextRec::generateTexMipmapsWithBlit(GLDContextRec *this, GLDTextureRec *a2, int a3)
{
  if (*((_DWORD *)this + 1151)) {
    GLDContextRec::beginRenderPass(this);
  }
  if (*((void *)this + 2)) {
    GLDContextRec::endRenderPass(this);
  }
  if (!*((void *)this + 5)) {
    GLDContextRec::getCommandBuffer(this);
  }
  uint64_t v6 = (void *)MEMORY[0x2455F59C0]();
  id v14 = (id)[*((id *)this + 5) blitCommandEncoder];
  [v14 setLabel:*MEMORY[0x263F12C98]];
  unint64_t v7 = *(void **)(*(void *)(GLDTextureRec::getTextureResource(a2, 0) + 40) + 32);
  if (*(unsigned char *)(*((void *)a2 + 6) + 211) == 6)
  {
    int v8 = GLDTextureRec::newCubeView(a2, a3);
    [v14 generateMipmapsForTexture:v8];
    if (v8 != v7)
    {
      GLDObject::operator new((GLDObject *)0x40);
      int v10 = v9;
      GLRTextureResource::GLRTextureResource(v9);
      uint64_t TextureResource = GLDTextureRec::getTextureResource(a2, 0);
      GLRTextureResource::initWithMetalTexture(v10, v8, *(void *)(TextureResource + 24));
      GLDContextRec::dispatchImageQueueEvent(this, a2);
      GLRResourceList::addResource(*((void *)this + 8), (uint64_t)v10);
      (*(void (**)(GLDLibrary *))(*(void *)v10 + 24))(v10);

      goto LABEL_12;
    }
  }
  else
  {
    [v14 generateMipmapsForTexture:v7];
  }
  uint64_t v12 = *((void *)this + 8);
  uint64_t v13 = GLDTextureRec::getTextureResource(a2, 0);
  GLRResourceList::addResource(v12, v13);
LABEL_12:
  [v14 endEncoding];
}

void sub_2406F23F4(_Unwind_Exception *a1)
{
  GLDObject::operator delete(v1);
  _Unwind_Resume(a1);
}

void GLDContextRec::flushRenderPassIfNeeded(GLDContextRec *this)
{
  if (*((_DWORD *)this + 1151)) {
    GLDContextRec::beginRenderPass(this);
  }
  if (*((void *)this + 2))
  {
    GLDContextRec::endRenderPass(this);
  }
}

void GLDContextRec::generateMipmapsWithCPUAsync(id *this, GLDTextureRec *a2, uint64_t a3)
{
  uint64_t v6 = *((void *)a2 + 6);
  if (*(unsigned char *)(v6 + 130))
  {
    int v8 = *(unsigned __int8 *)(v6 + 210);
    __int16 v7 = *(_WORD *)(v6 + 214);
  }
  else
  {
    __int16 v7 = *(_WORD *)(v6 + 214);
    int v8 = v7 >> 4;
  }
  int v9 = (v7 & 0xF) + 1;
  uint64_t TextureResource = (void *)GLDTextureRec::getTextureResource(a2, 0);
  (*(void (**)(void *))(*TextureResource + 16))(TextureResource);
  uint64_t v11 = TextureResource[4];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___ZN13GLDContextRec27generateMipmapsWithCPUAsyncEP13GLDTextureRecm_block_invoke;
  block[3] = &unk_2650D2928;
  block[4] = v11;
  void block[5] = this;
  int v13 = v9;
  int v14 = v8;
  void block[6] = TextureResource;
  void block[7] = a3;
  GLDContextRec::dispatchImageQueueBlockAsync(this, (NSObject **)a2, 0, block);
}

uint64_t ___ZN13GLDContextRec27generateMipmapsWithCPUAsyncEP13GLDTextureRecm_block_invoke(uint64_t a1)
{
  (*(void (**)(void, void))(**(void **)(a1 + 48) + 40))(*(void *)(a1 + 48), *(void *)(*(void *)(a1 + 40) + 88));
  uint64_t v2 = [*(id *)(a1 + 32) arrayLength];
  unsigned int v4 = *(_DWORD *)(a1 + 64);
  unsigned int v3 = *(_DWORD *)(a1 + 68);
  if (v4 <= v3)
  {
    uint64_t v5 = v2;
    do
    {
      if (v5)
      {
        for (uint64_t i = 0; i != v5; ++i)
          [*(id *)(a1 + 32) generateMipmapLevel:v4 slice:i + *(void *)(a1 + 56) * v5];
        unsigned int v3 = *(_DWORD *)(a1 + 68);
      }
      ++v4;
    }
    while (v4 <= v3);
  }
  __int16 v7 = *(uint64_t (**)(void))(**(void **)(a1 + 48) + 24);

  return v7();
}

void *GLDContextRec::getPixelBuffer(void **this, const void *a2, size_t a3, unint64_t *a4)
{
  __dst = 0;
  DataBufferSpace = GLRDataBufferManager::getDataBufferSpace((GLRDataBufferManager *)(this + 704), this[5], (a3 + 63) & 0xFFFFFFFFFFFFFFC0, a4, (uint64_t *)&__dst);
  if (DataBufferSpace) {
    memcpy(__dst, a2, a3);
  }
  return DataBufferSpace;
}

atomic_uint *gldUnbindTexture(atomic_uint *this, atomic_uint *a2)
{
  unsigned int v3 = (GLDContextRec *)this;
  for (uint64_t i = 517; i != 527; ++i)
  {
    if (*((atomic_uint **)v3 + i) == a2)
    {
      uint64_t v5 = a2;
      if (*((_DWORD *)v3 + 1151))
      {
        GLDContextRec::beginRenderPass(v3);
        uint64_t v5 = (atomic_uint *)*((void *)v3 + i);
      }
      this = GLDObject::release(v5);
      *((void *)v3 + i) = 0;
    }
  }
  return this;
}

void gldGetTextureLevelInfo()
{
}

uint64_t gldCopyTexSubImage()
{
  return 0;
}

uint64_t gldModifyTexSubImage(uint64_t a1, GLDTextureRec *this, int a3, unsigned int a4, int a5, int a6, int a7, int a8, unsigned int a9, int a10, unsigned int a11, unsigned int a12, uint64_t a13, int a14, GLDBufferRec *a15)
{
  if (*((int *)this + 19) < 2 && (uint64_t v23 = *((void *)this + 6), GLDTextureRec::load(this)))
  {
    unsigned int v24 = *((_DWORD *)this + 16);
    int v25 = (a4 == 0) & *(unsigned char *)(v23 + 130);
    if (v25 == 1
      && ((*(_WORD *)(*((void *)this + 6) + 214) & 0x1800) != 0
       || (*((unsigned char *)&glrTextureFormats + 40 * v24 + 36) & 0x40) == 0))
    {
      return 0;
    }
    int v26 = (int)(&glrTextureFormats)[5 * v24 + 1];
    if (v26 > 36247)
    {
      if (v26 == 36249)
      {
        int v26 = 6408;
      }
      else if (v26 == 36248)
      {
        int v26 = 6407;
      }
    }
    else if (v26 == 33320)
    {
      int v26 = 33319;
    }
    else if (v26 == 36244)
    {
      int v26 = 6403;
    }
    uint64_t result = 0;
    int v28 = *((_DWORD *)&glrTextureFormats + 10 * v24 + 3);
    if (v28 == 36193) {
      int v28 = 5131;
    }
    if (v26 == a11 && v28 == a12)
    {
      if (a11 == 6402 && a12 == 5126) {
        return 0;
      }
      uint64_t v29 = 0;
      *(void *)unint64_t v119 = 0;
      int v118 = 0;
      if (a12 && !a14) {
        uint64_t v29 = (int *)(*(void *)(a1 + 104) + 16212);
      }
      if ((*(_WORD *)(v23 + 214) & 0x1800) == 0x1000
        || (char v30 = 3, (*(_WORD *)(v23 + 214) & 0x2000) != 0) && (*(_WORD *)(v23 + 214) & 0x600) != 0)
      {
        char v30 = 4;
      }
      char v79 = v25;
      uint64_t v85 = v23;
      glrPixelSettings(a11, a12, a8, a9, &v119[1], v119, &v118, v29, v30);
      float v84 = (GLDBufferRec *)v118;
      LODWORD(block) = 0;
      LODWORD(v114) = 0;
      glgConvertType();
      unint64_t v83 = v119[1] * (unint64_t)a9;
      int v80 = a3;
      if ((*(_WORD *)(v23 + 214) & 0x2000) != 0)
      {
        unsigned int v31 = (GLDTextureRec *)a7;
        int v81 = 1;
        uint64_t v82 = a10;
        a7 = 0;
      }
      else
      {
        unsigned int v31 = (GLDTextureRec *)(a3 & ~(a3 >> 31));
        int v81 = a10;
        uint64_t v82 = 1;
      }
      uint64_t v32 = a13;
      if ((*(unsigned char *)(v23 + 24) & 4) != 0)
      {
        uint64_t TextureResource = (GLRResource *)GLDTextureRec::getTextureResource(this, 0);
        int v35 = GLDContextRec::testResource((id *)a1, TextureResource, 0, 0);
        uint64_t v32 = a13;
        BOOL v33 = v35 == 0;
      }
      else
      {
        BOOL v33 = 0;
      }
      unint64_t v36 = (unint64_t)v84 + v32;
      if ((a11 == 36248 || a11 == 6407) && a12 != 33635 && a12 != 35902 && a12 != 35899
        || *((_DWORD *)this + 19) != 1
        || (*((_DWORD *)&glrTextureFormats + 10 * *((unsigned int *)this + 16) + 9) & 0x81) != 1
        || v119[1] % (unint64_t)v119[0]
        || (v36 % v119[0]) | a8 & 1
        || v82 * v83 > 0x100000)
      {
        BOOL v33 = 0;
      }
      long long v76 = (void *)v36;
      unsigned int v78 = a4;
      uint64_t v117 = 0;
      long long v115 = 0u;
      long long v116 = 0u;
      long long v114 = 0u;
      MTLPixelFormatGetInfo();
      if (a15) {
        BOOL v37 = v33;
      }
      else {
        BOOL v37 = 0;
      }
      long long v77 = *(void **)(GLDTextureRec::getTextureResource(this, 0) + 32);
      if (a15) {
        GLDBufferRec::load(a15);
      }
      unsigned int v38 = (void *)a5;
      uint64_t v39 = a7;
      unint64_t v40 = a8;
      if (v37)
      {
        GLDObject::retain((uint64_t)this);
        uint64_t MemoryPlugin = GLDBufferRec::getMemoryPlugin(a15);
        (*(void (**)(uint64_t))(*(void *)MemoryPlugin + 16))(MemoryPlugin);
        blocuint64_t k = MEMORY[0x263EF8330];
        uint64_t v94 = 3221225472;
        unsigned int v95 = ___ZN13GLDContextRec17modifyTexSubImageEP13GLDTextureReciiiiiiiijjPKviP12GLDBufferRecj_block_invoke;
        float v96 = &unk_2650D2950;
        unsigned int v99 = this;
        uint64_t v100 = MemoryPlugin;
        v101 = v76;
        v102 = v31;
        uint64_t v97 = v77;
        uint64_t v98 = (void *)a1;
        uint64_t v103 = v82;
        uint64_t v104 = a5;
        uint64_t v105 = a6;
        uint64_t v106 = v39;
        unint64_t v107 = v40;
        unint64_t v108 = (int)a9;
        unsigned int v112 = v78;
        int v113 = v119[1];
        unint64_t v109 = v81;
        unint64_t v110 = v83;
        unint64_t v111 = v83;
        GLDContextRec::dispatchImageQueueBlockAsync((id *)a1, (NSObject **)this, (uint64_t)a15, &block);
        if (v79) {
          GLDContextRec::generateMipmapsWithCPUAsync((id *)a1, this, v80);
        }
      }
      else
      {
        uint64_t v74 = a6;
        uint64_t v75 = v39;
        if (v33)
        {
          uint64_t v72 = a5;
          GLDContextRec::flushRenderPassIfNeeded((GLDContextRec *)a1);
          int v42 = *(void **)(a1 + 40);
          if (!v42)
          {
            GLDContextRec::getCommandBuffer((GLDContextRec *)a1);
            int v42 = *(void **)(a1 + 40);
          }
          uint64_t v43 = (void *)[v42 blitCommandEncoder];
          uint64_t v44 = (void *)MEMORY[0x263F12C98];
          [v43 setLabel:*MEMORY[0x263F12C98]];
          unint64_t v92 = 0;
          BOOL v71 = v43;
          if (a15)
          {
            uint64_t v45 = *((void *)a15 + 5);
            unsigned int v46 = v78;
            if (v45 && (uint64_t v47 = *(void *)(v45 + 24)) != 0)
            {
              uint64_t v48 = a8;
              uint64_t v49 = (int)a9;
              PixelBuffer = *(void **)(v47 + 40);
            }
            else
            {
              uint64_t v48 = a8;
              uint64_t v49 = (int)a9;
              PixelBuffer = 0;
            }
            uint64_t v55 = v82;
          }
          else
          {
            uint64_t v48 = a8;
            uint64_t v49 = (int)a9;
            uint64_t v55 = v82;
            PixelBuffer = GLDContextRec::getPixelBuffer((void **)a1, v76, v82 * v83 * v81, &v92);
            unsigned int v46 = v78;
            if (!PixelBuffer)
            {
              int v56 = (void *)[*(id *)(*(void *)(a1 + 96) + 24) newBufferWithBytes:v76 length:v82 * v83 * v81 options:0];
              [v56 setLabel:*v44];
              unint64_t v57 = *(void **)(a1 + 40);
              blocuint64_t k = MEMORY[0x263EF8330];
              uint64_t v94 = 3221225472;
              unsigned int v95 = ___ZN13GLDContextRec17modifyTexSubImageEP13GLDTextureReciiiiiiiijjPKviP12GLDBufferRecj_block_invoke_2;
              float v96 = &unk_2650D2978;
              uint64_t v97 = v56;
              [v57 addCompletedHandler:&block];
              unsigned int v46 = v78;
              PixelBuffer = v56;
            }
          }
          unint64_t v58 = v83;
          int v59 = v71;
          if (v31 < (GLDTextureRec *)((char *)v31 + v55))
          {
            uint64_t v86 = (int)v46;
            uint64_t v87 = v48;
            unint64_t v60 = v92;
            uint64_t v88 = v49;
            do
            {
              v89 = v31;
              v90[0] = v72;
              v91[0] = v48;
              v91[1] = v49;
              v91[2] = v81;
              v90[1] = v74;
              v90[2] = v75;
              int v70 = v31;
              long long v61 = v59;
              long long v62 = PixelBuffer;
              unint64_t v63 = v58;
              [v59 copyFromBuffer:PixelBuffer sourceOffset:v60 sourceBytesPerRow:v119[1] sourceBytesPerImage:v58 sourceSize:v91 toTexture:v77 destinationSlice:v70 destinationLevel:v86 destinationOrigin:v90];
              int v59 = v61;
              unint64_t v58 = v63;
              uint64_t v48 = v87;
              PixelBuffer = v62;
              uint64_t v49 = v88;
              unint64_t v60 = v92 + v83;
              v92 += v83;
              unsigned int v31 = (GLDTextureRec *)((char *)v89 + 1);
              --v55;
            }
            while (v55);
          }
          [v59 endEncoding];
          GLDContextRec::dispatchImageQueueEvent((GLDContextRec *)a1, this);
          uint64_t v64 = *(void *)(a1 + 64);
          uint64_t v65 = GLDTextureRec::getTextureResource(this, 0);
          GLRResourceList::addResource(v64, v65);
          int v66 = v80;
          char v67 = v79;
          if (a15)
          {
            uint64_t v68 = *((void *)a15 + 5);
            if (v68) {
              uint64_t v69 = *(void *)(v68 + 24);
            }
            else {
              uint64_t v69 = 0;
            }
            GLRResourceList::addResource(*(void *)(a1 + 64), v69);
          }
        }
        else
        {
          if ((*(unsigned char *)(v85 + 24) & 4) != 0)
          {
            uint64_t v51 = (GLRResource *)GLDTextureRec::getTextureResource(this, 0);
            GLDContextRec::finishResource((id *)a1, v51);
            unsigned int v38 = (void *)a5;
          }
          if (a15)
          {
            uint64_t v52 = *((void *)a15 + 5);
            if (v52)
            {
              float v53 = *(GLRResource **)(v52 + 24);
              if (v53)
              {
                long long v73 = v38;
                GLDContextRec::finishResource((id *)a1, v53);
                unsigned int v38 = v73;
              }
            }
          }
          blocuint64_t k = MEMORY[0x263EF8330];
          uint64_t v94 = 3221225472;
          unsigned int v95 = ___ZN13GLDContextRec17modifyTexSubImageEP13GLDTextureReciiiiiiiijjPKviP12GLDBufferRecj_block_invoke_3;
          float v96 = &unk_2650D29A0;
          unsigned int v99 = v31;
          uint64_t v100 = v82;
          uint64_t v97 = v77;
          uint64_t v98 = v76;
          v101 = v38;
          v102 = (GLDTextureRec *)a6;
          uint64_t v103 = v39;
          uint64_t v104 = a8;
          uint64_t v105 = (int)a9;
          uint64_t v106 = v81;
          unint64_t v109 = __PAIR64__(v119[1], v78);
          unint64_t v107 = v83;
          unint64_t v108 = v83;
          __int32 v54 = *((void *)this + 17);
          if (v54) {
            dispatch_sync(v54, &block);
          }
          else {
            ___ZN13GLDContextRec17modifyTexSubImageEP13GLDTextureReciiiiiiiijjPKviP12GLDBufferRecj_block_invoke_3(&block);
          }
          int v66 = v80;
          char v67 = v79;
        }
        if (v67) {
          GLDContextRec::generateTexMipmapsWithBlit((GLDContextRec *)a1, this, v66);
        }
      }
      *(_DWORD *)(a1 + 5052) |= 4u;
      return 1;
    }
  }
  else
  {
    uint64_t result = 0;
    *(_DWORD *)(a1 + 5052) |= 2u;
  }
  return result;
}

uint64_t gldCopyTextureData()
{
  return 0;
}

BOOL gldGenerateTexMipmaps(GLDContextRec *a1, GLDTextureRec *this, int a3)
{
  unsigned int v3 = *(unsigned __int16 *)(*((void *)this + 6) + 214);
  if (((v3 ^ (v3 >> 4)) & 0xF) == 0) {
    return 1;
  }
  BOOL result = GLDTextureRec::load(this);
  if (result)
  {
    if ((*((unsigned char *)&glrTextureFormats + 40 * *((unsigned int *)this + 16) + 36) & 0x40) != 0)
    {
      unint64_t v10 = 0x268C8E000uLL;
      {
        unint64_t v10 = 0x268C8E000;
        if (v13)
        {
          GLDContextRec::generateTexMipmaps(GLDTextureRec *,int,unsigned int)::forceGpuMipmapGenEV = getenv("GLMTL_FORCE_GPU_MIPMAP_GEN");
          unint64_t v10 = 0x268C8E000;
        }
      }
      uint64_t v11 = *(unsigned char **)(v10 + 3008);
      if (v11 && *v11 == 49 || !GLDTextureRec::canGenerateMipmapsWithCPU(this, v8))
      {
        GLDContextRec::generateTexMipmapsWithBlit(a1, this, a3);
      }
      else
      {
        uint64_t TextureResource = (GLRResource *)GLDTextureRec::getTextureResource(this, 0);
        if (GLDContextRec::testResource((id *)a1, TextureResource, 0, 0)) {
          GLDTextureRec::generateMipmapsWithCPU((uint64_t)this, a3);
        }
        else {
          GLDContextRec::generateMipmapsWithCPUAsync((id *)a1, this, a3);
        }
      }
      BOOL result = 1;
      int v9 = 0x10000000;
      goto LABEL_15;
    }
    BOOL result = 0;
  }
  int v9 = 0x8000000;
LABEL_15:
  *(_DWORD *)(*((void *)a1 + 11) + 32) |= v9;
  *((void *)a1 + 53) |= 0x100000uLL;
  return result;
}

uint64_t gldIsTextureResident()
{
  return 1;
}

atomic_uint *___ZN13GLDContextRec17modifyTexSubImageEP13GLDTextureReciiiiiiiijjPKviP12GLDBufferRecj_block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t TextureResource = GLDTextureRec::getTextureResource(*(GLDTextureRec **)(a1 + 48), 0);
  (*(void (**)(uint64_t, void))(*(void *)TextureResource + 40))(TextureResource, *(void *)(v2 + 88));
  (*(void (**)(void, void))(**(void **)(*(void *)(a1 + 56) + 24) + 40))(*(void *)(*(void *)(a1 + 56) + 24), *(void *)(v2 + 88));
  unint64_t v4 = *(void *)(a1 + 72);
  if (v4 < *(void *)(a1 + 80) + v4)
  {
    uint64_t v5 = *(void *)(a1 + 64);
    do
    {
      uint64_t v6 = *(void **)(a1 + 32);
      long long v7 = *(_OWORD *)(a1 + 104);
      v9[0] = *(_OWORD *)(a1 + 88);
      v9[1] = v7;
      v9[2] = *(_OWORD *)(a1 + 120);
      [v6 replaceRegion:v9 mipmapLevel:*(int *)(a1 + 152) slice:v4 withBytes:v5 bytesPerRow:*(int *)(a1 + 156) bytesPerImage:*(void *)(a1 + 136)];
      v5 += *(void *)(a1 + 144);
      ++v4;
    }
    while (v4 < *(void *)(a1 + 80) + *(void *)(a1 + 72));
  }
  (*(void (**)(void))(**(void **)(a1 + 56) + 24))(*(void *)(a1 + 56));
  return GLDObject::release(*(atomic_uint **)(a1 + 48));
}

void ___ZN13GLDContextRec17modifyTexSubImageEP13GLDTextureReciiiiiiiijjPKviP12GLDBufferRecj_block_invoke_2(uint64_t a1)
{
}

void *___ZN13GLDContextRec17modifyTexSubImageEP13GLDTextureReciiiiiiiijjPKviP12GLDBufferRecj_block_invoke_3(void *result)
{
  unint64_t v1 = result[6];
  if (v1 < result[7] + v1)
  {
    uint64_t v2 = result;
    uint64_t v3 = result[5];
    unint64_t v4 = result + 8;
    do
    {
      uint64_t v5 = (void *)v2[4];
      long long v6 = v4[1];
      v7[0] = *v4;
      v7[1] = v6;
      v7[2] = v4[2];
      BOOL result = (void *)[v5 replaceRegion:v7 mipmapLevel:*((int *)v2 + 32) slice:v1 withBytes:v3 bytesPerRow:*((int *)v2 + 33) bytesPerImage:v2[14]];
      v3 += v2[15];
      ++v1;
    }
    while (v1 < v2[7] + v2[6]);
  }
  return result;
}

unsigned char *GLDContextRec::bindVertexArray(GLDContextRec *this, GLDVertexArrayRec *a2)
{
  if (a2)
  {
    uint64_t v3 = *((void *)a2 + 6);
    unint64_t v4 = *(void *)(v3 + 768);
    int v5 = *((_DWORD *)this + 667);
    unsigned int v6 = 0;
    if (v4)
    {
      uint64_t v7 = *((void *)a2 + 7);
      do
      {
        uint64_t v8 = __clz(__rbit64(v4)) - 16;
        int v9 = *(unsigned char **)(*(void *)(*(void *)(v7 + 8 * v8) + 40) + 24);
        if (v9[32])
        {
          if (*((_DWORD *)this + 1151)) {
            GLDContextRec::beginRenderPass(this);
          }
          if (*((void *)this + 2)) {
            GLDContextRec::endRenderPass(this);
          }
        }
        unint64_t v10 = (char *)this + 8 * v6;
        uint64_t v11 = (unsigned char *)*((void *)v10 + 334);
        if (v9 != v11)
        {
          if (v11) {
            (*(void (**)(unsigned char *))(*(void *)v11 + 24))(v11);
          }
          v5 |= 1 << v6;
          *((void *)v10 + 334) = v9;
          (*(void (**)(unsigned char *))(*(void *)v9 + 16))(v9);
        }
        *((_DWORD *)this + v6 + 700) = *(_DWORD *)(v3 + 24 * v8) & 0xFFFFFFFC;
        *((unsigned char *)this + v8 + 336) = v6++;
        v4 ^= 0x10000 << v8;
      }
      while (v4);
    }
    *((_DWORD *)this + 667) = v5;
    if (*((unsigned char *)a2 + 64))
    {
      uint64_t v12 = *(void *)(*(void *)(*((void *)a2 + 7) + 256) + 40);
      if (v12) {
        int v13 = *(unsigned char **)(v12 + 24);
      }
      else {
        int v13 = 0;
      }
      if (v13[32])
      {
        if (*((_DWORD *)this + 1151)) {
          GLDContextRec::beginRenderPass(this);
        }
        if (*((void *)this + 2)) {
          GLDContextRec::endRenderPass(this);
        }
      }
    }
    else
    {
      int v13 = 0;
    }
  }
  else
  {
    int v13 = 0;
    unsigned int v6 = 0;
  }
  BOOL result = (unsigned char *)*((void *)this + 358);
  if (v13 != result)
  {
    if (result) {
      BOOL result = (unsigned char *)(*(uint64_t (**)(unsigned char *))(*(void *)result + 24))(result);
    }
    *((void *)this + 358) = v13;
    if (v13) {
      BOOL result = (unsigned char *)(*(uint64_t (**)(unsigned char *))(*(void *)v13 + 16))(v13);
    }
  }
  *((_DWORD *)this + 666) = v6;
  if (v6 <= 0xF)
  {
    uint64_t v15 = v6;
    uint64_t v16 = (char *)this + 2672;
    do
    {
      BOOL result = *(unsigned char **)&v16[8 * v15];
      if (result)
      {
        BOOL result = (unsigned char *)(*(uint64_t (**)(unsigned char *))(*(void *)result + 24))(result);
        *(void *)&v16[8 * v15] = 0;
      }
      ++v15;
    }
    while (v15 != 16);
  }
  *((_DWORD *)this + 618) |= 0x800u;
  return result;
}

uint64_t GLDContextRec::loadCurrentVertexArray(uint64_t this, unsigned int *a2)
{
  uint64_t v2 = this;
  uint64_t v3 = *(void *)(this + 112);
  uint64_t v4 = *(void *)(v3 + 368);
  if ((a2[3] & 1) != 0 && (this = *(void *)(v3 + 976)) != 0)
  {
    this = GLDBufferRec::load((GLDBufferRec *)this);
    if (this) {
      BOOL v5 = v4 == 0;
    }
    else {
      BOOL v5 = 1;
    }
    if (v5) {
      goto LABEL_30;
    }
  }
  else if (!v4)
  {
    goto LABEL_30;
  }
  uint64_t v7 = *(void *)(v4 + 48);
  uint64_t v6 = *(void *)(v4 + 56);
  unint64_t v8 = *(void *)(v6 + 272);
  int v9 = *(_DWORD *)(v2 + 368);
  int v10 = *(_DWORD *)(v4 + 12);
  if (v8)
  {
    uint64_t v11 = *(void *)(v2 + 88);
    int v12 = *(_DWORD *)(v11 + 12) + 1;
    *(_DWORD *)(v11 + 12) = v12;
    *(_DWORD *)(v4 + 12) = v12;
    this = GLDVertexArrayRec::updateSharedState((GLDVertexArrayRec *)v4, v8);
  }
  *(_DWORD *)(v2 + 368) = *(_DWORD *)(v4 + 12);
  if (v9 != v10 || v8 != 0) {
    *(_DWORD *)(v2 + 2472) |= 0x809u;
  }
  uint64_t v14 = *(void *)(v7 + 768);
  if (v14)
  {
    if ((v14 & ~*(void *)(v7 + 776)) == 0)
    {
      uint64_t v15 = *(void *)(v6 + 264);
      if (v15 != 128)
      {
        int v16 = *(_DWORD *)(v4 + 16);
        if (*(_DWORD *)(v2 + 372) == v16) {
          uint64_t v17 = *(void *)(v6 + 264);
        }
        else {
          uint64_t v17 = -1;
        }
        if (!v15) {
          goto LABEL_28;
        }
        uint64_t v18 = (void *)(v6 + 264);
        uint64_t v19 = *(void *)(v2 + 88);
        int v20 = *(_DWORD *)(v19 + 16) + 1;
        *(_DWORD *)(v19 + 16) = v20;
        uint64_t v21 = *(void *)(v4 + 24);
        *(_DWORD *)(v4 + 16) = v20;
        uint64_t v22 = v21 | v15;
        uint64_t v23 = *(void *)(v4 + 32) | v8;
        if (((v21 | v15) & 0x10) == 0
          || (this = GLDVertexArrayRec::updateBuffers((GLDVertexArrayRec *)v4, v22), this))
        {
          this = GLDVertexArrayRec::updateVertexArrayBuffers((GLDVertexArrayRec *)v4, v22, v23);
          if (this)
          {
            v17 |= v21;
            *(void *)(v4 + 24) = 0;
            *(void *)(v4 + 32) = 0;
            *uint64_t v18 = 0;
            v18[1] = 0;
            int v16 = *(_DWORD *)(v4 + 16);
LABEL_28:
            *(_DWORD *)(v2 + 372) = v16;
            goto LABEL_33;
          }
        }
        *(void *)(v4 + 24) = v22;
        *(void *)(v4 + 32) = v23;
        *(_OWORD *)uint64_t v18 = xmmword_2406F5970;
      }
    }
  }
LABEL_30:
  uint64_t v4 = 0;
  *(_DWORD *)(v2 + 372) = 0;
  if (*(void *)(v2 + 392)) {
    uint64_t v17 = -1;
  }
  else {
    uint64_t v17 = 0;
  }
LABEL_33:
  if (v17) {
    this = (uint64_t)GLDContextRec::bindVertexArray((GLDContextRec *)v2, (GLDVertexArrayRec *)v4);
  }
  *(void *)(v2 + 392) = v4;
  return this;
}

GLDContextRec *gldUnbindVertexArray(GLDContextRec *result, uint64_t a2)
{
  if (*((void *)result + 49) == a2)
  {
    uint64_t v2 = result;
    BOOL result = (GLDContextRec *)GLDContextRec::bindVertexArray(result, 0);
    *((void *)v2 + 49) = 0;
    *((_DWORD *)v2 + 93) = 0;
  }
  return result;
}

uint64_t GLDContextRec::buildVertexArrayDescriptor(uint64_t this, GLDPipelineProgramRec *a2, GLDVertexArrayRec *a3)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(unsigned int **)(*((void *)a2 + 3) + 56);
  uint64_t v4 = *v3;
  *(void *)(this + 1920) = 0;
  *(_OWORD *)(this + 1904) = 0u;
  *(_OWORD *)(this + 1888) = 0u;
  *(_OWORD *)(this + 1872) = 0u;
  *(_OWORD *)(this + 1856) = 0u;
  if (v4)
  {
    uint64_t v29 = this + 1856;
    BOOL v5 = v3 + 3;
    uint64_t v6 = v33;
    uint64_t v7 = v4;
    do
    {
      int v8 = (*((_DWORD *)v5 - 1) >> 8) & 0x1F;
      if (v8 == 17)
      {
        char v9 = 45;
      }
      else if (v8 == 18)
      {
        char v9 = 47;
      }
      else
      {
        if (v8 != 28) {
          MTLReleaseAssertionFailure();
        }
        char v9 = *v5 & 0x3F;
      }
      v5 += 8;
      *v6++ = v9;
      --v7;
    }
    while (v7);
    unsigned int v10 = 0;
    uint64_t v27 = this;
    uint64_t v28 = 0;
    uint64_t v11 = v3 + 2;
    int v12 = v33;
    while (1)
    {
      unsigned int v14 = *v12++;
      unsigned int v13 = v14;
      if ((v14 | 2) != 0x2F)
      {
        uint64_t v15 = *((void *)a3 + 6);
        if (((*(void *)(v15 + 768) >> v13) & 0x10000) != 0)
        {
          unsigned int v31 = v7;
          uint64_t v16 = v15 + 24 * v13;
          MTLVertexFormat v17 = glrConvertVertexElementType(*(unsigned __int16 *)(v16 + 20), *(char *)(v16 + 22));
          unsigned int v18 = *(_DWORD *)(v16 + 8);
          if (v18 <= 1) {
            __int16 v19 = 1;
          }
          else {
            __int16 v19 = *(_DWORD *)(v16 + 8);
          }
          int v20 = *(_DWORD *)(v16 + 16);
          if (!v20)
          {
            *(_WORD *)uint64_t v32 = 0;
            LOWORD(v20) = glrVertexFormatComponentAttribSizeTypeAlignment(v17, &v32[1], v32);
          }
          __int16 v21 = 4 - (v20 & 3);
          if ((v20 & 3) == 0) {
            __int16 v21 = 0;
          }
          __int16 v22 = v21 + v20;
          if (v18) {
            int v23 = 2;
          }
          else {
            int v23 = 1;
          }
          *(_DWORD *)(v29 + 4 * v10) = (4 * (v17 & 0x3F)) | v23 | ((v19 & 0x3FF) << 20) | (*(_DWORD *)(v15 + 24 * v13) << 30) | ((v22 & 0xFFF) << 8);
          this = v27;
          *(unsigned char *)(v27 + v31 + 320) = v13;
          LODWORD(v7) = v31 + 1;
        }
        else
        {
          int v24 = (*v11 >> 3) & 7;
          if (v24)
          {
            if (v24 == 2)
            {
              int v25 = 140;
            }
            else
            {
              if (v24 != 3)
              {
                int v26 = (GLDContextRec *)MTLReleaseAssertionFailure();
                return GLDContextRec::buildPrimitiveBufferVertexArrayDescriptor(v26);
              }
              int v25 = 156;
            }
          }
          else
          {
            int v25 = 124;
          }
          *(_DWORD *)(v29 + 4 * v10) = v25 & 0xC00FFFFF | ((v28 & 0x3FF) << 20) | *(_DWORD *)(v29 + 4 * v10) & 0xC0000000 | 3;
          *(unsigned char *)(this + HIDWORD(v28) + 280) = v13;
          LODWORD(v28) = v28 + 16;
          ++HIDWORD(v28);
        }
        ++v10;
      }
      v11 += 2;
      if (!--v4) {
        goto LABEL_35;
      }
    }
  }
  HIDWORD(v28) = 0;
  LODWORD(v7) = 0;
LABEL_35:
  *(_DWORD *)(this + 316) = v7;
  *(_DWORD *)(this + 2472) |= 0x800u;
  *(_DWORD *)(this + 2484) |= 1u;
  *(_DWORD *)(this + 2668) = -1;
  *(_DWORD *)(this + 276) = HIDWORD(v28);
  return this;
}

void GLDContextRec::buildPrimitiveBufferVertexArrayDescriptor(GLDContextRec *this)
{
  uint64_t v83 = *MEMORY[0x263EF8340];
  uint64_t v71 = *(void *)(*((void *)this + 14) + 368);
  unint64_t v1 = *(unsigned int **)(*(void *)(*((void *)this + 183) + 24) + 56);
  uint64_t v2 = *v1;
  *((_OWORD *)this + 124) = 0u;
  *((_OWORD *)this + 125) = 0u;
  *((_OWORD *)this + 126) = 0u;
  *((_OWORD *)this + 127) = 0u;
  *((void *)this + 256) = 0;
  if (v2)
  {
    unsigned int v3 = 0;
    char v4 = 0;
    char v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = v1 + 3;
    do
    {
      unsigned int v8 = *(v7 - 1);
      int v9 = (v8 >> 8) & 0x1F;
      if (v9 == 17)
      {
        char v5 = 1;
      }
      else if (v9 == 18)
      {
        char v4 = 1;
      }
      else
      {
        if (v9 != 28) {
          MTLReleaseAssertionFailure();
        }
        char v10 = *v7;
        v82[v3] = v10 & 0x3F;
        v81[v3] = v8 >> 6;
        v6 |= 1 << ((v10 & 0x3Fu) + 16);
        ++v3;
      }
      v7 += 2;
      --v2;
    }
    while (v2);
    if (v5)
    {
      v82[v3] = 45;
      v81[v3] = 0;
      v6 |= 0x2000000000000000uLL;
      ++v3;
    }
    if (v4)
    {
      v82[v3] = 47;
      v81[v3] = 0;
      v6 |= 0x8000000000000000;
      ++v3;
    }
  }
  else
  {
    v82[0] = 45;
    v81[0] = 0;
    unsigned int v3 = 1;
    uint64_t v6 = 0x2000000000000000;
  }
  if ((*((_DWORD *)this + 94) & 1) == 0) {
    v6 &= ~0x400000uLL;
  }
  uint64_t v70 = v6;
  unsigned __int8 v73 = 0;
  if (!v3)
  {
    unsigned int v57 = 0;
    goto LABEL_67;
  }
  unsigned int v69 = 0;
  int v11 = 0;
  unsigned int v67 = 0;
  unsigned int v12 = 0;
  uint64_t v72 = this;
  unsigned int v13 = (unsigned int *)((char *)this + 1984);
  uint64_t v14 = v3;
  uint64_t v15 = v1 + 2;
  uint64_t v16 = v81;
  MTLVertexFormat v17 = v82;
  unsigned int v18 = v77;
  __int16 v19 = v74;
  int v20 = v76;
  uint64_t v65 = v3;
  do
  {
    unsigned int v22 = *v17++;
    unsigned int v21 = v22;
    if (v22 == 47)
    {
      *unsigned int v18 = 44;
      unsigned char *v19 = 0;
      v75[v11] = v12;
      *int v20 = v12;
      v80[v11] = 47;
      v79[v11] = *v16;
      int v23 = &v78[v11];
      MTLVertexFormat v24 = MTLVertexFormatInt1010102Normalized|MTLVertexFormatChar2;
      goto LABEL_23;
    }
    if (v21 == 45)
    {
      *unsigned int v18 = 43;
      unsigned char *v19 = 0;
      v75[v11] = v12;
      *int v20 = v12;
      v80[v11] = 45;
      v79[v11] = *v16;
      int v23 = &v78[v11];
      MTLVertexFormat v24 = MTLVertexFormatUChar4Normalized_BGRA|MTLVertexFormatUChar2;
LABEL_23:
      unsigned int v25 = v12;
      int v26 = v11;
      uint64_t v27 = v17;
      int v28 = glrVertexFormatComponentAttribSizeTypeAlignment(v24, v23, &v73);
      MTLVertexFormat v17 = v27;
      unsigned int v12 = v25 + v28;
LABEL_28:
      int v11 = v26 + 1;
      goto LABEL_29;
    }
    if (*(_WORD *)(*((void *)v72 + 13) + 4))
    {
      *unsigned int v18 = 31;
      unsigned char *v19 = 0;
      v75[v11] = v12;
      *int v20 = v12;
      v80[v11] = v21;
      v79[v11] = *v16;
      uint64_t v29 = &v78[v11];
      unsigned int v30 = v12;
      int v26 = v11;
      unsigned int v31 = v17;
      int v32 = glrVertexFormatComponentAttribSizeTypeAlignment(MTLVertexFormatFloat4, v29, &v73);
      MTLVertexFormat v17 = v31;
      int v33 = 4 - (v32 & 3);
      if ((v32 & 3) == 0) {
        int v33 = 0;
      }
      unsigned int v12 = v30 + v32 + v33;
      goto LABEL_28;
    }
    uint64_t v34 = *(void *)(v71 + 48);
    if (((0x10000 << v21) & v70 & *(void *)(v34 + 768)) != 0)
    {
      uint64_t v68 = v17;
      int v35 = *(unsigned __int8 *)(v34 + 24 * v21 + 22);
      if (v35 == 5)
      {
        char v36 = *v16;
      }
      else
      {
        unsigned int v66 = v12;
        int v40 = *(unsigned __int16 *)(v34 + 24 * v21 + 20);
        if (v40 == 5132) {
          int v40 = 5126;
        }
        if (v21 == 7) {
          int v41 = 5125;
        }
        else {
          int v41 = v40;
        }
        if ((v35 - 1) >= *v16) {
          char v36 = *v16;
        }
        else {
          char v36 = v35 - 1;
        }
        *uint64_t v16 = v36;
        __int16 v64 = v41;
        MTLVertexFormat v37 = glrConvertVertexElementType(v41, (char)(v36 + 1));
        if (v37)
        {
          unsigned int v12 = v66;
          goto LABEL_57;
        }
        char v36 = 3;
        *uint64_t v16 = 3;
        unsigned int v12 = v66;
        if ((v64 & 0x4000) != 0)
        {
          if ((unsigned __int16)((v64 & 0x9FFF) - 5120) >= 6u) {
            goto LABEL_73;
          }
          MTLVertexFormat v37 = qword_2406F5980[(__int16)((v64 & 0x9FFF) - 5120)];
          goto LABEL_57;
        }
      }
      MTLVertexFormat v37 = MTLVertexFormatFloat4;
LABEL_57:
      v75[v11] = v12;
      *unsigned int v18 = v37;
      unsigned char *v19 = 0;
      *int v20 = v12;
      v80[v11] = v21;
      v79[v11] = v36;
      unsigned int v42 = v12;
      int v43 = glrVertexFormatComponentAttribSizeTypeAlignment(v37, &v78[v11], &v73);
      int v44 = 4 - (v43 & 3);
      if ((v43 & 3) == 0) {
        int v44 = 0;
      }
      unsigned int v12 = v42 + v43 + v44;
      ++v11;
      MTLVertexFormat v17 = v68;
      goto LABEL_29;
    }
    int v38 = (*v15 >> 3) & 7;
    if (v38)
    {
      if (v38 == 2)
      {
        uint64_t v39 = 35;
      }
      else
      {
        if (v38 != 3)
        {
          MTLReleaseAssertionFailure();
LABEL_73:
          unint64_t v63 = (GLDTransformFeedbackMachine *)MTLReleaseAssertionFailure();
          GLDTransformFeedbackMachine::GLDTransformFeedbackMachine(v63);
          return;
        }
        uint64_t v39 = 39;
      }
    }
    else
    {
      uint64_t v39 = 31;
    }
    if (v21 == 7) {
      uint64_t v39 = 39;
    }
    *unsigned int v18 = v39;
    *int v20 = v67;
    unsigned char *v19 = 1;
    *((unsigned char *)v72 + v69 + 300) = v21;
    v67 += 16;
    ++v69;
LABEL_29:
    ++v16;
    ++v18;
    ++v19;
    ++v20;
    v15 += 2;
    --v14;
  }
  while (v14);
  uint64_t v45 = v74;
  unsigned int v46 = (int *)v77;
  uint64_t v47 = (int *)v76;
  uint64_t v48 = v65;
  do
  {
    int v50 = *v45++;
    int v49 = v50;
    int v52 = *v46;
    v46 += 2;
    char v51 = v52;
    int v54 = *v47;
    v47 += 2;
    __int16 v53 = v54;
    int v55 = 4 * (v51 & 0x3F);
    if (v49) {
      int v56 = 0;
    }
    else {
      int v56 = (v12 & 0xFFF) << 8;
    }
    *unsigned int v13 = v55 & 0xC00FFFFF | *v13 & 0xC0000000 | v56 & 0xC00FFFFF | ((v53 & 0x3FF) << 20) | 3;
    ++v13;
    --v48;
  }
  while (v48);
  this = v72;
  unsigned int v57 = v69;
  if (!v11)
  {
LABEL_67:
    v80[0] = 16;
    v79[0] = 0;
    v78[0] = 0;
    v75[0] = 0;
    int v11 = 1;
    unsigned int v12 = 4;
  }
  uint64_t v58 = 0;
  unsigned __int8 v59 = 0;
  unint64_t v60 = (int *)((char *)this + 144);
  do
  {
    char v61 = v79[v58];
    int v62 = ((v78[v58] & 7) << 8) | (v75[v58] >> 2) | ((v80[v58] & 0x3F) << 14) | ((v61 & 7) << 11);
    v60[17] = ((v80[v58] & 0x3F) << 14) | ((v61 & 7) << 11) | v59;
    *v60++ = v62;
    v59 += v61 + 1;
    ++v58;
  }
  while (v11 != v58);
  *((void *)this + 257) = v12;
  *((_DWORD *)this + 74) = v57;
  *((unsigned char *)this + 208) = v11;
  *((unsigned char *)this + 210) = v59;
  *((unsigned char *)this + 140) = v11;
  *((unsigned char *)this + 142) = v12 >> 2;
}

void GLDTransformFeedbackMachine::GLDTransformFeedbackMachine(GLDTransformFeedbackMachine *this)
{
  *((void *)this + 1) = 0;
  *((void *)this + 2) = 0;
}

uint64_t GLDTransformFeedbackMachine::beginQuery(GLDTransformFeedbackMachine *this, GLDQueryRec *a2)
{
  *((void *)this + 2) = a2;
  return GLDQueryRec::setCounter(a2, 0);
}

uint64_t GLDTransformFeedbackMachine::incrementPrimitiveCount(uint64_t this, GLDContextRec *a2, unsigned int a3, int a4, int a5)
{
  if (a4)
  {
    if (a4 == 4)
    {
      a3 /= 3u;
    }
    else
    {
      if (a4 != 1)
      {
        uint64_t v7 = (GLDContextRec *)MTLReleaseAssertionFailure();
        return GLDContextRec::setTranformFeedbackBuffers(v7);
      }
      a3 >>= 1;
    }
  }
  char v5 = *(GLDQueryRec **)(this + 16);
  *(void *)(*(void *)(this + 8) + 24) = a3 * a5 + *(_DWORD *)(*(void *)(this + 8) + 24);
  if (v5)
  {
    uint64_t v6 = GLDQueryRec::getCounter(v5) + a3 * a5;
    return GLDQueryRec::setCounter(v5, v6);
  }
  return this;
}

uint64_t GLDContextRec::setTranformFeedbackBuffers(uint64_t this)
{
  uint64_t v1 = this;
  for (uint64_t i = 0; i != 4; ++i)
  {
    uint64_t v3 = v1 + 8 * i;
    uint64_t v4 = *(void *)(v3 + 3064);
    if (v4)
    {
      uint64_t v5 = *(void *)(v3 + 3288);
      uint64_t v6 = *(void *)(v4 + 40);
      GLRResourceList::addResource(*(void *)(v1 + 64), v4);
      this = (*(uint64_t (**)(void, void, uint64_t, uint64_t, uint64_t))(v1 + 3456))(*(void *)(v1 + 16), *(void *)(v1 + 3448), v6, v5, i + 32);
    }
  }
  return this;
}

uint64_t GLDContextRec::updateTransfromFeedbackState(GLDContextRec *this)
{
  uint64_t v3 = *((void *)this + 13);
  uint64_t v2 = *((void *)this + 14);
  uint64_t v4 = **(void **)(*(void *)(v2 + 408) + 24);
  *((void *)this + 420) = v4;
  if (*(__int16 *)(v3 + 15714) == -1)
  {
    if (*(unsigned char *)(v3 + 15713)) {
      *(void *)(v4 + 32) = 1;
    }
  }
  else
  {
    if (!*(void *)(v4 + 32)) {
      *(void *)(v4 + 24) = 0;
    }
    *(void *)(v4 + 32) = 0;
  }
  uint64_t v5 = 0;
  uint64_t v6 = v2 + 376;
  uint64_t v7 = v3 + 15720;
  do
  {
    uint64_t v8 = *(void *)(v7 + v5);
    if (*(unsigned char *)(*((void *)this + 13) + 15713)) {
      uint64_t v9 = 0;
    }
    else {
      uint64_t v9 = *(void *)(v6 + v5);
    }
    char v10 = (char *)this + v5;
    uint64_t result = *(void *)((char *)this + v5 + 3064);
    if (result)
    {
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 24))(result);
      *((void *)v10 + 383) = 0;
      *((void *)v10 + 411) = 0;
    }
    if (!v9)
    {
      uint64_t v8 = 0;
LABEL_21:
      *((void *)v10 + 383) = 0;
      goto LABEL_22;
    }
    int v12 = **(_DWORD **)(v9 + 32);
    if (v12)
    {
      uint64_t result = GLDBufferRec::update((GLDBufferRec *)v9, v12);
      if (result) {
        **(_DWORD **)(v9 + 32) = 0;
      }
    }
    uint64_t v13 = *(void *)(v9 + 40);
    if (!v13) {
      goto LABEL_21;
    }
    uint64_t result = *(void *)(v13 + 24);
    *((void *)v10 + 383) = result;
    if (result) {
      uint64_t result = (*(uint64_t (**)(uint64_t))(*(void *)result + 16))(result);
    }
LABEL_22:
    *(void *)((char *)this + v5 + 3288) = v8;
    v5 += 8;
  }
  while (v5 != 32);
  *((_DWORD *)this + 618) |= 0x10000u;
  return result;
}

uint64_t gldUpdateTransformFeedbackState(GLDContextRec *a1)
{
  return 0;
}

void GLDDeviceRec::getRenderPipelineStateFromKey(uint64_t a1, uint8_t *buf)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_2406DA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "GLDDevice failed to build pipeline state: %@", buf, 0xCu);
}

void GLDTextureRec::update(char a1, char a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v2 = "TEXTURE_GEOM_DIRTY_BIT";
  if ((a1 & 1) == 0) {
    uint64_t v2 = "";
  }
  uint64_t v3 = "TEXTURE_FORMAT_DIRTY_BIT";
  if (a2) {
    uint64_t v3 = "";
  }
  uint64_t v4 = "TEXTURE_DATA_DIRTY_BIT";
  if ((a1 & 4) == 0) {
    uint64_t v4 = "";
  }
  int v6 = 136315906;
  uint64_t v7 = v2;
  uint64_t v5 = "TEXTURE_BUFFER_DIRTY_BIT";
  __int16 v8 = 2080;
  uint64_t v9 = v3;
  __int16 v10 = 2080;
  int v11 = v4;
  if ((a1 & 8) == 0) {
    uint64_t v5 = "";
  }
  __int16 v12 = 2080;
  uint64_t v13 = v5;
  _os_log_fault_impl(&dword_2406DA000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Dirty Bits          : %s %s %s %s\n", (uint8_t *)&v6, 0x2Au);
}

void GLDTextureRec::update(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  if ((**(_WORD **)(a1 + 48) & 0x800) != 0) {
    uint64_t v1 = "YES";
  }
  else {
    uint64_t v1 = "NO";
  }
  int v2 = 136315138;
  uint64_t v3 = v1;
  _os_log_fault_impl(&dword_2406DA000, &_os_log_internal, OS_LOG_TYPE_FAULT, "IOSurface           : %s\n", (uint8_t *)&v2, 0xCu);
}

{
  int v1;
  _DWORD v2[2];
  uint64_t v3;

  uint64_t v3 = *MEMORY[0x263EF8340];
  uint64_t v1 = *(unsigned __int16 *)(*(void *)(a1 + 48) + 192);
  v2[0] = 67109120;
  v2[1] = v1;
  _os_log_fault_impl(&dword_2406DA000, &_os_log_internal, OS_LOG_TYPE_FAULT, "Invalid Pixel Format: 0x%08x\n", (uint8_t *)v2, 8u);
}

void GLDContextRec::flushContextInternal()
{
  *(_WORD *)int v0 = 0;
  _os_log_error_impl(&dword_2406DA000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Terminating due to blacklisting by kernel driver", v0, 2u);
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x270F0B6D8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x270EE45E8](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x270EE4600]();
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EE4610](bundle, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x270EE4968](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
}

size_t IOSurfaceGetAllocSize(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4C50](buffer);
}

size_t IOSurfaceGetBytesPerRowOfPlane(IOSurfaceRef buffer, size_t planeIndex)
{
  return MEMORY[0x270EF4CC0](buffer, planeIndex);
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  return MEMORY[0x270EF4D68](buffer);
}

id MTLCreateSystemDefaultDevice(void)
{
  return (id)MEMORY[0x270EF5E20]();
}

uint64_t MTLGetTextureLevelInfoForDeviceWithOptions()
{
  return MEMORY[0x270EF5EA0]();
}

uint64_t MTLPixelFormatGetInfo()
{
  return MEMORY[0x270EF5ED8]();
}

uint64_t MTLPixelFormatGetInfoForDevice()
{
  return MEMORY[0x270EF5EE0]();
}

uint64_t MTLReleaseAssertionFailure()
{
  return MEMORY[0x270EF5F50]();
}

uint64_t MTLTextureSwizzleKeyToChannels()
{
  return MEMORY[0x270EF5FA0]();
}

void NSLog(NSString *format, ...)
{
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x270F98F10](a1);
}

void __cxa_guard_release(__guard *a1)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _os_nospin_lock_lock()
{
  return MEMORY[0x270ED80C8]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x270ED80D8]();
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x270ED92D0](buffer, size, queue, destructor);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
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

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
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

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x270ED96D8]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x270ED9BE8](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x270ED9D00]();
}

uint64_t glgConvertType()
{
  return MEMORY[0x270EF9DA8]();
}

uint64_t glgCreateProcessor()
{
  return MEMORY[0x270EF9DB0]();
}

uint64_t glgDestroyProcessor()
{
  return MEMORY[0x270EF9DB8]();
}

uint64_t glgGetCompressedBlockHeight()
{
  return MEMORY[0x270EF9DC8]();
}

uint64_t glgProcessPixelsWithProcessor()
{
  return MEMORY[0x270EF9DE8]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x270EDA138]();
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

int malloc_type_posix_memalign(void **memptr, size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return MEMORY[0x270EDA398](memptr, alignment, size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
}

void memset_pattern16(void *__b, const void *__pattern16, size_t __len)
{
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int pthread_cond_broadcast(pthread_cond_t *a1)
{
  return MEMORY[0x270EDAE50](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x270EDAE88](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF60](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x270EDAF70](a1);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFC8](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x270EDAFD0](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFD8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF0](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x270EDAFF8](a1);
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

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x270EDB648](__dst, __src, __n);
}