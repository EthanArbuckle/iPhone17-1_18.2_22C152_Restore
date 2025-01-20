@interface DYEAGLDebugFunctionPlayer
+ (void)_resolveDepthWithWidth:(int)a3 height:(int)a4 numSamples:(int)a5 buffer:(float *)a6;
+ (void)_resolveStencilWithWidth:(int)a3 height:(int)a4 numSamples:(int)a5 buffer:(char *)a6;
- (BOOL)_isBoundObjectAlive:(unsigned int)a3 isObjectFunc:(void *)a4;
- (BOOL)_isContextModifiable;
- (BOOL)_switchToWireframeFramebuffer;
- (BOOL)isFunctionEnabled;
- (BOOL)shouldExecuteGraphicsFunction;
- (DYEAGLDebugFunctionPlayer)initWithCaptureStore:(id)a3;
- (DYLayerManager)strongLayerManager;
- (id).cxx_construct;
- (void)_changeTextureToWidth:(int)a3 height:(int)a4 imageFormatInfo:(ImageFormatInfo *)a5 texels:(char *)a6;
- (void)_copyColorAttachmentToPresentTexture:(unsigned int)a3 imageInfo:(ImageInfo *)a4;
- (void)_copyDepthOrStencilAttachmentToPresent:(unsigned int)a3 type:(unsigned int)a4;
- (void)_copyRenderbufferColorAttachmentToPresent:(unsigned int)a3 color:(unsigned int)a4 isWireframe:(BOOL)a5;
- (void)_copyTextureColorAttachmentToPresent:(unsigned int)a3;
- (void)_imageInfoForAttachment:(unsigned int)a3 outImageInfo:(ImageInfo *)a4;
- (void)_onResourceUpdated:(unsigned int)a3 target:(unsigned int)a4 dispatcher:(Dispatcher *)a5;
- (void)_presentFramebufferWithWireframe:(BOOL)a3 wireframeLineColor:(unsigned int)a4;
- (void)_renderPresentTextureWithColor:(unsigned int)a3 enableBlend:(BOOL)a4 texBlitProgram:(unsigned int)a5;
- (void)_switchToOriginalFramebuffer;
- (void)dealloc;
- (void)executePlatformFunction;
- (void)performPostGraphicsFunctionDispatchActions:(BOOL)a3;
- (void)prepareForCaptureExecution;
- (void)setEngine:(id)a3;
@end

@implementation DYEAGLDebugFunctionPlayer

- (DYLayerManager)strongLayerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->super._layerManager);

  return (DYLayerManager *)WeakRetained;
}

+ (void)_resolveDepthWithWidth:(int)a3 height:(int)a4 numSamples:(int)a5 buffer:(float *)a6
{
  if (a5 >= 2 && a4 >= 1)
  {
    int v6 = 0;
    v7 = a6;
    do
    {
      if (a3 >= 1)
      {
        for (int i = 0; i != a3; ++i)
        {
          uint64_t v9 = 0;
          float v10 = 0.0;
          do
            float v10 = v10 + v7[v9++];
          while (a5 != v9);
          v7 += (a5 - 1) + 1;
          *a6++ = (float)(1.0 / (float)a5) * v10;
        }
      }
      ++v6;
    }
    while (v6 != a4);
  }
}

+ (void)_resolveStencilWithWidth:(int)a3 height:(int)a4 numSamples:(int)a5 buffer:(char *)a6
{
  if (a5 >= 2 && a4 >= 1)
  {
    int v6 = 0;
    v7 = a6;
    do
    {
      if (a3 >= 1)
      {
        for (int i = 0; i != a3; ++i)
        {
          uint64_t v9 = 0;
          int v10 = 0;
          do
            v10 += v7[v9++];
          while (a5 != v9);
          v7 += a5;
          *a6++ = v10 / a5;
        }
      }
      ++v6;
    }
    while (v6 != a4);
  }
}

- (DYEAGLDebugFunctionPlayer)initWithCaptureStore:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)DYEAGLDebugFunctionPlayer;
  v5 = [(DYEAGLDebugFunctionPlayer *)&v13 initWithCaptureStore:v4];
  if (v5)
  {
    uint64_t v6 = objc_opt_new();
    sharegroupSet = v5->_sharegroupSet;
    v5->_sharegroupSet = (NSMutableSet *)v6;

    v5->_wireframeRenderbuffer = kDYReservedGLNameWireframeRenderbuffer;
    v5->_wireframeFramebuffer = kDYReservedGLNameWireframeFramebuffer;
    v5->_wireframeRenderbufferFormat = 0;
    v5->_presentRenderbuffer = kDYReservedGLNamePresentRenderbuffer;
    v5->_presentFramebuffer = kDYReservedGLNamePresentFramebuffer;
    v5->_presentTexture = kDYReservedGLNamePresentTexture;
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x3032000000;
    v11[3] = sub_AA68;
    v11[4] = sub_AA78;
    v8 = v5;
    v12 = v8;
    DYSetResourceUpdateCallbackBlock();
    uint64_t v9 = v8;
    _Block_object_dispose(v11, 8);
  }
  return v5;
}

- (void)dealloc
{
  DYSetResourceUpdateCallbackBlock();
  v3.receiver = self;
  v3.super_class = (Class)DYEAGLDebugFunctionPlayer;
  [(DYEAGLDebugFunctionPlayer *)&v3 dealloc];
}

- (void)setEngine:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)DYEAGLDebugFunctionPlayer;
  [(DYEAGLDebugFunctionPlayer *)&v7 setEngine:v4];
  v5 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine] disabledFunctions];
  disabledFunctions = self->_disabledFunctions;
  self->_disabledFunctions = v5;
}

- (BOOL)isFunctionEnabled
{
  if (self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__mainExecutionMode]) {
    return [(NSMutableIndexSet *)self->_disabledFunctions containsIndex:*(unsigned int *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__currentExecutionModeFunctionIndex]] ^ 1;
  }
  else {
    return 1;
  }
}

- (BOOL)shouldExecuteGraphicsFunction
{
  uint64_t v3 = OBJC_IVAR___DYFunctionPlayer__engine;
  id v4 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine] delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    goto LABEL_28;
  }
  uint64_t v6 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate];
  unsigned __int8 v7 = [v6 shouldExecuteGraphicsFunction];

  v8 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate];
  unsigned int v9 = [v8 shouldCallSuper];

  if (v9)
  {
    v22 = self;
    int v10 = &v22;
LABEL_23:
    v10[1] = (DYEAGLDebugFunctionPlayer *)DYEAGLDebugFunctionPlayer;
    return [super shouldExecuteGraphicsFunction:v21];
  }
  v11 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate];
  int v12 = [v11 shouldReturn];

  if ((v12 & 1) == 0)
  {
LABEL_28:
    if ([(DYEAGLDebugFunctionPlayer *)self isFunctionEnabled])
    {
      if (!self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__mainExecutionMode]) {
        goto LABEL_22;
      }
      int v13 = **(_DWORD **)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
      if (v13 <= 822)
      {
        BOOL v18 = (v13 - 139) > 7 || ((1 << (v13 + 117)) & 0x91) == 0;
        if (v18 && v13 != 382 && v13 != 384) {
          goto LABEL_22;
        }
      }
      else
      {
        unsigned int v14 = v13 - 823;
        BOOL v15 = v14 > 0x16;
        int v16 = (1 << v14) & 0x780003;
        if (v15 || v16 == 0) {
          goto LABEL_22;
        }
      }
      unsigned int v19 = *(_DWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__currentExecutionModeFunctionIndex];
      if (v19 < [*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] targetFunctionIndex])
      {
LABEL_22:
        v21 = self;
        int v10 = &v21;
        goto LABEL_23;
      }
    }
    return 0;
  }
  return v7;
}

- (void)performPostGraphicsFunctionDispatchActions:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = OBJC_IVAR___DYFunctionPlayer__engine;
  uint64_t v6 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine] delegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[v5] delegate];
    [v8 performPostGraphicsFunctionDispatchActions:v3];

    unsigned int v9 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[v5] delegate];
    unsigned int v10 = [v9 shouldCallSuper];

    if (v10)
    {
      v53.receiver = self;
      v53.super_class = (Class)DYEAGLDebugFunctionPlayer;
      [(DYEAGLDebugFunctionPlayer *)&v53 performPostGraphicsFunctionDispatchActions:v3];
    }
    v11 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[v5] delegate];
    unsigned __int8 v12 = [v11 shouldReturn];

    if (v12) {
      return;
    }
  }
  uint64_t v13 = OBJC_IVAR___DYFunctionPlayer__function;
  uint64_t v14 = *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
  int v15 = *(_DWORD *)v14;
  if (*(int *)v14 <= 381)
  {
    BOOL v18 = (v15 - 139) <= 7 && ((1 << (v15 + 117)) & 0x91) != 0 || v15 == 28;
    if (!v18 && v15 != 36) {
      goto LABEL_39;
    }
LABEL_22:
    id v19 = *(id *)&self->super.DYGLFunctionPlayer_opaque[v5];
    unsigned int v20 = [(DYEAGLDebugFunctionPlayer *)self _isContextModifiable];
    int v21 = *(_DWORD *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__currentExecutionModeFunctionIndex];
    if (v21 + 1 == [v19 targetFunctionIndex]) {
      unsigned int v22 = v20;
    }
    else {
      unsigned int v22 = 0;
    }
    if (v22 != 1)
    {
LABEL_64:

      return;
    }
    int v23 = 0;
    LOBYTE(v52[0]) = 0;
    LOBYTE(v50) = 0;
    uint64_t v24 = OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo;
    if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                   + 104) >= 3uLL)
    {
      uint64_t v25 = OBJC_IVAR___DYGLFunctionPlayer__disp;
      uint64_t v26 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
      int v23 = (*(uint64_t (**)(void, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                       + 1144))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 35977);
      (*(void (**)(void, uint64_t, id *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v25] + 792))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v26], 36388, v52);
      (*(void (**)(void, uint64_t, id **))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v25] + 792))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v26], 36387, &v50);
      if (LOBYTE(v52[0]) == 1 && !(_BYTE)v50) {
        (*(void (**)(void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v25] + 7256))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v26]);
      }
    }
    if (![(DYEAGLDebugFunctionPlayer *)self _switchToWireframeFramebuffer])
    {
LABEL_59:
      if ([v19 enableDrawCallPresent]) {
        -[DYEAGLDebugFunctionPlayer _presentFramebufferWithWireframe:[self enableWireframePresent] wireframeLineColor:[v19 wireframeLineColor]];
      }
      if (LOBYTE(v52[0]) == 1 && !(_BYTE)v50) {
        (*(void (**)(void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
      }
                                       + 7264))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx]);
      goto LABEL_64;
    }
    uint64_t v27 = *(void *)&self->super.DYGLFunctionPlayer_opaque[v13];
    int v28 = *(_DWORD *)v27;
    if (*(int *)v27 <= 145)
    {
      if (v28 == 139)
      {
        uint64_t v32 = 0;
        uint64_t v33 = 0;
        v30 = (unsigned int **)(v27 + 120);
        uint64_t v29 = **(unsigned int **)(v27 + 96);
        goto LABEL_47;
      }
      if (v28 != 143) {
        goto LABEL_58;
      }
      uint64_t v29 = 0;
      v30 = (unsigned int **)(v27 + 96);
      uint64_t v32 = **(unsigned int **)(v27 + 120);
      v34 = *(uint64_t **)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__argumentPointers + 32];
    }
    else
    {
      if (v28 != 146)
      {
        if (v28 == 823)
        {
          uint64_t v32 = 0;
          uint64_t v33 = 0;
          v30 = (unsigned int **)(v27 + 120);
          v31 = *(unsigned int **)(v27 + 144);
          uint64_t v29 = **(unsigned int **)(v27 + 96);
          goto LABEL_45;
        }
        if (v28 == 824)
        {
          uint64_t v29 = 0;
          v30 = (unsigned int **)(v27 + 96);
          v31 = *(unsigned int **)(v27 + 168);
          uint64_t v32 = **(unsigned int **)(v27 + 120);
          uint64_t v33 = **(void **)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__argumentPointers + 32];
LABEL_45:
          uint64_t v37 = *v31;
LABEL_48:
          if (!v3)
          {
            uint64_t v38 = **v30;
            if ((int)v38 >= 1 && v23 == 0)
            {
              uint64_t v40 = **(unsigned int **)(v27 + 72);
              if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v24] + 104) == 1) {
                v41 = &OBJC_IVAR___DYEAGLDebugFunctionPlayer__fixedWireframeRenderer;
              }
              else {
                v41 = &OBJC_IVAR___DYEAGLDebugFunctionPlayer__shaderWireframeRenderer;
              }
              uint64_t v42 = *v41;
              [v19 wireframeLineWidth];
              (*(void (**)(unsigned __int8 *, DYEAGLDebugFunctionPlayer *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v42] + 16))(&self->super.DYGLFunctionPlayer_opaque[v42], self, v40, v29, v38, v32, v33, v37);
            }
          }
        }
LABEL_58:
        [(DYEAGLDebugFunctionPlayer *)self _switchToOriginalFramebuffer];
        goto LABEL_59;
      }
      uint64_t v29 = 0;
      v30 = (unsigned int **)(v27 + 144);
      uint64_t v32 = **(unsigned int **)(v27 + 168);
      v34 = *(uint64_t **)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__argumentPointers + 48];
    }
    uint64_t v33 = *v34;
LABEL_47:
    uint64_t v37 = 1;
    goto LABEL_48;
  }
  BOOL v16 = (v15 - 823) > 0x1F || ((1 << (v15 - 55)) & 0xF0784003) == 0;
  if (!v16 || v15 == 384 || v15 == 382) {
    goto LABEL_22;
  }
LABEL_39:
  if (v15 == 93 && !v3)
  {
    v35 = *(unsigned int **)(v14 + 72);
    v36 = [(DYEAGLDebugFunctionPlayer *)self context];
    sub_7E98(v52, v36);

    v50 = v52;
    id v51 = [(DYEAGLDebugFunctionPlayer *)self gliDispatch];
    sub_7240((uint64_t)&self->_shaderWireframeRenderer, &v50, *v35);
LABEL_72:

    return;
  }
  if (v15 == 349 && !v3)
  {
    v43 = *(unsigned int **)(v14 + 72);
    v44 = [(DYEAGLDebugFunctionPlayer *)self context];
    sub_7E98(v52, v44);

    v50 = v52;
    id v51 = [(DYEAGLDebugFunctionPlayer *)self gliDispatch];
    sub_7924((uint64_t)&self->_shaderWireframeRenderer, &v50, *v43);
    goto LABEL_72;
  }
  if (v15 == 888 && !v3)
  {
    v45 = *(int **)(v14 + 72);
    v46 = *(int **)(v14 + 96);
    v47 = *(unsigned int **)(v14 + 24);
    v48 = [(DYEAGLDebugFunctionPlayer *)self context];
    sub_7E98(v52, v48);

    v50 = v52;
    id v51 = [(DYEAGLDebugFunctionPlayer *)self gliDispatch];
    sub_7CF0((uint64_t)&self->_shaderWireframeRenderer, &v50, *v47, *v45, *v46, *(const std::string::value_type ***)(v14 + 120));
    goto LABEL_72;
  }
  v49.receiver = self;
  v49.super_class = (Class)DYEAGLDebugFunctionPlayer;
  [(DYEAGLDebugFunctionPlayer *)&v49 performPostGraphicsFunctionDispatchActions:v3];
}

- (void)executePlatformFunction
{
  uint64_t v3 = OBJC_IVAR___DYFunctionPlayer__engine;
  id v4 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine] delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    goto LABEL_20;
  }
  uint64_t v6 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate];
  [v6 executePlatformFunction];

  char v7 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate];
  unsigned int v8 = [v7 shouldCallSuper];

  if (v8)
  {
    v23.receiver = self;
    v23.super_class = (Class)DYEAGLDebugFunctionPlayer;
    [(DYEAGLFunctionPlayer *)&v23 executePlatformFunction];
  }
  unsigned int v9 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate];
  unsigned __int8 v10 = [v9 shouldReturn];

  if ((v10 & 1) == 0)
  {
LABEL_20:
    uint64_t v11 = *(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
    int v12 = *(_DWORD *)v11;
    if ([(DYEAGLDebugFunctionPlayer *)self isFunctionEnabled])
    {
      if (v12 > -8180)
      {
        if ((v12 + 8179) < 2) {
          return;
        }
      }
      else
      {
        switch(v12)
        {
          case -12287:
            v21.receiver = self;
            v21.super_class = (Class)DYEAGLDebugFunctionPlayer;
            [(DYEAGLFunctionPlayer *)&v21 executePlatformFunction];
            uint64_t v14 = **(void **)(v11 + 96);
            int v15 = [(DYEAGLDebugFunctionPlayer *)self strongLayerManager];
            BOOL v16 = [v15 layerForID:v14];

            v17 = [v16 drawableProperties];
            id v18 = [v17 mutableCopy];

            id v19 = +[NSNumber numberWithBool:1];
            [v18 setObject:v19 forKey:kEAGLDrawablePropertyRetainedBacking];

            [v16 setDrawableProperties:v18];
            return;
          case -8190:
            return;
          case -8188:
            v22.receiver = self;
            v22.super_class = (Class)DYEAGLDebugFunctionPlayer;
            [(DYEAGLFunctionPlayer *)&v22 executePlatformFunction];
            id v13 = [objc_alloc((Class)NSNumber) initWithUnsignedLongLong:**(void **)(v11 + 120)];
            if (([(NSMutableSet *)self->_sharegroupSet containsObject:v13] & 1) == 0)
            {
              [(NSMutableSet *)self->_sharegroupSet addObject:v13];
              DYReserveGLObjects();
              DYReserveGLObjects();
              DYReserveGLObjects();
              DYReserveGLObjects();
              DYReserveGLObjects();
            }
            if (**(_DWORD **)(v11 + 72) >= 2u) {
              [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] setParameter:610 to:&unk_2EAC8];
            }

            return;
        }
      }
      v20.receiver = self;
      v20.super_class = (Class)DYEAGLDebugFunctionPlayer;
      [(DYEAGLFunctionPlayer *)&v20 executePlatformFunction];
    }
  }
}

- (void)_onResourceUpdated:(unsigned int)a3 target:(unsigned int)a4 dispatcher:(Dispatcher *)a5
{
  if (a4 == 35648)
  {
    sub_7924((uint64_t)&self->_shaderWireframeRenderer, a5, *(uint64_t *)&a3);
  }
  else if (a4 == 35656)
  {
    sub_7240((uint64_t)&self->_shaderWireframeRenderer, a5, *(uint64_t *)&a3);
  }
}

- (BOOL)_switchToWireframeFramebuffer
{
  uint64_t v3 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  uint64_t v4 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                          + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 36006, &self->_origFramebuffer);
  if (!self->_origFramebuffer) {
    return 0;
  }
  unsigned int v20 = 0;
  int v18 = 0;
  int v19 = 0;
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 36007, &v20);
  uint64_t v5 = 36064;
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                   + 5440))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, 36064, 36049, &v19);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                   + 5440))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, 36064, 36048, &v18);
  if (!v18)
  {
    uint64_t v5 = 36096;
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                     + 5440))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, 36096, 36049, &v19);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                     + 5440))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, 36096, 36048, &v18);
    if (!v18)
    {
      uint64_t v5 = 36128;
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                       + 5440))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, 36128, 36049, &v19);
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                       + 5440))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, 36128, 36048, &v18);
      if (!v18) {
        return 0;
      }
    }
  }
  memset(v14, 0, sizeof(v14));
  int v15 = 0;
  uint64_t v16 = 0x100000001;
  v17[0] = 0;
  *(void *)((char *)v17 + 5) = 0;
  [(DYEAGLDebugFunctionPlayer *)self _imageInfoForAttachment:v5 outImageInfo:v14];
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5376))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, self->_wireframeFramebuffer);
  uint64_t v13 = 0;
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5328))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 36161, self->_wireframeRenderbuffer);
  (*(void (**)(void, uint64_t, uint64_t, char *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                           + 5360))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 36161, 36162, (char *)&v13 + 4);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                              + 5360))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 36161, 36163, &v13);
  if (self->_wireframeRenderbufferFormat)
  {
    int v6 = v15;
    int v7 = HIDWORD(v13);
    goto LABEL_15;
  }
  self->_wireframeRenderbufferFormat = 32856;
  unint64_t v9 = *(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                 + 104);
  if (v9 == 2)
  {
    unsigned __int8 v10 = (char *)(*(uint64_t (**)(void, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                             + 936))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 7939);
    if (!v10 || !strstr(v10, "GL_EXT_texture_rg")) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if (v9 >= 3) {
LABEL_13:
  }
    self->_wireframeRenderbufferFormat = 33321;
LABEL_14:
  int v6 = v15;
  int v7 = ~v15;
  HIDWORD(v13) = ~v15;
LABEL_15:
  if (v6 != v7 || v16 != v13)
  {
    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5352))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 36161, self->_wireframeRenderbufferFormat);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                      + 5432))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 36009, 36064, 36161, self->_wireframeRenderbuffer);
  }
  (*(void (**)(void, uint64_t, float *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 824))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 3106, v21);
  (*(void (**)(void, uint64_t, unsigned char *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 792))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 3107, v12);
  BOOL v8 = 1;
  (*(void (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                     + 392))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 1, 1, 1, 1);
  (*(void (**)(void, double, double, double, double))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                 + 96))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 0.0, 0.0, 0.0, 0.0);
  (*(void (**)(void, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 80))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 0x4000);
  (*(void (**)(void, float, float, float, float))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                             + 96))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], v21[0], v21[1], v21[2], v21[3]);
  (*(void (**)(void, void, void, void, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3]
                                                                 + 392))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], v12[0], v12[1], v12[2], v12[3]);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5328))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v4], 36161, v20);
  return v8;
}

- (void)_switchToOriginalFramebuffer
{
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                  + 5376))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 36009, self->_origFramebuffer);
}

- (void)_presentFramebufferWithWireframe:(BOOL)a3 wireframeLineColor:(unsigned int)a4
{
  BOOL v4 = a3;
  uint64_t v65 = 0;
  long long v64 = 0uLL;
  uint64_t v6 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  uint64_t v7 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  (*(void (**)(void, uint64_t, char *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                  + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 36006, (char *)&v65 + 4);
  if (HIDWORD(v65))
  {
    (*(void (**)(void, uint64_t, uint64_t *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6] + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36007, &v65);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, char *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                      + 5440))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, 36064, 36049, (char *)&v64 + 12);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, char *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                      + 5440))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, 36064, 36048, (char *)&v64 + 8);
    if (DWORD2(v64))
    {
      uint64_t v68 = 0;
      uint64_t v69 = 0;
      int v71 = 0;
      uint64_t v70 = 0;
      uint64_t v72 = 0x100000001;
      v73[0] = 0;
      *(void *)((char *)v73 + 5) = 0;
      [(DYEAGLDebugFunctionPlayer *)self _imageInfoForAttachment:36064 outImageInfo:&v68];
      BOOL v8 = kEAGLColorFormatRGBA8;
      if ((HIDWORD(v69) & 0xFFFFFFFD) == 0x8C41) {
        unint64_t v9 = kEAGLColorFormatSRGBA8;
      }
      else {
        unint64_t v9 = kEAGLColorFormatRGBA8;
      }
      v60 = v9;
      if (DWORD2(v64) == 36161)
      {
        unsigned __int8 v10 = [(DYEAGLFunctionPlayer *)self currentRenderbufferDrawableMap];
        uint64_t v11 = +[NSNumber numberWithUnsignedInt:HIDWORD(v64)];
        int v12 = [v10 objectForKey:v11];

        if (v12)
        {
          uint64_t v13 = [(DYEAGLDebugFunctionPlayer *)self strongLayerManager];
          uint64_t v14 = [v13 layerForID:[v12 unsignedLongLongValue]];

          if (v14) {
            goto LABEL_14;
          }
        }
        else
        {
        }
      }
    }
    else
    {
      v60 = 0;
    }
    int v15 = [(DYEAGLDebugFunctionPlayer *)self strongLayerManager];
    uint64_t v14 = [v15 currentTopLayer];

    if (!v14)
    {
LABEL_39:

      return;
    }
    BOOL v8 = kEAGLColorFormatRGBA8;
LABEL_14:
    uint64_t v16 = v60;
    if (v60) {
      v17 = v60;
    }
    else {
      v17 = v8;
    }
    v60 = v17;

    uint64_t v58 = OBJC_IVAR___DYGLFunctionPlayer__ctx;
    int v18 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] sharegroup];

    int v19 = [(DYEAGLDebugFunctionPlayer *)self strongLayerManager];
    unsigned int v20 = [v19 layerForID:v18];

    objc_super v21 = [v20 drawableProperties];
    v57 = [v21 objectForKeyedSubscript:kEAGLDrawablePropertyColorFormat];

    if (v20 != v14) {
      goto LABEL_21;
    }
    [v14 bounds];
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;
    [v14 bounds];
    v75.origin.x = v30;
    v75.origin.y = v31;
    v75.size.width = v32;
    v75.size.height = v33;
    v74.origin.x = v23;
    v74.origin.y = v25;
    v74.size.width = v27;
    v74.size.height = v29;
    if (!CGRectEqualToRect(v74, v75)
      || ([v14 contentsScale], double v35 = v34, objc_msgSend(v14, "contentsScale"), v35 != v36)
      || (uint64_t v37 = v14, ([v57 isEqualToString:v60] & 1) == 0))
    {
LABEL_21:
      v66 = kEAGLDrawablePropertyColorFormat;
      v67 = v60;
      uint64_t v38 = +[NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      if (v20)
      {
        sub_DDB4((uint64_t)&v68, 1, 1);
        [v14 transform];
        v62[4] = v62[12];
        v62[5] = v62[13];
        v62[6] = v62[14];
        v62[7] = v62[15];
        v62[0] = v62[8];
        v62[1] = v62[9];
        v62[2] = v62[10];
        v62[3] = v62[11];
        [v20 setTransform:v62];
        [v14 anchorPoint];
        [v20 setAnchorPoint:];
        [v14 bounds];
        [v20 setBounds:];
        [v14 contentsScale];
        [v20 setContentsScale:];
        [v20 setDrawableProperties:v38];
      }
      else
      {
        v39 = [(DYEAGLDebugFunctionPlayer *)self strongLayerManager];
        [v14 bounds];
        double v41 = v40;
        double v43 = v42;
        double v45 = v44;
        double v47 = v46;
        [v14 contentsScale];
        unsigned int v20 = [v39 createLayerWithID:v18 contentRect:v38 contentsScale:0 properties:v41 isCoreAnimationSurface:v43 v45 v47 v48];

        sub_DDB4((uint64_t)&v68, 1, 1);
        [v14 transform];
        *(_OWORD *)&v63[8] = *(_OWORD *)&v63[25];
        *(_OWORD *)&v63[10] = *(_OWORD *)&v63[27];
        *(_OWORD *)&v63[12] = *(_OWORD *)&v63[29];
        *(_OWORD *)&v63[14] = *(_OWORD *)&v63[31];
        *(_OWORD *)v63 = *(_OWORD *)&v63[17];
        *(_OWORD *)&v63[2] = *(_OWORD *)&v63[19];
        *(_OWORD *)&v63[4] = *(_OWORD *)&v63[21];
        *(_OWORD *)&v63[6] = *(_OWORD *)&v63[23];
        [v20 setTransform:v63];
        [v14 anchorPoint];
        [v20 setAnchorPoint:];
      }
      sub_DE80((uint64_t)&v68);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5328))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36161, self->_presentRenderbuffer);
      [*(id *)&self->super.DYGLFunctionPlayer_opaque[v58] renderbufferStorage:36161 fromDrawable:v20];
      +[CATransaction flush];
      LODWORD(v68) = 0;
      (*(void (**)(void, uint64_t, uint64_t, uint64_t *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                  + 5360))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36161, 36164, &v68);
      InternalFormatInfo = (long long *)GPUTools::GL::GetInternalFormatInfo((GPUTools::GL *)v68, v49);
      long long v52 = InternalFormatInfo[1];
      long long v51 = InternalFormatInfo[2];
      long long v53 = *InternalFormatInfo;
      *(_OWORD *)&self->_presentRenderbufferInternalFormatInfo.rBits = *(long long *)((char *)InternalFormatInfo + 44);
      *(_OWORD *)&self->_presentRenderbufferInternalFormatInfo.bComponentType = v52;
      *(_OWORD *)&self->_presentRenderbufferInternalFormatInfo.sComponentType = v51;
      *(_OWORD *)&self->_presentRenderbufferInternalFormatInfo.internalFormat = v53;
      (*(void (**)(void, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                              + 5360))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36161, 36162, self->_presentRenderbufferResolution);
      (*(void (**)(void, uint64_t, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                              + 5360))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36161, 36163, &self->_presentRenderbufferResolution[1]);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5376))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, self->_presentFramebuffer);
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                        + 5432))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, 36064, 36161, self->_presentRenderbuffer);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5376))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, HIDWORD(v65));

      uint64_t v37 = v20;
    }
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, char *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                      + 5440))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, 36096, 36048, (char *)&v64 + 4);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t, long long *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                                          + 5440))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, 36128, 36048, &v64);
    if (*(void *)((char *)&v64 + 4) || v64)
    {
      v61[0] = _NSConcreteStackBlock;
      v61[1] = 3221225472;
      v61[2] = sub_C5C0;
      v61[3] = &unk_28740;
      v61[4] = self;
      v54 = objc_retainBlock(v61);
      if (DWORD2(v64))
      {
        int v55 = GPUTools::GL::DYIsAttachmentWritable();
        if (DWORD2(v64) == 36161) {
          [(DYEAGLDebugFunctionPlayer *)self _copyRenderbufferColorAttachmentToPresent:36064 color:0xFFFFFFFFLL isWireframe:0];
        }
        else {
          [(DYEAGLDebugFunctionPlayer *)self _copyTextureColorAttachmentToPresent:36064];
        }
      }
      else if (DWORD1(v64))
      {
        int v55 = GPUTools::GL::DYIsAttachmentWritable();
        [(DYEAGLDebugFunctionPlayer *)self _copyDepthOrStencilAttachmentToPresent:36096 type:DWORD1(v64)];
      }
      else
      {
        int v55 = GPUTools::GL::DYIsAttachmentWritable();
        [(DYEAGLDebugFunctionPlayer *)self _copyDepthOrStencilAttachmentToPresent:36128 type:v64];
      }
      if (v55)
      {
        if (v4)
        {
          (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]
                                                          + 5376))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, self->_wireframeFramebuffer);
          [(DYEAGLDebugFunctionPlayer *)self _copyRenderbufferColorAttachmentToPresent:36064 color:a4 isWireframe:1];
        }
      }
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5328))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36161, self->_presentRenderbuffer);
      v56 = [(DYEAGLDebugFunctionPlayer *)self strongLayerManager];
      [v56 prepareLayerForPresent:v37];

      [*(id *)&self->super.DYGLFunctionPlayer_opaque[v58] presentRenderbuffer:36161];
    }
    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5328))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36161, v65);
    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6] + 5376))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7], 36009, HIDWORD(v65));

    goto LABEL_39;
  }
}

- (void)_copyRenderbufferColorAttachmentToPresent:(unsigned int)a3 color:(unsigned int)a4 isWireframe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  unsigned int v27 = 0;
  uint64_t v9 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  uint64_t v10 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  (*(void (**)(void, uint64_t, void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                           + 5440))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 36009, *(void *)&a3, 36049, &v27);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 5328))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 36161, v27);
  objc_super v21 = 0;
  double v22 = 0;
  unsigned int v24 = 0;
  uint64_t v23 = 0;
  uint64_t v25 = 0x100000001;
  v26[0] = 0;
  *(void *)((char *)v26 + 5) = 0;
  [(DYEAGLDebugFunctionPlayer *)self _imageInfoForAttachment:v7 outImageInfo:&v21];
  if (v5)
  {
    uint64_t v12 = 1;
  }
  else if (GPUTools::GL::IsIntegerFormat((GPUTools::GL *)HIDWORD(v21), v11))
  {
    if (GPUTools::GL::IsSignedType((GPUTools::GL *)v22, v13)) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 3;
    }
  }
  else
  {
    uint64_t v12 = 0;
  }
  if (SHIDWORD(v26[0]) < 1)
  {
    [(DYEAGLDebugFunctionPlayer *)self _copyColorAttachmentToPresentTexture:v7 imageInfo:&v21];
    [(DYEAGLDebugFunctionPlayer *)self _renderPresentTextureWithColor:v6 enableBlend:v5 texBlitProgram:v12];
  }
  else
  {
    unsigned int v20 = 0;
    (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                            + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 36006, &v20);
    unsigned int v19 = 0;
    (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                            + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 36010, &v19);
    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 5376))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 36008, v20);
    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 5376))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 36009, self->_presentFramebuffer);
    if (self->_presentRenderbufferResolution[0] == v24
      && self->_presentRenderbufferResolution[1] == v25
      && self->_presentRenderbufferInternalFormatInfo.internalFormat == HIDWORD(v22))
    {
      uint64_t v14 = *(void *)&self->super.DYGLFunctionPlayer_opaque[v9];
      uint64_t v15 = *(void *)&self->super.DYGLFunctionPlayer_opaque[v10];
      if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                     + 104) < 3uLL)
        (*(void (**)(uint64_t))(v14 + 8208))(v15);
      else {
        (*(void (**)(uint64_t, void, void))(v14 + 6040))(v15, 0, 0);
      }
    }
    else
    {
      unsigned int v18 = 0;
      (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                              + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 32873, &v18);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 40))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 3553, self->_presentTexture);
      [(DYEAGLDebugFunctionPlayer *)self _changeTextureToWidth:v24 height:v25 imageFormatInfo:&v21 texels:0];
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, void, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                                                + 5416))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 36009, v7, 3553, self->_presentTexture, 0);
      uint64_t v16 = *(void *)&self->super.DYGLFunctionPlayer_opaque[v9];
      uint64_t v17 = *(void *)&self->super.DYGLFunctionPlayer_opaque[v10];
      if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                     + 104) < 3uLL)
        (*(void (**)(uint64_t))(v16 + 8208))(v17);
      else {
        (*(void (**)(uint64_t, void, void))(v16 + 6040))(v17, 0, 0);
      }
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                                        + 5432))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 36009, v7, 36161, self->_presentRenderbuffer);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 40))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 3553, v18);
      [(DYEAGLDebugFunctionPlayer *)self _renderPresentTextureWithColor:v6 enableBlend:v5 texBlitProgram:v12];
    }
    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 5376))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 36008, v19);
  }
}

- (void)_copyTextureColorAttachmentToPresent:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  int v12 = 0;
  uint64_t v11 = 0;
  uint64_t v13 = 0x100000001;
  v14[0] = 0;
  *(void *)((char *)v14 + 5) = 0;
  [(DYEAGLDebugFunctionPlayer *)self _imageInfoForAttachment:*(void *)&a3 outImageInfo:&v9];
  [(DYEAGLDebugFunctionPlayer *)self _copyColorAttachmentToPresentTexture:v3 imageInfo:&v9];
  int IsIntegerFormat = GPUTools::GL::IsIntegerFormat((GPUTools::GL *)HIDWORD(v9), v5);
  uint64_t v8 = 0;
  if (IsIntegerFormat)
  {
    if (GPUTools::GL::IsSignedType((GPUTools::GL *)v10, v7)) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = 3;
    }
  }
  [(DYEAGLDebugFunctionPlayer *)self _renderPresentTextureWithColor:0xFFFFFFFFLL enableBlend:0 texBlitProgram:v8];
}

- (void)_copyColorAttachmentToPresentTexture:(unsigned int)a3 imageInfo:(ImageInfo *)a4
{
  uint64_t v5 = *(void *)&a3;
  unsigned int v12 = 0;
  uint64_t v7 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  uint64_t v8 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                          + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 36006, &v12);
  unsigned int v11 = 0;
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v8], 36010, &v11);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 5376))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v8], 36008, v12);
  unsigned int v10 = 0;
  (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v8], 32873, &v10);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 40))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v8], 3553, self->_presentTexture);
  [(DYEAGLDebugFunctionPlayer *)self _changeTextureToWidth:a4->var2 height:a4->var3 imageFormatInfo:a4 texels:0];
  if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                 + 104) < 3uLL)
  {
    (*(void (**)(void, uint64_t, void, void, void, void, void, void, int))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7]
                                                                                                 + 448))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v8], 3553, 0, 0, 0, 0, 0, a4->var2, a4->var3);
  }
  else
  {
    unsigned int v9 = 0;
    (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7]
                                                            + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v8], 3074, &v9);
    (*(void (**)(void, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 1888))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v8], v5);
    (*(void (**)(void, uint64_t, void, void, void, void, void, void, int))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7]
                                                                                                 + 448))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v8], 3553, 0, 0, 0, 0, 0, a4->var2, a4->var3);
    (*(void (**)(void, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 1888))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v8], v9);
  }
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 40))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v8], 3553, v10);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 5376))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v8], 36008, v11);
}

- (void)_copyDepthOrStencilAttachmentToPresent:(unsigned int)a3 type:(unsigned int)a4
{
  v38[0] = 0;
  uint64_t v6 = [(DYEAGLDebugFunctionPlayer *)self context];
  sub_7E98(v37, v6);

  v36[0] = v37;
  v36[1] = [(DYEAGLDebugFunctionPlayer *)self gliDispatch];
  uint64_t v7 = [(DYEAGLDebugFunctionPlayer *)self captureSessionInfo];
  uint64_t v8 = [v7 contextInfoForContext:[self ctxID]];
  [v8 api];

  GPUTools::GL::GetFramebufferAttachmentInfo();
  unsigned int v28 = 0;
  uint64_t v29 = 0x100000001;
  memset(v30, 0, 13);
  GPUTools::GL::GetImageInfo();
  memset(memptr, 0, sizeof(memptr));
  malloc_type_posix_memalign(memptr, 8uLL, 0, 0xCE3729EBuLL);
  if (memptr[0])
  {
    if (v32 == 36161)
    {
      uint64_t v9 = OBJC_IVAR___DYGLFunctionPlayer__disp;
      uint64_t v10 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
      (*(void (**)(void, uint64_t, _DWORD *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                        + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 36007, v38);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 5328))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 36161, v31);
    }
    else
    {
      *(void *)((char *)&v23 + 7) = 0;
      *(void *)&long long v23 = 0;
      GPUTools::GL::DYGetTextureTargetInfo();
      uint64_t v9 = OBJC_IVAR___DYGLFunctionPlayer__disp;
      uint64_t v10 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
      (*(void (**)(void, void, _DWORD *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                       + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 0, v38);
      (*(void (**)(void, void, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 40))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], v32, v31);
    }
    if (v32 == 34067) {
      unint64_t v11 = v33;
    }
    else {
      unint64_t v11 = v32;
    }
    if (a3 == 36096) {
      uint64_t v12 = 6402;
    }
    else {
      uint64_t v12 = 6401;
    }
    if (a3 == 36096) {
      uint64_t v13 = 5126;
    }
    else {
      uint64_t v13 = 5121;
    }
    long long v23 = xmmword_27830;
    uint64_t v24 = 0;
    uint64_t v25 = 0;
    __int16 v26 = 0;
    unsigned int v22 = 0;
    uint64_t v14 = (char *)(*(uint64_t (**)(void, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                             + 936))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 7939);
    strstr(v14, "GL_APPLE_row_bytes");
    GPUTools::GL::SavePixelStorePackState();
    memset(v20, 0, sizeof(v20));
    HIDWORD(v20[0]) = 1;
    int v21 = 0;
    GPUTools::GL::ApplyPixelStorePackState();
    uint64_t v16 = OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo;
    if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                   + 104) >= 3uLL)
    {
      (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9]
                                                              + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 35053, &v22);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 5136))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 35051, 0);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 1560))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 32875, v35);
    }
    uint64_t ShouldUseGLIReadTextureData = GPUTools::GL::ShouldUseGLIReadTextureData((GPUTools::GL *)v36, v15);
    GPUTools::GL::GetImageData((GPUTools::GL *)v36, (const Dispatcher *)v11, v34, v12, v13, ShouldUseGLIReadTextureData, (uint64_t)memptr[0], v18);
    if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16] + 104) >= 3uLL) {
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 5136))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 35051, v22);
    }
    GPUTools::GL::ApplyPixelStorePackState();
    if (a3 == 36096) {
      +[DYEAGLDebugFunctionPlayer _resolveDepthWithWidth:v28 height:v29 numSamples:v30[1] buffer:memptr[0]];
    }
    else {
      +[DYEAGLDebugFunctionPlayer _resolveStencilWithWidth:v28 height:v29 numSamples:v30[1] buffer:memptr[0]];
    }
    uint64_t v19 = 40;
    if (v32 == 36161) {
      uint64_t v19 = 5328;
    }
    (*(void (**)(void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + v19))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10]);
    LODWORD(v20[0]) = 0;
    (*(void (**)(void, uint64_t, _OWORD *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 32873, v20);
    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 40))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 3553, self->_presentTexture);
    *(int32x2_t *)&long long v23 = vdup_n_s32(0x1909u);
    DWORD2(v23) = v13;
    [(DYEAGLDebugFunctionPlayer *)self _changeTextureToWidth:v28 height:v29 imageFormatInfo:&v23 texels:memptr[0]];
    free(memptr[0]);
    (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v9] + 40))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v10], 3553, LODWORD(v20[0]));
    [(DYEAGLDebugFunctionPlayer *)self _renderPresentTextureWithColor:0xFFFFFFFFLL enableBlend:0 texBlitProgram:0];
  }
  else
  {
    dy_abort();
    __break(1u);
  }
}

- (void)_renderPresentTextureWithColor:(unsigned int)a3 enableBlend:(BOOL)a4 texBlitProgram:(unsigned int)a5
{
  uint64_t v26 = a4;
  uint64_t v8 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] sharegroup];

  uint64_t v9 = [(DYEAGLDebugFunctionPlayer *)self strongLayerManager];
  uint64_t v10 = [v9 layerForID:v8];

  uint64_t v37 = 0;
  int v36 = 0;
  uint64_t v11 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  uint64_t v12 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  unsigned int v35 = v10;
  (*(void (**)(void, uint64_t, char *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                  + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 32873, (char *)&v37 + 4);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v11] + 40))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12], 3553, self->_presentTexture);
  (*(void (**)(void, uint64_t, void, uint64_t, uint64_t *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v11]
                                                                      + 1000))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12], 3553, 0, 4096, &v37);
  (*(void (**)(void, uint64_t, void, uint64_t, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v11]
                                                                  + 1000))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12], 3553, 0, 4097, &v36);
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v11] + 40))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12], 3553, HIDWORD(v37));
  int v14 = v36;
  int v13 = v37;
  [v10 bounds];
  double v16 = v15;
  double v18 = v17;
  [v10 contentsScale];
  double v20 = v19;
  [v10 contentsScale];
  int v21 = v26;
  double v22 = v16 * v20;
  double v24 = v18 * v23;
  +[DYEAGLDebugFunctionPlayer shrinkSourceSize:toDestSize:](DYEAGLDebugFunctionPlayer, "shrinkSourceSize:toDestSize:", (double)v13, (double)v14, v22, v18 * v23);
  LODWORD(v26) = vcvtpd_s64_f64(v25);
  uint64_t v28 = vcvtpd_s64_f64(v27);
  int v29 = (int)v24;
  if ((int)v22 >= (int)v26) {
    int v30 = (int)v22 - v26;
  }
  else {
    int v30 = (int)v22 - v26 + 1;
  }
  if (v29 >= (int)v28) {
    int v31 = v29 - v28;
  }
  else {
    int v31 = v29 - v28 + 1;
  }
  (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v11] + 5376))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12], 36009, self->_presentFramebuffer);
  (*(void (**)(void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v11] + 720))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v12]);
  if (v21) {
    uint64_t v32 = 0;
  }
  else {
    uint64_t v32 = 0x4000;
  }
  LODWORD(v34) = a5;
  BYTE5(v33) = 0;
  BYTE4(v33) = v21;
  LODWORD(v33) = a3;
  -[DYEAGLFunctionPlayer drawTexture:target:framebuffer:bounds:clearBits:modulateColor:enableBlend:rotated:texBlitProgram:](self, "drawTexture:target:framebuffer:bounds:clearBits:modulateColor:enableBlend:rotated:texBlitProgram:", self->_presentTexture, 3553, self->_presentFramebuffer, (v30 >> 1) | ((unint64_t)(v31 >> 1) << 32), v26 | (v28 << 32), v32, v33, v34);
}

- (void)_changeTextureToWidth:(int)a3 height:(int)a4 imageFormatInfo:(ImageFormatInfo *)a5 texels:(char *)a6
{
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  uint64_t v23 = 0;
  uint64_t v24 = 0;
  *(_DWORD *)uint64_t v26 = 0;
  uint64_t v25 = 0;
  *(void *)&v26[4] = 0x100000001;
  v27[0] = 0;
  *(void *)((char *)v27 + 5) = 0;
  uint64_t v11 = [(DYEAGLDebugFunctionPlayer *)self context];
  sub_7E98(v22, v11);

  double v20 = v22;
  id v21 = [(DYEAGLDebugFunctionPlayer *)self gliDispatch];
  uint64_t v12 = [(DYEAGLDebugFunctionPlayer *)self captureSessionInfo];
  int v13 = [v12 contextInfoForContext:[self ctxID]];
  [v13 api];

  GPUTools::GL::GetImageInfo();
  if (*(void *)v26 != __PAIR64__(v8, v9) || a6 || v23 != a5->var0)
  {
    unsigned int v19 = 0;
    uint64_t v14 = OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo;
    uint64_t v15 = OBJC_IVAR___DYGLFunctionPlayer__disp;
    uint64_t v16 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
    if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                   + 104) > 2uLL)
    {
      (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                              + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 35055, &v19);
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v15] + 5136))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16], 35052, 0);
    }
    double v17 = (char *)(*(uint64_t (**)(void, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v15]
                                                             + 936))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16], 7939);
    strstr(v17, "GL_APPLE_row_bytes");
    GPUTools::GL::SavePixelStoreUnpackState();
    long long v18 = 0u;
    HIDWORD(v18) = 1;
    GPUTools::GL::ApplyPixelStoreUnpackState();
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v15]
                                                              + 2432))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16], 3553, 10241, 9728);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v15]
                                                              + 2432))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16], 3553, 10240, 9728);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v15]
                                                              + 2432))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16], 3553, 10242, 33071);
    (*(void (**)(void, uint64_t, uint64_t, uint64_t))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v15]
                                                              + 2432))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16], 3553, 10243, 33071);
    (*(void (**)(void, uint64_t, void, void, uint64_t, uint64_t, void, void, unsigned int, char *, void, void, void, void, _DWORD))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v15] + 2408))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16], 3553, 0, *(&a5->var0 + (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v14] + 104) < 3uLL)), v9, v8, 0, a5->var1, a5->var2, a6, 0, *((void *)&v18 + 1), 0, 0, 0);
    GPUTools::GL::ApplyPixelStoreUnpackState();
    if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v14] + 104) >= 3uLL) {
      (*(void (**)(void, uint64_t, void))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v15] + 5136))(*(void *)&self->super.DYGLFunctionPlayer_opaque[v16], 35052, v19);
    }
  }
}

- (void)_imageInfoForAttachment:(unsigned int)a3 outImageInfo:(ImageInfo *)a4
{
  uint64_t v5 = [(DYEAGLDebugFunctionPlayer *)self context];
  sub_7E98(v8, v5);

  [(DYEAGLDebugFunctionPlayer *)self gliDispatch];
  uint64_t v6 = [(DYEAGLDebugFunctionPlayer *)self captureSessionInfo];
  uint64_t v7 = [v6 contextInfoForContext:[self ctxID]];
  [v7 api];

  GPUTools::GL::GetFramebufferAttachmentInfo();
  GPUTools::GL::GetImageInfo();
}

- (BOOL)_isBoundObjectAlive:(unsigned int)a3 isObjectFunc:(void *)a4
{
  int v8 = 0;
  uint64_t v6 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  (*(void (**)(void, void, int *))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                + 832))(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], *(void *)&a3, &v8);
  return !v8 || ((unsigned int (*)(void))a4)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v6]) == 1;
}

- (BOOL)_isContextModifiable
{
  uint64_t v3 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  if (![(DYEAGLDebugFunctionPlayer *)self _isBoundObjectAlive:34965 isObjectFunc:*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp] + 5160)]|| ![(DYEAGLDebugFunctionPlayer *)self _isBoundObjectAlive:36006 isObjectFunc:*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5368)]|| ![(DYEAGLDebugFunctionPlayer *)self _isBoundObjectAlive:36010 isObjectFunc:*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5368)]|| ![(DYEAGLDebugFunctionPlayer *)self _isBoundObjectAlive:36007 isObjectFunc:*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5320)])
  {
    return 0;
  }
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 1;
  BOOL v4 = [(DYEAGLDebugFunctionPlayer *)self context];
  sub_7E98(v10, v4);

  [(DYEAGLDebugFunctionPlayer *)self gliDispatch];
  uint64_t v5 = [(DYEAGLDebugFunctionPlayer *)self captureSessionInfo];
  uint64_t v6 = [v5 contextInfoForContext:[self ctxID]];
  [v6 api];

  GPUTools::GL::EnumerateTextureTargets();
  BOOL v8 = 0;
  if (*((unsigned char *)v12 + 24))
  {
    uint64_t v7 = OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo;
    if (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo]
                   + 104) < 2uLL
      || [(DYEAGLDebugFunctionPlayer *)self _isBoundObjectAlive:33370 isObjectFunc:*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 6600)]&& (*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v7] + 104) < 3uLL|| [(DYEAGLDebugFunctionPlayer *)self _isBoundObjectAlive:35053 isObjectFunc:*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5160)]&& [(DYEAGLDebugFunctionPlayer *)self _isBoundObjectAlive:35055 isObjectFunc:*(void *)(*(void *)&self->super.DYGLFunctionPlayer_opaque[v3] + 5160)]))
    {
      BOOL v8 = 1;
    }
  }

  _Block_object_dispose(&v11, 8);
  return v8;
}

- (void)prepareForCaptureExecution
{
  uint64_t v3 = OBJC_IVAR___DYFunctionPlayer__engine;
  BOOL v4 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__engine] delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    goto LABEL_5;
  }
  uint64_t v6 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate];
  [v6 prepareForCaptureExecution];

  uint64_t v7 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate];
  unsigned int v8 = [v7 shouldCallSuper];

  if (v8)
  {
    v12.receiver = self;
    v12.super_class = (Class)DYEAGLDebugFunctionPlayer;
    [(DYEAGLDebugFunctionPlayer *)&v12 prepareForCaptureExecution];
  }
  uint64_t v9 = [*(id *)&self->super.DYGLFunctionPlayer_opaque[v3] delegate];
  unsigned __int8 v10 = [v9 shouldReturn];

  if ((v10 & 1) == 0)
  {
LABEL_5:
    v11.receiver = self;
    v11.super_class = (Class)DYEAGLDebugFunctionPlayer;
    [(DYEAGLDebugFunctionPlayer *)&v11 prepareForCaptureExecution];
  }
}

- (void).cxx_destruct
{
  sub_5D7C((uint64_t)&self->_shaderWireframeRenderer);
  sub_5A30((GPUTools::GL::WireframeRenderer *)&self->_fixedWireframeRenderer);
  objc_storeStrong((id *)&self->_disabledFunctions, 0);

  objc_storeStrong((id *)&self->_sharegroupSet, 0);
}

- (id).cxx_construct
{
  *((void *)self + 148) = off_28660;
  *((void *)self + 149) = 0;
  *((void *)self + 150) = 0;
  *((void *)self + 151) = 0;
  *((void *)self + 152) = off_286C8;
  *((void *)self + 159) = 0;
  *(_OWORD *)((char *)self + 1256) = 0u;
  *(_OWORD *)((char *)self + 1240) = 0u;
  *(_OWORD *)((char *)self + 1224) = 0u;
  *((_DWORD *)self + 320) = 1065353216;
  *(_OWORD *)((char *)self + 1304) = 0u;
  *(_OWORD *)((char *)self + 1288) = 0u;
  *((_DWORD *)self + 330) = 1065353216;
  *((_OWORD *)self + 83) = 0u;
  *((_OWORD *)self + 84) = 0u;
  *((_DWORD *)self + 340) = 1065353216;
  *(_OWORD *)((char *)self + 1384) = 0u;
  *(_OWORD *)((char *)self + 1368) = 0u;
  *((_DWORD *)self + 350) = 1065353216;
  *((_OWORD *)self + 88) = 0u;
  *((_OWORD *)self + 89) = 0u;
  *((_DWORD *)self + 360) = 1065353216;
  *(_OWORD *)((char *)self + 1448) = 0u;
  *(_OWORD *)((char *)self + 1464) = 0u;
  *((_DWORD *)self + 370) = 1065353216;
  return self;
}

@end