@interface VFXREDrawCallContextImpl
- (BOOL)_isDepthOnly;
- (BOOL)_isDrawingBlur;
- (BOOL)constantOffsetAndSize:(int)a3 :(id)a4 :(int64_t *)a5 :(int64_t *)a6;
- (BOOL)depthOnly;
- (BOOL)enableBreakthrough;
- (BOOL)enableClipping;
- (BOOL)enableNearFieldVignetting;
- (BOOL)isDrawingDepthOnly;
- (BOOL)renderForBlur;
- (BOOL)useDitherFade;
- (MeshStats)_meshStats;
- (PatchHandler)_patchHandler;
- (StencilInfo)_stencilInfo;
- (TextureTableCollection)_textureTable;
- (VFXRERenderTargetInfo)renderTargetInfo;
- (VFXStencilInfo)stencilInfo;
- (const)_dynamicFunctionConstants;
- (const)_renderTargetInfo;
- (const)_viewports;
- (const)constantData:(int)a3;
- (float)_fadeOpacity;
- (id).cxx_construct;
- (id)buffer:(int)a3 :(id)a4 :(int64_t *)a5 :(int64_t *)a6;
- (id)sampler:(int)a3 :(id)a4;
- (id)texture:(int)a3 :(id)a4;
- (int)portalClippingMode;
- (int64_t)statsDrawcallCount;
- (int64_t)statsPrimitiveCount;
- (int64_t)statsVertexCount;
- (unsigned)_stateOverride;
- (void)_bufferTable;
- (void)_constantTable;
- (void)_samplerTable;
- (void)setLateLatchingPatchHandler:(id)a3;
- (void)setStatsDrawcallCount:(int64_t)a3;
- (void)setStatsPrimitiveCount:(int64_t)a3;
- (void)setStatsVertexCount:(int64_t)a3;
- (void)set_bufferTable:(void *)a3;
- (void)set_constantTable:(void *)a3;
- (void)set_dynamicFunctionConstants:(const void *)a3;
- (void)set_fadeOpacity:(float)a3;
- (void)set_isDepthOnly:(BOOL)a3;
- (void)set_isDrawingBlur:(BOOL)a3;
- (void)set_meshStats:(MeshStats *)a3;
- (void)set_patchHandler:(PatchHandler *)a3;
- (void)set_renderTargetInfo:(const RenderTargetInfo *)a3;
- (void)set_samplerTable:(void *)a3;
- (void)set_stateOverride:(unsigned __int8)a3;
- (void)set_stencilInfo:(StencilInfo *)a3;
- (void)set_textureTable:(TextureTableCollection *)a3;
- (void)set_viewports:(const void *)a3;
- (void)viewports:(const void *)a3 :(int64_t *)a4;
@end

@implementation VFXREDrawCallContextImpl

- (id)texture:(int)a3 :(id)a4
{
  id v6 = a4;
  v7 = [(VFXREDrawCallContextImpl *)self _textureTable];
  v8 = v7;
  switch(a3)
  {
    case 0:
      var0 = v7->var0.var0.var0;
      v10 = (char *)[v6 UTF8String];
      if (v10)
      {
        uint64_t v11 = *v10;
        if (*v10)
        {
          char v12 = v10[1];
          if (v12)
          {
            v13 = (unsigned __int8 *)(v10 + 2);
            do
            {
              uint64_t v11 = 31 * v11 + v12;
              int v14 = *v13++;
              char v12 = v14;
            }
            while (v14);
          }
          v11 &= ~0x8000000000000000;
        }
      }
      else
      {
        uint64_t v11 = 0x7FFFFFFFFFFFFFFFLL;
      }
      id v61 = (id)v11;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(void *)var0 + 32))(&v62, var0, &v61);
      if (!(_BYTE)v62) {
        goto LABEL_78;
      }
      v57 = v8->var0.var0.var0;
      goto LABEL_76;
    case 1:
      var1 = v7->var0.var0.var1;
      v16 = (char *)[v6 UTF8String];
      if (v16)
      {
        uint64_t v17 = *v16;
        if (*v16)
        {
          char v18 = v16[1];
          if (v18)
          {
            v19 = (unsigned __int8 *)(v16 + 2);
            do
            {
              uint64_t v17 = 31 * v17 + v18;
              int v20 = *v19++;
              char v18 = v20;
            }
            while (v20);
          }
          v17 &= ~0x8000000000000000;
        }
      }
      else
      {
        uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
      }
      id v61 = (id)v17;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(void *)var1 + 32))(&v62, var1, &v61);
      if (!(_BYTE)v62) {
        goto LABEL_78;
      }
      v57 = v8->var0.var0.var1;
      goto LABEL_76;
    case 2:
      var2 = v7->var0.var0.var2;
      v22 = (char *)[v6 UTF8String];
      if (v22)
      {
        uint64_t v23 = *v22;
        if (*v22)
        {
          char v24 = v22[1];
          if (v24)
          {
            v25 = (unsigned __int8 *)(v22 + 2);
            do
            {
              uint64_t v23 = 31 * v23 + v24;
              int v26 = *v25++;
              char v24 = v26;
            }
            while (v26);
          }
          v23 &= ~0x8000000000000000;
        }
      }
      else
      {
        uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
      }
      id v61 = (id)v23;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(void *)var2 + 32))(&v62, var2, &v61);
      if (!(_BYTE)v62) {
        goto LABEL_78;
      }
      v57 = v8->var0.var0.var2;
      goto LABEL_76;
    case 3:
      var3 = v7->var0.var0.var3;
      v28 = (char *)[v6 UTF8String];
      if (v28)
      {
        uint64_t v29 = *v28;
        if (*v28)
        {
          char v30 = v28[1];
          if (v30)
          {
            v31 = (unsigned __int8 *)(v28 + 2);
            do
            {
              uint64_t v29 = 31 * v29 + v30;
              int v32 = *v31++;
              char v30 = v32;
            }
            while (v32);
          }
          v29 &= ~0x8000000000000000;
        }
      }
      else
      {
        uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
      }
      id v61 = (id)v29;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(void *)var3 + 32))(&v62, var3, &v61);
      if (!(_BYTE)v62) {
        goto LABEL_78;
      }
      v57 = v8->var0.var0.var3;
      goto LABEL_76;
    case 4:
      var4 = v7->var0.var0.var4;
      v34 = (char *)[v6 UTF8String];
      if (v34)
      {
        uint64_t v35 = *v34;
        if (*v34)
        {
          char v36 = v34[1];
          if (v36)
          {
            v37 = (unsigned __int8 *)(v34 + 2);
            do
            {
              uint64_t v35 = 31 * v35 + v36;
              int v38 = *v37++;
              char v36 = v38;
            }
            while (v38);
          }
          v35 &= ~0x8000000000000000;
        }
      }
      else
      {
        uint64_t v35 = 0x7FFFFFFFFFFFFFFFLL;
      }
      id v61 = (id)v35;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(void *)var4 + 32))(&v62, var4, &v61);
      if (!(_BYTE)v62) {
        goto LABEL_78;
      }
      v57 = v8->var0.var0.var4;
      goto LABEL_76;
    case 5:
      var5 = v7->var0.var0.var5;
      if (!var5) {
        goto LABEL_78;
      }
      v40 = (char *)[v6 UTF8String];
      if (v40)
      {
        uint64_t v41 = *v40;
        if (*v40)
        {
          char v42 = v40[1];
          if (v42)
          {
            v43 = (unsigned __int8 *)(v40 + 2);
            do
            {
              uint64_t v41 = 31 * v41 + v42;
              int v44 = *v43++;
              char v42 = v44;
            }
            while (v44);
          }
          v41 &= ~0x8000000000000000;
        }
      }
      else
      {
        uint64_t v41 = 0x7FFFFFFFFFFFFFFFLL;
      }
      id v61 = (id)v41;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(void *)var5 + 32))(&v62, var5, &v61);
      if (!(_BYTE)v62) {
        goto LABEL_78;
      }
      v57 = v8->var0.var0.var5;
      goto LABEL_76;
    case 6:
      var9 = v7->var0.var0.var9;
      v46 = (char *)[v6 UTF8String];
      if (v46)
      {
        uint64_t v47 = *v46;
        if (*v46)
        {
          char v48 = v46[1];
          if (v48)
          {
            v49 = (unsigned __int8 *)(v46 + 2);
            do
            {
              uint64_t v47 = 31 * v47 + v48;
              int v50 = *v49++;
              char v48 = v50;
            }
            while (v50);
          }
          v47 &= ~0x8000000000000000;
        }
      }
      else
      {
        uint64_t v47 = 0x7FFFFFFFFFFFFFFFLL;
      }
      id v61 = (id)v47;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(void *)var9 + 32))(&v62, var9, &v61);
      if (!(_BYTE)v62) {
        goto LABEL_78;
      }
      v57 = v8->var0.var0.var9;
      goto LABEL_76;
    case 7:
      var10 = v7->var0.var0.var10;
      if (!var10) {
        goto LABEL_78;
      }
      v52 = (char *)[v6 UTF8String];
      if (v52)
      {
        uint64_t v53 = *v52;
        if (*v52)
        {
          char v54 = v52[1];
          if (v54)
          {
            v55 = (unsigned __int8 *)(v52 + 2);
            do
            {
              uint64_t v53 = 31 * v53 + v54;
              int v56 = *v55++;
              char v54 = v56;
            }
            while (v56);
          }
          v53 &= ~0x8000000000000000;
        }
      }
      else
      {
        uint64_t v53 = 0x7FFFFFFFFFFFFFFFLL;
      }
      id v61 = (id)v53;
      (*(void (**)(uint64_t *__return_ptr, TextureSource *, id *))(*(void *)var10 + 32))(&v62, var10, &v61);
      if (!(_BYTE)v62) {
        goto LABEL_78;
      }
      v57 = v8->var0.var0.var10;
LABEL_76:
      (*(void (**)(id *__return_ptr))(*(void *)v57 + 24))(&v61);
      id v58 = v61;
      v59 = v58;
      if (v58) {

      }
      break;
    default:
LABEL_78:
      v59 = 0;
      break;
  }

  return v59;
}

- (id)buffer:(int)a3 :(id)a4 :(int64_t *)a5 :(int64_t *)a6
{
  id v10 = a4;
  uint64_t v11 = [(VFXREDrawCallContextImpl *)self _bufferTable];
  switch(a3)
  {
    case 0:
      char v12 = (re::BufferTableReference *)(v11 + 66);
      goto LABEL_10;
    case 1:
      char v12 = (re::BufferTableReference *)(v11 + 6);
      goto LABEL_10;
    case 2:
      char v12 = (re::BufferTableReference *)(v11 + 12);
      goto LABEL_10;
    case 3:
      char v12 = (re::BufferTableReference *)(v11 + 18);
      goto LABEL_10;
    case 4:
      char v12 = (re::BufferTableReference *)(v11 + 24);
      goto LABEL_10;
    case 5:
      char v12 = (re::BufferTableReference *)(v11 + 30);
      goto LABEL_10;
    case 6:
      char v12 = (re::BufferTableReference *)(v11 + 54);
      goto LABEL_10;
    case 7:
      char v12 = (re::BufferTableReference *)(v11 + 72);
LABEL_10:
      v13 = (void *)*((void *)v12 + 5);
      if (!v13) {
        goto LABEL_20;
      }
      int v14 = (char *)[v10 UTF8String];
      if (v14)
      {
        uint64_t v15 = *v14;
        if (*v14)
        {
          char v16 = v14[1];
          if (v16)
          {
            uint64_t v17 = (unsigned __int8 *)(v14 + 2);
            do
            {
              uint64_t v15 = 31 * v15 + v16;
              int v18 = *v17++;
              char v16 = v18;
            }
            while (v18);
          }
          v15 &= ~0x8000000000000000;
        }
      }
      else
      {
        uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      }
      uint64_t v25 = v15;
      uint64_t v19 = re::HashBrown<re::WeakStringID,re::IndexAndProtectionOptions,re::Hash<re::WeakStringID>,re::EqualTo<re::WeakStringID>,re::Hash<re::IndexAndProtectionOptions>,false>::find(v13, &v25);
      if (v19 == -1) {
        goto LABEL_20;
      }
      Buffer = (void *)re::BufferTableReference::getBuffer(v12, *(unsigned __int8 *)(v13[1] + 16 * v19 + 8));
      unint64_t v22 = v21;
      id v23 = Buffer;
      *a5 = v22;
      *a6 = HIDWORD(v22);
      break;
    default:
LABEL_20:
      id v23 = 0;
      break;
  }

  return v23;
}

- (id)sampler:(int)a3 :(id)a4
{
  return 0;
}

- (const)constantData:(int)a3
{
  switch(a3)
  {
    case 1:
      v3 = [(VFXREDrawCallContextImpl *)self _constantTable];
      goto LABEL_8;
    case 5:
      v3 = [(VFXREDrawCallContextImpl *)self _constantTable] + 48;
      goto LABEL_8;
    case 8:
      v3 = [(VFXREDrawCallContextImpl *)self _constantTable] + 8;
      goto LABEL_8;
    case 9:
      v3 = [(VFXREDrawCallContextImpl *)self _constantTable] + 16;
      goto LABEL_8;
    case 10:
      v3 = [(VFXREDrawCallContextImpl *)self _constantTable] + 24;
LABEL_8:
      v5 = *(uint64_t (**)(void))(**(void **)v3 + 16);
      result = (const char *)v5();
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

- (BOOL)constantOffsetAndSize:(int)a3 :(id)a4 :(int64_t *)a5 :(int64_t *)a6
{
  id v10 = a4;
  BOOL v11 = 0;
  switch(a3)
  {
    case 1:
      char v12 = *(uint64_t (****)(void, uint64_t *))[(VFXREDrawCallContextImpl *)self _constantTable];
      v13 = (char *)[v10 UTF8String];
      if (!v13) {
        goto LABEL_32;
      }
      uint64_t v14 = *v13;
      if (!*v13) {
        goto LABEL_33;
      }
      char v15 = v13[1];
      if (v15)
      {
        char v16 = (unsigned __int8 *)(v13 + 2);
        do
        {
          uint64_t v14 = 31 * v14 + v15;
          int v17 = *v16++;
          char v15 = v17;
        }
        while (v17);
      }
      goto LABEL_31;
    case 5:
      char v12 = *(uint64_t (****)(void, uint64_t *))([(VFXREDrawCallContextImpl *)self _constantTable]+ 48);
      int v18 = (char *)[v10 UTF8String];
      if (!v18) {
        goto LABEL_32;
      }
      uint64_t v14 = *v18;
      if (!*v18) {
        goto LABEL_33;
      }
      char v19 = v18[1];
      if (v19)
      {
        int v20 = (unsigned __int8 *)(v18 + 2);
        do
        {
          uint64_t v14 = 31 * v14 + v19;
          int v21 = *v20++;
          char v19 = v21;
        }
        while (v21);
      }
      goto LABEL_31;
    case 8:
      char v12 = *(uint64_t (****)(void, uint64_t *))([(VFXREDrawCallContextImpl *)self _constantTable]+ 8);
      unint64_t v22 = (char *)[v10 UTF8String];
      if (!v22) {
        goto LABEL_32;
      }
      uint64_t v14 = *v22;
      if (!*v22) {
        goto LABEL_33;
      }
      char v23 = v22[1];
      if (v23)
      {
        char v24 = (unsigned __int8 *)(v22 + 2);
        do
        {
          uint64_t v14 = 31 * v14 + v23;
          int v25 = *v24++;
          char v23 = v25;
        }
        while (v25);
      }
      goto LABEL_31;
    case 9:
      char v12 = *(uint64_t (****)(void, uint64_t *))([(VFXREDrawCallContextImpl *)self _constantTable]+ 16);
      int v26 = (char *)[v10 UTF8String];
      if (!v26) {
        goto LABEL_32;
      }
      uint64_t v14 = *v26;
      if (!*v26) {
        goto LABEL_33;
      }
      char v27 = v26[1];
      if (v27)
      {
        v28 = (unsigned __int8 *)(v26 + 2);
        do
        {
          uint64_t v14 = 31 * v14 + v27;
          int v29 = *v28++;
          char v27 = v29;
        }
        while (v29);
      }
      goto LABEL_31;
    case 10:
      char v12 = *(uint64_t (****)(void, uint64_t *))([(VFXREDrawCallContextImpl *)self _constantTable]+ 24);
      char v30 = (char *)[v10 UTF8String];
      if (v30)
      {
        uint64_t v14 = *v30;
        if (*v30)
        {
          char v31 = v30[1];
          if (v31)
          {
            int v32 = (unsigned __int8 *)(v30 + 2);
            do
            {
              uint64_t v14 = 31 * v14 + v31;
              int v33 = *v32++;
              char v31 = v33;
            }
            while (v33);
          }
LABEL_31:
          v14 &= ~0x8000000000000000;
        }
      }
      else
      {
LABEL_32:
        uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
      }
LABEL_33:
      uint64_t v36 = v14;
      v34 = (unsigned __int16 *)(**v12)(v12, &v36);
      if (v34)
      {
        *a5 = *v34;
        *a6 = *((unsigned __int8 *)v34 + 2);
        BOOL v11 = 1;
      }
      else
      {
        BOOL v11 = 0;
      }
LABEL_36:

      return v11;
    default:
      goto LABEL_36;
  }
}

- (void)viewports:(const void *)a3 :(int64_t *)a4
{
  *a3 = *(const void **)([(VFXREDrawCallContextImpl *)self _viewports] + 16);
  *a4 = *(void *)([(VFXREDrawCallContextImpl *)self _viewports] + 8);
}

- (void)setLateLatchingPatchHandler:(id)a3
{
  id v4 = a3;
  if ([(VFXREDrawCallContextImpl *)self _patchHandler]) {
    re::PatchHandler::setHandler((void *)[(VFXREDrawCallContextImpl *)self _patchHandler], v4);
  }
}

- (VFXRERenderTargetInfo)renderTargetInfo
{
  v3 = objc_alloc_init(VFXRERenderTargetInfoImpl);
  [(VFXRERenderTargetInfoImpl *)v3 set_renderTargetInfo:[(VFXREDrawCallContextImpl *)self _renderTargetInfo]];
  return (VFXRERenderTargetInfo *)v3;
}

- (BOOL)isDrawingDepthOnly
{
  if ([(VFXREDrawCallContextImpl *)self _isDepthOnly]) {
    LOBYTE(v3) = 1;
  }
  else {
    return ([(VFXREDrawCallContextImpl *)self _stateOverride] >> 1) & 1;
  }
  return v3;
}

- (VFXStencilInfo)stencilInfo
{
  [(VFXREDrawCallContextImpl *)self _stencilInfo];
  if (v8[0] || ([(VFXREDrawCallContextImpl *)self _stencilInfo], v7))
  {
    BOOL v3 = objc_alloc_init(VFXREStencilInfoImpl);
    [(VFXREDrawCallContextImpl *)self _stencilInfo];
    id v4 = __39__VFXREDrawCallContextImpl_stencilInfo__block_invoke(v8);
    [(VFXREStencilInfoImpl *)v3 set_frontFaceTest:v4];

    [(VFXREDrawCallContextImpl *)self _stencilInfo];
    v5 = __39__VFXREDrawCallContextImpl_stencilInfo__block_invoke(v9);
    [(VFXREStencilInfoImpl *)v3 set_backFaceTest:v5];

    [(VFXREDrawCallContextImpl *)self _stencilInfo];
    [(VFXREStencilInfoImpl *)v3 set_frontReferenceValue:v10];
    [(VFXREDrawCallContextImpl *)self _stencilInfo];
    [(VFXREStencilInfoImpl *)v3 set_backReferenceValue:v10];
  }
  else
  {
    BOOL v3 = 0;
  }
  return (VFXStencilInfo *)v3;
}

id __39__VFXREDrawCallContextImpl_stencilInfo__block_invoke(unsigned __int8 *a1)
{
  id v2 = objc_alloc_init(MEMORY[0x263F12A20]);
  [v2 setStencilCompareFunction:a1[3]];
  [v2 setStencilFailureOperation:a1[4]];
  [v2 setDepthFailureOperation:a1[5]];
  [v2 setDepthStencilPassOperation:a1[6]];
  [v2 setReadMask:a1[1]];
  [v2 setWriteMask:a1[2]];
  return v2;
}

- (BOOL)useDitherFade
{
  BOOL v3 = [(VFXREDrawCallContextImpl *)self _dynamicFunctionConstants];
  if (v3) {
    LOBYTE(v3) = *(unsigned char *)([(VFXREDrawCallContextImpl *)self _dynamicFunctionConstants] + 24) & 1;
  }
  return (char)v3;
}

- (BOOL)enableClipping
{
  BOOL v3 = [(VFXREDrawCallContextImpl *)self _dynamicFunctionConstants];
  if (v3) {
    LODWORD(v3) = (*(unsigned __int8 *)([(VFXREDrawCallContextImpl *)self _dynamicFunctionConstants]+ 24) >> 1) & 1;
  }
  return (char)v3;
}

- (BOOL)renderForBlur
{
  return 0;
}

- (BOOL)enableBreakthrough
{
  return 0;
}

- (BOOL)enableNearFieldVignetting
{
  return 0;
}

- (int)portalClippingMode
{
  if ((atomic_load_explicit((atomic_uchar *volatile)&qword_26AF94770, memory_order_acquire) & 1) == 0)
  {
    char v7 = (re *)__cxa_guard_acquire(&qword_26AF94770);
    if (v7)
    {
      qword_26AF94768 = re::hashString(v7, v8);
      __cxa_guard_release(&qword_26AF94770);
    }
  }
  uint64_t v3 = [(VFXREDrawCallContextImpl *)self _dynamicFunctionConstants];
  if (v3)
  {
    id v4 = *(void **)[(VFXREDrawCallContextImpl *)self _dynamicFunctionConstants];
    if ((!v4
       || (uint64_t v10 = qword_26AF94768,
           v3 = re::HashBrown<re::WeakStringID,re::IndexAndProtectionOptions,re::Hash<re::WeakStringID>,re::EqualTo<re::WeakStringID>,re::Hash<re::IndexAndProtectionOptions>,false>::find(v4, &v10), v3 == -1))&& ((v4 = *(void **)([(VFXREDrawCallContextImpl *)self _dynamicFunctionConstants] + 8)) == 0|| (uint64_t v10 = qword_26AF94768, v3 = re::HashBrown<re::WeakStringID,re::IndexAndProtectionOptions,re::Hash<re::WeakStringID>,re::EqualTo<re::WeakStringID>,re::Hash<re::IndexAndProtectionOptions>,false>::find(v4, &v10), v3 == -1)))
    {
      id v6 = *(void **)([(VFXREDrawCallContextImpl *)self _dynamicFunctionConstants] + 16);
      if (!v6
        || (uint64_t v10 = qword_26AF94768,
            uint64_t v3 = re::HashBrown<re::WeakStringID,re::IndexAndProtectionOptions,re::Hash<re::WeakStringID>,re::EqualTo<re::WeakStringID>,re::Hash<re::IndexAndProtectionOptions>,false>::find(v6, &v10), v3 == -1))
      {
        LODWORD(v3) = 0;
        return v3;
      }
      uint64_t v5 = v6[1];
    }
    else
    {
      uint64_t v5 = v4[1];
    }
    LODWORD(v3) = *(_DWORD *)(v5 + 16 * v3 + 8);
  }
  return v3;
}

- (BOOL)depthOnly
{
  if ([(VFXREDrawCallContextImpl *)self _isDepthOnly]) {
    LOBYTE(v3) = 1;
  }
  else {
    return ([(VFXREDrawCallContextImpl *)self _stateOverride] >> 1) & 1;
  }
  return v3;
}

- (int64_t)statsVertexCount
{
  int64_t result = [(VFXREDrawCallContextImpl *)self _meshStats];
  if (result) {
    return *(int *)(result + 64);
  }
  return result;
}

- (void)setStatsVertexCount:(int64_t)a3
{
  int v3 = a3;
  id v4 = [(VFXREDrawCallContextImpl *)self _meshStats];
  if (v4) {
    v4->var16 = v3;
  }
}

- (int64_t)statsPrimitiveCount
{
  int64_t result = [(VFXREDrawCallContextImpl *)self _meshStats];
  if (result) {
    return *(int *)(result + 60);
  }
  return result;
}

- (void)setStatsPrimitiveCount:(int64_t)a3
{
  int v3 = a3;
  id v4 = [(VFXREDrawCallContextImpl *)self _meshStats];
  if (v4) {
    v4->var15 = v3;
  }
}

- (int64_t)statsDrawcallCount
{
  int64_t result = [(VFXREDrawCallContextImpl *)self _meshStats];
  if (result) {
    return *(int *)(result + 56);
  }
  return result;
}

- (void)setStatsDrawcallCount:(int64_t)a3
{
  int v3 = a3;
  id v4 = [(VFXREDrawCallContextImpl *)self _meshStats];
  if (v4) {
    v4->var14 = v3;
  }
}

- (TextureTableCollection)_textureTable
{
  return self->__textureTable;
}

- (void)set_textureTable:(TextureTableCollection *)a3
{
  self->__textureTable = a3;
}

- (void)_bufferTable
{
  return self->__bufferTable;
}

- (void)set_bufferTable:(void *)a3
{
  self->__bufferTable = a3;
}

- (void)_samplerTable
{
  return self->__samplerTable;
}

- (void)set_samplerTable:(void *)a3
{
  self->__samplerTable = a3;
}

- (void)_constantTable
{
  return self->__constantTable;
}

- (void)set_constantTable:(void *)a3
{
  self->__constantTable = a3;
}

- (const)_viewports
{
  return self->__viewports;
}

- (void)set_viewports:(const void *)a3
{
  self->__viewports = a3;
}

- (const)_renderTargetInfo
{
  return self->__renderTargetInfo;
}

- (void)set_renderTargetInfo:(const RenderTargetInfo *)a3
{
  self->__renderTargetInfo = a3;
}

- (const)_dynamicFunctionConstants
{
  return self->__dynamicFunctionConstants;
}

- (void)set_dynamicFunctionConstants:(const void *)a3
{
  self->__dynamicFunctionConstants = a3;
}

- (PatchHandler)_patchHandler
{
  return self->__patchHandler;
}

- (void)set_patchHandler:(PatchHandler *)a3
{
  self->__patchHandler = a3;
}

- (StencilInfo)_stencilInfo
{
  *retstr = *(StencilInfo *)((char *)self + 88);
  return self;
}

- (void)set_stencilInfo:(StencilInfo *)a3
{
  StencilStateInfo state = a3->state;
  self->__stencilInfo.referenceValue = a3->referenceValue;
  self->__stencilInfo.StencilStateInfo state = state;
}

- (float)_fadeOpacity
{
  return self->__fadeOpacity;
}

- (void)set_fadeOpacity:(float)a3
{
  self->__fadeOpacity = a3;
}

- (BOOL)_isDrawingBlur
{
  return self->__isDrawingBlur;
}

- (void)set_isDrawingBlur:(BOOL)a3
{
  self->__isDrawingBlur = a3;
}

- (BOOL)_isDepthOnly
{
  return self->__isDepthOnly;
}

- (void)set_isDepthOnly:(BOOL)a3
{
  self->__isDepthOnly = a3;
}

- (unsigned)_stateOverride
{
  return self->__stateOverride;
}

- (void)set_stateOverride:(unsigned __int8)a3
{
  self->__stateOverride = a3;
}

- (MeshStats)_meshStats
{
  return self->__meshStats;
}

- (void)set_meshStats:(MeshStats *)a3
{
  self->__meshStats = a3;
}

- (id).cxx_construct
{
  *((void *)self + 11) = 134217472;
  *((void *)self + 12) = 134217472;
  return self;
}

@end