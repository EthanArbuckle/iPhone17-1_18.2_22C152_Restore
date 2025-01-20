@interface DYEAGLFunctionPlayer
- (BOOL)_linkProgram:(GLSLObject)a3 dispatcher:(Dispatcher *)a4;
- (BOOL)isFrameBoundary;
- (BOOL)shouldExecuteGraphicsFunction;
- (DYLayerManager)layerManager;
- (DYLayerManager)strongLayerManager;
- (id).cxx_construct;
- (id)currentRenderbufferDrawableMap;
- (unint64_t)_generateDrawableId;
- (unsigned)_loadShaderWithType:(unsigned int)a3 source:(const char *)a4 dispatcher:(Dispatcher *)a5;
- (unsigned)_loadSimpleProgramWithVertexSource:(const char *)a3 fragmentSource:(const char *)a4 link:(BOOL)a5 dispatcher:(Dispatcher *)a6;
- (void)_createIOSurfaceReplacementForFramebuffer:(FramebufferInfo *)a3;
- (void)_destroyDrawableId:(unint64_t)a3;
- (void)_transformCoreAnimationLayer:(id)a3 rotated:(BOOL)a4;
- (void)createEAGLContextWithAPI:(unint64_t)a3 sharegroupID:(unint64_t)a4 contextID:(unint64_t)a5;
- (void)drawTexture:(unsigned int)a3 target:(unsigned int)a4 framebuffer:(unsigned int)a5 bounds:(IntegerRect)a6 clearBits:(unsigned int)a7 modulateColor:(unsigned int)a8 enableBlend:(BOOL)a9 rotated:(BOOL)a10 texBlitProgram:(unsigned int)a11;
- (void)executePlatformFunction;
- (void)initializeNewSharegroupInfoDictionary;
- (void)newContextInfo;
- (void)setLayerManager:(id)a3;
@end

@implementation DYEAGLFunctionPlayer

- (DYLayerManager)strongLayerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerManager);

  return (DYLayerManager *)WeakRetained;
}

- (void)newContextInfo
{
}

- (void)initializeNewSharegroupInfoDictionary
{
  v8.receiver = self;
  v8.super_class = (Class)DYEAGLFunctionPlayer;
  [(DYEAGLFunctionPlayer *)&v8 initializeNewSharegroupInfoDictionary];
  uint64_t v3 = OBJC_IVAR___DYGLFunctionPlayer__sharegroup_dict;
  v4 = *(void **)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__sharegroup_dict];
  v5 = [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] sharegroup];
  [v4 setObject:v5 forKey:@"sharegroup"];

  v6 = *(void **)&self->DYGLFunctionPlayer_opaque[v3];
  v7 = +[NSMutableDictionary dictionary];
  [v6 setObject:v7 forKey:@"renderbuffer_drawable_map"];
}

- (id)currentRenderbufferDrawableMap
{
  if (*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx])
  {
    v2 = [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__sharegroup_dict] objectForKey:@"renderbuffer_drawable_map"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

- (void)createEAGLContextWithAPI:(unint64_t)a3 sharegroupID:(unint64_t)a4 contextID:(unint64_t)a5
{
  unint64_t v12 = a5;
  if (sub_8CB4(&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__contextInfoMap], &v12))
  {
    [(DYEAGLFunctionPlayer *)self setCurrentContext:v12];
    if (!self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__recreateContexts]) {
      return;
    }
    [(DYEAGLFunctionPlayer *)self deleteCurrentContext];
  }
  objc_super v8 = [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__sharegroupMap] objectForIntKey:a4];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 objectForKey:@"sharegroup"];
    id v11 = [objc_alloc((Class)EAGLContext) initWithAPI:a3 sharegroup:v10];
  }
  else
  {
    id v11 = [objc_alloc((Class)EAGLContext) initWithAPI:a3];
  }
  [(DYEAGLFunctionPlayer *)self updateCurrentStateWithNewContext:v11 contextID:v12 sharegroupID:a4];
  *(void *)(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo] + 104) = a3;
}

- (BOOL)isFrameBoundary
{
  unsigned int v2 = **(_DWORD **)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function] + 8190;
  return (v2 < 0xD) & (0x1811u >> v2);
}

- (void)executePlatformFunction
{
  uint64_t v3 = OBJC_IVAR___DYFunctionPlayer__function;
  v4 = *(int **)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
  v5 = (unint64_t ***)(v4 + 12);
  int v6 = *v4;
  uint64_t v7 = OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo;
  uint64_t v8 = *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo];
  switch(*v4)
  {
    case -8192:
    case -8191:
      uint64_t v28 = **((void **)v4 + 9);
      uint64_t v29 = **((void **)v4 + 12);
      uint64_t v30 = **((void **)v4 + 6);
      [(DYEAGLFunctionPlayer *)self createEAGLContextWithAPI:v28 sharegroupID:v29 contextID:v30];
      return;
    case -8190:
    case -8179:
    case -8178:
      v9 = (GPUTools::GL *)**((unsigned int **)v4 + 9);
      uint64_t renderbuffer_binding_enum = GPUTools::GL::dy_get_renderbuffer_binding_enum(v9, a2);
      LODWORD(v73[0]) = 0;
      (*(void (**)(void, uint64_t, _OWORD *))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                        + 832))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], renderbuffer_binding_enum, v73);
      if (LODWORD(v73[0]))
      {
        id v11 = [(DYEAGLFunctionPlayer *)self currentRenderbufferDrawableMap];
        unint64_t v12 = +[NSNumber numberWithUnsignedInt:LODWORD(v73[0])];
        v13 = [v11 objectForKey:v12];
        id v14 = [v13 unsignedLongLongValue];

        v15 = [(DYEAGLFunctionPlayer *)self strongLayerManager];
        v16 = [v15 layerForID:v14];

        v17 = [(DYEAGLFunctionPlayer *)self strongLayerManager];
        [v17 prepareLayerForPresent:v16];
      }
      switch(v6)
      {
        case -8178:
          [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] presentRenderbuffer:v9 afterMinimumDuration:sub_F08C((uint64_t)(v4 + 24), 0).n64_f64[0]];
          break;
        case -8179:
          [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] presentRenderbuffer:atTime:sub_F08C((uint64_t)(v4 + 24), 0).n64_f64[0]];
          break;
        case -8190:
          [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] presentRenderbuffer:v9];
          break;
      }
      return;
    case -8189:
      uint64_t v38 = **((void **)v4 + 12);
      if (v38)
      {
        v39 = (GPUTools::GL *)**((unsigned int **)v4 + 9);
        uint64_t v40 = GPUTools::GL::dy_get_renderbuffer_binding_enum(v39, a2);
        LODWORD(v73[0]) = 0;
        (*(void (**)(void, uint64_t, _OWORD *))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                          + 832))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], v40, v73);
        v41 = DYGetGLGuestAppClient();
        unsigned int v42 = [v41 traceMode];

        if (v42 != 6)
        {
          v43 = [(DYEAGLFunctionPlayer *)self strongLayerManager];
          id v44 = [v43 layerForID:v38];

          [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] renderbufferStorage:v39 fromDrawable:v44];
          +[CATransaction flush];
          v45 = [(DYEAGLFunctionPlayer *)self currentRenderbufferDrawableMap];
          v46 = +[NSNumber numberWithUnsignedLongLong:v38];
          v47 = +[NSNumber numberWithUnsignedInt:LODWORD(v73[0])];
          [v45 setObject:v46 forKey:v47];

          goto LABEL_80;
        }
      }
      return;
    case -8188:
      [(DYEAGLFunctionPlayer *)self createEAGLContextWithAPI:**((void **)v4 + 9) sharegroupID:**((void **)v4 + 15) contextID:**((void **)v4 + 6)];
      uint64_t v51 = *(void *)&self->DYGLFunctionPlayer_opaque[v7];
      BOOL v53 = 1;
      if (v4[27] == 14)
      {
        v52 = (char *)*((void *)v4 + 12);
        if (!strstr(v52, "\"EAGLContextPropertyClientRetainRelease\":true")
          || strstr(v52, "\"EAGLContextPropertyVisibleInDebugTools\":true"))
        {
          BOOL v53 = 0;
        }
      }
      *(unsigned char *)(v51 + 240) = v53;
      return;
    case -8187:
    case -8180:
      *(void *)((char *)v73 + 7) = 0;
      GPUTools::GL::DYGetTextureTargetInfo();
      LODWORD(v77) = 0;
      (*(void (**)(void, void, unint64_t **))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                  + 832))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 0, &v77);
      sub_10CB0(v8 + 160, (unsigned int *)&v77, &v77);
      return;
    case -8186:
      if (!*(_DWORD *)(v8 + 112)) {
        return;
      }
      v31 = DYGetGLGuestAppClient();
      unsigned int v32 = [v31 traceMode];

      if (v32 != 6)
      {
        v54 = sub_9D28((void *)(v8 + 120), (unsigned int *)(v8 + 112));
        if ((*(unsigned char *)(*(void *)&self->DYGLFunctionPlayer_opaque[v3] + 4) & 4) != 0)
        {
          if (!v54) {
            return;
          }
        }
        else if (!v54)
        {
          __assert_rtn("-[DYEAGLFunctionPlayer executePlatformFunction]", (const char *)&unk_26519, 0, "iter != ctx_info->fb_info_map.end()");
        }
        uint64_t v55 = *((unsigned int *)v54 + 5);
        id v44 = [(DYEAGLFunctionPlayer *)self currentRenderbufferDrawableMap];
        v56 = +[NSNumber numberWithUnsignedInt:v55];
        v57 = [v44 objectForKeyedSubscript:v56];

        if (!v57) {
          __assert_rtn("-[DYEAGLFunctionPlayer executePlatformFunction]", (const char *)&unk_26519, 0, "drawable_obj");
        }
        id v58 = [v57 unsignedLongLongValue];
        v59 = [(DYEAGLFunctionPlayer *)self strongLayerManager];
        v60 = [v59 layerForID:v58];

        if (!v60) {
          __assert_rtn("-[DYEAGLFunctionPlayer executePlatformFunction]", (const char *)&unk_26519, 0, "layer");
        }
        LODWORD(v73[0]) = 0;
        uint64_t v61 = OBJC_IVAR___DYGLFunctionPlayer__disp;
        uint64_t v62 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
        (*(void (**)(void, uint64_t, _OWORD *))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                          + 832))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 36007, v73);
        (*(void (**)(void, uint64_t, uint64_t))(*(void *)&self->DYGLFunctionPlayer_opaque[v61] + 5328))(*(void *)&self->DYGLFunctionPlayer_opaque[v62], 36161, v55);
        v63 = [(DYEAGLFunctionPlayer *)self strongLayerManager];
        [v63 prepareLayerForPresent:v60];

        [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] presentRenderbuffer:36161];
        (*(void (**)(void, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v61] + 5328))(*(void *)&self->DYGLFunctionPlayer_opaque[v62], 36161, LODWORD(v73[0]));
        goto LABEL_79;
      }
      v33 = *(void **)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
      [v33 presentRenderbuffer:36161];
      return;
    case -8185:
      v77 = **v5;
      v34 = *(void **)(v8 + 216);
      if (!v34) {
        goto LABEL_35;
      }
      do
      {
        while (1)
        {
          v35 = sub_8CB4(v34 + 3, (unint64_t *)&v77);
          if (v35)
          {
            sub_9DDC(v34 + 3, v35);
            if (!v34[6]) {
              break;
            }
          }
          v34 = (void *)*v34;
          if (!v34) {
            goto LABEL_35;
          }
        }
        v36 = [(DYEAGLFunctionPlayer *)self strongLayerManager];
        [v36 deleteLayer:v34[2]];

        v37 = (void *)*v34;
        sub_9E20((void *)(v8 + 200), v34, (uint64_t)v73);
        sub_85D0((uint64_t)v73, 0);
        v34 = v37;
      }
      while (v37);
LABEL_35:
      [(DYEAGLFunctionPlayer *)self deleteCurrentContext];
      return;
    case -8184:
      goto LABEL_22;
    case -8183:
      unint64_t v48 = 1.0;
      unint64_t v49 = 1.0;
      if (*((unsigned __int16 *)v4 + 5) >= 4u)
      {
        unint64_t v48 = sub_F08C((uint64_t)(v4 + 24), 0).n64_u64[0];
        unint64_t v49 = sub_F08C((uint64_t)(v4 + 30), 0).n64_u64[0];
      }
      *(void *)&v73[0] = v48;
      *((void *)&v73[0] + 1) = v49;
      v50 = [(DYEAGLFunctionPlayer *)self strongLayerManager];
      [v50 setTransform:v4 + 18 forLayerID:sub_11468((uint64_t)v5, 0) withScreenToLayerScale:v73];

      return;
    case -8182:
      id v71 = [(DYEAGLFunctionPlayer *)self strongLayerManager];
      [v71 setPosition:v4 + 18 forLayerID:sub_11468((uint64_t)v5, 0)];
      goto LABEL_48;
    case -8181:
      id v71 = [(DYEAGLFunctionPlayer *)self strongLayerManager];
      [v71 setAnchorPoint:v4 + 18 forLayerID:sub_11468((uint64_t)v5, 0)];
LABEL_48:

      return;
    default:
      if ((v6 + 12283) < 2) {
        return;
      }
      if (v6 != -12287)
      {
LABEL_22:
        v72.receiver = self;
        v72.super_class = (Class)DYEAGLFunctionPlayer;
        [(DYEAGLFunctionPlayer *)&v72 executePlatformFunction];
        return;
      }
      unint64_t v76 = **((void **)v4 + 6);
      unint64_t v18 = **((void **)v4 + 12);
      unint64_t v75 = v18;
      if (!v18) {
        return;
      }
      int v19 = **((unsigned __int8 **)v4 + 15);
      int v20 = **((_DWORD **)v4 + 18);
      double v21 = 1.0;
      if (*((unsigned __int16 *)v4 + 5) >= 6u)
      {
        v22.n64_u64[0] = sub_F08C((uint64_t)(v4 + 42), 0).n64_u64[0];
        if (v22.n64_f64[0] == 0.0) {
          return;
        }
        double v21 = v22.n64_f64[0];
      }
      v23.n64_u64[0] = sub_F08C((uint64_t)(v4 + 18), 0).n64_u64[0];
      v24.n64_u64[0] = sub_F08C((uint64_t)(v4 + 18), 1uLL).n64_u64[0];
      v25.n64_u64[0] = sub_F08C((uint64_t)(v4 + 18), 2uLL).n64_u64[0];
      v26.n64_u64[0] = sub_F08C((uint64_t)(v4 + 18), 3uLL).n64_u64[0];
      if (v20 <= 35906)
      {
        switch(v20)
        {
          case 32856:
            v27 = (id *)&kEAGLColorFormatRGBA8;
            break;
          case 35446:
            v27 = (id *)&kEAGLColorFormatRGBA_XR10_64BPP;
            break;
          case 35447:
            v27 = (id *)&kEAGLColorFormatSRGBA_XR10_64BPP;
            break;
          default:
            goto LABEL_85;
        }
      }
      else if (v20 > 37873)
      {
        if (v20 == 37874)
        {
          v27 = (id *)&kEAGLColorFormatSRGB_XR10;
        }
        else
        {
          if (v20 != 37881) {
            goto LABEL_85;
          }
          v27 = (id *)&kEAGLColorFormatSRGB_XR10_A8_2P;
        }
      }
      else
      {
        if (v20 != 35907)
        {
          if (v20 == 36194)
          {
            v27 = (id *)&kEAGLColorFormatRGB565;
            goto LABEL_73;
          }
LABEL_85:
          dy_abort();
          __break(1u);
          return;
        }
        v27 = (id *)&kEAGLColorFormatSRGBA8;
      }
LABEL_73:
      id v44 = *v27;
      v64 = +[NSNumber numberWithBool:v19 != 0];
      v57 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v64, kEAGLDrawablePropertyRetainedBacking, v44, kEAGLDrawablePropertyColorFormat, 0);

      v65 = [(DYEAGLFunctionPlayer *)self strongLayerManager];
      uint64_t v66 = [v65 layerForID:v18];

      if (v66)
      {
        v67 = [(DYEAGLFunctionPlayer *)self strongLayerManager];
        [v67 updateLayer:v66 contentRect:v57 contentsScale:v23.n64_f64[0] properties:v24.n64_f64[0] v25.n64_f64[0] v26.n64_f64[0] v21];

        v60 = (void *)v66;
      }
      else
      {
        v68 = [(DYEAGLFunctionPlayer *)self strongLayerManager];
        v60 = [v68 createLayerWithID:v18 contentRect:v57 contentsScale:0 properties:v23.n64_f64[0] isCoreAnimationSurface:v24.n64_f64[0] v25.n64_f64[0] v26.n64_f64[0] v21];

        if (!v60) {
          __assert_rtn("-[DYEAGLFunctionPlayer executePlatformFunction]", (const char *)&unk_26519, 0, "layer");
        }
      }
      v69 = sub_8CB4((void *)(v8 + 200), &v75);
      if (!v69)
      {
        memset(v73, 0, sizeof(v73));
        int v74 = 1065353216;
        v77 = &v75;
        v70 = sub_10ED0(v8 + 200, &v75, (uint64_t)&unk_27801, &v77);
        sub_11140((uint64_t)(v70 + 3), (uint64_t *)v73);
        sub_8014((uint64_t)v73);
        *(void *)&v73[0] = &v75;
        v69 = sub_10ED0(v8 + 200, &v75, (uint64_t)&unk_27801, (void **)v73);
      }
      sub_1124C((uint64_t)(v69 + 3), &v76, &v76);
LABEL_79:

LABEL_80:
      return;
  }
}

- (BOOL)shouldExecuteGraphicsFunction
{
  uint64_t v3 = *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
  int v4 = *(_DWORD *)v3;
  uint64_t v5 = *(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__currentContextInfo];
  if (*(int *)v3 > 839)
  {
    if (v4 > 889)
    {
      if (v4 != 890 && v4 != 987) {
        goto LABEL_30;
      }
    }
    else
    {
      if (v4 == 840)
      {
        DYReserveGLVAOs();
        return 0;
      }
      if (v4 != 858) {
        goto LABEL_30;
      }
    }
LABEL_33:
    DYReserveGLObjects();
    return 0;
  }
  if (v4 > 200)
  {
    switch(v4)
    {
      case 201:
      case 203:
      case 206:
      case 207:
      case 208:
        goto LABEL_33;
      default:
        goto LABEL_30;
    }
  }
  if (v4 == 116)
  {
    if ((*(_WORD *)(v3 + 46) & 0x10) == 0)
    {
      DYReserveGLProgram();
      return 0;
    }
  }
  else if (v4 == 117)
  {
    if ((*(_WORD *)(v3 + 46) & 0x10) == 0)
    {
      DYReserveGLShader();
      return 0;
    }
  }
  else if (v4 == 192 {
         && ([*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__captureSessionInfo] guestAppWasLinkedOnApexOrLater] & 1) == 0)
  }
  {
    uint64_t v6 = **(unsigned int **)(v3 + 96);
    if ((v6 & 0xFFFFFFDF) == 0x8D00)
    {
      uint64_t v7 = **(unsigned int **)(v3 + 72);
      uint64_t v8 = v3;
      int v9 = **(_DWORD **)(v3 + 144);
      if (v6 == 36096) {
        uint64_t v10 = 36128;
      }
      else {
        uint64_t v10 = 36096;
      }
      LODWORD(v47) = 0;
      uint64_t v11 = OBJC_IVAR___DYGLFunctionPlayer__disp;
      uint64_t v12 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
      (*(void (**)(void, uint64_t, uint64_t, uint64_t, unsigned int **))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                                 + 5440))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], v7, v10, 36048, &v47);
      if (v47 == 36161)
      {
        unsigned int v52 = 0;
        (*(void (**)(void, uint64_t, uint64_t, uint64_t, unsigned int *))(*(void *)&self->DYGLFunctionPlayer_opaque[v11]
                                                                                  + 5440))(*(void *)&self->DYGLFunctionPlayer_opaque[v12], v7, v10, 36049, &v52);
        if (v52 != v9 && v52 != 0)
        {
          unsigned int v51 = 0;
          (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->DYGLFunctionPlayer_opaque[v11]
                                                                  + 832))(*(void *)&self->DYGLFunctionPlayer_opaque[v12], 36007, &v51);
          (*(void (**)(void, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v11] + 5328))(*(void *)&self->DYGLFunctionPlayer_opaque[v12], 36161, v52);
          uint64_t v50 = 0;
          (*(void (**)(void, uint64_t, uint64_t, char *))(*(void *)&self->DYGLFunctionPlayer_opaque[v11]
                                                                   + 5360))(*(void *)&self->DYGLFunctionPlayer_opaque[v12], 36161, 36162, (char *)&v50 + 4);
          (*(void (**)(void, uint64_t, uint64_t, uint64_t *))(*(void *)&self->DYGLFunctionPlayer_opaque[v11]
                                                                      + 5360))(*(void *)&self->DYGLFunctionPlayer_opaque[v12], 36161, 36163, &v50);
          (*(void (**)(void, uint64_t, uint64_t, void, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v11]
                                                                           + 5352))(*(void *)&self->DYGLFunctionPlayer_opaque[v12], 36161, 35056, HIDWORD(v50), v50);
          (*(void (**)(void, uint64_t, uint64_t, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v11]
                                                                            + 5432))(*(void *)&self->DYGLFunctionPlayer_opaque[v12], v7, v6, 36161, v52);
          (*(void (**)(void, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v11] + 5328))(*(void *)&self->DYGLFunctionPlayer_opaque[v12], 36161, v51);
          return 0;
        }
      }
      uint64_t v3 = v8;
    }
  }
LABEL_30:
  if (!*(unsigned char *)(v5 + 240))
  {
    v49.receiver = self;
    v49.super_class = (Class)DYEAGLFunctionPlayer;
    return [(DYEAGLFunctionPlayer *)&v49 shouldExecuteGraphicsFunction];
  }
  if (v4 <= 126)
  {
    if (v4 == 17)
    {
      int v41 = **(_DWORD **)(v3 + 96);
      if (v41)
      {
        int v42 = **(_DWORD **)(v3 + 72);
        if (v42 == 36160 || v42 == 36009) {
          *(_DWORD *)(v5 + 112) = v41;
        }
      }
    }
    else if (v4 == 121)
    {
      uint64_t v19 = v3;
      uint64_t v20 = **(unsigned int **)(v3 + 72);
      if (v20)
      {
        double v21 = *(unsigned int **)(v19 + 96);
        do
        {
          if (*v21 == *(_DWORD *)(v5 + 112)) {
            *(_DWORD *)(v5 + 112) = 0;
          }
          __n64 v22 = sub_9D28((void *)(v5 + 120), v21);
          if (v22) {
            sub_9DDC((void *)(v5 + 120), v22);
          }
          ++v21;
          --v20;
        }
        while (v20);
      }
    }
  }
  else
  {
    switch(v4)
    {
      case 825:
        if (**(_DWORD **)(v3 + 96) == 35449)
        {
          __n64 v23 = (GPUTools::GL *)**(unsigned int **)(v3 + 72);
          int v24 = **(_DWORD **)(v3 + 120);
          unsigned int v52 = 0;
          uint64_t framebuffer_binding_enum = GPUTools::GL::dy_get_framebuffer_binding_enum(v23, a2);
          (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                  + 832))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], framebuffer_binding_enum, &v52);
          v47 = &v52;
          __n64 v26 = sub_115A0(v5 + 120, &v52, (uint64_t)&unk_27801, &v47);
          *((_DWORD *)v26 + 6) = v24;
          if (*((_DWORD *)v26 + 5))
          {
            v27 = v26;
            uint64_t v28 = [(DYEAGLFunctionPlayer *)self currentRenderbufferDrawableMap];
            uint64_t v29 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v27 + 5)];
            uint64_t v30 = [v28 objectForKeyedSubscript:v29];

            id v31 = [v30 unsignedLongLongValue];
            unsigned int v32 = [(DYEAGLFunctionPlayer *)self strongLayerManager];
            v33 = [v32 layerForID:v31];

            [(DYEAGLFunctionPlayer *)self _transformCoreAnimationLayer:v33 rotated:v24 == 35453];
          }
        }
        break;
      case 194:
        v34 = (GPUTools::GL *)**(unsigned int **)(v3 + 72);
        uint64_t v35 = **(unsigned int **)(v3 + 120);
        unsigned int v52 = **(_DWORD **)(v3 + 144);
        if (sub_9D28((void *)(v5 + 160), &v52))
        {
          uint64_t v37 = GPUTools::GL::dy_get_framebuffer_binding_enum(v34, v36);
          unsigned int v51 = 0;
          uint64_t v38 = OBJC_IVAR___DYGLFunctionPlayer__disp;
          uint64_t v39 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
          (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                                  + 832))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], v37, &v51);
          if (v51)
          {
            v47 = &v51;
            uint64_t v40 = sub_115A0(v5 + 120, &v51, (uint64_t)&unk_27801, &v47);
            if (!*((_DWORD *)v40 + 5)) {
              [(DYEAGLFunctionPlayer *)self _createIOSurfaceReplacementForFramebuffer:(char *)v40 + 20];
            }
            HIDWORD(v50) = 0;
            (*(void (**)(void, uint64_t, char *))(*(void *)&self->DYGLFunctionPlayer_opaque[v38] + 832))(*(void *)&self->DYGLFunctionPlayer_opaque[v39], 36007, (char *)&v50 + 4);
            (*(void (**)(void, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v38] + 5328))(*(void *)&self->DYGLFunctionPlayer_opaque[v39], 36161, *((unsigned int *)v40 + 5));
            v47 = 0;
            uint64_t v48 = 0;
            (*(void (**)(void, uint64_t, uint64_t, uint64_t *))(*(void *)&self->DYGLFunctionPlayer_opaque[v38]
                                                                        + 5360))(*(void *)&self->DYGLFunctionPlayer_opaque[v39], 36161, 36162, &v48);
            (*(void (**)(void, uint64_t, uint64_t, char *))(*(void *)&self->DYGLFunctionPlayer_opaque[v38]
                                                                     + 5360))(*(void *)&self->DYGLFunctionPlayer_opaque[v39], 36161, 36163, (char *)&v48 + 4);
            (*(void (**)(void, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v38] + 5328))(*(void *)&self->DYGLFunctionPlayer_opaque[v39], 36161, HIDWORD(v50));
            (*(void (**)(void))(*(void *)&self->DYGLFunctionPlayer_opaque[v38] + 720))(*(void *)&self->DYGLFunctionPlayer_opaque[v39]);
            LODWORD(v45) = 0;
            BYTE5(v44) = *((_DWORD *)v40 + 6) == 35453;
            BYTE4(v44) = 0;
            LODWORD(v44) = -1;
            -[DYEAGLFunctionPlayer drawTexture:target:framebuffer:bounds:clearBits:modulateColor:enableBlend:rotated:texBlitProgram:](self, "drawTexture:target:framebuffer:bounds:clearBits:modulateColor:enableBlend:rotated:texBlitProgram:", v52, v35, v51, v47, v48, 0, v44, v45);
            return 0;
          }
        }
        break;
      case 127:
        uint64_t v15 = v3;
        uint64_t v16 = **(unsigned int **)(v3 + 72);
        if (v16)
        {
          v17 = *(unsigned int **)(v15 + 96);
          do
          {
            unint64_t v18 = sub_9D28((void *)(v5 + 160), v17);
            if (v18) {
              sub_9DDC((void *)(v5 + 160), v18);
            }
            ++v17;
            --v16;
          }
          while (v16);
        }
        break;
    }
  }
  v46.receiver = self;
  v46.super_class = (Class)DYEAGLFunctionPlayer;
  return [(DYEAGLFunctionPlayer *)&v46 shouldExecuteGraphicsFunction];
}

- (unint64_t)_generateDrawableId
{
  p_ioSurfaceDrawableIdSet = &self->_ioSurfaceDrawableIdSet;
  for (i = &self->_nextIOSurfaceDrawableId;
        sub_8CB4(p_ioSurfaceDrawableIdSet, i);
  unint64_t v5 = *i;
  sub_117D0((uint64_t)p_ioSurfaceDrawableIdSet, &v5, &v5);
  unint64_t *i = ((unsigned __int16)*(_DWORD *)i + 1) & 0xFFF;
  return v5;
}

- (void)_destroyDrawableId:(unint64_t)a3
{
  unint64_t v3 = a3;
  sub_119EC(&self->_ioSurfaceDrawableIdSet.__table_.__bucket_list_.__ptr_.__value_, &v3);
}

- (void)_createIOSurfaceReplacementForFramebuffer:(FramebufferInfo *)a3
{
  unint64_t v5 = *(_DWORD ***)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYFunctionPlayer__function];
  unsigned int v6 = *v5[9];
  uint64_t v7 = *v5[15];
  uint64_t v8 = *v5[18];
  uint64_t v9 = (v8 + 1000000);
  uint64_t v10 = [(DYEAGLFunctionPlayer *)self currentRenderbufferDrawableMap];
  uint64_t v11 = +[NSNumber numberWithUnsignedInt:v9];
  unsigned int v31 = v6;
  uint64_t v12 = [v10 objectForKeyedSubscript:v11];

  uint64_t v13 = OBJC_IVAR___DYGLFunctionPlayer__disp;
  uint64_t v14 = OBJC_IVAR___DYGLFunctionPlayer__gli_ctx;
  if (v12)
  {
    uint64_t v15 = 0;
  }
  else
  {
    uint64_t v37 = 0;
    int v36 = 0;
    uint64_t v30 = v10;
    (*(void (**)(void, uint64_t, char *))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__disp]
                                                    + 832))(*(void *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__gli_ctx], 32873, (char *)&v37 + 4);
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)&self->DYGLFunctionPlayer_opaque[v13] + 40))(*(void *)&self->DYGLFunctionPlayer_opaque[v14], 3553, v8);
    (*(void (**)(void, uint64_t, void, uint64_t, uint64_t *))(*(void *)&self->DYGLFunctionPlayer_opaque[v13]
                                                                        + 1000))(*(void *)&self->DYGLFunctionPlayer_opaque[v14], v7, 0, 4096, &v37);
    (*(void (**)(void, uint64_t, void, uint64_t, int *))(*(void *)&self->DYGLFunctionPlayer_opaque[v13]
                                                                    + 1000))(*(void *)&self->DYGLFunctionPlayer_opaque[v14], v7, 0, 4097, &v36);
    (*(void (**)(void, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v13] + 40))(*(void *)&self->DYGLFunctionPlayer_opaque[v14], 3553, HIDWORD(v37));
    unint64_t v16 = [(DYEAGLFunctionPlayer *)self _generateDrawableId];
    v17 = +[NSNumber numberWithUnsignedLongLong:v16];
    unint64_t v18 = +[NSNumber numberWithUnsignedInt:v9];
    [v10 setObject:v17 forKeyedSubscript:v18];

    uint64_t v19 = [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__captureSessionInfo] deviceInfo];
    uint64_t v33 = 0;
    uint64_t v34 = 0;
    uint64_t v35 = 0;
    v27 = a3;
    uint64_t v28 = v19;
    if (v19)
    {
      [v19 mainScreenDescriptor];
      unsigned int v20 = HIDWORD(v34);
      unsigned int v21 = v35;
      unsigned int v22 = v34;
    }
    else
    {
      unsigned int v20 = 0;
      unsigned int v21 = 0;
      unsigned int v22 = 0;
    }
    __n64 v23 = [(DYEAGLFunctionPlayer *)self strongLayerManager];
    uint64_t v29 = [v23 layerForID:v16];

    int v24 = +[NSNumber numberWithBool:1];
    __n64 v25 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v24, kEAGLDrawablePropertyRetainedBacking, kEAGLColorFormatRGBA8, kEAGLDrawablePropertyColorFormat, 0);

    __n64 v26 = [(DYEAGLFunctionPlayer *)self strongLayerManager];
    uint64_t v15 = [v26 createLayerWithID:v16 contentRect:v25 contentsScale:1.0 properties:0.0 isCoreAnimationSurface:0.0 v22 / v21 v20 / v21 v21];

    a3 = v27;
    uint64_t v12 = 0;
    uint64_t v10 = v30;
    [(DYEAGLFunctionPlayer *)self _transformCoreAnimationLayer:v15 rotated:v27->var1 == 35453];
    unsigned int v32 = 0;
    (*(void (**)(void, uint64_t, unsigned int *))(*(void *)&self->DYGLFunctionPlayer_opaque[v13] + 832))(*(void *)&self->DYGLFunctionPlayer_opaque[v14], 36007, &v32);
    (*(void (**)(void, uint64_t, uint64_t))(*(void *)&self->DYGLFunctionPlayer_opaque[v13] + 5328))(*(void *)&self->DYGLFunctionPlayer_opaque[v14], 36161, v9);
    [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx] renderbufferStorage:36161 fromDrawable:v15];
    +[CATransaction flush];
    (*(void (**)(void, uint64_t, void))(*(void *)&self->DYGLFunctionPlayer_opaque[v13] + 5328))(*(void *)&self->DYGLFunctionPlayer_opaque[v14], 36161, v32);
  }
  (*(void (**)(void, void, uint64_t, uint64_t, uint64_t))(*(void *)&self->DYGLFunctionPlayer_opaque[v13]
                                                                    + 5432))(*(void *)&self->DYGLFunctionPlayer_opaque[v14], v31, 36064, 36161, v9);
  a3->var0 = v9;
}

- (unsigned)_loadShaderWithType:(unsigned int)a3 source:(const char *)a4 dispatcher:(Dispatcher *)a5
{
  uint64_t v11 = a4;
  uint64_t v6 = DYCreatePrivateGLShader();
  if (v6)
  {
    int size_4 = 0;
    ((void (*)(void, void, uint64_t, const char **, void))a5->var1->shader_source_ARB)(*((void *)a5->var0 + 2), v6, 1, &v11, 0);
    ((void (*)(void, void))a5->var1->compile_shader_ARB)(*((void *)a5->var0 + 2), v6);
    ((void (*)(void, uint64_t, uint64_t, int *))a5->var1->get_shaderiv)(*((void *)a5->var0 + 2), v6, 35713, &size_4);
    if (!size_4)
    {
      int size = 0;
      ((void (*)(void, uint64_t, uint64_t, int *))a5->var1->get_shaderiv)(*((void *)a5->var0 + 2), v6, 35716, &size);
      if (size >= 2)
      {
        uint64_t v7 = malloc_type_malloc(size, 0x7586B1F5uLL);
        ((void (*)(void, uint64_t, void, void, void *))a5->var1->get_shader_info_log)(*((void *)a5->var0 + 2), v6, size, 0, v7);
        free(v7);
      }
      ((void (*)(void, void))a5->var1->delete_object_ARB)(*((void *)a5->var0 + 2), v6);
      LODWORD(v6) = 0;
    }
  }
  return v6;
}

- (BOOL)_linkProgram:(GLSLObject)a3 dispatcher:(Dispatcher *)a4
{
  uint64_t v5 = *(void *)&a3.var0;
  int size_4 = 0;
  ((void (*)(void, void))a4->var1->link_program_ARB)(*((void *)a4->var0 + 2), a3.var0);
  ((void (*)(void, uint64_t, uint64_t, int *))a4->var1->get_programiv)(*((void *)a4->var0 + 2), v5, 35714, &size_4);
  if (!size_4)
  {
    int size = 0;
    ((void (*)(void, uint64_t, uint64_t, int *))a4->var1->get_programiv)(*((void *)a4->var0 + 2), v5, 35716, &size);
    if (size >= 2)
    {
      uint64_t v6 = malloc_type_malloc(size, 0x7AE92E80uLL);
      ((void (*)(void, uint64_t, void, void, void *))a4->var1->get_program_info_log)(*((void *)a4->var0 + 2), v5, size, 0, v6);
      free(v6);
    }
  }
  return size_4 != 0;
}

- (unsigned)_loadSimpleProgramWithVertexSource:(const char *)a3 fragmentSource:(const char *)a4 link:(BOOL)a5 dispatcher:(Dispatcher *)a6
{
  BOOL v7 = a5;
  unsigned int v10 = [(DYEAGLFunctionPlayer *)self _loadShaderWithType:35633 source:a3 dispatcher:a6];
  if (!v10) {
    return 0;
  }
  unsigned int v11 = v10;
  unsigned int v12 = [(DYEAGLFunctionPlayer *)self _loadShaderWithType:35632 source:a4 dispatcher:a6];
  if (!v12)
  {
    ((void (*)(void, void))a6->var1->delete_object_ARB)(*((void *)a6->var0 + 2), v11);
    return 0;
  }
  unsigned int v13 = v12;
  unsigned int v14 = DYCreatePrivateGLProgram();
  var1 = a6->var1;
  uint64_t v16 = *((void *)a6->var0 + 2);
  if (!v14)
  {
    ((void (*)(uint64_t, void))var1->delete_object_ARB)(v16, v11);
    ((void (*)(void, void))a6->var1->delete_object_ARB)(*((void *)a6->var0 + 2), v13);
    return v14;
  }
  ((void (*)(uint64_t, void, void))var1->attach_object_ARB)(v16, v14, v11);
  ((void (*)(void, void, void))a6->var1->attach_object_ARB)(*((void *)a6->var0 + 2), v14, v13);
  ((void (*)(void, void))a6->var1->delete_object_ARB)(*((void *)a6->var0 + 2), v11);
  ((void (*)(void, void))a6->var1->delete_object_ARB)(*((void *)a6->var0 + 2), v13);
  if (v7 && ![(DYEAGLFunctionPlayer *)self _linkProgram:v14 dispatcher:a6])
  {
    ((void (*)(void, void))a6->var1->delete_object_ARB)(*((void *)a6->var0 + 2), v14);
    return 0;
  }
  return v14;
}

- (void)drawTexture:(unsigned int)a3 target:(unsigned int)a4 framebuffer:(unsigned int)a5 bounds:(IntegerRect)a6 clearBits:(unsigned int)a7 modulateColor:(unsigned int)a8 enableBlend:(BOOL)a9 rotated:(BOOL)a10 texBlitProgram:(unsigned int)a11
{
  if ((byte_2EC50 & 1) == 0)
  {
    qword_2EBF0 = 2;
    qword_2EBF8 = (uint64_t)"attribute highp vec2 inVertex;                             \n"
                           "attribute highp vec2 inTexCoord;                           \n"
                           "attribute highp vec4 inColor;                              \n"
                           "                                                           \n"
                           "varying highp vec2 vTexCoord;                              \n"
                           "varying highp vec4 vColor;                                 \n"
                           "                                                           \n"
                           "void main() {                                              \n"
                           "    vTexCoord = inTexCoord;                                \n"
                           "    vColor = inColor;                                      \n"
                           "    gl_Position = vec4(inVertex, 0.0, 1.0);                \n"
                           "}                                                          \n";
    qword_2EC00 = (uint64_t)"uniform sampler2D tex2D;                                   \n"
                           "varying lowp vec2 vTexCoord;                               \n"
                           "varying lowp vec4 vColor;                                  \n"
                           "                                                           \n"
                           "void main() {                                              \n"
                           "    gl_FragColor = texture2D(tex2D, vTexCoord) * vColor;   \n"
                           "}                                                          \n";
    unk_2EC08 = 2;
    qword_2EC10 = (uint64_t)"attribute highp vec2 inVertex;                             \n"
                           "attribute highp vec2 inTexCoord;                           \n"
                           "attribute highp vec4 inColor;                              \n"
                           "                                                           \n"
                           "varying highp vec2 vTexCoord;                              \n"
                           "varying highp vec4 vColor;                                 \n"
                           "                                                           \n"
                           "void main() {                                              \n"
                           "    vTexCoord = inTexCoord;                                \n"
                           "    vColor = inColor;                                      \n"
                           "    gl_Position = vec4(inVertex, 0.0, 1.0);                \n"
                           "}                                                          \n";
    unk_2EC18 = "uniform sampler2D tex2D;                                   \n"
                "varying lowp vec2 vTexCoord;                               \n"
                "varying lowp vec4 vColor;                                  \n"
                "                                                           \n"
                "void main() {                                              \n"
                "    gl_FragColor = texture2D(tex2D, vTexCoord).rrrr * vColor;  \n"
                "}                                                          \n";
    qword_2EC20 = 3;
    unk_2EC28 = "#version 300 es                                            \n"
                "in vec2 inVertex;                                          \n"
                "in vec2 inTexCoord;                                        \n"
                "in vec4 inColor;                                           \n"
                "                                                           \n"
                "out vec2 vTexCoord;                                        \n"
                "out vec4 vColor;                                           \n"
                "                                                           \n"
                "void main() {                                              \n"
                "    vTexCoord = inTexCoord;                                \n"
                "    vColor = inColor;                                      \n"
                "    gl_Position = vec4(inVertex, 0.0, 1.0);                \n"
                "}                                                          \n";
    qword_2EC30 = (uint64_t)"#version 300 es                                            \n"
                           "uniform highp isampler2D tex2D;                            \n"
                           "uniform highp vec2 range;                                  \n"
                           "in lowp vec2 vTexCoord;                                    \n"
                           "in lowp vec4 vColor;                                       \n"
                           "                                                           \n"
                           "out highp vec4 fragData;                                   \n"
                           "                                                           \n"
                           "void main() {                                              \n"
                           "   highp vec4 texel = vec4(texture(tex2D, vTexCoord));           \n"
                           "   fragData = (texel - range.x) / range.y;                 \n"
                           "   fragData = clamp(fragData, 0.0, 1.0);                   \n"
                           "   fragData *= vColor;                                     \n"
                           "}                                                          \n";
    unk_2EC38 = 3;
    qword_2EC40 = (uint64_t)"#version 300 es                                            \n"
                           "in vec2 inVertex;                                          \n"
                           "in vec2 inTexCoord;                                        \n"
                           "in vec4 inColor;                                           \n"
                           "                                                           \n"
                           "out vec2 vTexCoord;                                        \n"
                           "out vec4 vColor;                                           \n"
                           "                                                           \n"
                           "void main() {                                              \n"
                           "    vTexCoord = inTexCoord;                                \n"
                           "    vColor = inColor;                                      \n"
                           "    gl_Position = vec4(inVertex, 0.0, 1.0);                \n"
                           "}                                                          \n";
    unk_2EC48 = "#version 300 es                                            \n"
                "uniform highp usampler2D tex2D;                            \n"
                "uniform highp vec2 range;                                  \n"
                "in lowp vec2 vTexCoord;                                    \n"
                "in lowp vec4 vColor;                                       \n"
                "                                                           \n"
                "out highp vec4 fragData;                                   \n"
                "                                                           \n"
                "void main() {                                              \n"
                "   highp vec4 texel = vec4(texture(tex2D, vTexCoord));     \n"
                "   fragData = (texel - range.x) / range.y;                 \n"
                "   fragData = clamp(fragData, 0.0, 1.0);                   \n"
                "   fragData *= vColor;                                     \n"
                "}                                                          \n";
    byte_2EC50 = 1;
  }
  uint64_t v12 = OBJC_IVAR___DYGLFunctionPlayer__sharegroup_dict;
  unsigned int v13 = [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__sharegroup_dict] objectForKey:@"tex_blit_ctx"];
  if (!v13)
  {
    id v14 = *(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__ctx];
    id v15 = objc_alloc((Class)EAGLContext);
    id v16 = [v14 API];
    v17 = [v14 sharegroup];
    id v18 = [v15 initWithAPI:v16 sharegroup:v17];

    [*(id *)&self->DYGLFunctionPlayer_opaque[v12] setObject:v18 forKey:@"tex_blit_ctx"];
    id v35 = v18;
    sub_7E98(&v41, v18);
    unsigned int v51 = &v41;
    unsigned int v52 = *(void (***)(void, void))&v45[4];
    uint64_t v19 = (char *)[v14 API];
    id v20 = v51[2];
    if (v19 == (unsigned char *)&dword_0 + 1)
    {
      ((void (**)(id, uint64_t))v52)[72](v20, 3553);
      ((void (**)(id, uint64_t))v52)[73](v51[2], 32884);
      ((void (*)(id, uint64_t, uint64_t, void, void *))v52[334])(v51[2], 2, 5126, 0, &unk_27850);
    }
    else
    {
      ((void (**)(id, void))v52)[512](v20, 0);
      ((void (*)(id, void, uint64_t, uint64_t, void, void, void *))v52[511])(v51[2], 0, 2, 5126, 0, 0, &unk_27850);
      uint64_t v21 = 0;
      unsigned int v22 = &qword_2EC00;
      do
      {
        if ((unint64_t)objc_msgSend(v14, "API", v35) >= *(v22 - 2))
        {
          unsigned int v23 = [(DYEAGLFunctionPlayer *)self _loadSimpleProgramWithVertexSource:*(v22 - 1) fragmentSource:*v22 link:0 dispatcher:&v51];
          ((void (*)(id, void, void, const char *))v52[630])(v51[2], v23, 0, "inVertex");
          ((void (*)(id, void, uint64_t, const char *))v52[630])(v51[2], v23, 1, "inTexCoord");
          ((void (*)(id, void, uint64_t, const char *))v52[630])(v51[2], v23, 2, "inColor");
          [(DYEAGLFunctionPlayer *)self _linkProgram:v23 dispatcher:&v51];
          dword_2EC64[v21] = ((uint64_t (*)(id, void, const char *))v52[625])(v51[2], v23, "range");
          dword_2EC54[v21] = v23;
        }
        ++v21;
        v22 += 3;
      }
      while (v21 != 4);
    }
    ((void (*)(id, uint64_t, uint64_t))v52[7])(v51[2], 1, 771);

    unsigned int v13 = v35;
  }
  sub_7E98(&v51, v13);
  uint64_t v24 = v54;
  objc_super v49 = &v51;
  uint64_t v50 = v54;
  (*(void (**)(uint64_t, uint64_t, void))(v54 + 40))(v53, 3553, 0);
  (*(void (**)(uint64_t, uint64_t, void))(v24 + 40))(v53, 3553, a3);
  (*(void (**)(uint64_t, uint64_t, void))(v24 + 5376))(v53, 36160, 0);
  (*(void (**)(uint64_t, uint64_t, void))(v24 + 5376))(v53, 36160, a5);
  if (a7) {
    (*(void (**)(uint64_t, void))(v24 + 80))(v53, a7);
  }
  if (a10) {
    uint64_t var1 = a6.var1;
  }
  else {
    uint64_t var1 = a6.var0;
  }
  if (a10) {
    uint64_t var0 = a6.var0;
  }
  else {
    uint64_t var0 = a6.var1;
  }
  if (a10) {
    uint64_t var3 = a6.var3;
  }
  else {
    uint64_t var3 = a6.var2;
  }
  if (a10) {
    uint64_t var2 = a6.var2;
  }
  else {
    uint64_t var2 = a6.var3;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v24 + 2680))(v53, var1, var0, var3, var2);
  if (a9) {
    __n128 v29 = ((__n128 (*)(uint64_t, uint64_t))*(void *)(v24 + 576))(v53, 3042);
  }
  float v55 = (float)HIBYTE(a8) / 255.0;
  v29.n128_u64[0] = (unint64_t)vdiv_f32(vcvt_f32_u32((uint32x2_t)vand_s8((int8x8_t)vshl_u32((uint32x2_t)vdup_n_s32(a8), (uint32x2_t)0xFFFFFFF8FFFFFFF0), (int8x8_t)0xFF000000FFLL)), (float32x2_t)vdup_n_s32(0x437F0000u));
  __n128 v40 = v29;
  unint64_t v56 = v29.n128_u64[0];
  float v57 = (float)a8 / 255.0;
  if (a10) {
    uint64_t v30 = &unk_27890;
  }
  else {
    uint64_t v30 = &unk_27870;
  }
  unsigned int v31 = &v53;
  if (objc_msgSend(v13, "API", v35) == (char *)&dword_0 + 1)
  {
    (*(void (**)(uint64_t, float, __n128, float, float))(v24 + 296))(v53, (float)HIBYTE(a8) / 255.0, v40, v40.n128_f32[1], (float)a8 / 255.0);
    (*(void (**)(uint64_t, uint64_t))(v24 + 584))(v53, 32888);
    (*(void (**)(uint64_t, uint64_t, uint64_t, void, void *))(v24 + 2312))(v53, 2, 5126, 0, v30);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t, float *))(v24 + 4024))(v53, 2, &v55);
    (*(void (**)(uint64_t, uint64_t))(v24 + 4096))(v53, 1);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, void, void, void *))(v24 + 4088))(v53, 1, 2, 5126, 0, 0, v30);
    (*(void (**)(uint64_t, void))(v24 + 4800))(v53, dword_2EC54[a11]);
    if ((a11 & 0xFFFFFFFE) == 2)
    {
      double v47 = 0.0;
      double v48 = 0.0;
      int v46 = 0;
      (*(void (**)(uint64_t, uint64_t, void, uint64_t, int *))(v24 + 1000))(v53, 3553, 0, 4099, &v46);
      id v41 = 0;
      id v42 = 0;
      int v44 = 0;
      v43 = 0;
      *(_OWORD *)uint64_t v45 = 0x100000001uLL;
      *(void *)&v45[13] = 0;
      GPUTools::GL::GetImageInfo();
      GPUTools::GL::RangeForUnpackedType((GPUTools::GL *)HIDWORD(v43), &v48, &v47, v32);
      float v33 = v48;
      float v34 = v47 - v48;
      (*(void (**)(id *, void, float, float))(v50 + 4824))(v49[2], dword_2EC64[a11], v33, v34);
      uint64_t v24 = v50;
      unsigned int v31 = (uint64_t *)(v49 + 2);
    }
  }
  (*(void (**)(uint64_t, uint64_t, void, uint64_t))(v24 + 520))(*v31, 5, 0, 4);
  if (a9) {
    (*(void (**)(id *, uint64_t))(v50 + 504))(v49[2], 3042);
  }
  (*(void (**)(id *))(v50 + 712))(v49[2]);
}

- (void)_transformCoreAnimationLayer:(id)a3 rotated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [*(id *)&self->DYGLFunctionPlayer_opaque[OBJC_IVAR___DYGLFunctionPlayer__captureSessionInfo] deviceInfo];
  uint64_t v8 = v7;
  double v19 = 0.0;
  uint64_t v20 = 0;
  uint64_t v21 = 0;
  if (v7)
  {
    [v7 mainScreenDescriptor];
    CGFloat v9 = v19;
  }
  else
  {
    CGFloat v9 = 0.0;
  }
  long long v10 = *(_OWORD *)&CGAffineTransformIdentity.c;
  *(_OWORD *)&v18.a = *(_OWORD *)&CGAffineTransformIdentity.a;
  *(_OWORD *)&v18.c = v10;
  *(_OWORD *)&v18.tx = *(_OWORD *)&CGAffineTransformIdentity.tx;
  *(_OWORD *)&v17.a = *(_OWORD *)&v18.a;
  *(_OWORD *)&v17.c = v10;
  *(_OWORD *)&v17.tx = *(_OWORD *)&v18.tx;
  CGAffineTransformRotate(&v18, &v17, v9);
  CGAffineTransform v16 = v18;
  CGAffineTransformScale(&v22, &v16, 1.0, -1.0);
  CGAffineTransform v18 = v22;
  if (v4)
  {
    CGAffineTransform v15 = v18;
    CGAffineTransformScale(&v22, &v15, -1.0, -1.0);
    CGAffineTransform v18 = v22;
  }
  unsigned int v12 = HIDWORD(v20);
  unsigned int v11 = v21;
  unsigned int v13 = v20;
  sub_DDB4((uint64_t)&v22, 1, 1);
  CGAffineTransform v14 = v18;
  [v6 setAffineTransform:&v14];
  [v6 setFrame:0.0, 0.0, (double)(v13 / v11), (double)(v12 / v11)];
  sub_DE80((uint64_t)&v22);
}

- (DYLayerManager)layerManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_layerManager);

  return (DYLayerManager *)WeakRetained;
}

- (void)setLayerManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_layerManager);

  sub_8014((uint64_t)&self->_ioSurfaceDrawableIdSet);
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 1112) = 0u;
  *(_OWORD *)((char *)self + 1128) = 0u;
  *((_DWORD *)self + 286) = 1065353216;
  return self;
}

@end